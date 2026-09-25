import random,json
from ordinary_tree import prufer_tree
rng=random.Random(9932402)
for n in range(8,41):
 for j in range(1000):
  t=prufer_tree([rng.randrange(n) for _ in range(n-2)])
  poly=t.forest_independence_polynomial(); a=len(poly)-1
  x=next((k for k in range(len(poly)+1) if (poly[k+1] if k+1<len(poly) else 0)-(poly[k] if k<len(poly) else 0)<0),None)
  p=a-2
  if x is None or x+2>p: continue
  for leaf in t.leaves():
   s=t.support(leaf)
   ms=1+len(t.remove(t.closed_neighborhood({s})).forest_independence_polynomial())-1
   if ms==a:
    rec={'n':n,'sample':j,'edges':sorted([list(sorted((v,u))) for v in t.vertices for u in t.adjacency[v] if v<u]),'alpha':a,'p':p,'x':x,'leaf':leaf,'support':s,'max_size_including_support':ms}
    open('C1-F3-nonresidual-target.json','w').write(json.dumps(rec,indent=2)); print(rec); raise SystemExit
print('none found')
