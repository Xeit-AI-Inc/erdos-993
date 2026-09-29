"""Independent integer replay of the C5-U1 root-mixture claims."""
from math import comb
import json
from pathlib import Path


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, u in enumerate(a):
        for j, v in enumerate(b):
            out[i + j] += u * v
    return out


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, v in enumerate(a):
        out[i] += v
    for i, v in enumerate(b):
        out[i] += v
    return out


def scale(a, n):
    return [n * x for x in a]


def delta(a, k):
    return (a[k + 1] if k + 1 < len(a) else 0) - (a[k] if k < len(a) else 0)


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def powers(a, n):
    out = [1]
    for _ in range(n):
        out = mul(out, a)
    return out


def profile(counts):
    a2, a3, a4 = counts
    N = 2 * a2 + 3 * a3 + 4 * a4
    m = sum(counts)
    L, G = [1, 1], [1, 2]
    Q = [1]
    for r, count in ((2, a2), (3, a3), (4, a4)):
        B = add(powers(L, r), [0, 1])
        Q = mul(Q, powers(B, count))
    C = mul(G, Q)
    d = [0] + [comb(N + 1, k) for k in range(N + 2)]
    P = add(C, d)
    x = next(k for k in range(len(P)) if delta(P, k) < 0)
    return N, m, L, G, C, d, P, x


def minor(C, d, k):
    return coeff(d, k + 1) * coeff(C, k) - coeff(d, k) * coeff(C, k + 1)


def deletion_deltas(counts, p):
    a2, a3, a4 = counts
    N = 2 * a2 + 3 * a3 + 4 * a4
    L, G = [1, 1], [1, 2]
    Q = [1]
    for r, count in ((2, a2), (3, a3), (4, a4)):
        Q = mul(Q, powers(add(powers(L, r), [0, 1]), count))
    E = mul([0, 1], powers(L, N))
    A0 = add(mul(L, Q), E)
    results = {"A0": delta(A0, p)}
    for r, count in ((2, a2), (3, a3), (4, a4)):
        if not count:
            continue
        H = [1]
        for s, amount in ((2, a2), (3, a3), (4, a4)):
            H = mul(H, powers(add(powers(L, s), [0, 1]), amount - (s == r)))
        Ai = add(mul(mul(G, add(powers(L, r - 1), [0, 1])), H), E)
        results[str(r)] = delta(Ai, p)
    return results


def eligible(counts):
    N, m, L, G, C, d, P, x = profile(counts)
    alpha = N + 2
    ranks = []
    for p in range(x + 2, len(P) + 1):
        if 3 * p < 2 * alpha + 1 and 2 * p <= alpha:
            j = p - 2
            ranks.append({
                "p": p, "j": j, "x": x,
                "first_guard_slack": p - (x + 2),
                "lower_guard_slack": alpha - 2 * p,
                "minor": str(minor(C, d, j)),
                "components": [str(coeff(d, j + 1)), str(coeff(C, j)),
                              str(coeff(d, j)), str(coeff(C, j + 1))],
                "selectors_delta": deletion_deltas(counts, p),
            })
    return N, x, ranks


cases = {}
for label, counts in (("r2m10", (10, 0, 0)), ("r3m12r4m10", (0, 12, 10))):
    N, m, L, G, C, d, P, x = profile(counts)
    cases[label] = {
        "counts": counts, "N": N, "m": m, "n": N + m + 3, "alpha": N + 2,
        "x": x,
        "first_descent_delta_P": delta(P, x),
        "delta_d_at_x": delta(d, x),
        "delta_C_at_x": delta(C, x),
        "eligible": eligible(counts)[2],
    }
    if label == "r2m10":
        k = 4
        cases[label]["off_window"] = {
            "k": k, "minor": str(minor(C, d, k)),
            "d_k": coeff(d, k), "d_k1": coeff(d, k + 1),
            "C_k": coeff(C, k), "C_k1": coeff(C, k + 1),
            "selector_deltas_at_p6": deletion_deltas(counts, 6),
            "p6_actual_guard": 6 >= x + 2,
        }

# Find explicit exact examples on both the interior and lower-half boundary
# of the p-domain, plus the small-rank j=0 boundary if one exists.
found = {"interior": None, "lower_half_boundary": None, "j_zero_boundary": None}
for a2 in range(0, 25):
    for a3 in range(0, 25 - a2):
        for a4 in range(0, 25 - a2 - a3):
            if a2 + a3 + a4 == 0:
                continue
            counts = (a2, a3, a4)
            N, x, ranks = eligible(counts)
            for row in ranks:
                if row["lower_guard_slack"] == 0 and found["lower_half_boundary"] is None:
                    found["lower_half_boundary"] = {"counts": counts, "N": N, **row}
                if row["lower_guard_slack"] > 0 and row["first_guard_slack"] > 0 and found["interior"] is None:
                    found["interior"] = {"counts": counts, "N": N, **row}
                if row["j"] == 0 and found["j_zero_boundary"] is None:
                    found["j_zero_boundary"] = {"counts": counts, "N": N, **row}
            if all(found.values()):
                break
        if all(found.values()):
            break
    if all(found.values()):
        break

# Directly check local-factor hypotheses in monomial z bases.
local = {"G": G, "B2": add(powers([1, 1], 2), [0, 1]),
         "B3": add(powers([1, 1], 3), [0, 1]),
         "B4": add(powers([1, 1], 4), [0, 1])}
for name, poly in local.items():
    local[name] = {"coefficients_z": poly,
                   "positive_interval": all(v > 0 for v in poly),
                   "log_concavity_gaps": [poly[i] * poly[i] - poly[i - 1] * poly[i + 1]
                                           for i in range(1, len(poly) - 1)]}

# Check the minor algebra at the coefficient boundary j=0 and at an interior
# rising-binomial rank. These checks validate arithmetic/sign conventions only.
N0, _, _, _, C0, d0, _, _ = profile((0, 0, 24))
boundary_minor = minor(C0, d0, 0)
interior_k = 24
interior_minor = minor(C0, d0, interior_k)
sign_checks = {
    "r4m24_boundary_j0": {
        "N": N0, "k": 0, "Delta_d": delta(d0, 0), "C_k": coeff(C0, 0),
        "d_k": coeff(d0, 0), "Delta_C": delta(C0, 0),
        "minor": str(boundary_minor),
        "identity_rhs": str(delta(d0, 0) * coeff(C0, 0) - coeff(d0, 0) * delta(C0, 0)),
    },
    "r4m24_interior_k24": {
        "N": N0, "k": interior_k, "Delta_d": delta(d0, interior_k),
        "C_k": coeff(C0, interior_k), "d_k": coeff(d0, interior_k),
        "Delta_C": delta(C0, interior_k), "minor": str(interior_minor),
        "identity_rhs": str(delta(d0, interior_k) * coeff(C0, interior_k)
                             - coeff(d0, interior_k) * delta(C0, interior_k)),
    },
}

out = {"scope": "Independent exact-integer replay of the two packet claims; examples are bounded checks, not proof of the universal lemma.",
       "cases": cases, "guard_examples": found, "local_factors": local,
       "minor_sign_checks": sign_checks}
Path(__file__).with_suffix(".json").write_text(json.dumps(out, indent=2) + "\n")
print(json.dumps(out, indent=2))
