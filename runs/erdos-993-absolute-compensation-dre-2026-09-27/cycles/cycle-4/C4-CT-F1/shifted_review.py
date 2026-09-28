#!/usr/bin/env python3
"""Small exact cross-checks for the Cycle 4 shifted-C claims."""
import json


def conv(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    while len(c) > 1 and c[-1] == 0:
        c.pop()
    return c


def add(a, b):
    c = [0] * max(len(a), len(b))
    for i, x in enumerate(a): c[i] += x
    for i, x in enumerate(b): c[i] += x
    while len(c) > 1 and c[-1] == 0: c.pop()
    return c


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def delta(a, k):
    return coeff(a, k + 1) - coeff(a, k)


def pow_poly(a, n):
    out = [1]
    for _ in range(n): out = conv(out, a)
    return out


def build(counts):
    rs = [r for r, n in zip((2, 3, 4), counts) for _ in range(n)]
    N = sum(rs)
    L, G = [1, 1], [1, 2]
    B = {r: add(pow_poly(L, r), [0, 1]) for r in (1, 2, 3, 4)}
    factors = [B[r] for r in rs]
    Q = [1]
    for f in factors: Q = conv(Q, f)
    C = conv(G, Q)
    # Build each distinct deletion by direct omission of its original factor.
    A = {}
    for r in set(rs):
        rem = list(factors)
        rem.pop(next(i for i, s in enumerate(rs) if s == r))
        H = [1]
        for f in rem: H = conv(H, f)
        A[r] = add(conv(conv(G, B[r - 1]), H), [0] + pow_poly(L, N))
    W = [0]
    for r, ar in A.items():
        W = add(W, [rs.count(r) * r * v for v in ar])
    P = add(C, [0] + pow_poly(L, N + 1))
    return rs, N, C, A, W, P


def check(counts, ranks):
    rs, N, C, A, W, P = build(counts)
    out = {"counts": counts, "N": N, "checked": []}
    for k in ranks:
        row = {"k": k, "guard": 1 <= k and 2*k <= N+2,
               "Ckm1": coeff(C, k-1), "Ck": coeff(C, k)}
        row["individual_margins"] = {
            str(r): coeff(A[r], k+1)*coeff(C, k-1)-coeff(A[r], k)*coeff(C, k)
            for r in sorted(A)}
        row["weighted_margin"] = coeff(W, k+1)*coeff(C, k-1)-coeff(W, k)*coeff(C, k)
        out["checked"].append(row)
    if counts == [38, 0, 1]:
        k=77; ar=A[4]
        out["witness"] = {
            "k": k, "Ck": coeff(C,k), "Ckm1": coeff(C,k-1),
            "A4k": coeff(ar,k), "A4k1": coeff(ar,k+1),
            "claim_gap_LHS_minus_RHS": coeff(ar,k+1)*coeff(C,k-1)-coeff(ar,k)*coeff(C,k),
            "alternate_RHS_minus_LHS": coeff(ar,k)*coeff(C,k)-coeff(ar,k+1)*coeff(C,k-1),
            "guard_2k_le_Nplus2": 2*k <= N+2,
            "first_strict_descent": next(k0 for k0 in range(len(P)) if delta(P,k0)<0),
            "terminal_difference": delta(P,len(P)-1),
        }
    if counts == [0,0,500]:
        x=next(k0 for k0 in range(len(P)) if delta(P,k0)<0)
        p=x+2
        out["eligible_rank"]={"x":x,"p":p,"xplus2":x+2<=p,
            "threep_lt_2alpha_plus1":3*p<2*(N+2)+1,
            "2p_le_alpha":2*p<=N+2,
            "selector_deltas": {str(r):delta(ar,p) for r,ar in A.items()},
            "weighted_delta":delta(W,p)}
    return out


print(json.dumps([
    check([38,0,1],[1,40,41,42,77]),
    check([1,1,1],[1,3,5]),
    check([0,0,500],[1,500,1001]),
], indent=2))
