"""Bounded exact T_22 witness to noninjective support matching.
Uses the pinned common exact evaluator inputs/ordinary_tree_checked.py.
"""
import importlib.util
import json
import sys

SOURCE = "/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25/scratchpad/C6-CU-F4/inputs/ordinary_tree_checked.py"
spec = importlib.util.spec_from_file_location("ordinary_tree_checked", SOURCE)
ot = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = ot
spec.loader.exec_module(ot)

m, p = 22, 34
T, distinguished_leaf = ot.t_family(m)
row = ot.aggregate_row(T, p)
F = row["favorable_leaves"]
# Three leaves on the first K_1,3 branch, then leaf 2 and 31 further leaves.
B = {4, 5, 6}
for v in T.leaves():
    if len(B) == p + 1:
        break
    if v not in B and all(u not in T.adjacency[v] for u in B):
        B.add(v)
N_B = set().union(*(set(T.adjacency[u]) for u in B))
active = sorted(v for v in F if v in B and (set(T.adjacency[T.support(v)]) & (B - {v})))
# A matching in the B--N(B) incidence graph can use support 3 at most once.
incidence_edges_for_active = [[T.support(v), v] for v in active]
result = {
    "scope": "one exact ordinary tree T_22, p=34; mechanism witness only",
    "tree_recipe": "ordinary_tree_checked.t_family(22): vertices 0..90; edge (0,1),(1,2), and for j=0..21, (0,3+4j),(3+4j,4+4j),(3+4j,5+4j),(3+4j,6+4j)",
    "distinguished_leaf": distinguished_leaf,
    "order": row["order"],
    "alpha": row["alpha"],
    "first_strict_descent": row["first_strict_descent"],
    "p": p,
    "guard_x_plus_2_le_p": row["first_strict_descent"] + 2 <= p,
    "guard_3p_lt_2a_plus_1": 3 * p < 2 * row["alpha"] + 1,
    "original_leaf_count": len(T.leaves()),
    "favorable_leaf_count": len(F),
    "favorable_leaves": F,
    "complete_sum_S": row["aggregate"],
    "summands": [{"leaf": q["leaf"], "support": q["support"], "value": q["g"], "delta_p_after_leaf": q["pointwise_delta"]} for q in row["summands"]],
    "matching_witness": {
        "independent_set_B_rank_p_plus_1": len(B),
        "B": sorted(B),
        "B_is_independent": T.is_independent(B),
        "N_B": sorted(N_B),
        "active_selected_tags_in_B": active,
        "active_tag_count": len(active),
        "active_tag_supports": [T.support(v) for v in active],
        "distinct_support_vertices_available": len({T.support(v) for v in active}),
        "active_incidence_edges_tag_to_support": incidence_edges_for_active,
        "maximum_matching_capacity_inside_this_support_fiber": 1,
        "mechanism_tested": "inject every active selected leaf tag in B into a distinct support vertex via the B--N(B) incidence graph",
        "injective_support_charge_succeeds": len(active) <= len({T.support(v) for v in active})
    }
}
assert result["guard_x_plus_2_le_p"] and result["guard_3p_lt_2a_plus_1"]
assert len(B) == p + 1 and T.is_independent(B)
assert len(F) == 67 and sum(q["value"] for q in result["summands"]) == result["complete_sum_S"]
# active tags are checked in EVIDENCE
assert result["complete_sum_S"] < 0
print(json.dumps(result, indent=2, sort_keys=True))
