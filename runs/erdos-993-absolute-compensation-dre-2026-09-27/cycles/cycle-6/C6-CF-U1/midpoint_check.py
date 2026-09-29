#!/usr/bin/env python3
"""Independent exact coefficient check for the homogeneous arity-2 midpoint."""

from math import comb


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def binom_coefficients(n):
    return [comb(n, k) for k in range(n + 1)]


def check(m):
    # All arrays below are coefficients in monomial powers of z.
    q = [1]
    for _ in range(m):
        q = mul(q, [1, 3, 1])
    c = mul(q, [1, 2])
    e = [0] + binom_coefficients(2 * m)
    k = m + 1
    direct = e[k] * c[k] - e[k + 1] * c[k - 1]
    assert (m + 1) * direct == comb(2 * m, m) * (
        (m + 2) * q[m] - (m - 1) * q[m - 1]
    )
    assert direct > 0
    return q[m], q[m - 1], direct


if __name__ == "__main__":
    for m in range(1, 9):
        center, prior, minor = check(m)
        print(f"m={m}: Q[m]={center}, Q[m-1]={prior}, M={minor}")
