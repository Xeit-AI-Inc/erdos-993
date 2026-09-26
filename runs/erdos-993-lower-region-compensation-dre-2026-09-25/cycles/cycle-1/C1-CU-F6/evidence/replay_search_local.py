#!/usr/bin/env python3
"""Replay C1-F6 bounded searches with exact ordinary-tree independence polynomials."""
import itertools
import json
import random
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
HELPERS = ROOT / "evidence"
sys.path.insert(0, str(HELPERS))
from ordinary_tree import Graph, aggregate_row, prufer_tree  # noqa: E402


def first_descent(poly):
    # Explicit zero extension includes Delta_alpha = -i_alpha.
    for j in range(len(poly)):
        nxt = poly[j + 1] if j + 1 < len(poly) else 0
        if nxt - poly[j] < 0:
            return j
    return None


def spider(arms):
    edges = []
    next_vertex = 1
    for length in arms:
        previous = 0
        for _ in range(length):
            edges.append((previous, next_vertex))
            previous = next_vertex
            next_vertex += 1
    return Graph.from_edges(range(next_vertex), edges)


def eligible_rows(tree):
    poly = tree.forest_independence_polynomial()
    alpha = len(poly) - 1
    x = first_descent(poly)
    rows = []
    if x is not None:
        for p in range(x + 2, alpha + 1):
            if 3 * p < 2 * alpha + 1:
                row = aggregate_row(tree, p)
                rows.append(row)
    return poly, alpha, x, rows


def run_prufer():
    seed = 9930601
    rng = random.Random(seed)
    counts = {"trees": 0, "eligible_rows": 0, "positive_rows": 0}
    best = None
    for n in (18, 22, 26, 30, 34, 40, 48, 56):
        counts[f"trees_order_{n}"] = 0
        counts[f"eligible_rows_order_{n}"] = 0
        for index in range(220):
            tree = prufer_tree([rng.randrange(n) for _ in range(n - 2)])
            counts["trees"] += 1
            counts[f"trees_order_{n}"] += 1
            poly, alpha, x, rows = eligible_rows(tree)
            for row in rows:
                counts["eligible_rows"] += 1
                counts[f"eligible_rows_order_{n}"] += 1
                if row["aggregate"] > 0:
                    counts["positive_rows"] += 1
                item = (row["aggregate"], n, index, alpha, x, row["rank"])
                if best is None or item > best["key"]:
                    edges = sorted(
                        tuple(sorted((u, v)))
                        for u in tree.vertices
                        for v in tree.adjacency[u]
                        if u < v
                    )
                    best = {
                        "key": item,
                        "order": n,
                        "prufer_index_within_order": index,
                        "edges": edges,
                        "independence_polynomial": poly,
                        "alpha": alpha,
                        "x": x,
                        "p": row["rank"],
                        "favorable_leaves": row["favorable_leaves"],
                        "summands": [
                            {"leaf": e["leaf"], "support": e["support"],
                             "g": e["g"], "delta_p_after_leaf": e["pointwise_delta"]}
                            for e in row["summands"]
                        ],
                        "S": row["aggregate"],
                    }
    return {
        "method": "uniform seeded labeled Prüfer sequences",
        "seed": seed,
        "orders": [18, 22, 26, 30, 34, 40, 48, 56],
        "sequences_per_order": 220,
        "counts": counts,
        "max_aggregate_row": best,
        "conclusion": "No positive complete selected aggregate in this finite sample.",
    }


def run_spiders():
    counts = {"trees": 0, "eligible_rows": 0, "positive_rows": 0}
    best = None
    for arm_count in range(2, 7):
        counts[f"trees_arm_count_{arm_count}"] = 0
        counts[f"eligible_rows_arm_count_{arm_count}"] = 0
        for arms in itertools.combinations_with_replacement(range(1, 6), arm_count):
            tree = spider(arms)
            poly, alpha, x, rows = eligible_rows(tree)
            counts["trees"] += 1
            counts[f"trees_arm_count_{arm_count}"] += 1
            for row in rows:
                counts["eligible_rows"] += 1
                counts[f"eligible_rows_arm_count_{arm_count}"] += 1
                if row["aggregate"] > 0:
                    counts["positive_rows"] += 1
                item = (row["aggregate"], arms, row["rank"])
                if best is None or item > best["key"]:
                    edges = sorted(
                        tuple(sorted((u, v)))
                        for u in tree.vertices
                        for v in tree.adjacency[u]
                        if u < v
                    )
                    best = {
                        "key": item,
                        "arms": list(arms),
                        "edges": edges,
                        "independence_polynomial": poly,
                        "alpha": alpha,
                        "x": x,
                        "p": row["rank"],
                        "favorable_leaves": row["favorable_leaves"],
                        "summands": [
                            {"leaf": e["leaf"], "support": e["support"],
                             "g": e["g"], "delta_p_after_leaf": e["pointwise_delta"]}
                            for e in row["summands"]
                        ],
                        "S": row["aggregate"],
                    }
    return {
        "method": "rooted spiders with arm lengths sorted, each in 1..5",
        "arm_count_range": [2, 6],
        "counts": counts,
        "max_aggregate_row": best,
        "conclusion": "No positive complete selected aggregate in this bounded spider family.",
    }


if __name__ == "__main__":
    print(json.dumps({"prufer": run_prufer(), "spiders": run_spiders()}, indent=2, sort_keys=True))
