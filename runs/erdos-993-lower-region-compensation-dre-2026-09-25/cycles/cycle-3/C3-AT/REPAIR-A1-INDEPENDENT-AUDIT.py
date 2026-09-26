#!/usr/bin/env python3
"""Literal subset audit of the two fixed C3 T4 graphs. No source imports."""

import json
from collections import Counter
from pathlib import Path


def graph(graft):
    edges = [(0, 1), (1, 2)]
    for c in (3, 7, 11, 15):
        edges.append((0, c))
        edges.extend((c, v) for v in (c + 1, c + 2, c + 3))
    if graft:
        edges.append((0, 19))
    n = 20 if graft else 19
    adj = [0] * n
    for u, v in edges:
        adj[u] |= 1 << v
        adj[v] |= 1 << u
    assert len(edges) == n - 1
    return n, edges, adj


def trim(counts):
    while len(counts) > 1 and counts[-1] == 0:
        counts.pop()
    return counts


def coefficient(poly, k):
    return poly[k] if 0 <= k < len(poly) else 0


def delta(poly, k):
    return coefficient(poly, k + 1) - coefficient(poly, k)


def case(graft):
    n, edges, adj = graph(graft)
    leaves = [v for v in range(n) if adj[v].bit_count() == 1]
    supports = {v: adj[v].bit_length() - 1 for v in leaves}
    types = {}
    for v in leaves:
        s = supports[v]
        types[v] = {
            'T_minus_v': 1 << v,
            'H': (1 << v) | (1 << s),
            'R': (1 << s) | adj[s],
        }
    whole = [0] * (n + 1)
    counts = {v: {name: [0] * (n + 1) for name in types[v]} for v in leaves}
    independent = bytearray(1 << n)
    independent[0] = 1
    independent_subsets = 0
    # Every mask is visited.  Independence is decided by its least vertex and
    # a previously computed smaller mask; the polynomial is counted literally.
    for mask in range(1 << n):
        if mask:
            bit = mask & -mask
            v = bit.bit_length() - 1
            rest = mask ^ bit
            independent[mask] = independent[rest] and not (adj[v] & rest)
        if not independent[mask]:
            continue
        independent_subsets += 1
        k = mask.bit_count()
        whole[k] += 1
        for v in leaves:
            for name, forbidden in types[v].items():
                if mask & forbidden == 0:
                    counts[v][name][k] += 1
    whole = trim(whole)
    alpha = len(whole) - 1
    differences = [delta(whole, j) for j in range(alpha + 1)]
    x = next(j for j, d in enumerate(differences) if d < 0)
    p = 9
    rows = []
    for v in leaves:
        s = supports[v]
        pv = trim(counts[v]['T_minus_v'])
        h = trim(counts[v]['H'])
        r = trim(counts[v]['R'])
        selector = delta(pv, p)
        q8 = coefficient(h, 8) - coefficient(r, 8)
        q9 = coefficient(h, 9) - coefficient(r, 9)
        summand = delta(h, 8) - delta(r, 8)
        assert summand == q9 - q8
        rows.append({
            'leaf': v,
            'original_degree': adj[v].bit_count(),
            'original_support': s,
            'support_degree': adj[s].bit_count(),
            'W_vertices': [u for u in range(n) if (adj[s] & (1 << u)) and u != v],
            'H_vertices': [u for u in range(n) if u not in (v, s)],
            'R_vertices': [u for u in range(n) if not ((types[v]['R'] >> u) & 1)],
            'T_minus_v_coefficients': pv,
            'H_coefficients': h,
            'R_coefficients': r,
            'selector_Delta_9': selector,
            'strict_favorable': selector < 0,
            'q_8': q8,
            'q_9': q9,
            'summand': summand,
        })
    selected = [r for r in rows if r['strict_favorable']]
    out = {
        'grafted': graft,
        'order': n,
        'edges': [list(e) for e in edges],
        'degrees': [a.bit_count() for a in adj],
        'original_leaves': leaves,
        'original_leaf_supports': [[v, supports[v]] for v in leaves],
        'enumerated_subsets': 1 << n,
        'independent_subsets': independent_subsets,
        'whole_coefficients': whole,
        'alpha': alpha,
        'Delta_0_through_alpha': differences,
        'first_strict_descent': x,
        'p': p,
        'guards': {'x_plus_2_le_p': x + 2 <= p, 'three_p_lt_two_alpha_plus_1': 3*p < 2*alpha+1},
        'all_original_leaf_rows': rows,
        'complete_strict_selector': [r['leaf'] for r in selected],
        'M_sum_negative_selector': sum(-r['selector_Delta_9'] for r in selected),
        'Q_sum_q_8': sum(r['q_8'] for r in selected),
        'Q9_sum_q_9': sum(r['q_9'] for r in selected),
        'S_complete': sum(r['summand'] for r in selected),
    }
    assert all(out['guards'].values())
    assert out['Delta_0_through_alpha'][-1] == -whole[-1]
    assert sum(whole) == independent_subsets
    assert out['S_complete'] == out['Q9_sum_q_9'] - out['Q_sum_q_8']
    return out


def main():
    original, grafted = case(False), case(True)
    # Independent coefficient check of the pendant recurrence.
    # T4-r has isolated arm path 1-2 and four free K(1,3) branches.
    # Obtain I(T4-r) by literal subset enumeration of the original case,
    # filtering masks containing vertex 0 from the same mask algorithm.
    n, edges, adj = graph(False)
    independent = bytearray(1 << n)
    independent[0] = 1
    root_deleted = [0] * (n + 1)
    for mask in range(1 << n):
        if mask:
            bit = mask & -mask
            v = bit.bit_length() - 1
            rest = mask ^ bit
            independent[mask] = independent[rest] and not (adj[v] & rest)
        if independent[mask] and not (mask & 1):
            root_deleted[mask.bit_count()] += 1
    root_deleted = trim(root_deleted)
    a, b = original['whole_coefficients'], grafted['whole_coefficients']
    recurrence = all(coefficient(b, j) == coefficient(a, j) + coefficient(root_deleted, j-1)
                     for j in range(max(len(a), len(b)) + 1))
    assert recurrence
    old_selector_update = []
    for v in original['original_leaves']:
        old = next(r for r in original['all_original_leaf_rows'] if r['leaf'] == v)
        new = next(r for r in grafted['all_original_leaf_rows'] if r['leaf'] == v)
        old_selector_update.append({'leaf': v, 'before': old['selector_Delta_9'],
                                    'after': new['selector_Delta_9'],
                                    'change': new['selector_Delta_9'] - old['selector_Delta_9']})
    result = {
        'producerID': 'C3-AT-REPAIR-A1',
        'method': 'literal enumeration of every vertex subset, using a least-vertex independence test; all induced-deletion polynomials counted from the same independent subsets',
        'rank_convention': 'zero extension outside the coefficient range, including terminal Delta_alpha',
        'scope': 'two specified trees at p=9 only',
        'cases': [original, grafted],
        'pendant_recurrence_check': {'I_T4_minus_root_coefficients': root_deleted,
                                     'I_graft_equals_I_original_plus_z_I_T4_minus_root': recurrence,
                                     'old_leaf_selector_updates': old_selector_update},
    }
    Path('EVIDENCE.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({'original': {k: original[k] for k in ('complete_strict_selector','M_sum_negative_selector','Q_sum_q_8','Q9_sum_q_9','S_complete')},
                      'grafted': {k: grafted[k] for k in ('complete_strict_selector','M_sum_negative_selector','Q_sum_q_8','Q9_sum_q_9','S_complete')},
                      'recurrence': recurrence}, indent=2))


if __name__ == '__main__':
    main()
