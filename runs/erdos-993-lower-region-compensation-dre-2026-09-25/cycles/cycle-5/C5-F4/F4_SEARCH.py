#!/usr/bin/env python3
"""Bounded exact search for a proper favorable-leaf selector in F4 families.

Uses the hash-pinned ordinary_tree_checked.py common source. No random trees.
Run with Python 3 from any directory; prints the evidence JSON.
"""
from __future__ import annotations
import itertools
import json
import runpy
from pathlib import Path

SOURCE = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25/inputs/ordinary_tree_checked.py')
M = runpy.run_path(str(SOURCE))
Graph = M['Graph']
kl_spider = M['kl_spider']
delta = M['delta']
first_descent = M['first_strict_descent']


def path_spider(lengths):
    edges, vertices, nxt = [], [0], 1
    for length in lengths:
        prev = 0
        for _ in range(length):
            edges.append((prev, nxt))
            vertices.append(nxt)
            prev, nxt = nxt, nxt + 1
    return Graph.from_edges(vertices, edges)


def edges_of(T):
    return sorted((v, w) for v in T.vertices for w in T.adjacency[v] if v < w)


def guarded_rows(T):
    poly = T.forest_independence_polynomial()
    alpha = len(poly) - 1
    x = first_descent(poly)  # integer zero-extension includes the terminal descent
    rows = []
    if x is None:
        return poly, alpha, x, rows
    # For integer p, 3p < 2 alpha + 1 iff p <= floor(2 alpha / 3).
    for p in range(x + 2, (2 * alpha) // 3 + 1):
        leaves = T.leaves()
        leaf_deltas = {
            v: delta(T.remove({v}).forest_independence_polynomial(), p)
            for v in leaves
        }
        F = [v for v in leaves if leaf_deltas[v] < 0]
        if F and len(F) < len(leaves):
            sums = {v: M['leaf_data'](T, v, p)['g'] for v in F}
            rows.append({
                'p': p,
                'favorable_leaves': F,
                'nonfavorable_leaves': [v for v in leaves if v not in F],
                'all_original_leaf_deltas': {str(v): leaf_deltas[v] for v in leaves},
                'full_selected_summands': sums,
                'full_S': sum(sums.values()),
                'independence_polynomial': poly,
                'alpha': alpha,
                'x': x,
                'edges': edges_of(T),
            })
    return poly, alpha, x, rows


summary = {
    'method': 'exact forest independence-polynomial dynamic programming; no randomized generation',
    'guard': 'x is first negative Delta with integer zero-extension through alpha; ranks satisfy x+2<=p and 3p<2alpha+1',
    'families': {},
    'proper_selector_witnesses': [],
}

# Named Kadrawi-Levit T(k1,k2,k3) spiders; canonical sorted triples.
count = eligible = 0
for arms in itertools.combinations_with_replacement(range(1, 21), 3):
    T = kl_spider(arms)
    _, _, _, rows = guarded_rows(T)
    count += 1
    eligible += len(range(first_descent(T.forest_independence_polynomial()) + 2,
                          2 * (len(T.forest_independence_polynomial()) - 1) // 3 + 1))
    summary['proper_selector_witnesses'].extend({'family': 'KL_T_triple', 'arms': arms, **r} for r in rows)
summary['families']['KL_T_triple'] = {
    'recipe': 'kl_spider((k1,k2,k3)) from the pinned evaluator; 1<=k1<=k2<=k3<=20',
    'trees': count, 'eligible_tree_rank_pairs': eligible,
    'proper_selector_rows': sum(r['family'] == 'KL_T_triple' for r in summary['proper_selector_witnesses']),
}

# Rooted central spiders whose arms are paths, with 3..5 arms of lengths 1..8.
count = eligible = 0
for arm_count in range(3, 6):
    for lengths in itertools.combinations_with_replacement(range(1, 9), arm_count):
        T = path_spider(lengths)
        _, _, _, rows = guarded_rows(T)
        count += 1
        poly = T.forest_independence_polynomial(); alpha = len(poly)-1; x = first_descent(poly)
        eligible += len(range(x + 2, 2 * alpha // 3 + 1)) if x is not None else 0
        summary['proper_selector_witnesses'].extend({'family': 'central_path_spider', 'arm_lengths': lengths, **r} for r in rows)
summary['families']['central_path_spider'] = {
    'recipe': 'one center joined to disjoint paths; canonical sorted arm lengths, 3..5 arms, each length 1..8',
    'trees': count, 'eligible_tree_rank_pairs': eligible,
    'proper_selector_rows': sum(r['family'] == 'central_path_spider' for r in summary['proper_selector_witnesses']),
}

# Attach one new path of length 1..5 at each nonleaf vertex of the five named KL fixtures.
fixtures = [(3,4,4), (3,4,5), (3,5,5), (3,5,6), (3,6,6)]
count = eligible = 0
for arms in fixtures:
    base = kl_spider(arms)
    base_edges = edges_of(base)
    for attach in sorted(base.vertices):
        if len(base.adjacency[attach]) == 1:
            continue
        for length in range(1, 6):
            start = max(base.vertices) + 1
            vertices = set(base.vertices) | set(range(start, start + length))
            edges = base_edges + [(attach, start)] + [(start+j, start+j+1) for j in range(length-1)]
            T = Graph.from_edges(vertices, edges)
            _, _, _, rows = guarded_rows(T)
            count += 1
            poly = T.forest_independence_polynomial(); alpha = len(poly)-1; x = first_descent(poly)
            eligible += len(range(x + 2, 2 * alpha // 3 + 1)) if x is not None else 0
            summary['proper_selector_witnesses'].extend({'family': 'KL_fixture_path_graft', 'base_arms': arms, 'attachment_vertex': attach, 'graft_path_length': length, **r} for r in rows)
summary['families']['KL_fixture_path_graft'] = {
    'recipe': 'for each listed base KL tree, attach a path of length 1..5 at every nonleaf vertex',
    'base_arm_triples': fixtures, 'trees': count, 'eligible_tree_rank_pairs': eligible,
    'proper_selector_rows': sum(r['family'] == 'KL_fixture_path_graft' for r in summary['proper_selector_witnesses']),
}

# A fully eligible, non-proper selector example documents the target window.
T = path_spider((7, 7, 7))
poly = T.forest_independence_polynomial(); alpha = len(poly) - 1; x = first_descent(poly); p = x + 2
summary['eligible_example_all_favorable'] = {
    'family': 'central_path_spider', 'arm_lengths': [7, 7, 7],
    'order': len(T.vertices), 'edges': edges_of(T), 'independence_polynomial': poly,
    'alpha': alpha, 'x': x, 'p': p, 'lower_region_check': 3*p < 2*alpha+1,
    'all_original_leaf_deltas': {str(v): delta(T.remove({v}).forest_independence_polynomial(), p) for v in T.leaves()},
    'favorable_leaves': M['favorable_leaves'](T, p),
    'summands_and_full_S': M['aggregate_row'](T, p)['summands'],
    'full_S': M['aggregate_row'](T, p)['aggregate'],
}
summary['result'] = 'witness found' if summary['proper_selector_witnesses'] else 'no witness in these finite families'
print(json.dumps(summary, indent=2, sort_keys=True))
