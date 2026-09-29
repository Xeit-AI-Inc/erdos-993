#!/usr/bin/env python3
"""Independent exact checks for the C5-U adjudication. Pass run root as argv[1]."""
import hashlib
import json
import math
import sys
from pathlib import Path

ROOT = Path(sys.argv[1]).resolve()


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def add(a, b):
    return [coeff(a, k) + coeff(b, k) for k in range(max(len(a), len(b)))]


def scale(a, n):
    return [n * v for v in a]


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def power(a, n):
    out = [1]
    for _ in range(n):
        out = mul(out, a)
    return out


def L(n):
    return [math.comb(n, k) for k in range(n + 1)]


def B(r):
    return add(L(r), [0, 1])


def ztimes(a):
    return [0] + a


def diff(a, k):
    return coeff(a, k + 1) - coeff(a, k)


def first_descent(a):
    return next(k for k in range(len(a)) if diff(a, k) < 0)


def hash_audit():
    common = json.loads((ROOT / "manifests/C5-COMMON-DISPATCH.json").read_text())["members"]
    packet = json.loads((ROOT / "packets/C5-AU.json").read_text())["allowed_source_files"]
    errors = []
    for source, members in (("common", common), ("packet", packet)):
        for member in members:
            path = ROOT / member["path"]
            if not path.is_file():
                errors.append([source, member["path"], "missing"])
            elif hashlib.sha256(path.read_bytes()).hexdigest() != member["sha256"]:
                errors.append([source, member["path"], "hash mismatch"])
    assert not errors, errors
    return {"common_members": len(common), "packet_members": len(packet), "errors": errors}


def profile(a2, a3, a4):
    rs = [2] * a2 + [3] * a3 + [4] * a4
    N = sum(rs)
    Q = [1]
    for r in rs:
        Q = mul(Q, B(r))
    C = mul([1, 2], Q)
    d = ztimes(L(N + 1))
    P = add(C, d)
    return rs, N, Q, C, d, first_descent(P)


def root_case(counts, p):
    rs, N, Q, C, d, x = profile(*counts)
    j = p - 2
    minor = coeff(d, j + 1) * coeff(C, j) - coeff(d, j) * coeff(C, j + 1)
    identity = diff(d, j) * coeff(C, j) - coeff(d, j) * diff(C, j)
    assert minor == identity
    A0 = add(mul(L(1), Q), ztimes(L(N)))
    selectors = {"endpoint_delta": diff(A0, p), "tip_deltas": {}}
    for r in sorted(set(rs)):
        H = [1]
        skipped = False
        for s in rs:
            if s == r and not skipped:
                skipped = True
            else:
                H = mul(H, B(s))
        Ai = add(mul(mul([1, 2], B(r - 1)), H), ztimes(L(N)))
        selectors["tip_deltas"][str(r)] = diff(Ai, p)
    return {"counts": counts, "N": N, "n": N + len(rs) + 3, "alpha": N + 2,
            "x": x, "p": p, "j": j, "guards": [x + 2 <= p, 3 * p < 2 * (N + 2) + 1, 2 * p <= N + 2],
            "d_j": coeff(d, j), "d_j1": coeff(d, j + 1), "C_j": coeff(C, j),
            "C_j1": coeff(C, j + 1), "delta_d_j": diff(d, j),
            "delta_C_j": diff(C, j), "minor": minor, "selectors": selectors}


def activity_case(m):
    k = m + 4
    G = [1, 2]
    B3, B4 = B(3), B(4)
    local = [coeff(mul(mul(G, B3), L(4)), 6), coeff(mul(G, B4), 5),
             coeff(mul(G, B3), 5), coeff(mul(mul(G, B4), L(4)), 6),
             coeff(mul(mul(G, B3), L(4)), 7), coeff(mul(G, B4), 4),
             coeff(mul(G, B3), 6), coeff(mul(mul(G, B4), L(4)), 5)]
    signed = (local[0] * local[1] + local[2] * local[3]
              - local[4] * local[5] - local[6] * local[7]) * (m - 1)
    assert local == [51, 2, 0, 142, 15, 9, 0, 205]
    assert signed == -33 * (m - 1)
    result = {"m": m, "N": 4 * m, "k": k, "guard": [1 <= k, 2 * k <= 4 * m + 2],
              "local_z_coefficients": local, "activity_coefficient": signed}
    if m <= 4:
        A_layers, C_layers = [], []
        for a in range(m):
            common = scale([0] * a + [1], math.comb(m - 1, a))
            tail = L(4 * (m - 1 - a))
            A_layers.append(mul(common, mul(mul(G, B3), tail)))
            C_layers.append(mul(common, mul(mul(G, B4), tail)))
        A_layers[0] = add(A_layers[0], ztimes(L(4 * m)))
        direct = 0
        for a in range(m):
            b = 2 * m - 3 - a
            if 0 <= b < m:
                direct += (coeff(A_layers[a], k) * coeff(C_layers[b], k)
                           - coeff(A_layers[a], k + 1) * coeff(C_layers[b], k - 1))
        assert direct == signed
        result["direct_activity_coefficient"] = direct
    if m == 3:
        shared = power(B4, m - 1)
        C = mul(mul(G, B4), shared)
        Ai = add(mul(mul(G, B3), shared), ztimes(L(4 * m)))
        full = coeff(Ai, k) * coeff(C, k) - coeff(Ai, k + 1) * coeff(C, k - 1)
        x = first_descent(add(C, ztimes(L(4 * m + 1))))
        result.update(full_minor=full, x=x, actual_eligible_exists=(x + 2 <= (4 * m + 2) // 2))
        result["comparison_context_p_equals_k"] = root_case((0, 0, 3), k)
        assert full == 2076267 and x == 7 and not result["actual_eligible_exists"]
    return result


def recurrence_case():
    m = 150
    N = 2 * m
    oldC = mul([1, 2], power(B(2), m))
    oldU = scale(mul(mul([1, 2], B(1)), power(B(2), m - 1)), N)
    E = ztimes(L(N))
    oldW = add(oldU, scale(E, N))
    newC = mul(oldC, B(2))
    newU = scale(mul(mul([1, 2], B(1)), power(B(2), m)), N + 2)
    newE = ztimes(L(N + 2))
    newW = add(newU, scale(newE, N + 2))
    correction = add(scale(mul(L(2), E), 2), scale(ztimes(E), -N))
    recW = add(add(mul(B(2), oldW), scale(mul(B(1), oldC), 2)), correction)
    assert recW == newW
    checks = []
    for k in [1, 2, 4, 152]:
        full = coeff(newW, k) * coeff(newC, k) - coeff(newW, k + 1) * coeff(newC, k - 1)
        checks.append({"k": k, "guard": [1 <= k, 2 * k <= N + 4],
                       "correction": coeff(correction, k), "full_minor": full})
    assert checks[2]["correction"] == -4364800
    assert checks[2]["full_minor"] == 185586251584170562390
    return {"old_counts": [150, 0, 0], "old_N": N, "new_counts": [151, 0, 0],
            "new_N": N + 2, "recurrence_equal_direct_deck": True, "checks": checks,
            "comparison_context_p_equals_k": root_case((151, 0, 0), 4)}


out = {"hash_audit": hash_audit(),
       "root_unrestricted": root_case((10, 0, 0), 6),
       "root_eligible_boundary": root_case((0, 12, 10), 39),
       "root_extended_boundary": root_case((0, 12, 10), 40),
       "activity": [activity_case(m) for m in (3, 4, 8, 20)],
       "recurrence": recurrence_case(),
       "basis_crosscheck": {"F4_z": add(add(L(0), L(1)), L(2)),
                            "GF4_z": mul([1, 2], add(add(L(0), L(1)), L(2)))}}
assert out["root_unrestricted"]["minor"] == -3549105
assert out["root_unrestricted"]["x"] == 11
assert out["root_eligible_boundary"]["minor"] == 213545270520198687231356881755419118232819740
assert out["root_extended_boundary"]["j"] == 38
assert out["root_extended_boundary"]["minor"] > 0
assert out["basis_crosscheck"] == {"F4_z": [3, 3, 1], "GF4_z": [3, 9, 7, 2]}
Path("C5-AU-audit.json").write_text(json.dumps(out, indent=2) + "\n")
print("C5-AU exact audit passed")
