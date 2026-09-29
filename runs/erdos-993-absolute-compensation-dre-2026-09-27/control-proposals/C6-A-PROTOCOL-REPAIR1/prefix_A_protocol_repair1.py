#!/usr/bin/env python3
"""Independent C6 instrument A: exact arrays and constant-one cofactor division."""
from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import platform
import sys
import time
from pathlib import Path


def mul(a: list[int], b: list[int]) -> list[int]:
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        if x:
            for j, y in enumerate(b):
                if y:
                    c[i + j] += x * y
    return c


def coeff(a: list[int], k: int) -> int:
    return a[k] if 0 <= k < len(a) else 0


def bpoly(r: int) -> list[int]:
    return [math.comb(r, j) + (j == 1) for j in range(r + 1)]


def divide_monic_constant_one(q: list[int], b: list[int]) -> list[int]:
    """Exact quotient by b, whose constant term is one; recurrence is integral."""
    h = [0] * (len(q) - len(b) + 1)
    for k in range(len(h)):
        v = q[k]
        for j in range(1, min(k, len(b) - 1) + 1):
            v -= b[j] * h[k - j]
        h[k] = v
    for k in range(len(q)):
        v = sum(b[j] * coeff(h, k - j) for j in range(len(b)))
        if v != q[k]:
            raise ArithmeticError("cofactor division failed exact reconstruction")
    return h


def profile(counts: tuple[int, int, int]) -> tuple[int, int, int, list[int], list[int], list[int]]:
    a2, a3, a4 = counts
    m = sum(counts)
    n = 2 * a2 + 3 * a3 + 4 * a4
    h = 1 + 2 * a2 + 4 * a3 + 7 * a4
    q = [1]
    for r, amount in ((2, a2), (3, a3), (4, a4)):
        bp = bpoly(r)
        for _ in range(amount):
            q = mul(q, bp)
    c = [coeff(q, k) + 2 * coeff(q, k - 1) for k in range(len(q) + 1)]
    e = [0] + [math.comb(n, k) for k in range(n + 1)]
    return n, h, m, q, c, e


def expected_layer(m: int) -> tuple[int, int]:
    # Independently derived closed-form coverage counts from C6 coverage note.
    profiles = math.comb(m + 2, 2)
    represented_types = 3 * math.comb(m + 1, 2)
    odd_a3 = (3 * (m // 2) ** 2 + m // 2) if m % 2 == 0 else ((m // 2 + 1) * (3 * (m // 2) + 1))
    tests_twice = (3 * m + 2) * represented_types - odd_a3
    return profiles, tests_twice // 2


def write_atomic(path: Path, data: object) -> None:
    tmp = path.with_name(path.name + ".tmp")
    raw = (json.dumps(data, sort_keys=True, indent=2) + "\n").encode()
    with tmp.open("wb") as f:
        f.write(raw)
        f.flush()
        os.fsync(f.fileno())
    os.replace(tmp, path)
    fd = os.open(path.parent, os.O_RDONLY)
    try:
        os.fsync(fd)
    finally:
        os.close(fd)


def invocation_controls() -> list[dict]:
    """Controller protocol repair1: run exact required controls in every invocation."""
    cases = [((0, 22, 0), 3, 27), ((38, 0, 1), 4, 77), ((1, 0, 0), 2, 1)]
    out = []
    for counts, r, k in cases:
        n, h, m, q, c, e = profile(counts)
        u = mul(mul([1, 2], bpoly(r - 1)), divide_monic_constant_one(q, bpoly(r)))
        em = coeff(e, k) * coeff(c, k) - coeff(e, k + 1) * coeff(c, k - 1)
        full = (coeff(u, k) + coeff(e, k)) * coeff(c, k) - (coeff(u, k + 1) + coeff(e, k + 1)) * coeff(c, k - 1)
        surplus = (h + 1) * coeff(u, k) * coeff(c, k) + (k + 1) * (h - k + 1) * em
        out.append({"counts": list(counts), "m": m, "N": n, "n": n + m + 3, "h": h, "r": r, "k": k,
                    "guarded": 1 <= k and 2 * k <= n + 2, "E_minor": str(em), "full_tip_minor": str(full),
                    "surplus": str(surplus), "coefficients": {"U_k": str(coeff(u, k)), "U_kp1": str(coeff(u, k + 1)),
                    "C_k": str(coeff(c, k)), "C_km1": str(coeff(c, k - 1)), "E_k": str(coeff(e, k)), "E_kp1": str(coeff(e, k + 1))}})
    assert out[0]["E_minor"] == "-518620474811633289768751398606375936"
    assert out[0]["full_tip_minor"] == "777419068009671422357461955841645743808" and out[0]["guarded"]
    assert out[1]["full_tip_minor"] == "-49239834336" and not out[1]["guarded"]
    assert out[2]["surplus"] == "98" and out[2]["full_tip_minor"] == "19" and out[2]["guarded"]
    return out


def run(lo: int, hi: int, output: Path) -> None:
    started = time.monotonic()
    controls = invocation_controls()
    rows = []
    total_profiles = total_tests = 0
    all_failures = []
    output.parent.mkdir(parents=True, exist_ok=True)
    checkpoint_dir = output.parent / (output.stem + "-checkpoints")
    checkpoint_dir.mkdir(exist_ok=True)

    for m in range(lo, hi + 1):
        m_start = time.monotonic()
        profile_count = tests = 0
        layer_min = None
        failures = []
        for a2 in range(m + 1):
            for a3 in range(m - a2 + 1):
                a4 = m - a2 - a3
                counts = (a2, a3, a4)
                n, hh, _, q, c, e = profile(counts)
                profile_count += 1
                max_k = (n + 2) // 2
                for r, amount in ((2, a2), (3, a3), (4, a4)):
                    if amount == 0:
                        continue
                    bp = bpoly(r)
                    cofactor = divide_monic_constant_one(q, bp)
                    # U_r = G B_(r-1) (Q/B_r), with literal B_1=G.
                    u = mul(mul([1, 2], bpoly(r - 1)), cofactor)
                    for k in range(1, max_k + 1):
                        ek = coeff(e, k)
                        ekp = coeff(e, k + 1)
                        ck = coeff(c, k)
                        ckm = coeff(c, k - 1)
                        uk = coeff(u, k)
                        ukp = coeff(u, k + 1)
                        signed = ((hh + 1) * uk * ck
                                  + (k + 1) * (hh - k + 1) * (ek * ck - ekp * ckm))
                        tests += 1
                        item = {
                            "counts": list(counts), "N": n, "h": hh,
                            "r": r, "k": k, "margin": str(signed),
                            "U_k": str(uk), "U_kp1": str(ukp),
                            "C_k": str(ck), "C_km1": str(ckm),
                            "E_k": str(ek), "E_kp1": str(ekp),
                        }
                        if layer_min is None or signed < int(layer_min["margin"]):
                            layer_min = item
                        if signed < 0:
                            actual = ((uk + ek) * ck - (ukp + ekp) * ckm)
                            failures.append({**item, "full_A_UplusE_minor": str(actual)})
        ep, et = expected_layer(m)
        if (profile_count, tests) != (ep, et):
            raise ArithmeticError(f"coverage mismatch m={m}: got {(profile_count, tests)}, expected {(ep, et)}")
        row = {
            "m": m, "profiles": profile_count, "represented_tip_rank_tests": tests,
            "minimum_signed_surplus": layer_min,
            "failures": failures,
            "elapsed_seconds": time.monotonic() - m_start,
        }
        rows.append(row)
        all_failures.extend(failures)
        total_profiles += profile_count
        total_tests += tests
        write_atomic(checkpoint_dir / f"m-{m:02d}.json", row)
        print(f"m={m} profiles={profile_count} tests={tests} min={layer_min['margin']} failures={len(failures)}", flush=True)

    result = {
        "instrument": "C6-T2 exact arrays; controller protocol repair1, same mathematical algorithm",
        "controls": controls,
        "protocol_sha256": "a17ba0bcd412765b7dc1a91b283df816f41ad5173047067c94661d6991aff4ba",
        "expected_counts_sha256": "e5de145a9c6872352a2a2b51d92a82a7d70745b2adf18a09e2dde66f4729ab6f",
        "executed_source_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "status": "complete" if lo == 1 and hi == 99 else "partial_scope",
        "evidence_grade": "bounded_computation",
        "scope": {"min_m": lo, "max_m": hi, "all_count_profiles": True,
                  "all_represented_arities": True, "all_guarded_ranks": True,
                  "no_descent_or_eligibility_filter": True},
        "totals": {"profiles": total_profiles, "represented_tip_rank_tests": total_tests},
        "expected_totals_if_full": {"profiles": 171699, "represented_tip_rank_tests": 56245000},
        "rows": rows,
        "failures": all_failures,
        "python_version": sys.version,
        "platform": platform.platform(),
        "elapsed_seconds": time.monotonic() - started,
    }
    write_atomic(output, result)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--min-m", type=int, required=True)
    ap.add_argument("--max-m", type=int, required=True)
    ap.add_argument("--output", type=Path, required=True)
    a = ap.parse_args()
    if not 1 <= a.min_m <= a.max_m <= 99:
        ap.error("require 1 <= min-m <= max-m <= 99")
    run(a.min_m, a.max_m, a.output.resolve())
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
