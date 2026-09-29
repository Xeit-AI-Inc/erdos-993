from pathlib import Path
from math import comb
import json

def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c

def at(a,k):return a[k]if 0<=k<len(a)else 0

def B(r):return [comb(r,k)+(k==1)for k in range(r+1)]
profiles=[]
for m in [22,24,40,69,120,173,300]:
 for c in [(m,0,0),(0,m,0),(0,0,m),(1,1,m-2),(m-1,0,1),(0,m-1,1),(m//3,m//3,m-2*(m//3))]:
  if c not in profiles:profiles.append(c)
rows=[]
for counts in profiles:
 N=sum(r*n for r,n in zip([2,3,4],counts));h=1+sum(r*n for r,n in zip([2,4,7],counts));C=[1,2]
 for r,n in zip([2,3,4],counts):
  for _ in range(n):C=mul(C,B(r))
 P=[at(C,k)+(comb(N+1,k-1)if 1<=k<=N+2 else 0)for k in range(N+3)]
 x=next(k for k in range(len(P))if at(P,k+1)<at(P,k))
 tests=0;fail=[];coarse_eligible_fail=[]
 for r,n in zip([2,3,4],counts):
  if not n:continue
  V=[1,2]
  for s,ns in zip([2,3,4],counts):
   for _ in range(ns-(s==r)):V=mul(V,B(s))
  U=mul(V,B(r-1))
  for k in range(1,(N+2)//2+1):
   E=comb(N,k-1);Ep=comb(N,k)
   margin=(h+1)*at(U,k)*at(C,k)+(k+1)*(h-k+1)*(E*at(C,k)-Ep*at(C,k-1));tests+=1
   if margin<0:fail.append({'r':r,'k':k,'margin':str(margin)})
   coarse=2*(N+2-k)*(h+1)*at(U,k)-E*(N-k-1)*(k+1)*(h-k+1)
   if x+2<=k and 3*k<2*(N+2)+1 and coarse<0:coarse_eligible_fail.append({'r':r,'p':k,'margin':str(coarse)})
 rows.append({'counts':counts,'N':N,'n':N+sum(counts)+3,'h':h,'x':x,'tests':tests,'exact_ratio_failures':fail,'crude_ratio_actual_eligible_failures':coarse_eligible_fail})
out={'scope':'Private deterministic larger controls for proposed ULC quantitative surplus. Only49specifiedprofiles through300branches, not an exhaustive range or a theorem. Exact-ratio condition is stronger than the actual shifted comparison; crude simplification is a distinct condition.','rows':rows}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({'profiles':len(rows),'tests':sum(x['tests']for x in rows),'exact_failures':sum(len(x['exact_ratio_failures'])for x in rows),'coarse_eligible_failures':sum(len(x['crude_ratio_actual_eligible_failures'])for x in rows)}))
