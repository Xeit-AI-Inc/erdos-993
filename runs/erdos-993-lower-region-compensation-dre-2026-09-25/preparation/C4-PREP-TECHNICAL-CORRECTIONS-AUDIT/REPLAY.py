#!/usr/bin/env python3
"""Independent arithmetic checks on the 52 pinned inputs in this audit brief."""

from __future__ import annotations

from collections import Counter
from hashlib import sha256
from itertools import combinations
from math import comb
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
BRIEF = ROOT / "control/C4-PREP-TECHNICAL-CORRECTIONS-AUDIT.json"


def add(a, b):
    result = [0] * max(len(a), len(b))
    for i, value in enumerate(a):
        result[i] += value
    for i, value in enumerate(b):
        result[i] += value
    return result


def mul(a, b):
    result = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            result[i + j] += x * y
    return result


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def delta(a, k):
    return coeff(a, k + 1) - coeff(a, k)


def polynomial(vertices, edges):
    """Fresh rooted-tree DP; handles deletions as an induced forest."""
    vertices = set(vertices)
    adj = {v: set() for v in vertices}
    for a, b in edges:
        if a in vertices and b in vertices:
            adj[a].add(b)
            adj[b].add(a)
    seen = set()

    def walk(v, parent):
        assert v not in seen
        seen.add(v)
        absent, present = [1], [0, 1]
        for w in adj[v]:
            if w == parent:
                continue
            child_absent, child_present = walk(w, v)
            absent = mul(absent, add(child_absent, child_present))
            present = mul(present, child_absent)
        return absent, present

    whole = [1]
    for v in sorted(vertices):
        if v not in seen:
            absent, present = walk(v, None)
            whole = mul(whole, add(absent, present))
    return whole


def graph_values(n, edges, p, x, expected_i=None, expected_f=None, expected_s=None):
    vertices = set(range(n))
    adjacency = {v: set() for v in vertices}
    for a, b in edges:
        adjacency[a].add(b)
        adjacency[b].add(a)
    leaves = sorted(v for v in vertices if len(adjacency[v]) == 1)
    poly = polynomial(vertices, edges)
    alpha = max(k for k, value in enumerate(poly) if value)
    first = next(k for k in range(n + 1) if delta(poly, k) < 0)
    assert first == x
    assert p >= x + 2 and 3 * p < 2 * alpha + 1
    if expected_i is not None:
        assert all(coeff(poly, k) == value for k, value in enumerate(expected_i))
    selected = []
    terms = []
    for v in leaves:
        minus_v = polynomial(vertices - {v}, edges)
        if delta(minus_v, p) < 0:
            selected.append(v)
            support = next(iter(adjacency[v]))
            h_vertices = vertices - {v, support}
            r_vertices = vertices - ({support} | adjacency[support])
            h = polynomial(h_vertices, edges)
            r = polynomial(r_vertices, edges)
            q = coeff(h, p - 1) - coeff(r, p - 1)
            term = delta(h, p - 1) - delta(r, p - 1)
            terms.append({"leaf": v, "support": support, "q": q, "S_term": term})
    if expected_f is not None:
        assert selected == expected_f
    total = sum(item["S_term"] for item in terms)
    if expected_s is not None:
        assert total == expected_s
    return {"i_x": coeff(poly, x), "i_x_plus_1": coeff(poly, x + 1),
            "alpha": alpha, "x": first, "F": selected, "S": total, "terms": terms}


def verify_pins():
    brief = json.loads(BRIEF.read_text())
    for item in brief["allowed_source_files"]:
        path = ROOT / item["path"]
        assert sha256(path.read_bytes()).hexdigest() == item["sha256"], item["path"]
    return len(brief["allowed_source_files"])


def u3_check():
    multiplicities = [2, 3, 3, 3, 3, 3]
    edges = [(0, c) for c in range(1, 7)]
    index = 7
    for center, number in enumerate(multiplicities, 1):
        for _ in range(number):
            edges.append((center, index))
            index += 1
    assert index == 24 and len(edges) == 23
    arm_product = [1]
    for m in multiplicities:
        arm = add([comb(m, k) for k in range(m + 1)], [0, 1])
        arm_product = mul(arm_product, arm)
    submitted = add(arm_product, [0, 1])
    correct = add(arm_product, [0] + [comb(17, k) for k in range(18)])
    direct = polynomial(set(range(24)), edges)
    assert correct == direct
    assert coeff(correct, 2) - coeff(submitted, 2) == 17
    values = graph_values(24, edges, 10, 8)
    assert values["alpha"] == 18 and len(values["F"]) == 17
    assert values["S"] == -122805
    return {"n": 24, "p": 10, "x": values["x"], "alpha": values["alpha"],
            "core_cover_centers": list(range(1, 7)), "connector_root": 0,
            "multiplicities": multiplicities, "edges": edges,
            "degree_two_coefficient_correct": coeff(correct, 2),
            "degree_two_coefficient_submitted": coeff(submitted, 2),
            "degree_two_deficit": 17,
            "coefficient_difference_by_degree": [coeff(correct, k) - coeff(submitted, k)
                                                  for k in range(25)],
            "full_favorable_leaf_count": len(values["F"]), "S": values["S"],
            "composition_count_n24_t0": comb(23, 5),
            "incorrect_composition_count_n24_t0": comb(22, 5),
            "composition_count_n30_t0": comb(29, 5)}


def u2_check():
    # The four-vertex example refutes only the misstated generic index step.
    vertices = set(range(4))
    edges = [(0, 1)]
    marks = [0, 2, 3]
    h = polynomial(vertices, edges)
    avoid = polynomial(vertices - set(marks), edges)
    q1, q2 = coeff(h, 1) - coeff(avoid, 1), coeff(h, 2) - coeff(avoid, 2)
    residuals = []
    adjacency = {v: set() for v in vertices}
    for a, b in edges:
        adjacency[a].add(b)
        adjacency[b].add(a)
    for i, w in enumerate(marks):
        deleted = {w} | adjacency[w] | set(marks[:i])
        j = polynomial(vertices - deleted, edges)
        residuals.append({"mark": w, "vertices": sorted(vertices - deleted),
                          "i0": coeff(j, 0), "i1": coeff(j, 1),
                          "i2": coeff(j, 2), "Delta0": delta(j, 0),
                          "Delta1": delta(j, 1)})
    assert q1 == 3 and q2 == 5
    assert all(row["Delta1"] <= 0 for row in residuals)
    assert q2 - q1 == sum(row["Delta0"] for row in residuals) == 2
    return {"H_edges": edges, "W_order": marks, "q1": q1, "q2": q2,
            "residuals": residuals, "generic_s3_p6": {"r": 4, "d": 3,
            "matching_requirement": 4, "K": 5,
            "generic_rank_gate_holds": False,
            "special_odd_band_applicable_with_four_matching_edges": True}}


def f1_check():
    ledger = json.loads((ROOT / "cycles/cycle-4/C4-F1/EVIDENCE.json").read_text())
    diagnostic = json.loads((ROOT / "control-proposals/C4-F1-ACTUAL-CTX-DIAGNOSTIC.json").read_text())
    indexed_diag = {(item["n"], item["row"]): item for item in diagnostic["rows"]}
    rows = []
    for n in range(8, 17):
        group = ledger["summary"][str(n)]
        assert len(group["eligible_rows_data"]) == group["eligible_rows"]
        for row_index, item in enumerate(group["eligible_rows_data"]):
            values = graph_values(n, item["edges"], item["p"], item["x"],
                                  item["i"], item["F"], item["S"])
            assert values["alpha"] == item["alpha"]
            assert values["terms"] == [{k: term[k] for k in ("leaf", "support", "q", "S_term")}
                                       for term in item["summands"]]
            assert sum(term["q"] for term in values["terms"]) == item["Q"]
            assert sum(term["E"] for term in item["summands"]) == item["E"]
            assert sum(term["C"] for term in item["summands"]) == item["C"]
            x, p, q, e = item["x"], item["p"], item["Q"], item["E"]
            flat = (x + 1) * q - e
            current = (p - 1) * q - e
            true_ctx = (x + 1) * values["i_x_plus_1"] * q - values["i_x"] * e
            assert flat == item["flat_gap"] == item["CTx_gap"]
            assert current == item["current_gap"]
            diag = indexed_diag[(n, row_index)]
            assert (flat, true_ctx, q, e) == (diag["flat_gap"], diag["true_CTx_gap"],
                                                diag["Q"], diag["E"])
            assert p == x + 2 and item["F"] == item["leaves"] and item["S"] < 0
            rows.append({"n": n, "row": row_index, "p": p, "x": x,
                         "i_x": values["i_x"], "i_x_plus_1": values["i_x_plus_1"],
                         "Q": q, "E": e, "flat_gap": flat, "current_gap": current,
                         "true_CTx_gap": true_ctx, "S": item["S"]})
    assert len(rows) == ledger["eligible_rows_total"] == 37
    assert len(indexed_diag) == 37
    return {"rows_checked": len(rows), "per_order": dict(Counter(row["n"] for row in rows)),
            "all_flat_positive": all(row["flat_gap"] > 0 for row in rows),
            "all_current_positive": all(row["current_gap"] > 0 for row in rows),
            "all_true_CTx_positive": all(row["true_CTx_gap"] > 0 for row in rows),
            "minimum_flat_gap": min(row["flat_gap"] for row in rows),
            "minimum_true_CTx_gap": min(row["true_CTx_gap"] for row in rows),
            "rows": rows}


def main():
    evidence = {"verified_pinned_files": verify_pins(),
                "method": "Independent rooted-tree polynomial DP for graph values; recorded F1 E and C are summed and checked from the pinned ledger, not recomputed from raw marked-set transport.",
                "U3": u3_check(), "U2": u2_check(), "F1": f1_check()}
    (HERE / "EVIDENCE.json").write_text(json.dumps(evidence, indent=2) + "\n")
    print(json.dumps({"pins": evidence["verified_pinned_files"],
                      "U3_rank2_deficit": evidence["U3"]["degree_two_deficit"],
                      "U2_wrong_index_q2_minus_q1": evidence["U2"]["q2"] - evidence["U2"]["q1"],
                      "F1_rows": evidence["F1"]["rows_checked"],
                      "F1_true_CTx_failures": sum(r["true_CTx_gap"] < 0 for r in evidence["F1"]["rows"])},
                     indent=2))


if __name__ == "__main__":
    main()
