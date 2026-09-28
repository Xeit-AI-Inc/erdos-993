from pathlib import Path
from math import comb
from itertools import product
import json
def mul(a,b):
 o=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):o[i+j]+=x*y
 return o
def choose(n,k):return comb(n,k)if 0<=k<=n else 0
profiles=checks=0
for m in range(6):
 for rs in product(range(4),repeat=m):
  h=[1]
  for r in rs:
   a=[comb(r,k)for k in range(r+1)]
   if r==0:a.append(0)
   a[1]+=1;h=mul(h,a)
  for k in range(sum(rs)+m+2):
   rhs=0
   for mask in range(1<<m):
    d=bin(mask).count("1")
    if d<=k:rhs+=choose(sum(r for i,r in enumerate(rs)if not(mask>>i&1)),k-d)
   assert rhs==(h[k] if k < len(h) else 0),(rs,k,rhs,h)
   checks+=1
  profiles+=1
out={'scope':'Exact finite boundary sanity checks for prospective arbitrary-natural-exponent center-subset identity; not a universal or formal proof','arity_values':[0,1,2,3],'list_lengths':[0,1,2,3,4,5],'profiles':profiles,'coefficient_checks':checks,'r0_specific_case':{'rs':[0,0],'k':2,'coefficient':1,'sum_arities':0,'note':'degree need not equal sum of arities when zero exponents are allowed'},'failures':0}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
