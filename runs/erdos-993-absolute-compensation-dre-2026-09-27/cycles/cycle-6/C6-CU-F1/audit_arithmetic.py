#!/usr/bin/env python3
from fractions import Fraction as F
from math import comb, factorial
choose=lambda n,k: comb(n,k) if 0<=k<=n else 0

def g(n,k,r): return F(2*r,2*r+1)*F(choose(n-r,k-1),choose(n,k))
# Exact Taylor constants.
a=F(99,20)
def E(d): return sum((a**i/F(factorial(i)) for i in range(d+1)),F(0))
assert E(8)==F(2162945642595007,16384000000000) and E(8)>102
assert E(7)==F(88220922596671,716800000000) and E(7)>20
# Check exact arity-order identities and asserted inequalities throughout a broad
# finite boundary/interior grid; these checks corroborate, but do not replace,
# the symbolic reductions in REPORT.md.
rows=0; minrow=None
for n in range(200,401):
 for k in [max(1,(n+1)//4+1), (n+2)//2, max(1,(n+2)//2-1)]:
  if 4*k<=n+1: continue
  gs=[g(n,k,r) for r in (2,3,4)]
  assert gs[0]>=gs[1]>=gs[2]>=F(1,20),(n,k,gs)
  assert gs[2]*20>=1
  rows+=1
  if minrow is None or gs[2]<minrow[0]: minrow=(gs[2],n,k)
# Adjacent g4 ratio direction and the low-band center-term cross product.
for n in range(200,401):
 for k in [max(1,(n+1)//4+1), (n+2)//2-1]:
  if 4*k<=n+1: continue
  assert g(n,k+1,4)<=g(n,k,4)
low=0
for n in range(1,40):
 for s in range(0,n+1):
  for R in range(0,min(4*s,n)+1):
   for k in range(1,n+1):
    if 4*k>n+1: continue
    # Positive-support cross product for z^s L^(n-R) / binom(n,k).
    v=choose(n-R,k-s)
    vp=choose(n-R,k-1-s)
    cross=choose(n,k-1)*v-choose(n,k)*vp
    # Only legitimate expansion rows have R>=2s and R<=n.
    if 2*s<=R<=n:
     assert cross>=0,(n,s,R,k,cross)
     low+=1
# Positive-denominator final bound: 4N(m+2) >= (N+4)(N+2)
# for N<=4m and N>=200, sampled at extremal N=4m and the smallest N.
for m in range(100,150):
 for n in (200, max(200,2*m), min(4*m,2000),4*m):
  if 200<=n<=4*m:
   assert 4*n*(m+2)-(n+4)*(n+2)>0
print({'taylors': [str(E(7)),str(E(8))], 'tail_grid_rows':rows,
       'grid_minimum_g4': [str(minrow[0]),minrow[1],minrow[2]],
       'low_cross_rows':low, 'status':'bounded cross-checks only'})
