#!/usr/bin/env python3
"""Independent exact checks for the finite-block coefficient/Jensen bridge."""
from fractions import Fraction
from itertools import product
from math import comb, factorial


def conv(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def coeff_product(blocks, k):
    out = [1]
    for f in blocks:
        out = conv(out, f)
    return out[k] if k < len(out) else 0


def audit(sizes, surpluses):
    M = sum(sizes)
    fs = [[comb(s, t) + surpluses[i][t] for t in range(s + 1)]
          for i, s in enumerate(sizes)]
    assert all(x >= 0 for f in fs for x in f)
    for k in range(M + 1):
        denom = comb(M, k)
        # Direct count-vector finite sum, with exact hypergeometric weights.
        expectation = Fraction(0)
        y = Fraction(0)
        for ts in product(*(range(s + 1) for s in sizes)):
            if sum(ts) != k:
                continue
            ways = 1
            ratios = Fraction(1)
            for i, (s, t) in enumerate(zip(sizes, ts)):
                ways *= comb(s, t)
                ratios *= Fraction(fs[i][t], comb(s, t))
            expectation += Fraction(ways, denom) * ratios
        assert expectation == Fraction(coeff_product(fs, k), denom), (sizes, k)

        # Marginals in y are hypergeometric; all terms are exact and nonnegative.
        for i, s in enumerate(sizes):
            for t in range(s + 1):
                outside = M - s
                u = k - t
                choose_out = comb(outside, u) if 0 <= u <= outside else 0
                choose_in = comb(s, t)
                y += Fraction(choose_in * choose_out, denom) * Fraction(
                    2 * (fs[i][t] - choose_in), fs[i][t] + choose_in)
        assert y >= 0
        # exp(y) >= E_d(y); exact rational Taylor floors tested for d=0..5.
        lhs = coeff_product(fs, k)
        for d in range(6):
            floor = sum((y ** a / factorial(a) for a in range(d + 1)), Fraction(0))
            assert Fraction(lhs, denom) >= floor, (sizes, k, d, lhs, floor)
        print(f"sizes={sizes} k={k} coefficient={lhs} choose={denom} y={y} E5={sum((y**a/factorial(a) for a in range(6)), Fraction(0))}")


# Empty family: only admissible coefficient k=0, identity and floor are 1.
assert coeff_product([], 0) == 1
print("empty family: M=k=0, coefficient=1, y=0")

# Boundary and interior examples, including singleton blocks and nontrivial excesses.
audit((1,), ((1, 2),))
audit((2, 3), ((0, 1, 0), (0, 2, 0, 1)))
audit((1, 2, 2), ((0, 1), (0, 1, 0), (0, 2, 1)))

# Explicit z-monomial coefficients for G F_r, where G=1+2z and
# F_r=sum_{h=0}^{r-2}(1+z)^h.
G = [1, 2]
F2, F3, F4 = [1], [2, 1], [3, 3, 1]
assert conv(G, F2) == [1, 2]
assert conv(G, F3) == [2, 5, 2]
assert conv(G, F4) == [3, 9, 7, 2]
print("GF2, GF3, GF4 z-monomial coefficients:", conv(G, F2), conv(G, F3), conv(G, F4))
