#!/usr/bin/env python3
"""Exact, independently written DP for a 246-vertex tagged-leaf challenge."""
import json
from math import comb


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def add(a, b):
    c = [0] * max(len(a), len(b))
    for i, x in enumerate(a):
        c[i] += x
    for i, x in enumerate(b):
        c[i] += x
    return c


def graph(m):
    edges = [(0, 1), (1, 2), (2, 3)]
    for j in range(m):
        edges += [(3, 4 + 2*j), (4 + 2*j, 5 + 2*j)]
    return 4 + 2*m, edges


def forest_poly(n, edges, removed):
    present = set(range(n)) - set(removed)
    adj = {v: [] for v in present}
    for u, v in edges:
        if u in present and v in present:
            adj[u].append(v)
            adj[v].append(u)
    seen = set()

    def visit(v, parent):
        assert v not in seen, "cycle in specified forest"
        seen.add(v)
        no = [1]
        yes = [0, 1]
        for u in adj[v]:
            if u == parent:
                continue
            no_u, yes_u = visit(u, v)
            no = mul(no, add(no_u, yes_u))
            yes = mul(yes, no_u)
        return no, yes

    p = [1]
    for v in sorted(present):
        if v not in seen:
            p = mul(p, add(*visit(v, -1)))
    return p


def coeff(p, j):
    return p[j] if 0 <= j < len(p) else 0


def diff(p, j):
    return coeff(p, j + 1) - coeff(p, j)


def row(m):
    n, edges = graph(m)
    nbr = {v: set() for v in range(n)}
    for u, v in edges:
        nbr[u].add(v)
        nbr[v].add(u)
    assert len(edges) == n-1
    full = forest_poly(n, edges, set())
    alpha = len(full)-1
    p = alpha-2
    x = next(j for j in range(alpha+1) if diff(full, j) < 0)
    leaves = [v for v in range(n) if len(nbr[v]) == 1]
    assert leaves == [0] + [5+2*j for j in range(m)]
    types = []
    for v in (0, 5):
        s = next(iter(nbr[v]))
        poly_deleted = forest_poly(n, edges, {v})
        h = forest_poly(n, edges, {v, s})
        r = forest_poly(n, edges, {s} | nbr[s])
        q_p = coeff(h, p) - coeff(r, p)
        q_prev = coeff(h, p-1) - coeff(r, p-1)
        types.append(dict(v=v, support=s, selected=diff(poly_deleted, p)<0,
                          selector_delta=diff(poly_deleted, p), q_p=q_p,
                          q_prev=q_prev, term=q_p-q_prev))
    assert alpha == m+2
    assert types[0]['q_p'] == m*2**(m-1)
    assert types[0]['q_prev'] == comb(m,2)*2**(m-2)
    assert types[1]['q_p'] == 2*m-1
    assert types[1]['q_prev'] == (m-1)**2
    # Each arm has the same graph orbit, so this is the COMPLETE tagged sum.
    selected_count = int(types[0]['selected']) + m*int(types[1]['selected'])
    complete_sum = (types[0]['term'] if types[0]['selected'] else 0) + (
        m*types[1]['term'] if types[1]['selected'] else 0)
    return dict(m=m, n=n, alpha=alpha, p=p, x=x, eligible=x+2<=p,
                terminal_diff=diff(full, alpha), leaves=len(leaves),
                favorable_tags=selected_count, types=types,
                complete_sum=complete_sum)


if __name__ == '__main__':
    print(json.dumps([row(m) for m in (4, 5, 11, 121)], indent=2))
