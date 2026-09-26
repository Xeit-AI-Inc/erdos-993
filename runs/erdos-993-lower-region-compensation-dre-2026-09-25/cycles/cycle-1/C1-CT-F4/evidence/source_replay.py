"""Exact bounded census for root plus equal hub branches with equal paths."""
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT))
from ordinary_tree_checked import Graph, aggregate_row, delta


def tree(m, d, length):
    edges = []
    cursor = 1
    for _ in range(m):
        hub = cursor
        cursor += 1
        edges.append((0, hub))
        for _ in range(d):
            previous = hub
            for _ in range(length):
                edges.append((previous, cursor))
                previous = cursor
                cursor += 1
    return Graph.from_edges(range(cursor), edges)


rows = []
positive = []
configurations = 0
for m in range(2, 7):
    for d in range(1, 5):
        for length in range(2, 6):
            configurations += 1
            T = tree(m, d, length)
            poly = T.forest_independence_polynomial()
            alpha = len(poly) - 1
            x = next(j for j in range(alpha + 1) if delta(poly, j) < 0)
            for p in range(x + 2, alpha + 1):
                if 3 * p >= 2 * alpha + 1:
                    continue
                row = aggregate_row(T, p)
                item = {
                    "m": m,
                    "d": d,
                    "path_length": length,
                    "order": len(T.vertices),
                    "alpha": alpha,
                    "x": x,
                    "p": p,
                    "favorable_leaf_count": row["favorable_count"],
                    "aggregate": row["aggregate"],
                }
                rows.append(item)
                if row["aggregate"] > 0:
                    positive.append(item)

result = {
    "family": "one root adjacent to m hubs; each hub has d pendant paths, each of length L edges",
    "bounds": {"m": [2, 6], "d": [1, 4], "L": [2, 5]},
    "configuration_count": configurations,
    "eligible_row_count": len(rows),
    "positive_row_count": len(positive),
    "negative_row_count": sum(row["aggregate"] < 0 for row in rows),
    "zero_row_count": sum(row["aggregate"] == 0 for row in rows),
    "positive_rows": positive,
    "sample_rows": [
        row for row in rows
        if (row["m"], row["d"], row["path_length"], row["p"])
        in {(2, 3, 3, 8), (3, 2, 4, 10), (3, 3, 3, 11),
            (3, 3, 3, 12), (4, 2, 3, 11), (4, 2, 4, 13)}
    ],
}
print(json.dumps(result, indent=2, sort_keys=True))
