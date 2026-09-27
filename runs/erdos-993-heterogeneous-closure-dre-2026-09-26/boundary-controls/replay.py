#!/usr/bin/env python3
"""Independent exact coefficient reconstruction and literal ordinary-tree replay."""

import json
from functools import lru_cache
from fractions import Fraction
from math import comb
from pathlib import Path

from ordinary_tree_checked import Graph

HERE = Path(__file__).resolve().parent
SOURCE = HERE / "pinned_printed_rows.json"
M = 150
N = 4 * M
ALPHA = N + 2
Q = N + 1
J = 292
P_RANK = J + 2
GF4 = (3, 9, 7, 2)
GB3 = (1, 6, 11, 7, 2)


def b(n, k):
    return comb(n, k) if 0 <= k <= n else 0


@lru_cache(None)
def qcoeff(m, k):
    # (L^4+z)^m: choose the centers taking z, then choose free tips.
    return sum(b(m, a) * b(4 * (m - a), k - a) for a in range(m + 1))


def shifted(poly, k, base):
    return sum(c * base(k - h) for h, c in enumerate(poly))


def pc(k):
    return qcoeff(M, k) + 2 * qcoeff(M, k - 1) + b(Q, k - 1)


def a0c(k):
    return qcoeff(M, k) + qcoeff(M, k - 1) + b(N, k - 1)


def aic(k):
    return shifted(GB3, k, lambda t: qcoeff(M - 1, t)) + b(N, k - 1)


def tc(k):
    return shifted(GF4, k, lambda t: qcoeff(M - 1, t))


def uc(k):
    # Empty and exactly one chosen center among the other 149 centers.
    return shifted(GF4, k, lambda t: b(N - 4, t)) + (M - 1) * shifted(
        GF4, k - 1, lambda t: b(N - 8, t)
    )


def graph():
    vertices = list(range(3 + 5 * M))
    edges = [(0, 1), (1, 2)]
    for i in range(M):
        center = 3 + 5 * i
        edges.append((0, center))
        edges.extend((center, center + h) for h in range(1, 5))
    return Graph.from_edges(vertices, edges)


def graph_coeff(g):
    return g.forest_independence_polynomial()


def cf(poly, k):
    return poly[k] if 0 <= k < len(poly) else 0


def delta(poly, k):
    return cf(poly, k + 1) - cf(poly, k)


def automorphism_checks(g):
    base_edges = {frozenset((u, v)) for u in g.vertices for v in g.adjacency[u]}
    for i in range(M):
        for h in range(1, 5):
            mapping = list(range(3 + 5 * M))
            c = 3 + 5 * i
            for off in range(5):
                mapping[3 + off], mapping[c + off] = mapping[c + off], mapping[3 + off]
            mapping[4], mapping[3 + h] = mapping[3 + h], mapping[4]
            assert mapping[4] == c + h
            assert {frozenset((mapping[u], mapping[v])) for edge in base_edges for u, v in [tuple(edge)]} == base_edges
            assert g.support(c + h) == c
    return M * 4


def main():
    slopes = [pc(k + 1) - pc(k) for k in range(ALPHA + 1)]
    x = next(k for k, v in enumerate(slopes) if v < 0)
    d0 = a0c(P_RANK + 1) - a0c(P_RANK)
    di = aic(P_RANK + 1) - aic(P_RANK)
    D = b(N, J + 1) - b(N, J)
    Tj, Tnext, U = tc(J), tc(J + 1), uc(J)
    debt = (N + 1) * (Q - J) * D
    truncated = N * U
    full = N * Tj
    S = (N + 1) * D + N * (Tnext - Tj)

    g = graph()
    assert len(g.vertices) == 753
    assert len(g.leaves()) == 601
    assert len({frozenset((u, v)) for u in g.vertices for v in g.adjacency[u]}) == 752
    assert g.support(2) == 1 and g.support(4) == 3
    leaf_automorphisms = automorphism_checks(g)
    pg = graph_coeff(g)
    a0g = graph_coeff(g.remove({2}))
    aig = graph_coeff(g.remove({4}))
    h0 = graph_coeff(g.remove({2, 1}))
    r0 = graph_coeff(g.remove(g.closed_neighborhood({1})))
    hi = graph_coeff(g.remove({4, 3}))
    ri = graph_coeff(g.remove(g.closed_neighborhood({3})))
    endpoint_g = delta(h0, P_RANK - 1) - delta(r0, P_RANK - 1)
    tip_g = delta(hi, P_RANK - 1) - delta(ri, P_RANK - 1)
    graph_S = endpoint_g + N * tip_g

    assert len(pg) - 1 == ALPHA
    assert all(cf(pg, k) == pc(k) for k in range(ALPHA + 2))
    assert all(cf(a0g, k) == a0c(k) for k in range(ALPHA + 2))
    assert all(cf(aig, k) == aic(k) for k in range(ALPHA + 2))
    assert all(cf(h0, k) - cf(r0, k) == b(N, k - 1) for k in range(ALPHA + 2))
    assert all(cf(hi, k) - cf(ri, k) == b(N, k - 1) + tc(k - 1)
               for k in range(ALPHA + 2))
    assert delta(pg, x - 1) == slopes[x - 1] and delta(pg, x) == slopes[x]
    assert all(delta(pg, k) >= 0 for k in range(x))
    assert delta(a0g, P_RANK) == d0 < 0
    assert delta(aig, P_RANK) == di < 0
    assert endpoint_g == D
    assert tip_g == D + Tnext - Tj
    assert graph_S == S < 0
    assert U <= Tj and truncated < debt < full
    assert x + 2 == P_RANK and 3 * P_RANK < 2 * ALPHA + 1 and 2 * P_RANK <= ALPHA

    exact = {
        "hypotheses": {"r": 4, "m": M, "N": N, "n": len(g.vertices), "alpha": ALPHA,
                       "q": Q, "x": x, "p": P_RANK, "j": J},
        "eligibility": {"x_plus_2_le_p": x + 2 <= P_RANK,
                        "3p_lt_2alpha_plus_1": 3 * P_RANK < 2 * ALPHA + 1,
                        "2p_le_alpha": 2 * P_RANK <= ALPHA,
                        "first_eligible_lower_half": x + 2 == P_RANK},
        "parent": {"all_slopes_before_x_nonnegative": all(v >= 0 for v in slopes[:x]),
                   "slope_x_minus_1": slopes[x - 1], "slope_x": slopes[x]},
        "deletions": {"endpoint_slope": d0, "tip_slope": di,
                      "endpoint_strict": d0 < 0, "all_600_tips_strict_by_automorphism": di < 0,
                      "leaf_automorphisms_checked": leaf_automorphisms,
                      "selected_original_tags": N + 1},
        "coefficients": {"D_j": D, "T_j": Tj, "T_j_plus_1": Tnext,
                         "U_j": U, "T_j_minus_U_j": Tj - U,
                         "q_minus_j": Q - J},
        "payment": {"truncated_mass": truncated, "debt": debt,
                    "truncated_slack": truncated - debt,
                    "full_mass": full, "full_mass_slack": full - debt,
                    "truncated_to_debt_ratio": str(Fraction(truncated, debt))},
        "aggregate": {"endpoint_g": endpoint_g, "each_tip_g": tip_g,
                      "S_from_coefficients": S, "S_from_literal_graph": graph_S},
        "literal_graph": {"vertices": len(g.vertices), "edges": 752,
                          "original_leaves": len(g.leaves()),
                          "alpha_from_polynomial": len(pg) - 1,
                          "full_parent_coefficients_match": True,
                          "endpoint_and_tip_deletions_match": True,
                          "support_neighborhood_differences_match": True},
    }
    source = json.loads(SOURCE.read_text())
    case = next(z for z in source["cases"] if z["r"] == 4 and z["m"] == M)
    row = next(z for z in case["rows"] if z["p"] == P_RANK)
    compare = {
        "x": (case["x"], x), "deletion_endpoint_slope": (row["deletion_endpoint_slope"], d0),
        "deletion_tip_slope": (row["deletion_tip_slope"], di),
        "parent_pre_descent_slope": (row["parent_pre_descent_slope"], slopes[x - 1]),
        "parent_descent_slope": (row["parent_descent_slope"], slopes[x]),
        "actual_full_mass": (row["actual_full_mass"], full),
        "truncated_mass": (row["truncated_mass"], truncated),
        "mass_debt": (row["mass_debt"], debt),
        "full_mass_slack": (row["full_mass_slack"], full - debt),
        "truncated_slack": (row["truncated_slack"], truncated - debt),
        "selected_aggregate": (row["selected_aggregate"], S),
        "selected_tags": (row["selected_tags"], N + 1),
    }
    assert all(a == z for a, z in compare.values())
    exact["printed_row_comparison"] = {"all_fields_match": True, "fields": list(compare)}
    (HERE / "evidence.json").write_text(json.dumps(exact, indent=2) + "\n")
    print(json.dumps({"passed": True, "x": x, "p": P_RANK,
                      "truncated_slack": truncated - debt, "full_mass_slack": full - debt,
                      "S": S, "printed_fields_matched": len(compare)}, indent=2))


if __name__ == "__main__":
    main()
