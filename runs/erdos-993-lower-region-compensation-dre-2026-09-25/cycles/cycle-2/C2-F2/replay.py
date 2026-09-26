"""Exact replay for the C2-F2 mixed-arm perturbation; uses the pinned forest evaluator."""
import importlib.util
import json
import sys
from pathlib import Path

EVALUATOR = Path("/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25/inputs/ordinary_tree_checked.py")
SPEC = importlib.util.spec_from_file_location("ordinary_tree_checked", EVALUATOR)
EV = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = EV
SPEC.loader.exec_module(EV)

# Recipe: root 0; distinguished path 0-1-2; one root-adjacent center
# with two pendant leaves; 64 root-adjacent centers with three pendant leaves.
edges = [(0, 1), (1, 2)]
vertices = 3
classes = {2: [], 3: []}
for t, count in ((2, 1), (3, 64)):
    for _ in range(count):
        center = vertices
        vertices += 1
        edges.append((0, center))
        leaves = []
        for _ in range(t):
            leaves.append(vertices)
            edges.append((center, vertices))
            vertices += 1
        classes[t].append((center, leaves))
T = EV.Graph.from_edges(range(vertices), edges)
p = 96
poly = T.forest_independence_polynomial()
a = len(poly) - 1
x = EV.first_strict_descent(poly)
assert (vertices, a, x) == (262, 196, 94)
assert x + 2 <= p and 3 * p < 2 * a + 1

# Check one representative in each automorphism class of original leaves.
representatives = {"distinguished": 2, "two_leaf_arm": classes[2][0][1][0], "three_leaf_arm": classes[3][0][1][0]}
class_data = {}
for name, leaf in representatives.items():
    minus_leaf = T.remove({leaf}).forest_independence_polynomial()
    datum = EV.leaf_data(T, leaf, p)
    class_data[name] = {
        "representative_leaf": leaf,
        "multiplicity": 1 if name == "distinguished" else (2 if name == "two_leaf_arm" else 192),
        "selector_delta_p_T_minus_leaf": EV.delta(minus_leaf, p),
        "selector_polynomial_T_minus_leaf": minus_leaf,
        "h_polynomial": T.remove({leaf, T.support(leaf)}).forest_independence_polynomial(),
        "r_polynomial": T.remove(T.closed_neighborhood({T.support(leaf)})).forest_independence_polynomial(),
        "summand": datum,
    }

favorable = []
for name, data in class_data.items():
    if data["selector_delta_p_T_minus_leaf"] < 0:
        d = data["summand"]
        favorable.extend({"leaf": v, "support": T.support(v), "summand": d["g"], "delta_p_T_minus_leaf": d["pointwise_delta"], "class": name} for v in sorted(T.leaves()) if ((name == "distinguished" and v == 2) or (name == "two_leaf_arm" and v in {z for _, ls in classes[2] for z in ls}) or (name == "three_leaf_arm" and v in {z for _, ls in classes[3] for z in ls})))
S = sum(row["summand"] for row in favorable)
assert len(T.leaves()) == 195
assert len(favorable) == 195
assert S == sum(data["multiplicity"] * data["summand"]["g"] for data in class_data.values())

out = {
    "recipe": {"root": 0, "distinguished_path_edges": [[0, 1], [1, 2]], "two_leaf_star_arms": 1, "three_leaf_star_arms": 64, "arm_centers_adjacent_to_root": True, "vertex_count": vertices, "edge_count": len(edges), "rank_p": p},
    "guards": {"alpha": a, "first_strict_descent_x": x, "x_plus_2_le_p": x + 2 <= p, "3p": 3 * p, "2alpha_plus_1": 2 * a + 1, "strict_lower_region": 3 * p < 2 * a + 1},
    "tree_independence_polynomial_coefficients": poly,
    "first_descent_check_deltas_0_through_x": [EV.delta(poly, j) for j in range(x + 1)],
    "leaf_class_data": class_data,
    "complete_favorable_leaf_summands": favorable,
    "favorable_leaf_count": len(favorable),
    "aggregate_S": S,
    "positive_summand_total": sum(row["summand"] for row in favorable if row["summand"] > 0),
    "negative_summand_total": sum(row["summand"] for row in favorable if row["summand"] < 0),
    "method": "Exact integer tree dynamic programming from inputs/ordinary_tree_checked.py; class expansion uses arm-permutation and within-arm leaf automorphisms."
}
Path(__file__).with_name("EVIDENCE.json").write_text(json.dumps(out, indent=2) + "\n")
print(json.dumps({k: out[k] for k in ("recipe", "guards", "favorable_leaf_count", "aggregate_S", "positive_summand_total", "negative_summand_total")}, indent=2))
