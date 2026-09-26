#!/usr/bin/env python3
"""Exact bounded check: root with c center arms, each center having m_i pendant leaves."""
from functools import lru_cache
import json
from pathlib import Path


def partitions(total, parts, lo=1):
    if parts == 0:
        if total == 0:
            yield ()
        return
    for x in range(lo, total // parts + 1):
        for tail in partitions(total - x, parts - 1, x):
            yield (x,) + tail


def build(ms):
    # vertex 0 is root; then centers; then each center's pendant leaves.
    edges = []
    centers = []
    leaves = []
    v = 1
    for m in ms:
        c = v
        centers.append(c)
        edges.append((0, c))
        v += 1
        arm = list(range(v, v + m))
        leaves.append((c, arm))
        edges.extend((c, w) for w in arm)
        v += m
    return v, edges, centers, leaves


def components_poly(n, edges, deleted=frozenset()):
    adj = [set() for _ in range(n)]
    for u, v in edges:
        if u not in deleted and v not in deleted:
            adj[u].add(v); adj[v].add(u)
    seen = set(deleted)
    polys = []
    for s in range(n):
        if s in seen: continue
        stack = [s]; seen.add(s); vs=[]
        while stack:
            u=stack.pop(); vs.append(u)
            for w in adj[u]:
                if w not in seen: seen.add(w); stack.append(w)
        # tree DP on this component, producing independent polynomial.
        root=vs[0]
        def rec(u, parent):
            a=[1]  # u excluded
            b=[0,1] # u included
            for w in adj[u]-({parent} if parent is not None else set()):
                x,y=rec(w,u)
                a=mul(a,add(x,y)); b=mul(b,x)
            return a,b
        x,y=rec(root,None)
        polys.append(add(x,y))
    out=[1]
    for q in polys: out=mul(out,q)
    return out


def add(a,b):
    z=[0]*max(len(a),len(b))
    for i,x in enumerate(a): z[i]+=x
    for i,x in enumerate(b): z[i]+=x
    return trim(z)

def mul(a,b):
    z=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): z[i+j]+=x*y
    return trim(z)

def trim(a):
    while len(a)>1 and a[-1]==0: a.pop()
    return a

def at(poly,j): return poly[j] if 0<=j<len(poly) else 0

def delta(poly,j): return at(poly,j+1)-at(poly,j)


def analyze(p, ms):
    n, edges, centers, arms=build(ms)
    poly=components_poly(n,edges)
    alpha=len(poly)-1
    ds=[delta(poly,j) for j in range(alpha+2)] # to alpha+1 terminal zero extension
    x=next(j for j,d in enumerate(ds) if d<0)
    eligible=(x+2<=p and 3*p<2*alpha+1)
    leaf_rows=[]
    for c,arm in arms:
        for v in arm:
            pminus=components_poly(n,edges,frozenset((v,)))
            fav=delta(pminus,p)<0
            if fav:
                H=components_poly(n,edges,frozenset((v,c)))
                # N[support] consists of center plus root and all pendant leaves of this arm.
                support_closed={c,0,*arm}
                R=components_poly(n,edges,frozenset(support_closed))
                term=delta(H,p-1)-delta(R,p-1)
                leaf_rows.append({"leaf":v,"support":c,"term":term,
                                  "delta_p_T_minus_leaf":delta(pminus,p),
                                  "H_delta":delta(H,p-1),"R_delta":delta(R,p-1)})
    return {"p":p,"n":n,"branch_leaf_counts":list(ms),"independent_set_count_vector":poly,
            "delta_vector_ranks_0_through_alpha_plus_1":ds,"alpha":alpha,"first_strict_descent_x":x,
            "delta_x":ds[x],"delta_alpha_plus_1":ds[alpha+1],"eligible":eligible,
            "all_favorable_leaves":len(leaf_rows)==sum(ms),"favorable_count":len(leaf_rows),
            "pointwise_positive_count":sum(q['term']>0 for q in leaf_rows),
            "pointwise_max":max([q['term'] for q in leaf_rows],default=None),
            "S":sum(q['term'] for q in leaf_rows),"leaf_rows":leaf_rows}


rows=[]
generation={}
for p in range(10,14):
    n=2*p+4
    generation[str(p)]={"candidate_partitions":0,"x_plus_2_le_p":0,"strict_lower_region":0,"eligible":0}
    for c in range(1,7):
        total=n-1-c
        if total<c: continue
        for ms in partitions(total,c):
            z=analyze(p,ms)
            generation[str(p)]["candidate_partitions"]+=1
            generation[str(p)]["x_plus_2_le_p"]+=int(z["first_strict_descent_x"]+2<=p)
            generation[str(p)]["strict_lower_region"]+=int(3*p<2*z["alpha"]+1)
            if z['eligible']:
                generation[str(p)]["eligible"]+=1
                rows.append(z)

result={"method":"Independent-set polynomial by component tree recursion; explicit complete partition enumeration for the stated family.",
        "family":"A root adjacent to c centers, 1<=c<=6; each center adjacent to m_i>=1 distinct pendant leaves; m_1<=...<=m_c and sum_i m_i=2p+3-c.",
        "p_range":[10,13],"generation_boundary":"All integer partitions of the forced leaf total into c positive parts for each c=1..6 and p=10..13; no other tree shapes included.",
        "candidate_counts_by_p":generation,"eligible_rows":len(rows),"rows":rows,
        "positive_pointwise_rows":[{"p":r['p'],"branch_leaf_counts":r['branch_leaf_counts'],"leaf":q['leaf'],"support":q['support'],"term":q['term']} for r in rows for q in r['leaf_rows'] if q['term']>0],
        "positive_full_aggregate_rows":[{"p":r['p'],"branch_leaf_counts":r['branch_leaf_counts'],"S":r['S']} for r in rows if r['S']>0]}
Path(__file__).with_name('low_cover_family.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k not in ('rows','positive_pointwise_rows')},indent=2))
