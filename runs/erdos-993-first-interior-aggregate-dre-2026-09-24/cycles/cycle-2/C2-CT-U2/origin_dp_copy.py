#!/usr/bin/env python3
"""Exact tree-DP replay for a freshly selected T_m target (m=61)."""
from functools import lru_cache
import json


def poly_add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a): out[i] += x
    for i, x in enumerate(b): out[i] += x
    return out


def poly_mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): out[i+j] += x*y
    return out


def forest_independence_polynomial(adj, keep):
    keep = set(keep)
    seen = set()
    total = [1]
    for root in sorted(keep):
        if root in seen: continue
        parent = {root: None}
        order = [root]
        seen.add(root)
        for u in order:
            for v in adj[u]:
                if v in keep and v != parent[u] and v not in seen:
                    seen.add(v); parent[v] = u; order.append(v)
        ex = {}; inc = {}
        for u in reversed(order):
            ex_u, in_u = [1], [0, 1]
            for v in adj[u]:
                if v in keep and parent.get(v) == u:
                    ex_u = poly_mul(ex_u, poly_add(ex[v], inc[v]))
                    in_u = poly_mul(in_u, ex[v])
            ex[u], inc[u] = ex_u, in_u
        total = poly_mul(total, poly_add(ex[root], inc[root]))
    return total


def coeff(poly, k):
    return poly[k] if 0 <= k < len(poly) else 0


def delta(poly, k):
    return coeff(poly, k + 1) - coeff(poly, k)


def alpha(poly):
    return max(i for i, c in enumerate(poly) if c)


def first_descent(poly, a):
    return next(k for k in range(a + 1) if delta(poly, k) < 0)


def build(m):
    # Vertices 0=root, 1=s0, 2=v0; star center j has leaves at
    # 3+4j and 4+4j and 5+4j, for j=0,...,m-1.
    n = 4*m + 3
    adj = [set() for _ in range(n)]
    edges = [(0, 1), (1, 2)]
    leaves = [(2, 1)]
    for j in range(m):
        c = 3 + 4*j
        edges.append((0, c))
        for v in (c+1, c+2, c+3):
            edges.append((c, v)); leaves.append((v, c))
    for u, v in edges: adj[u].add(v); adj[v].add(u)
    return adj, edges, leaves


def main():
    m = 151
    adj, edges, leaves = build(m)
    V = set(range(len(adj)))
    full = forest_independence_polynomial(adj, V)
    a = alpha(full)
    p = a - 2
    x = first_descent(full, a)
    rows = []
    for v, s in leaves:
        p_v = forest_independence_polynomial(adj, V - {v})
        H = forest_independence_polynomial(adj, V - {v, s})
        R = forest_independence_polynomial(adj, V - ({s} | adj[s]))
        selector = delta(p_v, p)
        term = delta(H, p-1) - delta(R, p-1)
        rows.append({"leaf": v, "support": s, "selector": selector, "term": term,
                     "favorable": selector < 0})
    favorable = [r for r in rows if r["favorable"]]
    data = {
        "family": "root with one length-two arm and 61 root-adjacent 3-leaf stars",
        "m": m, "order": len(adj), "edge_count": len(edges),
        "edges": [list(e) for e in edges],
        "original_leaf_count": len(leaves), "alpha": a, "p": p,
        "first_strict_descent_x": x, "eligible": x + 2 <= p,
        "full_coefficients_through_alpha": full,
        "favorable_leaf_count": len(favorable),
        "unfavorable_leaf_count": len(rows)-len(favorable),
        "favorable_terms_by_leaf": favorable,
        "complete_favorable_sum": sum(r["term"] for r in favorable),
        "all_favorable_terms_nonpositive": all(r["term"] <= 0 for r in favorable),
        "all_leaf_rows": rows,
        "terminal_delta_alpha": delta(full, a),
    }
    print(json.dumps(data, indent=2))

if __name__ == "__main__": main()
