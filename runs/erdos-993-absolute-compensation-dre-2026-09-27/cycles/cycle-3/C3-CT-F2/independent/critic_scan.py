#!/usr/bin/env python3
"""Independent exact C3-F2 prefix scan from the sealed polynomial contract."""
from itertools import product
from math import comb
import json

def conv(u, v):
    w = [0] * (len(u) + len(v) - 1)
    for a, x in enumerate(u):
        for b, y in enumerate(v):
            w[a + b] += x * y
    return w

def plus(u, v):
    w = [0] * max(len(u), len(v))
    for i, x in enumerate(u): w[i] += x
    for i, x in enumerate(v): w[i] += x
    return w

def at(u, k):
    return u[k] if 0 <= k < len(u) else 0

def d(u, k):
    return at(u, k + 1) - at(u, k)

def binom(n, k):
    return comb(n, k) if 0 <= k <= n else 0

L = [1, 1]
G = [1, 2]
B = {r: plus([comb(r, k) for k in range(r + 1)], [0, 1]) for r in (1, 2, 3, 4)}
F = {r: [sum(comb(h, k) for h in range(r - 1) if k <= h) for k in range(r - 1)] for r in (2, 3, 4)}

def make_product(counts):
    if counts not in qcache:
        prev = list(counts)
        r = next(r for r, n in zip((2, 3, 4), counts) if n)
        prev[r - 2] -= 1
        qcache[counts] = conv(make_product(tuple(prev)), B[r])
    return qcache[counts]

qcache = {(0, 0, 0): [1]}
profile_count = row_count = 0
min_pay = min_mass = None
bad_pay = bad_mass = 0
endpoint_only = not_all_selected = 0
for m in range(1, 70):
    for c2 in range(m + 1):
        for c3 in range(m - c2 + 1):
            c4 = m - c2 - c3
            counts = (c2, c3, c4)
            profile_count += 1
            N = 2*c2 + 3*c3 + 4*c4
            alpha, q = N + 2, N + 1
            Q = make_product(counts)
            C = conv(G, Q)
            P = plus(C, [0] + [comb(q, k) for k in range(q + 1)])
            x = next(k for k in range(len(P)) if d(P, k) < 0)
            A0 = plus(conv(L, Q), [0] + [comb(N, k) for k in range(N + 1)])
            branch = {}
            for r, n in zip((2, 3, 4), counts):
                if not n: continue
                H = make_product(tuple(v - int(s == r) for s, v in zip((2, 3, 4), counts)))
                T = conv(conv(G, F[r]), H)
                Ai = plus(conv(conv(G, B[r - 1]), H), [0] + [comb(N, k) for k in range(N + 1)])
                branch[r] = (T, Ai)
            for p in range(x + 2, alpha // 2 + 1):
                if not 3*p < 2*alpha + 1: continue
                j, delta = p - 2, q - (p - 2)
                D = binom(N, j + 1) - binom(N, j)
                assert delta > 0 and D > 0
                e0 = int(d(A0, p) < 0)
                b, A = e0, 0
                selected_branches = []
                for r, n in zip((2, 3, 4), counts):
                    if not n: continue
                    T, Ai = branch[r]
                    ei = int(d(Ai, p) < 0)
                    selected_branches.append((r, ei))
                    b += r*n*ei
                    A += r*n*ei*at(T, j)
                Cj, Cnext = at(C, j), at(C, j + 1)
                payment = (delta*Cj - (delta - 1)*Cnext)*A - b*delta*D*Cj
                mass = A - b*delta*D
                row_count += 1
                endpoint_only += int(e0 and not any(flag for _, flag in selected_branches))
                not_all_selected += int(not (e0 and all(flag for _, flag in selected_branches)))
                if min_pay is None or payment < min_pay[0]:
                    min_pay = (payment, counts, N, p, j, x, alpha, q, delta, e0, selected_branches, b, A, D, Cj, Cnext)
                if min_mass is None or mass < min_mass[0]:
                    min_mass = (mass, counts, N, p, j, x, b, A, D)
                bad_pay += payment < 0
                bad_mass += mass < 0

print(json.dumps({"profiles": profile_count, "eligible_rows": row_count,
                  "negative_payment_rows": bad_pay, "negative_mass_rows": bad_mass,
                  "endpoint_only_rows": endpoint_only, "not_all_selected_rows": not_all_selected,
                  "minimum_payment_row": min_pay, "minimum_mass_row": min_mass}, indent=2))
