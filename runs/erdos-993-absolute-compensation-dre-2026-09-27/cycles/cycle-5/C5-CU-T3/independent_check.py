from math import comb
import json


def conv(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, av in enumerate(a):
        for j, bv in enumerate(b):
            out[i + j] += av * bv
    return out


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def branch(r):
    # Coefficients in z, directly from (1+z)^r+z.
    return [comb(r, k) + (1 if k == 1 else 0) for k in range(r + 1)]


def profile(counts, tip_r):
    sizes = (2, 3, 4)
    nbranches = sum(counts)
    N = sum(r * c for r, c in zip(sizes, counts))
    h = 1 + sum(w * c for w, c in zip((2, 4, 7), counts))
    C = [1, 2]  # G
    for r, count in zip(sizes, counts):
        for _ in range(count):
            C = conv(C, branch(r))
    U = [1, 2]  # G, with one represented r_i branch replaced by B_(r_i-1).
    for r, count in zip(sizes, counts):
        repeat = count - (1 if r == tip_r else 0)
        for _ in range(repeat):
            U = conv(U, branch(r))
    U = conv(U, branch(tip_r - 1))
    return N, h, C, U, nbranches


def first_descent(counts, C):
    N = sum(r * c for r, c in zip((2, 3, 4), counts))
    # P=C+z(1+z)^(N+1), with exact zero extension.
    P = [coeff(C, k) + (comb(N + 1, k - 1) if 1 <= k <= N + 2 else 0)
         for k in range(N + 3)]
    return next(k for k in range(len(P)) if coeff(P, k + 1) < coeff(P, k))


def check(counts, tip_r, k):
    N, h, C, U, m = profile(counts, tip_r)
    E_k = comb(N, k - 1) if 1 <= k <= N + 1 else 0
    E_kp1 = comb(N, k) if 0 <= k <= N else 0
    Ck, Ckm1 = coeff(C, k), coeff(C, k - 1)
    Uk = coeff(U, k)
    me = E_k * Ck - E_kp1 * Ckm1
    factor = (k + 1) * (h - k + 1)
    exact = (h + 1) * Uk * Ck + factor * me
    full = (Uk + E_k) * Ck - (coeff(U, k + 1) + E_kp1) * Ckm1
    coarse = 2 * (N + 2 - k) * (h + 1) * Uk - E_k * (N - k - 1) * factor
    return {"counts": list(counts), "tip_r": tip_r, "N": N, "h": h,
            "k": k, "guard_1_le_k": 1 <= k,
            "guard_2k_le_N_plus_2": 2 * k <= N + 2,
            "U_k": Uk, "C_k": Ck, "C_km1": Ckm1,
            "E_k": E_k, "E_kp1": E_kp1, "M_E": me,
            "exact_surplus": exact, "full_tip_minor": full,
            "coarse_margin": coarse}


rows = []
for counts, r, ranks in [
    ((0, 0, 1), 4, (1, 2, 3)),
    ((0, 0, 4), 4, (7, 8, 9)),
    ((0, 22, 0), 3, (26, 27, 28)),
    ((0, 0, 24), 4, (48, 49, 50)),
]:
    N, h, C, _, m = profile(counts, r)
    x = first_descent(counts, C)
    for k in ranks:
        row = check(counts, r, k)
        alpha = N + 2
        row.update({"actual_first_descent_x": x, "alpha": alpha,
                    "actual_rank_eligible": x + 2 <= k and 3 * k < 2 * alpha + 1 and 2 * k <= alpha,
                    "selected_tip_multiplicity": r,
                    "profile_branches": m})
        rows.append(row)

# The correct substitution for the crude ratio bound has positive denominators:
# C[k]/C[k-1] >= 2(N+2-k)/(3k).  The resulting condition is coarse_margin>=0.
# Check that direction and compare exact condition at the known failing example.
assert all(row["guard_1_le_k"] and row["guard_2k_le_N_plus_2"] for row in rows if row["counts"] == [0, 0, 4] and row["k"] == 8)
print(json.dumps(rows, indent=2))
