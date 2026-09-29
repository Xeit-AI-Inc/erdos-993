"""Exact independent audit of the (C,U,E) branch-addition recurrence."""
from math import comb
import json


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a):
        out[i] += x
    for i, x in enumerate(b):
        out[i] += x
    return out


def scale(a, c):
    return [c * x for x in a]


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def B(r):
    return [comb(r, j) + (j == 1) for j in range(r + 1)]


def Lpow(n):
    return [comb(n, j) for j in range(n + 1)]


def at(a, k):
    return a[k] if 0 <= k < len(a) else 0


def trim(a):
    while len(a) > 1 and a[-1] == 0:
        a.pop()
    return a


def audit(counts):
    C, U, E, N = [1, 2], [0], [0, 1], 0
    steps = []
    for r, count in zip((2, 3, 4), counts):
        for _ in range(count):
            old_C, old_U, old_E, old_N = C, U, E, N
            old_guard = (old_N + 2) // 2
            C = mul(B(r), old_C)
            U = add(mul(B(r), old_U), scale(mul(B(r - 1), old_C), r))
            E = mul(Lpow(r), old_E)
            N += r
            W = add(U, scale(E, N))
            rhs_W = add(
                add(mul(B(r), add(old_U, scale(old_E, old_N))),
                    scale(mul(B(r - 1), old_C), r)),
                mul(Lpow(r), scale(old_E, r))
            )
            # Subtract N_old*z*E separately.
            rhs_W = add(rhs_W, scale(mul([0, 1], old_E), -old_N))
            assert trim(W[:]) == trim(rhs_W[:])
            assert C == mul(B(r), old_C)
            assert E == mul(Lpow(r), old_E)
            new_guard = (N + 2) // 2
            steps.append({
                "added_r": r,
                "N_before": old_N,
                "N_after": N,
                "guard_before": old_guard,
                "guard_after": new_guard,
                "new_guard_ranks": list(range(old_guard + 1, new_guard + 1)),
                "component_recurrences_exact": True,
                "weighted_recurrence_exact": True,
            })
    h = 1 + 2 * counts[0] + 4 * counts[1] + 7 * counts[2]
    W = add(U, scale(E, N))
    guard = (N + 2) // 2
    margins = []
    for k in range(1, guard + 1):
        mE = at(E, k) * at(C, k) - at(E, k + 1) * at(C, k - 1)
        weighted_shifted = at(W, k) * at(C, k) - at(W, k + 1) * at(C, k - 1)
        weighted_surplus = ((h + 1) * at(U, k) * at(C, k)
                            + (k + 1) * (h - k + 1) * N * mE)
        margins.append({"k": k, "weighted_shifted_minor": weighted_shifted,
                        "weighted_surplus_margin": weighted_surplus})
    return {"steps": steps, "guarded_margins": margins}


profiles = [(1, 0, 0), (0, 1, 0), (0, 0, 1), (2, 3, 4), (4, 1, 2)]
rows = [{"counts": list(p), **audit(p)} for p in profiles]
print(json.dumps({
    "scope": "Exact finite replay of branch-addition polynomial identities on five profiles; the symbolic identities follow by multiplication and are proved in REPORT.md. Not evidence for the guarded comparison.",
    "profiles": len(rows),
    "branch_steps": sum(len(row["steps"]) for row in rows),
    "guarded_ranks_checked": sum(len(row["guarded_margins"]) for row in rows),
    "all_exact": all(s["component_recurrences_exact"] and s["weighted_recurrence_exact"]
                     for row in rows for s in row["steps"]),
    "all_sample_surpluses_nonnegative": all(x["weighted_surplus_margin"] >= 0
                                             for row in rows for x in row["guarded_margins"]),
    "all_sample_shifted_minors_nonnegative": all(x["weighted_shifted_minor"] >= 0
                                                  for row in rows for x in row["guarded_margins"]),
    "rows": rows,
}, indent=2))
