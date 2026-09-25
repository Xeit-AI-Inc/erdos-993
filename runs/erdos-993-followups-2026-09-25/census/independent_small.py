#!/usr/bin/env python3
"""Independent Prüfer-code and vertex-subset comparator, orders 0..7."""
from collections import Counter, defaultdict
from itertools import product
import json
from pathlib import Path
import sys


def prufer_tree(n, word):
    adj=[set() for _ in range(n)]
    degree=[1]*n
    for v in word:degree[v]+=1
    for v in word:
        u=next(i for i,d in enumerate(degree) if d==1)
        adj[u].add(v);adj[v].add(u)
        degree[u]-=1;degree[v]-=1
    a,b=(i for i,d in enumerate(degree) if d==1)
    adj[a].add(b);adj[b].add(a)
    return adj


def canon(adj):
    def rooted(u,parent):
        return '('+''.join(sorted(rooted(v,u) for v in adj[u] if v!=parent))+')'
    return min(rooted(u,-1) for u in range(len(adj)))


def subset_poly(adj):
    n=len(adj);counts=[0]*(n+1)
    for mask in range(1<<n):
        if all(not (mask & (1<<u) and mask & (1<<v))
               for u in range(n) for v in adj[u] if u<v):
            counts[mask.bit_count()]+=1
    return counts


def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):c[i+j]+=x*y
    return c


def calculate(maxn=7):
    assert 0<=maxn<=7
    trees={1:{'()':(1,1)}}
    for n in range(2,maxn+1):
        trees[n]={}
        for word in product(range(n),repeat=n-2):
            adj=prufer_tree(n,word)
            code=canon(adj)
            if code not in trees[n]:trees[n][code]=tuple(subset_poly(adj))
    items=[(n,p) for n in range(maxn,0,-1) for _,p in sorted(trees[n].items())]
    rows=defaultdict(lambda:{'classes':0,'x':Counter(),'delta_neg':Counter(),
                             'closure':Counter(),'closure_fail':0})
    def visit(start,n,poly):
        row=rows[n];row['classes']+=1
        co=poly+[0]*max(0,9-len(poly))
        x=next((j for j in range(7) if co[j+1]<co[j]),None)
        xp=next((j for j in range(8) if co[j+1]<(co[j-1] if j else 0)),None)
        row['x'][str(x) if x is not None else '>6']+=1
        for j in range(7):
            if co[j+1]<co[j]:row['delta_neg'][str(j)]+=1
        if x is not None:
            row['closure'][f'{x}->{xp if xp is not None else ">7"}']+=1
            if xp is None or xp>x+1:row['closure_fail']+=1
        for i in range(start,len(items)):
            s,p=items[i]
            if n+s<=maxn:visit(i,n+s,mul(poly,p))
    visit(0,0,[1])
    return {str(n):{'classes':r['classes'],'x':dict(sorted(r['x'].items())),
                    'delta_neg':dict(sorted(r['delta_neg'].items())),
                    'closure':dict(sorted(r['closure'].items())),
                    'closure_fail':r['closure_fail']}
            for n,r in sorted(rows.items())}, {str(n):len(trees[n]) for n in trees}


def main():
    report=json.loads(Path(sys.argv[1]).read_text())
    maxn=min(report['max_order'],7)
    rows,trees=calculate(maxn)
    for n,row in rows.items():
        assert row==report['rows'][n],(n,row,report['rows'][n])
    for n,c in trees.items():
        assert c==report['free_tree_class_counts'][n],(n,c)
    print(json.dumps({'orders_compared':list(range(maxn+1)),
                      'forest_classes_compared':sum(r['classes'] for r in rows.values()),
                      'tree_classes_compared':sum(trees.values()),
                      'all_strata_match':True},sort_keys=True))

if __name__=='__main__':main()
