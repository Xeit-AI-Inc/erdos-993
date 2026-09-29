#!/usr/bin/env python3
"""Independent exact checks of C6 finite-prefix coverage and radix endpoints."""
from math import comb
import json


def layer(m):
    profiles = rows = S = O = weighted_N = 0
    for a2 in range(m + 1):
        for a3 in range(m - a2 + 1):
            a4 = m - a2 - a3
            s = int(a2 > 0) + int(a3 > 0) + int(a4 > 0)
            N = 2*a2 + 3*a3 + 4*a4
            profiles += 1
            rows += s * ((N + 2) // 2)
            S += s
            weighted_N += s*N
            O += s * (a3 % 2)
    u = m // 2
    closed_O = 3*u*u + u if m % 2 == 0 else (u+1)*(3*u+1)
    closed_S = 3*comb(m+1, 2)
    closed_rows = ((3*m+2)*closed_S-closed_O)//2
    assert profiles == comb(m+2, 2)
    assert S == closed_S and O == closed_O
    assert weighted_N == 3*m*closed_S
    assert rows == closed_rows
    return profiles, rows


def mul(a,b):
    out = [0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): out[i+j] += x*y
    return out


def add(a,b):
    out = [0]*max(len(a),len(b))
    for i,x in enumerate(a): out[i] += x
    for i,x in enumerate(b): out[i] += x
    return out


def B(r):
    # (1+z)^r+z, built in monomial z basis.
    return add([comb(r,k) for k in range(r+1)], [0,1])


def value_digits(coeff, base):
    value = sum(c*base**i for i,c in enumerate(coeff))
    digits=[]
    while value:
        digits.append(value % base); value //= base
    return digits


def radix_controls():
    checks=[]
    for r in (2,3,4):
        m=1; N=r; base=1 << (N+m+2)
        Q=B(r); C=mul([1,2],Q)
        U=mul(mul([1,2],B(r-1)),[1])
        E=mul([0,1],[comb(N,k) for k in range(N+1)])
        for name,poly in (("Q",Q),("C",C),("U",U),("E",E)):
            assert max(poly) < base
            assert value_digits(poly,base) == poly
        checks.append({"m":m,"arity":r,"N":N,"radix":base,
                       "norm_Q":sum(Q),"norm_C":sum(C),"norm_U":sum(U),"norm_E":sum(E),
                       "max_coefficient":max(max(Q),max(C),max(U),max(E))})
    return checks


def main():
    rows=[layer(m) for m in range(1,100)]
    assert sum(x[0] for x in rows)==171699
    assert sum(x[1] for x in rows)==56245000
    assert sum(x[1] for x in rows[:20])==109175
    print(json.dumps({"grade":"independent exact coverage proof cross-check and small radix boundary tests; no surplus signs",
                      "profile_total":sum(x[0] for x in rows),"represented_type_rank_total":sum(x[1] for x in rows),
                      "through_m20":sum(x[1] for x in rows[:20]),"radix_boundary_controls":radix_controls()},indent=2))

if __name__=='__main__': main()
