#!/usr/bin/env python3
import json,random,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parent))
from ordinary_tree_copy import prufer_tree,delta,leaf_data
rng=random.Random(20260924)
for n in range(8,61):
  for rep in range(3000):
    T=prufer_tree([rng.randrange(n) for _ in range(n-2)])
    P=T.forest_independence_polynomial(); a=len(P)-1; p=a-2
    x=next(k for k in range(len(P)) if delta(P,k)<0)
    if x+2>p: continue
    nonres=[v for v in T.leaves() if len(T.remove({v}).forest_independence_polynomial())-1==a]
    if not nonres: continue
    selector=[]; terms=[]
    for v in T.leaves():
      if delta(T.remove({v}).forest_independence_polynomial(),p)<0:
        selector.append(v); terms.append(leaf_data(T,v,p))
    row={'n':n,'edges':sorted((u,v) for u in T.vertices for v in T.adjacency[u] if u<v),'alpha':a,'x':x,'p':p,'eligible':True,'leaves':T.leaves(),'nonresidual_leaves':nonres,'selector':selector,'summands':terms,'S':sum(z['g'] for z in terms)}
    Path(__file__).with_name('nonresidual-example.json').write_text(json.dumps(row,indent=2)+'\n')
    print(json.dumps({k:row[k] for k in ('n','alpha','x','p','leaves','nonresidual_leaves','selector','S')})); break
  else: continue
  break
else: print('none')
