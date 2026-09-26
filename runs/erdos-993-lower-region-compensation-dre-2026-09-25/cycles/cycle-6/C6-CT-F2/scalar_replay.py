from fractions import Fraction
from math import factorial
import json

h = 29
m0 = 2000
A = Fraction(2, 3) - Fraction(h, 2*m0)
B = Fraction(1, 3) - Fraction(3*h + 8, 2*m0)
assert (A, B) == (Fraction(7913, 12000), Fraction(743, 2400))

# For s in {0,1}, let R_s(j) be the claimed falling-factorial quotient.
# R_s(j+1)/R_s(j) < 1 iff the following cross-product is positive.
def cross(N, j, s):
    return ((4*h + 4)*j - (h-s)*N
            + (3*h+4+s)*(1-s) - (h-s)*s)

# The cross-product is affine increasing in j. At j=N/4 it is
# N+3h+4 (s=0) and 2N-h+1 (s=1), hence positive for N>=4000.
for N in (4000, 4001, 8000):
    for s in (0, 1):
        at_quarter = cross(N, Fraction(N, 4), s)
        lower = N + 3*h + 4 if s == 0 else 2*N - h + 1
        assert at_quarter == lower > 0

# Exact endpoint bounds valid for J=floor(2N/3+3), N>=2m, m>=2000:
# first factors >=2N/3-26 >= N*A(m); second factors >=N/3-93 >=N*B(m).
# Check the inequalities symbolically by comparing the constant offsets at N=2m;
# the differences only increase as N/m increases.
assert Fraction(29, 2)*2 - 26 >= 0
assert Fraction(95, 2)*2 - 93 >= 0

# Lower bound choose(m-1,h) >= (m-h)^h/h!, and (N)_(4h+4)<=N^(4h+4).
epsilon = Fraction(factorial(h), (m0-h)**h * A**(h-1) * B**(3*h+5))
scalar = 80328*m0*epsilon
assert scalar < 1
# Direct monotonicity: d log(m/(m-h)^h)/dm = 1/m-h/(m-h)<0 for h>1;
# A(m), B(m) increase, so the sufficient scalar decreases for m>=2000.
assert m0 > h/(h-1)

out = {
    'h': h,
    'm0': m0,
    'A': str(A),
    'B': str(B),
    'epsilon': str(epsilon),
    'scalar': str(scalar),
    'scalar_decimal': float(scalar),
    'strictly_below_one': scalar < 1,
    'conclusion': 'scalar cutoff verified for all integer m>=2000 by exact endpoint value and monotonicity',
}
print(json.dumps(out, indent=2))
