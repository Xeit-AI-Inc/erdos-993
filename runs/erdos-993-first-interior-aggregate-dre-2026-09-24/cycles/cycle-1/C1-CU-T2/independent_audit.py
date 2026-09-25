#!/usr/bin/env python3
"""Independent subset-count check of the pinned deletion identities, n=2..7."""
import heapq
import itertools
import json
from pathlib import Path


def tree_from_prufer(n, seq):
    degree = [1] * n
    for v in seq:
        degree[v] += 1
    leaves = [v for v in range(n) if degree[v] == 1]
    heapq.heapify(leaves)
    edges = []
    for v in seq:
        u = heapq.heappop(leaves)
        edges.append((u, v))
        degree[u] -= 1
        degree[v] -= 1
        if degree[v] == 1:
            heapq.heappush(leaves, v)
    edges.append(tuple(leaves))
    return edges


def poly(n, edges, kept):
    vertices = [v for v in range(n) if kept & (1 << v)]
    result = [0] * (len(vertices) + 1)
    for subset in range(1 << len(vertices)):
        mask = sum(1 << vertices[j] for j in range(len(vertices)) if subset & (1 << j))
        if all(not ((mask >> u) & (mask >> v) & 1) for u, v in edges):
            result[mask.bit_count()] += 1
    while len(result) > 1 and result[-1] == 0:
        result.pop()
    return result


def coeff(values, k):
    return values[k] if 0 <= k < len(values) else 0


def delta(values, k):
    return coeff(values, k + 1) - coeff(values, k)


result = dict(orders={}, leaf_rank_checks=0, eligible_trees=0,
              eligible_favorable_leaves=0, positive_eligible_favorable_summands=0)
for n in range(2, 8):
    count = 0
    for seq in itertools.product(range(n), repeat=n - 2):
        edges = tree_from_prufer(n, seq)
        neighbors = [set() for _ in range(n)]
        for u, v in edges:
            neighbors[u].add(v)
            neighbors[v].add(u)
        full = (1 << n) - 1
        whole = poly(n, edges, full)
        alpha = len(whole) - 1
        p = alpha - 2
        x = next(k for k in range(alpha + 1) if delta(whole, k) < 0)
        eligible = x + 2 <= p
        result['eligible_trees'] += eligible
        for v in range(n):
            if len(neighbors[v]) != 1:
                continue
            s = next(iter(neighbors[v]))
            hv = full & ~(1 << v) & ~(1 << s)
            rv = hv
            for u in neighbors[s]:
                rv &= ~(1 << u)
            h = poly(n, edges, hv)
            r = poly(n, edges, rv)
            tv = poly(n, edges, full & ~(1 << v))
            assert alpha == len(h)
            for k in range(-1, alpha + 1):
                assert coeff(tv, k) == coeff(h, k) + coeff(r, k - 1)
                a = delta(tv, k)
                g = delta(h, k - 1) - delta(r, k - 1)
                assert g + a == coeff(h, k + 1) - coeff(h, k - 1)
                result['leaf_rank_checks'] += 1
            if eligible and delta(tv, p) < 0:
                g = delta(h, p - 1) - delta(r, p - 1)
                result['eligible_favorable_leaves'] += 1
                result['positive_eligible_favorable_summands'] += g > 0
        count += 1
    result['orders'][str(n)] = count
star_n = 9
star_edges = [(0, v) for v in range(1, star_n)]
star_poly = poly(star_n, star_edges, (1 << star_n) - 1)
star_alpha = len(star_poly) - 1
star_p = star_alpha - 2
star_x = next(k for k in range(star_alpha + 1) if delta(star_poly, k) < 0)
star_h = poly(star_n, star_edges, ((1 << star_n) - 1) & ~3)
star_r = poly(star_n, star_edges, 0)
star_tv = poly(star_n, star_edges, ((1 << star_n) - 1) & ~(1 << 1))
star_a = delta(star_tv, star_p)
star_g = delta(star_h, star_p - 1) - delta(star_r, star_p - 1)
assert star_x + 2 <= star_p and star_a < 0 and star_g <= 0
assert star_g + star_a == coeff(star_h, star_p + 1) - coeff(star_h, star_p - 1)
result['star9'] = dict(alpha=star_alpha, x=star_x, p=star_p,
                       favorable_count=star_n - 1, a_per_leaf=star_a,
                       g_per_leaf=star_g, aggregate=(star_n - 1) * star_g)
Path('independent-audit.json').write_text(json.dumps(result, indent=2, sort_keys=True) + '\n')
print(json.dumps(result, sort_keys=True))
