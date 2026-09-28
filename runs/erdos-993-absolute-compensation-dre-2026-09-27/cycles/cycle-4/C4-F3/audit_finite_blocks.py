"""Independent exact checks for finite-block coefficient/Jensen boundary cases.
Run from this directory with: PYTHONDONTWRITEBYTECODE=1 python3 audit_finite_blocks.py
"""
from fractions import Fraction
from math import comb
from itertools import product
import json


def conv(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def binom_ext(n, k):
    return comb(n, k) if 0 <= k <= n else 0


def block_coeffs(r, surplus=0):
    # f(t)=C(r,t), with an optional extra singleton from an outside vertex.
    return [comb(r, t) + (surplus if t == 1 else 0) for t in range(r + 1)]


def audit_case(rs, k, surpluses=None):
    surpluses = surpluses or [0] * len(rs)
    M = sum(rs)
    fs = [block_coeffs(r, s) for r, s in zip(rs, surpluses)]
    H = [1]
    for f in fs:
        H = conv(H, f)
    lhs = H[k]
    denom = comb(M, k)
    direct_expectation = Fraction(0)
    marginal_sum = Fraction(0)
    for counts in product(*(range(r + 1) for r in rs)):
        if sum(counts) != k:
            continue
        ways = 1
        val = 1
        for r, f, t in zip(rs, fs, counts):
            ways *= comb(r, t)
            val *= Fraction(f[t], comb(r, t))
        direct_expectation += Fraction(ways, denom) * val
    for r, f in zip(rs, fs):
        for t in range(r + 1):
            prob = Fraction(comb(r, t) * binom_ext(M-r, k-t), denom)
            c = comb(r, t)
            marginal_sum += prob * Fraction(2 * (f[t] - c), f[t] + c)
    assert Fraction(lhs, denom) == direct_expectation
    # Jensen plus log(w)>=2(w-1)/(w+1): H[k]/C(M,k) >= exp(y).
    # For each d>=0, exp(y)>=sum_{a<=d}y^a/a! since y>=0.
    assert marginal_sum >= 0
    taylor = [Fraction(1)]
    for d in range(1, 9):
        taylor.append(taylor[-1] * marginal_sum / d)
        assert Fraction(lhs, denom) >= sum(taylor)
    return {
        "r": rs, "k": k, "M": M, "Hk": lhs,
        "choose_M_k": denom, "expectation": str(direct_expectation),
        "jensen_exponent_y": str(marginal_sum),
        "taylor_d8": str(sum(taylor)),
    }


cases = []
# Empty family M=k=0; all-singleton blocks including size 1; both endpoints;
# mixed blocks with outside-singleton surplus; and nontrivial interior ranks.
for rs, ks, surpluses in [
    ([], [0], []),
    ([1], [0, 1], [1]),
    ([1, 1, 1], [0, 1, 2, 3], [1, 1, 1]),
    ([2, 3], [0, 1, 2, 3, 4, 5], [1, 1]),
    ([1, 2, 4], [0, 1, 3, 7], [1, 1, 1]),
]:
    for k in ks:
        cases.append(audit_case(rs, k, surpluses))

print(json.dumps({"cases_checked": len(cases), "checks": cases}, indent=2))
