#!/usr/bin/env python3
"""Independent integer and rational checks for the sealed C2 synthesis."""
import json
from fractions import Fraction
from math import comb, factorial


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for h, y in enumerate(b):
            c[i + h] += x * y
    return c


def add(a, b):
    return [(a[k] if k < len(a) else 0) + (b[k] if k < len(b) else 0)
            for k in range(max(len(a), len(b)))]


def coefficient(a, k):
    return a[k] if 0 <= k < len(a) else 0


def difference(a, k):
    return coefficient(a, k + 1) - coefficient(a, k)


def choose(n, k):
    return comb(n, k) if n >= 0 and 0 <= k <= n else 0


def power(a, n):
    v = [1]
    for _ in range(n):
        v = mul(v, a)
    return v


L, G = [1, 1], [1, 2]
B = {r: add([choose(r, k) for k in range(r + 1)], [0, 1]) for r in (1, 2, 3, 4)}
F = {r: [sum(choose(h, k) for h in range(r - 1)) for k in range(r - 1)] for r in (2, 3, 4)}


def profile(counts):
    branches = [r for r, count in zip((2, 3, 4), counts) for _ in range(count)]
    N = sum(branches)
    q, alpha, m = N + 1, N + 2, len(branches)
    Q = [1]
    for r in branches:
        Q = mul(Q, B[r])
    C = mul(G, Q)
    P = add(C, [0] + [choose(q, k) for k in range(q + 1)])
    x = next(k for k in range(len(P)) if difference(P, k) < 0)
    p, j, delta = x + 2, x, q - x
    assert x + 2 <= p and 3 * p < 2 * alpha + 1 and 2 * p <= alpha
    base = [0] + [choose(N, k) for k in range(N + 1)]
    A0 = add(mul(L, Q), base)
    e0 = int(difference(A0, p) < 0)
    by_type = {}
    b, A = e0, 0
    for r in sorted(set(branches)):
        H = [1]
        omitted = False
        for s in branches:
            if s == r and not omitted:
                omitted = True
            else:
                H = mul(H, B[s])
        Ai = add(mul(mul(G, B[r - 1]), H), base)
        ei = int(difference(Ai, p) < 0)
        T = mul(mul(G, F[r]), H)
        d = difference(mul(F[r], H), p - 3)
        tj = coefficient(T, j)
        by_type[str(r)] = {"selector": ei, "deletion_difference": str(difference(Ai, p)),
                           "cofactor_slope": str(d), "Tj": str(tj)}
        b += counts[r - 2] * r * ei
        A += counts[r - 2] * r * ei * tj
    D = choose(N, j + 1) - choose(N, j)
    factor = delta * coefficient(C, j) - (delta - 1) * coefficient(C, j + 1)
    margin = factor * A - b * delta * D * coefficient(C, j)
    result = {"counts": counts, "m": m, "n": N + m + 3, "N": N,
              "alpha": alpha, "x": x, "p": p, "j": j, "delta": delta,
              "guards": [x + 2 <= p, 3 * p < 2 * alpha + 1, 2 * p <= alpha],
              "e0": e0, "endpoint_deletion_difference": str(difference(A0, p)),
              "branch_types": by_type, "b": b, "A": str(A), "Cj": str(coefficient(C, j)),
              "Cj1": str(coefficient(C, j + 1)), "D": str(D),
              "payment_margin": str(margin), "mass_margin": str(A - b * delta * D)}
    if counts == [0, 0, 173]:
        M = N - 4
        floor_H = [choose(M, k) + (m - 1) * choose(M - 4, k - 1) for k in range(M + 1)]
        floor_T = coefficient(mul(mul(G, F[4]), floor_H), j)
        floor_A = N * floor_T
        result["floor_Tj"] = str(floor_T)
        result["floor_payment_margin"] = str(factor * floor_A - b * delta * D * coefficient(C, j))
        assert int(result["floor_payment_margin"]) < 0 < margin
        assert int(result["mass_margin"]) > 0
    if counts == [0, 38, 0]:
        beta = choose(q, x) - choose(q, x - 1)
        v = Fraction(beta, coefficient(C, x))
        t = Fraction(coefficient(C, j + 1), coefficient(C, j))
        kappa = 1 - t + t / delta
        wrong = v + Fraction(1, delta)
        right = v + (1 - v) / delta
        result["kappa"] = str(kappa)
        result["wrong_lower"] = str(wrong)
        result["correct_lower"] = str(right)
        assert right < kappa < wrong and margin > 0
    return result


def occupancy_check():
    sizes = (2, 3, 4)
    M = sum(sizes)
    Q = [1]
    for r in sizes:
        Q = mul(Q, B[r])
    for k in range(M + 1):
        total = Fraction(0)
        for mask in range(1 << M):
            if mask.bit_count() != k:
                continue
            start, weight = 0, Fraction(1)
            for s in sizes:
                occupancy = sum((mask >> a) & 1 for a in range(start, start + s))
                if occupancy == 1:
                    weight *= 1 + Fraction(1, s)
                start += s
            total += weight
        assert total == coefficient(Q, k)
    return {"sizes": sizes, "checked_ranks": M + 1}


z = Fraction(17 * 237, 450)
taylor20 = sum((z ** k / factorial(k) for k in range(21)), Fraction(0))
assert taylor20 > Fraction(162 * 238, 5)
assert Fraction(49, 100) ** 4 > Fraction(1, 18)
assert all(s * Fraction(39, 100) * Fraction(48, 100) ** (s - 1) > Fraction(17, 100)
           for s in (2, 3, 4))
for f in (G, B[2], B[3], B[4]):
    d = len(f) - 1
    assert all(3 * (k + 1) * f[k + 1] >= 2 * (d - k) * f[k] for k in range(d))

data = {"occupancy": occupancy_check(),
        "cutoff": {"taylor20_over_threshold": str(taylor20 / Fraction(162 * 238, 5)),
                   "factor_checks": True},
        "profiles": [profile(c) for c in ([0, 0, 173], [0, 38, 0], [0, 12, 10],
                                           [0, 10, 13], [1, 8, 14])]}
assert all(int(row["payment_margin"]) > 0 for row in data["profiles"])
with open("independent_evidence.json", "w") as f:
    json.dump(data, f, indent=2)
    f.write("\n")
print("independent exact controls and rational cutoff checks passed")
