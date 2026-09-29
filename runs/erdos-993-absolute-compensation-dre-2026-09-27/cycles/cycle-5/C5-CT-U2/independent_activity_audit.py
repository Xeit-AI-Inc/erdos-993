#!/usr/bin/env python3
"""Independent z-basis audit of the assigned activity-layer claim."""
from math import comb
import json
from pathlib import Path


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def add(a, b):
    c = [0] * max(len(a), len(b))
    for i, x in enumerate(a): c[i] += x
    for i, x in enumerate(b): c[i] += x
    return c


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def power(a, e):
    r = [1]
    for _ in range(e): r = mul(r, a)
    return r


L, G = [1, 1], [1, 2]
B3, B4, L4 = [1, 4, 3, 1], [1, 5, 6, 4, 1], [1, 4, 6, 4, 1]
GB3, GB4 = mul(G, B3), mul(G, B4)


def layer(base, m, d):
    # [t^d] base*(L^4+t*z)^(m-1), in ordinary powers of z.
    if d < 0 or d > m - 1: return [0]
    return mul([0] * d + [comb(m - 1, d)], mul(base, power(L4, m - 1 - d)))


def layer_minor(m):
    k, d = m + 4, 2 * m - 3
    u, c = [layer(GB3, m, a) for a in range(m)], [layer(GB4, m, a) for a in range(m)]
    value = 0
    for a in range(m):
        b = d - a
        if 0 <= b < m:
            value += coeff(u[a], k) * coeff(c[b], k)
            value -= coeff(u[a], k + 1) * coeff(c[b], k - 1)
    # E has activity degree 0; E*C_t has t-degree at most m-1 < d.
    return value


def direct_bivariate_layer(m):
    # Independent explicit two-variable expansion for m=3..7.
    k, d = m + 4, 2 * m - 3
    u, c = [layer(GB3, m, a) for a in range(m)], [layer(GB4, m, a) for a in range(m)]
    return sum(coeff(u[a], k) * coeff(c[d-a], k) -
               coeff(u[a], k+1) * coeff(c[d-a], k-1)
               for a in range(m) if 0 <= d-a < m)


def ordinary_minor(m):
    k = m + 4
    C = mul(G, power(B4, m))
    U = mul(GB3, power(B4, m-1))
    E = [0] + [comb(4*m, j) for j in range(4*m+1)]
    A = add(U, E)
    return coeff(A, k)*coeff(C, k) - coeff(A, k+1)*coeff(C, k-1)


def first_strict_descent(p):
    for k in range(len(p)):
        if coeff(p, k+1) - coeff(p, k) < 0:
            return k
    return None


local = {
    "GB3L4[6]": coeff(mul(GB3, L4), 6),
    "GB4[5]": coeff(GB4, 5),
    "GB3[5]": coeff(GB3, 5),
    "GB4L4[6]": coeff(mul(GB4, L4), 6),
    "GB3L4[7]": coeff(mul(GB3, L4), 7),
    "GB4[4]": coeff(GB4, 4),
    "GB3[6]": coeff(GB3, 6),
    "GB4L4[5]": coeff(mul(GB4, L4), 5),
}
local_value = (local["GB3L4[6]"]*local["GB4[5]"] +
               local["GB3[5]"]*local["GB4L4[6]"] -
               local["GB3L4[7]"]*local["GB4[4]"] -
               local["GB3[6]"]*local["GB4L4[5]"])

checks = []
for m in (3, 4, 5, 7, 20):
    k, N = m+4, 4*m
    checks.append({"m":m,"N":N,"k":k,"guard_left_2k":2*k,
                   "guard_right_N_plus_2":N+2,"guard_holds":2*k <= N+2,
                   "coefficient_formula":layer_minor(m),
                   "closed_form":-33*(m-1),
                   "actual_t1_minor":ordinary_minor(m)})
assert local == {"GB3L4[6]":51,"GB4[5]":2,"GB3[5]":0,"GB4L4[6]":142,
                 "GB3L4[7]":15,"GB4[4]":9,"GB3[6]":0,"GB4L4[5]":205}
assert local_value == -33
assert all(x["guard_holds"] and x["coefficient_formula"] == x["closed_form"] for x in checks)
assert all(direct_bivariate_layer(m) == -33*(m-1) for m in range(3, 8))
assert checks[0]["actual_t1_minor"] == 2076267
P3 = add(mul(G, power(B4, 3)), [0] + [comb(13, j) for j in range(14)])
x3 = first_strict_descent(P3)
eligible3 = [p for p in range(len(P3)+1)
             if x3+2 <= p and 3*p < 2*14+1 and 2*p <= 14]
assert x3 == 7 and eligible3 == []
out = {"basis":"ordinary monomial powers of z", "local_coefficients":local,
       "local_signed_combination":local_value,"samples":checks,
       "direct_two_variable_crosscheck_m3_to_7":True,
       "m3_actual_parent_first_strict_descent_x":x3,
       "m3_actual_eligible_p_values":eligible3,
       "scope":"assigned activity coefficient claim only; no t=1 or payment inference"}
Path("independent_activity_audit.json").write_text(json.dumps(out, indent=2)+"\n")
print(json.dumps(out))
