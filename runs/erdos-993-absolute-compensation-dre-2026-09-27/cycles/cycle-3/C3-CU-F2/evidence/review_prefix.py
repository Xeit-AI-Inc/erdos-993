#!/usr/bin/env python3
"""Second exact scan of the m<=69 contract domain.

Uses direct factor multiplication for Q and exact constant-one formal division
for each cofactor; it does not import or execute the producer evaluator.
"""
import json
from math import comb
from functools import lru_cache

HORIZON = 69

def conv(u, v):
    w = [0] * (len(u) + len(v) - 1)
    for a, x in enumerate(u):
        for b, y in enumerate(v):
            w[a+b] += x*y
    return w

def plus(u, v):
    w = [0] * max(len(u), len(v))
    for i, x in enumerate(u): w[i] += x
    for i, x in enumerate(v): w[i] += x
    return w

def choose_poly(d): return [comb(d,k) for k in range(d+1)]
def shift(u): return [0] + u

def coeff(u,k): return u[k] if 0 <= k < len(u) else 0
def forward(u,k): return coeff(u,k+1)-coeff(u,k)
def binom(n,k): return comb(n,k) if 0 <= k <= n else 0

def B(r): return plus(choose_poly(r), [0,1])
@lru_cache(maxsize=None)
def q_for(counts):
    out=[1]
    for r,c in zip((2,3,4),counts):
        for _ in range(c): out=conv(out,B(r))
    return out

def divide_monic_constant_one(poly, divisor):
    # Formal quotient recurrence; all factors here have constant coefficient 1.
    out=[0]* (len(poly)-len(divisor)+1)
    for k in range(len(out)):
        s=poly[k]
        for i in range(1,min(k,len(divisor)-1)+1): s-=divisor[i]*out[k-i]
        out[k]=s
    assert conv(out,divisor)==poly
    return out

def weighted_deleted(counts, r):
    reduced=list(counts); reduced[r-2]-=1
    h=q_for(tuple(reduced))
    F=[0]
    for d in range(r-1): F=plus(F,choose_poly(d))
    T=conv(conv([1,2],F),h)
    Ai=plus(conv(conv([1,2],B(r-1)),h),shift(choose_poly(sum(i*c for i,c in zip((2,3,4),counts)))))
    return T,Ai

profiles=rows=primary_zero=mass_zero=0
pmin=mmin=None
negp=[]; negm=[]
per_m=[]
for m in range(1,HORIZON+1):
    nr=0
    for c2 in range(m+1):
      for c3 in range(m-c2+1):
        c4=m-c2-c3; counts=(c2,c3,c4); profiles+=1
        N=2*c2+3*c3+4*c4; alpha=N+2; q=N+1
        Q=q_for(counts); C=conv([1,2],Q)
        P=plus(C,shift(choose_poly(q)))
        # First strict descent on the entire zero-extended sequence, through deg(P).
        x=next(k for k in range(len(P)+1) if forward(P,k)<0)
        A0=plus(conv([1,1],Q),shift(choose_poly(N)))
        type_data={}
        for r,c in zip((2,3,4),counts):
            if c: type_data[r]=weighted_deleted(counts,r)
        # Check Q cofactor division and the branch deletion algebra for each type.
        for r,(T,Ai) in type_data.items():
            Hr=divide_monic_constant_one(Q,B(r))
            assert Hr==q_for(tuple(c-(1 if s==r else 0) for s,c in zip((2,3,4),counts)))
        for p in range(len(P)+1):
            if not (x+2<=p and 3*p<2*alpha+1 and 2*p<=alpha): continue
            j=p-2; delta=q-j; Dj=binom(N,j+1)-binom(N,j)
            assert delta>0 and Dj>0
            e0=int(forward(A0,p)<0); b=e0; A=0
            for r,c in zip((2,3,4),counts):
                if not c: continue
                T,Ai=type_data[r]; e=int(forward(Ai,p)<0)
                weight=c*r*e
                b+=weight; A+=weight*coeff(T,j)
            Cj=coeff(C,j); Cj1=coeff(C,j+1)
            primary=(delta*Cj-(delta-1)*Cj1)*A-b*delta*Dj*Cj
            mass=A-b*delta*Dj
            row=(primary,counts,p,x,j,b,A,Dj,Cj,Cj1)
            mrow=(mass,counts,p,x,j,b,A,Dj)
            if pmin is None or primary<pmin[0]: pmin=row
            if mmin is None or mass<mmin[0]: mmin=mrow
            if primary==0: primary_zero+=1
            if mass==0: mass_zero+=1
            if primary<0 and len(negp)<4: negp.append(row)
            if mass<0 and len(negm)<4: negm.append(mrow)
            rows+=1; nr+=1
    per_m.append(nr)
print(json.dumps({'horizon':HORIZON,'profiles':profiles,'eligible_rows':rows,
 'eligible_rows_by_m':per_m,'primary_min':pmin,'mass_min':mmin,
 'primary_zero_rows':primary_zero,'mass_zero_rows':mass_zero,
 'negative_primary':negp,'negative_mass':negm},indent=2))
