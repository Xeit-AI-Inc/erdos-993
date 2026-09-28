"""Independent exact checker for homogeneous arity-4 center layers."""
import json
from math import comb
from pathlib import Path


def multiply(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for u, x in enumerate(a):
        for v, y in enumerate(b):
            c[u + v] += x * y
    return c


def binomial_power(n):
    return [comb(n, k) for k in range(n + 1)]


def coeff(poly, k):
    return poly[k] if 0 <= k < len(poly) else 0


def difference(poly, k):
    return coeff(poly, k + 1) - coeff(poly, k)


def add_at(a, b, shift=0):
    out = a[:]
    if len(out) < len(b) + shift:
        out.extend([0] * (len(b) + shift - len(out)))
    for i, x in enumerate(b):
        out[i + shift] += x
    return out


def profile(m):
    r = 4
    nbranch = m
    N = 4 * m
    q, alpha = N + 1, N + 2
    Lq = binomial_power(q)
    L_N = binomial_power(N)
    B = binomial_power(4)
    B[1] += 1
    Q = [1]
    for _ in range(m):
        Q = multiply(Q, B)
    G = [1, 2]
    C = multiply(G, Q)
    P = add_at(C, Lq, 1)
    x = next(k for k in range(len(P) + 1) if difference(P, k) < 0)
    A0 = add_at(multiply([1, 1], Q), L_N, 1)
    B3 = binomial_power(3)
    B3[1] += 1
    H = [1]
    for _ in range(m - 1):
        H = multiply(H, B)
    Ai = add_at(multiply(G, multiply(B3, H)), L_N, 1)
    # Contract F_4 = 1 + (1+z) + (1+z)^2 = 3+3z+z^2.
    GF = [3, 9, 7, 2]
    rows = []
    for p in range(x + 2, alpha + 1):
        if 3 * p >= 2 * alpha + 1 or 2 * p > alpha:
            continue
        j = p - 2
        delta = q - j
        D = comb(N, j + 1) - comb(N, j)
        # Exact center-layer expansion using binomial terms, independently of convolution.
        layer = []
        for depth in range(4):
            u = 0
            for ell in range(min(depth, m - 1) + 1):
                for t, g in enumerate(GF):
                    k = j - ell - t
                    rem = N - 4 - 4 * ell
                    if 0 <= k <= rem:
                        u += comb(m - 1, ell) * g * comb(rem, k)
            layer.append(u)
        trueT = sum(GF[t] * coeff(H, j - t) for t in range(4))
        rows.append({
            "p": p, "j": j, "delta": delta, "D": D,
            "e0": int(difference(A0, p) < 0),
            "ei": int(difference(Ai, p) < 0),
            "T_i_j": trueT,
            "target_3deltaD": 3 * delta * D,
            "layers": [{"depth": d, "U": u, "margin_2U_minus_target": 2*u - 3*delta*D} for d, u in enumerate(layer)],
        })
    return {"m": m, "n": N + m + 3, "N": N, "alpha": alpha, "q": q, "x": x, "profile_counts": {"a2": 0, "a3": 0, "a4": m}, "eligible_rows": rows}


result = {"method": "Independent exact binomial expansion with contract GF4 coefficients (3,9,7,2).", "cases": [profile(40), profile(150)]}
Path(__file__).with_name("independent_layer_evidence.json").write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps([{"m":c["m"], "x":c["x"], "rows":[{"p":r["p"],"selectors":[r["e0"],r["ei"]],"T_i_j":str(r["T_i_j"]),"margins":[str(x["margin_2U_minus_target"]) for x in r["layers"]]} for r in c["eligible_rows"]]} for c in result["cases"]], indent=2))
