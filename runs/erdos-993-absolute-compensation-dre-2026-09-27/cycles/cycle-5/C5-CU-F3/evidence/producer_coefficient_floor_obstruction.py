from fractions import Fraction
from math import comb

# One finite block of size 2.  These are the f_i(t) of the generic
# coefficient/Jensen theorem; binomial coefficients are (1, 2, 1).
f = [1, 2, 100]
r = 2
M = 2
base = [comb(r, t) for t in range(r + 1)]
assert all(f[t] >= base[t] for t in range(r + 1))

# H = sum_t f(t) z^t and comparator C = (1+z)^2.
H = f
C = base

def y(k):
    den = comb(M, k)
    out = Fraction(0)
    for t in range(r + 1):
        other = M - r
        num = comb(r, t) * (comb(other, k - t) if 0 <= k - t <= other else 0)
        if num:
            out += Fraction(num, den) * Fraction(2 * (f[t] - base[t]), f[t] + base[t])
    return out

# Check all coefficients and the exact finite-block Jensen exponent data.
assert H == [1, 2, 100]
assert C == [1, 2, 1]
assert [y(k) for k in range(3)] == [Fraction(0), Fraction(0), Fraction(198, 101)]

# The shifted cross-minor on the guarded rank k=1 is strictly negative.
k = 1
minor = H[k] * C[k] - H[k + 1] * C[k - 1]
assert 1 <= k and 2 * k <= M + 2
assert minor == -96
print({"r": r, "f": f, "binomial_floor": base, "H": H, "C": C,
       "y_by_rank": [str(y(k)) for k in range(M + 1)],
       "guarded_k": k, "shifted_minor": minor})
