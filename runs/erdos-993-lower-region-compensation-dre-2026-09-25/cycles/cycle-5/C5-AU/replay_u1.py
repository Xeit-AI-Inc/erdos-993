"""Independent integer-polynomial replay of the case-listed U1 finite family."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).with_name("EVIDENCE.json")

def add(*ps):
    a = [0] * max(map(len, ps))
    for p in ps:
        for j, x in enumerate(p):
            a[j] += x
    return a

def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c

def powp(a, n):
    out = [1]
    for _ in range(n):
        out = mul(out, a)
    return out

def delta(a, j):
    return (a[j + 1] if 0 <= j + 1 < len(a) else 0) - (a[j] if 0 <= j < len(a) else 0)

A, B, C = [1, 4, 3, 1], [1, 3, 3, 1], [1, 3, 1]
L, L2, L3 = [1, 1], [1, 2, 1], [1, 3, 3, 1]
rows = []
changed_values = changed_signs = 0
for m in range(1, 41):
    am, bm = powp(A, m), powp(B, m)
    am1, bm1 = powp(A, m - 1), powp(B, m - 1)
    T = add(mul([1, 2], am), mul([0, 1, 1], bm))
    a = len(T) - 1
    x = next(j for j in range(a + 1) if delta(T, j) < 0)
    assert delta(T, a) < 0 and a == 3 * m + 2
    tip_del = add(mul(mul([1, 2], am1), C), mul(mul([0, 1], L3), bm1))
    wrong_tip_del = add(mul(mul([1, 2], am1), C), mul(mul([0, 1], L2), bm1))
    end_del = add(mul(L, am), mul([0, 1], bm))
    H_tip = mul(L2, add(mul([1, 2], am1), mul([0, 1, 1], bm1)))
    R_tip = mul([1, 2], am1)
    H_end = add(am, mul([0, 1], bm))
    R_end = am
    for p in range(x + 2, a + 1):
        if 3 * p >= 2 * a + 1:
            continue
        dt, de = delta(tip_del, p), delta(end_del, p)
        dwrong = delta(wrong_tip_del, p)
        changed_values += dt != dwrong
        changed_signs += (dt < 0) != (dwrong < 0)
        st = delta(H_tip, p - 1) - delta(R_tip, p - 1)
        se = delta(H_end, p - 1) - delta(R_end, p - 1)
        S = (3 * m * st if dt < 0 else 0) + (se if de < 0 else 0)
        rows.append({"m": m, "p": p, "alpha": a, "x": x,
                     "tip_selector_delta": dt, "endpoint_selector_delta": de,
                     "tip_selected": dt < 0, "endpoint_selected": de < 0,
                     "tip_summand": st, "endpoint_summand": se, "S": S})

audit = json.loads((ROOT / "cycles/cycle-5/C5-CT-U1/AUDIT-EVIDENCE.json").read_text())
assert len(rows) == audit["eligible_rows"] == 427
assert changed_values == audit["selector_delta_values_changed_by_correction"] == 417
assert changed_signs == audit["selector_strict_sign_changes_by_correction"] == 0
assert all(r["S"] < 0 for r in rows)
for row, check in zip(rows, audit["corrected_rows"], strict=True):
    assert (row["m"], row["p"], row["alpha"], row["x"], row["S"]) == (check["m"], check["p"], check["alpha"], check["x"], check["S"])
    selected = {x["orbit"]: x for x in check["selected"]}
    assert ("tip" in selected) == row["tip_selected"]
    assert ("endpoint2" in selected) == row["endpoint_selected"]
    if row["tip_selected"]:
        assert selected["tip"]["delta_p_deleted"] == row["tip_selector_delta"]
        assert selected["tip"]["per_leaf_summand"] == row["tip_summand"]
    if row["endpoint_selected"]:
        assert selected["endpoint2"]["delta_p_deleted"] == row["endpoint_selector_delta"]
        assert selected["endpoint2"]["per_leaf_summand"] == row["endpoint_summand"]

OUT.write_text(json.dumps({"family": "path 0-1-2 with m three-tip claws attached at 0",
                           "method": "independent exact integer-polynomial recurrence; original tip multiplicity 3m and endpoint multiplicity 1",
                           "m_range": [1, 40], "eligible_rows": len(rows),
                           "nonempty_m_range": [3, 40],
                           "selector_orbit_rank_comparisons": 2 * len(rows),
                           "selector_values_changed_from_wrong_source": changed_values,
                           "selector_strict_sign_changes": changed_signs,
                           "nonnegative_full_sums": sum(r["S"] >= 0 for r in rows),
                           "correct_tip_deletion": "(1+2z)A^(m-1)C+z(1+z)^3B^(m-1)",
                           "source_tip_deletion": "(1+2z)A^(m-1)C+z(1+z)^2B^(m-1)",
                           "A": A, "B": B, "C": C, "rows": rows}, indent=2) + "\n")
print(f"verified {len(rows)} rows; {changed_values} changed selector values; {changed_signs} sign changes; all S<0")
