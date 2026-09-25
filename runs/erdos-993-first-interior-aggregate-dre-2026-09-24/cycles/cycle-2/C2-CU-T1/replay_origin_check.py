#!/usr/bin/env python3
"""Exact finite checks for the bipartite tagged-shadow inequality; no imports from controls."""
from itertools import combinations
import json


def indep_masks(n, edges):
    adj = [0] * n
    for u, v in edges:
        adj[u] |= 1 << v
        adj[v] |= 1 << u
    out = []
    for mask in range(1 << n):
        if all(not (mask & (1 << u)) or not (mask & adj[u]) for u in range(n)):
            out.append(mask)
    return out


def counts(n, edges, W):
    ind = indep_masks(n, edges)
    a = max(m.bit_count() for m in ind)
    q = [0] * (a + 2)
    for m in ind:
        if m & W:
            q[m.bit_count()] += 1
    witnesses = []
    for k in range(1, a + 1):
        lhs, rhs = k * q[k + 1], 2 * (a-k) * q[k]
        if lhs > rhs:
            raise AssertionError((n, edges, W, a, k, q, lhs, rhs))
        if lhs == rhs and lhs > 0:
            witnesses.append({"k":k,"qk":q[k],"qk1":q[k+1],"both_sides":lhs})
    return a, q, witnesses


def exhaustive_small():
    graphs = 0
    tagged_instances = 0
    positive_equalities = []
    max_order = 6
    for l in range(1, 4):
        for r in range(1, 4):
            n = l+r
            possible = [(i,l+j) for i in range(l) for j in range(r)]
            for ecode in range(1 << len(possible)):
                edges = [e for i,e in enumerate(possible) if (ecode >> i) & 1]
                graphs += 1
                all_w = (1 << n)-1
                candidates = {all_w, (1 << l)-1, ((1 << n)-1)^((1 << l)-1)}
                candidates.update(1 << v for v in range(n))
                candidates.add(0)
                for W in candidates:
                    tagged_instances += 1
                    a,q,eqs=counts(n,edges,W)
                    for e in eqs:
                        positive_equalities.append({"n":n,"left":l,"right":r,"edge_code":ecode,"W_mask":W,"alpha":a,**e})
    return {"all_bipartite_labeled_graphs_partitions_1_to_3":graphs,
            "tag_sets_per_graph": "empty, full, each side, and each singleton (duplicates removed)",
            "graph_tag_instances":tagged_instances,
            "max_order":max_order,
            "positive_equality_examples":positive_equalities[:12],
            "positive_equality_count":len(positive_equalities)}


def complete_bipartite_tagged_by_side(l, r, tag_left=True):
    # K_{l,r}; every nonempty independent set lies wholly in one side (or is empty).
    # W is the entire selected side, so q_j=C(side,j) for j>=1.
    import math
    a=max(l,r)
    side=l if tag_left else r
    q=[0]*(a+2)
    for j in range(1,min(side,a)+1):
        q[j]=math.comb(side,j)
    # W-tagged max sets can still be counted; for chosen sizes here this is exact.
    checks=[]
    for k in range(1,a+1):
        lhs=k*q[k+1]
        rhs=2*(a-k)*q[k]
        assert lhs<=rhs,(l,r,tag_left,k,lhs,rhs,q)
        checks.append({"k":k,"qk":q[k],"qk1":q[k+1],"lhs":lhs,"rhs":rhs,"slack":rhs-lhs})
    return {"graph":"K_%d,%d"%(l,r),"order":l+r,"alpha":a,"W_side":"left" if tag_left else "right","checks":checks}


if __name__ == '__main__':
    result={"small_exact":exhaustive_small(),
            "larger_complete_bipartite":complete_bipartite_tagged_by_side(11,13,True),
            "larger_complete_bipartite_right_tag":complete_bipartite_tagged_by_side(11,13,False)}
    print(json.dumps(result,sort_keys=True,indent=2))
