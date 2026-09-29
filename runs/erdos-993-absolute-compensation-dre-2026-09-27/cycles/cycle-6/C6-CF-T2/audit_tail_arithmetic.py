#!/usr/bin/env python3
"""Independent exact arithmetic checks for the C6 m>=100 surplus tail."""
from fractions import Fraction
from math import comb
import json


def e_taylor(d, x):
    return sum((x**j / __import__('math').factorial(j) for j in range(d + 1)), Fraction(0))


def g4(n, k):
    return Fraction(8, 9) * Fraction(comb(n - 4, k - 1), comb(n, k))


def coeff_mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def operator_coeffs(a):
    """Coefficients of (3+2z) f' - 2 deg(f) f, monomial basis."""
    d = len(a) - 1
    out = [0] * len(a)
    for j, x in enumerate(a):
        if j + 1 < len(a):
            out[j] += 3 * (j + 1) * a[j + 1]
        if j:
            out[j] += 2 * j * a[j]
        out[j] -= 2 * d * x
    while len(out) > 1 and out[-1] == 0:
        out.pop()
    return out


def main():
    # Boundary and first interior checks for the parity formulas and guard.
    rows = []
    for n, ks in [(200, [50, 51, 100, 101]), (201, [50, 51, 101]),
                  (202, [51, 52, 101, 102]), (203, [51, 52, 102])]:
        guard = (n + 2) // 2
        for k in ks:
            if not (1 <= k <= guard):
                continue
            b = Fraction(n + 1 - k, k)
            ratio_floor = Fraction(2 * (n + 2 - k), 3 * k)
            m_bound = 1 - b / ratio_floor
            rows.append({"N": n, "k": k, "guard_max": guard,
                         "low_band": 4 * k <= n + 1,
                         "g4": str(g4(n, k)), "g4_ge_1_20": g4(n, k) >= Fraction(1, 20),
                         "ratio_floor": str(ratio_floor),
                         "normalized_M_lower": str(m_bound),
                         "normalized_M_gt_minus_half": m_bound > Fraction(-1, 2)})

    a = Fraction(99, 20)
    e8, e7 = e_taylor(8, a), e_taylor(7, a)
    # The exp tail bound uses E8(a)>102 and E7(a)>20 exactly.
    assert e8 > 102 and e7 > 20

    # Verify exact monomial-basis coefficient vectors used for the C ratio floor.
    bases = {
        "G=B1": [1, 2],
        "B2": [1, 3, 1],
        "B3": [1, 4, 3, 1],
        "B4": [1, 5, 6, 4, 1],
    }
    ops = {key: operator_coeffs(val) for key, val in bases.items()}
    assert ops == {"G=B1": [4], "B2": [5], "B3": [6, 2, 3], "B4": [7, 6, 12, 4]}

    # Check closed-form parity expressions against the original binomial ratio
    # at the first even and odd tail values and a later interior value.
    parity = []
    for n in (200, 201, 202, 203, 400, 401):
        s = n // 2
        k = (n + 2) // 2
        direct = g4(n, k)
        if n % 2 == 0:
            form = Fraction(2, 9) * Fraction((s + 1) * (s - 2) * (s - 3), s * (2*s - 1) * (2*s - 3))
            polynomial = 4*s**3 - 88*s**2 + 13*s + 240
        else:
            form = Fraction(2, 9) * Fraction((s + 1) * (s - 2), (2*s + 1) * (2*s - 1))
            polynomial = 4*s**2 - 40*s - 71
        assert direct == form
        assert polynomial > 0
        parity.append({"N": n, "s": s, "k": k, "g4": str(direct), "parity_numerator": polynomial})

    # Exercise positive-factor/negative-factor inequality orientation explicitly.
    # From C[k]/C[k-1] >= rho>0 we infer C[k-1]/C[k] <= 1/rho;
    # multiplying by -b (b>0) reverses order.
    orientation = {
        "sample_rho": "3/2", "sample_b": "2/3",
        "inverse_ratio_upper": "2/3",
        "negative_multiplier_reverses": True,
        "resulting_lower_bound": str(1 - Fraction(2, 3) * Fraction(2, 3)),
    }
    assert orientation["resulting_lower_bound"] == "5/9"

    print(json.dumps({
        "E8_99over20": str(e8), "E7_99over20": str(e7),
        "operator_monomial_coefficients": ops,
        "boundary_interior_rows": rows,
        "parity_formula_checks": parity,
        "inequality_direction_control": orientation,
        "scope": "exact arithmetic spot checks only; universal steps are justified in REPORT.md"
    }, indent=2))

if __name__ == '__main__':
    main()
