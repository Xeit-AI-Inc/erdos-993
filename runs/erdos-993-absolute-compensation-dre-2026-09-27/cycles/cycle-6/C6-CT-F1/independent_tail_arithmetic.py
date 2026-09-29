#!/usr/bin/env python3
"""Independent exact checks of the C6 m>=100 tail boundary constants."""
from fractions import Fraction
from math import comb
import json


def taylor_at_99_over_20(d: int) -> Fraction:
    a = Fraction(99, 20)
    return sum((a**j / __import__('math').factorial(j) for j in range(d + 1)), Fraction(0))


def g4(N: int, k: int) -> Fraction:
    return Fraction(8, 9) * Fraction(comb(N - 4, k - 1), comb(N, k))


e8 = taylor_at_99_over_20(8)
e7 = taylor_at_99_over_20(7)
assert e8 == Fraction(2162945642595007, 16384000000000)
assert e7 == Fraction(88220922596671, 716800000000)
assert e8 > 102 and e7 > 20

# The parity endpoints are the smallest N allowed in the tail.  These values
# independently test the two closed forms used in the analytic argument.
even = g4(200, 101)
odd = g4(201, 101)
assert even == Fraction(480053, 8820675)
assert odd == Fraction(8, 9) * Fraction(comb(197, 100), comb(201, 101))
assert even > Fraction(1, 20) and odd > Fraction(1, 20)

# Exact algebraic lower-bound endpoint at m=100, N=200.  General positivity is
# proved in REPORT.md from 4Nm-N^2+2N-8 >= 2N-8 > 0 when N<=4m.
tail_payment = Fraction(2 * 200 * (100 + 2), (200 + 4) * (200 + 2))
assert tail_payment > Fraction(1, 2)

print(json.dumps({
    "E8_99over20": str(e8),
    "E7_99over20": str(e7),
    "g4_N200_k101": str(even),
    "g4_N201_k101": str(odd),
    "g4_endpoint_exceeds_1_over_20": True,
    "worst_case_tail_payment_N200_m100": str(tail_payment),
    "tail_payment_exceeds_1_over_2": True,
}, sort_keys=True))
