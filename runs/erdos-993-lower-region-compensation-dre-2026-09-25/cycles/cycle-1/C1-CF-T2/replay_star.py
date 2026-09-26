from math import comb
import json


def delta(poly, j):
    def c(k):
        return poly[k] if 0 <= k < len(poly) else 0
    return c(j + 1) - c(j)


def binomial_poly(n):
    return [comb(n, j) for j in range(n + 1)]


def add_at(poly, j, amount):
    out = list(poly)
    out[j] += amount
    return out

# T=K_(1,12), T-v=K_(1,11), and pruning one leaf plus its support leaves 11 K1s.
t = add_at(binomial_poly(12), 1, 1)
t_minus_v = add_at(binomial_poly(11), 1, 1)
h = binomial_poly(11)
r = [1]
p = 8
fav = [delta(t_minus_v, p) < 0] * 12
summand = delta(h, p - 1) - delta(r, p - 1)
first_descent = next(j for j in range(len(t)) if delta(t, j) < 0)
pruned_first_descent = next(j for j in range(len(h)) if delta(h, j) < 0)
result = {
    "tree": "K_(1,12)",
    "p": p,
    "T_coefficients_i0_through_ialpha": t,
    "T_minus_v_coefficients_i0_through_ialpha": t_minus_v,
    "H_11_isolates_coefficients_i0_through_ialpha": h,
    "R_empty_coefficients": r,
    "alpha_T": len(t) - 1,
    "x_T": first_descent,
    "guard_x_plus_2_le_p": first_descent + 2 <= p,
    "guard_3p_lt_2a_plus_1": 3 * p < 2 * (len(t) - 1) + 1,
    "selector_delta_p_T_minus_v": delta(t_minus_v, p),
    "favorable_original_leaf_tags": len(fav),
    "per_tag_summand": summand,
    "full_S": sum(summand for _ in fav),
    "pruned_graph": "11 isolated vertices",
    "alpha_pruned": len(h) - 1,
    "x_pruned": pruned_first_descent,
    "pruned_guard_x_plus_2_le_p": pruned_first_descent + 2 <= p,
    "pruned_guard_3p_lt_2a_plus_1": 3 * p < 2 * (len(h) - 1) + 1,
    "delta5_pruned": delta(h, 5),
    "delta6_pruned": delta(h, 6),
}
print(json.dumps(result, indent=2))
