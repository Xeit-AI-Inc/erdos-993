#!/usr/bin/env python3
"""Exact finite checks for the C2-T2 eligibility argument (Python stdlib only)."""
from itertools import product
from math import comb
import json


def prufer_tree(n, code):
    degree = [1] * n
    for x in code:
        degree[x] += 1
    edges = []
    for x in code:
        leaf = next(i for i, d in enumerate(degree) if d == 1)
        edges.append((leaf, x))
        degree[leaf] -= 1
        degree[x] -= 1
    rem = [i for i, d in enumerate(degree) if d == 1]
    edges.append(tuple(rem))
    return edges


def exact_coeffs(n, edges):
    adj = [0] * n
    for u, v in edges:
        adj[u] |= 1 << v
        adj[v] |= 1 << u
    counts = [0] * (n + 1)
    for mask in range(1 << n):
        independent = True
        for u in range(n):
            if (mask >> u) & 1 and (adj[u] & mask):
                independent = False
                break
        if independent:
            counts[mask.bit_count()] += 1
    return counts


def check_orders():
    out = {}
    for n in (7, 8):
        total = n ** (n - 2)
        min_delta2 = None
        alpha6 = 0
        min_delta2_alpha6 = None
        checked_formula = 0
        eligible_small_alpha = 0
        for code in product(range(n), repeat=n - 2):
            edges = prufer_tree(n, code)
            counts = exact_coeffs(n, edges)
            deg = [0] * n
            for u, v in edges:
                deg[u] += 1
                deg[v] += 1
            S = sum(comb(d, 2) for d in deg)
            formula_i2 = comb(n - 1, 2)
            formula_i3 = comb(n, 3) - (n - 1) * (n - 2) + S
            assert counts[2] == formula_i2
            assert counts[3] == formula_i3
            delta2 = counts[3] - counts[2]
            assert 6 * delta2 == (n - 1) * (n - 2) * (n - 9) + 6 * S
            checked_formula += 1
            min_delta2 = delta2 if min_delta2 is None else min(min_delta2, delta2)
            alpha = max(k for k, c in enumerate(counts) if c)
            if alpha == 6:
                alpha6 += 1
                assert delta2 > 0
                min_delta2_alpha6 = (delta2 if min_delta2_alpha6 is None
                                     else min(min_delta2_alpha6, delta2))
            x = next(k for k in range(n + 1) if counts[k + 1] - counts[k] < 0)
            if alpha <= 6 and x + 4 <= alpha:
                eligible_small_alpha += 1
        out[str(n)] = {
            "labeled_trees_checked": total,
            "formula_instances_checked": checked_formula,
            "trees_with_alpha_6": alpha6,
            "minimum_delta2_among_alpha_6_trees": min_delta2_alpha6,
            "minimum_delta2_over_all_trees": min_delta2,
            "eligible_alpha_le_6_count": eligible_small_alpha,
        }
    return out


def star_10_check():
    # K_{1,10}: center 0 and ten leaf vertices 1..10.
    # i_0=1, i_1=11, i_k=C(10,k) for 2<=k<=10, i_11=0.
    coeffs = [1, 11] + [comb(10, k) for k in range(2, 11)] + [0]
    diffs = [coeffs[k + 1] - coeffs[k] for k in range(len(coeffs) - 1)]
    x = next(k for k, d in enumerate(diffs) if d < 0)
    alpha = 10
    p = alpha - 2
    # For each original leaf v, H is 9 isolated vertices and R is empty.
    # Delta_7(H)=C(9,8)-C(9,7)=-27; Delta_7(R)=0.
    local = comb(9, 8) - comb(9, 7)
    return {
        "edges": [[0, j] for j in range(1, 11)],
        "order": 11,
        "alpha": alpha,
        "x": x,
        "p": p,
        "eligible": x + 2 <= p,
        "all_10_leaves_favorable": (comb(9, 9) - comb(9, 8)) < 0,
        "per_leaf_summand": local,
        "complete_sum": 10 * local,
        "tagged_shadow_counts_at_k7": {"q_7": comb(9, 7), "q_8": comb(9, 8)},
    }


if __name__ == "__main__":
    result = {"orders_7_8": check_orders(), "fresh_larger_eligible_tree": star_10_check()}
    assert result["fresh_larger_eligible_tree"]["eligible"]
    assert result["fresh_larger_eligible_tree"]["x"] == 5
    assert result["fresh_larger_eligible_tree"]["complete_sum"] == -270
    print(json.dumps(result, sort_keys=True, indent=2))
