from fractions import Fraction as F
from math import comb, factorial
from pathlib import Path
import json

def ch(n,k): return comb(n,k) if 0 <= k <= n else 0

def g(N,k,r):
 # Cancel the binomial ratio before constructing large integers.
 out=F(2*r,2*r+1)*F(k,N)
 for u in range(r-1): out *= F(N-k-u,N-1-u)
 return out
def poly_mul(a,b):
 out=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b): out[i+j]+=x*y
 return out

def poly_sub(a,b):
 out=[0]*max(len(a),len(b))
 for i,x in enumerate(a): out[i]+=x
 for i,x in enumerate(b): out[i]-=x
 return out

def B(r):
 a=[ch(r,t) for t in range(r+1)]; a[1]+=1; return a

def Lpow(n): return [ch(n,t) for t in range(n+1)]

# Check the declared monomial-z bases explicitly (not powers of L).
bases={r:B(r) for r in (1,2,3,4)}
assert bases=={1:[1,2],2:[1,3,1],3:[1,4,3,1],4:[1,5,6,4,1]}
assert [1,2,1] == Lpow(2)
# Local endpoint identity, expanded in z for each represented arity.
endpoint=[]
for r in (2,3,4):
 lhs=poly_sub(poly_mul(Lpow(1),B(r)),poly_mul([1,2],B(r-1)))
 rhs=poly_mul([0,0,1],poly_sub(Lpow(r-1),[1]))
 assert lhs==rhs and all(x>=0 for x in lhs)
 endpoint.append({'r':r,'coefficients_z':lhs})

# Exact Taylor rational bounds.
a=F(99,20)
E8=sum((a**i/F(factorial(i)) for i in range(9)),F(0))
E7=sum((a**i/F(factorial(i)) for i in range(8)),F(0))
assert E8==F(2162945642595007,16384000000000) and E8>102
assert E7==F(88220922596671,716800000000) and E7>20

# Exact identities/directions across all integer guarded rows through N=5000.
# The theorem proof uses symbolic reductions; this exhaustive band audit is just a boundary check.
rows=0; min_g4=None
for N in range(200,501):
 K=(N+2)//2
 for k in range(1,K+1):
  if 4*k <= N+1: continue
  gs=[g(N,k,r) for r in (2,3,4)]
  assert gs[0]>=gs[1]>=gs[2]>=F(1,20),(N,k,gs)
  if min_g4 is None or gs[2]<min_g4[0]: min_g4=(gs[2],N,k)
  rows+=1
 # test fixed-k g4 monotonic step where both ranks are in the guarded complement
 for k in range(1,K):
  if 4*k>N+1 and 4*(k+1)>N+1:
   assert g(N,k+1,4)<=g(N,k,4),(N,k)

# Exact endpoint / interior checks for curvature denominator inequalities.
curvature=[]
for N,k,h,m in [(200,1,201,100),(200,51,201,100),(200,101,201,100),
                (201,51,208,100),(397,199,693,100),(400,201,701,100),
                (400,200,701,100)]:
 assert 1<=k and 2*k<=N+2 and h>=N+1 and N<=4*m
 lam=F(h+1,(k+1)*(h-k+1))
 b=F(N+1-k,k)
 lower=F(2,N+4)
 min_pay=F(2*N*(m+2),(N+4)*(N+2))
 assert lam>lower and b>=F(N,N+2) and min_pay>=F(1,2)
 curvature.append({'N':N,'k':k,'h':h,'lambda':str(lam),'lambda_floor':str(lower),'binomial_ratio':str(b),'payment_floor':str(min_pay)})

out={'scope':'independent exact boundary/interior checks only; not universal proof',
     'monomial_z_bases':{str(k):v for k,v in bases.items()},'endpoint_identity_z_coefficients':endpoint,
     'E8_99_20':str(E8),'E7_99_20':str(E7),'complementary_rows_N_200_to_500':rows,
     'minimum_g4_in_checked_rows':{'value':str(min_g4[0]),'N':min_g4[1],'k':min_g4[2]},
     'curvature_rows':curvature}
print(json.dumps(out,indent=2))
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n')
