"""Independent deletion-neighborhood polynomial check for the C2-F2 tree."""
from functools import lru_cache

edges = ((0, 2), (1, 2), (3, 2), (5, 4), (7, 4), (4, 6), (6, 2), (2, 8))
n = 9
adj = [0] * n
for u, v in edges:
    adj[u] |= 1 << v
    adj[v] |= 1 << u


def add(a, b):
    return tuple((a[k] if k < len(a) else 0) + (b[k] if k < len(b) else 0)
                 for k in range(max(len(a), len(b))))


@lru_cache(None)
def polynomial(mask):
    if not mask:
        return (1,)
    vbit = mask & -mask
    v = vbit.bit_length() - 1
    excluded = polynomial(mask & ~vbit)
    included = (0,) + polynomial(mask & ~(vbit | adj[v]))
    return add(excluded, included)


def coeff(poly, k):
    return poly[k] if 0 <= k < len(poly) else 0


def delta(poly, k):
    return coeff(poly, k + 1) - coeff(poly, k)


full = (1 << n) - 1
assert len(edges) == n - 1
reached = 1
while True:
    extended = reached
    for v in range(n):
        if reached & (1 << v):
            extended |= adj[v]
    if extended == reached:
        break
    reached = extended
assert reached == full

poly = polynomial(full)
alpha = len(poly) - 1
x = next(k for k in range(len(poly)) if delta(poly, k) < 0)
p = alpha - 2
rows = []
for v in range(n):
    if adj[v].bit_count() != 1:
        continue
    s = adj[v].bit_length() - 1
    selector = delta(polynomial(full & ~(1 << v)), p)
    h = polynomial(full & ~(1 << v | 1 << s))
    r = polynomial(full & ~(1 << s | adj[s]))
    dh = delta(h, p - 1)
    dr = delta(r, p - 1)
    rows.append((v, s, selector, tuple(h), tuple(r), dh, dr, dh - dr))

print("tree_polynomial", poly, "alpha", alpha, "x", x, "p", p,
      "eligible", x + 2 <= p)
for row in rows:
    print("leaf,support,selector,H,R,Delta_H,Delta_R,term", row)
print("complete_sum", sum(row[-1] for row in rows if row[2] < 0))
