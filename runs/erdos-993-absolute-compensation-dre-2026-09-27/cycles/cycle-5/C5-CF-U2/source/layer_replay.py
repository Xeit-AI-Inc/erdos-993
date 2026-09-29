#!/usr/bin/env python3
"""Exact independent replay of a homogeneous arity-4 activity-layer obstruction."""
from math import comb
import json
from pathlib import Path


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a):
        out[i] += x
    for i, x in enumerate(b):
        out[i] += x
    return out


def at(a, k):
    return a[k] if 0 <= k < len(a) else 0


def power(a, e):
    out = [1]
    for _ in range(e):
        out = mul(out, a)
    return out


L = [1, 1]
G = [1, 2]
B3 = [1, 4, 3, 1]
B4 = [1, 5, 6, 4, 1]
E12 = [0] + [comb(12, j) for j in range(13)]


def case(m):
    # t marks center choices in the m-1 unmarked B4 factors only.
    # At t-degree d, choosing d copies of tz leaves m-1-d copies of L^4.
    def layer(base, d):
        if not 0 <= d <= m - 1:
            return [0]
        return mul([0] * d + [comb(m - 1, d)], mul(base, power([1, 4, 6, 4, 1], m - 1 - d)))

    # Keep the distinguished branch factor in each polynomial.
    ug = mul(G, B3)
    cg = mul(G, B4)
    layers_u = [layer(ug, d) for d in range(m)]
    layers_c = [layer(cg, d) for d in range(m)]

    def minor_layer(d, k):
        # [t^d](U_t[k] C_t[k] - U_t[k+1] C_t[k-1])
        total = 0
        for a in range(m):
            b = d - a
            if 0 <= b < m:
                total += at(layers_u[a], k) * at(layers_c[b], k)
                total -= at(layers_u[a], k + 1) * at(layers_c[b], k - 1)
        # E is independent of t, so only its product with [t^d] C contributes.
        if 0 <= d < m:
            total += at(E12, k) * at(layers_c[d], k)
            total -= at(E12, k + 1) * at(layers_c[d], k - 1)
        return total

    k = m + 4
    N = 4 * m
    full_c = mul(G, power(B4, m))
    full_u = mul(ug, power(B4, m - 1))
    full_a = add(full_u, [0] + [comb(N, j) for j in range(N + 1)])
    full_margin = at(full_a, k) * at(full_c, k) - at(full_a, k + 1) * at(full_c, k - 1)
    out = {
        "m": m,
        "N": N,
        "n": N + m + 3,
        "k": k,
        "two_k": 2 * k,
        "guard_2k_le_N_plus_2": 2 * k <= N + 2,
        "layer_degree": 2 * m - 3,
        "layer_margin": minor_layer(2 * m - 3, k),
        "predicted_layer_margin": -33 * (m - 1),
        "full_t1_margin": full_margin,
    }
    assert out["guard_2k_le_N_plus_2"]
    assert out["layer_margin"] == out["predicted_layer_margin"]
    return out


def first_descent(p):
    # Return the least natural k for which P[k+1]-P[k] is strictly negative.
    return next(k for k in range(len(p)) if at(p, k + 1) - at(p, k) < 0)


cases = [case(m) for m in range(3, 21)]
m3 = cases[0]
parent = add(mul(G, power(B4, 3)), [0] + [comb(13, j) for j in range(14)])
x = first_descent(parent)
result = {
    "scope": "Exact coefficientwise activity-layer obstruction for the guarded shifted C-to-tip minor, homogeneous arity 4, m>=3; no full-target counterexample.",
    "m3_actual_first_descent_x": x,
    "m3_eligible_p_exists": any(x + 2 <= p and 3 * p < 2 * (12 + 2) + 1 and 2 * p <= 12 + 2 for p in range(30)),
    "m3_case": m3,
    "all_cases_m3_to_20": cases,
    "local_factor_coefficients": {
        "G_B3_L4_at_6": at(mul(mul(G, B3), [1, 4, 6, 4, 1]), 6),
        "G_B4_at_5": at(mul(G, B4), 5),
        "G_B3_at_5": at(mul(G, B3), 5),
        "G_B4_L4_at_6": at(mul(mul(G, B4), [1, 4, 6, 4, 1]), 6),
        "G_B3_L4_at_7": at(mul(mul(G, B3), [1, 4, 6, 4, 1]), 7),
        "G_B4_at_4": at(mul(G, B4), 4),
        "G_B3_at_6": at(mul(G, B3), 6),
        "G_B4_L4_at_5": at(mul(mul(G, B4), [1, 4, 6, 4, 1]), 5),
    },
}
assert x == 7
assert not result["m3_eligible_p_exists"]
assert m3["layer_margin"] == -66
assert m3["full_t1_margin"] == 2076267
Path(__file__).with_suffix(".json").write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps({"m3": m3, "x": x, "eligible_p": result["m3_eligible_p_exists"], "m20": cases[-1]}))
