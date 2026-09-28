from pathlib import Path
from fractions import Fraction as F
from math import comb
import json
B={2:[1,3,1],3:[1,4,3,1],4:[1,5,6,4,1]}
def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c
def at(a,k):return a[k] if 0<=k<len(a)else 0
profiles=set()
for a in range(11):
 for b in range(11-a):
  for c in range(11-a-b):
   if a+b+c:profiles.add((a,b,c))
for m in (11,20,30,38,50,69,70,100,120,173,238,266):
 for r in range(3):
  cs=[0,0,0];cs[r]=m;profiles.add(tuple(cs))
 profiles.add((m//3,m//3,m-2*(m//3)))
rows=[]
for a,b,c in sorted(profiles):
 N=2*a+3*b+4*c;q=N+1;Q=[1]
 for r,count in zip((2,3,4),(a,b,c)):
  for _ in range(count):Q=mul(Q,B[r])
 C=mul(Q,[1,2]);P=[at(C,k)+(comb(q,k-1)if 1<=k<=q+1 else 0)for k in range(q+2)]
 h=F(2*a,3)+F(b,2)
 residual=[5*(k+1)*at(P,k+1)+(4*k-4*q+h)*P[k]for k in range(len(P))]
 assert all(v>=0 for v in residual),(a,b,c)
 drops=[k for k in range(len(P))if at(P,k+1)<P[k]]
 assert all(54*k>=24*N-4*a-3*b-5 for k in drops)
 rows.append({'counts':[a,b,c],'N':N,'first_descent':drops[0],'all_drop_count':len(drops),'minimum_residual':str(min(residual))})
out={'scope':'Bounded exact test of unreviewed profile-sensitive differential certificate; all strict descents tested on each listed profile, no award.','profile_count':len(rows),'rows':rows}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print({'profiles':len(rows),'all_pass':True})
