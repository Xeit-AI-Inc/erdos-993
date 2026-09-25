#!/usr/bin/env python3
"""Independent exact DP checks for a fresh boundary-spine tree family."""
from itertools import combinations
import json


def tree(m):
    n = 4 + 2*m
    edges = [(0,1),(1,2),(2,3)]
    for j in range(m):
        a,b=4+2*j,5+2*j
        edges.extend(((3,a),(a,b)))
    return n, edges


def poly(vertices, edges):
    adj={v:set() for v in vertices}
    for u,v in edges:
        adj[u].add(v); adj[v].add(u)
    seen=set()
    def mul(a,b):
        z=[0]*(len(a)+len(b)-1)
        for i,x in enumerate(a):
            for j,y in enumerate(b): z[i+j]+=x*y
        return z
    def add(a,b):
        z=[0]*max(len(a),len(b))
        for i,x in enumerate(a): z[i]+=x
        for i,x in enumerate(b): z[i]+=x
        return z
    def visit(v,parent):
        seen.add(v); ex=[1]; inc=[0,1]
        for w in sorted(adj[v]):
            if w==parent: continue
            e,i=visit(w,v)
            ex=mul(ex,add(e,i)); inc=mul(inc,e)
        return ex,inc
    out=[1]
    for v in sorted(vertices):
        if v not in seen:
            e,i=visit(v,None); out=mul(out,add(e,i))
    return out

def coeff(P,k): return P[k] if 0<=k<len(P) else 0
def delta(P,k): return coeff(P,k+1)-coeff(P,k)
def xfirst(P):
    return next(k for k in range(len(P)) if delta(P,k)<0)
def remove_poly(n,edges,rm):
    vs=set(range(n))-set(rm)
    es=[(u,v) for u,v in edges if u in vs and v in vs]
    return poly(vs,es)
def row(m):
    n,edges=tree(m); P=poly(set(range(n)),edges); a=len(P)-1; p=a-2; x=xfirst(P)
    adj={v:set() for v in range(n)}
    for u,v in edges: adj[u].add(v); adj[v].add(u)
    leaves=sorted(v for v in range(n) if len(adj[v])==1)
    summands=[]; favorable=[]
    for v in leaves:
        pv=remove_poly(n,edges,{v})
        if delta(pv,p)>=0: continue
        favorable.append(v); s=next(iter(adj[v])); W=adj[s]-{v}
        H=remove_poly(n,edges,{v,s}); R=remove_poly(n,edges,{s}|adj[s])
        q=lambda k: coeff(H,k)-coeff(R,k)
        summands.append({"leaf":v,"support":s,"W":sorted(W),"q_p":q(p),"q_pminus1":q(p-1),"sum_term":q(p)-q(p-1)})
    return {"m":m,"n":n,"alpha":a,"p":p,"x":x,"eligible":x+2<=p,"3p_ge_2alpha_plus_1":3*p>=2*a+1,"poly":P,"leaves":leaves,"favorable":favorable,"summands":summands,"complete_sum":sum(z["sum_term"] for z in summands)}

if __name__=='__main__':
    # m=11 is a fresh, larger, eligible example; m=4 and m=5 check the
    # sharp low-alpha boundary of the local coefficient argument.
    print(json.dumps([row(m) for m in (4,5,11)],indent=2))
