"""Independent exact checks of the C6-T3 bridge's factor and boundary arithmetic."""
from math import comb
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

def sub(a,b): return add(a,[-x for x in b])
def shift(a,n=1): return [0]*n+a
def lp(n): return [comb(n,k) for k in range(n+1)]
def B(r):
 x=lp(r); x[1]+=1; return x
def F(r): return [sum(comb(t,k) for t in range(r-1)) for k in range(r-1)]
def at(a,k): return a[k] if 0<=k<len(a) else 0
def minors(a,b):
 n=max(len(a),len(b)); a=a+[0]*(n-len(a)); b=b+[0]*(n-len(b))
 return [(u,v,a[u]*b[v]-a[v]*b[u]) for u in range(n) for v in range(u+1,n)]
def M(a,c,k): return at(a,k)*at(c,k)-at(a,k+1)*at(c,k-1)

# Required local LR pair is B_(r-1), B_r; also retain the report's F_r pair separately.
for r in (2,3,4):
 actual=minors(B(r-1),B(r)); reported=minors(F(r),B(r))
 assert all(v>=0 for _,_,v in actual)
 assert all(v>=0 for _,_,v in reported)
 print('local',r,'Bprev_B',B(r-1),B(r),'minors',actual)
 print('local',r,'reported_F_B',F(r),B(r),'minors',reported)

# Exact curvature rearrangement: ULC factor A gives 1-1/A = lambda.
for h in (3,14):
 for k in range(1,(h+2)//2):
  if k*(2) <= h+1:
   A=Fraction((k+1)*(h-k+1),k*(h-k))
   lam=Fraction(h+1,(k+1)*(h-k+1))
   assert 1-1/A==lam
print('curvature identity exact: 1-1/A=(h+1)/((k+1)(h-k+1)); A positive on tested guarded ranks')

# Exact boundary and interior path-star values, including zero-extension at guarded edge.
for rs,ks in [((2,),(1,)),((2,3,4),(1,2,4,5))]:
 N=sum(rs); h=1+sum({2:2,3:4,4:7}[r] for r in rs)
 Q=[1]
 for r in rs: Q=mul(Q,B(r))
 C=mul([1,2],Q); E=shift(lp(N)); H=[]
 for i,r in enumerate(rs):
  co=[1]
  for j,s in enumerate(rs):
   if j!=i: co=mul(co,B(s))
  Ui=mul(mul([1,2],B(r-1)),co)
  H.append(Ui)
 U0=mul([1,1],Q)
 for k in ks:
  assert 2*k<=N+2
  # Verify ULC bound C[k]-C[k+1]C[k-1]/C[k] >= lambda*C[k].
  lam=Fraction(h+1,(k+1)*(h-k+1))
  curvature=Fraction(at(C,k)*at(C,k)-at(C,k+1)*at(C,k-1),at(C,k))
  assert curvature >= lam*at(C,k)
  # Verify main-product LR and all premise-to-minor decomposition values exactly.
  vals=[]
  for Ui in H:
   assert at(Ui,k+1)*at(C,k)<=at(Ui,k)*at(C,k+1)
   ts=(h+1)*at(Ui,k)*at(C,k)+(k+1)*(h-k+1)*M(E,C,k)
   assert M(Ui,C,k)>=lam*at(Ui,k)*at(C,k)
   vals.append({'TS':ts,'tip_main_minor':M(Ui,C,k)})
  assert at(U0,k+1)*at(C,k)<=at(U0,k)*at(C,k+1)
  assert at(U0,k)>=at(H[0],k)
  print('profile',rs,'N,h,k',N,h,k,'C[k-1:k+2]',[at(C,k-1),at(C,k),at(C,k+1)],'lambda',str(lam),'curvature',str(curvature),'tip',vals,'endpoint_U0_minus_Ui[k]',at(U0,k)-at(H[0],k),'endpoint_MU',M(U0,C,k))
print('all exact assertions passed')
