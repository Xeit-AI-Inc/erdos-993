#!/usr/bin/env python3
"""C6 U2 exact prefix instrument: Kronecker digit extraction.

Every polynomial is evaluated at beta=2**w with a rigorously carry-free
coefficient bound, then coefficients are read as base-beta digits. This uses
no polynomial-array products or cofactor division.
"""
import argparse
import hashlib
import json
import math
import os
import platform
import sys
import tempfile
import time
from pathlib import Path

PROTOCOL_SHA256 = "a17ba0bcd412765b7dc1a91b283df816f41ad5173047067c94661d6991aff4ba"
RUNNER_SHA256 = "f188a54eeca2e0b1c0b487c665a82cb6a97ca05e44b2638e36393017c17a8bd7"
WIDTH_SLACK = 4


def sha256_file(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for block in iter(lambda: f.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()


def atomic_json(path, obj):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, tmp = tempfile.mkstemp(prefix=path.name + ".", suffix=".tmp", dir=path.parent)
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as f:
            json.dump(obj, f, sort_keys=True, separators=(",", ":"))
            f.write("\n")
            f.flush()
            os.fsync(f.fileno())
        os.replace(tmp, path)
        dfd = os.open(path.parent, os.O_RDONLY)
        try:
            os.fsync(dfd)
        finally:
            os.close(dfd)
    finally:
        if os.path.exists(tmp):
            os.unlink(tmp)


def binom(n, k):
    return math.comb(n, k) if 0 <= k <= n else 0


def packed_poly(counts, marked_r, beta):
    """Evaluate C (marked_r=None) or U_r directly at beta."""
    a2, a3, a4 = counts
    exponents = [a2, a3, a4]
    factors = []
    if marked_r is None:
        factors.append(1 + 2 * beta)  # G
        for r in (2, 3, 4):
            factors.append(((1 + beta) ** r + beta) ** exponents[r - 2])
    else:
        factors.append(1 + 2 * beta)  # G
        for r in (2, 3, 4):
            e = exponents[r - 2] - (1 if r == marked_r else 0)
            if e < 0:
                raise AssertionError("marked arity absent")
            factors.append(((1 + beta) ** r + beta) ** e)
        # The marked factor is B_(r-1)=L^(r-1)+z; at r=2 it equals G.
        factors.append((1 + beta) ** (marked_r - 1) + beta)
    value = 1
    for factor in factors:
        value *= factor
    return value


def unpack(value, degree, width, mask):
    digits = []
    for _ in range(degree + 1):
        digits.append(value & mask)
        value >>= width
    if value:
        raise AssertionError("nonzero packed polynomial tail")
    return digits


def support_and_coefficient_bound(N, m):
    # Sum coefficients of C is 3*prod(2**r+1) < 2**(N+m+2).
    # Sum coefficients of U_r is 3*(2**(r-1)+1)*prod_{s!=r}(2**s+1)
    # < 2**(N+m+1). Thus w=N+m+4 prevents all carries.
    return N + m + WIDTH_SLACK


def control_suite():
    controls = []
    # m=1, r=2, k=1; guard rank and a strictly positive full surplus.
    counts = (1, 0, 0)
    n = 2
    h = 1 + 2 * counts[0] + 4 * counts[1] + 7 * counts[2]
    width = support_and_coefficient_bound(n, 1)
    beta = 1 << width
    mask = beta - 1
    C = unpack(packed_poly(counts, None, beta), n + 1, width, mask)
    U = unpack(packed_poly(counts, 2, beta), n, width, mask)
    U += [0, 0]
    E = [0] + [binom(n, j) for j in range(n + 1)] + [0]
    k = 1
    S = (h + 1) * U[k] * C[k] + (k + 1) * (h - k + 1) * (E[k] * C[k] - E[k + 1] * C[k - 1])
    controls.append({"name": "m1_r2_k1", "N": n, "h": h, "k": k, "surplus": str(S), "passed": S > 0})

    # Isolated E component at the documented n=91 profile (0,22,0), k=27.
    counts = (0, 22, 0)
    n = 66
    h = 1 + 4 * 22
    width = support_and_coefficient_bound(n, 22)
    beta = 1 << width
    mask = beta - 1
    C = unpack(packed_poly(counts, None, beta), n + 1, width, mask)
    E = [0] + [binom(n, j) for j in range(n + 1)] + [0]
    k = 27
    e_only = E[k] * C[k] - E[k + 1] * C[k - 1]
    U = unpack(packed_poly(counts, 3, beta), n, width, mask)
    U += [0, 0]
    full = (U[k] + E[k]) * C[k] - (U[k + 1] + E[k + 1]) * C[k - 1]
    controls.append({"name": "n91_E_only_k27", "profile": list(counts), "N": n, "h": h, "k": k, "E_only_minor": str(e_only), "full_tip_minor": str(full), "passed": e_only < 0 and full == 777419068009671422357461955841645743808})

    # n=122 full-tip failure is deliberately outside 2k<=N+2.
    counts = (38, 0, 1)
    n = 80
    h = 1 + 2 * 38 + 7
    width = support_and_coefficient_bound(n, 39)
    beta = 1 << width
    mask = beta - 1
    C = unpack(packed_poly(counts, None, beta), n + 1, width, mask)
    U = unpack(packed_poly(counts, 4, beta), n, width, mask)
    U += [0, 0]
    E = [0] + [binom(n, j) for j in range(n + 1)] + [0]
    k = 77
    A = [U[j] + E[j] for j in range(len(E))]
    full = A[k] * C[k] - A[k + 1] * C[k - 1]
    controls.append({"name": "n122_full_tip_k77_outside_guard", "profile": list(counts), "N": n, "h": h, "k": k, "guard_max": (n + 2) // 2, "full_tip_minor": str(full), "passed": full == -49239834336 and 2 * k > n + 2})
    if not all(c["passed"] for c in controls):
        raise AssertionError("required independent control failed")
    return controls


def profile_row(counts):
    a2, a3, a4 = counts
    m = a2 + a3 + a4
    N = 2 * a2 + 3 * a3 + 4 * a4
    h = 1 + 2 * a2 + 4 * a3 + 7 * a4
    width = support_and_coefficient_bound(N, m)
    beta = 1 << width
    mask = beta - 1
    C = unpack(packed_poly(counts, None, beta), N + 1, width, mask)
    E = [0] + [binom(N, j) for j in range(N + 1)] + [0]
    guard = (N + 2) // 2
    best = None
    failures = []
    type_count = 0
    rank_count = 0
    for r in (2, 3, 4):
        if counts[r - 2] == 0:
            continue
        type_count += 1
        U = unpack(packed_poly(counts, r, beta), N, width, mask)
        U += [0, 0]
        for k in range(1, guard + 1):
            rank_count += 1
            s = (h + 1) * U[k] * C[k] + (k + 1) * (h - k + 1) * (E[k] * C[k] - E[k + 1] * C[k - 1])
            witness = {"profile": list(counts), "N": N, "h": h, "r": r, "k": k,
                       "C_k": str(C[k]), "C_km1": str(C[k - 1]),
                       "U_k": str(U[k]), "E_k": str(E[k]), "E_kp1": str(E[k + 1]),
                       "surplus": str(s)}
            if best is None or s < best["value"]:
                best = {"value": s, "witness": witness}
            if s < 0:
                A_k = U[k] + E[k]
                A_kp1 = U[k + 1] + E[k + 1]
                full = A_k * C[k] - A_kp1 * C[k - 1]
                failures.append({**witness, "full_tip_minor": str(full)})
    return {"profile": list(counts), "profiles": 1, "represented_types": type_count,
            "represented_type_rank_tests": rank_count, "minimum_signed_surplus": str(best["value"]),
            "minimum_witness": best["witness"], "failure_count": len(failures), "failures": failures}


def expected_counts_by_formula(m):
    # Independent fixed-m count identity from C6 coverage derivation.
    S = 3 * math.comb(m + 1, 2)
    if m % 2 == 0:
        u = m // 2
        O = 3 * u * u + u
    else:
        u = (m - 1) // 2
        O = (u + 1) * (3 * u + 1)
    return math.comb(m + 2, 2), ((3 * m + 2) * S - O) // 2


def run(min_m, max_m, output):
    started = time.monotonic()
    controls = control_suite()
    rows = []
    total_profiles = 0
    total_tests = 0
    for m in range(min_m, max_m + 1):
        m_started = time.monotonic()
        profile_count = 0
        tests = 0
        best = None
        failures = []
        for a2 in range(m + 1):
            for a3 in range(m - a2 + 1):
                a4 = m - a2 - a3
                row = profile_row((a2, a3, a4))
                profile_count += 1
                tests += row["represented_type_rank_tests"]
                value = int(row["minimum_signed_surplus"])
                if best is None or value < best["value"]:
                    best = {"value": value, "witness": row["minimum_witness"]}
                if row["failures"]:
                    failures.extend(row["failures"])
        expected = expected_counts_by_formula(m)
        if (profile_count, tests) != expected:
            raise AssertionError(f"coverage formula disagreement at m={m}: {(profile_count, tests)} != {expected}")
        entry = {"m": m, "profile_count": profile_count, "represented_type_rank_tests": tests,
                 "minimum_signed_surplus": str(best["value"]), "minimum_witness": best["witness"],
                 "failure_count": len(failures), "failures": failures,
                 "elapsed_seconds": time.monotonic() - m_started}
        rows.append(entry)
        total_profiles += profile_count
        total_tests += tests
        atomic_json(Path(output).parent / f"checkpoint-m{m:02d}.json", entry)
        print(f"completed m={m} profiles={profile_count} tests={tests} min={best['value']}", flush=True)
    aggregate = {"status": "complete_exact_prefix" if min_m == 1 and max_m == 99 else "complete_exact_shard",
                 "evidence_grade": "bounded_computation", "scope": {"min_m": min_m, "max_m": max_m},
                 "profile_count": total_profiles, "represented_type_rank_tests": total_tests,
                 "minimum_signed_surplus": str(min((int(row["minimum_signed_surplus"]) for row in rows), default=0)),
                 "rows": rows, "controls": controls,
                 "protocol_sha256": PROTOCOL_SHA256, "runner_sha256": RUNNER_SHA256,
                 "instrument_source_sha256": sha256_file(__file__),
                 "python_version": sys.version, "platform": platform.platform(),
                 "elapsed_seconds": time.monotonic() - started}
    atomic_json(output, aggregate)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--min-m", type=int, default=1)
    ap.add_argument("--max-m", type=int, default=99)
    ap.add_argument("--output", required=True)
    args = ap.parse_args()
    if not (1 <= args.min_m <= args.max_m <= 99):
        ap.error("require 1 <= min-m <= max-m <= 99")
    run(args.min_m, args.max_m, args.output)


if __name__ == "__main__":
    main()
