#!/usr/bin/env python3
"""Independent exact checks for C2-AU; no producer code imported."""
import json
from fractions import Fraction
from math import comb, factorial


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def power(a, n):
    out = [1]
    while n:
        if n & 1:
            out = mul(out, a)
        n //= 2
        if n:
            a = mul(a, a)
    return out


def plus(a, b):
    return [(a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0)
            for i in range(max(len(a), len(b)))]


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def delta(a, k):
    return coeff(a, k + 1) - coeff(a, k)


def shift(a):
    return [0] + a


def binom(n, k):
    return comb(n, k) if n >= 0 and 0 <= k <= n else 0


m, r = 173, 4
N, q, alpha, n = m * r, m * r + 1, m * r + 2, m * (r + 1) + 3
L, G = [1, 1], [1, 2]
B4, B3 = [1, 5, 6, 4, 1], [1, 4, 3, 1]
Q = power(B4, m)
H = power(B4, m - 1)
C = mul(G, Q)
P = plus(C, shift([comb(q, k) for k in range(q + 1)]))
x = next(k for k in range(len(P)) if delta(P, k) < 0)
p, j = x + 2, x
assert p == 338 and j == 336
assert x + 2 <= p and 3 * p < 2 * alpha + 1 and 2 * p <= alpha
base = shift([comb(N, k) for k in range(N + 1)])
A0 = plus(mul(L, Q), base)
Ai = plus(mul(G, mul(B3, H)), base)
e0, ei = int(delta(A0, p) < 0), int(delta(Ai, p) < 0)
assert e0 == ei == 1
F4 = [3, 3, 1]
T = mul(mul(G, F4), H)
M = N - r
floor_h = [binom(M, k) + (m - 1) * binom(M - r, k - 1) for k in range(M + 1)]
U = mul(mul(G, F4), floor_h)
debt = binom(N, j + 1) - binom(N, j)
delta_rank = q - j
b = e0 + N * ei
factor = delta_rank * coeff(C, j) - (delta_rank - 1) * coeff(C, j + 1)
floor_margin = factor * (N * coeff(U, j)) - b * delta_rank * debt * coeff(C, j)
true_margin = factor * (N * coeff(T, j)) - b * delta_rank * debt * coeff(C, j)
mass_margin = N * coeff(T, j) - b * delta_rank * debt
assert floor_margin < 0 < true_margin and mass_margin > 0

z = Fraction(17 * 237, 450)
taylor20 = sum((z ** k / factorial(k) for k in range(21)), Fraction())
assert taylor20 > Fraction(162 * 238, 5)
assert Fraction(49, 100) ** 4 > Fraction(1, 18)
for s in (2, 3, 4):
    assert s * Fraction(39, 100) * Fraction(48, 100) ** (s - 1) > Fraction(17, 100)
for d, f in [(1, G), (2, [1, 3, 1]), (3, B3), (4, B4)]:
    for k in range(d):
        assert 3 * (k + 1) * f[k + 1] >= 2 * (d - k) * f[k]

result = {
    "profile": "all 173 branches of arity 4", "n": n, "N": N,
    "alpha": alpha, "q": q, "x": x, "p": p, "j": j,
    "delta": delta_rank,
    "guards": [x + 2 <= p, 3 * p < 2 * alpha + 1, 2 * p <= alpha],
    "selector_deltas": {"A0": str(delta(A0, p)), "Ai": str(delta(Ai, p))},
    "selectors": {"e0": e0, "ei_each": ei, "b": b},
    "coefficients": {"Cj": str(coeff(C, j)), "Cj1": str(coeff(C, j + 1)),
                     "D": str(debt), "U": str(coeff(U, j)), "T": str(coeff(T, j))},
    "floor_payment_margin": str(floor_margin),
    "true_payment_margin": str(true_margin),
    "true_mass_margin": str(mass_margin),
    "taylor20_exceeds_cutoff": True,
    "local_factor_ratio_check": True,
}
with open("independent_check.json", "w") as f:
    json.dump(result, f, indent=2)
    f.write("\n")
print("all-r4 m173 exact replay and rational cutoff checks passed")
