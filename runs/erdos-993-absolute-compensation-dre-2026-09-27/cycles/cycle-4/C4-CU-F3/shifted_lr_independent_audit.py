"""Exact bounded replay for guarded shifted-C deletion and tip-deck LR claims.

Run with PYTHONDONTWRITEBYTECODE=1 python3 shifted_lr_independent_audit.py
No producer code is imported.
"""
from itertools import product
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
        for j, y in enumerate(b): out[i+j] += x*y
    return out


def power_linear(degree):
    a = [1]
    for _ in range(degree): a = mul(a, [1, 1])
    return a


def branch(r):
    a = power_linear(r)
    a[1] += 1
    return a


def g_times(a): return mul([1, 2], a)


def coeff(a, k): return a[k] if 0 <= k < len(a) else 0


def profile(rs):
    q = [1]
    for r in rs: q = mul(q, branch(r))
    C = g_times(q)
    deletions = []
    for i, r in enumerate(rs):
        H = [1]
        for h, s in enumerate(rs):
            if h != i: H = mul(H, branch(s))
        F = [0] * (r-1)
        for h in range(r-1):
            term = power_linear(h)
            F = add(F, term)
        Ai = add(mul(g_times(F), H), [0] + power_linear(sum(rs)))
        deletions.append(Ai)
    A0 = add(mul([1, 1], q), [0] + power_linear(sum(rs)))
    W = [0]
    for r, Ai in zip(rs, deletions): W = add(W, [r*x for x in Ai])
    return C, A0, deletions, W


rows = 0
minima = {"endpoint": None, "tip": None, "weighted_deck": None}
first_bad = None
checkpoints = {}
for m in range(1, 9):
    for counts in product(range(m+1), repeat=2):
        a2, a3 = counts
        a4 = m-a2-a3
        if a4 < 0: continue
        rs = [2]*a2 + [3]*a3 + [4]*a4
        N = sum(rs)
        C, A0, Ais, W = profile(rs)
        decks = [("endpoint", A0)] + [("tip", Ai) for Ai in Ais] + [("weighted_deck", W)]
        for k in range(1, (N+2)//2 + 1):
            rows += 1
            for label, A in decks:
                # Claimed inequality: A[k+1] C[k-1] <= A[k] C[k].
                # Margin is RHS-LHS, so nonnegative means the displayed direction holds.
                margin = coeff(A,k)*coeff(C,k) - coeff(A,k+1)*coeff(C,k-1)
                if minima[label] is None or margin < minima[label][0]:
                    minima[label] = (margin, rs, k)
                if margin < 0 and first_bad is None:
                    first_bad = {"kind":label,"profile":rs,"N":N,"k":k,"margin_rhs_minus_lhs":margin}
                if tuple(rs) in {(2,), (2, 3)} and k in {1, 2, (N+2)//2}:
                    checkpoints[f"{label}:{rs}:k{k}"] = margin

print(json.dumps({
    "method":"independent monomial-basis convolution from L=1+z, G=1+2z, B_r=L^r+z; exact integers",
    "profiles":"all arity-count profiles with 1<=m<=8",
    "guard":"1<=k<=floor((N+2)/2)",
    "guarded_rank_rows":rows,
    "minimum_rhs_minus_lhs":{key:{"margin":val[0],"profile":val[1],"N":sum(val[1]),"k":val[2]} for key,val in minima.items()},
    "exact_boundary_and_interior_checkpoints_rhs_minus_lhs":checkpoints,
    "first_guarded_counterexample":first_bad,
    "interpretation":"bounded evidence only; no universal conclusion",
}, indent=2))
