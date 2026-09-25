#!/usr/bin/env python3
"""Seeded non-exhaustive Prüfer search for an exact-rank counterexample or local sign failure."""
from __future__ import annotations
import json, random, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from ordinary_tree_copy import Graph, prufer_tree, leaf_data, delta

def x_contract(poly):
    for k in range(len(poly)):
        if delta(poly,k)<0:return k
    raise AssertionError

rng=random.Random(99320260924)
counts={'samples':0,'eligible':0,'positive_aggregate':0,'positive_summand_rows':0}
first_ce=None; first_local=None; eligible_examples=[]
for n in range(8,46):
    for rep in range(120):
        t=prufer_tree([rng.randrange(n) for _ in range(n-2)])
        poly=t.forest_independence_polynomial(); alpha=len(poly)-1; p=alpha-2; x=x_contract(poly)
        counts['samples']+=1
        if p<0 or x+2>p: continue
        counts['eligible']+=1
        leaves=t.leaves(); selector=[]; summands=[]
        for v in leaves:
            pv=t.remove({v}).forest_independence_polynomial()
            if delta(pv,p)<0:
                selector.append(v); summands.append(leaf_data(t,v,p))
        S=sum(z['g'] for z in summands)
        row={'n':n,'edges':sorted((v,w) for v in t.vertices for w in t.adjacency[v] if v<w),
             'alpha':alpha,'x':x,'p':p,'eligible':True,'selector':selector,
             'summands':summands,'S':S}
        if len(eligible_examples)<5: eligible_examples.append(row)
        if S>0:
            counts['positive_aggregate']+=1
            if first_ce is None:first_ce=row
        if any(z['g']>0 for z in summands):
            counts['positive_summand_rows']+=1
            if first_local is None:first_local=row
Path(__file__).with_name('random-search-summary.json').write_text(json.dumps({'seed':99320260924,'counts':counts,'first_counterexample':first_ce,'first_positive_summand':first_local,'eligible_examples':eligible_examples},indent=2)+'\n')
print(json.dumps({k:v for k,v in counts.items()}))
print('counterexample', None if first_ce is None else (first_ce['n'],first_ce['alpha'],first_ce['x'],first_ce['p'],first_ce['S']))
print('positive summand', None if first_local is None else (first_local['n'],first_local['alpha'],first_local['x'],first_local['p'],first_local['S'],[(s['leaf'],s['g']) for s in first_local['summands'] if s['g']>0]))
