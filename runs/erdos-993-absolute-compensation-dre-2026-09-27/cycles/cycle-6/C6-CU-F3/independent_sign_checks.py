from fractions import Fraction as F
from math import comb, factorial


def add(a, b):
    n = max(len(a), len(b))
    return [(a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0) for i in range(n)]


def scale(a, c):
    return [c * x for x in a]


def deriv(a):
    return [i * a[i] for i in range(1, len(a))]


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def op(f, degree):
    # (3+2z) f'(z) - 2*degree*f(z), all arrays in the monomial z basis.
    out = add(add(scale(deriv(f), 3), [0] + scale(deriv(f), 2)), scale(f, -2 * degree))
    while len(out) > 1 and out[-1] == 0:
        out.pop()
    return out


def B(r):
    a = [comb(r, j) for j in range(r + 1)]
    a[1] += 1
    return a


# Explicitly verify the coefficient lists displayed in the proof, in z powers.
operator_lists = {
    "G=B1": op([1, 2], 1),
    "B2": op(B(2), 2),
    "B3": op(B(3), 3),
    "B4": op(B(4), 4),
}
assert operator_lists == {"G=B1": [4], "B2": [5], "B3": [6, 2, 3], "B4": [7, 6, 12, 4]}

# Exact strict Taylor constants used for every m>=100.
a = F(99, 20)
t8 = sum((a**i / factorial(i) for i in range(9)), F(0))
t7 = sum((a**i / factorial(i) for i in range(8)), F(0))
assert t8 == F(2162945642595007, 16384000000000) and t8 > 102
assert t7 == F(88220922596671, 716800000000) and t7 > 20
# At the boundary m=100, this proves e^(99/20)>102=m+2.
assert F(102) < t8

# Check exact g_2>=g_3>=g_4 at a complementary-band boundary and interior.
def g(n, k, r):
    return F(2 * r, 2 * r + 1) * F(comb(n - r, k - 1), comb(n, k))

g_rows = {}
for n, k in ((200, 51), (200, 101), (201, 60), (201, 101), (400, 201)):
    assert 4 * k > n + 1 and 2 * k <= n + 2
    vals = [g(n, k, r) for r in (2, 3, 4)]
    assert vals[0] >= vals[1] >= vals[2] > F(1, 20)
    g_rows[f"N={n},k={k}"] = [str(v) for v in vals]

# Check the positive-denominator lower bounds at the even boundary and an odd interior point.
for n, k, m in ((200, 101, 100), (201, 60, 100), (201, 101, 100)):
    assert n <= 4 * m and n >= 200 and 2 * k <= n + 2
    lam_lower = F(2, n + 4)
    binom_ratio = F(n + 1 - k, k)
    assert binom_ratio >= F(n, n + 2)
    assert 4 * n * (m + 2) - (n + 4) * (n + 2) >= 2 * n - 8 > 0

# Check both parity-polynomial lower bounds from the midpoint calculation at boundary/interior.
even_poly = lambda s: 4 * s**2 * (s - 22) + 13 * s + 240
odd_poly = lambda s: 4 * s**2 - 40 * s - 71
assert even_poly(100) == 3_121_540 and even_poly(101) > 0
assert odd_poly(99) > 0 and odd_poly(100) > 0

print({
    "operator_lists_z_basis": operator_lists,
    "E8_99over20": str(t8),
    "E7_99over20": str(t7),
    "exact_g_rows": g_rows,
    "parity_bound_values": {"even_s100": even_poly(100), "even_s101": even_poly(101), "odd_s99": odd_poly(99), "odd_s100": odd_poly(100)},
    "status": "finite arithmetic spot checks only; general inequalities are proved algebraically in REPORT.md",
})
