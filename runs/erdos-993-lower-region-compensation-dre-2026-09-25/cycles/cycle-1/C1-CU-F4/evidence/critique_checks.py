"""Independent structural checks for the sealed symmetric-hub census."""
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE / "replay_inputs"))
from ordinary_tree_checked import Graph


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a): out[i] += x
    for i, x in enumerate(b): out[i] += x
    return out


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): out[i + j] += x * y
    return out


def power(a, n):
    out = [1]
    for _ in range(n): out = mul(out, a)
    return out


def path_poly(L):
    A0, A1 = [1], [1, 1]
    if L == 0: return A0
    if L == 1: return A1
    for _ in range(2, L + 1): A0, A1 = A1, add(A1, [0] + A0)
    return A1


def graph(m, d, L):
    edges, cursor = [], 1
    for _ in range(m):
        hub = cursor; cursor += 1; edges.append((0, hub))
        for _ in range(d):
            previous = hub
            for _ in range(L):
                edges.append((previous, cursor)); previous = cursor; cursor += 1
    return Graph.from_edges(range(cursor), edges)


checks = []
for m in range(2, 7):
    for d in range(1, 5):
        for L in range(2, 6):
            T = graph(m, d, L)
            A = path_poly(L)
            Aprev = path_poly(L - 1)
            Q = add(power(A, d), [0] + power(Aprev, d))
            formula = add(power(Q, m), [0] + power(A, d * m))
            dp = T.forest_independence_polynomial()
            checks.append({"m": m, "d": d, "L": L, "order": len(T.vertices),
                           "edge_count": sum(map(len, T.adjacency.values())) // 2,
                           "tree_polynomial_matches_formula": dp == formula,
                           "leading_coefficient": dp[-1]})

assert len(checks) == 80
assert all(row["edge_count"] == row["order"] - 1 for row in checks)
assert all(row["tree_polynomial_matches_formula"] for row in checks)
Path(HERE / "structural_checks.json").write_text(json.dumps({
    "configuration_count": len(checks),
    "edge_count_equals_order_minus_one_for_all": True,
    "hub_formula_matches_tree_dp_for_all": True,
    "formula": "I_T=Q^m+z*A_L^(dm), Q=A_L^d+z*A_(L-1)^d",
    "rows": checks,
}, indent=2, sort_keys=True) + "\n")
print("80/80 connected-tree edge counts and hub-polynomial comparisons passed")
