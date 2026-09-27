#!/usr/bin/env python3
"""Exact bounded selected-MASS check; corrected per-order row telemetry.

Run with Python 3.11+: python3 mass_profile_scan.py
All arithmetic and strict selectors match the reviewed C5 recurrence.
"""
from __future__ import annotations
import json
from math import comb
from pathlib import Path

OUT = Path(__file__).with_name('mass_profile_scan.json')
MAX_M = 80
B = {2:[1,3,1], 3:[1,4,3,1], 4:[1,5,6,4,1]}
# B_{r-1} needed for one actual tip deletion
BM = {2:[1,2], 3:[1,3,1], 4:[1,4,3,1]}
G = [1,2]
L = [1,1]

def mul_small(a, b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        if x:
            for k,y in enumerate(b): out[i+k]+=x*y
    while len(out)>1 and out[-1]==0: out.pop()
    return out

def add(*seqs):
    out=[0]*max(map(len,seqs))
    for s in seqs:
        for i,x in enumerate(s): out[i]+=x
    while len(out)>1 and out[-1]==0: out.pop()
    return out

def shifted_binomial(n, shift=1):
    out=[0]*(n+2)
    for k in range(n+1): out[k+shift]=comb(n,k)
    return out

def coeff(a,k): return a[k] if 0<=k<len(a) else 0
def delta(a,k): return coeff(a,k+1)-coeff(a,k)
def first_descent(a):
    for k in range(len(a)):
        if delta(a,k)<0: return k
    return None

def keycounts(a2,a3,a4): return (a2,a3,a4)

# Q profiles are built one branch at a time, holding two adjacent m-layers.
prev={(0,0,0):[1]}
profiles=0; rows=0; flagged_rows=0; mass_failures=[]; minrec=None
per_m=[]
for m in range(1,MAX_M+1):
    cur={}
    rowprof=0
    for a2 in range(m+1):
      for a3 in range(m-a2+1):
        a4=m-a2-a3
        counts=(a2,a3,a4)
        # Canonically remove a 4, else 3, else 2 branch.
        if a4: parent=(a2,a3,a4-1); r=4
        elif a3: parent=(a2,a3-1,0); r=3
        else: parent=(a2-1,0,0); r=2
        qpoly=mul_small(prev[parent],B[r]); cur[counts]=qpoly
        N=2*a2+3*a3+4*a4; alpha=N+2; q=N+1
        C=mul_small(qpoly,G)
        P=add(C,shifted_binomial(q))
        x=first_descent(P)
        if x is None: continue
        pmin=x+2
        pmax=min((2*alpha)//4, (2*alpha)//3) # replaced below by exact guards
        # The lower-half bound is 2p<=alpha. The other strict bound is 3p<2alpha+1.
        pmax=alpha//2
        if pmax < pmin: continue
        # Every integer in this closed interval obeys 3p<2alpha+1 automatically;
        # retain explicit check to mirror the contract.
        for p in range(pmin,pmax+1):
            if not (x+2<=p and 3*p<2*alpha+1 and 2*p<=alpha): continue
            j=p-2; d=q-j
            A0=add(mul_small(qpoly,L),shifted_binomial(N))
            e0=int(delta(A0,p)<0)
            ei_by_r={}; T_by_r={}
            for rr,ct in ((2,a2),(3,a3),(4,a4)):
                if ct==0: ei_by_r[rr]=0; T_by_r[rr]=[]; continue
                hcounts=(a2-(rr==2),a3-(rr==3),a4-(rr==4))
                hpoly=prev[hcounts]
                # A_i=G B_(r-1) H_i + z L^N, with exact formula.
                Ai=add(mul_small(mul_small(hpoly,BM[rr]),G),shifted_binomial(N))
                ei_by_r[rr]=int(delta(Ai,p)<0)
                F=[sum(comb(t,k) for t in range(rr-1) if t>=k) for k in range(rr-1)]
                # F_r=sum_{h=0}^{r-2} L^h; explicit convolution by short sum.
                F=[0]*(rr-1)
                for h in range(rr-1):
                    for k in range(h+1): F[k]+=comb(h,k)
                T_by_r[rr]=mul_small(mul_small(hpoly,F),G)
            b=e0+sum(rr*ct*ei_by_r[rr] for rr,ct in ((2,a2),(3,a3),(4,a4)))
            lhs=sum(rr*ct*ei_by_r[rr]*coeff(T_by_r[rr],j) for rr,ct in ((2,a2),(3,a3),(4,a4)))
            binomdiff=comb(N,j+1)-comb(N,j) if 0<=j<=N else 0
            rhs=b*d*binomdiff
            slack=lhs-rhs
            rows+=1; rowprof+=1
            if b: flagged_rows+=1
            record={"counts":{"a2":a2,"a3":a3,"a4":a4},"m":m,"N":N,"alpha":alpha,"x":x,"p":p,"j":j,"delta":d,"flags":{"e0":e0,"e2":ei_by_r[2],"e3":ei_by_r[3],"e4":ei_by_r[4]},"selected_tag_count":b,"lhs":lhs,"binomial_difference":binomdiff,"rhs":rhs,"slack":slack}
            if slack<0: mass_failures.append(record)
            if minrec is None or (slack, N, m, a2, a3, a4, p)<(minrec['slack'],minrec['N'],minrec['m'],minrec['counts']['a2'],minrec['counts']['a3'],minrec['counts']['a4'],minrec['p']): minrec=record
        profiles+=1
        # candidate graph-polynomial consistency is inherent in formula; parent loop all types.
    per_m.append({"m":m,"count_profiles":len(cur),"lower_half_rows":rowprof})
    prev=cur

out={"method":"exact integer count-profile recurrence; C=GQ, P=C+zL^(N+1); deletion polynomials and each current-p strict selector evaluated directly from the stated formulas","max_m":MAX_M,"profiles_total":sum(t["count_profiles"] for t in per_m),"eligible_profiles":profiles,"lower_half_eligible_rows":rows,"rows_with_at_least_one_selected_tag":flagged_rows,"mass_failure_count":len(mass_failures),"first_failure":mass_failures[0] if mass_failures else None,"minimum_slack_row":minrec,"per_m":per_m}
OUT.write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='per_m'},indent=2,sort_keys=True))
