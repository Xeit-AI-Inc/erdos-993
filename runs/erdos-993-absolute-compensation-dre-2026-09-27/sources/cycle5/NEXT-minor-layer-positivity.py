from math import comb
from pathlib import Path
import json

def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c

def at(a,k):return a[k] if 0<=k<len(a) else 0

def B(r):return [comb(r,t)+(t==1) for t in range(r+1)]
rows=[]
for r in [2,3,4]:
 for m in range(1,23):
  N=r*m; Cl=[];Ul=[];E=[0]+[comb(N,t)for t in range(N+1)]
  for a in range(m):
   V=[0]*a+[comb(m-1,a)*x for x in mul([1,2],[comb(r*(m-1-a),t)for t in range(r*(m-1-a)+1)])]
   Cl.append(mul(B(r),V));Ul.append(mul(B(r-1),V))
  bad=None
  for k in range(1,(N+2)//2+1):
   for d in range(2*m-1):
    margin=sum(at(Ul[a],k)*at(Cl[d-a],k)-at(Ul[a],k+1)*at(Cl[d-a],k-1)for a in range(m)if 0<=d-a<m)
    if d<m:margin+=at(E,k)*at(Cl[d],k)-at(E,k+1)*at(Cl[d],k-1)
    if margin<0:bad={'k':k,'layer_degree':d,'margin':str(margin)};break
   if bad:break
  rows.append({'r':r,'m':m,'N':N,'n':N+m+3,'first_negative_coefficient':bad})
out={'scope':'Private mechanism diagnostic, no primary assertion: insert a common formal variable t only in the other m-1 homogeneous branch factors, preserving the distinguished branch and E. Test every coefficient of A_t[k]C_t[k]-A_t[k+1]C_t[k-1] in the guarded ranks. Failure of coefficientwise positivity does not imply failure at t=1. No minimality claim.','rows':rows}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps([x for x in rows if x['first_negative_coefficient']][:6]))
