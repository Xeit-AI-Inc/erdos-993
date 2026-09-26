"""Exact arithmetic check for the m >= 2000 perturbation cutoff."""
from fractions import Fraction
from math import factorial
import json

h = 29
m0 = 2000
A = Fraction(2, 3) - Fraction(h, 2 * m0)
B = Fraction(1, 3) - Fraction(3 * h + 8, 2 * m0)
epsilon = Fraction(factorial(h), 1) / (
    (m0 - h) ** h * A ** (h - 1) * B ** (3 * h + 5)
)
controlling = 80328 * m0 * epsilon
assert A == Fraction(7913, 12000)
assert B == Fraction(743, 2400)
assert A > B > 0
assert controlling < 1

result = {
    "cutoff_m": m0,
    "h": h,
    "A": f"{A.numerator}/{A.denominator}",
    "B": f"{B.numerator}/{B.denominator}",
    "epsilon": f"{epsilon.numerator}/{epsilon.denominator}",
    "controlling_ratio": f"{controlling.numerator}/{controlling.denominator}",
    "controlling_decimal_display_only": float(controlling),
    "strictly_below_one": True,
    "uniform_monotonicity": (
        "For real m >= 2000, m/(m-h)^h strictly decreases; "
        "A(m)=2/3-h/(2m) and B(m)=1/3-(3h+8)/(2m) increase and stay positive."
    ),
    "scope": "cutoff arithmetic only; no graph enumeration or universal-tree conclusion",
}
print(json.dumps(result, indent=2))
