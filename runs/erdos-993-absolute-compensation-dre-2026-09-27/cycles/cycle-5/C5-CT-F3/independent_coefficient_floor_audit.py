"""Independent exact replay of the abstract one-block obstruction."""
from fractions import Fraction
from itertools import combinations
from math import comb


def multiply(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


r = 2
M = 2
f = [1, 2, 100]  # coefficients in the monomial basis 1,z,z^2
baseline_block = [comb(r, t) for t in range(r + 1)]
H = f[:]
C = [1]
for _ in range(r):
    C = multiply(C, [1, 1])
assert all(f[t] >= baseline_block[t] for t in range(r + 1))
assert H == [1, 2, 100] and C == [1, 2, 1]

# Literal uniform-subset law on two labeled elements, block V={0,1}.
subset_products = []
for k in range(M + 1):
    vals = []
    for S_tuple in combinations(range(M), k):
        t = len(S_tuple)  # the block is the entire ground set
        vals.append(Fraction(f[t], baseline_block[t]))
    subset_products.append(sum(vals, Fraction(0)) / len(vals))
coefficient_ratios = [Fraction(H[k], C[k]) for k in range(M + 1)]
assert subset_products == coefficient_ratios == [Fraction(1), Fraction(1), Fraction(100)]

# Exact y_k in the registered one-block formula; d=1 Taylor floor is 1+y.
def y(k):
    total = Fraction(0)
    for t in range(r + 1):
        ways = comb(r, t) * (comb(M - r, k - t) if 0 <= k - t <= M-r else 0)
        total += Fraction(ways, comb(M, k)) * Fraction(2*(f[t]-baseline_block[t]), f[t]+baseline_block[t])
    return total

ys = [y(k) for k in range(M + 1)]
assert ys == [Fraction(0), Fraction(0), Fraction(198, 101)]
assert all(Fraction(H[k], C[k]) >= 1 + ys[k] for k in range(M + 1))

# k=1 obeys 1<=k and 2k<=M+2. All denominator factors below are positive.
k = 1
minor = H[k]*C[k] - H[k+1]*C[k-1]
normalized_difference = Fraction(H[k], C[k-1]) - Fraction(H[k+1], C[k])
assert 1 <= k and 2*k <= M+2
assert C[k-1] > 0 and C[k] > 0
assert minor == -96 and normalized_difference == -48
# Check the other guarded rank, including zero extension beyond deg(H).
k_boundary = 2
boundary_minor = H[k_boundary]*C[k_boundary] - 0*C[k_boundary-1]
assert 1 <= k_boundary and 2*k_boundary <= M+2
assert boundary_minor == 100
print({"basis": "monomials in z", "f": f, "binomial_floor": baseline_block,
       "H": H, "C": C, "subset_expectations": [str(x) for x in subset_products],
       "y_by_rank": [str(x) for x in ys], "guarded_k": k,
       "minor": minor, "minor_divided_by_positive_C_product": str(normalized_difference),
       "upper_guard_boundary_k": k_boundary, "zero_extended_boundary_minor": boundary_minor})
