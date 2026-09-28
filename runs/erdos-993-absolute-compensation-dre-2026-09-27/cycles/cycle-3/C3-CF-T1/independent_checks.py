"""Exact spot checks for the independently reviewed m>=120 argument."""
from fractions import Fraction as Q
from math import comb, factorial
import json
from pathlib import Path


def E(d, x):
    return sum((x**h / factorial(h) for h in range(d + 1)), Q(0))


# Rational continuation constants, derived without floating point.
a = Q(119, 20)
e8, e7 = E(8, a), E(7, a)
assert e8 == Q(48232104261912983, 147456000000000)
assert e7 == Q(265545425322997, 921600000000)
assert e8 > 288 and e7 > 48

# Check the three singleton probability formulae directly over an exact
# window; the REPORT proves extension to all M>=44 by monotonicity/endpoints.
probability_rows = 0
minimum_gap = None
for M in range(44, 501):
    for k in range((M + 2) // 3, M // 2 + 2):
        if 2 * k > M + 2:
            continue
        for s in (2, 3, 4):
            p = Q(s * comb(M - s, k - 1), comb(M, k))
            gap = 2 * p / (2 * s + 1) - Q(1, 20)
            assert gap >= 0
            minimum_gap = gap if minimum_gap is None else min(gap, minimum_gap)
            probability_rows += 1

# The debt ratio inequality used in the coefficient comparison.  The proof
# in REPORT reduces its full-domain assertion to concavity and endpoint signs.
ratio_rows = 0
for N in range(28, 2001):
    for j in range((2 * N) // 5, (N - 2) // 2 + 1):
        if 5 * j <= 2 * N - 1 or 2 * j > N - 2:
            continue
        r = Q((N + 1 - j) * (N - 2 * j - 1), j + 1)
        assert r < Q(3 * (N - 3), 10)
        ratio_rows += 1

result = {
    "scope": "exact rational spot checks; not a proof beyond the stated analytic arguments",
    "E8_119_over_20": f"{e8.numerator}/{e8.denominator}",
    "E7_119_over_20": f"{e7.numerator}/{e7.denominator}",
    "singleton_rows_M44_to_500": probability_rows,
    "minimum_probability_gap": f"{minimum_gap.numerator}/{minimum_gap.denominator}",
    "debt_ratio_rows_N28_to_2000": ratio_rows,
}
Path(__file__).with_suffix(".json").write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps(result, indent=2))
