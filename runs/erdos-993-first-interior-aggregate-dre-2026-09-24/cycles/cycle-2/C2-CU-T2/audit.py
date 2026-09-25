#!/usr/bin/env python3
"""Independent integer checks for the C2-T2 eligibility argument."""
from itertools import combinations, product
from math import comb
import json


def prufer_edges(n, code):
    degree = [1] * n
    for v in code:
        degree[v] += 1
    edges = []
    for v in code:
        u = min(i for i, d in enumerate(degree) if d == 1)
        edges.append((u, v))
        degree[u] -= 1
        degree[v] -= 1
    u, v = (i for i, d in enumerate(degree) if d == 1)
    edges.append((u, v))
    return edges


def is_cover(vertices, edges):
    return all(u in vertices or v in vertices for u, v in edges)


def independent_counts(vertices, edges):
    vertices = sorted(vertices)
    counts = [0] * (len(vertices) + 1)
    for mask in range(1 << len(vertices)):
        chosen = {vertices[j] for j in range(len(vertices)) if mask & (1 << j)}
        if all(u not in chosen or v not in chosen for u, v in edges):
            counts[len(chosen)] += 1
    return counts


def small_cases():
    results = {}
    for n in (7, 8):
        qualifying = 0
        minimum = None
        witness = None
        for code in product(range(n), repeat=n - 2):
            edges = prufer_edges(n, code)
            if not any(is_cover(set(c), edges) for c in combinations(range(n), n - 6)):
                continue
            qualifying += 1
            degree = [0] * n
            for u, v in edges:
                degree[u] += 1
                degree[v] += 1
            S = sum(comb(d, 2) for d in degree)
            d2 = ((n - 1) * (n - 2) * (n - 9)) // 6 + S
            # Independent check: count pairs/triples directly, not by the formula.
            i2 = sum(all(not (u in c and v in c) for u, v in edges)
                     for c in combinations(range(n), 2))
            i3 = sum(all(not (u in c and v in c) for u, v in edges)
                     for c in combinations(range(n), 3))
            assert d2 == i3 - i2 and d2 > 0
            if minimum is None or d2 < minimum:
                minimum, witness = d2, list(code)
        results[str(n)] = {"prufer_codes": n ** (n - 2),
                           "cover_at_most_n_minus_6": qualifying,
                           "minimum_delta2": minimum,
                           "minimum_witness_code": witness}
    return results


def double_star():
    # Two adjacent centers 0,1. Four leaves at 0 and seven at 1.
    n = 13
    edges = [(0, 1)] + [(0, j) for j in range(2, 6)] + [(1, j) for j in range(6, 13)]
    universe = set(range(n))
    coeff = independent_counts(universe, edges)
    alpha = max(k for k, c in enumerate(coeff) if c)
    diffs = [coeff[k + 1] - coeff[k] for k in range(n)]
    x = next(k for k, d in enumerate(diffs) if d < 0)
    p = alpha - 2
    rows = []
    for leaf in range(2, n):
        support = 0 if leaf < 6 else 1
        h_vertices = universe - {leaf, support}
        r_vertices = universe - {support} - {v for u, v in edges if u == support} - {u for u, v in edges if v == support}
        h = independent_counts(h_vertices, edges)
        r = independent_counts(r_vertices, edges)
        deleted = independent_counts(universe - {leaf}, edges)
        def at(c, k): return c[k] if 0 <= k < len(c) else 0
        selector = at(deleted, p + 1) - at(deleted, p)
        summand = at(h, p) - at(h, p - 1) - at(r, p) + at(r, p - 1)
        rows.append({"leaf": leaf, "selector": selector, "summand": summand})
    return {"edges": edges, "order": n, "alpha": alpha, "x": x, "p": p,
            "eligible": x + 2 <= p, "independent_coefficients": coeff,
            "leaf_rows": rows,
            "complete_sum": sum(row["summand"] for row in rows if row["selector"] < 0)}


if __name__ == "__main__":
    result = {"small_cases": small_cases(), "fresh_double_star": double_star()}
    assert result["fresh_double_star"]["eligible"]
    print(json.dumps(result, indent=2, sort_keys=True))
