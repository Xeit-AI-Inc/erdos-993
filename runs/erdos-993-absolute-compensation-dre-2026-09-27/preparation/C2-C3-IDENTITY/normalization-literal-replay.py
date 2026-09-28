from pathlib import Path
from fractions import Fraction as F
from math import comb
import json
m=38;r=3;n=3+m+m*r;adj=[set()for _ in range(n)];edges=[]
def edge(a,b):adj[a].add(b);adj[b].add(a);edges.append([a,b])
edge(0,1);edge(1,2)
for i in range(m):
 center=3+i;edge(0,center)
 for h in range(r):edge(center,3+m+r*i+h)
def add(a,b):return [(a[i]if i<len(a)else 0)+(b[i]if i<len(b)else 0)for i in range(max(len(a),len(b)))]
def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 while len(c)>1 and not c[-1]:c.pop()
 return c
def at(a,k):return a[k]if 0<=k<len(a)else 0
def diff(a,k):return at(a,k+1)-at(a,k)
def dp(v,parent,deleted):
 out=[1];inside=[0,1]
 for u in sorted(adj[v]):
  if u==parent or u in deleted:continue
  a,b=dp(u,v,deleted);out=mul(out,add(a,b));inside=mul(inside,a)
 return out,inside
C,inc=dp(0,-1,set());P=add(C,inc);N=m*r;q=N+1;alpha=len(P)-1
assert n==155 and len(edges)==n-1 and alpha==116
assert inc==[0]+[comb(q,k)for k in range(q+1)]
x=next(k for k in range(len(P))if diff(P,k)<0);p=x+2;j=p-2;delta=q-j
assert (x,p,j,delta)==(55,57,55,60) and 3*p<2*alpha+1 and 2*p<=alpha
leaves=[v for v in range(n)if len(adj[v])==1];flags={}
for v in leaves:
 a,b=dp(0,-1,{v});poly=add(a,b);flags[v]=diff(poly,p)<0
assert len(leaves)==115 and all(flags.values())
# Remove one entire branch, then the root-excluded DP gives G*H_i directly.
deleted={3,*range(3+m,3+m+r)};GH,_=dp(0,-1,deleted);Ti=mul(GH,[2,1]);A=N*Ti[j];D=comb(N,j+1)-comb(N,j);b=len(leaves)
t=F(C[j+1],C[j]);beta=comb(q,x)-comb(q,x-1);rho=F(beta,C[x]);kappa=1-t+t/delta;wrong=rho+F(1,delta);correct=rho+(1-rho)/delta
margin=(delta*C[j]-(delta-1)*C[j+1])*A-b*delta*D*C[j]
assert kappa<wrong and kappa>correct and margin>0
out={'scope':'Independent literal155-vertex tree DP replay of C2-CF-T3 normalization counterexample; wrong auxiliary bound only, primary positive. No formal award.','counts':[0,38,0],'n':n,'edges':edges,'N':N,'q':q,'alpha':alpha,'x':x,'p':p,'j':j,'delta':delta,'leaf_count':len(leaves),'all_actual_leaf_flags_selected':all(flags.values()),'Cj':C[j],'Cj1':C[j+1],'beta_x':beta,'t':str(t),'rho':str(rho),'kappa':str(kappa),'wrong_lower_bound':str(wrong),'correct_lower_bound':str(correct),'A':A,'D':D,'b':b,'primary_margin':margin}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print({'n':n,'wrong_auxiliary_bound_refuted':True,'correct_bound_passes':True,'primary_margin_positive':True})
