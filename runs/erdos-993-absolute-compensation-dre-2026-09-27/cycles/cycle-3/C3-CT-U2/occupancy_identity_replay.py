from pathlib import Path
from fractions import Fraction
from math import comb
import json

def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,u in enumerate(a):
  for k,v in enumerate(b):c[i+k]+=u*v
 return c

rows=[]
for rs in [(2,),(3,),(4,),(2,3),(2,4),(3,4),(2,3,4),(4,4,4)]:
 M=sum(rs);Q=[1];blocks=[];offset=0
 for r in rs:
  f=[comb(r,k) for k in range(r+1)];f[1]+=1;Q=mul(Q,f);blocks.append(((1<<r)-1)<<offset);offset+=r
 sums=[Fraction(0) for _ in range(M+1)]
 for s in range(1<<M):
  weight=Fraction(1)
  for r,mask in zip(rs,blocks):
   if bin(s&mask).count('1')==1:weight*=Fraction(r+1,r)
  sums[bin(s).count('1')]+=weight
 assert all(sums[k]==Q[k] for k in range(M+1))
 for k in range(M+1):
  left=Fraction(Q[k],comb(M,k))**comb(M,k);right=Fraction(1)
  for r in rs:right*=Fraction(r+1,r)**(r*(comb(M-r,k-1) if 0<=k-1<=M-r else 0))
  assert left>=right
 rows.append({'arities':rs,'tip_count':M,'subsets_enumerated':1<<M,'ranks_checked':M+1,'identity':True,'exact_AM_GM_inequality':True})
out={'scope':'finite controller verification of occupancy identity and rational-power Jensen equivalent; not a universal proof award','rows':rows}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print({'profiles':len(rows),'subsets':sum(r['subsets_enumerated'] for r in rows),'ranks':sum(r['ranks_checked'] for r in rows)})
