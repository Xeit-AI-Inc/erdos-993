"""Exact fixed-factor and polynomial identity checks, independent from pinned scripts."""
from math import comb
import json
from pathlib import Path

B={1:[1,2],2:[1,3,1],3:[1,4,3,1],4:[1,5,6,4,1]}
F={2:[1],3:[2,1],4:[3,3,1]}
orders={1:1,2:2,3:4,4:7}
for r,a in B.items():
 d=orders[r]
 for j in range(1,len(a)-1):
  assert a[j]**2*comb(d,j-1)*comb(d,j+1)>=a[j-1]*a[j+1]*comb(d,j)**2
for r,a in F.items():
 d={2:0,3:1,4:3}[r]
 for j in range(1,len(a)-1):
  assert a[j]**2*comb(d,j-1)*comb(d,j+1)>=a[j-1]*a[j+1]*comb(d,j)**2
pairs=[([1,1],B[1])]+[(B[r-1],B[r]) for r in (2,3,4)]+[(F[r],B[r]) for r in (2,3,4)]
leading=[]
for u,v in pairs:
 for a in range(max(len(u),len(v))):
  for b in range(a+1,max(len(u),len(v))):
   ua=u[a] if a<len(u) else 0;ub=u[b] if b<len(u) else 0
   va=v[a] if a<len(v) else 0;vb=v[b] if b<len(v) else 0
   assert ua*vb-ub*va>=0
 leading.append(u[0]*v[1]-(u[1] if len(u)>1 else 0)*v[0])
assert leading==[1,1,1,1,3,7,12]

# A grid of 5x5 integer substitutions proves each equality of polynomials of
# degree at most four in each variable, without sharing a symbolic engine.
def even_num(n,k):return (2*n-4*k-2)*(2*n-4*k-3)*(n+3)*(n-1)
def even_den(n,k):return (n+4-k)*(n-3*k-6)*(2*n+2)*(2*n+1)
def even_diff(n,k):return ((4*k*k+36*k+80)*n*n+(14*k*k+132*k+190)*n-54*k*k-48*k+30)
def odd_num(n,k):return (2*n-4*k-3)*(n-1)
def odd_den(n,k):return (n-3*k-6)*(2*n+1)
for n in range(5):
 for k in range(5):
  assert even_num(n,k)-even_den(n,k)==even_diff(n,k)
  assert odd_num(n,k)-odd_den(n,k)==(2*k+6)*n+7*k+9
for k in range(1,87):
 for n in (3*k+7,3*k+8,266,267):
  if n>=3*k+7:
   assert even_diff(n,k)>0 and odd_num(n,k)>odd_den(n,k)
out={"ulc_factors":True,"ordered_local_minors":True,"leading_minors":leading,
     "even_odd_polynomial_identities_by_interpolation_grid":True}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
