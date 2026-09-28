#!/usr/bin/env python3
"""Direct-factor exact checks for the C2-T2 selector claims."""
import json
from pathlib import Path
from math import comb


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a): out[i] += x
    for i, x in enumerate(b): out[i] += x
    return out


def shift(a, k): return [0] * k + a

def coeff(a, k): return a[k] if 0 <= k < len(a) else 0

def diff(a, k): return coeff(a, k + 1) - coeff(a, k)

def Lpow(n): return [comb(n, k) for k in range(n + 1)]

def B(r):
    a = Lpow(r)
    a[1] += 1
    return a

def F(r):
    a = [0]
    for h in range(r - 1): a = add(a, Lpow(h))
    return a

def prod(xs):
    z = [1]
    for x in xs: z = mul(z, x)
    return z


def inspect(counts):
    arities = [2] * counts[0] + [3] * counts[1] + [4] * counts[2]
    N = sum(arities); m = len(arities); q = N + 1; alpha = N + 2
    branch = [B(r) for r in arities]
    Q = prod(branch)
    C = mul([1, 2], Q)
    P = add(C, shift(Lpow(q), 1))
    x = next(k for k in range(len(P)) if diff(P, k) < 0)
    A0 = add(mul([1, 1], Q), shift(Lpow(N), 1))
    jrows = []
    for p in range(x + 2, N + 4):
        if 3 * p >= 2 * alpha + 1 or 2 * p > alpha: continue
        j = p - 2; delta = q - j
        e0 = int(diff(A0, p) < 0)
        arity_slopes = {}
        A = 0; b = e0
        for r in sorted(set(arities)):
            # Remove one factor by reconstructing all other original branches.
            idx = arities.index(r)
            H = prod(branch[k] for k in range(m) if k != idx)
            Ai = add(mul(mul([1, 2], B(r - 1)), H), shift(Lpow(N), 1))
            d_i = diff(shift(mul(F(r), H), 3), p)
            assert diff(A0, p) - diff(Ai, p) == d_i
            ei = int(diff(Ai, p) < 0)
            arity_slopes[str(r)] = {"d_i": d_i, "delta_p_Ai": diff(Ai, p), "ei": ei}
            if ei:
                # T_i = G F_r H, and all equal-arity indices have same T_i.
                T = mul(mul([1, 2], F(r)), H)
                A += counts[r - 2] * r * coeff(T, j)
                b += counts[r - 2] * r
        D = comb(N, j + 1) - comb(N, j) if 0 <= j <= N else 0
        margin = (delta * coeff(C, j) - (delta - 1) * coeff(C, j + 1)) * A - b * delta * D * coeff(C, j)
        jrows.append({"p": p, "j": j, "delta": delta, "e0": e0,
                      "delta_p_A0": diff(A0, p), "branch_slopes": arity_slopes,
                      "A": A, "b": b, "D_j": D, "C_j": coeff(C, j),
                      "C_j1": coeff(C, j + 1), "primary_margin": margin})
    return {"counts": counts, "m": m, "N": N, "alpha": alpha, "q": q, "x": x, "rows": jrows}


if __name__ == "__main__":
    data = [inspect((0, 12, 10)), inspect((0, 0, 173))]
    with open(Path(__file__).resolve().parent / "independent-checks.json", "w") as f: json.dump(data, f, indent=2, sort_keys=True)
    for d in data:
        print(json.dumps({k: v for k, v in d.items() if k != "rows"} | {"rows": [{k: r[k] for k in ("p", "j", "e0", "A", "b", "D_j", "C_j", "C_j1", "primary_margin")} for r in d["rows"]]}, sort_keys=True))
