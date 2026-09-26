"""Independent T22 replay using the adjacent pinned evaluator copy; Python 3.11, standard library only."""
import json
import sys
from itertools import combinations

SOURCE_ROOT = str(__import__("pathlib").Path(__file__).resolve().parent)
sys.path.insert(0, SOURCE_ROOT)
import ordinary_tree_checked as O


def coefficient(poly, rank):
    return poly[rank] if 0 <= rank < len(poly) else 0


def multiply_marked_count(H, W, rank):
    """Count rank-sets meeting W at least twice, by subset inclusion-exclusion."""
    total = 0
    for size in range(2, len(W) + 1):
        factor = (-1) ** size * (size - 1)
        for chosen in combinations(W, size):
            remainder = H.remove(H.closed_neighborhood(chosen))
            poly = remainder.forest_independence_polynomial()
            total += factor * coefficient(poly, rank - size)
    return total


def main():
    tree, _ = O.t_family(22)
    p = 34
    k = p - 1
    row = O.aggregate_row(tree, p)
    h = row["alpha"] - 1
    by_type = {}
    for leaf in row["favorable_leaves"]:
        support = tree.support(leaf)
        H = tree.remove({leaf, support})
        W = sorted(tree.adjacency[support] - {leaf})
        R = H.remove(W)
        hp = H.forest_independence_polynomial()
        rp = R.forest_independence_polynomial()
        q_k = coefficient(hp, k) - coefficient(rp, k)
        q_k1 = coefficient(hp, k + 1) - coefficient(rp, k + 1)
        C = multiply_marked_count(H, W, k + 1)
        E = k * q_k1 + C
        D = 2 * (h - k) * q_k - E
        tag = "marked_arm" if support == 1 else "claw_leaf"
        row_type = by_type.setdefault(tag, {
            "count": 0,
            "q_k_per_tag": q_k,
            "q_k_plus_1_per_tag": q_k1,
            "multiply_marked_C_per_tag": C,
            "actual_addability_E_per_tag": E,
            "slack_D_per_tag": D,
            "aggregate_summand_per_tag": O.leaf_data(tree, leaf, p)["g"],
        })
        row_type["count"] += 1

    Q = sum(x["count"] * x["q_k_per_tag"] for x in by_type.values())
    U = sum(x["count"] * x["q_k_plus_1_per_tag"] for x in by_type.values())
    C = sum(x["count"] * x["multiply_marked_C_per_tag"] for x in by_type.values())
    D = sum(x["count"] * x["slack_D_per_tag"] for x in by_type.values())
    target_coefficient = 2 * row["alpha"] + 1 - 3 * p
    data = {
        "scope": "single T_22 tree at p=34; exact tree-DP calculation, not a census",
        "tree_recipe": "one marked path arm root-support-leaf plus 22 root-adjacent K_1,3 branches",
        "tree_order": row["order"],
        "alpha": row["alpha"],
        "first_strict_descent_x": row["first_strict_descent"],
        "p": p,
        "guard_x_plus_2_le_p": row["first_strict_descent"] + 2 <= p,
        "guard_3p_lt_2alpha_plus_1": 3 * p < 2 * row["alpha"] + 1,
        "favorable_leaf_count": len(row["favorable_leaves"]),
        "favorable_leaves": row["favorable_leaves"],
        "tag_types": by_type,
        "Q": Q,
        "U": U,
        "C": C,
        "D": D,
        "D_plus_C": D + C,
        "target_coefficient_2alpha_plus_1_minus_3p": target_coefficient,
        "required_compensation_coefficient_times_Q": target_coefficient * Q,
        "compensation_surplus": D + C - target_coefficient * Q,
        "full_aggregate_S": row["aggregate"],
        "k_times_S": k * row["aggregate"],
        "identity_rhs": target_coefficient * Q - D - C,
        "leaf_term_sum_check": sum(x["count"] * x["aggregate_summand_per_tag"] for x in by_type.values()) == row["aggregate"],
        "incidence_identity_check": k * row["aggregate"] == target_coefficient * Q - D - C,
        "evidence_grade": "bounded_exact_computation",
    }
    assert data["guard_x_plus_2_le_p"] and data["guard_3p_lt_2alpha_plus_1"]
    assert data["leaf_term_sum_check"] and data["incidence_identity_check"]
    print(json.dumps(data, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
