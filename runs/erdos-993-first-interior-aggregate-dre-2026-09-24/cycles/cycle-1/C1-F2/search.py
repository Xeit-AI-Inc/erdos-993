#!/usr/bin/env python3
"""Cycle 1 C1-F2 bounded exact search; all output is integer arithmetic."""
from __future__ import annotations
import json
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from ordinary_tree_copy import t_family, leaf_data, delta

def x_contract(poly):
    for k in range(len(poly)):
        if delta(poly, k) < 0:
            return k
    raise AssertionError('terminal zero extension must descend')

def run_family(m):
    tree, marked = t_family(m)
    poly=tree.forest_independence_polynomial()
    alpha=len(poly)-1
    p=alpha-2
    x=x_contract(poly)
    favor_mark = delta(tree.remove({marked}).forest_independence_polynomial(),p)<0
    # For m>=1, the representative first branch has vertices 3 (center), 4,5,6 leaves.
    branch_leaf=4
    favor_branch=delta(tree.remove({branch_leaf}).forest_independence_polynomial(),p)<0
    vals=[]
    if favor_mark:
        vals.append(leaf_data(tree,marked,p)['g'])
    if favor_branch:
        vals.append(3*m*leaf_data(tree,branch_leaf,p)['g'])
    edges=sorted((v,w) for v in tree.vertices for w in tree.adjacency[v] if v<w)
    return {'order':len(tree.vertices),'alpha':alpha,'rank':p,'x_contract':x,'eligible':x+2<=p,
            'favorable_count':(1 if favor_mark else 0)+(3*m if favor_branch else 0),
            'aggregate':sum(vals),'marked_favorable':favor_mark,'marked_g':leaf_data(tree,marked,p)['g'],
            'branch_favorable':favor_branch,'branch_leaf_g':leaf_data(tree,branch_leaf,p)['g'],
            'edges':edges}

if __name__ == '__main__':
    out=[]
    for m in range(1,61):
        row=run_family(m)
        out.append({k:row[k] for k in ('order','rank','alpha','x_contract','eligible','favorable_count','aggregate')})
        if m in (1,2,3,5,10,22,60):
            Path(__file__).with_name(f't{m}-row.json').write_text(json.dumps(row,indent=2)+'\n')
    print(json.dumps(out,indent=2))
