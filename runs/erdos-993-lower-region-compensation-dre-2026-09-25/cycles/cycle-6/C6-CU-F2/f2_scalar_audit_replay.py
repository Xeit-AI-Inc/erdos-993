from fractions import Fraction as F
from math import factorial
import json

h = 29
m0 = 2000
A = F(2, 3) - F(h, 2 * m0)
B = F(1, 3) - F(3 * h + 8, 2 * m0)
assert A == F(7913, 12000)
assert B == F(743, 2400)

# Verify the displayed successive-quotient cross-product identity exactly
# over a rectangular integer sample, including both s values.
identity_checks = 0
for s in (0, 1):
    for N in range(4000, 4021):
        for j in range((N + 3) // 4, (2 * N) // 3 + 4):
            lhs = (j - h + 1) * (N - j + s) - (j - s + 1) * (N - j - 3 * h - 4)
            rhs = ((4 * h + 4) * j - (h - s) * N
                   + (3 * h + 4 + s) * (1 - s) - (h - s) * s)
            assert lhs == rhs
            identity_checks += 1

# The affine cross product is minimized at j=N/4; its real lower bounds
# there are N+3h+4 (s=0) and 2N-h+1 (s=1).
endpoint_checks = 0
for s in (0, 1):
    for N in range(4000, 4021):
        # compare the affine expression at real j=N/4 to claimed bound
        j4 = F(N, 4)
        val = ((4 * h + 4) * j4 - (h - s) * N
               + (3 * h + 4 + s) * (1 - s) - (h - s) * s)
        bound = N + 3 * h + 4 if s == 0 else 2 * N - h + 1
        assert val == bound
        endpoint_checks += 1

# Exact candidate scalar at cutoff. For larger integer m, m/(m-h)^h
# decreases and A(m), B(m) increase; this proves uniform monotonicity.
epsilon = F(factorial(h), (m0 - h) ** h * A ** (h - 1) * B ** (3 * h + 5))
scalar = 80328 * m0 * epsilon

assert scalar < 1

# Check at m0 and a later point; symbolic monotonicity above, rather than this
# finite sample, carries the infinite tail.
def scalar_at(m):
    am = F(2, 3) - F(h, 2 * m)
    bm = F(1, 3) - F(3 * h + 8, 2 * m)
    return F(80328 * m * factorial(h), (m - h) ** h * am ** (h - 1) * bm ** (3 * h + 5))
assert scalar_at(2001) < scalar
assert scalar_at(100000) < scalar_at(2001)

out = {
    'scope': 'exact rational audit of the h=29 scalar estimate for integer m>=2000; not a complete proof of the heterogeneous theorem',
    'h': h,
    'm0': m0,
    'A_at_m0': str(A),
    'B_at_m0': str(B),
    'successive_quotient_identity_checks': identity_checks,
    'endpoint_cross_product_checks': endpoint_checks,
    'scalar_cutoff_exact': {'numerator': str(scalar.numerator), 'denominator': str(scalar.denominator)},
    'scalar_cutoff_decimal': float(scalar),
    'strictly_below_one': scalar < 1,
    'infinite_monotonicity_argument': 'm/(m-h)^h is strictly decreasing for h>1 and m>h/(h-1); A(m), B(m) strictly increase for positive m; hence the scalar decreases for all integer m>=2000.',
    'limitations': [
        'This checks the sharper scalar estimate, not all inherited coefficient, graph, mixed-minor, or selector steps.',
        'No heterogeneous profiles with m<2000 are covered.'
    ]
}
print(json.dumps(out, indent=2))
