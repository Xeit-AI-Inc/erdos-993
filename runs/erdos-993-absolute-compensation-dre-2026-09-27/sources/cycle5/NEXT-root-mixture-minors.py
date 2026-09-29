from math import comb
from pathlib import Path
import json

def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c

def at(a,k):return a[k] if 0<=k<len(a) else 0
rows=[]
for r in [2,3,4]:
 for m in [1,2,3,5,10,38,120,172]:
  N=r*m;B=[comb(r,k)+(k==1) for k in range(r+1)];C=[1,2]
  for _ in range(m):C=mul(C,B)
  d=[0]+[comb(N+1,k) for k in range(N+2)]
  first=None
  for k in range(N+2):
   gap=at(d,k+1)*at(C,k)-at(d,k)*at(C,k+1)
   if gap<0:
    first={'k':k,'gap':str(gap),'d_k':str(at(d,k)),'d_k1':str(at(d,k+1)),'C_k':str(at(C,k)),'C_k1':str(at(C,k+1))};break
  rows.append({'r':r,'m':m,'N':N,'n':N+m+3,'first_negative_root_mixture_minor':first})
out={'scope':'Private test of a possible proof shortcut, not the primary or a selector assertion. d=z(1+z)^(N+1),C=(1+2z)B_r^m. The minor tests whether d/C, equivalently root-inclusion mixture weight d/(C+d), is nondecreasing over ALL coefficient ranks. No minimality claim.','rows':rows}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps([x for x in rows if x['first_negative_root_mixture_minor']][:3]))
