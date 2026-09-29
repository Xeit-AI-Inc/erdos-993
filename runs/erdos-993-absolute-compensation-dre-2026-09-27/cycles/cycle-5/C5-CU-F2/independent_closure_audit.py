"""Exact independent audit of root-mixture and LR-sum closure controls."""
from math import comb
import json


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0

# Actual arity-2 path-star coefficient data: m=10, N=20.
# B_2=(1+z)^2+z=(1,3,1), G=(1,2).
C = [1, 2]
for _ in range(10):
    C = mul(C, [1, 3, 1])
N, m = 20, 10
# d=z(1+z)^(N+1); all arrays are zero-extended.
d = [0] + [comb(N + 1, k) for k in range(N + 2)]
k = 4
gap = coeff(d, k + 1) * coeff(C, k) - coeff(d, k) * coeff(C, k + 1)
assert [coeff(d, k), coeff(d, k + 1), coeff(C, k), coeff(C, k + 1)] == [1330, 5985, 27315, 125586]
assert gap == -3549105
# The root mixture coefficient weight d/(C+d) is increasing from k to k+1 iff gap >= 0.
# Check the simple coefficient guard, and separately compute true parent first descent.
Pcore = C[:]
parent = [coeff(Pcore, i) + (comb(N + 1, i - 1) if 1 <= i <= N + 2 else 0) for i in range(N + 3)]
first_descent = next(i for i in range(len(parent)) if coeff(parent, i + 1) - coeff(parent, i) < 0)
assert 1 <= k and 2 * k <= N + 2
# A counterexample to arbitrary different-denominator addition.
C1, A1 = [1, 100], [1, 90]
C2, A2 = [100, 1], [80, 0]
assert A1[1] * C1[0] <= A1[0] * C1[1]
assert A2[1] * C2[0] <= A2[0] * C2[1]
Csum = [C1[i] + C2[i] for i in range(2)]
Asum = [A1[i] + A2[i] for i in range(2)]
separate_sum_gap = Asum[1] * Csum[0] - Asum[0] * Csum[1]
assert separate_sum_gap == 909
# Under the same denominator C, nonnegative weighted minors sum exactly.
# Each term condition is X_i[k+1] C[k-1] - X_i[k] C[k] <= 0.
# The weighted condition is their sum with the same nonnegative fixed weights.
result = {
    "root_mixture": {
        "profile": {"a2": 10, "a3": 0, "a4": 0},
        "m": m,
        "N": N,
        "n": N + m + 3,
        "alpha": N + 2,
        "k": k,
        "simple_guard_1_le_k_2k_le_N_plus_2": True,
        "actual_first_strict_descent_x": first_descent,
        "is_actual_eligible_p": k >= first_descent + 2 and 3 * k < 2 * (N + 2) + 1 and 2 * k <= N + 2,
        "d_k": coeff(d, k),
        "d_k1": coeff(d, k + 1),
        "C_k": coeff(C, k),
        "C_k1": coeff(C, k + 1),
        "signed_minor_d_k1_C_k_minus_d_k_C_k1": gap,
        "interpretation": "d/C and d/(C+d) decrease across this coefficient step; this refutes all-rank mixture monotonicity only, not a selected/deletion claim"
    },
    "different_denominators_sum": {
        "C1": C1, "A1": A1, "C2": C2, "A2": A2,
        "individual_nondecreasing_ratio_minors": [A1[1]*C1[0]-A1[0]*C1[1], A2[1]*C2[0]-A2[0]*C2[1]],
        "sum_denominator": Csum, "sum_numerator": Asum,
        "signed_sum_minor": separate_sum_gap,
        "interpretation": "both input minors are nonpositive, while the sum minor is positive"
    },
    "same_denominator_weighted_sum": "valid by linearity of the cross-multiplied minor for fixed nonnegative weights"
}
print(json.dumps(result, indent=2))
