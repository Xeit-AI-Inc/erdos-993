#!/usr/bin/env python3
"""Independent exact audit of guarded shifted C/deletion comparisons.
All polynomials are low-to-high Python-integer coefficient arrays with zero extension.
"""
import json
from pathlib import Path


def add(a,b):
    c=[0]*max(len(a),len(b))
    for i,x in enumerate(a): c[i]+=x
    for i,x in enumerate(b): c[i]+=x
    return trim(c)

def trim(a):
    while len(a)>1 and a[-1]==0: a.pop()
    return a

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return trim(c)

def power(a,n):
    o=[1]
    for _ in range(n): o=mul(o,a)
    return o

def coeff(a,k): return a[k] if 0<=k<len(a) else 0

def delta(a,k): return coeff(a,k+1)-coeff(a,k)

def polynomials(counts):
    rs=[2]*counts[0]+[3]*counts[1]+[4]*counts[2]
    N=sum(rs); L=[1,1]; G=[1,2]
    Bs={r:add(power(L,r),[0,1]) for r in (1,2,3,4)}
    Q=[1]
    for r in rs: Q=mul(Q,Bs[r])
    C=mul(G,Q)
    P=add(C,[0]+power(L,N+1))
    A0=add(mul(L,Q),[0]+power(L,N))
    counts_by_r={r:rs.count(r) for r in set(rs)}
    As={}
    for r in set(rs):
        # H removes exactly one factor of this arity.
        H=[1]
        removed=False
        for s in rs:
            if s==r and not removed: removed=True
            else: H=mul(H,Bs[s])
        As[r]=add(mul(mul(G,Bs[r-1]),H),[0]+power(L,N))
    W=[0]
    for r,A in As.items(): W=add(W,[counts_by_r[r]*r*x for x in A])
    return rs,N,P,C,A0,As,W

def tree_poly(counts,deleted=None):
    """Independent-set polynomial by tree DP on explicitly built path-star graph."""
    rs=[2]*counts[0]+[3]*counts[1]+[4]*counts[2]
    adj={0:[],1:[2],2:[1]}; adj[0].append(1)
    v=3
    for r in rs:
        c=v; v+=1
        adj.setdefault(c,[]).append(0); adj[0].append(c)
        for _ in range(r):
            t=v; v+=1; adj[c].append(t); adj[t]=[c]
        adj.setdefault(c,[])
    if deleted is not None:
        # vertices are retained by graph construction; deletion simply isolates then omits it
        adj.pop(deleted)
        for u in list(adj): adj[u]=[w for w in adj[u] if w!=deleted]
    seen=set()
    def dfs(u,parent):
        seen.add(u); absent=[1]; present=[0,1]
        for w in adj[u]:
            if w==parent: continue
            a,b=dfs(w,u)
            absent=mul(absent,add(a,b))
            present=mul(present,a)
        if u==deleted: return add(absent,present),[0]
        return absent,present
    a,b=dfs(0,-1)
    return add(a,b)

def first_descent(P):
    return next(k for k in range(len(P)) if delta(P,k)<0)

def audit(counts,literal=False):
    rs,N,P,C,A0,As,W=polynomials(counts)
    x=first_descent(P)
    maxk=(N+2)//2
    bad_i=[]; min_i=(0,None)
    bad_w=[]; min_w=(0,None)
    for k in range(1,maxk+1):
        deletion_types=[("endpoint",A0)]+[(str(r),A) for r,A in As.items()]
        for label,A in deletion_types:
            gap=coeff(A,k+1)*coeff(C,k-1)-coeff(A,k)*coeff(C,k)
            if gap>0: bad_i.append((label,k,gap))
            if gap<min_i[0]: min_i=(gap,(label,k))
        gap=coeff(W,k+1)*coeff(C,k-1)-coeff(W,k)*coeff(C,k)
        if gap>0: bad_w.append((k,gap))
        if gap<min_w[0]: min_w=(gap,k)
    # Test registered unguarded witness identity (if matching profile)
    out={"counts":counts,"m":len(rs),"n":N+len(rs)+3,"N":N,"x":x,"guard_k_max":maxk,
         "individual_guard_ranks_tested":maxk*(1+len(As)),"individual_guarded_failures":len(bad_i),
         "individual_first_failure":bad_i[0] if bad_i else None,
         "weighted_guard_ranks_tested":maxk,"weighted_guarded_failures":len(bad_w),
         "weighted_first_failure":bad_w[0] if bad_w else None,
         "x_difference_sign":"negative" if delta(P,x)<0 else "nonnegative",
         "terminal_difference":delta(P,len(P)-1)}
    # Actual-p eligibility and selectors (check p=x+2 when lower-half guards hold)
    p=x+2; j=p-2
    out["p_x_plus_2"]=p
    out["p_guards"]={"x_plus2_le_p":x+2<=p,"three_p_lt_two_alpha_plus1":3*p<2*(N+2)+1,
                      "two_p_le_alpha":2*p<=N+2}
    if all(out["p_guards"].values()):
        selected={r:delta(A,p)<0 for r,A in As.items()}
        out["selectors_at_p"]={"endpoint":delta(A0,p)<0,"branch_types":[[r,selected[r]] for r in sorted(selected)],
                                 "selected_tip_multiplicity":sum(rs.count(r)*r for r,e in selected.items() if e)}
    if literal:
        vertex_to_check=2
        A0lit=tree_poly(counts,vertex_to_check)
        tip_vertex=3+1 # first tip after branch center
        Ailit=tree_poly(counts,tip_vertex)
        Plit=tree_poly(counts)
        out["literal_checks"]={"P_matches":Plit==P,"A0_matches":A0lit==A0,
                               "first_tip_matches":Ailit==As[rs[0]],
                               "P_degree":len(Plit)-1,"A0_degree":len(A0lit)-1,
                               "first_tip_degree":len(Ailit)-1}
        # Fixed witness numerical particulars.
        if counts==[38,0,1]:
            k=77; A=As[rs[-1]]; out["witness_row"]={"k":k,"Ck":coeff(C,k),"Ckm1":coeff(C,k-1),
                "Ak":coeff(A,k),"Ak1":coeff(A,k+1),"signed_margin":coeff(A,k+1)*coeff(C,k-1)-coeff(A,k)*coeff(C,k),
                "guard_2k_le_Nplus2":2*k<=N+2}
    return out

profiles=[[1,0,0],[0,1,0],[0,0,1],[1,1,1],[38,0,1],[0,0,500],[500,0,0],[0,500,0],[1,0,499],[0,1,499],[499,0,1],[0,499,1]]
rows=[]
for c in profiles: rows.append(audit(c,literal=(c==[38,0,1])))
print(json.dumps(rows,indent=2))
