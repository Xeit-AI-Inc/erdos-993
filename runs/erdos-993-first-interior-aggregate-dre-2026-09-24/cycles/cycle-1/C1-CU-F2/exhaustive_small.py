#!/usr/bin/env python3
"""Exhaust all labelled Prüfer trees through order 7; bounded evidence only."""
from __future__ import annotations
import itertools,json,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parent))
from ordinary_tree_copy import prufer_tree,delta,leaf_data
out=[]
for n in range(1,8):
 counts={'labeled_trees':0,'eligible':0,'positive_aggregate':0,'positive_summand_rows':0,'residual_eligible':0,'nonresidual_eligible':0}
 witness=None
 if n==1:
  seqs=[()]
 else: seqs=itertools.product(range(n),repeat=n-2)
 for seq in seqs:
  T=prufer_tree(seq); counts['labeled_trees']+=1
  P=T.forest_independence_polynomial(); alpha=len(P)-1; p=alpha-2
  x=next(k for k in range(len(P)+1) if delta(P,k)<0)
  if p<0 or x+2>p:continue
  counts['eligible']+=1
  nonres=any(len(T.remove({v}).forest_independence_polynomial())-1==alpha for v in T.leaves())
  counts['nonresidual_eligible' if nonres else 'residual_eligible']+=1
  terms=[]; selector=[]
  for v in T.leaves():
   if delta(T.remove({v}).forest_independence_polynomial(),p)<0:
    selector.append(v);terms.append(leaf_data(T,v,p))
  S=sum(t['g'] for t in terms)
  if S>0:
   counts['positive_aggregate']+=1
   if witness is None:witness={'edges':sorted((u,v) for u in T.vertices for v in T.adjacency[u] if u<v),'alpha':alpha,'x':x,'p':p,'selector':selector,'summands':terms,'S':S}
  if any(t['g']>0 for t in terms):counts['positive_summand_rows']+=1
 out.append({'n':n,**counts,'first_positive':witness})
Path(__file__).with_name('exhaustive-small-summary.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
