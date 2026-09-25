#!/usr/bin/env python3
"""Exact replay of the C2-U1 spine family on 244 vertices.

The DP implementation is copied into source_dp_copy.py within this scratch.
This driver independently checks its polynomial by a closed product formula.
"""
from collections import Counter
from math import comb
import json

from source_dp_copy import row


def conv(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a):
        out[i] += x
    for i, x in enumerate(b):
        out[i] += x
    return out


def closed_poly(m):
    # w excluded: path v-s-u and m isolated arm edges.
    # w included: v-s edge, while each arm contributes optional b_j.
    return add(conv([1, 3, 1], [comb(m, j) * 2**j for j in range(m + 1)]),
               conv([0, 1, 2], [comb(m, j) for j in range(m + 1)]))


def main():
    results = []
    for m in (4, 5, 11, 120):
        r = row(m)
        assert r["n"] == 4 + 2*m
        assert r["poly"] == closed_poly(m)
        assert r["alpha"] == m + 2 and r["p"] == m
        assert len(r["leaves"]) == m + 1
        assert r["favorable"] == r["leaves"]
        assert len(r["summands"]) == m + 1
        marked = [z for z in r["summands"] if z["leaf"] == 0]
        arms = [z for z in r["summands"] if z["leaf"] != 0]
        assert len(marked) == 1 and len(arms) == m
        assert marked[0]["q_p"] == m * 2**(m - 1)
        assert marked[0]["q_pminus1"] == comb(m, 2) * 2**(m - 2)
        assert all(z["q_p"] == 2*m - 1 and z["q_pminus1"] == (m - 1)**2 for z in arms)
        assert r["complete_sum"] == sum(z["sum_term"] for z in r["summands"])
        results.append({
            "m": m, "n": r["n"], "alpha": r["alpha"], "p": r["p"],
            "x": r["x"], "eligible": r["eligible"],
            "all_original_leaves_favorable": True,
            "tag_count": len(r["summands"]),
            "marked_q_p": marked[0]["q_p"],
            "marked_q_pminus1": marked[0]["q_pminus1"],
            "marked_term": marked[0]["sum_term"],
            "arm_q_p": arms[0]["q_p"],
            "arm_q_pminus1": arms[0]["q_pminus1"],
            "arm_term": arms[0]["sum_term"],
            "arm_multiplicity": m,
            "complete_sum": r["complete_sum"],
            "polynomial_closed_form_matches_dp": True,
            "coefficients": r["poly"] if m == 120 else None,
        })
    print(json.dumps(results, indent=2))


if __name__ == "__main__":
    main()
