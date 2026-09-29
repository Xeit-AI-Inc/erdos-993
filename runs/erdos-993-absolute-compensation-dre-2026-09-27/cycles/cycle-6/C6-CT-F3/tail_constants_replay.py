from fractions import Fraction as F
from math import comb,factorial
from pathlib import Path
import json
choose=lambda n,k:comb(n,k)if 0<=k<=n else 0
g=lambda n,k,r:F(2*r,2*r+1)*F(choose(n-r,k-1),choose(n,k))
a=F(99,20);E=lambda d:sum((a**i/F(factorial(i))for i in range(d+1)),F(0))
assert E(8)>102 and E(7)>20
rows=0;minimum=None
for n in range(200,241):
 for k in range(1,(n+2)//2+1):
  if 4*k<=n+1:continue
  x=[g(n,k,r)for r in[2,3,4]];assert x[0]>=x[1]>=x[2]>=F(1,20)
  if minimum is None or x[2]<minimum[0]:minimum=(x[2],n,k)
  rows+=1
low=0
for n in range(2,49):
 for s in range(0,n//2+1):
  for R in range(2*s,min(4*s,n)+1):
   for k in range(1,(n+1)//4+1):
    margin=choose(n,k-1)*choose(n-R,k-s)-choose(n,k)*choose(n-R,k-1-s)
    assert margin>=0,(n,s,R,k,margin)
    low+=1
out={'status':'bounded arithmetic checks only; draft universal proof requires independent review','E8_99over20':str(E(8)),'E7_99over20':str(E(7)),'singleton_exponent_rows':rows,'g4_minimum_in_test':{'value':str(minimum[0]),'N':minimum[1],'k':minimum[2]},'low_band_center_term_checks':low}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
