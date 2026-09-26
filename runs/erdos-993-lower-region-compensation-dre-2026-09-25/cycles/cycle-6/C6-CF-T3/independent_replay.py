"""Bounded exact replay of the C6-T3 arity-2..12 coefficient certificate."""
from fractions import Fraction
from math import comb, factorial
import hashlib
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def B(r):
    c = [comb(r, j) for j in range(r + 1)]
    c[1] += 1
    return c


def F(r):
    return [comb(r - 1, j + 1) for j in range(r - 1)]


def valid_ulc(a, d):
    n = len(a) - 1
    if d < n:
        return False
    for j in range(1, n):
        if a[j] ** 2 * comb(d, j - 1) * comb(d, j + 1) < a[j - 1] * a[j + 1] * comb(d, j) ** 2:
            return False
    return True


def least_order(a):
    n = len(a) - 1
    order = n
    for j in range(1, n):
        gap = j * a[j] ** 2 - (j + 1) * a[j - 1] * a[j + 1]
        assert gap > 0, (a, j, gap)
        order = max(order, j + ((j + 1) * a[j - 1] * a[j + 1] + gap - 1) // gap)
    assert valid_ulc(a, order)
    if order > n:
        assert not valid_ulc(a, order - 1)
    return order


def factors():
    rows = []
    pair_count = 0
    max_order = (0, None)
    b_orders = {}
    for r in range(2, 13):
        b = B(r)
        expected_d = comb(r, 2) + 1
        assert least_order(b) == expected_d
        b_orders[str(r)] = expected_d
        for s in range(2, 13):
            product = mul(F(r), B(s))
            d = least_order(product)
            # Check each exact normalized inequality independently.
            assert valid_ulc(product, d)
            rows.append({"r": r, "s": s, "coefficients": product, "finite_ULC_order": d})
            pair_count += 1
            if d > max_order[0]:
                max_order = (d, [r, s])
    # Check small-factor derivative comparisons and coefficient-ratio monotonicity
    # used for the mixed minors, including zero extension.
    for r in range(2, 13):
        for a in (B(r), F(r)):
            d = len(a) - 1
            for j in range(d + 1):
                deriv = (j + 1) * (a[j + 1] if j < d else 0)
                comp = (d - j) * a[j]
                assert deriv * 3 >= comp and deriv <= 2 * comp
        g = B(r)
        for c, lower_minor in ((B(r - 1), 1), (F(r), (r - 1) * (r + 4) // 2)):
            for i in range(len(c)):
                for j in range(i + 1, len(g)):
                    ci = c[i]
                    cj = c[j] if j < len(c) else 0
                    assert ci * g[j] - cj * g[i] >= 0, (r, c, i, j)
            assert c[0] * g[1] - (c[1] if len(c) > 1 else 0) * g[0] == lower_minor
    digest = hashlib.sha256(json.dumps(rows, separators=(",", ":")).encode()).hexdigest()
    return {"certificate_rows": pair_count, "rebuilt_rows_sha256": digest,
            "B_orders": b_orders, "largest_pair_order": max_order,
            "derivative_and_mixed_minor_checks": True}


def cutoff():
    D, h, m, C = 12, 17, 100_000_000, 76 * 9**11 + 352
    A = Fraction(2, 3) - Fraction(h, 2 * m)
    Bbound = Fraction(1, 3) - Fraction(202, 2 * m)
    epsilon = Fraction(factorial(h), (m - h)**h) / (A**16 * Bbound**200)
    ratio = 9 * m * C * epsilon
    assert C == 2_384_960_530_636
    assert A == Fraction(399999949, 600000000)
    assert Bbound == Fraction(99999697, 300000000)
    assert ratio < 1
    # Verify the finite falling-factorial quotient monotonicity certificate
    # algebraically: f(j+1)<=f(j) iff the displayed cross-difference is >=0.
    rows = []
    for N in (2 * m, D * m):
        J = 2 * N // 3 + 3
        lo = (N + 3) // 4
        for s in (0, 1):
            a = h - s
            b = (D - 1) * h + D + s
            for j in (lo, J):
                diff = D * (h + 1) * j - a * N + b * (1 - s) - a * s
                assert diff > 0
            rows.append({"N": N, "s": s, "lower_j": lo, "upper_j": J,
                         "cross_difference_positive_at_both_endpoints": True})
    return {"D": D, "h": h, "m0": m, "C": C,
            "A": str(A), "B": str(Bbound), "epsilon": str(epsilon),
            "controlling_ratio": str(ratio), "ratio_decimal": float(ratio),
            "strictly_below_one": True, "quotient_rows": rows}


if __name__ == "__main__":
    result = {"factor_replay": factors(), "cutoff_replay": cutoff(),
              "scope": "121 pairs, 2<=r,s<=12; exact cutoff scalar at m=100000000; no graph generation"}
    (HERE / "EVIDENCE.json").write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({"factor_replay": result["factor_replay"],
                      "cutoff_summary": {k: result["cutoff_replay"][k] for k in ("C", "ratio_decimal", "strictly_below_one")}}, indent=2))
