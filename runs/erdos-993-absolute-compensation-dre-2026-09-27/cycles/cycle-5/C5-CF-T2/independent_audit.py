"""Independent exact monomial-z audit of C5-T2 claims and boundary controls."""
from math import comb
import json

def add(a,b):
 n=max(len(a),len(b)); return [(a[i] if i<len(a) else 0)+(b[i] if i<len(b) else 0) for i in range(n)]
def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b): c[i+j]+=x*y
 return c
def scale(a,s): return [s*x for x in a]
def coef(a,k): return a[k] if 0<=k<len(a) else 0
def Lpow(n): return [comb(n,k) for k in range(n+1)]
def B(r):
 a=Lpow(r); a += [0]*max(0,2-len(a)); a[1]+=1; return a
def G(): return [1,2]
def Epoly(N): return [0]+Lpow(N)
def prof(rs):
 N=sum(rs); Q=[1]
 for r in rs: Q=mul(Q,B(r))
 C=mul(G(),Q); E=Epoly(N); W=[0]
 tips=[]; Us=[]
 for i,r in enumerate(rs):
  H=[1]
  for j,s in enumerate(rs):
   if i!=j: H=mul(H,B(s))
  U=mul(mul(G(),B(r-1)),H); A=add(U,E)
  tips.append(A); Us.append(U); W=add(W,scale(A,r))
 A0=add(mul([1,1],Q),E)
 P=add(C,Epoly(N+1))
 return N,C,E,Us,tips,A0,W,P

def margin(A,C,k): return coef(A,k)*coef(C,k)-coef(A,k+1)*coef(C,k-1)
def hval(rs): return 1+sum({2:2,3:4,4:7}[r] for r in rs)
def surplus(U,E,C,h,k):
 M=margin(E,C,k)
 return (h+1)*coef(U,k)*coef(C,k)+(k+1)*(h-k+1)*M

# Independently reconstruct the t-polynomial from direct z-binomial expansions.
def activity():
 def bivar_add(a,b):
  n=max(len(a),len(b)); return [add(a[i] if i<len(a) else [],b[i] if i<len(b) else []) for i in range(n)]
 def bivar_mul(a,b):
  c=[[] for _ in range(len(a)+len(b)-1)]
  for i,ai in enumerate(a):
   for j,bj in enumerate(b): c[i+j]=add(c[i+j],mul(ai,bj))
  return c
 def zrow(a,k): return [coef(v,k) for v in a]
 r=4;k=7;L=Lpow(4); act=[L,[0,1]];Gv=[[1,2]]
 Ct=bivar_mul(bivar_mul(Gv,[B(4)]),bivar_mul(act,act))
 Ut=bivar_mul(bivar_mul(Gv,[B(3)]),bivar_mul(act,act))
 At=bivar_add(Ut,[Epoly(12)])
 m=add(mul(zrow(At,k),zrow(Ct,k)),scale(mul(zrow(At,k+1),zrow(Ct,k-1)),-1))
 C0=mul(mul(G(),B(4)),mul(B(4),B(4))); A=add(mul(mul(G(),B(3)),mul(B(4),B(4))),Epoly(12))
 return {'coefficients_t_low_to_high':[str(x) for x in m], 't1':str(sum(m)), 'direct_t1':str(margin(A,C0,k)), 'z_monomial_values':{'A7':coef(A,7),'A8':coef(A,8),'C7':coef(C0,7),'C6':coef(C0,6)}}

rows=[]
# Complete exact rank checks over every multiset profile with m<=3.
from itertools import combinations_with_replacement
for m in range(1,4):
 for rs in combinations_with_replacement((2,3,4),m):
  N,C,E,Us,tips,A0,W,P=prof(rs); h=hval(rs); maxk=(N+2)//2
  for k in range(1,maxk+1):
   rows.append({'profile':rs,'k':k,'individual_min':min([margin(A0,C,k)]+[margin(A,C,k) for A in tips]),'weighted':margin(W,C,k),'surplus_min':min(surplus(U,E,C,h,k) for U in Us)})
# Boundary/interior exact checks on key large profiles and a surplus case with reported crude failure.
keys=[]
for rs,ks in [((3,)*22,(1,27,32,34)),((4,)*4,(1,8,9)),((2,3,4),(1,4,5))]:
 N,C,E,Us,tips,A0,W,P=prof(rs); h=hval(rs); maxk=(N+2)//2
 for k in ks:
  if not 1<=k<=maxk: continue
  keys.append({'profile':rs,'N':N,'h':h,'k':k,'guard':1<=k and 2*k<=N+2,'endpoint_margin':str(margin(A0,C,k)),'tip_margins':[str(margin(A,C,k)) for A in tips],'weighted_margin':str(margin(W,C,k)),'tip_surpluses':[str(surplus(U,E,C,h,k)) for U in Us[:1]],'sign_factors':{'h_plus_1':h+1,'k_plus_1':k+1,'h_minus_k_plus_1':h-k+1}})
# Correct full shifted comparison from the negative isolated-E control.
rs=(3,)*22; N,C,E,Us,tips,A0,W,P=prof(rs); k=27
control={'profile':[0,22,0],'N':N,'k':k,'E_minor':str(margin(E,C,k)),'full_tip_minor':str(margin(tips[0],C,k)),'U_minor':str(margin(Us[0],C,k)),'check_sum_identity':margin(tips[0],C,k)==margin(Us[0],C,k)+margin(E,C,k)}
# Actual first descent and selector checks use literal strict inequalities.
def first_descent(P):
 for x in range(len(P)+1):
  if coef(P,x+1)-coef(P,x)<0:return x
 raise AssertionError
x=first_descent(P); p=34;j=p-2
control['actual']={'x':x,'p':p,'j':j,'descent_guard':x+2<=p,'selector_endpoint':coef(A0,p+1)-coef(A0,p)<0,'selector_tip':coef(tips[0],p+1)-coef(tips[0],p)<0,'alpha':N+2,'three_p_guard':3*p<2*(N+2)+1,'two_p_guard':2*p<=N+2}
assert all(r['individual_min']>=0 and r['weighted']>=0 and r['surplus_min']>=0 for r in rows)
assert activity()['coefficients_t_low_to_high']==['1898616','171542','6175','-66','0']
assert control['E_minor'].startswith('-') and int(control['full_tip_minor'])>0 and control['check_sum_identity']
assert control['actual']=={'x':32,'p':34,'j':32,'descent_guard':True,'selector_endpoint':True,'selector_tip':True,'alpha':68,'three_p_guard':True,'two_p_guard':True}
print(json.dumps({'activity_basis':activity(),'small_multiset_profile_count':sum(1 for m in range(1,4) for _ in combinations_with_replacement((2,3,4),m)),'guarded_profile_rank_rows':len(rows),'small_horizon_minima':{'individual':str(min(r['individual_min'] for r in rows)),'weighted':str(min(r['weighted'] for r in rows)),'exact_ratio_surplus':str(min(r['surplus_min'] for r in rows))},'selected_boundary_interior_rows':keys,'negative_E_compensation':control},indent=2))
