#!/usr/bin/env python3
"""Independent structural/count and literal-convolution spot checks for C6-U2."""
import json
import math
from pathlib import Path

ROOT = Path(__file__).parent
CASE = ROOT / "review_case"


def conv(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def poly_power(a, n):
    out = [1]
    for _ in range(n):
        out = conv(out, a)
    return out


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a):
        out[i] += x
    for i, x in enumerate(b):
        out[i] += x
    return out


def br(r):
    v = list(math.comb(r, j) for j in range(r + 1))
    v[1] += 1
    return v


def products(counts, marked=None):
    a2, a3, a4 = counts
    exps = (a2, a3, a4)
    q = [1]
    for r, e in zip((2, 3, 4), exps):
        q = conv(q, poly_power(br(r), e - (1 if r == marked else 0)))
    g = [1, 2]
    if marked is None:
        return conv(g, q)
    marked_factor = br(marked - 1)
    return conv(conv(g, q), marked_factor)


def padded(v, n):
    return v + [0] * max(0, n - len(v))


def surplus(counts, r, k):
    a2, a3, a4 = counts
    m = sum(counts)
    N = 2 * a2 + 3 * a3 + 4 * a4
    h = 1 + 2 * a2 + 4 * a3 + 7 * a4
    C = padded(products(counts), N + 2)
    U = padded(products(counts, r), N + 1)
    E = [0] + [math.comb(N, j) for j in range(N + 1)] + [0]
    M = E[k] * C[k] - E[k + 1] * C[k - 1]
    S = (h + 1) * U[k] * C[k] + (k + 1) * (h - k + 1) * M
    return {"profile": list(counts), "m": m, "N": N, "h": h, "r": r, "k": k,
            "Ck": str(C[k]), "Ckm1": str(C[k - 1]), "Uk": str(U[k]),
            "Ek": str(E[k]), "Ekp1": str(E[k + 1]), "E_minor": str(M), "S": str(S)}


def full_tip_minor(counts, r, k):
    a2, a3, a4 = counts
    N = 2 * a2 + 3 * a3 + 4 * a4
    C = padded(products(counts), N + 2)
    U = padded(products(counts, r), N + 1)
    E = [0] + [math.comb(N, j) for j in range(N + 1)] + [0]
    return (U[k] + E[k]) * C[k] - (U[k + 1] + E[k + 1]) * C[k - 1]


def main():
    expected = json.loads((CASE / "C6-SURPLUS-PREFIX-EXPECTED-COUNTS.json").read_text())
    result = json.loads((CASE / "final-run-1-99/RESULT.json").read_text())
    assert result["status"] == "complete_exact_prefix"
    assert len(result["rows"]) == 99
    assert all(int(row["minimum_signed_surplus"]) > 0 for row in result["rows"])
    assert min(int(row["minimum_signed_surplus"]) for row in result["rows"]) == 98
    table = {x["m"]: x for x in expected["layers"]}
    independently_counted = []
    for m in range(1, 100):
        profiles = tests = 0
        for a2 in range(m + 1):
            for a3 in range(m - a2 + 1):
                a4 = m - a2 - a3
                N = 2 * a2 + 3 * a3 + 4 * a4
                guard = (N + 2) // 2
                profiles += 1
                tests += sum(guard for a in (a2, a3, a4) if a > 0)
        assert profiles == table[m]["profiles"]
        assert tests == table[m]["represented_tip_rank_tests"]
        assert (profiles, tests) == (result["rows"][m - 1]["profile_count"],
                                      result["rows"][m - 1]["represented_type_rank_tests"])
        independently_counted.append([m, profiles, tests])

    cases = [
        surplus((1, 0, 0), 2, 1),                  # first and last rank at N=2
        surplus((0, 1, 0), 3, 1),                  # odd N lower endpoint
        surplus((2, 1, 1), 2, 3),                  # interior heterogeneous profile
        surplus((2, 1, 1), 3, 6),                  # upper guard endpoint (N=11)
        surplus((0, 22, 0), 3, 27),                # E-only obstruction control
    ]
    controls = result["controls"]
    for c in cases[:1]:
        assert c["S"] == "98"
    assert int(cases[-1]["E_minor"]) == int(controls[1]["E_only_minor"])
    assert all(c["passed"] for c in controls)
    n91_full = full_tip_minor((0, 22, 0), 3, 27)
    n122_full = full_tip_minor((38, 0, 1), 4, 77)
    assert n91_full == 777419068009671422357461955841645743808
    assert n122_full == -49239834336
    # The two coefficients multiplying U_k C_k and M are positive on this
    # guarded test domain, so clearing these multipliers preserves order.
    assert all((int(c["h"]) + 1) > 0 and (int(c["k"]) + 1) *
               (int(c["h"]) - int(c["k"]) + 1) > 0 for c in cases)

    payload = {"independent_direct_profile_counts_1_99": independently_counted,
               "direct_convolution_spot_checks": cases,
               "independent_control_full_tip_minors": {
                   "n91_k27": str(n91_full), "n122_k77_outside_guard": str(n122_full)},
               "result_minimum": result["minimum_signed_surplus"],
               "exact_profile_count": sum(x[1] for x in independently_counted),
               "exact_test_count": sum(x[2] for x in independently_counted)}
    (ROOT / "independent_audit.json").write_text(json.dumps(payload, sort_keys=True, indent=2) + "\n")
    print(json.dumps({"profiles": payload["exact_profile_count"],
                      "tests": payload["exact_test_count"],
                      "spot_checks": len(cases), "result": "PASS"}, sort_keys=True))


if __name__ == "__main__":
    main()
