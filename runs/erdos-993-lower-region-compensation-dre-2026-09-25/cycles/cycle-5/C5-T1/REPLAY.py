#!/usr/bin/env python3
"""Independent exact replay for the C5 T1 uniform T_m route.

All arithmetic is Python integer arithmetic.  The only finite range checked is
the stated base m=3,...,999; the script makes no extrapolation beyond it.
"""
from math import comb
from fractions import Fraction
import json
from pathlib import Path


def add(a, b):
    n = max(len(a), len(b))
    out = [0] * n
    for i, x in enumerate(a):
        out[i] += x
    for i, x in enumerate(b):
        out[i] += x
    return out


def scale(a, c):
    return [c * x for x in a]


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        if x:
            for j, y in enumerate(b):
                if y:
                    out[i + j] += x * y
    return out


def shift(a, k=1):
    return [0] * k + a


def bpower_next(m):
    """Recover B^m from B*(B^m)'=m*B'*B^m, B=1+4z+3z^2+z^3."""
    b = (1, 4, 3, 1)
    out = [1] + [0] * (3 * m)
    for k in range(1, 3 * m + 1):
        numerator = 0
        for r in range(1, min(3, k) + 1):
            numerator += b[r] * (m * r - (k - r)) * out[k - r]
        assert numerator % k == 0
        out[k] = numerator // k
    return out


def coeff(a, j):
    return a[j] if 0 <= j < len(a) else 0


def first_descent(a):
    # Include the terminal zero-extended rank, as in the contract.
    for j in range(len(a) + 1):
        if coeff(a, j + 1) - coeff(a, j) < 0:
            return j
    raise AssertionError("no descent through terminal zero extension")


def main():
    L = [1, 1]
    L3 = [1, 3, 3, 1]
    one2 = [1, 2]
    one3 = [1, 3, 1]
    b = [1, 4, 3, 1]
    rbase = [2, 5, 2]
    prev = [1]  # B^0
    checks_lc = checks_mix = eligible_rows = 0
    min_lc = None
    min_mix = None
    selector_failures = []
    tiny_descents = {}

    # Powers L^q are constructed by the binomial formula, independently of
    # repeated polynomial multiplication.
    for m in range(1, 1000):
        bm = bpower_next(m)
        l3m = [comb(3 * m, k) for k in range(3 * m + 1)]
        l3m1 = [comb(3 * m + 1, k) for k in range(3 * m + 2)]
        P = add(mul(one2, bm), shift(l3m1))
        A0 = add(mul(L, bm), shift(l3m))
        astar_main = mul(mul(one2, one3), prev)
        Astar = add(astar_main, shift(l3m))
        R = add(scale(mul(rbase, prev), 3 * m),
                scale(l3m, 3 * m + 1))

        x = first_descent(P)
        tiny_descents[str(m)] = x if m <= 3 else None
        alpha = 3 * m + 2
        assert len(P) - 1 == alpha
        # The proper strict lower-region rank interval is x+2 <= p <= 2m+1.
        for p in range(x + 2, 2 * m + 2):
            eligible_rows += 1
            da0 = coeff(A0, p + 1) - coeff(A0, p)
            das = coeff(Astar, p + 1) - coeff(Astar, p)
            full_s = coeff(R, p - 1) - coeff(R, p - 2)
            if not (da0 < 0 and das < 0 and full_s < 0):
                selector_failures.append([m, x, p, da0, das, full_s])

        if m >= 3:
            # Independently check the three proposed central LC margins and
            # mixed minors for every j in [m,2m+2].
            for j in range(m, 2 * m + 3):
                for name, Z in (("A0", A0), ("Astar", Astar), ("R", R)):
                    margin = coeff(Z, j) ** 2 - coeff(Z, j - 1) * coeff(Z, j + 1)
                    checks_lc += 1
                    item = (margin, m, name, j)
                    if min_lc is None or item < min_lc:
                        min_lc = item
                    mixed = coeff(Z, j) * coeff(P, j + 1) - coeff(Z, j + 1) * coeff(P, j)
                    checks_mix += 1
                    item = (mixed, m, name, j)
                    if min_mix is None or item < min_mix:
                        min_mix = item
                    assert margin > 0, ("LC", m, name, j, margin)
                    assert mixed > 0, ("mixed", m, name, j, mixed)
        if m <= 3:
            assert x == {1: 2, 2: 4, 3: 5}[m]
        prev = bm

    assert not selector_failures, selector_failures[:3]
    assert eligible_rows == 276938, eligible_rows
    assert checks_lc == checks_mix == 1507464
    assert min_lc[0] == 1210 and min_lc[1:] == (3, "Astar", 8), min_lc
    assert min_mix[0] == 1243 and min_mix[1:] == (3, "Astar", 8), min_mix
    K = Fraction(40320) * Fraction(125, 124) ** 8 * Fraction(150, 49) ** 27
    cutoff_ratios = {
        "LC": 24 * 2003 * K / 1000 ** 8,
        "A0_mixed": 47 * 2003 * K / 1000 ** 8,
        "Astar_mixed": 431 * 2003 * K / 1000 ** 8,
        "R_mixed": Fraction(4896, 7) * 2003 * K / 1000 ** 8,
    }
    assert all(v < 1 for v in cutoff_ratios.values()), cutoff_ratios
    result = {
        "method": "independent B^m recurrence from B*(B^m)'=m*B'*B^m; L powers by binomial coefficients; direct integer formulas",
        "finite_base": {"m": [3, 999], "j": "m through 2m+2 inclusive", "polynomials": ["A0", "Astar", "R"],
                        "lc_checks": checks_lc, "mixed_minor_checks": checks_mix,
                        "failure_counts": {"lc": 0, "mixed_minor": 0},
                        "minimum_margins": {"lc": [str(min_lc[0]), min_lc[1], min_lc[2], min_lc[3]],
                                            "mixed_minor": [str(min_mix[0]), min_mix[1], min_mix[2], min_mix[3]]}},
        "eligible_family_replay": {"m": [1, 999], "rank_rule": "x+2 <= p <= 2m+1", "rows": eligible_rows,
                                   "selector_and_full_sum_failures": len(selector_failures)},
        "large_m_exact_cutoff_ratios": {k: [str(v.numerator), str(v.denominator)] for k, v in cutoff_ratios.items()},
        "first_descents": {k: v for k, v in tiny_descents.items() if v is not None},
        "limitations": ["This is finite exact arithmetic, not a proof kernel certificate.",
                        "It checks the stated polynomial formulas; the graph decomposition and large-m inequalities are proved separately in REPORT.md."]
    }
    Path("RESULTS.json").write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
