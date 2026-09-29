"""Independent exact-integer replay of C5-F2's two assigned obstruction claims."""
from math import comb
import json
from pathlib import Path


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0

# Root-mixture example: B_2=(1+z)^2+z=(1,3,1), G=(1,2).
N, m, k = 20, 10, 4
C = [1, 2]
for _ in range(m):
    C = mul(C, [1, 3, 1])
d = [0] + [comb(N + 1, t) for t in range(N + 2)]  # z(1+z)^(N+1)
minor = coeff(d, k + 1) * coeff(C, k) - coeff(d, k) * coeff(C, k + 1)
assert [coeff(d, t) for t in (k, k+1)] == [1330, 5985]
assert [coeff(C, t) for t in (k, k+1)] == [27315, 125586]
assert minor == -3549105
# Ratios are defined and the sign is preserved because both denominators are positive.
assert coeff(C, k) * coeff(C, k + 1) > 0
ratio_step_numer = minor
mixture_step_numer = minor  # f(u)=u/(1+u) has f(v)-f(u)=(v-u)/((1+u)(1+v)); factors positive.
assert coeff(d, k) >= 0 and coeff(d, k + 1) >= 0

# Verify the actual first descent of P=C+z(1+z)^(N+1), with zero extension.
P = [coeff(C, t) + coeff(d, t) for t in range(max(len(C), len(d)))]
deltas = [coeff(P, t + 1) - coeff(P, t) for t in range(len(P))]
x = next(t for t, value in enumerate(deltas) if value < 0)
assert x == 11 and all(value >= 0 for value in deltas[:x])
alpha, p = N + 2, k
simple_guard = 1 <= p and 2 * p <= alpha
actual_eligible = p >= x + 2 and 3 * p < 2 * alpha + 1 and 2 * p <= alpha
assert simple_guard and not actual_eligible
# There is no actual p in this profile's lower-half band: p>=13 and p<=11 are incompatible.
assert x + 2 == 13 and alpha // 2 == 11

# Different denominators: evaluate both input minors and the componentwise sum.
C1, A1 = [1, 100], [1, 90]
C2, A2 = [100, 1], [80, 0]
minor1 = A1[1] * C1[0] - A1[0] * C1[1]
minor2 = A2[1] * C2[0] - A2[0] * C2[1]
Cs, As = [C1[t] + C2[t] for t in range(2)], [A1[t] + A2[t] for t in range(2)]
minor_sum = As[1] * Cs[0] - As[0] * Cs[1]
assert (minor1, minor2, minor_sum) == (-10, -80, 909)
assert min(C1 + C2) > 0 and min(A1 + A2) >= 0
# Ratios at the two ranks make the reversal explicit; denominator factors are positive.
assert (A1[0], A1[1], C1[0], C1[1]) == (1, 90, 1, 100)
assert (A2[0], A2[1], C2[0], C2[1]) == (80, 0, 100, 1)
assert (As[0], As[1], Cs[0], Cs[1]) == (81, 90, 101, 101)

# Fixed common denominator replacement: the cross-multiplied inequality sums linearly.
# Boundary weights 0 and an interior pair (2,3) are both covered by the identity.
common_C = (7, 11)
X, Y = (13, 4), (2, 9)
for weights in ((0, 0), (2, 3)):
    lhs = (weights[0]*X[1] + weights[1]*Y[1])*common_C[0]
    rhs = (weights[0]*X[0] + weights[1]*Y[0])*common_C[1]
    assert lhs-rhs == weights[0]*(X[1]*common_C[0]-X[0]*common_C[1]) + weights[1]*(Y[1]*common_C[0]-Y[0]*common_C[1])

out = {
  "root_mixture": {
    "profile": {"a2": 10, "a3": 0, "a4": 0}, "m": m, "N": N, "n": N+m+3,
    "alpha": alpha, "p": p, "x": x, "d_p_d_p1": [coeff(d,p), coeff(d,p+1)],
    "C_p_C_p1": [coeff(C,p), coeff(C,p+1)], "signed_minor": minor,
    "simple_guard_1_le_p_2p_le_alpha": simple_guard,
    "actual_eligibility_x_plus_2_le_p_and_lower_half": actual_eligible,
    "guard_failure": {"x_plus_2": x+2, "2p_le_alpha_implies_p_le": alpha//2},
    "direction": "The negative minor divided by positive C[p]C[p+1] makes d/C decrease. Since u/(1+u) is increasing for u>=0, d/(C+d) decreases too."
  },
  "different_denominators": {
    "C1": C1, "A1": A1, "C2": C2, "A2": A2,
    "input_signed_minors": [minor1, minor2], "sum_C": Cs, "sum_A": As,
    "sum_signed_minor": minor_sum, "sum_ratio_ranks": ["81/101", "90/101"]
  },
  "common_denominator_fixed_weights": {
    "identity": "(sum w_i X_i[1])C[0]-(sum w_i X_i[0])C[1]=sum w_i(X_i[1]C[0]-X_i[0]C[1])",
    "tested_weights": [[0,0],[2,3]], "denominator": list(common_C)
  }
}
Path(__file__).with_suffix('.json').write_text(json.dumps(out, indent=2) + "\n")
print(json.dumps(out, indent=2))
