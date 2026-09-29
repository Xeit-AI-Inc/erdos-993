"""Independent exact replay of selected C5-F1 controls and bounded scan."""
from math import comb
from pathlib import Path
import json


def conv(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def plus(a, b):
    c = [0] * max(len(a), len(b))
    for i, x in enumerate(a): c[i] += x
    for i, x in enumerate(b): c[i] += x
    return c


def times(a, t): return [t * x for x in a]
def coeff(a, k): return a[k] if 0 <= k < len(a) else 0
def power(a, n):
    z = [1]
    for _ in range(n): z = conv(z, a)
    return z


L, G = [1, 1], [1, 2]
def branch(r): return plus(power(L, r), [0, 1])
def binomial_poly(n): return [comb(n, j) for j in range(n + 1)]
def shifted_binomial(n): return [0] + binomial_poly(n)


def profile(counts):
    q = [1]
    for r, num in zip((2, 3, 4), counts):
        for _ in range(num): q = conv(q, branch(r))
    N = sum(r * num for r, num in zip((2, 3, 4), counts))
    return N, q, conv(G, q), shifted_binomial(N)


def cofactor(counts, omitted_r):
    h = [1]
    omitted = False
    for r, num in zip((2, 3, 4), counts):
        for _ in range(num):
            if r == omitted_r and not omitted:
                omitted = True
            else:
                h = conv(h, branch(r))
    return h


def tip_poly(counts, r, N):
    u = conv(conv(G, branch(r - 1)), cofactor(counts, r))
    return u, plus(u, shifted_binomial(N))


def minor(v, c, k):
    return coeff(v, k) * coeff(c, k) - coeff(v, k + 1) * coeff(c, k - 1)


def first_descent(p):
    for k in range(len(p)):
        if coeff(p, k + 1) - coeff(p, k) < 0:
            return k
    return len(p)


out = {"arithmetic": "independent exact integer coefficient convolution; zero extension"}

# E-only and full deletion control, including literal strict selectors and all guards.
counts = (0, 22, 0)
N, q, c, e = profile(counts)
a0 = plus(conv(L, q), shifted_binomial(N))
u3, a3 = tip_poly(counts, 3, N)
p = plus(c, shifted_binomial(N + 1))
k, selp = 27, 34
out["E_only"] = {
    "N": N, "n": N + sum(counts) + 3, "alpha": N + 2,
    "first_strict_descent": first_descent(p), "p": selp,
    "p_guards": [first_descent(p) + 2 <= selp, 3 * selp < 2 * (N + 2) + 1, 2 * selp <= N + 2],
    "selectors_e0_e3": [int(coeff(a0, selp + 1) - coeff(a0, selp) < 0), int(coeff(a3, selp + 1) - coeff(a3, selp) < 0)],
    "rank_guards_k27": [1 <= k, 2 * k <= N + 2],
    "E_minor": str(minor(e, c, k)), "endpoint_minor": str(minor(a0, c, k)),
    "tip_minor": str(minor(a3, c, k)), "original_tag_weights": [1, 3 * 22],
}

# Activity coefficient countercontrol via bivariate (activity degree, z degree) arrays.
counts = (0, 0, 3)
N, q, c_total, e = profile(counts)
k = 7
c_layers, u_layers = [], []
for a in range(3):
    layer = [0] * a + times(conv(G, power(L, 4 * (2 - a))), comb(2, a))
    c_layers.append(conv(branch(4), layer))
    u_layers.append(conv(branch(3), layer))
layer_margins = []
for d in range(5):
    v = 0
    for a in range(3):
        b = d - a
        if 0 <= b < 3:
            v += coeff(u_layers[a], k) * coeff(c_layers[b], k) - coeff(u_layers[a], k + 1) * coeff(c_layers[b], k - 1)
    if d < 3:
        v += coeff(e, k) * coeff(c_layers[d], k) - coeff(e, k + 1) * coeff(c_layers[d], k - 1)
    layer_margins.append(v)
u_total = [0]
for u in u_layers: u_total = plus(u_total, u)
one_tip = plus(conv(conv(G, branch(3)), power(branch(4), 2)), e)
weighted = times(one_tip, 12)
out["activity"] = {
    "N": N, "n": N + 3 + 3, "k": k, "rank_guards": [1 <= k, 2 * k <= N + 2],
    "layer_margins_by_t_degree": [str(x) for x in layer_margins],
    "degree3_margin": str(layer_margins[3]), "sum_layers": str(sum(layer_margins)),
    "one_tip_direct": str(minor(one_tip, c_total, k)), "weighted_tip_deck": str(minor(weighted, c_total, k)),
}

# Negative comparison outside the registered guard.
counts = (38, 0, 1)
N, q, c, _e = profile(counts)
u4, a4 = tip_poly(counts, 4, N)
p = plus(c, shifted_binomial(N + 1))
k = 77
out["outside_guard"] = {
    "N": N, "n": N + sum(counts) + 3, "alpha": N + 2,
    "first_strict_descent": first_descent(p), "k": k,
    "rank_guards": [1 <= k, 2 * k <= N + 2], "tip_minor": str(minor(a4, c, k)),
}

# Guarded weighted comparison: all triples of counts up to m=20, exact original multiplicities.
profiles = ranks = 0
minimum = None
failures = []
for m in range(1, 21):
    for a2 in range(m + 1):
        for a3 in range(m - a2 + 1):
            counts = (a2, a3, m - a2 - a3)
            N, q, c, e = profile(counts)
            w = [0]
            for r, num in zip((2, 3, 4), counts):
                if not num: continue
                u, ai = tip_poly(counts, r, N)
                w = plus(w, times(ai, r * num))
            profiles += 1
            for k in range(1, (N + 2) // 2 + 1):
                ranks += 1
                value = minor(w, c, k)
                if minimum is None or value < minimum["margin"]:
                    minimum = {"counts": list(counts), "N": N, "k": k, "margin": value}
                if value < 0: failures.append({"counts": list(counts), "N": N, "k": k, "margin": str(value)})
out["weighted_guarded_scan"] = {
    "max_m": 20, "profiles": profiles, "guarded_ranks": ranks,
    "failures": failures[:10], "minimum": {**minimum, "margin": str(minimum["margin"])},
}

# Exact and crude ULC-surplus conditions at the boundary/interior and known crude failure.
def surplus_row(counts, r, k):
    N, q, c, e = profile(counts)
    h = 1 + 2 * counts[0] + 4 * counts[1] + 7 * counts[2]
    u, ai = tip_poly(counts, r, N)
    ek, ek1 = coeff(e, k), coeff(e, k + 1)
    K = (k + 1) * (h - k + 1)
    exact = (h + 1) * coeff(u, k) * coeff(c, k) + K * (ek * coeff(c, k) - ek1 * coeff(c, k - 1))
    crude = 2 * (N + 2 - k) * (h + 1) * coeff(u, k) - ek * (N - k - 1) * K
    return {"counts": list(counts), "r": r, "N": N, "h": h, "k": k, "guards": [1 <= k, 2 * k <= N + 2],
            "Ck_positive": coeff(c, k) > 0, "Ckm1_positive": coeff(c, k - 1) > 0,
            "exact_surplus": str(exact), "crude_substitution_margin": str(crude)}

out["surplus_checks"] = [
    surplus_row((1, 0, 0), 2, 1),
    surplus_row((0, 22, 0), 3, 1),
    surplus_row((0, 22, 0), 3, 17),
    surplus_row((0, 22, 0), 3, 34),
    surplus_row((0, 0, 4), 4, 8),
    surplus_row((1, 1, 1), 3, 3),
]

Path(__file__).with_suffix(".json").write_text(json.dumps(out, indent=2) + "\n")
print(json.dumps(out, indent=2))
