#!/usr/bin/env python3
"""Exact targeted checks for the C6 m>=100 surplus-tail proof."""
from fractions import Fraction
from math import comb, factorial
import json


def taylor(d, x):
    return sum((x**j / factorial(j) for j in range(d + 1)), Fraction(0))


def g(r, n, k):
    return Fraction(2 * r, 2 * r + 1) * Fraction(comb(n-r, k-1), comb(n, k))


def main():
    a = Fraction(99, 20)
    e8, e7 = taylor(8, a), taylor(7, a)
    assert e8 > 102 and e7 > 20

    # Fresh falsification target: check the two algebraic boundary ranks
    # (first complementary rank and last guarded rank) for N=200..500.
    rows = 0
    minimum = None
    argmin = None
    for n in range(200, 501):
        kmin = (n + 1) // 4 + 1
        top = (n + 2) // 2
        for k in sorted({kmin, top}):
            rows += 1
            vals = [g(r, n, k) for r in (2, 3, 4)]
            assert vals[0] >= vals[1] >= vals[2]
            if k == top:
                assert vals[2] >= Fraction(1, 20), (n, k, vals[2])
            if k == top and (minimum is None or vals[2] < minimum):
                minimum, argmin = vals[2], (n, k)

    # The ratio-floor operator (3+2z)B_a' - 2a B_a has nonnegative
    # coefficients for all block sizes used here, by exact coefficient arrays.
    blocks = {
        1: [1, 2],
        2: [1, 3, 1],
        3: [1, 4, 3, 1],
        4: [1, 5, 6, 4, 1],
    }
    operators = {}
    for a0, f in blocks.items():
        d = len(f) - 1
        out = []
        for k in range(d + 1):
            # coefficient of (3+2z)f' - 2d f at z^k
            val = 3*(k+1)*(f[k+1] if k+1 <= d else 0)
            val += 2*k*f[k] - 2*d*f[k]
            assert val >= 0, (a0, k, val)
            out.append(val)
        operators[str(a0)] = out

    # Boundary identities for center-subset binomial normalization.
    # The cross-product is s(N+1)-kR exactly; check all feasible small triples.
    boundary_cases = 0
    for n in range(1, 21):
        for s in range(1, n+1):
            for k in range(1, (n+1)//4 + 1):
                for rsum in range(s, min(4*s, n)+1):
                    cross = s*(n+1)-k*rsum
                    assert cross >= 0
                    boundary_cases += 1

    result = {
        "grade": "targeted exact arithmetic checks; not a universal proof",
        "E8_99_20": str(e8),
        "E7_99_20": str(e7),
        "boundary_rows_N200_to_500": rows,
        "minimum_g4": str(minimum),
        "minimum_g4_at_N_k": list(argmin),
        "operator_coefficients": operators,
        "low_rank_cross_product_cases": boundary_cases,
    }
    print(json.dumps(result, sort_keys=True))


if __name__ == "__main__":
    main()
