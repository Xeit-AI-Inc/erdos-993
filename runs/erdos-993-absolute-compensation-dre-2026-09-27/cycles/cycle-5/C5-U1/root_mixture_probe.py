#!/usr/bin/env python3
"""Exact root-mixture minor and actual-rank check for one arity profile."""
import json,sys

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

def delta(a,k):
    return (a[k+1] if k+1<len(a) else 0)-(a[k] if k<len(a) else 0)

counts=tuple(map(int,sys.argv[1:4])) if len(sys.argv)==4 else (0,12,10)
a2,a3,a4=counts; N=2*a2+3*a3+4*a4; m=sum(counts)
L=[1,1];G=[1,2];Q=[1]
for r,a in ((2,a2),(3,a3),(4,a4)):
    B=add(power(L,r),[0,1]);Q=mul(Q,power(B,a))
C=mul(G,Q);d=mul([0,1],power(L,N+1));P=add(C,d)
x=next(k for k in range(len(P)) if delta(P,k)<0)
minor=lambda k: (d[k+1] if k+1<len(d) else 0)*(C[k] if k<len(C) else 0)-(d[k] if k<len(d) else 0)*(C[k+1] if k+1<len(C) else 0)
first_negative=next(({"k":k,"minor":str(minor(k)),"d_k":d[k],"d_k1":d[k+1] if k+1<len(d) else 0,"C_k":C[k],"C_k1":C[k+1] if k+1<len(C) else 0} for k in range(len(C)) if minor(k)<0),None)
if first_negative:
    witness_p=first_negative["k"]+2
    E=mul([0,1],power(L,N));A0=add(mul(L,Q),E)
    flags={"p":witness_p,"Delta_p_A0":delta(A0,witness_p),"e0":int(delta(A0,witness_p)<0),"by_arity":{}}
    for rr,cc in ((2,a2),(3,a3),(4,a4)):
        if not cc: continue
        H=[1]
        for s,nn in ((2,a2),(3,a3),(4,a4)):
            B_s=add(power(L,s),[0,1])
            H=mul(H,power(B_s,nn-(s==rr)))
        Bminus=add(power(L,rr-1),[0,1])
        Ai=add(mul(mul(G,Bminus),H),E)
        flags["by_arity"][str(rr)]={"Delta_p_Ai":delta(Ai,witness_p),"ei":int(delta(Ai,witness_p)<0)}
    first_negative["strict_selectors_at_p_k_plus_2"]=flags
eligible=[]
for p in range(x+2, len(P)):
    if 3*p<2*(N+2)+1 and 2*p<=N+2:
        k=p-2
        eligible.append({"p":p,"j":k,"root_mixture_minor":str(minor(k)),"d_j":d[k],"d_j1":d[k+1] if k+1<len(d) else 0,"C_j":C[k],"C_j1":C[k+1] if k+1<len(C) else 0})
print(json.dumps({"counts":[a2,a3,a4],"m":m,"N":N,"n":N+m+3,"first_strict_descent_x":x,"first_unrestricted_negative_minor":first_negative,"eligible_lower_half_ranks":eligible},indent=2))
