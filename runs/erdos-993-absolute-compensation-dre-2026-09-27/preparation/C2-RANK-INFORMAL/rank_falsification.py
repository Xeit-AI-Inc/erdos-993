#!/usr/bin/env python3
"""Exact independent coefficient sweep for the arity-2/3/4 rank theorem.

Run: PYTHONDONTWRITEBYTECODE=1 python3 rank_falsification.py 16
The bound is on the number of factors; profiles represent all ordered lists
with those counts because polynomial multiplication is commutative.
"""

from itertools import product
from math import comb
import sys


def add(a, b):
    return [get(a, i) + get(b, i) for i in range(max(len(a), len(b)))]


def get(a, i):
    return a[i] if 0 <= i < len(a) else 0


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def shift(a):
    return [0] + a


def lb(n):
    return [comb(n, k) for k in range(n + 1)]


def trim(a):
    while len(a) > 1 and a[-1] == 0:
        a.pop()
    return a


def D(d, f):
    return trim([3 * (k + 1) * get(f, k + 1)
                 + 2 * (k - d) * get(f, k) for k in range(len(f))])


def direct_Q(counts):
    """Center-choice/binomial sum, independent of polynomial multiplication."""
    n = sum(r * c for r, c in zip((2, 3, 4), counts))
    out = [0] * (n + 1)
    for picks in product(*(range(c + 1) for c in counts)):
        t = sum(picks)
        residual = n - sum(r * a for r, a in zip((2, 3, 4), picks))
        ways = 1
        for c, a in zip(counts, picks):
            ways *= comb(c, a)
        for j in range(residual + 1):
            out[t + j] += ways * comb(residual, j)
    return out


def check(max_m):
    G = [1, 2]
    expected = {2: [5], 3: [6, 2, 3], 4: [7, 6, 12, 4]}
    factors = {r: add(lb(r), [0, 1]) for r in (2, 3, 4)}
    assert D(1, G) == [4]
    assert D(0, [0, 1]) == [3, 2]
    assert D(1, [1, 1]) == [1]
    for r in (2, 3, 4):
        assert D(r, factors[r]) == expected[r], (r, D(r, factors[r]))

    profiles = ranks = drops = empty_cases = 0
    max_n = 0
    for n2 in range(max_m + 1):
        for n3 in range(max_m + 1 - n2):
            for n4 in range(max_m + 1 - n2 - n3):
                counts = (n2, n3, n4)
                n = 2 * n2 + 3 * n3 + 4 * n4
                q = n + 1
                Q, C, weight = [1], G[:], 1
                cert = D(1, G)
                for r, count in zip((2, 3, 4), counts):
                    for _ in range(count):
                        old_C, old_cert = C, cert
                        C = mul(C, factors[r])
                        cert = add(mul(old_cert, factors[r]),
                                   mul(old_C, expected[r]))
                        weight += r
                        assert D(weight, C) == trim(cert[:])
                        Q = mul(Q, factors[r])
                assert weight == q and C == mul(G, Q)
                assert Q == direct_Q(counts), counts

                H = shift(lb(q))
                H_cert = add(mul([3, 2], lb(q)),
                             [0] + [q * x for x in lb(q - 1)])
                assert D(q, H) == trim(H_cert), counts
                P = add(C, H)
                assert D(q, P) == trim(add(cert, H_cert)), counts
                assert all(x >= 0 for x in D(q, P)), counts
                assert len(P) == n + 3 and P[-1] == 1, counts

                direct = direct_Q(counts)
                direct_P = [get(direct, k) + 2 * get(direct, k - 1)
                            + (comb(q, k - 1) if 1 <= k <= q + 1 else 0)
                            for k in range(n + 3)]
                assert P == direct_P, counts
                assert P[0] == 1 and all(x >= 0 for x in P), counts
                if n == 0:
                    empty_cases += 1
                    assert P == [1, 3, 1]
                max_n = max(max_n, n)
                profiles += 1
                for k in range(n + 6):
                    a, b = get(P, k), get(P, k + 1)
                    assert get(D(q, P), k) == 3 * (k + 1) * b - 2 * (q - k) * a
                    assert 3 * (k + 1) * b >= 2 * (q - k) * a
                    if b < a:
                        drops += 1
                        assert a > 0
                        assert 2 * n <= 5 * k, (counts, k, a, b)
                    if 5 * k < 2 * n:
                        assert b >= a, (counts, k, a, b)
                    ranks += 1
    return profiles, ranks, drops, empty_cases, max_n


if __name__ == "__main__":
    bound = int(sys.argv[1]) if len(sys.argv) > 1 else 16
    assert bound >= 0
    profiles, ranks, drops, empty_cases, max_n = check(bound)
    print("PASS: exact integer exhaustive count-profile sweep")
    print(f"max_factors={bound} profiles={profiles} checked_k={ranks} "
          f"strict_drops={drops} empty_profiles={empty_cases} max_N={max_n}")
    print("Checks: local certificates; product identity; direct binomial expansion; "
          "parent certificate; zero extension; every strict descent and band rank.")
