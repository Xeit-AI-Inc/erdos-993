#!/usr/bin/env python3
"""Exact independent coefficient replay for the self-built T_m family at m=83.

Vertices: root r, marked path r-s-v, and m root-adjacent K_{1,3} branches.
All coefficients and differences are Python integers.
"""
from math import comb
import json


def add(a, b):
    n=max(len(a),len(b)); out=[0]*n
    for i,x in enumerate(a): out[i]+=x
    for i,x in enumerate(b): out[i]+=x
    while len(out)>1 and out[-1]==0: out.pop()
    return out


def scale_shift(a, c=1, shift=0):
    return [0]*shift+[c*x for x in a]


def mul(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): out[i+j]+=x*y
    while len(out)>1 and out[-1]==0: out.pop()
    return out


def power(poly, e):
    out=[1]
    for _ in range(e): out=mul(out,poly)
    return out


def delta(poly,j):
    def coeff(k): return poly[k] if 0<=k<len(poly) else 0
    return coeff(j+1)-coeff(j)

def forest_independence_polynomial(adj, deleted=frozenset()):
    """Generic exact tree-DP, independently evaluating an induced forest."""
    seen=set(deleted)
    total=[1]
    def dfs(u,parent):
        seen.add(u)
        absent=[1]
        chosen=[1]
        for w in sorted(adj[u]):
            if w==parent or w in deleted: continue
            a,c=dfs(w,u)
            absent=mul(absent,add(a,c))
            chosen=mul(chosen,a)
        return absent,scale_shift(chosen,1,1)
    for u in range(len(adj)):
        if u in seen: continue
        a,c=dfs(u,-1)
        total=mul(total,add(a,c))
    return total

m=83
n=3*m
A=[1,1]
B=[1,4,3,1]              # I(K_{1,3})=(1+z)^3+z
C=[1,3,1]                # I(K_{1,2})=(1+z)^2+z
Bm=power(B,m)
Bprev=power(B,m-1)
An=power(A,n)
An1=power(A,n+1)

# Build the graph explicitly for an independent forest-DP check.
# r=0, s=1, marked v=2; each K1,3 branch is center then three leaves.
adj=[set() for _ in range(3+4*m)]
def edge(a,b): adj[a].add(b); adj[b].add(a)
edge(0,1); edge(1,2)
centers=[]; leaves=[]
for j in range(m):
    c=3+4*j; centers.append(c); edge(0,c)
    row=[]
    for ell in range(3):
        v=4+4*j+ell; row.append(v); leaves.append(v); edge(c,v)
    # implicit in the fixed vertex order

# Exact root-conditioned polynomial of the whole tree.
I_T=add(mul([1,2],Bm), scale_shift(An1,1,1))
alpha=3*m+2
p=alpha-2
assert len(I_T)-1==alpha

# First strict descent: scan through alpha, including terminal zero extension.
x=next(j for j in range(alpha+1) if delta(I_T,j)<0)

# One marked path leaf v (support s): H=T-{v,s}, R=T-N[s].
I_H0=add(Bm,scale_shift(An,1,1))
I_R0=Bm
q0=[(I_H0[i] if i<len(I_H0) else 0)-(I_R0[i] if i<len(I_R0) else 0)
    for i in range(max(len(I_H0),len(I_R0)))]
g0=delta(I_H0,p-1)-delta(I_R0,p-1)
I_T_minus_marked=add(mul(A,Bm),scale_shift(An,1,1))
sel0=delta(I_T_minus_marked,p)

# One leaf v of a 3-leaf star (support its center):
# H consists of the pendant path, two now-isolated star leaves, and m-1 stars,
# with root conditioning; R consists of the pendant path and m-1 remaining stars.
I_Hs=add(mul(mul([1,2],power(A,2)),Bprev),scale_shift(power(A,n),1,1))
I_Rs=mul([1,2],Bprev)
qs=[(I_Hs[i] if i<len(I_Hs) else 0)-(I_Rs[i] if i<len(I_Rs) else 0)
    for i in range(max(len(I_Hs),len(I_Rs)))]
gs=delta(I_Hs,p-1)-delta(I_Rs,p-1)
# T-v for a star leaf: root absent leaves P2 times K1,2 times other stars;
# root present contributes root plus all 3m free original leaves (marked v included).
I_T_minus_star=add(mul(mul([1,2],C),Bprev),scale_shift(An,1,1))
sels=delta(I_T_minus_star,p)

S=g0+3*m*gs
expected_g0=n-comb(n,2)
expected_gs=3-n-comb(n,2)
expected_S=-n*(n*n+2*n-9)//2
assert x+2<=p
assert delta(I_T,3*m-2)<0
assert sel0<0 and sels<0
assert g0==expected_g0 and gs==expected_gs and S==expected_S
assert q0[p]-q0[p-1]==g0 and qs[p]-qs[p-1]==gs

# Independent graph-recursion validation of all seven formula polynomials.
I_H0_dp=forest_independence_polynomial(adj,{1,2})
I_R0_dp=forest_independence_polynomial(adj,{0,1,2})
I_Hs_dp=forest_independence_polynomial(adj,{leaves[0],centers[0]})
I_Rs_dp=forest_independence_polynomial(adj,{0,centers[0],*leaves[:3]})
I_Tm0_dp=forest_independence_polynomial(adj,{2})
I_Tms_dp=forest_independence_polynomial(adj,{leaves[0]})
assert forest_independence_polynomial(adj)==I_T
assert I_H0_dp==I_H0 and I_R0_dp==I_R0
assert I_Hs_dp==I_Hs and I_Rs_dp==I_Rs
assert I_Tm0_dp==I_T_minus_marked and I_Tms_dp==I_T_minus_star

result={
    "family":"T_m: root, one marked length-two arm, m root-adjacent K1,3 branches",
    "m":m,"order":4*m+3,"alpha":alpha,"p":p,"first_strict_descent":x,
    "delta_at_3m_minus_2":delta(I_T,3*m-2),
    "marked_leaf_selector_delta_p":sel0,"star_leaf_selector_delta_p":sels,
    "original_leaf_tags":3*m+1,"favorable_original_leaf_tags":3*m+1,
    "marked_leaf_term":g0,"each_star_leaf_term":gs,
    "complete_favorable_sum":S,
    "marked_q_p_minus_q_prev":q0[p]-q0[p-1],
    "star_q_p_minus_q_prev":qs[p]-qs[p-1],
    "checks":{"whole_polynomial_degree_is_alpha":True,"strict_descent_at_3m_minus_2":True,
      "generic_graph_DP_matches_all_closed_form_polynomials":True,
      "target_eligible":True,"all_leaf_tags_favorable":True,"terms_match_q_difference":True,
      "terms_and_sum_match_closed_family_formula":True},
    "limitation":"One exact family instance is corroboration, not a universal proof."
}
print(json.dumps(result,indent=2))
