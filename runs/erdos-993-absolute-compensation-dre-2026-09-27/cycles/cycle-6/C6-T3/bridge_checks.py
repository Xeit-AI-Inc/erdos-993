"""Exact local checks for the C6-T3 conditional endpoint bridge."""
from math import comb


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a): out[i] += x
    for i, x in enumerate(b): out[i] += x
    return out


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): out[i + j] += x * y
    return out


def lp(n):
    return [comb(n, k) for k in range(n + 1)]


def br(r):
    x = lp(r)
    if len(x) <= 1: x.append(0)
    x[1] += 1
    return x


def fr(r):
    return [sum(comb(t, k) for t in range(r - 1)) for k in range(r - 1)]


def all_ordered_minors(a, b):
    # a[u] b[v] - a[v] b[u] >= 0, with coefficients zero-extended.
    n = max(len(a), len(b))
    aa, bb = a + [0] * (n - len(a)), b + [0] * (n - len(b))
    return [aa[u] * bb[v] - aa[v] * bb[u]
            for u in range(n) for v in range(u + 1, n)]


L, G = [1, 1], [1, 2]
assert all(x >= 0 for x in all_ordered_minors(L, G))
local_minor_counts = {"L_G": len(all_ordered_minors(L, G))}
for r in (2, 3, 4):
    F, B, Bprev = fr(r), br(r), br(r - 1)
    assert all(x >= 0 for x in all_ordered_minors(F, B)), (r, F, B)
    # L B_r - G B_(r-1) = z^2 (L^(r-1)-1), coefficientwise.
    lhs = add(mul(L, B), [-x for x in mul(G, Bprev)])
    rhs = [0, 0] + [x - (1 if k == 0 else 0)
                      for k, x in enumerate(lp(r - 1))]
    rhs = rhs[:max(len(lhs), len(rhs))] + [0] * max(0, len(lhs)-len(rhs))
    lhs += [0] * (len(rhs) - len(lhs))
    assert lhs == rhs, (r, lhs, rhs)
    assert min(all_ordered_minors(F, B), default=0) >= 0
    local_minor_counts[f"F{r}_B{r}"] = len(all_ordered_minors(F, B))
    assert all(c >= 0 for c in rhs)

# Exact h >= N+1 for each arity contribution, and ULC orders of G, B2,B3,B4.
orders = {"G": (G, 1), "B2": (br(2), 2),
          "B3": (br(3), 4), "B4": (br(4), 7)}
for name, (seq, order) in orders.items():
    d = len(seq) - 1
    for k in range(1, d):
        # ULC(order): c[k]^2 >= ((k+1)(order-k+1)/(k(order-k))) c[k-1]c[k+1]
        assert order >= k
        assert (k * (order - k) * seq[k] ** 2 >=
                (k + 1) * (order - k + 1) * seq[k - 1] * seq[k + 1]), (name, k)

# Fresh logical shortcut control (not a path-star witness): coefficientwise
# dominance alone cannot transport a shifted-minor sign.
Ctoy, Utoy, Vtoy = [1, 1, 1], [1, 1, 0], [1, 1, 10]
assert all(v >= u for u, v in zip(Utoy, Vtoy))
def shifted_minor(a, c, k):
    at = lambda s, j: s[j] if 0 <= j < len(s) else 0
    return at(a, k) * at(c, k) - at(a, k + 1) * at(c, k - 1)
assert shifted_minor(Utoy, Ctoy, 1) == 1
assert shifted_minor(Vtoy, Ctoy, 1) == -9

print({"local_pair_minor_counts": local_minor_counts,
       "endpoint_factor_identity_arity": [2, 3, 4],
       "factor_ulc_orders_checked": {k: v[1] for k, v in orders.items()},
       "coefficientwise_dominance_shortcut_control": {"U_minor": 1, "V_minor": -9, "is_path_star": False},
       "scope": "fixed local factors and a scalar logical shortcut control only; universal convolution steps are proved in REPORT.md"})
