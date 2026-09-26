#!/usr/bin/env python3
"""Bounded, exact arithmetic checks for the C2 order-band audit."""

import importlib.util
import itertools
import json
import random
from math import comb

SOURCE = ("/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/"
          "erdos-993-lower-region-compensation-dre-2026-09-25/"
          "inputs/ordinary_tree_checked.py")
spec = importlib.util.spec_from_file_location("ordinary_tree_checked", SOURCE)
mod = importlib.util.module_from_spec(spec)
import sys
sys.modules[spec.name] = mod
spec.loader.exec_module(mod)


def graph_check(n, edge_mask, w_mask):
    edges = list(itertools.combinations(range(n), 2))
    adj = [0] * n
    for bit, (u, v) in enumerate(edges):
        if edge_mask & (1 << bit):
            adj[u] |= 1 << v
            adj[v] |= 1 << u
    isolates = sum(1 << v for v in range(n) if not adj[v])
    assert w_mask & isolates == isolates
    independent = []
    for s in range(1 << n):
        if all(not (adj[v] & s) for v in range(n) if s & (1 << v)):
            independent.append(s)
    out = 0
    for k in range(2, n + 3):
        if n > 2 * k + 1:
            continue
        lower = [s for s in independent if s.bit_count() == k and s & w_mask]
        upper = [s for s in independent if s.bit_count() == k + 1 and s & w_mask]
        qk, qkp = len(lower), len(upper)
        b = 0
        for s in lower:
            neighborhood = 0
            for v in range(n):
                if s & (1 << v):
                    neighborhood |= adj[v]
            b += neighborhood.bit_count()
        c = sum(1 for s in upper if (s & w_mask).bit_count() >= 2)
        assert k * qkp + c == (n - k) * qk - b
        assert k * (qkp - qk) == (n - 2 * k) * qk - b - c
        assert qkp <= qk
        out += 1
    return out


generic = {"exhaustive_orders": [0, 1, 2, 3, 4, 5], "graphs": 0,
           "marked_graph_pairs": 0, "rank_cases": 0,
           "sample_orders": [6, 7], "sample_graphs": 0,
           "sample_marked_graph_pairs": 0, "sample_rank_cases": 0}
for n in generic["exhaustive_orders"]:
    edges = list(itertools.combinations(range(n), 2))
    for edge_mask in range(1 << len(edges)):
        generic["graphs"] += 1
        degree = [0] * n
        for bit, (u, v) in enumerate(edges):
            if edge_mask & (1 << bit):
                degree[u] += 1
                degree[v] += 1
        isolates = sum(1 << v for v in range(n) if not degree[v])
        for w_mask in range(1 << n):
            if w_mask & isolates != isolates:
                continue
            generic["marked_graph_pairs"] += 1
            generic["rank_cases"] += graph_check(n, edge_mask, w_mask)

rng = random.Random(99320260925)
for n in generic["sample_orders"]:
    edges = list(itertools.combinations(range(n), 2))
    masks = {0, (1 << len(edges)) - 1}
    masks.update(rng.randrange(1 << len(edges)) for _ in range(1000))
    for edge_mask in sorted(masks):
        generic["sample_graphs"] += 1
        degree = [0] * n
        for bit, (u, v) in enumerate(edges):
            if edge_mask & (1 << bit):
                degree[u] += 1
                degree[v] += 1
        isolates = sum(1 << v for v in range(n) if not degree[v])
        w_masks = {isolates, (1 << n) - 1}
        w_masks.update(isolates | rng.randrange(1 << n) for _ in range(4))
        for w_mask in w_masks:
            generic["sample_marked_graph_pairs"] += 1
            generic["sample_rank_cases"] += graph_check(n, edge_mask, w_mask)

tree = {"exhaustive_labeled_orders": [2, 3, 4, 5, 6, 7],
        "trees": 0, "leaf_rank_cases": 0, "favorable_sum_cases": 0}
for n, _, t in mod.all_labeled_trees(2, 7):
    tree["trees"] += 1
    poly = t.forest_independence_polynomial()
    alpha = len(poly) - 1
    x = mod.first_strict_descent(poly)
    for v in t.leaves():
        s = t.support(v)
        hp = t.remove({v, s}).forest_independence_polynomial()
        rp = t.remove(t.closed_neighborhood({s})).forest_independence_polynomial()
        for p in range(3, n + 3):
            if n <= 2 * p + 1:
                assert mod.delta(hp, p - 1) - mod.delta(rp, p - 1) <= 0
                tree["leaf_rank_cases"] += 1
    for p in range(3, n + 3):
        if x + 2 <= p and 3 * p < 2 * alpha + 1 and n <= 2 * p + 1:
            row = mod.aggregate_row(t, p)
            assert row["aggregate"] <= 0
            tree["favorable_sum_cases"] += 1

sharpness = []
for k in range(2, 7):
    leaves = 2 * k + 1
    # Center 0; marked leaf 1; new support and leaf follow the star vertices.
    s, v = leaves + 1, leaves + 2
    edges = [(0, u) for u in range(1, leaves + 1)] + [(1, s), (s, v)]
    t = mod.Graph.from_edges(range(2 * k + 4), edges)
    poly = t.forest_independence_polynomial()
    p = k + 1
    row = mod.leaf_data(t, v, p)
    expected = comb(2 * k, k) - comb(2 * k, k - 1)
    assert row["g"] == expected > 0
    assert mod.first_strict_descent(poly) == p
    assert len(poly) - 1 == 2 * k + 2
    sharpness.append({"k": k, "p": p, "order": 2 * k + 4,
                      "alpha": len(poly) - 1, "x": p,
                      "local_excess": row["g"],
                      "favorable": row["pointwise_delta"] < 0})

# A nonempty eligible first shell: six centers in a path, each with two leaves.
edges = [(i, i + 1) for i in range(5)]
edges += [(i, 6 + 2 * i + j) for i in range(6) for j in range(2)]
shell_tree = mod.Graph.from_edges(range(18), edges)
shell_row = mod.aggregate_row(shell_tree, 8)
shell_poly = shell_tree.brute_independence_polynomial()
assert shell_poly == shell_tree.forest_independence_polynomial()
brute_aggregate = 0
brute_favorable = []
for leaf in shell_tree.leaves():
    if mod.delta(shell_tree.remove({leaf}).brute_independence_polynomial(), 8) < 0:
        support = shell_tree.support(leaf)
        hp = shell_tree.remove({leaf, support}).brute_independence_polynomial()
        rp = shell_tree.remove(shell_tree.closed_neighborhood({support})).brute_independence_polynomial()
        brute_aggregate += mod.delta(hp, 7) - mod.delta(rp, 7)
        brute_favorable.append(leaf)
assert brute_favorable == shell_row["favorable_leaves"]
assert brute_aggregate == shell_row["aggregate"]
assert shell_row["order"] == 18 == 2 * shell_row["rank"] + 2
assert shell_row["first_strict_descent"] + 2 <= shell_row["rank"]
assert 3 * shell_row["rank"] < 2 * shell_row["alpha"] + 1

result = {"generic": generic, "tree": tree, "sharpness": sharpness,
          "eligible_first_shell_example": {
              "edges": edges, "order": shell_row["order"],
              "p": shell_row["rank"], "alpha": shell_row["alpha"],
              "x": shell_row["first_strict_descent"],
              "independence_coefficients": shell_poly,
              "favorable_count": shell_row["favorable_count"],
              "aggregate": shell_row["aggregate"],
              "brute_force_matched_dp": True}}
with open("AUDIT-CHECK.json", "w") as fh:
    json.dump(result, fh, indent=2)
    fh.write("\n")
print(json.dumps(result, indent=2))
