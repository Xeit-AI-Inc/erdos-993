"""Independent exact audit of two paired-minor controls (integer arithmetic only)."""
from math import comb
import json


def add(a, b):
    n = max(len(a), len(b))
    return [(a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0) for i in range(n)]


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def scale(a, k):
    return [k * x for x in a]


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def shift_z(a):
    return [0] + a


def Lpow(n):
    return [comb(n, k) for k in range(n + 1)]


def B(r):
    a = Lpow(r)
    a = a + [0] * max(0, 2 - len(a))
    a[1] += 1
    return a


def G():
    return [1, 2]


def first_descent(p):
    # Include the terminal degree; zero extension makes the first terminal fall visible.
    for k in range(len(p) + 1):
        if coeff(p, k + 1) - coeff(p, k) < 0:
            return k
    raise AssertionError("finite-support polynomial must eventually descend")


def bivar_add(a, b):
    n = max(len(a), len(b))
    return [add(a[i] if i < len(a) else [], b[i] if i < len(b) else []) for i in range(n)]


def bivar_mul(a, b):
    c = [[] for _ in range(len(a) + len(b) - 1)]
    for i, ai in enumerate(a):
        for j, bj in enumerate(b):
            c[i + j] = add(c[i + j], mul(ai, bj))
    return c


def bivar_scale(a, k):
    return [scale(x, k) for x in a]


def bivar_zcoeff(a, k):
    return [coeff(poly, k) for poly in a]


def activity_factor(r):
    # Coefficients in t of L^r + t z.
    return [Lpow(r), [0, 1]]


def control_activity_layers():
    # Homogeneous (4,4,4), with the first branch distinguished as a tip deletion.
    n, r, m, k = 18, 4, 3, 7
    lv = Lpow(r)
    other = activity_factor(r)
    g = [[1, 2]]
    c = bivar_mul(bivar_mul(g, [B(r)]), bivar_mul(other, other))
    u = bivar_mul(bivar_mul(g, [B(r - 1)]), bivar_mul(other, other))
    e = [shift_z(Lpow(12))]
    a = bivar_add(u, e)
    margin = add(
        mul(bivar_zcoeff(a, k), bivar_zcoeff(c, k)),
        scale(mul(bivar_zcoeff(a, k + 1), bivar_zcoeff(c, k - 1)), -1),
    )
    # Parent at activity one, to establish that this negative layer is not a target failure.
    C = mul(mul(G(), B(r)), mul(B(r), B(r)))
    E = shift_z(Lpow(12))
    Ai = add(mul(mul(G(), B(r - 1)), mul(B(r), B(r))), E)
    P = add(C, shift_z(Lpow(13)))
    x = first_descent(P)
    return {
        "profile_counts_a2_a3_a4": [0, 0, 3], "m": m, "N": 12, "n": n,
        "activity_minor_rank_k": k, "guard_1_le_k_2k_le_N_plus_2": 1 <= k and 2 * k <= 14,
        "activity_margin_coefficients_low_to_high": [str(v) for v in margin],
        "t3_coefficient": str(coeff(margin, 3)),
        "full_t1_margin": str(sum(margin)),
        "actual_parent_first_descent_x": x,
        "no_actual_lower_half_p": not any(x + 2 <= p and 3 * p < 29 and 2 * p <= 14 for p in range(x + 2, 40)),
        "full_tip_shifted_margin_at_k": str(coeff(Ai, k) * coeff(C, k) - coeff(Ai, k + 1) * coeff(C, k - 1)),
    }


def control_actual_eligibility():
    # Homogeneous arity 3, m=22; exact path-star coefficient formulas.
    m, r = 22, 3
    N = m * r
    C = G()
    Q = [1]
    for _ in range(m):
        Q = mul(Q, B(r))
    C = mul(C, Q)
    E = shift_z(Lpow(N))
    H = [1]
    for _ in range(m - 1):
        H = mul(H, B(r))
    Ai = add(mul(mul(G(), B(r - 1)), H), E)
    A0 = add(mul([1, 1], Q), E)
    P = add(C, shift_z(Lpow(N + 1)))
    x = first_descent(P)
    alpha, p = N + 2, 34
    j = p - 2
    e0 = coeff(A0, p + 1) - coeff(A0, p) < 0
    ei = coeff(Ai, p + 1) - coeff(Ai, p) < 0
    e_only_k = 27
    return {
        "profile_counts_a2_a3_a4": [0, 22, 0], "m": m, "N": N, "n": N + m + 3,
        "actual_parent_first_descent_x": x, "p": p, "j_p_minus_2": j,
        "strict_selectors_e0_ei": [e0, ei], "selected_tag_weight_b": int(e0) + m * r * int(ei),
        "guards_x_plus_2_le_p_3p_lt_2alpha_plus_1_2p_le_alpha": [x + 2 <= p, 3 * p < 2 * alpha + 1, 2 * p <= alpha],
        "isolated_E_shifted_margin_at_k27": str(coeff(E, e_only_k) * coeff(C, e_only_k) - coeff(E, e_only_k + 1) * coeff(C, e_only_k - 1)),
        "full_tip_shifted_margin_at_k27": str(coeff(Ai, e_only_k) * coeff(C, e_only_k) - coeff(Ai, e_only_k + 1) * coeff(C, e_only_k - 1)),
        "full_tip_shifted_margin_at_actual_j": str(coeff(Ai, j) * coeff(C, j) - coeff(Ai, j + 1) * coeff(C, j - 1)),
    }


if __name__ == "__main__":
    print(json.dumps({"activity_layer_control": control_activity_layers(), "actual_eligibility_control": control_actual_eligibility()}, indent=2))
