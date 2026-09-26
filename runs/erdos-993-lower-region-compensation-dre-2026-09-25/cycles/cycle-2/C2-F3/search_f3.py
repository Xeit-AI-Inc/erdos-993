#!/usr/bin/env python3
"""Enumerate rooted branch forests at a distinguished leaf support, shell n=2p+2."""
from functools import lru_cache
import importlib.util, json, sys

ROOT = "/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25"
spec = importlib.util.spec_from_file_location("ordinary_tree_checked", ROOT + "/inputs/ordinary_tree_checked.py")
mod = importlib.util.module_from_spec(spec); sys.modules[spec.name] = mod; spec.loader.exec_module(mod)

# A rooted tree is encoded by the sorted tuple of its rooted child types.
def weight(t): return 1 + sum(weight(c) for c in t)

@lru_cache(None)
def types_of_size(n):
    if n == 1: return ((),)
    pool = []
    for j in range(1, n): pool.extend(types_of_size(j))
    pool.sort(key=lambda t: (weight(t), repr(t)))
    out = []
    def rec(start, remaining, acc):
        if remaining == 0:
            out.append(tuple(acc)); return
        for i in range(start, len(pool)):
            w = weight(pool[i])
            if w > remaining: break
            rec(i, remaining-w, acc+[pool[i]])
    rec(0, n-1, [])
    return tuple(out)

def make_tree(forest):
    edges=[]; next_id=2
    def attach(parent, typ):
        nonlocal next_id
        here=next_id; next_id+=1; edges.append((parent,here))
        for child in typ: attach(here,child)
        return here
    # support 0, distinguished original leaf 1, then rooted components
    edges.append((0,1))
    for typ in forest: attach(0,typ)
    return mod.Graph.from_edges(range(next_id),edges)

rows=[]
for p in range(3,8):
    forests=types_of_size(2*p)
    candidate_count=eligible_count=selected_center=positive_center=positive_sum=trees_with_positive_local=positive_local_count=0
    best=None; eligible_sums=[]
    for f in forests:
        # Count only asymmetric branch products: at least two non-leaf
        # component types and at least two distinct component shapes.
        if len(f)<2 or len(set(f))<2: continue
        candidate_count+=1
        T=make_tree(f); n=len(T.vertices)
        row=mod.aggregate_row(T,p)
        if row["first_strict_descent"] is None or row["first_strict_descent"]+2>p or 3*p>=2*row["alpha"]+1: continue
        eligible_count+=1
        leaf=1
        center_delta=mod.delta(T.remove({leaf}).forest_independence_polynomial(),p)
        positive_entries=[e for e in row["summands"] if e["g"]>0]
        if positive_entries:
            trees_with_positive_local+=1
            positive_local_count+=len(positive_entries)
        if center_delta<0:
            selected_center+=1
            g=next(e["g"] for e in row["summands"] if e["leaf"]==leaf)
            if g>0: positive_center+=1
        S=row["aggregate"]
        eligible_sums.append(S)
        if S>0: positive_sum+=1
        if best is None or S>best["S"]:
            best={"S":S,"forest":repr(f),"alpha":row["alpha"],"x":row["first_strict_descent"],"F":row["favorable_leaves"],"summands":row["summands"],"edges":[[v,u] for v in sorted(T.vertices) for u in sorted(T.adjacency[v]) if v<u]}
    rows.append({"p":p,"n":2*p+2,"asymmetric_rooted_forests":candidate_count,"eligible":eligible_count,"distinguished_leaf_favorable":selected_center,"positive_distinguished_local_term":positive_center,"eligible_trees_with_any_positive_local_term":trees_with_positive_local,"positive_local_term_occurrences":positive_local_count,"positive_complete_sums":positive_sum,"minimum_eligible_S":min(eligible_sums) if eligible_sums else None,"maximum_eligible_S":max(eligible_sums) if eligible_sums else None,"eligible_S_values_sorted":sorted(eligible_sums),"maximum_row":best})
    print("done",p,rows[-1],flush=True)
result={"generator":"rooted unlabeled branch-forest multisets of total size 2p; distinguished support-leaf; exclude branch multisets with fewer than two distinct component shapes or fewer than two branches","rows":rows}
open("search_f3_results.json","w").write(json.dumps(result,indent=2)+"\n")
print(json.dumps(result,indent=2))
