"""Independent exact spot checks for C3-T1's m>=120 coefficient argument."""
from fractions import Fraction
from math import comb, factorial
import json
from pathlib import Path

# Fixed rational Taylor bounds used for all integer m >= 120.
a = Fraction(119, 20)
E8 = sum((a**h / factorial(h) for h in range(9)), Fraction(0))
E7 = sum((a**h / factorial(h) for h in range(8)), Fraction(0))
assert E8 > 288 and E7 > 48

# Check the three singleton-probability formulas directly from their
# hypergeometric definition and the Jensen weights.
rows = 0
min_excess = None
for M in range(44, 501):
    for k in range((M + 2) // 3, M // 2 + 2):
        if 2*k > M+2:
            continue
        for r in (2, 3, 4):
            singleton = Fraction(r * comb(M-r, k-1), comb(M, k))
            excess = Fraction(2, 2*r+1) * singleton - Fraction(1, 20)
            assert excess >= 0
            min_excess = excess if min_excess is None else min(min_excess, excess)
            rows += 1

# Verify the closed-form coefficient and debt ratios at all valid band points
# in a finite range; the accompanying report proves their universal bounds.
ratio_rows = 0
for N in range(240, 2001):
    for j in range((2*N)//5, (N-2)//2 + 1):
        if 5*j <= 2*N-1:
            continue
        # [z^j](1+2z)(1+z)^(N-2) / binom(N,j)
        coefficient_ratio = Fraction(comb(N-2,j) + 2*comb(N-2,j-1), comb(N,j))
        assert coefficient_ratio == 1 - Fraction(j*(j-1), N*(N-1))
        assert coefficient_ratio >= Fraction(3,4)
        debt_ratio = Fraction((N+1-j)*(N-2*j-1), j+1)
        assert debt_ratio < Fraction(3*(N-3), 10)
        ratio_rows += 1

result = {
    "scope": "exact finite spot checks only; universal claims are proved in REPORT.md",
    "E8_119_20": f"{E8.numerator}/{E8.denominator}",
    "E7_119_20": f"{E7.numerator}/{E7.denominator}",
    "singleton_rows_M44_500": rows,
    "minimum_singleton_jensen_excess": f"{min_excess.numerator}/{min_excess.denominator}",
    "coefficient_and_debt_rows_N240_2000": ratio_rows,
}
Path(__file__).with_suffix('.json').write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps(result, indent=2))
