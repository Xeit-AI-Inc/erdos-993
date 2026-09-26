from math import comb, factorial
from fractions import Fraction
import json
from pathlib import Path
def conv(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c
def ulc(a,d):
 return d>=len(a)-1 and all(j*(d-j)*a[j]**2 >= (j+1)*(d-j+1)*a[j-1]*a[j+1] for j in range(1,len(a)-1))
orders={}
for r in range(2,13):
 f=[comb(r-1,j+1) for j in range(r-1)]
 for s in range(2,13):
  b=[comb(s,j)+(j==1) for j in range(s+1)]
  c=conv(f,b)
  d=next(d for d in range(len(c)-1,2000) if ulc(c,d))
  assert d==len(c)-1 or not ulc(c,d-1)
  orders[f'{r},{s}']=d
assert len(orders)==121
assert max(orders.values())==962 and orders['12,2']==962
for r in range(2,13):
 b=[comb(r,j)+(j==1) for j in range(r+1)]
 assert ulc(b,comb(r,2)+1)
m=100_000_000
A=Fraction(2,3)-Fraction(17,2*m)
B=Fraction(1,3)-Fraction(202,2*m)
eps=Fraction(factorial(17),(m-17)**17*A**16*B**200)
C=76*9**11+352
cut=9*m*C*eps
assert cut<1
assert 3*(2*m*12//3+3)/(2*m*12//3-13)<8
out={'pair_count':len(orders),'largest_order':max(orders.values()),'largest_pair':[12,2],'orders':orders,'C':C,'A':str(A),'B':str(B),'cutoff_ratio':str(cut),'cutoff_decimal':float(cut),'below_one':cut<1}
Path(__file__).with_name('ARITY12-VERIFICATION.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='orders'},indent=2))
