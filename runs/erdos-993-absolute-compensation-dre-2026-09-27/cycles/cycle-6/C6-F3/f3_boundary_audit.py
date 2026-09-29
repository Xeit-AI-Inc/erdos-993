from fractions import Fraction
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


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def B(r):
    a = [comb(r, k) for k in range(r + 1)]
    a[1] += 1
    return a


def powers_profile(counts):
    rs = [r for r in (2, 3, 4) for _ in range(counts[r])]
    n = sum(rs)
    q = [1]
    for r in rs:
        q = mul(q, B(r))
    c = mul([1, 2], q)
    h = 1 + 2 * counts[2] + 4 * counts[3] + 7 * counts[4]
    e = [0] + [comb(n, k) for k in range(n + 1)]
    out = {2: [], 3: [], 4: []}
    for i, r in enumerate(rs):
        co = [1]
        for j, rr in enumerate(rs):
            if j != i:
                co = mul(co, B(rr))
        u = mul(mul([1, 2], B(r - 1)), co)
        margins = []
        for k in range(1, (n + 2) // 2 + 1):
            me = coeff(e, k) * coeff(c, k) - coeff(e, k + 1) * coeff(c, k - 1)
            margin = (h + 1) * coeff(u, k) * coeff(c, k) + (k + 1) * (h - k + 1) * me
            margins.append((margin, k, me))
        out[r].append(min(margins))
    return n, h, out


def g(n, k, r):
    return Fraction(2 * r, 2 * r + 1) * Fraction(comb(n - r, k - 1), comb(n, k))


profiles = {
    "100x2": {2: 100, 3: 0, 4: 0},
    "100x3": {2: 0, 3: 100, 4: 0},
    "100x4": {2: 0, 3: 0, 4: 100},
    "98x2_1x3_1x4": {2: 98, 3: 1, 4: 1},
    "98x4_1x2_1x3": {2: 1, 3: 1, 4: 98},
    "50x2_50x4": {2: 50, 3: 0, 4: 50},
}
profile_results = {}
for name, counts in profiles.items():
    n, h, branch_mins = powers_profile(counts)
    profile_results[name] = {
        "N": n,
        "h": h,
        "marked_arity_minima": {
            str(r): {"minimum_margin": str(min(rows)[0]), "at_k": min(rows)[1], "E_minor": str(min(rows)[2])}
            for r, rows in branch_mins.items() if rows
        },
        "all_margins_strictly_positive": all(m > 0 for rows in branch_mins.values() for m, _, _ in rows),
    }

g_boundary = []
for n in (200, 201, 399, 400):
    for k in sorted({n // 4 + 1, (n + 2) // 2}):
        if 4 * k <= n + 1:
            continue
        g_boundary.append({"N": n, "k": k, "g2": str(g(n, k, 2)), "g3": str(g(n, k, 3)), "g4": str(g(n, k, 4))})

report = {
    "scope": "Exact bounded checks only; no universal proof or census claim.",
    "g_boundary_rows": g_boundary,
    "representative_m100_profiles": profile_results,
}
out = Path(__file__).with_suffix(".json")
out.write_text(json.dumps(report, indent=2) + "\n")
print(json.dumps(report, indent=2))
