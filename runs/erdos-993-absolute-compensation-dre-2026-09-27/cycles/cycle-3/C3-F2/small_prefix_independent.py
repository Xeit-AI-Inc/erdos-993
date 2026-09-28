#!/usr/bin/env python3
"""Independent exact evaluator for contract path-star profiles m=1..69."""
from itertools import product
import json,sys
from math import comb

M=69

def add(a,b):
    n=max(len(a),len(b)); out=[0]*n
    for i,x in enumerate(a): out[i]+=x
    for i,x in enumerate(b): out[i]+=x
    return out

def mul(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): out[i+j]+=x*y
    return out

def shift(a): return [0]+a

def delta(a,k):
    # Integer zero extension, including terminal and later differences.
    return (a[k+1] if k+1<len(a) else 0)-(a[k] if k<len(a) else 0)

B={r:add([comb(r,k) for k in range(r+1)],[0,1]) for r in (1,2,3,4)}
# Cache products by count vector using the literal B_r factors.
qcache={(0,0,0):[1]}
def Q(cnt):
    if cnt not in qcache:
        prev=list(cnt); r=next(i+2 for i,n in enumerate(cnt) if n)
        prev[r-2]-=1
        qcache[cnt]=mul(Q(tuple(prev)),B[r])
    return qcache[cnt]

def binom(n,k): return comb(n,k) if 0<=k<=n else 0

profiles=rows=0
primary_min=None; mass_min=None; ratio_min=None
first_bad_primary=[]; first_bad_mass=[]
counts_by_m=[]
for m in range(1,M+1):
    mrows=0
    for a in range(m+1):
      for b in range(m-a+1):
        c=m-a-b; cnt=(a,b,c); profiles+=1
        N=2*a+3*b+4*c; alpha=N+2; q=N+1
        Qv=Q(cnt); C=mul([1,2],Qv)
        # P=C+z(1+z)^q
        P=add(C,[0]+[comb(q,k) for k in range(q+1)])
        # first strict descent, checking every coefficient index through deg(P), terminal included
        x=next(k for k in range(len(P)+1) if delta(P,k)<0)
        # A0=(1+z)Q+z(1+z)^N
        A0=add(mul([1,1],Qv),[0]+[comb(N,k) for k in range(N+1)])
        arity_data=[]
        for r in (2,3,4):
            if cnt[r-2]==0:
                arity_data.append(None); continue
            hc=list(cnt); hc[r-2]-=1; H=Q(tuple(hc))
            # F_r=1+L+...+L^(r-2)
            F=[0]
            for h in range(r-1): F=add(F,[comb(h,k) for k in range(h+1)])
            T=mul(mul([1,2],F),H)
            Ai=add(mul(mul([1,2],B[r-1]),H),[0]+[comb(N,k) for k in range(N+1)])
            arity_data.append((T,Ai))
        for p in range(len(P)+1):
            if not (x+2<=p and 3*p<2*alpha+1 and 2*p<=alpha): continue
            j=p-2; delta_rank=q-j
            Dj=binom(N,j+1)-binom(N,j)
            if not (delta_rank>0 and Dj>0): raise AssertionError((cnt,p,x,Dj,delta_rank))
            e0=int(delta(A0,p)<0); A=0; btot=e0
            for r,item in zip((2,3,4),arity_data):
                if item is None: continue
                T,Ai=item; ei=int(delta(Ai,p)<0)
                mult=cnt[r-2]*r*ei; btot+=mult; A+=mult*(T[j] if j<len(T) else 0)
            Cj=C[j] if j<len(C) else 0; Cj1=C[j+1] if j+1<len(C) else 0
            pm=(delta_rank*Cj-(delta_rank-1)*Cj1)*A-btot*delta_rank*Dj*Cj
            mm=A-btot*delta_rank*Dj
            rows+=1; mrows+=1
            if primary_min is None or pm<primary_min[0]: primary_min=(pm,cnt,p,x,j,btot,A,Dj,Cj,Cj1)
            if mass_min is None or mm<mass_min[0]: mass_min=(mm,cnt,p,x,j,btot,A,Dj)
            if pm<0 and len(first_bad_primary)<4:first_bad_primary.append((pm,cnt,p,x,j,btot,A,Dj,Cj,Cj1))
            if mm<0 and len(first_bad_mass)<4:first_bad_mass.append((mm,cnt,p,x,j,btot,A,Dj))
    counts_by_m.append(mrows)
    if m%10==0: print('progress',m,profiles,rows,file=sys.stderr,flush=True)
print(json.dumps({
 'max_branches':M,'profiles':profiles,'eligible_rows':rows,
 'eligible_rows_by_m':counts_by_m,
 'primary_min':primary_min,'mass_min':mass_min,
 'primary_negative_witnesses':first_bad_primary,'mass_negative_witnesses':first_bad_mass,
 'qcache_states':len(qcache)
},indent=2))
