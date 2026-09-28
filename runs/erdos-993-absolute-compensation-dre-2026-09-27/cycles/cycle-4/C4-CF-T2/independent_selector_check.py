#!/usr/bin/env python3
"""Independent small exact audit of weighted-LR => strict branch selector."""
from math import comb
from fractions import Fraction
import json

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return c

def add(a,b):
    c=[0]*max(len(a),len(b))
    for i,x in enumerate(a): c[i]+=x
    for i,x in enumerate(b): c[i]+=x
    return c

def power(a,n):
    c=[1]
    for _ in range(n): c=mul(c,a)
    return c

def c(a,k): return a[k] if 0<=k<len(a) else 0
L=[1,1]; G=[1,2]; Z=[0,1]
def polynomials(rs):
    n=sum(rs); Bs={r:add(power(L,r),Z) for r in [2,3,4]}
    C=mul(G,[1])
    for r in rs: C=mul(C,Bs[r])
    W=[0]
    for i,r in enumerate(rs):
        h=mul(G,power(L,r-1))
        for t,s in enumerate(rs):
            if t!=i: h=mul(h,Bs[s])
        Ai=add(h,mul(Z,power(L,n)))
        W=add(W,[r*v for v in Ai]+[0]*max(0,len(W)-len(Ai))) if len(Ai)>=len(W) else add(W,[r*v for v in Ai])
    P=add(C,mul(Z,power(L,n+1)))
    return C,W,P

profiles=[]
for a in range(0,50):
 for b in range(0,50-a):
  for d in range(0,50-a-b):
   if not a+b+d: continue
   rs=[2]*a+[3]*b+[4]*d
   N=sum(rs); alpha=N+2
   C,W,P=polynomials(rs)
   x=next(k for k in range(len(P)+1) if c(P,k+1)-c(P,k)<0)
   for p in range(x+2,(alpha//2)+1):
    if 3*p>=2*alpha+1: continue
    # literal weighted comparison at p and exact ratio cross products
    lhs=c(W,p+1)*c(C,p-1); rhs=c(W,p)*c(C,p)
    if lhs<=rhs and c(W,p)*c(C,p-1)>0:
     deltaC=c(C,x+1)-c(C,x)
     deltaBin=comb(N+1,x)-comb(N+1,x-1) if 0<=x<=N+2 else 0
     branch_deltas=[]
     for i,r in enumerate(rs):
      h=mul(G,power(L,r-1))
      for j,s in enumerate(rs):
       if i!=j:h=mul(h,add(power(L,s),Z))
      Ai=add(h,mul(Z,power(L,N)))
      branch_deltas.append(c(Ai,p+1)-c(Ai,p))
     profiles.append((rs,N,x,p,deltaC,deltaBin,lhs,rhs,min(branch_deltas),sum(1 for v in branch_deltas if v<0)))
     break
   if profiles: break
  if profiles: break
 if profiles: break
if not profiles: raise SystemExit('no eligible sample found')
rs,N,x,p,dc,db,lhs,rhs,mind,nsel=profiles[0]
result={'counts_2_3_4':[rs.count(2),rs.count(3),rs.count(4)],'N':N,'x':x,'p':p,
       'Delta_x_P':c(P,x+1)-c(P,x),'Delta_x_C':dc,'Delta_x_binomial':db,
       'weighted_cross_left':str(lhs),'weighted_cross_right':str(rhs),
       'W_ratio_at_p':str(Fraction(c(W,p+1),c(W,p))),
       'C_ratio_at_p':str(Fraction(c(C,p),c(C,p-1))),
       'C_ratio_at_x_plus_1':str(Fraction(c(C,x+1),c(C,x))),
       'some_branch_strictly_selected':mind<0,'strict_selected_branches':nsel}
# Exact edge checks for the shifted comparison in this example, when its guard allows it.
_,W,_=polynomials(rs)
maxk=(N+2)//2
for k in sorted(set([1,max(1,maxk//2),maxk])):
 margin=c(W,k)*c(C,k)-c(W,k+1)*c(C,k-1)
 result.setdefault('rank_checks',[]).append({'k':k,'guarded':1<=k and 2*k<=N+2,'signed_margin':str(margin)})
print(json.dumps(result,indent=2))
