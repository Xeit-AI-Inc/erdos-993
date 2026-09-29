#!/usr/bin/env python3
"""Exact monomial-z checks of C6 surplus boundary and interior substitutions."""
from fractions import Fraction
from math import comb
import json


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a): out[i] += x
    for i, x in enumerate(b): out[i] += x
    return out


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): out[i + j] += x * y
    return out


def shift(a, s=1):
    return [0] * s + a


def G(): return [1, 2]


def B(r):
    # Explicit monomial coefficients in z: (1+z)^r + z.
    out = [comb(r, k) for k in range(r + 1)]
    out[1] += 1
    return out


def coeff(a, k): return a[k] if 0 <= k < len(a) else 0


def profile(rs, i):
    n = sum(rs)
    q = [1]
    for r in rs: q = mul(q, B(r))
    c = mul(G(), q)
    h = [1]
    for j, r in enumerate(rs):
        if j != i: h = mul(h, B(r))
    u = mul(mul(G(), B(rs[i] - 1)), h)
    e = [0] + [comb(n, t) for t in range(n + 1)]
    a2, a3, a4 = (rs.count(2), rs.count(3), rs.count(4))
    big_h = 1 + 2 * a2 + 4 * a3 + 7 * a4
    return n, big_h, c, u, e


def row(rs, i, k):
    n, h, c, u, e = profile(rs, i)
    M = coeff(e, k) * coeff(c, k) - coeff(e, k + 1) * coeff(c, k - 1)
    g = (k + 1) * (h - k + 1)
    surplus = (h + 1) * coeff(u, k) * coeff(c, k) + g * M
    lam = Fraction(h + 1, g)
    ratio = Fraction(coeff(c, k), coeff(c, k - 1))
    ratio_floor = Fraction(2 * (n + 2 - k), 3 * k)
    return {
        "m": len(rs), "counts": [rs.count(2), rs.count(3), rs.count(4)],
        "N": n, "h": h, "k": k, "guard": f"1<=k<={ (n+2)//2}",
        "Ck": str(coeff(c, k)), "Ckm1": str(coeff(c, k - 1)),
        "Uk": str(coeff(u, k)), "Ek": str(coeff(e, k)),
        "M": str(M), "lambda": str(lam), "lambda_U_over_E": str(lam * coeff(u, k) / coeff(e, k)),
        "ratio": str(ratio), "ratio_floor": str(ratio_floor),
        "ratio_floor_holds": ratio >= ratio_floor,
        "tail_surplus": str(surplus), "tail_surplus_positive": surplus > 0,
    }


cases = [
    ([2] * 100, 0, 51), # first high-band rank at N=200
    ([2] * 100, 0, 101), # midpoint at N=200
    ([3] * 100, 0, 76), # first high-band rank at N=300
    ([3] * 100, 0, 151),
    ([4] * 100, 0, 101), # maximum N for m=100
    ([2] * 40 + [3] * 30 + [4] * 30, 50, 100), # heterogeneous interior
]
out = []
for case in cases:
    r = row(*case)
    out.append({key: r[key] for key in (
        "m", "counts", "N", "k", "Ck", "Ckm1", "Uk", "Ek", "M",
        "lambda", "lambda_U_over_E", "ratio", "ratio_floor",
        "ratio_floor_holds", "tail_surplus", "tail_surplus_positive")})
assert all(x["ratio_floor_holds"] and x["tail_surplus_positive"] for x in out)
print(json.dumps(out, indent=2))
