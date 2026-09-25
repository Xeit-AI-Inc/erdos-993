#!/usr/bin/env python3
"""Exact tree-DP replay for the fresh m=200 boundary-family member."""
from json import dumps


def tree(m):
    # Core path 0--1--2--3; for j=0,...,m-1 append 3--(4+2j)--(5+2j).
    n = 4 + 2 * m
    edges = [(0, 1), (1, 2), (2, 3)]
    edges += [(3, 4 + 2*j) for j in range(m)]
    edges += [(4 + 2*j, 5 + 2*j) for j in range(m)]
    adj = [set() for _ in range(n)]
    for u, v in edges:
        adj[u].add(v)
        adj[v].add(u)
    return adj, edges


def independence_polynomial(adj, vertices=None):
    if vertices is None:
        vertices = set(range(len(adj)))
    unseen = set(vertices)
    total = [1]
    while unseen:
        root = min(unseen)
        parent = {root: None}
        order = [root]
        for v in order:
            for w in sorted(adj[v] & vertices):
                if w != parent[v] and w not in parent:
                    parent[w] = v
                    order.append(w)
        unseen.difference_update(order)
        # At each vertex: (without v, with v), represented as coefficients.
        dp = {}
        for v in reversed(order):
            without = [1]
            with_v = [0, 1]
            for w in sorted(adj[v] & vertices):
                if parent.get(w) == v:
                    child_without, child_with = dp[w]
                    without = conv(without, add(child_without, child_with))
                    with_v = conv(with_v, child_without)
            dp[v] = (without, with_v)
        component = add(*dp[root])
        total = conv(total, component)
    return total


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a): out[i] += x
    for i, x in enumerate(b): out[i] += x
    return trim(out)


def conv(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): out[i+j] += x*y
    return trim(out)


def trim(a):
    while len(a) > 1 and a[-1] == 0: a.pop()
    return a


def delta(poly, k):
    # Coefficients are zero outside the ordinary nonnegative range.
    def coeff(j): return poly[j] if 0 <= j < len(poly) else 0
    return coeff(k+1) - coeff(k)


def binomial_poly(n, weight):
    import math
    return [math.comb(n, j) * weight**j for j in range(n+1)]


def main():
    m = 200
    adj, edges = tree(m)
    n = len(adj)
    allv = set(range(n))
    P = independence_polynomial(adj)
    # Independently derived branch formula for the constructor:
    # (1+3z+z^2)(1+2z)^m + z(1+2z)(1+z)^m.
    P_formula = add(conv([1, 3, 1], binomial_poly(m, 2)),
                    conv([0, 1, 2], binomial_poly(m, 1)))
    assert P == P_formula
    alpha = len(P) - 1
    x = next(k for k in range(alpha + 1) if delta(P, k) < 0)
    p = alpha - 2
    leaves = sorted(v for v in allv if len(adj[v]) == 1)
    terms = []
    for v in leaves:
        s = next(iter(adj[v]))
        Tv = allv - {v}
        Pv = independence_polynomial(adj, Tv)
        favorable = delta(Pv, p) < 0
        H = allv - {v, s}
        closed = {s} | adj[s]
        R = allv - closed
        PH = independence_polynomial(adj, H)
        PR = independence_polynomial(adj, R)
        hdiff = delta(PH, p-1)
        rdiff = delta(PR, p-1)
        terms.append({"leaf": v, "support": s, "favorable": favorable,
                      "term": hdiff-rdiff, "delta_p_T_minus_leaf": delta(Pv, p),
                      "delta_p_minus1_H": hdiff, "delta_p_minus1_R": rdiff})
    complete = sum(t["term"] for t in terms if t["favorable"])
    assert len(leaves) == m + 1
    assert all(t["favorable"] for t in terms)
    assert all(t["term"] <= 0 for t in terms)
    # Tagged shadow q_j = i_j(H)-i_j(R), for v=0, s=1, W={2}.
    H = allv - {0, 1}
    R = allv - {0, 1, 2}
    PH = independence_polynomial(adj, H)
    PR = independence_polynomial(adj, R)
    q = [((PH[j] if j < len(PH) else 0) - (PR[j] if j < len(PR) else 0))
         for j in range(max(len(PH), len(PR)))]
    k = p - 1
    # Independent direct formula from the core argument: q_j = C(m,j-1)2^(j-1).
    import math
    q_formula = [0] + [math.comb(m, j-1) * 2**(j-1) for j in range(1, m+2)]
    assert q == q_formula
    assert k*q[k+1] <= 2*(alpha-1-k)*q[k]
    assert alpha == m + 2 and p == m and x + 2 <= p
    print(dumps({"family": "P4 with m pendant P2 paths at endpoint 3",
                 "m": m, "n": n, "edges": edges, "alpha_from_exact_tree_dp": alpha,
                 "first_strict_descent_x": x, "p": p,
                 "eligible": x+2 <= p,
                 "independence_coefficients": P,
                 "original_leaves": leaves, "leaf_terms": terms,
                 "favorable_leaves": [t["leaf"] for t in terms if t["favorable"]],
                 "complete_favorable_sum": complete,
                 "tagged_shadow": {"k": k, "q_k": q[k], "q_k_plus_1": q[k+1],
                                   "lhs": k*q[k+1],
                                   "rhs": 2*(alpha-1-k)*q[k],
                                   "difference_rhs_minus_lhs": 2*(alpha-1-k)*q[k]-k*q[k+1]}},
                indent=2))


if __name__ == "__main__":
    main()
