#!/usr/bin/env python3
"""Independent exact boundary and fresh larger-tree checks for C2-CF-T2."""
from math import comb
import json


def star(m):
    # K_{1,m}, center 0, leaves 1,...,m. m=11 is larger than C2-T2's m=10.
    n = m + 1
    coeff = [1, n] + [comb(m, k) for k in range(2, m + 1)] + [0]
    x = next(k for k in range(len(coeff) - 1) if coeff[k + 1] < coeff[k])
    alpha = m
    p = alpha - 2
    deleted_leaf_coeff = [1, m] + [comb(m - 1, k) for k in range(2, m)] + [0]
    favorable_difference = deleted_leaf_coeff[p + 1] - deleted_leaf_coeff[p]
    # H has m-1 isolated vertices, R has none; k=p-1.
    k = p - 1
    qk = comb(m - 1, k)
    qk1 = comb(m - 1, k + 1)
    local = qk1 - qk
    assert x + 2 <= p and favorable_difference < 0
    assert k * qk1 <= 2 * ((m - 1) - k) * qk
    return {
        "edges": [[0, j] for j in range(1, m + 1)],
        "order": n, "alpha": alpha, "x": x, "p": p,
        "favorable_delta_p_after_leaf_deletion": favorable_difference,
        "q_k": qk, "q_k_plus_1": qk1, "k": k,
        "local_summand": local, "complete_sum": m * local,
    }


def cover_floor(n):
    base = (n - 1) * (n - 2) * (n - 9) // 6
    cover_size = n - 6
    if cover_size == 1:
        degree_floor = comb(n - 1, 2)
    else:
        assert n == 8 and cover_size == 2
        degree_floor = min(
            comb(d, 2) + comb(e, 2)
            for d in range(n) for e in range(n)
            if d + e >= n - 1
        )
    return {"order": n, "base_delta2": base,
            "cover_degree_sum_floor": degree_floor,
            "delta2_floor": base + degree_floor}


if __name__ == "__main__":
    result = {"alpha6_cover_bounds": [cover_floor(7), cover_floor(8)],
              "fresh_larger_eligible_star": star(11)}
    assert result["alpha6_cover_bounds"][0]["delta2_floor"] == 5
    assert result["alpha6_cover_bounds"][1]["delta2_floor"] == 2
    assert result["fresh_larger_eligible_star"]["complete_sum"] == -385
    print(json.dumps(result, indent=2, sort_keys=True))
