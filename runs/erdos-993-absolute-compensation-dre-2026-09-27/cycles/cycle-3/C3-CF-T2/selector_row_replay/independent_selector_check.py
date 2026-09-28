#!/usr/bin/env python3
"""Independent exact polynomial audit of C3-T2 selector identity and row."""
import json

# Coefficients in ascending degree, with implicit zero extension.
def plus(a, b):
    n = max(len(a), len(b))
    return [(a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0) for i in range(n)]

def times(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for u, au in enumerate(a):
        for v, bv in enumerate(b):
            out[u + v] += au * bv
    return out

def delta(a, k):
    return (a[k + 1] if 0 <= k + 1 < len(a) else 0) - (a[k] if 0 <= k < len(a) else 0)

def lp(n):
    a = [1]
    for _ in range(n):
        a = times(a, [1, 1])
    return a

def shifted(a, n):
    return [0] * n + list(a)

# Verify L B_r - G B_(r-1) = z^3 F_r for every allowed r.
L, G = [1, 1], [1, 2]
for r in (2, 3, 4):
    br, brm = plus(lp(r), [0, 1]), plus(lp(r - 1), [0, 1])
    lhs = plus(times(L, br), [-v for v in times(G, brm)])
    rhs = shifted([sum((lp(h)[k] if k < len(lp(h)) else 0) for h in range(r - 1)) for k in range(r - 1)], 3)
    assert lhs == rhs, (r, lhs, rhs)
    # Multiplication by an arbitrary sample cofactor preserves the identity.
    H = [2, 0, 3, 1]
    assert times(lhs, H) == times(rhs, H)

profile = (3,) * 12 + (4,) * 10
N, m = sum(profile), len(profile)
q, alpha = N + 1, N + 2
B = {r: plus(lp(r), [0, 1]) for r in (2, 3, 4)}
F = {r: [sum((lp(h)[k] if k < len(lp(h)) else 0) for h in range(r - 1)) for k in range(r - 1)] for r in (2, 3, 4)}
Q = [1]
for r in profile:
    Q = times(Q, B[r])
C = times(G, Q)
P = plus(C, shifted(lp(q), 1))
# Search every natural coefficient index through and including terminal degree.
descents = [k for k in range(len(P)) if delta(P, k) < 0]
x = min(descents)
p, j = 39, 37
A0 = plus(times(L, Q), shifted(lp(N), 1))
per_arity = {}
for r in (3, 4):
    # Remove one occurrence, retaining the other 21 branch factors.
    H = [1]
    removed = False
    for s in profile:
        if s == r and not removed:
            removed = True
        else:
            H = times(H, B[s])
    Ai = plus(times(times(G, B[r - 1]), H), shifted(lp(N), 1))
    slope_poly = times(F[r], H)
    per_arity[str(r)] = {
        "delta_p_Ai": delta(Ai, p),
        "cofactor_slope": delta(slope_poly, p - 3),
        "strict_selected": delta(Ai, p) < 0,
        "threshold_crossed": delta(slope_poly, p - 3) > delta(A0, p),
    }
checks = {
    "first_strict_descent": x,
    "checked_all_indices_including_terminal": len(P),
    "N": N, "m": m, "q": q, "alpha": alpha,
    "p": p, "j": j,
    "guards": {"x_plus_2_le_p": x + 2 <= p, "3p_lt_2alpha_plus_1": 3 * p < 2 * alpha + 1, "2p_le_alpha": 2 * p <= alpha},
    "delta_p_A0": delta(A0, p),
    "endpoint_strict_selected": delta(A0, p) < 0,
    "tip_tags": sum(profile),
    "selected_tip_tags": sum(r * sum(1 for s in profile if s == r) for r in (3, 4) if per_arity[str(r)]["strict_selected"]),
    "per_arity": per_arity,
}
assert all(checks["guards"].values())
assert checks["endpoint_strict_selected"]
assert checks["selected_tip_tags"] == N
assert all(v["strict_selected"] and v["threshold_crossed"] for v in per_arity.values())
assert all(v["cofactor_slope"] < 0 for v in per_arity.values())
print(json.dumps(checks, sort_keys=True, indent=2))
