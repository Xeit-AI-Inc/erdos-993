"""Exact closed-polynomial audit of the C2-F1 path-with-arms family.

Run from the run root: python3 scratchpad/C2-CT-F1/independent_family.py
The input parameter set is explicit; no source worker script is executed.
"""

from math import comb
import json
from pathlib import Path


def a(m, j):
    return comb(m, j) * 2**j if 0 <= j <= m else 0


def b(m, j):
    return comb(m, j) if 0 <= j <= m else 0


def poly(m, kind, j):
    if kind == "tree":
        return a(m, j) + 3*a(m, j-1) + a(m, j-2) + b(m, j-1) + 2*b(m, j-2)
    if kind == "delete_v":
        return a(m, j) + 2*a(m, j-1) + b(m, j-1) + b(m, j-2)
    if kind == "delete_arm_leaf":
        return (a(m-1, j) + 4*a(m-1, j-1) + 4*a(m-1, j-2)
                + a(m-1, j-3) + b(m-1, j-1) + 2*b(m-1, j-2))
    raise ValueError(kind)


def row(m):
    alpha = m + 2
    p = m
    x = next(j for j in range(alpha + 1) if poly(m, "tree", j+1) < poly(m, "tree", j))
    selector_v = poly(m, "delete_v", p+1) < poly(m, "delete_v", p)
    selector_arm = poly(m, "delete_arm_leaf", p+1) < poly(m, "delete_arm_leaf", p)
    q_v_p = a(m, p-1)
    q_v_prev = a(m, p-2)
    local_v = q_v_p - q_v_prev
    q_arm_p = b(m-1, p-1) + 2*b(m-1, p-2)
    q_arm_prev = b(m-1, p-2) + 2*b(m-1, p-3)
    local_arm = q_arm_p - q_arm_prev
    return {
        "m": m, "order": 4+2*m, "alpha": alpha, "p": p, "x": x,
        "delta_before_x": (poly(m, "tree", x)-poly(m, "tree", x-1)) if x else None,
        "delta_at_x": poly(m, "tree", x+1)-poly(m, "tree", x),
        "eligible": x+2 <= p, "tail_guard": 3*p >= 2*alpha+1,
        "selector_v": selector_v, "selector_arm": selector_arm,
        "delta_p_delete_v": poly(m, "delete_v", p+1)-poly(m, "delete_v", p),
        "delta_p_delete_arm_leaf": poly(m, "delete_arm_leaf", p+1)-poly(m, "delete_arm_leaf", p),
        "q_v_p": q_v_p, "q_v_prev": q_v_prev,
        "local_v": local_v, "q_arm_p": q_arm_p, "q_arm_prev": q_arm_prev,
        "local_arm": local_arm,
        "selected_leaf_count": int(selector_v)+m*int(selector_arm),
        "complete_sum": (local_v if selector_v else 0)+m*(local_arm if selector_arm else 0),
    }


rows = [row(m) for m in (3, 4, 5, 10, 20, 120)]
assert [r["local_v"] for r in rows[:5]] == [6, 8, 0, -6400, -39321600]
assert [r["complete_sum"] for r in rows[:5]] == [9, 0, -35, -7020, -39328040]
assert [r["x"] for r in rows[:5]] == [3, 4, 4, 8, 14]
out = Path("scratchpad/C2-CT-F1/independent_family.json")
out.write_text(json.dumps(rows, indent=2) + "\n")
print(json.dumps(rows[-1], indent=2))
