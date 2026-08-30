#include <CommonCrypto/CommonDigest.h>

#include <algorithm>
#include <array>
#include <cassert>
#include <cstdint>
#include <cstdlib>
#include <fstream>
#include <functional>
#include <iomanip>
#include <iostream>
#include <limits>
#include <numeric>
#include <queue>
#include <sstream>
#include <stdexcept>
#include <string>
#include <string_view>
#include <utility>
#include <vector>

namespace {

class BigUInt {
 public:
  BigUInt(std::uint64_t value = 0) {
    while (value) {
      limbs_.push_back(static_cast<std::uint32_t>(value % kBase));
      value /= kBase;
    }
  }

  std::string str() const {
    if (limbs_.empty()) return "0";
    std::ostringstream out;
    out << limbs_.back();
    for (std::size_t i = limbs_.size() - 1; i-- > 0;)
      out << std::setw(9) << std::setfill('0') << limbs_[i];
    return out.str();
  }

  BigUInt &operator+=(const BigUInt &other) {
    const std::size_t size = std::max(limbs_.size(), other.limbs_.size());
    limbs_.resize(size, 0);
    std::uint64_t carry = 0;
    for (std::size_t i = 0; i < size; ++i) {
      std::uint64_t value = carry + limbs_[i];
      if (i < other.limbs_.size()) value += other.limbs_[i];
      limbs_[i] = static_cast<std::uint32_t>(value % kBase);
      carry = value / kBase;
    }
    if (carry) limbs_.push_back(static_cast<std::uint32_t>(carry));
    return *this;
  }

  BigUInt &operator*=(const BigUInt &other) {
    if (limbs_.empty() || other.limbs_.empty()) {
      limbs_.clear();
      return *this;
    }
    std::vector<std::uint32_t> result(limbs_.size() + other.limbs_.size(), 0);
    for (std::size_t i = 0; i < limbs_.size(); ++i) {
      std::uint64_t carry = 0;
      for (std::size_t j = 0; j < other.limbs_.size(); ++j) {
        unsigned __int128 value = static_cast<unsigned __int128>(limbs_[i]) * other.limbs_[j]
                                + result[i + j] + carry;
        result[i + j] = static_cast<std::uint32_t>(value % kBase);
        carry = static_cast<std::uint64_t>(value / kBase);
      }
      std::size_t pos = i + other.limbs_.size();
      while (carry) {
        unsigned __int128 value = static_cast<unsigned __int128>(result[pos]) + carry;
        result[pos] = static_cast<std::uint32_t>(value % kBase);
        carry = static_cast<std::uint64_t>(value / kBase);
        ++pos;
        if (pos == result.size() && carry) result.push_back(0);
      }
    }
    limbs_.swap(result);
    trim();
    return *this;
  }

  std::uint64_t mod(std::uint64_t divisor) const {
    if (divisor == 0) throw std::runtime_error("BigUInt division by zero");
    unsigned __int128 remainder = 0;
    for (std::size_t i = limbs_.size(); i-- > 0;)
      remainder = (remainder * kBase + limbs_[i]) % divisor;
    return static_cast<std::uint64_t>(remainder);
  }

  BigUInt divided_by(std::uint64_t divisor) const {
    if (divisor == 0) throw std::runtime_error("BigUInt division by zero");
    BigUInt quotient;
    quotient.limbs_.resize(limbs_.size(), 0);
    unsigned __int128 remainder = 0;
    for (std::size_t i = limbs_.size(); i-- > 0;) {
      unsigned __int128 value = remainder * kBase + limbs_[i];
      quotient.limbs_[i] = static_cast<std::uint32_t>(value / divisor);
      remainder = value % divisor;
    }
    quotient.trim();
    return quotient;
  }

  friend bool operator==(const BigUInt &a, const BigUInt &b) { return a.limbs_ == b.limbs_; }
  friend bool operator!=(const BigUInt &a, const BigUInt &b) { return !(a == b); }
  friend bool operator<(const BigUInt &a, const BigUInt &b) {
    if (a.limbs_.size() != b.limbs_.size()) return a.limbs_.size() < b.limbs_.size();
    for (std::size_t i = a.limbs_.size(); i-- > 0;) {
      if (a.limbs_[i] != b.limbs_[i]) return a.limbs_[i] < b.limbs_[i];
    }
    return false;
  }
  friend bool operator>(const BigUInt &a, const BigUInt &b) { return b < a; }
  friend bool operator<=(const BigUInt &a, const BigUInt &b) { return !(b < a); }
  friend bool operator>=(const BigUInt &a, const BigUInt &b) { return !(a < b); }
  friend BigUInt operator+(BigUInt a, const BigUInt &b) { return a += b; }
  friend BigUInt operator*(BigUInt a, const BigUInt &b) { return a *= b; }
  friend std::ostream &operator<<(std::ostream &out, const BigUInt &value) {
    return out << value.str();
  }

 private:
  static constexpr std::uint64_t kBase = 1000000000ULL;
  std::vector<std::uint32_t> limbs_;

  void trim() {
    while (!limbs_.empty() && limbs_.back() == 0) limbs_.pop_back();
  }
};

struct RootInfo {
  std::string code;
  std::uint64_t aut = 1;
  std::uint8_t height = 0;
};

struct FreeInfo {
  std::string code;
  std::uint64_t aut = 1;
  bool one_center = true;
  bool equal_halves = false;
};

struct ParsedRoot {
  int root = -1;
  int height = 0;
  std::string_view exact;
};

struct ParsedTree {
  std::vector<std::vector<int>> adj;
  std::vector<int> centers;
  bool two_center = false;
  int left_root = -1;
  int right_root = -1;
};

struct Recovery {
  bool found = false;
  int p = -1;
  int q = -1;
};

struct OrderSummary {
  int n = 0;
  std::uint64_t row_count = 0;
  std::uint64_t one_center_count = 0;
  std::uint64_t two_center_count = 0;
  std::uint64_t repeated_child_rows = 0;
  std::uint64_t equal_half_rows = 0;
  std::uint64_t unequal_half_rows = 0;
  std::uint64_t zero_tail_rows = 0;
  std::uint64_t recovery_rows = 0;
  std::uint64_t no_recovery_rows = 0;
  BigUInt mass_sum = 0;
  BigUInt expected_mass = 0;
  std::string first_recovery_code;
  std::string first_recovery_adjacency;
  std::string first_recovery_coefficients;
  std::string first_recovery_adj_sha;
  std::string first_recovery_coeff_sha;
  std::string first_recovery_row_sha;
  std::uint64_t first_recovery_aut = 0;
  BigUInt first_recovery_orbit = 0;
  int first_recovery_p = -1;
  int first_recovery_q = -1;
};

[[noreturn]] void fail(const std::string &message) {
  throw std::runtime_error(message);
}

BigUInt ipow(BigUInt base, int exponent) {
  BigUInt result = 1;
  while (exponent > 0) {
    if (exponent & 1) result *= base;
    exponent >>= 1;
    if (exponent) base *= base;
  }
  return result;
}

std::uint64_t factorial_u64(int n) {
  unsigned __int128 value = 1;
  for (int k = 2; k <= n; ++k) value *= static_cast<unsigned>(k);
  if (value > std::numeric_limits<std::uint64_t>::max()) fail("factorial overflow");
  return static_cast<std::uint64_t>(value);
}

BigUInt factorial_big(int n) {
  BigUInt value = 1;
  for (int k = 2; k <= n; ++k) value *= BigUInt(k);
  return value;
}

std::string sha256(std::string_view bytes) {
  std::array<unsigned char, CC_SHA256_DIGEST_LENGTH> digest{};
  CC_SHA256(bytes.data(), static_cast<CC_LONG>(bytes.size()), digest.data());
  static constexpr char hex[] = "0123456789abcdef";
  std::string result;
  result.resize(digest.size() * 2);
  for (std::size_t i = 0; i < digest.size(); ++i) {
    result[2 * i] = hex[digest[i] >> 4];
    result[2 * i + 1] = hex[digest[i] & 15];
  }
  return result;
}

std::uint64_t rooted_count_formula(int n, const std::vector<std::uint64_t> &counts) {
  if (n == 1) return 1;
  unsigned __int128 numerator = 0;
  for (int k = 1; k < n; ++k) {
    unsigned __int128 divisor_sum = 0;
    for (int d = 1; d <= k; ++d) {
      if (k % d == 0) divisor_sum += static_cast<unsigned __int128>(d) * counts[d];
    }
    numerator += divisor_sum * counts[n - k];
  }
  if (numerator % static_cast<unsigned>(n - 1) != 0) fail("rooted count recurrence not integral");
  numerator /= static_cast<unsigned>(n - 1);
  if (numerator > std::numeric_limits<std::uint64_t>::max()) fail("rooted count overflow");
  return static_cast<std::uint64_t>(numerator);
}

std::uint64_t checked_root_aut(const std::vector<const RootInfo *> &children) {
  unsigned __int128 result = 1;
  std::size_t i = 0;
  while (i < children.size()) {
    std::size_t j = i + 1;
    while (j < children.size() && children[j]->code == children[i]->code) ++j;
    for (std::size_t k = i; k < j; ++k) result *= children[k]->aut;
    result *= factorial_u64(static_cast<int>(j - i));
    if (result > std::numeric_limits<std::uint64_t>::max()) fail("root automorphism overflow");
    i = j;
  }
  return static_cast<std::uint64_t>(result);
}

bool root_is_unique_center(const std::vector<const RootInfo *> &children) {
  if (children.empty()) return true;
  int max_height = -1;
  int multiplicity = 0;
  for (const RootInfo *child : children) {
    if (child->height > max_height) {
      max_height = child->height;
      multiplicity = 1;
    } else if (child->height == max_height) {
      ++multiplicity;
    }
  }
  return multiplicity >= 2;
}

ParsedRoot parse_rooted(std::string_view text, std::size_t &pos,
                        std::vector<std::vector<int>> &adj) {
  const std::size_t start = pos;
  if (pos >= text.size() || text[pos] != '(') fail("rooted parser expected '('");
  ++pos;
  const int root = static_cast<int>(adj.size());
  adj.emplace_back();
  int height = 0;
  std::string_view previous;
  bool have_previous = false;
  while (pos < text.size() && text[pos] == '(') {
    ParsedRoot child = parse_rooted(text, pos, adj);
    if (have_previous && previous > child.exact) fail("decreasing rooted child sequence");
    previous = child.exact;
    have_previous = true;
    adj[root].push_back(child.root);
    adj[child.root].push_back(root);
    height = std::max(height, child.height + 1);
  }
  if (pos >= text.size() || text[pos] != ')') fail("rooted parser expected ')'");
  ++pos;
  return ParsedRoot{root, height, text.substr(start, pos - start)};
}

std::vector<int> distances(const std::vector<std::vector<int>> &adj, int start) {
  std::vector<int> dist(adj.size(), -1);
  std::queue<int> todo;
  dist[start] = 0;
  todo.push(start);
  while (!todo.empty()) {
    int v = todo.front();
    todo.pop();
    for (int u : adj[v]) {
      if (dist[u] == -1) {
        dist[u] = dist[v] + 1;
        todo.push(u);
      }
    }
  }
  return dist;
}

std::vector<int> tree_centers(const std::vector<std::vector<int>> &adj) {
  if (adj.empty()) fail("empty graph");
  std::size_t degree_sum = 0;
  for (const auto &neighbors : adj) degree_sum += neighbors.size();
  if (degree_sum != 2 * (adj.size() - 1)) fail("parsed graph edge count is not n-1");
  auto d0 = distances(adj, 0);
  if (std::find(d0.begin(), d0.end(), -1) != d0.end()) fail("parsed graph disconnected");
  int a = static_cast<int>(std::max_element(d0.begin(), d0.end()) - d0.begin());
  auto da = distances(adj, a);
  int b = static_cast<int>(std::max_element(da.begin(), da.end()) - da.begin());
  auto db = distances(adj, b);
  int minimum = std::numeric_limits<int>::max();
  std::vector<int> centers;
  for (std::size_t v = 0; v < adj.size(); ++v) {
    int eccentricity = std::max(da[v], db[v]);
    if (eccentricity < minimum) {
      minimum = eccentricity;
      centers.assign(1, static_cast<int>(v));
    } else if (eccentricity == minimum) {
      centers.push_back(static_cast<int>(v));
    }
  }
  return centers;
}

ParsedTree parse_unrooted(const std::string &code) {
  ParsedTree tree;
  if (code.empty()) fail("empty unrooted code");
  if (code.front() == '[') {
    if (code.size() < 5 || code.back() != ']') fail("bad two-center wrapper");
    const std::size_t bar = code.find('|');
    if (bar == std::string::npos || code.find('|', bar + 1) != std::string::npos)
      fail("two-center code requires exactly one separator");
    std::string_view left(code.data() + 1, bar - 1);
    std::string_view right(code.data() + bar + 1, code.size() - bar - 2);
    if (left.empty() || right.empty() || left > right) fail("illegal two-center halves");
    std::size_t lp = 0;
    ParsedRoot a = parse_rooted(left, lp, tree.adj);
    if (lp != left.size()) fail("trailing byte in left rooted half");
    std::size_t rp = 0;
    ParsedRoot b = parse_rooted(right, rp, tree.adj);
    if (rp != right.size()) fail("trailing byte in right rooted half");
    if (a.height != b.height) fail("unequal two-center heights");
    tree.adj[a.root].push_back(b.root);
    tree.adj[b.root].push_back(a.root);
    for (auto &neighbors : tree.adj) std::sort(neighbors.begin(), neighbors.end());
    tree.centers = tree_centers(tree.adj);
    std::vector<int> expected{a.root, b.root};
    std::sort(expected.begin(), expected.end());
    if (tree.centers != expected) fail("joined graph center mismatch");
    tree.two_center = true;
    tree.left_root = a.root;
    tree.right_root = b.root;
  } else {
    std::size_t pos = 0;
    ParsedRoot root = parse_rooted(code, pos, tree.adj);
    if (pos != code.size()) fail("trailing byte in one-center code");
    for (auto &neighbors : tree.adj) std::sort(neighbors.begin(), neighbors.end());
    tree.centers = tree_centers(tree.adj);
    if (root.root != 0 || tree.centers != std::vector<int>{0}) fail("one-center mismatch");
    tree.left_root = 0;
  }
  return tree;
}

std::pair<std::string, std::uint64_t> encode_root_aut(
    const std::vector<std::vector<int>> &adj, int v, int parent) {
  std::vector<std::pair<std::string, std::uint64_t>> children;
  for (int u : adj[v]) {
    if (u != parent) children.push_back(encode_root_aut(adj, u, v));
  }
  std::sort(children.begin(), children.end(), [](const auto &x, const auto &y) {
    return x.first < y.first;
  });
  std::string code = "(";
  unsigned __int128 aut = 1;
  std::size_t i = 0;
  while (i < children.size()) {
    std::size_t j = i + 1;
    while (j < children.size() && children[j].first == children[i].first) ++j;
    for (std::size_t k = i; k < j; ++k) {
      code += children[k].first;
      aut *= children[k].second;
    }
    aut *= factorial_u64(static_cast<int>(j - i));
    if (aut > std::numeric_limits<std::uint64_t>::max()) fail("encoded aut overflow");
    i = j;
  }
  code += ')';
  return {std::move(code), static_cast<std::uint64_t>(aut)};
}

std::pair<std::string, std::uint64_t> recode_aut(const ParsedTree &tree) {
  if (tree.centers.size() == 1) {
    return encode_root_aut(tree.adj, tree.centers[0], -1);
  }
  if (tree.centers.size() != 2) fail("tree does not have one or two centers");
  int a = tree.centers[0];
  int b = tree.centers[1];
  auto left = encode_root_aut(tree.adj, a, b);
  auto right = encode_root_aut(tree.adj, b, a);
  std::string code;
  if (left.first <= right.first) code = '[' + left.first + '|' + right.first + ']';
  else code = '[' + right.first + '|' + left.first + ']';
  unsigned __int128 aut = static_cast<unsigned __int128>(left.second) * right.second;
  if (left.first == right.first) aut *= 2;
  if (aut > std::numeric_limits<std::uint64_t>::max()) fail("unrooted aut overflow");
  return {std::move(code), static_cast<std::uint64_t>(aut)};
}

std::vector<BigUInt> multiply(const std::vector<BigUInt> &a,
                              const std::vector<BigUInt> &b, int limit) {
  std::vector<BigUInt> result(std::min<int>(limit + 1, a.size() + b.size() - 1));
  for (std::size_t i = 0; i < a.size(); ++i) {
    for (std::size_t j = 0; j < b.size() && static_cast<int>(i + j) <= limit; ++j) {
      result[i + j] += a[i] * b[j];
    }
  }
  return result;
}

std::pair<std::vector<BigUInt>, std::vector<BigUInt>> dp_node(
    const std::vector<std::vector<int>> &adj, int v, int parent, int n) {
  std::vector<BigUInt> excluded{1};
  std::vector<BigUInt> included{0, 1};
  for (int u : adj[v]) {
    if (u == parent) continue;
    auto child = dp_node(adj, u, v, n);
    std::vector<BigUInt> child_total(std::max(child.first.size(), child.second.size()));
    for (std::size_t k = 0; k < child_total.size(); ++k) {
      if (k < child.first.size()) child_total[k] += child.first[k];
      if (k < child.second.size()) child_total[k] += child.second[k];
    }
    excluded = multiply(excluded, child_total, n);
    included = multiply(included, child.first, n);
  }
  return {std::move(excluded), std::move(included)};
}

std::vector<BigUInt> independence_coefficients(const ParsedTree &tree) {
  const int n = static_cast<int>(tree.adj.size());
  auto pair = dp_node(tree.adj, 0, -1, n);
  std::vector<BigUInt> coefficients(n + 1);
  for (int r = 0; r <= n; ++r) {
    if (r < static_cast<int>(pair.first.size())) coefficients[r] += pair.first[r];
    if (r < static_cast<int>(pair.second.size())) coefficients[r] += pair.second[r];
  }
  return coefficients;
}

Recovery recovery(const std::vector<BigUInt> &coefficients) {
  const int n = static_cast<int>(coefficients.size()) - 1;
  for (int q = 1; q <= n; ++q) {
    const BigUInt next_q = (q + 1 <= n) ? coefficients[q + 1] : BigUInt(0);
    if (next_q <= coefficients[q]) continue;
    for (int p = 0; p < q; ++p) {
      if (coefficients[p + 1] >= coefficients[p]) continue;
      bool flat_or_falling = true;
      for (int r = p + 1; r < q; ++r) {
        if (coefficients[r + 1] > coefficients[r]) {
          flat_or_falling = false;
          break;
        }
      }
      if (flat_or_falling) return Recovery{true, p, q};
    }
  }
  return {};
}

std::string coefficients_text(const std::vector<BigUInt> &coefficients) {
  std::ostringstream out;
  for (std::size_t i = 0; i < coefficients.size(); ++i) {
    if (i) out << ',';
    out << coefficients[i];
  }
  return out.str();
}

std::string adjacency_bytes(const ParsedTree &tree) {
  std::ostringstream out;
  for (std::size_t v = 0; v < tree.adj.size(); ++v) {
    out << v << ':';
    for (std::size_t j = 0; j < tree.adj[v].size(); ++j) {
      if (j) out << ',';
      out << tree.adj[v][j];
    }
    out << '\n';
  }
  return out.str();
}

bool has_repeated_child_code(const ParsedTree &tree) {
  std::function<std::pair<std::string, bool>(int, int)> visit =
      [&](int v, int parent) -> std::pair<std::string, bool> {
    std::vector<std::string> child_codes;
    bool repeated_below = false;
    for (int u : tree.adj[v]) {
      if (u == parent) continue;
      auto child = visit(u, v);
      child_codes.push_back(std::move(child.first));
      repeated_below = repeated_below || child.second;
    }
    std::sort(child_codes.begin(), child_codes.end());
    bool repeated_here = false;
    for (std::size_t i = 1; i < child_codes.size(); ++i) {
      if (child_codes[i] == child_codes[i - 1]) repeated_here = true;
    }
    std::string code = "(";
    for (const auto &child : child_codes) code += child;
    code += ')';
    return {std::move(code), repeated_below || repeated_here};
  };
  if (tree.centers.size() == 1) return visit(tree.centers[0], -1).second;
  return visit(tree.centers[0], tree.centers[1]).second ||
         visit(tree.centers[1], tree.centers[0]).second;
}

std::string row_payload(int n, const std::string &code, const std::string &adj_hash,
                        std::uint64_t aut, const BigUInt &orbit,
                        const std::string &coeff_text, const std::string &coeff_hash,
                        const Recovery &rec) {
  const char unit_separator = 0x1f;
  std::ostringstream out;
  out << n << unit_separator << code << unit_separator << adj_hash << unit_separator
      << aut << unit_separator << orbit << unit_separator << coeff_text << unit_separator
      << coeff_hash << unit_separator << (rec.found ? "RECOVERY" : "NO_RECOVERY")
      << unit_separator << (rec.found ? std::to_string(rec.p) : "null")
      << unit_separator << (rec.found ? std::to_string(rec.q) : "null") << '\n';
  return out.str();
}

void generate_rooted_catalogs(std::vector<std::vector<RootInfo>> &catalogs,
                              std::vector<std::vector<FreeInfo>> &free_by_order) {
  constexpr int max_n = 21;
  std::vector<std::uint64_t> counts(max_n + 1, 0);
  counts[1] = 1;
  catalogs[1].push_back(RootInfo{"()", 1, 0});
  std::vector<const RootInfo *> global{&catalogs[1][0]};

  for (int n = 2; n <= max_n; ++n) {
    const std::uint64_t expected = rooted_count_formula(n, counts);
    counts[n] = expected;
    catalogs[n].reserve(expected);

    std::vector<std::vector<std::uint32_t>> allowed(n);
    if (global.size() > std::numeric_limits<std::uint32_t>::max())
      fail("global rooted catalog rank overflow");
    for (std::uint32_t rank = 0; rank < global.size(); ++rank) {
      int size = static_cast<int>(global[rank]->code.size() / 2);
      for (int remaining = size; remaining < n; ++remaining) {
        allowed[remaining].push_back(rank);
      }
    }

    std::string current = "(";
    current.reserve(2 * n);
    std::vector<const RootInfo *> children;
    children.reserve(n - 1);
    std::uint64_t emitted = 0;

    std::function<void(int, std::uint32_t)> enumerate =
        [&](int remaining, std::uint32_t minimum_rank) {
      if (remaining == 0) {
        current.push_back(')');
        int height = 0;
        for (const RootInfo *child : children)
          height = std::max(height, static_cast<int>(child->height) + 1);
        const std::uint64_t aut = checked_root_aut(children);
        catalogs[n].push_back(RootInfo{current, aut, static_cast<std::uint8_t>(height)});
        if ((n == 20 || n == 21) && root_is_unique_center(children)) {
          free_by_order[n].push_back(FreeInfo{current, aut, true, false});
        }
        current.pop_back();
        ++emitted;
        if (emitted % 1000000 == 0)
          std::cerr << "rooted_progress n=" << n << " emitted=" << emitted << '\n';
        return;
      }
      const auto &ranks = allowed[remaining];
      auto it = std::lower_bound(ranks.begin(), ranks.end(), minimum_rank);
      for (; it != ranks.end(); ++it) {
        const std::uint32_t rank = *it;
        const RootInfo *child = global[rank];
        const int child_size = static_cast<int>(child->code.size() / 2);
        current += child->code;
        children.push_back(child);
        enumerate(remaining - child_size, rank);
        children.pop_back();
        current.resize(current.size() - child->code.size());
      }
    };
    enumerate(n - 1, 0);

    if (catalogs[n].size() != expected) fail("rooted catalog count mismatch at n=" + std::to_string(n));
    for (std::size_t i = 1; i < catalogs[n].size(); ++i) {
      if (!(catalogs[n][i - 1].code < catalogs[n][i].code))
        fail("rooted catalog not strictly lexicographic at n=" + std::to_string(n));
    }
    std::cerr << "rooted_complete n=" << n << " rows=" << catalogs[n].size()
              << " one_center=" << free_by_order[n].size() << '\n';

    if (n < max_n) {
      std::vector<const RootInfo *> added;
      added.reserve(catalogs[n].size());
      for (const RootInfo &entry : catalogs[n]) added.push_back(&entry);
      std::vector<const RootInfo *> merged;
      merged.reserve(global.size() + added.size());
      std::merge(global.begin(), global.end(), added.begin(), added.end(),
                 std::back_inserter(merged), [](const RootInfo *x, const RootInfo *y) {
                   return x->code < y->code;
                 });
      global.swap(merged);
    }
  }
}

void add_two_center_codes(int n, const std::vector<std::vector<RootInfo>> &catalogs,
                          std::vector<FreeInfo> &free_codes) {
  for (int a_size = 1; a_size <= n / 2; ++a_size) {
    const int b_size = n - a_size;
    const auto &a_catalog = catalogs[a_size];
    const auto &b_catalog = catalogs[b_size];
    std::array<std::vector<const RootInfo *>, 22> a_by_height;
    std::array<std::vector<const RootInfo *>, 22> b_by_height;
    for (const RootInfo &entry : a_catalog) a_by_height[entry.height].push_back(&entry);
    for (const RootInfo &entry : b_catalog) b_by_height[entry.height].push_back(&entry);
    for (int height = 0; height < 22; ++height) {
      const auto &as = a_by_height[height];
      const auto &bs = b_by_height[height];
      if (a_size < b_size) {
        for (const RootInfo *a : as) {
          for (const RootInfo *b : bs) {
            unsigned __int128 aut = static_cast<unsigned __int128>(a->aut) * b->aut;
            if (aut > std::numeric_limits<std::uint64_t>::max()) fail("two-center aut overflow");
            std::string code;
            if (a->code <= b->code) code = '[' + a->code + '|' + b->code + ']';
            else code = '[' + b->code + '|' + a->code + ']';
            free_codes.push_back(FreeInfo{std::move(code), static_cast<std::uint64_t>(aut),
                                          false, false});
          }
        }
      } else {
        for (std::size_t i = 0; i < as.size(); ++i) {
          for (std::size_t j = i; j < as.size(); ++j) {
            unsigned __int128 aut = static_cast<unsigned __int128>(as[i]->aut) * as[j]->aut;
            const bool equal = as[i]->code == as[j]->code;
            if (equal) aut *= 2;
            if (aut > std::numeric_limits<std::uint64_t>::max()) fail("symmetric aut overflow");
            std::string code = '[' + as[i]->code + '|' + as[j]->code + ']';
            free_codes.push_back(FreeInfo{std::move(code), static_cast<std::uint64_t>(aut),
                                          false, equal});
          }
        }
      }
    }
  }
}

OrderSummary write_certificate(int n, std::vector<FreeInfo> &free_codes,
                               const std::string &path) {
  std::sort(free_codes.begin(), free_codes.end(), [](const FreeInfo &x, const FreeInfo &y) {
    return x.code < y.code;
  });
  for (std::size_t i = 1; i < free_codes.size(); ++i) {
    if (!(free_codes[i - 1].code < free_codes[i].code)) fail("duplicate unrooted code");
  }

  std::ofstream out(path, std::ios::binary);
  if (!out) fail("cannot open certificate output: " + path);
  out << "n,code,adjacency_sha256,aut_order,orbit_mass,coefficients,coefficients_sha256,"
         "recovery_state,p_or_null,q_or_null,row_sha256\n";

  OrderSummary summary;
  summary.n = n;
  summary.row_count = free_codes.size();
  summary.expected_mass = ipow(BigUInt(n), n - 2);
  const BigUInt n_factorial = factorial_big(n);

  for (std::size_t index = 0; index < free_codes.size(); ++index) {
    const FreeInfo &entry = free_codes[index];
    ParsedTree tree = parse_unrooted(entry.code);
    if (static_cast<int>(tree.adj.size()) != n) fail("parsed order mismatch");
    auto recoded = recode_aut(tree);
    if (recoded.first != entry.code) fail("parse/recode mismatch");
    if (recoded.second != entry.aut) fail("automorphism mismatch before row write");

    const std::string adjacency = adjacency_bytes(tree);
    const std::string adjacency_hash = sha256(adjacency);
    const std::vector<BigUInt> coefficients = independence_coefficients(tree);
    const std::string coefficient_text = coefficients_text(coefficients);
    const std::string coefficient_hash = sha256(coefficient_text + '\n');
    const Recovery rec = recovery(coefficients);
    if (n_factorial.mod(entry.aut) != 0) fail("orbit mass is not integral");
    const BigUInt orbit = n_factorial.divided_by(entry.aut);
    summary.mass_sum += orbit;

    const std::string payload = row_payload(n, entry.code, adjacency_hash, entry.aut, orbit,
                                            coefficient_text, coefficient_hash, rec);
    const std::string row_hash = sha256(payload);

    out << n << ',' << entry.code << ',' << adjacency_hash << ',' << entry.aut << ','
        << orbit << ",\"" << coefficient_text << "\"," << coefficient_hash << ','
        << (rec.found ? "RECOVERY" : "NO_RECOVERY") << ','
        << (rec.found ? std::to_string(rec.p) : "null") << ','
        << (rec.found ? std::to_string(rec.q) : "null") << ',' << row_hash << '\n';

    if (entry.one_center) ++summary.one_center_count;
    else {
      ++summary.two_center_count;
      if (entry.equal_halves) ++summary.equal_half_rows;
      else ++summary.unequal_half_rows;
    }
    if (has_repeated_child_code(tree)) ++summary.repeated_child_rows;
    if (coefficients.back() == 0) ++summary.zero_tail_rows;
    if (rec.found) {
      ++summary.recovery_rows;
      if (summary.first_recovery_code.empty()) {
        summary.first_recovery_code = entry.code;
        summary.first_recovery_adjacency = adjacency;
        summary.first_recovery_coefficients = coefficient_text;
        summary.first_recovery_adj_sha = adjacency_hash;
        summary.first_recovery_coeff_sha = coefficient_hash;
        summary.first_recovery_row_sha = row_hash;
        summary.first_recovery_aut = entry.aut;
        summary.first_recovery_orbit = orbit;
        summary.first_recovery_p = rec.p;
        summary.first_recovery_q = rec.q;
      }
    } else {
      ++summary.no_recovery_rows;
    }
    if ((index + 1) % 100000 == 0)
      std::cerr << "certificate_progress n=" << n << " rows=" << (index + 1) << '\n';
  }
  out.close();
  if (!out) fail("certificate write failure: " + path);
  if (summary.mass_sum != summary.expected_mass) fail("Cayley mass mismatch at n=" + std::to_string(n));
  return summary;
}

void print_summary(const OrderSummary &summary) {
  std::cout << "ORDER_SUMMARY_BEGIN n=" << summary.n << '\n';
  std::cout << "row_count=" << summary.row_count << '\n';
  std::cout << "one_center_count=" << summary.one_center_count << '\n';
  std::cout << "two_center_count=" << summary.two_center_count << '\n';
  std::cout << "repeated_child_rows=" << summary.repeated_child_rows << '\n';
  std::cout << "equal_half_rows=" << summary.equal_half_rows << '\n';
  std::cout << "unequal_half_rows=" << summary.unequal_half_rows << '\n';
  std::cout << "zero_tail_rows=" << summary.zero_tail_rows << '\n';
  std::cout << "recovery_rows=" << summary.recovery_rows << '\n';
  std::cout << "no_recovery_rows=" << summary.no_recovery_rows << '\n';
  std::cout << "mass_sum=" << summary.mass_sum << '\n';
  std::cout << "expected_mass=" << summary.expected_mass << '\n';
  if (summary.first_recovery_code.empty()) {
    std::cout << "overall_state=NO_RECOVERY\n";
    std::cout << "first_recovery_code=null\n";
  } else {
    std::cout << "overall_state=RECOVERY\n";
    std::cout << "first_recovery_code=" << summary.first_recovery_code << '\n';
    std::cout << "first_recovery_aut=" << summary.first_recovery_aut << '\n';
    std::cout << "first_recovery_orbit=" << summary.first_recovery_orbit << '\n';
    std::cout << "first_recovery_coefficients=" << summary.first_recovery_coefficients << '\n';
    std::cout << "first_recovery_adjacency_sha256=" << summary.first_recovery_adj_sha << '\n';
    std::cout << "first_recovery_coefficients_sha256=" << summary.first_recovery_coeff_sha << '\n';
    std::cout << "first_recovery_row_sha256=" << summary.first_recovery_row_sha << '\n';
    std::cout << "first_recovery_p=" << summary.first_recovery_p << '\n';
    std::cout << "first_recovery_q=" << summary.first_recovery_q << '\n';
    std::cout << "FIRST_RECOVERY_ADJACENCY_BEGIN\n";
    std::cout << summary.first_recovery_adjacency;
    std::cout << "FIRST_RECOVERY_ADJACENCY_END\n";
  }
  std::cout << "ORDER_SUMMARY_END n=" << summary.n << '\n';
}

}  // namespace

int main(int argc, char **argv) {
  try {
    if (argc != 2) {
      std::cerr << "usage: generate_certificate OUTPUT_DIRECTORY\n";
      return 2;
    }
    const std::string output_directory = argv[1];
    std::vector<std::vector<RootInfo>> catalogs(22);
    std::vector<std::vector<FreeInfo>> free_by_order(22);
    generate_rooted_catalogs(catalogs, free_by_order);
    add_two_center_codes(20, catalogs, free_by_order[20]);
    add_two_center_codes(21, catalogs, free_by_order[21]);
    OrderSummary summary20 = write_certificate(
        20, free_by_order[20], output_directory + "/order-20.csv");
    OrderSummary summary21 = write_certificate(
        21, free_by_order[21], output_directory + "/order-21.csv");
    print_summary(summary20);
    print_summary(summary21);
    std::cout << "GENERATOR_RESULT=ACCEPT\n";
    return 0;
  } catch (const std::exception &error) {
    std::cerr << "GENERATOR_RESULT=REJECT\n";
    std::cerr << "error=" << error.what() << '\n';
    return 1;
  }
}
