#!/usr/bin/env python3
"""Exact coefficient replay for the C3-T6 rooted pendant-leaf graft."""
import json
from functools import lru_cache


def make_tree(m: int, graft: bool):
    # T_m: path 0-1-2 and m disjoint 3-leaf claws attached by their
    # claw centers to 0.  The optional graft is one new leaf at 0.
    n = 3
    edges = [(0, 1), (1, 2)]
    leaves = []
    for _ in range(m):
        center = n
        n += 1
        edges.append((0, center))
        for _ in range(3):
            edges.append((center, n))
            leaves.append((n, center))
            n += 1
    if graft:
        edges.append((0, n))
        leaves.append((n, 0))
        n += 1
    return n, edges, leaves


def independent_polynomial(n, edges, deleted=()):
    adj = [0] * n
    for u, v in edges:
        adj[u] |= 1 << v
        adj[v] |= 1 << u
    start = (1 << n) - 1
    for v in deleted:
        start &= ~(1 << v)

    @lru_cache(None)
    def rec(mask):
        if mask == 0:
            return (1,)
        bit = mask & -mask
        v = bit.bit_length() - 1
        omit = rec(mask ^ bit)
        take = rec(mask & ~(bit | adj[v]))
        out = [0] * max(len(omit), len(take) + 1)
        for j, c in enumerate(omit):
            out[j] += c
        for j, c in enumerate(take):
            out[j + 1] += c
        while len(out) > 1 and out[-1] == 0:
            out.pop()
        return tuple(out)

    return list(rec(start))


def coeff(poly, j):
    return poly[j] if 0 <= j < len(poly) else 0


def delta(poly, j):
    return coeff(poly, j + 1) - coeff(poly, j)


def first_strict_descent(poly):
    # Search through alpha, including the terminal zero-extended difference.
    for j in range(len(poly)):
        if delta(poly, j) < 0:
            return j
    raise AssertionError("terminal descent must occur")


def case(graft):
    m, p = 4, 9
    n, edges, leaves = make_tree(m, graft)
    whole = independent_polynomial(n, edges)
    alpha = len(whole) - 1
    x = first_strict_descent(whole)
    assert x + 2 <= p and 3 * p < 2 * alpha + 1
    rows = []
    for v, support in leaves:
        pv = independent_polynomial(n, edges, (v,))
        selector_delta = delta(pv, p)
        if selector_delta < 0:
            h = independent_polynomial(n, edges, (v, support))
            closed = [support] + [b for a, b in edges if a == support]
            closed += [a for a, b in edges if b == support]
            r = independent_polynomial(n, edges, set([v] + closed))
            term = delta(h, p - 1) - delta(r, p - 1)
            q = coeff(h, p - 1) - coeff(r, p - 1)
            q_next = coeff(h, p) - coeff(r, p)
            rows.append({
                "leaf": v,
                "original_support": support,
                "delta_p_after_leaf_deletion": selector_delta,
                "H_coefficients": h,
                "R_coefficients": r,
                "selected_summand": term,
                "q_at_p_minus_1": q,
                "q_at_p": q_next,
                "q_p_minus_q_p_minus_1": q_next - q,
            })
    return {
        "tree": "T4_plus_root_pendant_leaf" if graft else "T4",
        "m": m,
        "graft_leaf_at_vertex_0": graft,
        "order": n,
        "edges": [list(e) for e in edges],
        "whole_independence_coefficients": whole,
        "alpha": alpha,
        "deltas_0_through_alpha": [delta(whole, j) for j in range(alpha + 1)],
        "x": x,
        "p": p,
        "eligibility_checks": {
            "x_plus_2_le_p": x + 2 <= p,
            "three_p_lt_two_alpha_plus_1": 3 * p < 2 * alpha + 1,
        },
        "favorable_leaf_rows": rows,
        "favorable_leaves_in_order": [r["leaf"] for r in rows],
        "sum_selected_negative_budget": sum(-r["delta_p_after_leaf_deletion"] for r in rows),
        "sum_q_at_p_minus_1": sum(r["q_at_p_minus_1"] for r in rows),
        "sum_q_at_p": sum(r["q_at_p"] for r in rows),
        "complete_S": sum(r["selected_summand"] for r in rows),
    }


result = {
    "method": "exact integer independent-set polynomial recursion f(M)=f(M-v)+z*f(M-N[v]) on vertex masks",
    "rank_convention": "integer zero extension outside 0..alpha; x checked through alpha",
    "composition": "attach one new pendant leaf at vertex 0 of T4",
    "cases": [case(False), case(True)],
    "scope": "two exact trees at p=9; no universal claim",
}
print(json.dumps(result, indent=2))
