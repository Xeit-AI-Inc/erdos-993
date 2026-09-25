#!/usr/bin/env python3
"""Independent exact DP stress check: order 407, two leaves sharing support."""
import json
from math import comb


def add(a, b):
    c = [0] * max(len(a), len(b))
    for i, x in enumerate(a):
        c[i] += x
    for i, x in enumerate(b):
        c[i] += x
    return c


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        if x:
            for j, y in enumerate(b):
                if y:
                    c[i+j] += x*y
    return c


def poly(adj, vertices):
    """Forest independence polynomial, zero extension handled by coefficient()."""
    unseen = set(vertices)
    result = [1]
    while unseen:
        root = min(unseen)
        parent = {root: -1}
        order = [root]
        for v in order:
            for w in sorted(adj[v] & vertices):
                if w not in parent:
                    parent[w] = v
                    order.append(w)
        unseen.difference_update(order)
        dp = {}
        for v in reversed(order):
            absent, present = [1], [0, 1]
            for w in sorted(adj[v] & vertices):
                if parent.get(w) == v:
                    child_absent, child_present = dp[w]
                    absent = mul(absent, add(child_absent, child_present))
                    present = mul(present, child_absent)
            dp[v] = absent, present
        result = mul(result, add(*dp[root]))
    while len(result) > 1 and result[-1] == 0:
        result.pop()
    return result


def coeff(a, j):
    return a[j] if 0 <= j < len(a) else 0


def delta(a, j):
    return coeff(a, j+1) - coeff(a, j)


def main():
    m = 201
    n = 5 + 2*m
    edges = [(0, 1), (1, 2), (2, 3), (1, 4)]
    for j in range(m):
        edges.extend([(3, 5+2*j), (5+2*j, 6+2*j)])
    adj = [set() for _ in range(n)]
    for u, v in edges:
        adj[u].add(v)
        adj[v].add(u)
    allv = set(range(n))
    P = poly(adj, allv)
    # Independent closed formula from conditioning on hub 3.
    A = [1, 4, 3, 1]
    B = [0, 1, 3, 1]
    f = [comb(m, j)*2**j for j in range(m+1)]
    g = [comb(m, j) for j in range(m+1)]
    assert P == add(mul(A, f), mul(B, g))
    alpha = len(P)-1
    p = alpha-2
    x = next(j for j in range(alpha+1) if delta(P, j) < 0)
    leaves = [v for v in allv if len(adj[v]) == 1]
    assert leaves == [0, 4] + [6+2*j for j in range(m)]
    # Automorphisms exchange 0 and 4, and arbitrarily permute the m P2 arms.
    # Thus one representative of each of the two leaf orbits is enough.
    records = []
    for v, multiplicity in [(0, 2), (6, m)]:
        s = next(iter(adj[v]))
        T_v = poly(adj, allv-{v})
        H = poly(adj, allv-{v, s})
        R = poly(adj, allv-({s}|adj[s]))
        W = adj[s]-{v}
        qprev = coeff(H, p-1)-coeff(R, p-1)
        qnow = coeff(H, p)-coeff(R, p)
        ah = len(H)-1
        k = p-1
        record = {
            'representative_leaf': v, 'support': s, 'multiplicity': multiplicity,
            'W': sorted(W), 'alpha_H': ah,
            'delta_p_T_minus_leaf': delta(T_v, p),
            'favorable': delta(T_v, p) < 0,
            'q_p_minus_1': qprev, 'q_p': qnow,
            'term': delta(H, p-1)-delta(R, p-1),
            'shadow_slack': 2*(ah-k)*qprev-k*qnow if k <= ah else None,
        }
        assert record['term'] == qnow-qprev
        assert record['term'] <= 0
        if k <= ah:
            assert record['shadow_slack'] >= 0
        records.append(record)
    total = sum(r['multiplicity']*r['term'] for r in records if r['favorable'])
    assert n == 407 and alpha == 204 and p == 202 and x+2 <= p
    out = {
        'construction': 'P4 0-1-2-3 plus second leaf 4 at support 1, and 201 paths 3-(5+2j)-(6+2j), 0<=j<201',
        'order': n, 'edge_count': len(edges), 'alpha': alpha, 'p': p, 'x': x,
        'eligible': x+2 <= p, 'original_leaf_count': len(leaves),
        'high_tail_guard': 3*p >= 2*alpha+1,
        'leaf_orbits': records,
        'favorable_original_leaf_count': sum(r['multiplicity'] for r in records if r['favorable']),
        'complete_sum': total,
        'coefficient_formula_verified_all_ranks': True,
    }
    print(json.dumps(out, indent=2))


if __name__ == '__main__':
    main()
