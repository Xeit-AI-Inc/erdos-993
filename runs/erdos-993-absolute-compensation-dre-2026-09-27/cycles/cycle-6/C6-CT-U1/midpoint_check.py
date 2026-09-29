#!/usr/bin/env python3
"""Exact bounded replay of the arity-2 midpoint E-minor identities."""
from math import comb


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def power(base, m):
    out = [1]
    for _ in range(m):
        out = mul(out, base)
    return out


def main():
    G = [1, 2]
    for m in range(1, 13):
        N = 2 * m
        Q = power([1, 3, 1], m)
        C = mul(G, Q)
        E = [0] + [comb(N, k) for k in range(N + 1)]
        k = m + 1
        minor = E[k] * C[k] - E[k + 1] * C[k - 1]
        rhs_num = (m + 2) * Q[m] - (m - 1) * Q[m - 1]
        assert minor * (m + 1) == comb(N, m) * rhs_num
        assert 2 * k == N + 2  # outer guard boundary
        assert rhs_num > 0
        if m in (1, 2, 12):
            print(f"m={m}: Qm={Q[m]}, Qm-1={Q[m-1]}, minor={minor}, "
                  f"normalized={rhs_num}/{m+1}, guard=2k=N+2")
    print("exact coefficient identity and positivity checked for m=1..12")


if __name__ == '__main__':
    main()
