#!/usr/bin/env python3
"""Independent exact audit of the weighted-LR-to-selector implication."""
import json
from fractions import Fraction

def add(a,b):
 o=[0]*max(len(a),len(b))
 for i,x in enumerate(a): o[i]+=x
 for i,x in enumerate(b): o[i]+=x
 return o

def mul(a,b):
 o=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b): o[i+j]+=x*y
 return o

def scale(a,c): return [c*x for x in a]
def coeff(a,k): return a[k] if 0<=k<len(a) else 0
def power(a,n):
 o=[1]
 for _ in range(n): o=mul(o,a)
 return o
L=[1,1]; G=[1,2]; Z=[0,1]
def profile(ct):
 rs=[2]*ct[0]+[3]*ct[1]+[4]*ct[2]
 N=sum(rs); Bs={r:add(power(L,r),Z) for r in (2,3,4)}
 Q=[1]
 for r in rs: Q=mul(Q,Bs[r])
 C=mul(G,Q); As=[]
 for i,r in enumerate(rs):
  H=[1]
  for h,s in enumerate(rs):
   if h!=i: H=mul(H,Bs[s])
  Ai=add(mul(mul(G,add(power(L,r-1),Z)),H),mul(Z,power(L,N)))
  As.append(Ai)
 W=[0]
 for r,Ai in zip(rs,As): W=add(W,scale(Ai,r))
 P=add(C,mul(Z,power(L,N+1)))
 x=next(k for k in range(len(P)+1) if coeff(P,k+1)-coeff(P,k)<0)
 ps=[p for p in range(x+2,(N+2)//2+1) if 3*p<2*(N+2)+1]
 out={'counts_2_3_4':ct,'m':len(rs),'N':N,'x':x,'guarded_k_boundary':(N+2)//2,
      'boundary_margins':{},'eligible_p':[]}
 for k in {1,(N+2)//2, max(1,(N+2)//4)}:
  if k>=1 and 2*k<=N+2:
   M=coeff(W,k)*coeff(C,k)-coeff(W,k+1)*coeff(C,k-1)
   out['boundary_margins'][str(k)]={'signed_integer_margin':str(M),'direction_holds':M>=0}
 for p in ps:
  dW=coeff(W,p+1)-coeff(W,p)
  selected=[i for i,Ai in enumerate(As) if coeff(Ai,p+1)-coeff(Ai,p)<0]
  out['eligible_p'].append({'p':p,'deltaP':coeff(P,p+1)-coeff(P,p),
   'deltaW':dW,'selected_branch_indices_zero_based_first_three':selected[:3],
   'selected_branch_count':len(selected),'C_ratio_p_over_pminus1':str(Fraction(coeff(C,p),coeff(C,p-1))),
   'C_ratio_at_x':str(Fraction(coeff(C,x+1),coeff(C,x))),
   'weighted_LR_margin':str(coeff(W,p)*coeff(C,p)-coeff(W,p+1)*coeff(C,p-1)),
   'strict_selector_consequence_checks': dW<0 and len(selected)>0 and coeff(C,p)<coeff(C,p-1)})
 return out

profiles=[(1,0,0),(0,1,0),(0,0,1),(1,1,1),(0,12,10),(38,0,1),(1,1,30),(120,80,60)]
rows=[profile(c) for c in profiles]
for r in rows:
 for p in r['eligible_p']:
  assert p['strict_selector_consequence_checks']
 for k,v in r['boundary_margins'].items(): assert v['direction_holds']
print(json.dumps({'scope':'exact polynomial checks on eight fixed profiles; implication audited only where actual eligible p exists', 'profiles':rows},indent=2))
