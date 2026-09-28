#!/usr/bin/env python3
"""Independent exact check of C3-T2's selector identity and fixed eligible row."""
import json


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, v in enumerate(a): out[i] += v
    for i, v in enumerate(b): out[i] += v
    return out


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): out[i + j] += x * y
    return out


def powp(a, n):
    out = [1]
    for _ in range(n): out = mul(out, a)
    return out


def delta(a, k):
    return (a[k + 1] if k + 1 < len(a) else 0) - (a[k] if k < len(a) else 0)


L, G = [1, 1], [1, 2]
B = {r: add(powp(L, r), [0, 1]) for r in (1, 2, 3, 4)}
F = {}
for r in (2, 3, 4):
    f = [0]
    for h in range(r - 1): f = add(f, powp(L, h))
    F[r] = f

# Coefficientwise verification of the local polynomial identity for every arity.
local_identity = {}
for r in (2, 3, 4):
    lhs = add(mul(L, B[r]), [-v for v in mul(G, B[r - 1])])
    rhs = [0, 0, 0] + F[r]
    local_identity[r] = lhs == rhs
assert all(local_identity.values())

# Build the producer's single fixed profile from factors, not its script.
profile = (3,) * 12 + (4,) * 10
N = sum(profile)
Q = [1]
for r in profile: Q = mul(Q, B[r])
C = mul(G, Q)
q, alpha = N + 1, N + 2
P = add(C, [0] + powp(L, q))
descents = [k for k in range(len(P)) if delta(P, k) < 0]
x = min(descents)

A0 = add(mul(L, Q), [0] + powp(L, N))
row = {"profile_counts": {"r2": 0, "r3": 12, "r4": 10}, "N": N,
       "m": len(profile), "q": q, "alpha": alpha, "x": x,
       "local_identity_each_arity": local_identity}
all_thresholds = True
for r in (3, 4):
    # Removing one factor of the requested arity constructs the cofactor directly.
    H, removed = [1], False
    for s in profile:
        if s == r and not removed:
            removed = True
        else:
            H = mul(H, B[s])
    Ai = add(mul(mul(G, B[r - 1]), H), [0] + powp(L, N))
    FH = mul(F[r], H)
    dA0, dAi, slope = delta(A0, 39), delta(Ai, 39), delta(FH, 36)
    assert dA0 - dAi == slope
    row[f"delta39_A{r}"] = dAi
    row[f"d{r}_36"] = slope
    row[f"branch_{r}_selected"] = dAi < 0
    row[f"threshold_{r}_crossed"] = slope > dA0
    all_thresholds &= slope > dA0
row["delta39_A0"] = delta(A0, 39)
row["p"] = 39
row["j"] = 37
row["eligible"] = x + 2 <= 39 and 3 * 39 < 2 * alpha + 1 and 2 * 39 <= alpha
row["endpoint_selected"] = delta(A0, 39) < 0
row["all_branch_thresholds_crossed"] = all_thresholds
assert row["eligible"] and row["endpoint_selected"]
assert row["branch_3_selected"] and row["branch_4_selected"]
assert row["all_branch_thresholds_crossed"]
print(json.dumps(row, sort_keys=True, indent=2))
