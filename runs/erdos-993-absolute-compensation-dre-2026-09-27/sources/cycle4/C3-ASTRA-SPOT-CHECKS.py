from pathlib import Path
from fractions import Fraction as F
from math import comb,factorial
import json
def c(n,k):return comb(n,k)if 0<=k<=n else 0
u=F(5,8);v=F(4,7)
actual=F(4,5)-F(12,7)*u+F(8,9)*u*v
alleged=F(4,5)-F(12,7)*u+F(8,9)*u*u
assert actual==F(29,630)and alleged==F(191,2520)and actual-alleged==-F(5,168)
checks=0
for M in [10,11,12,44,70,140,236]:
 for k in range((M+2)//3,M+1):
  g={r:F(2*r,2*r+1)*F(c(M-r,k-1),c(M,k))for r in [2,3,4]}
  if k==M:assert all(x==0 for x in g.values())
  else:
   h=M-k-1;v=3*k-M
   f=63*(M-2)*(M-3)-135*h*(M-3)+70*h*(h-1)
   assert 9*f==37*(M-10)**2+290*(M-10)+217+v*(125*M-585)+70*v*v
   assert g[2]-2*g[3]+g[4]==F(4*k*(M-k)*f,315*M*(M-1)*(M-2)*(M-3))>0
  checks+=1
a=F(119,20);E8=sum((a**i/F(factorial(i)))for i in range(9));E7=sum((a**i/F(factorial(i)))for i in range(8))
assert E8==F(48232104261912983,147456000000000)>288 and E7>48
# Size-one block: coefficients of L+z are1,2; lower-binomial index k-1 is signed.
y0=F(2,3)*F(c(0,-1),c(1,0));y1=F(2,3)*F(c(0,0),c(1,1))
assert y0==0 and y1==F(2,3) and 1+y1<=2
bad_nat_y0=F(2,3)*F(c(0,max(0,0-1)),c(1,0));assert 1+bad_nat_y0>1
out={'scope':'Controller independent exact spot checks supporting midpoint audit, not universal proof or Lean award','invalid_lower_bound':{'actual':str(actual),'alleged':str(alleged),'difference':str(actual-alleged)},'valid_balancing_identity_tested_pairs':checks,'tail_constants':{'E8':str(E8),'E7':str(E7)},'size_one_boundary':{'H0':1,'H1':2,'y0_signed':str(y0),'y1':str(y1),'wrong_y0_from_saturated_predecessor':str(bad_nat_y0)}}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
