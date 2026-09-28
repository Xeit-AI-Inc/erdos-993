#!/usr/bin/env python3
"""Independent exact-polynomial replay of one fixed selector obstruction."""
import json


def add(a, b):
    c = [0] * max(len(a), len(b))
    for i, x in enumerate(a): c[i] += x
    for i, x in enumerate(b): c[i] += x
    return c


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): c[i+j] += x*y
    return c


def power(a, n):
    c = [1]
    for _ in range(n): c = mul(c, a)
    return c


def delta(a, k):
    return (a[k+1] if k+1 < len(a) else 0) - (a[k] if k < len(a) else 0)

L = [1, 1]
G = [1, 2]
profile = [3]*12 + [4]*10
N = sum(profile)
q, alpha = N+1, N+2
B = {r: add(power(L, r), [0, 1]) for r in (2, 3, 4)}
F = {r: [sum(power(L, h)[k] if k < len(power(L, h)) else 0 for h in range(r-1)) for k in range(r-1)] for r in (2, 3, 4)}
Q = [1]
for r in profile: Q = mul(Q, B[r])
C = mul(G, Q)
P = add(C, [0] + power(L, q))
xs = [k for k in range(len(P)) if delta(P, k) < 0]
x = min(xs)

A0 = add(mul(L, Q), [0] + power(L, N))
Ai_values = {}
slopes = {}
for r in (3, 4):
    H = [1]
    removed = False
    for s in profile:
        if s == r and not removed: # exclude exactly one represented branch
            removed = True
            continue
        H = mul(H, B[s])
    Ai = add(mul(mul(G, B[r-1]), H), [0] + power(L, N))
    Ai_values[r] = delta(Ai, 39)
    slopes[r] = delta(mul(F[r], H), 36)

p, j = 39, 37
eligible = x+2 <= p and 3*p < 2*alpha+1 and 2*p <= alpha
out = {
    "profile_counts": {"r2": profile.count(2), "r3": profile.count(3), "r4": profile.count(4)},
    "m": len(profile), "N": N, "q": q, "alpha": alpha,
    "x": x, "p": p, "j": j, "eligible": eligible,
    "delta_p_A0": delta(A0, p),
    "delta_p_A3": Ai_values[3], "delta_p_A4": Ai_values[4],
    "d3_delta_p_minus_3": slopes[3], "d4_delta_p_minus_3": slopes[4],
    "endpoint_selected": delta(A0, p) < 0,
    "r3_tips_selected": Ai_values[3] < 0,
    "r4_tips_selected": Ai_values[4] < 0,
}
print(json.dumps(out, sort_keys=True, indent=2))
