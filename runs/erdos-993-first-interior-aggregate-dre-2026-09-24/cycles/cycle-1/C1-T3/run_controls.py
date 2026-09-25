#!/usr/bin/env python3
"""Run the frozen r23 actual-tree control battery and write exact JSON."""

from __future__ import annotations

import json
from collections import Counter
from pathlib import Path

from ordinary_tree import (
    Graph,
    aggregate_row,
    all_labeled_trees,
    coefficient,
    corrected_g2_formula,
    delta,
    first_strict_descent,
    kl_spider,
    log_concavity_failures,
    path_formula,
    path_graph,
    relation_row,
    star_graph,
    t_family,
    t_family_formula,
)


ROOT = Path(__file__).resolve().parent


def write_json(name: str, value: object) -> None:
    path = ROOT / name
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def exhaustive_small() -> dict:
    counts = Counter()
    first_failure = None
    relation_failures = []
    g2_failures = []

    for order, index, tree in all_labeled_trees(2, 6):
        counts["trees"] += 1
        counts[f"trees_order_{order}"] += 1
        dp = tree.forest_independence_polynomial()
        brute = tree.brute_independence_polynomial()
        if dp != brute and first_failure is None:
            first_failure = {
                "kind": "coefficient_mismatch",
                "order": order,
                "index": index,
                "dp": dp,
                "brute": brute,
            }

        for leaf in tree.leaves():
            counts["tree_leaf_pairs"] += 1
            if order < 3:
                continue
            counts["rank_two_formula_pairs"] += 1
            support = tree.support(leaf)
            h_graph = tree.remove({leaf, support})
            g2 = coefficient(h_graph.forest_independence_polynomial(), 2)
            formula = corrected_g2_formula(order, len(tree.adjacency[support]))
            if g2 != formula:
                g2_failures.append(
                    {
                        "order": order,
                        "index": index,
                        "leaf": leaf,
                        "actual": g2,
                        "formula": formula,
                    }
                )

        alpha = len(dp) - 1
        crossing = first_strict_descent(dp)
        if crossing is None:
            continue
        for rank in range(crossing + 2, alpha + 1):
            counts["tree_rank_rows"] += 1
            result = relation_row(tree, rank)
            counts["relation_edges"] += result["edge_count"]
            counts["source_objects"] += result["source_count"]
            counts["target_objects"] += result["target_count"]
            if result["source_count"] <= 16:
                counts["exhaustive_cut_rows"] += 1
            if not result["coefficient_identity"] or result["activated_edge_mismatch_count"]:
                relation_failures.append(
                    {"order": order, "index": index, "rank": rank, **result}
                )
            if not result["hall_holds"]:
                counts["hall_deficient_rows"] += 1
                relation_failures.append(
                    {"order": order, "index": index, "rank": rank, **result}
                )

    return {
        "domain": "all labeled trees of orders 2 through 6; relation rows only at admitted ranks p >= x(T)+2",
        "counts": dict(sorted(counts.items())),
        "coefficient_failure": first_failure,
        "rank_two_failure_count": len(g2_failures),
        "rank_two_failures": g2_failures[:10],
        "relation_failure_count": len(relation_failures),
        "relation_failures": relation_failures[:10],
        "pass": first_failure is None and not g2_failures and not relation_failures,
        "ceiling": "bounded exhaustive validation only; not a universal proof",
    }


def nonisomorphic_relation_suite(max_order: int = 12) -> dict:
    """Exercise admitted relation rows on one representative per tree class."""

    import networkx as nx

    counts = Counter()
    failures = []
    first_nonempty = None
    for order in range(2, max_order + 1):
        for index, nx_tree in enumerate(nx.nonisomorphic_trees(order)):
            tree = Graph.from_edges(range(order), nx_tree.edges())
            counts["trees"] += 1
            counts[f"trees_order_{order}"] += 1
            poly = tree.forest_independence_polynomial()
            crossing = first_strict_descent(poly)
            if crossing is None:
                continue
            for rank in range(crossing + 2, len(poly)):
                counts["admitted_rows"] += 1
                result = relation_row(tree, rank)
                counts["source_objects"] += result["source_count"]
                counts["target_objects"] += result["target_count"]
                counts["relation_edges"] += result["edge_count"]
                if result["source_count"]:
                    counts["nonempty_source_rows"] += 1
                    if first_nonempty is None:
                        first_nonempty = {
                            "order": order,
                            "tree_index": index,
                            "rank": rank,
                            **result,
                        }
                if result["source_count"] <= 12:
                    counts["direct_cut_rows"] += 1
                bad = (
                    not result["coefficient_identity"]
                    or result["activated_edge_mismatch_count"] != 0
                    or not result["hall_holds"]
                )
                if bad:
                    failures.append(
                        {"order": order, "tree_index": index, "rank": rank, **result}
                    )
    return {
        "domain": f"one NetworkX nonisomorphic representative of every tree of orders 2 through {max_order}",
        "networkx_version": nx.__version__,
        "counts": dict(sorted(counts.items())),
        "first_nonempty_row": first_nonempty,
        "failure_count": len(failures),
        "failures": failures[:10],
        "pass": not failures and counts["nonempty_source_rows"] > 0,
        "ceiling": "bounded isomorphism-class census only; not a universal proof",
    }


def family_control(branches: int, rank: int) -> dict:
    tree, marked_leaf = t_family(branches)
    dp = tree.forest_independence_polynomial()
    formula = t_family_formula(branches)
    row = aggregate_row(tree, rank)
    marked = next(entry for entry in row["summands"] if entry["leaf"] == marked_leaf)
    star_values = [entry["g"] for entry in row["summands"] if entry["leaf"] != marked_leaf]
    return {
        "branches": branches,
        "order": len(tree.vertices),
        "rank": rank,
        "polynomial_formula_matches_dp": formula == dp,
        "first_strict_descent": row["first_strict_descent"],
        "alpha": row["alpha"],
        "favorable_count": row["favorable_count"],
        "marked_leaf": marked_leaf,
        "marked_g": marked["g"],
        "star_leaf_count": len(star_values),
        "star_g_values": sorted(set(star_values)),
        "aggregate": row["aggregate"],
        "complete_row": row,
    }


def p30_control() -> dict:
    tree = path_graph(30)
    dp = tree.forest_independence_polynomial()
    formula = path_formula(30)
    residual = tree.remove(tree.closed_neighborhood({0}) | tree.closed_neighborhood({2}))
    return {
        "order": 30,
        "path_formula_matches_dp": formula == dp,
        "first_strict_descent": first_strict_descent(dp),
        "p": 10,
        "K_A": 10 - first_strict_descent(dp),
        "B_v": delta(path_graph(28).forest_independence_polynomial(), 10),
        "other_term": delta(path_graph(27).forest_independence_polynomial(), 9),
        "sum": delta(path_graph(28).forest_independence_polynomial(), 10)
        + delta(path_graph(27).forest_independence_polynomial(), 9),
        "residual_vertices": sorted(residual.vertices),
        "residual_order": len(residual.vertices),
        "residual_first_strict_descent": first_strict_descent(
            residual.forest_independence_polynomial()
        ),
        "residual_delta_rank_8": delta(residual.forest_independence_polynomial(), 8),
        "size_bound_2p_minus_3": 17,
        "violates_size_bound": len(residual.vertices) > 17,
    }


def k13_control() -> dict:
    tree = star_graph(3)
    leaf = 1
    support = 0
    f = tree.remove({leaf}).forest_independence_polynomial()
    g = tree.remove({leaf, support}).forest_independence_polynomial()
    return {
        "f": f,
        "g": g,
        "g_2": coefficient(g, 2),
        "false_registry_rhs": 0,
        "corrected_formula": corrected_g2_formula(4, 3),
        "false_registry_equality_holds": coefficient(g, 2) == 0,
    }


def kl_fixture_controls() -> dict:
    fixtures = [
        ("T(3,4,4)", (3, 4, 4)),
        ("T(3,4,5)", (3, 4, 5)),
        ("T(3,5,5)", (3, 5, 5)),
        ("T(3,5,6)", (3, 5, 6)),
        ("T(3,6,6)", (3, 6, 6)),
    ]
    rows = []
    for label, arms in fixtures:
        tree = kl_spider(arms)
        poly = tree.forest_independence_polynomial()
        crossing = first_strict_descent(poly)
        admitted = []
        if crossing is not None:
            for rank in range(crossing + 2, len(poly)):
                row = aggregate_row(tree, rank)
                admitted.append(
                    {
                        "rank": rank,
                        "favorable_count": row["favorable_count"],
                        "aggregate": row["aggregate"],
                    }
                )
        rows.append(
            {
                "label": label,
                "arms": list(arms),
                "order": len(tree.vertices),
                "alpha": len(poly) - 1,
                "first_strict_descent": crossing,
                "log_concavity_failures": log_concavity_failures(poly),
                "admitted_rows": admitted,
                "positive_aggregate_rows": [r for r in admitted if r["aggregate"] > 0],
            }
        )
    return {
        "fixtures": rows,
        "all_evaluated_without_log_concavity_filter": len(rows) == len(fixtures),
        "all_have_log_concavity_failure": all(r["log_concavity_failures"] for r in rows),
        "positive_aggregate_row_count": sum(len(r["positive_aggregate_rows"]) for r in rows),
        "ceiling": "five named fixtures only; the evaluator does not assume log-concavity",
    }


def main() -> None:
    small = exhaustive_small()
    relation_suite = nonisomorphic_relation_suite()
    t22 = family_control(22, 34)
    t60 = family_control(60, 90)
    p30 = p30_control()
    k13 = k13_control()
    kl = kl_fixture_controls()

    expected = {
        "t22": {
            "favorable_count": 67,
            "marked_g": 212336130412243110,
            "aggregate": -498754180547001418536,
        },
        "t60": {
            "favorable_count": 181,
            "marked_g": 2935177632783649903488454322226807645411570590073000,
            "aggregate": -1058142362147652597702654588268394677176033202323316960380,
        },
        "p30": {
            "first_strict_descent": 9,
            "B_v": -60554,
            "other_term": -48620,
            "residual_order": 26,
            "residual_first_strict_descent": 7,
            "residual_delta_rank_8": -26962,
        },
    }

    comparisons = {
        "t22": {
            key: t22[key] == value for key, value in expected["t22"].items()
        },
        "t60": {
            key: t60[key] == value for key, value in expected["t60"].items()
        },
        "p30": {
            key: p30[key] == value for key, value in expected["p30"].items()
        },
    }
    all_expected_match = all(
        result for group in comparisons.values() for result in group.values()
    )

    write_json("small-exhaustive.json", small)
    write_json("nonisomorphic-relation-through12.json", relation_suite)
    write_json("t22-order91.json", t22)
    write_json("t60-order243.json", t60)
    write_json("p30-scope-control.json", p30)
    write_json("k13-rank2-control.json", k13)
    write_json("kl-non-lc-fixtures.json", kl)
    write_json(
        "summary.json",
        {
            "small_exhaustive_pass": small["pass"],
            "nonisomorphic_relation_pass": relation_suite["pass"],
            "structured_formula_checks": {
                "t22": t22["polynomial_formula_matches_dp"],
                "t60": t60["polynomial_formula_matches_dp"],
                "p30": p30["path_formula_matches_dp"],
            },
            "expected_value_comparisons": comparisons,
            "all_expected_values_match": all_expected_match,
            "k13_corrected_formula_matches": k13["g_2"] == k13["corrected_formula"],
            "k13_false_registry_formula_reproduced_as_false": not k13[
                "false_registry_equality_holds"
            ],
            "kl_fixtures_evaluated_without_lc_filter": kl[
                "all_evaluated_without_log_concavity_filter"
            ],
            "kl_fixtures_confirmed_non_lc": kl["all_have_log_concavity_failure"],
            "pass": small["pass"]
            and relation_suite["pass"]
            and all_expected_match
            and t22["polynomial_formula_matches_dp"]
            and t60["polynomial_formula_matches_dp"]
            and p30["path_formula_matches_dp"]
            and k13["g_2"] == k13["corrected_formula"]
            and not k13["false_registry_equality_holds"]
            and kl["all_evaluated_without_log_concavity_filter"]
            and kl["all_have_log_concavity_failure"],
            "ceiling": "Mandatory controls only. Negative aggregate rows and bounded Hall success do not prove O14 or fixed-Gamma Hall.",
        },
    )


if __name__ == "__main__":
    main()
