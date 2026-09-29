#!/usr/bin/env python3
"""Exact check of a branch-addition recurrence and its signed correction."""
from math import comb


def add(a, b):
    n = max(len(a), len(b))
    return [(a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0)
            for i in range(n)]


def scale(c, a):
    return [c * x for x in a]


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def power_linear(n):
    return [comb(n, k) for k in range(n + 1)]


def B(r):
    x = power_linear(r)
    if len(x) < 2:
        x += [0] * (2 - len(x))
    x[1] += 1
    return x


def z_shift(a):
    return [0] + a


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def main():
    m, r, N, k = 150, 2, 300, 4
    L_N = power_linear(N)
    E = z_shift(L_N)
    G = [1, 2]
    Q = [1]
    for _ in range(m):
        Q = mul(Q, B(2))
    C = mul(G, Q)
    # All 300 old tip tags have the same deletion main term.
    U_one = mul(mul(G, B(1)), power_linear(0))
    H = [1]
    for _ in range(m - 1):
        H = mul(H, B(2))
    U_one = mul(mul(G, B(1)), H)
    W = add(scale(N, U_one), scale(N, E))

    Bnew, Dnew = B(r), B(r - 1)
    LNr = power_linear(N + r)
    Enew = z_shift(LNr)
    Qnew = mul(Q, Bnew)
    Cnew = mul(G, Qnew)
    Hnew = Q  # cofactor for a newly added branch
    Unew_one = mul(mul(G, Dnew), Hnew)
    Wnew = add(scale(N + r, Unew_one), scale(N + r, Enew))

    # W' = B_r W + r B_(r-1) C + (r L^r - N z) E.
    correction = add(scale(r, mul(power_linear(r), E)),
                     scale(-N, z_shift(E)))
    rhs = add(add(mul(Bnew, W), scale(r, mul(Dnew, C))), correction)
    assert Wnew == rhs

    term_a = r * coeff(mul(power_linear(r), E), k)
    term_b = N * coeff(z_shift(E), k)
    signed = coeff(correction, k)
    assert signed == term_a - term_b < 0
    assert 2 * k <= (N + r) + 2

    # This signed summand is not itself the target mixed minor; retain that
    # distinction by checking the full new weighted-deck minor as well.
    minor = coeff(Wnew, k) * coeff(Cnew, k) - coeff(Wnew, k + 1) * coeff(Cnew, k - 1)
    print({
        "old_profile_counts": {"r2": m, "r3": 0, "r4": 0},
        "appended_arity": r,
        "old_N": N,
        "new_N": N + r,
        "rank_k": k,
        "guard_2k_le_Nplus2": 2 * k <= N + r + 2,
        "recurrence_identity_exact": True,
        "correction_positive_part_at_k": str(term_a),
        "correction_subtracted_part_at_k": str(term_b),
        "signed_correction_at_k": str(signed),
        "full_weighted_minor_at_k": str(minor),
    })


if __name__ == "__main__":
    main()
