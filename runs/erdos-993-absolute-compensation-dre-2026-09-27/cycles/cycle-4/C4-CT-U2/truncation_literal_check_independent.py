from pathlib import Path
from math import comb
from fractions import Fraction
import json

def add(a,b):
 c=[0]*max(len(a),len(b))
 for i,v in enumerate(a):c[i]+=v
 for i,v in enumerate(b):c[i]+=v
 return c

def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,u in enumerate(a):
  for k,v in enumerate(b):c[i+k]+=u*v
 return c

def at(a,k):return a[k] if 0<=k<len(a) else 0

def bn(n,k):return comb(n,k) if 0<=k<=n else 0

def ip(g,deleted=None):
 def rec(v,p):
  off=[1];on=[0,1]
  for w in g[v]:
   if w==p or w==deleted:continue
   a,b=rec(w,v);off=mul(off,add(a,b));on=mul(on,a)
  return off,on
 return add(*rec(0,-1))

m=173;N=4*m;g=[{1},{0,2},{1}]
for _ in range(m):
 c=len(g);g.append({0});g[0].add(c)
 for h in range(4):v=len(g);g.append({c});g[c].add(v)
P=ip(g);A0=ip(g,2);Ai=ip(g,4);x=next(k for k in range(len(P)) if at(P,k+1)<at(P,k));p=x+2;j=p-2;delta=N+1-j
assert x==336 and p==338 and 3*p<2*(N+2)+1 and 2*p<=N+2
assert at(A0,p+1)<at(A0,p) and at(Ai,p+1)<at(Ai,p)
Q=[1];H=[1]
for k in range(m):
 if k==m-1:H=Q[:]
 Q=mul(Q,[1,5,6,4,1])
C=mul(Q,[1,2]);assert P==add(C,[0]+[comb(N+1,k) for k in range(N+2)])
T=mul(H,[3,9,7,2]);lb=sum(c*(bn(N-4,j-s)+(m-1)*bn(N-8,j-s-1)) for s,c in enumerate([3,9,7,2]));b=N+1;A=N*T[j];Alb=N*lb;D=bn(N,j+1)-bn(N,j);K=delta*C[j]-(delta-1)*C[j+1];debt=b*delta*D*C[j]
assert 0<C[j+1]<C[j] and D>0 and K*Alb<debt<=K*A and A>=b*delta*D
out={'scope':'independent controller literal-tree and direct factor-multiplication replay; not a governed claim award','m':m,'N':N,'vertices':len(g),'alpha':N+2,'x':x,'p':p,'j':j,'delta':delta,'endpoint_selected':True,'every_tip_selected':True,'b':b,'Cj':str(C[j]),'Cj1':str(C[j+1]),'D':str(D),'Tj':str(T[j]),'truncated_Tj':str(lb),'truncated_integer_margin':str(K*Alb-debt),'full_integer_margin':str(K*A-debt),'full_mass_margin':str(A-b*delta*D),'truncated_ratio':str(Fraction(K*Alb,debt)),'truncated_ratio_approx':float(Fraction(K*Alb,debt))}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print({k:out[k] for k in ['m','N','vertices','x','p','truncated_ratio_approx']})
