"""Independent exact audit of the m>=120 local branch-mass argument."""
from fractions import Fraction
from math import comb, factorial
import json
from pathlib import Path


def conv(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def add(a, b):
    return [(a[k] if k < len(a) else 0) + (b[k] if k < len(b) else 0) for k in range(max(len(a), len(b)))]


def Lpow(n):
    return [comb(n, k) for k in range(n + 1)]


def B(r):
    p = Lpow(r)
    p[1] += 1
    return p


def branch_factor(r):
    f = [0]
    for h in range(r - 1):
        f = add(f, Lpow(h))
    g = [1, 2]
    return conv(g, f)


def binom0(n, k):
    return comb(n, k) if 0 <= k <= n else 0

# Exact finite Taylor constants used for continuation.
a = Fraction(119, 20)
def E(d, x):
    return sum((x**h / factorial(h) for h in range(d + 1)), Fraction(0))
e8 = E(8, a)
e7 = E(7, a)
assert e8 > 288
assert e7 > 48

# Independently replay all local singleton-probability values over a wide
# exact integer window; universal extension is justified in REPORT.md.
probability_count = 0
minimum_gap = None
for M in range(44, 501):
    for k in range((M + 2) // 3, M // 2 + 2):
        if 2 * k > M + 2:
            continue
        for r in (2, 3, 4):
            p = Fraction(r * comb(M-r, k-1), comb(M, k))
            gap = Fraction(2, 2*r+1) * p - Fraction(1, 20)
            assert gap >= 0
            if minimum_gap is None or gap < minimum_gap:
                minimum_gap = gap
            probability_count += 1

# Verify the binomial-debt bound exactly on a large bounded window; the
# REPORT.md gives its concavity proof for the full domain.
ratio_rows = 0
for N in range(28, 2001):
    for j in range((2*N)//5, (N-2)//2 + 1):
        if 5*j <= 2*N-1:
            continue
        if 2*j > N-2:
            continue
        left = Fraction((N+1-j) * (N-2*j-1), j+1)
        right = Fraction(3*(N-3), 10)
        assert left < right
        ratio_rows += 1

# Actual first-descent boundary checks at m=120, including strict terminal
# extension and each represented branch. These are adversarial spot checks,
# not the universal proof.
def check_profile(rs):
    m = len(rs)
    N = sum(rs)
    C = [1, 2]
    for r in rs:
        C = conv(C, B(r))
    P = add(C, [0] + Lpow(N + 1))
    degree = len(P) - 1
    x = next(k for k in range(degree + 1) if (P[k+1] if k+1 < len(P) else 0) - P[k] < 0)
    assert 5*x > 2*N-1
    gf = {r: branch_factor(r) for r in set(rs)}
    checked = 0
    min_slack = None
    for p in range(x+2, (N+2)//2 + 1):
        if 3*p >= 2*(N+2)+1 or 2*p > N+2:
            continue
        j = p-2
        delta = N+1-j
        D = binom0(N,j+1)-binom0(N,j)
        for i,r in enumerate(rs):
            T = gf[r]
            for h,s in enumerate(rs):
                if h != i:
                    T = conv(T,B(s))
            coeff = T[j] if j < len(T) else 0
            slack = 2*coeff-3*delta*D
            assert slack >= 0, (rs[:6],N,x,p,j,r,slack)
            min_slack = slack if min_slack is None else min(min_slack,slack)
            checked += 1
    return {"m":m,"N":N,"x":x,"eligible_branch_rows":checked,"minimum_integer_slack":min_slack}

profiles = [
    [2]*120,
    [3]*120,
    [4]*120,
    [2,3,4]*40,
    [2,2,3,3,4,4]*20,
]
profile_results = [check_profile(rs) for rs in profiles]
# empty actual eligible set is retained in output

out = {
    "scope": "independent exact rational/polynomial audit of m>=120 local branch-mass argument; finite actual-family boundary probes only",
    "E8_119_over_20": f"{e8.numerator}/{e8.denominator}",
    "E8_gt_288": True,
    "E7_119_over_20": f"{e7.numerator}/{e7.denominator}",
    "E7_gt_48": True,
    "singleton_probability_rows_M44_to_500": probability_count,
    "minimum_gap_over_1_20": f"{minimum_gap.numerator}/{minimum_gap.denominator}",
    "binomial_ratio_rows_N28_to_2000": ratio_rows,
    "actual_m120_profiles": profile_results,
}
Path(__file__).with_suffix('.json').write_text(json.dumps(out, indent=2) + "\n")
print(json.dumps(out, indent=2))
