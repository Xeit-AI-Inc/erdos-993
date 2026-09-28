from pathlib import Path
from fractions import Fraction as F
from math import comb,factorial,prod
from itertools import combinations
import json

def ch(n,k):return comb(n,k)if 0<=k<=n else 0

def mul(a,b):
 c=[F(0)]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c
cases=[[],[[F(1),F(2)]],[[F(2),F(4)]],[[F(1),F(3),F(1)]],[[F(1),F(2)],[F(1),F(2)]],[[F(3,2),F(3,2)],[F(2),F(3),F(3,2)]],[[F(1),F(3),F(1)],[F(1),F(4),F(3),F(1)]],[[F(2),F(5),F(4),F(1)],[F(1),F(2)]],[[F(1),F(3),F(1)],[F(2),F(4),F(2)]]]
rows=[]
for fs in cases:
 rs=[len(f)-1 for f in fs];assert all(r>=1 for r in rs)
 assert all(f[t]>=ch(r,t)for r,f in zip(rs,fs)for t in range(r+1))
 labels=[(i,v)for i,r in enumerate(rs)for v in range(r)];M=len(labels);H=[F(1)]
 for f in fs:H=mul(H,f)
 for k in range(M+1):
  omega=list(combinations(labels,k));assert len(omega)==ch(M,k)>0
  avg=F(0);point_y=F(0)
  for S in omega:
   counts=[sum(a==i for a,_ in S)for i in range(len(rs))]
   w=[f[t]/ch(r,t)for r,f,t in zip(rs,fs,counts)]
   avg+=prod(w,start=F(1));point_y+=sum((2*(a-1)/(a+1)for a in w),start=F(0))
  avg/=len(omega);point_y/=len(omega)
  y=sum((F(ch(r,t)*ch(M-r,k-t),ch(M,k))*2*(f[t]-ch(r,t))/(f[t]+ch(r,t))for r,f in zip(rs,fs)for t in range(r+1)),start=F(0))
  assert avg==H[k]/ch(M,k);assert y==point_y and y>=0
  for d in [0,1,2,4]:assert sum((y**a/factorial(a)for a in range(d+1)),start=F(0))<=avg
  rows.append({'r':rs,'coefficients':[[str(x)for x in f]for f in fs],'k':k,'actual_subset_count':len(omega),'normalized_coefficient':str(avg),'y':str(y)})
out={'scope':'Exact finite boundary checks of actual labeled-subset expectation and marginal exponent; rational Taylor floors at d0,1,2,4. These checks are not the universal proof, no transcendental numerical assertion or formal award.','cases':len(cases),'rows':rows}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({'cases':len(cases),'ranks':len(rows),'checks':'passed'}))
