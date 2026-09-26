#!/usr/bin/env python3
"""Exact, bounded T22 check for the C3-AU repair proposal."""

import hashlib
import json
from math import comb
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
PIN = ROOT / "inputs/standing-controls/t22-order91.json"
PIN_SHA256 = "2198f01fa5de1c192da190ac242f5af8a914b0b03bd5e6df979590d20c6a18ed"


def add(a, b):
    c = [0] * max(len(a), len(b))
    for i, v in enumerate(a):
        c[i] += v
    for i, v in enumerate(b):
        c[i] += v
    return c


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def trim(a):
    while len(a) > 1 and a[-1] == 0:
        a.pop()
    return a


def coeff(a, j):
    return a[j] if 0 <= j < len(a) else 0


def delta(a, j):
    return coeff(a, j + 1) - coeff(a, j)


def poly(adj, removed=()):
    """Rooted forest recurrence: exclude v => product (E+I), include v => z product E."""
    removed = set(removed)
    seen = set()

    def visit(v, parent):
        assert v not in seen
        seen.add(v)
        no, yes = [1], [0, 1]
        for w in sorted(adj[v] - removed):
            if w == parent:
                continue
            child_no, child_yes = visit(w, v)
            no = mul(no, add(child_no, child_yes))
            yes = mul(yes, child_no)
        return trim(no), trim(yes)

    out = [1]
    for v in range(len(adj)):
        if v not in removed and v not in seen:
            no, yes = visit(v, -1)
            out = mul(out, add(no, yes))
    assert len(seen) + len(removed) == len(adj)
    return trim(out)


def make_t22():
    adj = [set() for _ in range(91)]
    edges = [(0, 1), (1, 2)]
    for b in range(22):
        c = 3 + 4 * b
        edges.append((0, c))
        edges.extend((c, c + d) for d in (1, 2, 3))
    for u, v in edges:
        adj[u].add(v)
        adj[v].add(u)
    assert len(edges) == 90 and len(adj) == 91
    # Connectivity plus n-1 edges proves this simple graph is a tree.
    todo, seen = [0], set()
    while todo:
        v = todo.pop()
        if v not in seen:
            seen.add(v)
            todo.extend(adj[v] - seen)
    assert len(seen) == 91
    return adj, edges


def main():
    adj, edges = make_t22()
    full = poly(adj)
    a = len(full) - 1
    signs = [delta(full, j) for j in range(a + 1)]  # includes i_(a+1)=0
    x = next(j for j, d in enumerate(signs) if d < 0)
    p = 34
    leaves = [v for v in range(91) if len(adj[v]) == 1]
    rows = []
    excluded = []
    for v in leaves:
        support = next(iter(adj[v]))
        dv = delta(poly(adj, {v}), p)
        if dv >= 0:
            excluded.append({"leaf": v, "delta_p_tree_minus_leaf": dv})
            continue
        h_removed = {v, support}
        r_removed = {support} | adj[support]
        h = poly(adj, h_removed)
        r = poly(adj, r_removed)
        q33 = coeff(h, 33) - coeff(r, 33)
        q34 = coeff(h, 34) - coeff(r, 34)
        rows.append({
            "leaf": v,
            "support": support,
            "W": sorted(adj[support] - {v}),
            "delta_p_tree_minus_leaf": dv,
            "h_order": 91 - len(h_removed),
            "r_order": 91 - len(r_removed),
            "i33_h": coeff(h, 33), "i34_h": coeff(h, 34),
            "i33_r": coeff(r, 33), "i34_r": coeff(r, 34),
            "q33": q33, "q34": q34, "g": q34 - q33,
        })
    total = sum(row["g"] for row in rows)
    arm = next(row for row in rows if row["leaf"] == 2)
    claw_rows = [row for row in rows if row["leaf"] != 2]

    # Independent structural polynomial and marked-arm checks.
    B = [1, 4, 3, 1]
    branch_power = [1]
    for _ in range(22):
        branch_power = mul(branch_power, B)
    binomial_power = [comb(66, j) for j in range(67)]
    formula = add(mul([1, 2], branch_power), mul([0, 1, 1], binomial_power))
    assert full == trim(formula)
    assert arm["q33"] == comb(66, 32) and arm["q34"] == comb(66, 33)
    assert len({r["g"] for r in claw_rows}) == 1

    pinned_bytes = PIN.read_bytes()
    assert hashlib.sha256(pinned_bytes).hexdigest() == PIN_SHA256
    pinned = json.loads(pinned_bytes)
    prior = pinned["complete_row"]
    assert a == prior["alpha"] == 68
    assert x == prior["first_strict_descent"] == 32
    assert [r["leaf"] for r in rows] == prior["favorable_leaves"]
    assert total == prior["aggregate"]
    for row, old in zip(rows, prior["summands"]):
        assert row["support"] == old["support"]
        assert row["W"] == old["witness_vertices"]
        assert row["q33"] == old["c_previous"]
        assert row["q34"] == old["c_rank"]
        assert row["g"] == old["g"]
        assert row["delta_p_tree_minus_leaf"] == old["pointwise_delta"]

    evidence = {
        "method": "Exact integer rooted-forest include/exclude recurrence; no literal independent-set enumeration.",
        "graph": {"vertices": 91, "edge_count": len(edges), "edges": edges,
                  "recipe": "Edges (0,1),(1,2); for b=0..21 with c=3+4b, edges (0,c),(c,c+1),(c,c+2),(c,c+3)."},
        "tree_polynomial": full,
        "terminal_zero_extension": {"alpha": a, "i_alpha": coeff(full, a),
                                    "i_alpha_plus_1": coeff(full, a + 1),
                                    "delta_alpha": signs[a],
                                    "first_strict_descent": x,
                                    "all_deltas_0_through_alpha": signs,
                                    "no_negative_delta_before_x": all(d >= 0 for d in signs[:x])},
        "eligibility": {"p": p, "x_plus_2_le_p": x + 2 <= p,
                        "three_p": 3*p, "two_alpha_plus_1": 2*a+1,
                        "strict_upper_guard": 3*p < 2*a+1},
        "original_leaves": leaves,
        "excluded_original_leaves": excluded,
        "selected_rows": rows,
        "selected_count": len(rows),
        "arm_leaf_2": arm,
        "claw_leaf_count": len(claw_rows),
        "claw_common_g": claw_rows[0]["g"],
        "aggregate": total,
        "closed_form_crosscheck": {
            "tree": "(1+2z)(1+4z+3z^2+z^3)^22+(z+z^2)(1+z)^66",
            "tree_polynomial_matches_recurrence": True,
            "arm_q_j": "binomial(66,j-1) for j>=1",
            "q33": comb(66, 32), "q34": comb(66, 33)},
        "pinned_control": {"path": "inputs/standing-controls/t22-order91.json",
                           "sha256": PIN_SHA256,
                           "all_67_selected_rows_match": True},
    }
    (HERE / "EVIDENCE.json").write_text(json.dumps(evidence, indent=2) + "\n")
    print(json.dumps({"order": 91, "alpha": a, "x": x, "p": p,
                      "leaves": len(leaves), "selected": len(rows),
                      "excluded": excluded, "q33": arm["q33"],
                      "q34": arm["q34"], "arm_g": arm["g"],
                      "claw_g": claw_rows[0]["g"], "S": total}, indent=2))


if __name__ == "__main__":
    main()
