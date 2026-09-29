#!/usr/bin/env python3
"""Independent monomial-basis replay for the C5-U3 recurrence control."""
from math import comb


def add(*ps):
    n=max(map(len,ps))
    return [sum(p[i] if i<len(p) else 0 for p in ps) for i in range(n)]


def scale(a,p): return [a*x for x in p]


def mul(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): out[i+j]+=x*y
    return out


def powL(n): return [comb(n,k) for k in range(n+1)]


def B(r): return add(powL(r),[0,1])

def coeff(p,k): return p[k] if 0<=k<len(p) else 0


def deck(rs):
    n=sum(rs)
    factors=[B(r) for r in rs]
    Q=[1]
    for f in factors: Q=mul(Q,f)
    C=mul([1,2],Q)
    # Build the full original-multiplicity deck directly, from each tag branch.
    terms=[]
    for i,r in enumerate(rs):
        H=[1]
        for h,f in enumerate(factors):
            if h!=i: H=mul(H,f)
        for _ in range(r):
            terms.append(mul(mul([1,2],B(r-1)),H))
    E=[0]+powL(n)
    W=add(*terms,scale(n,E))
    return C,W


def main():
    m,N,r=150,300,2
    rs=[2]*m
    C,W=deck(rs)
    Cnew,Wnew=deck(rs+[r])
    E=[0]+powL(N)
    correction=add(scale(r,mul(powL(r),E)),scale(-N,[0]+E))
    rhs=add(mul(B(r),W),scale(r,mul(B(r-1),C)),correction)
    assert Cnew==mul(B(r),C)
    assert Wnew==rhs
    # Direct monomial coefficient formula; the factors are positive, but the
    # correction is a difference, so its two sides must be compared as integers.
    def direct_corr(k):
        pos=r*comb(N+r,k-1) if 0<=k-1<=N+r else 0
        neg=N*comb(N,k-2) if 0<=k-2<=N else 0
        return pos,neg,pos-neg
    at={k:direct_corr(k) for k in (1,4,152)}
    assert at[4]==(9090200,13455000,-4364800)
    assert 1<=4 and 2*4<=N+r+2
    assert 1<=152 and 2*152<=N+r+2
    minor=coeff(Wnew,4)*coeff(Cnew,4)-coeff(Wnew,5)*coeff(Cnew,3)
    assert minor==185586251584170562390
    print({"recurrence_direct_deck_identity":True,
           "new_guard": {"k":4,"one_le_k":True,"2k_le_Nprime_plus2":True,"bound":304},
           "correction_coefficients_k1_k4_k152":{str(k):list(v) for k,v in at.items()},
           "full_weighted_minor_k4":str(minor)})

if __name__=="__main__": main()
