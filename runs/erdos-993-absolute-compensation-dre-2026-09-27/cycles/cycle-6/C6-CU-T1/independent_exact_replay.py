#!/usr/bin/env python3
"""Independent exact coefficient and rational checks for C6 m>=100 tail."""
from fractions import Fraction
from math import comb, factorial
import json

def add(a,b):
    out=[0]*max(len(a),len(b))
    for i,v in enumerate(a): out[i]+=v
    for i,v in enumerate(b): out[i]+=v
    return out

def mul(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): out[i+j]+=x*y
    return out

def power(a,n):
    out=[1]
    for _ in range(n): out=mul(out,a)
    return out

def B(r):
    # (1+z)^r + z, in monomial z basis.
    a=[comb(r,j) for j in range(r+1)]
    a[1]+=1
    return a

def get(a,k): return a[k] if 0<=k<len(a) else 0

def taylor(d,x): return sum((x**i/Fraction(factorial(i)) for i in range(d+1)),Fraction(0))

def g(r,n,k): return Fraction(2*r,2*r+1)*Fraction(comb(n-r,k-1),comb(n,k))

def profile(counts):
    a2,a3,a4=counts; m=sum(counts); N=2*a2+3*a3+4*a4
    Q=[1]
    rs=[2]*a2+[3]*a3+[4]*a4
    for r in rs: Q=mul(Q,B(r))
    C=mul([1,2],Q)
    E=[0]+[comb(N,j) for j in range(N+1)]
    h=1+2*a2+4*a3+7*a4
    rows=[]
    for r in sorted(set(rs)):
        H=[1]
        skipped=False
        for s in rs:
            if not skipped and s==r: skipped=True; continue
            H=mul(H,B(s))
        U=mul(mul([1,2],B(r-1)),H)
        for k in sorted(set([1, max(1,N//4), N//4+1, (N+2)//2-1, (N+2)//2])):
            if 2*k>N+2: continue
            lam=Fraction(h+1,(k+1)*(h-k+1))
            M=get(E,k)*get(C,k)-get(E,k+1)*get(C,k-1)
            S=(h+1)*get(U,k)*get(C,k)+(k+1)*(h-k+1)*M
            rows.append({'r':r,'k':k,'U':get(U,k),'Ck':get(C,k),'Ckm1':get(C,k-1),'M':M,'lambda':str(lam),'surplus':S})
            assert S>0
    return {'counts':counts,'m':m,'N':N,'h':h,'rows':rows}

# Exact checks of the exponent floor and its parity boundary expressions.
for N in range(200,801):
    K=(N+2)//2
    k0=(N+1)//4+1
    assert k0>N/4
    assert 4*k0>N+1
    assert 4*K>=N-3
    assert g(2,N,k0)>=g(3,N,k0)>=g(4,N,k0)
    assert g(2,N,K)>=g(3,N,K)>=g(4,N,K)>=Fraction(1,20)
# The claimed monotonic ratio has positive denominator in the stated band;
# its difference from 1 has sign N-4k-3 <= 0.
for N in (200,201,399,400,401,800):
    for k in range(N//4+1,(N+2)//2):
        lhs=(k+1)*(N-k-3); rhs=k*(N-k)
        assert lhs<=rhs

# Exact Taylor inequalities after substitution m=100 and m=101 interior.
a=Fraction(99,20); E8=taylor(8,a); E7=taylor(7,a)
assert E8>102 and E7>20
for m in (100,101,137,1000):
    t=Fraction(m-100,20)
    assert taylor(8,a+t)>=E8+t*E7>m+2
# Exact operator arrays in monomial z basis, recomputed directly.
ops={}
for r in range(1,5):
    f=B(r); d=r
    vals=[]
    for k in range(d+1):
        v=3*(k+1)*get(f,k+1)+(2*k-2*d)*get(f,k)
        assert v>=0
        vals.append(v)
    ops[r]=vals

profiles=[(100,0,0),(0,100,0),(0,0,100),(34,33,33),(50,25,25)]
results=[profile(p) for p in profiles]
print(json.dumps({'grade':'independent exact finite checks; universal scope rests on algebraic proof','N_range_g4':[200,800], 'operator_z_coefficients':ops,'E8_99_20':str(E8),'E7_99_20':str(E7),'profiles':results},sort_keys=True))
