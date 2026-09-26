"""Exact standalone replay of C6-F3 grouped-factor and cutoff arithmetic."""
from fractions import Fraction
from math import comb, factorial
import json


def conv(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def finite_ulc_order(a):
    """Least integer d >= degree satisfying the finite ULC inequalities."""
    n = len(a) - 1
    d = n
    for j in range(1, n):
        lhs = j * a[j] * a[j]
        rhs = (j + 1) * a[j - 1] * a[j + 1]
        assert lhs > rhs, (a, j, lhs, rhs)
        d = max(d, j + (rhs + lhs - rhs - 1) // (lhs - rhs))
    for j in range(1, n):
        assert a[j] ** 2 * comb(d, j - 1) * comb(d, j + 1) >= (
            a[j - 1] * a[j + 1] * comb(d, j) ** 2
        ), (a, d, j)
    return d


pairs = []
for r in range(2, 13):
    F = [comb(r - 1, j + 1) for j in range(r - 1)]
    for s in range(2, 13):
        B = [comb(s, j) for j in range(s + 1)]
        B[1] += 1
        product = conv(F, B)
        order = finite_ulc_order(product)
        pairs.append((order, r, s, product))

assert len(pairs) == 121
largest = max(pairs)
assert largest[:3] == (962, 12, 2)
b_orders = {}
for r in range(2, 13):
    B = [comb(r, j) for j in range(r + 1)]
    B[1] += 1
    order = finite_ulc_order(B)
    assert order == comb(r, 2) + 1
    b_orders[r] = order

D, h, m = 12, 17, 100_000_000
C = 76 * 9**11 + 352
A = Fraction(2, 3) - Fraction(h, 2 * m)
B = Fraction(1, 3) - Fraction(202, 2 * m)
epsilon = Fraction(factorial(h), (m - h) ** h) * A ** -16 * B ** -200
control = 9 * m * C * epsilon
assert C == 2_384_960_530_636
assert control < 1

print(json.dumps({
    "scope": "121 exact grouped factors F_r B_s, 2<=r,s<=12; plus cutoff scalar at D=12,h=17,m=100000000",
    "grouped_factor_pairs": len(pairs),
    "grouped_factor_coefficients_and_least_orders_checked": True,
    "largest_order": largest[0],
    "largest_order_pair": [largest[1], largest[2]],
    "B_r_orders": b_orders,
    "cutoff_D_h_m_C": [D, h, m, C],
    "A": str(A),
    "B": str(B),
    "epsilon": str(epsilon),
    "9mC_epsilon": str(control),
    "9mC_epsilon_decimal": float(control),
    "strictly_below_one": control < 1,
}, indent=2))
