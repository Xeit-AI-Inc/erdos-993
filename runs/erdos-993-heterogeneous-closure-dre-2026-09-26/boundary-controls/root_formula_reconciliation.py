"""Independent exact checks of two displayed C6 claims; no census."""
from math import comb
from pathlib import Path
import json

def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c
def add(a,b):return [(a[i] if i<len(a) else 0)+(b[i] if i<len(b) else 0) for i in range(max(len(a),len(b)))]
def lp(n):return [comb(n,k) for k in range(n+1)]
def br(r):a=lp(r);a[1]+=1;return a
def prod(rs):
 a=[1]
 for r in rs:a=mul(a,br(r))
 return a
def cf(a,k):return a[k] if 0<=k<len(a) else 0
def d(a,k):return cf(a,k+1)-cf(a,k)
def first(a):return next(k for k in range(len(a)) if d(a,k)<0)
def fr(r):
 a=[0]*(r-1)
 for h in range(r-1):a=add(a,lp(h))
 return a
rs=[3]*12+[4]*10;N=sum(rs);Q=prod(rs);P=add(mul([1,2],Q),[0]+lp(N+1));A0=add(mul([1,1],Q),[0]+lp(N));x=first(P);p=x+2
rows=[]
for r in (3,4):
 others=rs.copy();others.remove(r);H=prod(others);Ai=add(mul(mul([1,2],br(r-1)),H),[0]+lp(N));cofactor=mul(fr(r),H);dd=d(cofactor,p-3)
 assert add(Ai,[0,0,0]+cofactor)==A0
 assert dd==d(A0,p)-d(Ai,p)<0
 assert dd>d(A0,p) and d(Ai,p)<0
 rows.append({'arity':r,'endpoint_slope':d(A0,p),'tip_slope':d(Ai,p),'cofactor_slope':dd,'selected':True})
audit={'selector_fixture':{'counts':[0,12,10],'N':N,'alpha':N+2,'n':N+len(rs)+3,'x':x,'p':p,'guard_rhs':2*(N+2)+1,'guard_lhs':3*p,'private_tip_tags':N,'branch_flags':len(rs),'cofactor_rows':rows,'conclusion':'all branches selected despite all represented cofactor slopes negative; existential nonnegative cofactor condition is false here, not equivalent to endpoint exclusion'}}
W=[1,2];b33=mul(br(3),br(3));Pold=add(mul(W,b33),[0]+lp(7));Pnew=add(mul(W,mul(br(2),br(4))),[0]+lp(7))
k=0;weights=[1,8,22,26,17,6,1];core=sum(t*d(W,k-i) for i,t in enumerate(weights));inc=d(W,k-3)+2*d(W,k-4)+d(W,k-5)
true_binom=cf(lp(7),k)-cf(lp(7),k-1)
audit['spread_display']={'profile':[3,3],'k':k,'old_first_descent':first(Pold),'actual_new_slope':d(Pnew,k),'printed_stencil':core+inc-true_binom,'corrected_stencil':core+inc+true_binom,'conclusion':'displayed binomial sign reversed; replay in source did not test this stencil'}
assert audit['spread_display']['printed_stencil']!=d(Pnew,k)==audit['spread_display']['corrected_stencil']
Path(__file__).with_suffix('.json').write_text(json.dumps(audit,indent=2)+'\n');print(json.dumps(audit,indent=2))
