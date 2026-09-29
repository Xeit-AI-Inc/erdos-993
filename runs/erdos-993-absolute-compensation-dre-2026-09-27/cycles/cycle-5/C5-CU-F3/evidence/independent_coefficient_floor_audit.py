#!/usr/bin/env python3
"""Exact independent audit of a one-block coefficient-floor/Jensen instance."""
from fractions import Fraction
from itertools import combinations
from math import comb

r = 2
f = (1, 2, 100)
base = tuple(comb(r, t) for t in range(r + 1))
assert all(Fraction(f[t]) >= base[t] for t in range(r + 1))

# Direct coefficient lists in z for H=sum f[t]z^t and C=(1+z)^r.
H = tuple(Fraction(x) for x in f)
C = tuple(Fraction(x) for x in base)
assert H == (1, 2, 100)
assert C == (1, 2, 1)

# Check each actual uniform k-subset law. Here the labeled ground set has 2 points.
points = tuple(range(r))
ys = []
for k in range(r + 1):
    subsets = tuple(combinations(points, k))
    c = comb(r, k)
    assert len(subsets) == c
    counts = [len(S) for S in subsets]
    y = sum((Fraction(2 * (f[t] - base[t]), f[t] + base[t])
             for t in counts), Fraction(0)) / c
    ys.append(y)
    # Coefficient identity H[k]/C[k] is the actual subset average of f(K)/choose(r,K).
    avg = sum((Fraction(f[t], base[t]) for t in counts), Fraction(0)) / c
    assert H[k] / C[k] == avg

assert ys == [Fraction(0), Fraction(0), Fraction(198, 101)]

# The stated rank is guarded: 1 <= k and 2k <= r+2 (with k <= M as well).
# Check the two rank-boundary minors too, using zero extension at H[3], C[-1].
boundary_minors = {
    0: H[0] * C[0],
    2: H[2] * C[2],  # H[3] C[1] is zero by zero extension.
}
assert boundary_minors == {0: Fraction(1), 2: Fraction(100)}
k = 1
assert 1 <= k <= r and 2 * k <= r + 2
# Verify direction exactly: the generic shifted minor is negative.
minor = H[k] * C[k] - H[k + 1] * C[k - 1]
assert minor == Fraction(-96)
# Since C[k-1], C[k] are positive, division preserves the inequality direction:
# H[k]/C[k-1] - H[k+1]/C[k] equals minor/(C[k-1]C[k]) < 0.
den = C[k - 1] * C[k]
assert den == 2 and den > 0
assert H[k] / C[k - 1] - H[k + 1] / C[k] == minor / den == -48

print({
    "r": r, "M": r, "f_z_coefficients": list(f),
    "binomial_baseline_z_coefficients": list(base),
    "all_floor_hypotheses_hold": True,
    "actual_subset_exponent_y_by_k": [str(v) for v in ys],
    "guarded_boundary_minors_k0_k2": {str(k): str(v) for k, v in boundary_minors.items()},
    "guard": {"k": k, "k_le_M": k <= r, "1_le_k": 1 <= k,
              "2k_le_M_plus_2": 2 * k <= r + 2},
    "shifted_minor": str(minor),
    "normalizing_denominator": str(den),
    "normalized_difference": str(minor / den),
})
