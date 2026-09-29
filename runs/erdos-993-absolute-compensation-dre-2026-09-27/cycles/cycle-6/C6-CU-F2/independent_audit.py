#!/usr/bin/env python3
"""Independent exact checks of the C6-F2 coverage/bound claims; not a sign census."""
from math import comb
import json
from pathlib import Path


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, v in enumerate(a): out[i] += v
    for i, v in enumerate(b): out[i] += v
    return out


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): out[i + j] += x * y
    return out


def power(a, n):
    out = [1]
    for _ in range(n): out = mul(out, a)
    return out


def B(r):
    # (1+z)^r + z, in ascending monomial-z coefficients.
    p = power([1, 1], r)
    return add(p, [0, 1])


def layer_by_a3(m):
    profiles = rows = 0
    for a3 in range(m + 1):
        rem = m - a3
        for a2 in range(rem + 1):
            a4 = rem - a2
            N = 2*a2 + 3*a3 + 4*a4
            represented = (a2 > 0) + (a3 > 0) + (a4 > 0)
            profiles += 1
            rows += represented * ((N + 2) // 2)
    return profiles, rows


coverage = []
for m in range(1, 100):
    p, r = layer_by_a3(m)
    # Independent closed form from s*N sum and odd-a3 split sum.
    S = 3 * comb(m + 1, 2)
    u = m // 2
    O = 3*u*u + u if m % 2 == 0 else (u+1)*(3*u+1)
    closed = ((3*m + 2)*S - O) // 2
    assert p == comb(m + 2, 2)
    assert r == closed, (m, r, closed)
    coverage.append((p, r))
assert sum(x[0] for x in coverage) == 171699
assert sum(x[1] for x in coverage) == 56245000
assert sum(x[1] for x in coverage[:20]) == 109175

# Exact monomial-z boundary control m=1, a2=1. It includes k=1 and k=2,
# the endpoints of the guarded rank interval for N=2.
G = [1, 2]
q = B(2)
C = mul(G, q)
U = mul(G, B(1))
E = [0, 1, 2, 1]  # z(1+z)^2
h, N = 3, 2
surpluses = {}
for k in (1, 2):
    c = lambda f, i: f[i] if 0 <= i < len(f) else 0
    Mk = c(E,k)*c(C,k)-c(E,k+1)*c(C,k-1)
    val = (h+1)*c(U,k)*c(C,k) + (k+1)*(h-k+1)*Mk
    surpluses[str(k)] = {"U_k":c(U,k),"C_k":c(C,k),"M_k_E":Mk,"surplus":val}
    assert val >= 0
assert q == [1,3,1] and B(1) == [1,2] and U == [1,4,4] and C == [1,5,7,2]

# No-carry examples at small/interior and arity endpoint profiles.
examples = []
for a2,a3,a4 in [(1,0,0),(0,0,1),(1,1,0),(0,0,2)]:
    m=a2+a3+a4; N=2*a2+3*a3+4*a4
    factors=[B(2)]*a2+[B(3)]*a3+[B(4)]*a4
    q=[1]
    for f in factors: q=mul(q,f)
    c=mul(G,q)
    for r in (2,3,4):
        if (a2,a3,a4)[r-2] == 0: continue
        factors_u=[B(2)]*a2+[B(3)]*a3+[B(4)]*a4
        factors_u.remove(B(r))
        factors_u.append(B(r-1))
        u_poly=mul(G,[1])
        for f in factors_u: u_poly=mul(u_poly,f)
        e=[0]+[comb(N,i) for i in range(N+1)]
        radix=1 << (N+m+2)
        polys={"Q":q,"C":c,"U":u_poly,"E":e}
        assert all(max(poly,default=0) < radix for poly in polys.values())
        # Evaluate then extract every coefficient digit, checking no carry.
        enc={name:sum(v*radix**i for i,v in enumerate(poly)) for name,poly in polys.items()}
        for name,poly in polys.items():
            got=[(enc[name]//radix**i)%radix for i in range(len(poly))]
            assert got==poly
        examples.append({"profile":[a2,a3,a4],"N":N,"m":m,"represented_r":r,
                         "radix":radix,"max_coefficients":{k:max(v) for k,v in polys.items()}})

out={"grade":"independent exact coverage arithmetic and small coefficient/radix controls only; no census",
     "coverage_m1_m99":{"profiles":sum(x[0] for x in coverage),"type_rank_rows":sum(x[1] for x in coverage),
                        "rows_through_m20":sum(x[1] for x in coverage[:20]),
                        "m1":[coverage[0][0],coverage[0][1]],"m99":[coverage[-1][0],coverage[-1][1]]},
     "m1_r2_boundary_control":{"B1":[1,2],"B2":[1,3,1],"C":[1,5,7,2],"U":[1,4,4],"guarded_surpluses":surpluses},
     "radix_examples":examples,
     "limitations":["No bounded prefix surplus census was run.","Sample encodings check the stated mechanism; universal no-carry follows from the l1 bounds recorded in REPORT.md."]}
Path('independent_audit.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
