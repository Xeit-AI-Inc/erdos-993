#!/usr/bin/env python3
"""Independent exact replay for the pinned C2-AU repair fixture.

Uses a deletion recurrence for all graph polynomials and a separate literal
subset enumeration for the original tree and both displayed residuals.
"""

import json
from functools import lru_cache

N = 18
EDGES = [(i, i + 1) for i in range(5)] + [
    (i, 6 + 2 * i + j) for i in range(6) for j in range(2)
]
ADJ = [0] * N
for a, b in EDGES:
    ADJ[a] |= 1 << b
    ADJ[b] |= 1 << a
ALL = (1 << N) - 1


def vertices(mask):
    return [u for u in range(N) if mask & (1 << u)]


def add(a, b, shift=0):
    out = [0] * max(len(a), len(b) + shift)
    for j, x in enumerate(a):
        out[j] += x
    for j, x in enumerate(b):
        out[j + shift] += x
    while len(out) > 1 and out[-1] == 0:
        out.pop()
    return tuple(out)


@lru_cache(None)
def polynomial(mask):
    if mask == 0:
        return (1,)
    bit = mask & -mask
    v = bit.bit_length() - 1
    return add(polynomial(mask ^ bit), polynomial(mask & ~(bit | ADJ[v])), 1)


def literal_polynomial(mask):
    vv = vertices(mask)
    out = [0] * (len(vv) + 1)
    for code in range(1 << len(vv)):
        subset = 0
        for j, v in enumerate(vv):
            if code & (1 << j):
                subset |= 1 << v
        if all(not (ADJ[v] & subset) for v in vv if subset & (1 << v)):
            out[code.bit_count()] += 1
    while len(out) > 1 and out[-1] == 0:
        out.pop()
    return tuple(out)


def delta(poly, j):
    return (poly[j + 1] if j + 1 < len(poly) else 0) - (
        poly[j] if j < len(poly) else 0
    )


def closed(v):
    return (1 << v) | ADJ[v]


P = polynomial(ALL)
assert P == literal_polynomial(ALL)
a = len(P) - 1
x = next(j for j in range(len(P)) if delta(P, j) < 0)
p = 8
v, s = 6, 0
H = ALL & ~((1 << v) | (1 << s))
marks = vertices(ADJ[s] & ~(1 << v))
assert marks == [1, 7]
residuals = []
for i, w in enumerate(marks):
    earlier = sum(1 << u for u in marks[:i])
    deleted = (closed(w) | earlier) & H
    J = H & ~deleted
    poly = polynomial(J)
    assert poly == literal_polynomial(J)
    residuals.append({
        "index": i + 1,
        "mark": w,
        "deleted": vertices(deleted),
        "vertices": vertices(J),
        "order": J.bit_count(),
        "polynomial": list(poly),
        "difference_i_k_minus_i_k_minus_1": delta(poly, p - 2),
    })

leaves = [u for u in range(N) if ADJ[u].bit_count() == 1]
rows = []
for u in leaves:
    t = (ADJ[u] & -ADJ[u]).bit_length() - 1
    selector = delta(polynomial(ALL & ~(1 << u)), p)
    h = ALL & ~((1 << u) | (1 << t))
    r = ALL & ~closed(t)
    summand = delta(polynomial(h), p - 1) - delta(polynomial(r), p - 1)
    rows.append({"leaf": u, "support": t, "selector_delta_p": selector,
                 "selected": selector < 0, "summand": summand})

out = {
    "recipe": {"vertices": list(range(N)), "edges": [list(e) for e in EDGES], "p": p},
    "original": {"polynomial": list(P), "alpha": a, "x": x,
                 "differences_through_terminal": [delta(P, j) for j in range(len(P))],
                 "eligible": x + 2 <= p and 3 * p < 2 * a + 1},
    "tag": {"leaf": v, "support": s, "H_order": H.bit_count(),
            "marks_ordered": marks, "residuals": residuals},
    "all_leaf_rows": rows,
    "favorable_set": [row["leaf"] for row in rows if row["selected"]],
    "complete_sum": sum(row["summand"] for row in rows if row["selected"]),
    "methods": ["memoized vertex deletion recurrence", "literal subset enumeration for T, J1, J2"],
}
assert out["original"]["eligible"]
assert residuals[1]["order"] == 14 and residuals[0]["order"] == 12
print(json.dumps(out, indent=2))
