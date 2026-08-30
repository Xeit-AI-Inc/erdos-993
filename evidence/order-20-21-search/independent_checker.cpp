#include <algorithm>
#include <array>
#include <bit>
#include <cstdint>
#include <fstream>
#include <functional>
#include <iomanip>
#include <iostream>
#include <limits>
#include <queue>
#include <sstream>
#include <stdexcept>
#include <string>
#include <string_view>
#include <utility>
#include <vector>

namespace {

class Natural {
 public:
  Natural(std::uint64_t value = 0) {
    do {
      digits_.push_back(static_cast<std::uint32_t>(value % radix));
      value /= radix;
    } while (value);
    normalize();
  }

  static Natural parse(std::string_view text) {
    if (text.empty()) throw std::runtime_error("empty natural number");
    Natural result;
    for (char ch : text) {
      if (ch < '0' || ch > '9') throw std::runtime_error("nondecimal natural number");
      result.multiply_small(10);
      result.add_small(static_cast<unsigned>(ch - '0'));
    }
    return result;
  }

  std::string text() const {
    if (digits_.empty()) return "0";
    std::ostringstream out;
    out << digits_.back();
    for (std::size_t i = digits_.size() - 1; i-- > 0;)
      out << std::setw(9) << std::setfill('0') << digits_[i];
    return out.str();
  }

  Natural &add(const Natural &other) {
    digits_.resize(std::max(digits_.size(), other.digits_.size()), 0);
    std::uint64_t carry = 0;
    for (std::size_t i = 0; i < digits_.size(); ++i) {
      std::uint64_t sum = digits_[i] + carry;
      if (i < other.digits_.size()) sum += other.digits_[i];
      digits_[i] = static_cast<std::uint32_t>(sum % radix);
      carry = sum / radix;
    }
    if (carry) digits_.push_back(static_cast<std::uint32_t>(carry));
    return *this;
  }

  Natural &multiply(const Natural &other) {
    if (digits_.empty() || other.digits_.empty()) {
      digits_.clear();
      return *this;
    }
    std::vector<std::uint32_t> answer(digits_.size() + other.digits_.size(), 0);
    for (std::size_t i = 0; i < digits_.size(); ++i) {
      std::uint64_t carry = 0;
      for (std::size_t j = 0; j < other.digits_.size(); ++j) {
        unsigned __int128 total = static_cast<unsigned __int128>(digits_[i]) * other.digits_[j]
                                + answer[i + j] + carry;
        answer[i + j] = static_cast<std::uint32_t>(total % radix);
        carry = static_cast<std::uint64_t>(total / radix);
      }
      std::size_t k = i + other.digits_.size();
      while (carry) {
        unsigned __int128 total = static_cast<unsigned __int128>(answer[k]) + carry;
        answer[k] = static_cast<std::uint32_t>(total % radix);
        carry = static_cast<std::uint64_t>(total / radix);
        ++k;
        if (k == answer.size() && carry) answer.push_back(0);
      }
    }
    digits_.swap(answer);
    normalize();
    return *this;
  }

  std::uint64_t remainder(std::uint64_t divisor) const {
    if (!divisor) throw std::runtime_error("division by zero");
    unsigned __int128 rem = 0;
    for (std::size_t i = digits_.size(); i-- > 0;)
      rem = (rem * radix + digits_[i]) % divisor;
    return static_cast<std::uint64_t>(rem);
  }

  Natural quotient(std::uint64_t divisor) const {
    if (!divisor) throw std::runtime_error("division by zero");
    Natural answer;
    answer.digits_.assign(digits_.size(), 0);
    unsigned __int128 rem = 0;
    for (std::size_t i = digits_.size(); i-- > 0;) {
      unsigned __int128 value = rem * radix + digits_[i];
      answer.digits_[i] = static_cast<std::uint32_t>(value / divisor);
      rem = value % divisor;
    }
    answer.normalize();
    return answer;
  }

  friend bool operator==(const Natural &a, const Natural &b) { return a.digits_ == b.digits_; }
  friend bool operator!=(const Natural &a, const Natural &b) { return !(a == b); }
  friend bool operator<(const Natural &a, const Natural &b) {
    if (a.digits_.size() != b.digits_.size()) return a.digits_.size() < b.digits_.size();
    for (std::size_t i = a.digits_.size(); i-- > 0;) {
      if (a.digits_[i] != b.digits_[i]) return a.digits_[i] < b.digits_[i];
    }
    return false;
  }
  friend bool operator>(const Natural &a, const Natural &b) { return b < a; }
  friend bool operator<=(const Natural &a, const Natural &b) { return !(b < a); }
  friend bool operator>=(const Natural &a, const Natural &b) { return !(a < b); }
  friend Natural operator+(Natural a, const Natural &b) { return a.add(b); }
  friend Natural operator*(Natural a, const Natural &b) { return a.multiply(b); }
  friend std::ostream &operator<<(std::ostream &out, const Natural &n) { return out << n.text(); }

 private:
  static constexpr std::uint64_t radix = 1000000000ULL;
  std::vector<std::uint32_t> digits_;

  void normalize() {
    while (!digits_.empty() && digits_.back() == 0) digits_.pop_back();
  }
  void multiply_small(unsigned value) {
    std::uint64_t carry = 0;
    for (std::uint32_t &digit : digits_) {
      std::uint64_t product = static_cast<std::uint64_t>(digit) * value + carry;
      digit = static_cast<std::uint32_t>(product % radix);
      carry = product / radix;
    }
    if (carry) digits_.push_back(static_cast<std::uint32_t>(carry));
    normalize();
  }
  void add_small(unsigned value) {
    std::uint64_t carry = value;
    std::size_t i = 0;
    while (carry) {
      if (i == digits_.size()) digits_.push_back(0);
      std::uint64_t sum = digits_[i] + carry;
      digits_[i] = static_cast<std::uint32_t>(sum % radix);
      carry = sum / radix;
      ++i;
    }
  }
};

Natural power(Natural base, int exponent) {
  Natural result(1);
  while (exponent) {
    if (exponent & 1) result.multiply(base);
    exponent >>= 1;
    if (exponent) base.multiply(base);
  }
  return result;
}

Natural factorial(int n) {
  Natural result(1);
  for (int k = 2; k <= n; ++k) result.multiply(Natural(k));
  return result;
}

class Sha256 {
 public:
  static std::string hash(std::string_view input) {
    Sha256 state;
    state.consume(reinterpret_cast<const std::uint8_t *>(input.data()), input.size());
    return state.finish();
  }

 private:
  std::array<std::uint32_t, 8> h_{
      0x6a09e667U, 0xbb67ae85U, 0x3c6ef372U, 0xa54ff53aU,
      0x510e527fU, 0x9b05688cU, 0x1f83d9abU, 0x5be0cd19U};
  std::array<std::uint8_t, 64> buffer_{};
  std::size_t buffered_ = 0;
  std::uint64_t total_ = 0;

  static constexpr std::array<std::uint32_t, 64> k_{
      0x428a2f98U,0x71374491U,0xb5c0fbcfU,0xe9b5dba5U,0x3956c25bU,0x59f111f1U,0x923f82a4U,0xab1c5ed5U,
      0xd807aa98U,0x12835b01U,0x243185beU,0x550c7dc3U,0x72be5d74U,0x80deb1feU,0x9bdc06a7U,0xc19bf174U,
      0xe49b69c1U,0xefbe4786U,0x0fc19dc6U,0x240ca1ccU,0x2de92c6fU,0x4a7484aaU,0x5cb0a9dcU,0x76f988daU,
      0x983e5152U,0xa831c66dU,0xb00327c8U,0xbf597fc7U,0xc6e00bf3U,0xd5a79147U,0x06ca6351U,0x14292967U,
      0x27b70a85U,0x2e1b2138U,0x4d2c6dfcU,0x53380d13U,0x650a7354U,0x766a0abbU,0x81c2c92eU,0x92722c85U,
      0xa2bfe8a1U,0xa81a664bU,0xc24b8b70U,0xc76c51a3U,0xd192e819U,0xd6990624U,0xf40e3585U,0x106aa070U,
      0x19a4c116U,0x1e376c08U,0x2748774cU,0x34b0bcb5U,0x391c0cb3U,0x4ed8aa4aU,0x5b9cca4fU,0x682e6ff3U,
      0x748f82eeU,0x78a5636fU,0x84c87814U,0x8cc70208U,0x90befffaU,0xa4506cebU,0xbef9a3f7U,0xc67178f2U};

  void consume(const std::uint8_t *data, std::size_t size) {
    total_ += size;
    while (size) {
      std::size_t take = std::min(size, buffer_.size() - buffered_);
      std::copy(data, data + take, buffer_.begin() + buffered_);
      buffered_ += take;
      data += take;
      size -= take;
      if (buffered_ == buffer_.size()) {
        compress(buffer_.data());
        buffered_ = 0;
      }
    }
  }

  void compress(const std::uint8_t *block) {
    std::array<std::uint32_t, 64> w{};
    for (int i = 0; i < 16; ++i)
      w[i] = (static_cast<std::uint32_t>(block[4*i]) << 24) |
             (static_cast<std::uint32_t>(block[4*i+1]) << 16) |
             (static_cast<std::uint32_t>(block[4*i+2]) << 8) | block[4*i+3];
    for (int i = 16; i < 64; ++i) {
      std::uint32_t s0 = std::rotr(w[i-15], 7) ^ std::rotr(w[i-15], 18) ^ (w[i-15] >> 3);
      std::uint32_t s1 = std::rotr(w[i-2], 17) ^ std::rotr(w[i-2], 19) ^ (w[i-2] >> 10);
      w[i] = w[i-16] + s0 + w[i-7] + s1;
    }
    auto [a,b,c,d,e,f,g,h] = h_;
    for (int i = 0; i < 64; ++i) {
      std::uint32_t s1 = std::rotr(e,6) ^ std::rotr(e,11) ^ std::rotr(e,25);
      std::uint32_t choice = (e & f) ^ ((~e) & g);
      std::uint32_t t1 = h + s1 + choice + k_[i] + w[i];
      std::uint32_t s0 = std::rotr(a,2) ^ std::rotr(a,13) ^ std::rotr(a,22);
      std::uint32_t majority = (a & b) ^ (a & c) ^ (b & c);
      std::uint32_t t2 = s0 + majority;
      h=g; g=f; f=e; e=d+t1; d=c; c=b; b=a; a=t1+t2;
    }
    h_[0]+=a; h_[1]+=b; h_[2]+=c; h_[3]+=d;
    h_[4]+=e; h_[5]+=f; h_[6]+=g; h_[7]+=h;
  }

  std::string finish() {
    const std::uint64_t bit_length = total_ * 8;
    buffer_[buffered_++] = 0x80;
    if (buffered_ > 56) {
      std::fill(buffer_.begin() + buffered_, buffer_.end(), 0);
      compress(buffer_.data());
      buffered_ = 0;
    }
    std::fill(buffer_.begin() + buffered_, buffer_.begin() + 56, 0);
    for (int i = 0; i < 8; ++i) buffer_[63-i] = static_cast<std::uint8_t>(bit_length >> (8*i));
    compress(buffer_.data());
    static constexpr char hex[] = "0123456789abcdef";
    std::string result(64, '0');
    for (int i = 0; i < 8; ++i) {
      for (int j = 0; j < 4; ++j) {
        std::uint8_t byte = static_cast<std::uint8_t>(h_[i] >> (24 - 8*j));
        result[8*i + 2*j] = hex[byte >> 4];
        result[8*i + 2*j + 1] = hex[byte & 15];
      }
    }
    return result;
  }
};

struct RootEntry {
  std::string code;
  std::uint64_t aut = 1;
  std::uint8_t height = 0;
};

struct UnrootEntry {
  std::string code;
  std::uint64_t aut = 1;
};

struct Graph {
  std::vector<std::vector<int>> adjacency;
  std::vector<int> centers;
};

struct Recovery {
  bool yes = false;
  int p = -1;
  int q = -1;
};

[[noreturn]] void reject(const std::string &reason) { throw std::runtime_error(reason); }

std::uint64_t small_factorial(int n) {
  unsigned __int128 result = 1;
  for (int i = 2; i <= n; ++i) result *= static_cast<unsigned>(i);
  if (result > std::numeric_limits<std::uint64_t>::max()) reject("small factorial overflow");
  return static_cast<std::uint64_t>(result);
}

std::uint64_t automorphism_of_children(std::vector<const RootEntry *> children) {
  std::sort(children.begin(), children.end(), [](auto *a, auto *b) { return a->code < b->code; });
  unsigned __int128 aut = 1;
  for (std::size_t i = 0; i < children.size();) {
    std::size_t j = i + 1;
    while (j < children.size() && children[j]->code == children[i]->code) ++j;
    for (std::size_t k = i; k < j; ++k) aut *= children[k]->aut;
    aut *= small_factorial(static_cast<int>(j-i));
    if (aut > std::numeric_limits<std::uint64_t>::max()) reject("root aut overflow");
    i = j;
  }
  return static_cast<std::uint64_t>(aut);
}

std::uint64_t rooted_count(int n, const std::vector<std::uint64_t> &a) {
  if (n == 1) return 1;
  unsigned __int128 numerator = 0;
  for (int k = 1; k < n; ++k) {
    unsigned __int128 b = 0;
    for (int d = 1; d <= k; ++d) if (k % d == 0) b += static_cast<unsigned __int128>(d) * a[d];
    numerator += b * a[n-k];
  }
  if (numerator % (n-1)) reject("nonintegral rooted recurrence");
  return static_cast<std::uint64_t>(numerator / (n-1));
}

void integer_partitions(int remaining, int minimum, std::vector<int> &current,
                        const std::function<void(const std::vector<int>&)> &emit) {
  if (remaining == 0) {
    emit(current);
    return;
  }
  for (int part = minimum; part <= remaining; ++part) {
    current.push_back(part);
    integer_partitions(remaining - part, part, current, emit);
    current.pop_back();
  }
}

template <class Emit>
void selections_for_partition(const std::vector<int> &partition,
                              const std::vector<std::vector<RootEntry>> &catalogs,
                              Emit emit) {
  std::vector<std::pair<int,int>> groups;
  for (int size : partition) {
    if (groups.empty() || groups.back().first != size) groups.push_back({size,1});
    else ++groups.back().second;
  }
  std::vector<const RootEntry *> selected;
  selected.reserve(partition.size());
  std::function<void(std::size_t)> group_step;
  group_step = [&](std::size_t group_index) {
    if (group_index == groups.size()) {
      emit(selected);
      return;
    }
    const auto [size, count] = groups[group_index];
    if (size >= static_cast<int>(catalogs.size()) || catalogs[size].empty()) return;
    std::function<void(int,std::size_t)> choose;
    choose = [&](int left, std::size_t first) {
      if (left == 0) {
        group_step(group_index + 1);
        return;
      }
      const auto &catalog = catalogs[size];
      for (std::size_t i = first; i < catalog.size(); ++i) {
        selected.push_back(&catalog[i]);
        choose(left - 1, i);
        selected.pop_back();
      }
    };
    choose(count, 0);
  };
  group_step(0);
}

RootEntry make_root(std::vector<const RootEntry *> children) {
  std::sort(children.begin(), children.end(), [](auto *a, auto *b) { return a->code < b->code; });
  std::string code = "(";
  int height = 0;
  for (const RootEntry *child : children) {
    code += child->code;
    height = std::max(height, static_cast<int>(child->height) + 1);
  }
  code += ')';
  return RootEntry{std::move(code), automorphism_of_children(children), static_cast<std::uint8_t>(height)};
}

bool center_root(const std::vector<const RootEntry *> &children) {
  if (children.empty()) return true;
  int top = -1;
  int count = 0;
  for (auto *child : children) {
    if (child->height > top) { top = child->height; count = 1; }
    else if (child->height == top) ++count;
  }
  return count >= 2;
}

void build_root_catalogs(std::vector<std::vector<RootEntry>> &catalogs) {
  catalogs[1].push_back(RootEntry{"()",1,0});
  std::vector<std::uint64_t> counts(catalogs.size(), 0);
  counts[1] = 1;
  for (int n = 2; n < static_cast<int>(catalogs.size()); ++n) {
    const std::uint64_t expected = rooted_count(n, counts);
    counts[n] = expected;
    catalogs[n].reserve(expected);
    std::vector<int> partition;
    integer_partitions(n-1, 1, partition, [&](const std::vector<int> &parts) {
      selections_for_partition(parts, catalogs, [&](const std::vector<const RootEntry *> &children) {
        catalogs[n].push_back(make_root(children));
      });
    });
    std::sort(catalogs[n].begin(), catalogs[n].end(), [](const auto &a, const auto &b) { return a.code < b.code; });
    if (catalogs[n].size() != expected) reject("independent rooted count mismatch n=" + std::to_string(n));
    for (std::size_t i = 1; i < catalogs[n].size(); ++i)
      if (!(catalogs[n][i-1].code < catalogs[n][i].code)) reject("independent rooted duplicate");
    std::cerr << "checker_rooted_complete n=" << n << " rows=" << catalogs[n].size() << '\n';
  }
}

std::vector<UnrootEntry> build_unrooted(int n,
                                        const std::vector<std::vector<RootEntry>> &catalogs) {
  std::vector<UnrootEntry> result;
  std::uint64_t one_center_candidates = 0;
  std::vector<int> partition;
  integer_partitions(n-1, 1, partition, [&](const std::vector<int> &parts) {
    if (!parts.empty() && parts.back() >= static_cast<int>(catalogs.size())) return;
    selections_for_partition(parts, catalogs, [&](const std::vector<const RootEntry *> &children) {
      ++one_center_candidates;
      if (!center_root(children)) return;
      RootEntry root = make_root(children);
      result.push_back(UnrootEntry{std::move(root.code), root.aut});
    });
  });
  std::cerr << "checker_one_center_candidates n=" << n << " rows=" << one_center_candidates << '\n';

  for (int a_size = 1; a_size <= n/2; ++a_size) {
    int b_size = n-a_size;
    if (b_size >= static_cast<int>(catalogs.size())) continue;
    std::array<std::vector<const RootEntry *>, 22> left;
    std::array<std::vector<const RootEntry *>, 22> right;
    for (const auto &a : catalogs[a_size]) left[a.height].push_back(&a);
    for (const auto &b : catalogs[b_size]) right[b.height].push_back(&b);
    for (int h = 0; h < 22; ++h) {
      if (a_size < b_size) {
        for (auto *a : left[h]) for (auto *b : right[h]) {
          std::string code = a->code <= b->code ? '['+a->code+'|'+b->code+']'
                                                : '['+b->code+'|'+a->code+']';
          unsigned __int128 aut = static_cast<unsigned __int128>(a->aut)*b->aut;
          if (aut > std::numeric_limits<std::uint64_t>::max()) reject("checker two aut overflow");
          result.push_back({std::move(code), static_cast<std::uint64_t>(aut)});
        }
      } else {
        for (std::size_t i = 0; i < left[h].size(); ++i) for (std::size_t j = i; j < left[h].size(); ++j) {
          unsigned __int128 aut = static_cast<unsigned __int128>(left[h][i]->aut)*left[h][j]->aut;
          if (i == j) aut *= 2;
          if (aut > std::numeric_limits<std::uint64_t>::max()) reject("checker equal aut overflow");
          result.push_back({'['+left[h][i]->code+'|'+left[h][j]->code+']', static_cast<std::uint64_t>(aut)});
        }
      }
    }
  }
  std::sort(result.begin(), result.end(), [](const auto &a, const auto &b) { return a.code < b.code; });
  for (std::size_t i = 1; i < result.size(); ++i)
    if (!(result[i-1].code < result[i].code)) reject("independent unrooted duplicate");
  return result;
}

struct RootScan {
  int root = -1;
  int height = 0;
};

RootScan scan_root(std::string_view text, std::vector<std::vector<int>> &adjacency) {
  struct Frame {
    int vertex;
    std::size_t start;
    std::string_view previous;
    bool has_previous = false;
    int height = 0;
  };
  std::vector<Frame> stack;
  int returned_root = -1;
  int returned_height = -1;
  for (std::size_t pos = 0; pos < text.size(); ++pos) {
    char ch = text[pos];
    if (ch == '(') {
      int vertex = static_cast<int>(adjacency.size());
      adjacency.emplace_back();
      if (!stack.empty()) {
        adjacency[stack.back().vertex].push_back(vertex);
        adjacency[vertex].push_back(stack.back().vertex);
      }
      stack.push_back(Frame{vertex,pos});
    } else if (ch == ')') {
      if (stack.empty()) reject("checker premature close");
      Frame finished = stack.back();
      stack.pop_back();
      std::string_view exact = text.substr(finished.start, pos-finished.start+1);
      if (stack.empty()) {
        if (pos+1 != text.size()) reject("checker trailing rooted byte");
        returned_root = finished.vertex;
        returned_height = finished.height;
      } else {
        Frame &parent = stack.back();
        if (parent.has_previous && parent.previous > exact) reject("checker decreasing children");
        parent.previous = exact;
        parent.has_previous = true;
        parent.height = std::max(parent.height, finished.height+1);
      }
    } else {
      reject("checker illegal rooted byte");
    }
  }
  if (!stack.empty() || returned_root < 0) reject("checker unbalanced rooted code");
  return {returned_root, returned_height};
}

std::vector<int> all_pair_centers(const std::vector<std::vector<int>> &adj) {
  int best = std::numeric_limits<int>::max();
  std::vector<int> centers;
  for (int source = 0; source < static_cast<int>(adj.size()); ++source) {
    std::vector<int> distance(adj.size(), -1);
    std::queue<int> q;
    distance[source] = 0;
    q.push(source);
    while (!q.empty()) {
      int v=q.front(); q.pop();
      for (int u:adj[v]) if (distance[u]<0) {distance[u]=distance[v]+1; q.push(u);}
    }
    if (std::find(distance.begin(), distance.end(), -1) != distance.end()) reject("checker disconnected graph");
    int eccentricity = *std::max_element(distance.begin(), distance.end());
    if (eccentricity < best) {best=eccentricity; centers.assign(1,source);}
    else if (eccentricity == best) centers.push_back(source);
  }
  return centers;
}

Graph parse_code(const std::string &code) {
  Graph graph;
  std::vector<int> expected;
  if (!code.empty() && code[0]=='[') {
    if (code.size()<5 || code.back()!=']') reject("checker bad bracket code");
    std::size_t bar=code.find('|');
    if (bar==std::string::npos || code.find('|',bar+1)!=std::string::npos) reject("checker separator count");
    std::string_view a(code.data()+1,bar-1), b(code.data()+bar+1,code.size()-bar-2);
    if (a.empty() || b.empty() || a>b) reject("checker half ordering");
    RootScan left=scan_root(a,graph.adjacency);
    RootScan right=scan_root(b,graph.adjacency);
    if (left.height!=right.height) reject("checker half height mismatch");
    graph.adjacency[left.root].push_back(right.root);
    graph.adjacency[right.root].push_back(left.root);
    expected={left.root,right.root};
    std::sort(expected.begin(),expected.end());
  } else {
    RootScan root=scan_root(code,graph.adjacency);
    expected={root.root};
  }
  std::size_t degree_sum=0;
  for (auto &neighbors:graph.adjacency) {std::sort(neighbors.begin(),neighbors.end()); degree_sum+=neighbors.size();}
  if (degree_sum!=2*(graph.adjacency.size()-1)) reject("checker edge count");
  graph.centers=all_pair_centers(graph.adjacency);
  if (graph.centers!=expected) reject("checker center mismatch");
  return graph;
}

std::pair<std::string,std::uint64_t> tree_root_code(const Graph &graph,int v,int parent) {
  std::vector<std::pair<std::string,std::uint64_t>> children;
  for(int u:graph.adjacency[v]) if(u!=parent) children.push_back(tree_root_code(graph,u,v));
  std::sort(children.begin(),children.end());
  std::string code="(";
  unsigned __int128 aut=1;
  for(std::size_t i=0;i<children.size();) {
    std::size_t j=i+1; while(j<children.size()&&children[j].first==children[i].first)++j;
    for(std::size_t k=i;k<j;++k){code+=children[k].first;aut*=children[k].second;}
    aut*=small_factorial(static_cast<int>(j-i));
    i=j;
  }
  code+=')';
  if(aut>std::numeric_limits<std::uint64_t>::max())reject("checker tree aut overflow");
  return {std::move(code),static_cast<std::uint64_t>(aut)};
}

std::pair<std::string,std::uint64_t> recode(const Graph &graph) {
  if(graph.centers.size()==1)return tree_root_code(graph,graph.centers[0],-1);
  auto a=tree_root_code(graph,graph.centers[0],graph.centers[1]);
  auto b=tree_root_code(graph,graph.centers[1],graph.centers[0]);
  std::string code=a.first<=b.first?'['+a.first+'|'+b.first+']':'['+b.first+'|'+a.first+']';
  unsigned __int128 aut=static_cast<unsigned __int128>(a.second)*b.second*(a.first==b.first?2:1);
  if(aut>std::numeric_limits<std::uint64_t>::max())reject("checker recode aut overflow");
  return {std::move(code),static_cast<std::uint64_t>(aut)};
}

std::vector<Natural> convolution(const std::vector<Natural>&a,const std::vector<Natural>&b,int n){
  std::vector<Natural> result(std::min<int>(n+1,a.size()+b.size()-1));
  for(std::size_t i=0;i<a.size();++i)for(std::size_t j=0;j<b.size()&&static_cast<int>(i+j)<=n;++j)
    result[i+j].add(a[i]*b[j]);
  return result;
}

std::vector<Natural> independent_sets(const Graph &graph){
  int n=static_cast<int>(graph.adjacency.size());
  std::vector<int> parent(n,-2),order{0}; parent[0]=-1;
  for(std::size_t i=0;i<order.size();++i){int v=order[i];for(int u:graph.adjacency[v])if(parent[u]==-2){parent[u]=v;order.push_back(u);}}
  if(static_cast<int>(order.size())!=n)reject("checker DP disconnected");
  std::vector<std::vector<Natural>> e(n),j(n);
  for(std::size_t k=order.size();k-->0;){int v=order[k];e[v]={Natural(1)};j[v]={Natural(0),Natural(1)};
    for(int u:graph.adjacency[v])if(parent[u]==v){
      std::vector<Natural> total(std::max(e[u].size(),j[u].size()));
      for(std::size_t r=0;r<total.size();++r){if(r<e[u].size())total[r].add(e[u][r]);if(r<j[u].size())total[r].add(j[u][r]);}
      e[v]=convolution(e[v],total,n);j[v]=convolution(j[v],e[u],n);
    }
  }
  std::vector<Natural> coeff(n+1);
  for(int r=0;r<=n;++r){if(r<static_cast<int>(e[0].size()))coeff[r].add(e[0][r]);if(r<static_cast<int>(j[0].size()))coeff[r].add(j[0][r]);}
  return coeff;
}

Recovery first_recovery(const std::vector<Natural>&c){
  int n=static_cast<int>(c.size())-1;
  for(int q=1;q<=n;++q){Natural next=q<n?c[q+1]:Natural(0);if(next<=c[q])continue;
    for(int p=0;p<q;++p){if(c[p+1]>=c[p])continue;bool ok=true;for(int r=p+1;r<q;++r)if(c[r+1]>c[r]){ok=false;break;}if(ok)return{true,p,q};}}
  return{};
}

std::string adjacency_text(const Graph&g){std::ostringstream out;for(std::size_t v=0;v<g.adjacency.size();++v){out<<v<<':';for(std::size_t i=0;i<g.adjacency[v].size();++i){if(i)out<<',';out<<g.adjacency[v][i];}out<<'\n';}return out.str();}
std::string coefficient_text(const std::vector<Natural>&c){std::ostringstream out;for(std::size_t i=0;i<c.size();++i){if(i)out<<',';out<<c[i];}return out.str();}

std::vector<std::string> parse_csv_line(const std::string&line){
  std::vector<std::string> fields;std::string field;bool quoted=false;
  for(std::size_t i=0;i<line.size();++i){char ch=line[i];if(quoted){if(ch=='"'){if(i+1<line.size()&&line[i+1]=='"'){field+='"';++i;}else quoted=false;}else field+=ch;}
    else if(ch=='"'){if(!field.empty())reject("checker quote in unquoted field");quoted=true;}else if(ch==','){fields.push_back(field);field.clear();}else field+=ch;}
  if(quoted)reject("checker unterminated CSV quote");fields.push_back(field);return fields;
}

struct CheckSummary{std::uint64_t rows=0,recovery_rows=0;Natural mass=0;std::string first_code;int first_p=-1,first_q=-1;};

CheckSummary check_file(int n,const std::string&path,const std::vector<UnrootEntry>&expected){
  std::ifstream in(path,std::ios::binary);if(!in)reject("checker cannot open certificate");
  std::string line;if(!std::getline(in,line))reject("checker missing header");
  const std::string header="n,code,adjacency_sha256,aut_order,orbit_mass,coefficients,coefficients_sha256,recovery_state,p_or_null,q_or_null,row_sha256";
  if(line!=header)reject("checker header mismatch");
  CheckSummary summary;Natural nfactorial=factorial(n);
  while(std::getline(in,line)){
    if(!line.empty()&&line.back()=='\r')reject("checker found CR line ending");
    if(summary.rows>=expected.size())reject("checker certificate has extra row");
    auto fields=parse_csv_line(line);if(fields.size()!=11)reject("checker CSV field count");
    const UnrootEntry&wanted=expected[summary.rows];
    if(fields[0]!=std::to_string(n)||fields[1]!=wanted.code)reject("checker regenerated code/order mismatch row="+std::to_string(summary.rows));
    Graph graph=parse_code(fields[1]);if(static_cast<int>(graph.adjacency.size())!=n)reject("checker parsed n mismatch");
    auto canonical=recode(graph);if(canonical.first!=fields[1])reject("checker recode mismatch");
    std::uint64_t aut=std::stoull(fields[3]);if(aut!=wanted.aut||aut!=canonical.second)reject("checker automorphism mismatch");
    if(nfactorial.remainder(aut))reject("checker nonintegral orbit");Natural orbit=nfactorial.quotient(aut);
    if(fields[4]!=orbit.text())reject("checker orbit field mismatch");summary.mass.add(orbit);
    std::string adj=adjacency_text(graph);if(fields[2]!=Sha256::hash(adj))reject("checker adjacency hash mismatch");
    auto coefficients=independent_sets(graph);std::string coeff=coefficient_text(coefficients);if(fields[5]!=coeff)reject("checker coefficients mismatch");
    if(fields[6]!=Sha256::hash(coeff+'\n'))reject("checker coefficient hash mismatch");
    Recovery rec=first_recovery(coefficients);std::string state=rec.yes?"RECOVERY":"NO_RECOVERY";
    if(fields[7]!=state||fields[8]!=(rec.yes?std::to_string(rec.p):"null")||fields[9]!=(rec.yes?std::to_string(rec.q):"null"))reject("checker recovery mismatch");
    std::string payload=fields[0]+char(0x1f)+fields[1]+char(0x1f)+fields[2]+char(0x1f)+fields[3]+char(0x1f)+fields[4]+char(0x1f)+fields[5]+char(0x1f)+fields[6]+char(0x1f)+fields[7]+char(0x1f)+fields[8]+char(0x1f)+fields[9]+'\n';
    if(fields[10]!=Sha256::hash(payload))reject("checker row hash mismatch");
    if(rec.yes){++summary.recovery_rows;if(summary.first_code.empty()){summary.first_code=fields[1];summary.first_p=rec.p;summary.first_q=rec.q;}}
    ++summary.rows;if(summary.rows%100000==0)std::cerr<<"checker_certificate_progress n="<<n<<" rows="<<summary.rows<<'\n';
  }
  if(summary.rows!=expected.size())reject("checker certificate missing rows");
  Natural cayley=power(Natural(n),n-2);if(summary.mass!=cayley)reject("checker Cayley mass mismatch");
  return summary;
}

void show(int n,const CheckSummary&s){std::cout<<"CHECK_SUMMARY_BEGIN n="<<n<<'\n'<<"row_count="<<s.rows<<'\n'<<"recovery_rows="<<s.recovery_rows<<'\n'<<"mass_sum="<<s.mass<<'\n'<<"expected_mass="<<power(Natural(n),n-2)<<'\n'<<"overall_state="<<(s.first_code.empty()?"NO_RECOVERY":"RECOVERY")<<'\n'<<"first_recovery_code="<<(s.first_code.empty()?"null":s.first_code)<<'\n';if(!s.first_code.empty())std::cout<<"first_recovery_p="<<s.first_p<<'\n'<<"first_recovery_q="<<s.first_q<<'\n';std::cout<<"CHECK_SUMMARY_END n="<<n<<'\n';}

}  // namespace

int main(int argc,char**argv){
  try{
    if(argc!=2){std::cerr<<"usage: independent_checker CERTIFICATE_DIRECTORY\n";return 2;}
    if(Sha256::hash("abc")!="ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad")reject("checker SHA-256 self-test failed");
    std::vector<std::vector<RootEntry>> catalogs(20);build_root_catalogs(catalogs);
    auto codes20=build_unrooted(20,catalogs);auto codes21=build_unrooted(21,catalogs);
    std::cout<<"independent_regenerated_count_20="<<codes20.size()<<'\n'<<"independent_regenerated_count_21="<<codes21.size()<<'\n';
    std::string dir=argv[1];CheckSummary s20=check_file(20,dir+"/order-20.csv",codes20);CheckSummary s21=check_file(21,dir+"/order-21.csv",codes21);
    show(20,s20);show(21,s21);std::cout<<"INDEPENDENT_CHECKER_RESULT=ACCEPT\n";return 0;
  }catch(const std::exception&e){std::cerr<<"INDEPENDENT_CHECKER_RESULT=REJECT\nerror="<<e.what()<<'\n';return 1;}
}
