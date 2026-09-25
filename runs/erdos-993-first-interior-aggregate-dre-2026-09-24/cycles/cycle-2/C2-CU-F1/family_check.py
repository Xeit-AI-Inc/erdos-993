"""Exact coefficient check for the C2-F1 path-with-arms constructor.

Derived by conditioning on the junction vertex w. No source checker is run.
"""
import json
from math import comb


def choose(n, k):
    return comb(n, k) if 0 <= k <= n else 0


def add(*polys):
    out = [0] * max(map(len, polys))
    for poly in polys:
        for j, value in enumerate(poly):
            out[j] += value
    return out


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for j, x in enumerate(a):
        for k, y in enumerate(b):
            out[j + k] += x * y
    return out


def power_linear(c, m):
    return [choose(m, j) * c**j for j in range(m + 1)]


def shift(poly):
    return [0] + poly


def difference(poly, k):
    def at(j):
        return poly[j] if 0 <= j < len(poly) else 0
    return at(k + 1) - at(k)


def tree_poly(m):
    # w excluded: the v-s-u path and m independent a-b edges.
    # w included: u,a_j excluded; v-s edge and m free b_j.
    return add(mul([1, 3, 1], power_linear(2, m)),
               shift(mul([1, 2], power_linear(1, m))))


def leaf0_deleted_poly(m):
    # v deleted. With w excluded, s-u edge; with w included, free s.
    return add(mul([1, 2], power_linear(2, m)),
               shift(power_linear(1, m + 1)))


def arm_leaf_deleted_poly(m):
    # b_0 deleted: its a_0 becomes a leaf of w.
    return add(mul([1, 3, 1], mul([1, 1], power_linear(2, m - 1))),
               shift(mul([1, 2], power_linear(1, m - 1))))


def row(m):
    p = m
    t = tree_poly(m)
    alpha = len(t) - 1
    x = next(k for k in range(alpha + 1) if difference(t, k) < 0)
    q0 = shift(power_linear(2, m))
    qb = shift(mul([1, 2], power_linear(1, m - 1)))
    q0p, q0prev = q0[p], q0[p - 1]
    qbp, qbprev = qb[p], qb[p - 1]
    d0 = difference(leaf0_deleted_poly(m), p)
    db = difference(arm_leaf_deleted_poly(m), p)
    term0 = q0p - q0prev
    termb = qbp - qbprev
    selector0, selectorb = d0 < 0, db < 0
    return {
        "m": m, "n": 4 + 2*m, "alpha": alpha, "p": p, "x": x,
        "eligible": x + 2 <= p, "tail_guard": 3*p >= 2*alpha + 1,
        "delta_at_x_minus_1": difference(t, x - 1),
        "delta_at_x": difference(t, x),
        "leaf0_selector_delta": d0, "arm_leaf_selector_delta": db,
        "leaf0_selected": selector0, "arm_leaves_selected": selectorb,
        "q0_p": q0p, "q0_pminus1": q0prev,
        "qb_p": qbp, "qb_pminus1": qbprev,
        "leaf0_term": term0, "arm_leaf_term": termb,
        "S": (term0 if selector0 else 0) + m*(termb if selectorb else 0),
    }


rows = [row(m) for m in (3, 4, 5, 10, 20, 120)]
with open("scratchpad/C2-CU-F1/family_check.json", "w") as output:
    json.dump(rows, output, indent=2)
print(json.dumps(rows, indent=2))
