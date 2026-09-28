from pathlib import Path
from math import comb
import json

def at(a,k):return a[k]if 0<=k<len(a)else 0
def diff(a,k):return at(a,k+1)-at(a,k)
def add(a,b):return [at(a,k)+at(b,k)for k in range(max(len(a),len(b)))]
def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 while len(c)>1 and not c[-1]:c.pop()
 return c
def choose(n,k):return comb(n,k)if 0<=k<=n else 0
rows=[]
for m in (172,173):
 r=4;N=r*m;n=N+m+3;q=N+1;adj=[set()for _ in range(n)];edges=[]
 def edge(a,b):adj[a].add(b);adj[b].add(a);edges.append([a,b])
 edge(0,1);edge(1,2)
 for i in range(m):
  edge(0,3+i)
  for h in range(r):edge(3+i,3+m+r*i+h)
 def dp(v,parent,deleted):
  out=[1];inside=[0,1]
  for u in sorted(adj[v]):
   if u==parent or u in deleted:continue
   a,b=dp(u,v,deleted);out=mul(out,add(a,b));inside=mul(inside,a)
  return out,inside
 C,inc=dp(0,-1,set());P=add(C,inc);alpha=len(P)-1;x=next(k for k in range(len(P))if diff(P,k)<0);p=x+2;j=p-2;delta=q-j
 assert len(edges)==n-1 and alpha==N+2 and 3*p<2*alpha+1 and 2*p<=alpha
 leaves=[v for v in range(n)if len(adj[v])==1];assert len(leaves)==N+1
 slopes=[]
 for v in (2,3+m):
  a,b=dp(0,-1,{v});slopes.append(diff(add(a,b),p))
 assert all(s<0 for s in slopes)
 # The explicit graph has automorphisms permuting the m branches and the 4 tips in each branch.
 # These fix the path, so the representative private-tip slope applies to all N private tips.
 deleted={3,*range(3+m,3+m+r)};GH,_=dp(0,-1,deleted);Ti=mul(GH,[3,3,1]);D=choose(N,j+1)-choose(N,j);b=N+1
 GF=[3,9,7,2];U=sum(c*(choose(N-4,j-s)+(m-1)*choose(N-8,j-1-s))for s,c in enumerate(GF))
 A=N*Ti[j];Alower=N*U;factor=delta*C[j]-(delta-1)*C[j+1];full=factor*A-b*delta*D*C[j];truncated=factor*Alower-b*delta*D*C[j]
 assert truncated<0<full and A>b*delta*D
 rows.append({'counts':[0,0,m],'n':n,'edges':edges,'N':N,'alpha':alpha,'x':x,'p':p,'j':j,'delta':delta,'all_actual_original_leaf_flags_on_by_two_DP_types_and_explicit_symmetry':True,'endpoint_and_tip_slopes':slopes,'b':b,'Cj':C[j],'Cj1':C[j+1],'D':D,'Ti':Ti[j],'U':U,'A':A,'A_lower':Alower,'truncated_primary_margin':truncated,'full_primary_margin':full,'MASS_margin':A-b*delta*D})
out={'scope':'Independent literal tree DP check of two homogeneous auxiliary truncation counterexamples; neither is a full payment counterexample. n863 is a smaller verified witness than n868, with no global minimality claim. No formal award.','rows':rows}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print([{'m':r['counts'][2],'n':r['n'],'x':r['x'],'p':r['p'],'truncation_negative':True,'full_primary_positive':True}for r in rows])
