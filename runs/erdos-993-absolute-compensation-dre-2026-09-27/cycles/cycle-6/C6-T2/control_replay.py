#!/usr/bin/env python3
"""Independent literal-factor replay of the three frozen C6 protocol controls."""
import hashlib
import json
import math
from pathlib import Path


def product(fs):
    out = [1]
    for f in fs:
        nxt = [0] * (len(out) + len(f) - 1)
        for i, a in enumerate(out):
            for j, b in enumerate(f):
                nxt[i + j] += a * b
        out = nxt
    return out


def at(a, k):
    return a[k] if 0 <= k < len(a) else 0


def B(r):
    return [math.comb(r, k) + int(k == 1) for k in range(r + 1)]


def replay(counts, r, k):
    a2, a3, a4 = counts
    n = 2*a2 + 3*a3 + 4*a4
    h = 1 + 2*a2 + 4*a3 + 7*a4
    factors = [B(2)]*a2 + [B(3)]*a3 + [B(4)]*a4
    q = product(factors)
    c = product(([1, 2], q))
    e = [0] + [math.comb(n, j) for j in range(n+1)]
    cofactor_factors = factors.copy()
    cofactor_factors.remove(B(r))
    u = product(([1, 2], B(r-1), product(cofactor_factors)))
    e_minor = at(e,k)*at(c,k)-at(e,k+1)*at(c,k-1)
    full_minor = (at(u,k)+at(e,k))*at(c,k)-(at(u,k+1)+at(e,k+1))*at(c,k-1)
    surplus = (h+1)*at(u,k)*at(c,k)+(k+1)*(h-k+1)*e_minor
    return {
        "counts": list(counts), "N": n, "tree_order": n+sum(counts)+3,
        "h": h, "r": r, "k": k, "guard_max": (n+2)//2,
        "E_only_minor": str(e_minor), "full_tip_minor": str(full_minor),
        "surplus_margin": str(surplus), "U_k": str(at(u,k)),
        "U_kp1": str(at(u,k+1)), "C_k": str(at(c,k)),
        "C_km1": str(at(c,k-1)), "E_k": str(at(e,k)),
        "E_kp1": str(at(e,k+1)),
    }


rows = [
    replay((0,22,0), 3, 27),
    replay((38,0,1), 4, 77),
    replay((1,0,0), 2, 1),
]
assert rows[0]["tree_order"] == 91 and rows[0]["E_only_minor"].startswith("-")
assert rows[0]["full_tip_minor"] == "777419068009671422357461955841645743808"
assert rows[1]["tree_order"] == 122 and rows[1]["full_tip_minor"].startswith("-")
assert rows[1]["k"] > rows[1]["guard_max"]
assert rows[2]["surplus_margin"] == "98"
payload = {"grade": "exact finite control replay", "method": "direct literal factor products; no cofactor division",
           "controls": rows}
Path("controls.json").write_text(json.dumps(payload, indent=2, sort_keys=True)+"\n")
print(json.dumps(payload, sort_keys=True))
