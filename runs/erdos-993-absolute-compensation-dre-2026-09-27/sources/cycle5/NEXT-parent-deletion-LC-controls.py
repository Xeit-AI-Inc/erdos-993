from pathlib import Path
from math import comb
import json
BR={1:[1,2],2:[1,3,1],3:[1,4,3,1],4:[1,5,6,4,1]}
def at(a,k):return a[k] if 0<=k<len(a) else 0
def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,u in enumerate(a):
  for j,v in enumerate(b):c[i+j]+=u*v
 return c
def prod(rs):
 q=[1]
 for r in rs:q=mul(q,BR[r])
 return q
profiles=[]
for m in [1,2,10,38,70,120,150,172,300]:
 for a in [(m,0,0),(0,m,0),(0,0,m),(m-1,0,1),(1,0,m-1),(m//3,m//3,m-2*(m//3))]:
  if a not in profiles:profiles.append(a)
rows=[]
for counts in profiles:
 rs=[r for r,a in zip([2,3,4],counts) for _ in range(a)];N=sum(rs);Q=prod(rs);C=mul([1,2],Q);P=[at(C,k)+(comb(N+1,k-1) if 1<=k<=N+2 else 0) for k in range(N+3)]
 polys={'P':P};H={}
 for r in set(rs):
  rem=rs[:];rem.remove(r);H[r]=prod(rem);D=mul(mul([1,2],BR[r-1]),H[r]);polys['A'+str(r)]=[at(D,k)+(comb(N,k-1) if 1<=k<=N+1 else 0) for k in range(N+2)]
 lc=[];lr=[]
 for name,A in polys.items():
  for k in range(1,len(A)-1):
   gap=A[k]*A[k]-A[k-1]*A[k+1]
   if gap<0:lc.append({'poly':name,'k':k,'gap':str(gap)});break
  if name!='P':
   for k in range(N+2):
    gap=P[k+1]*at(A,k)-P[k]*at(A,k+1)
    if gap<0:lr.append({'poly':name,'k':k,'gap':str(gap)});break
 rows.append({'counts':counts,'N':N,'n':N+len(rs)+3,'lc_failures':lc,'ordinary_parent_deletion_lr_failures':lr})
out={'scope':'Private future-cycle diagnostic only, not current-cycle input, no theorem award. Log-concavity explored only as possible route to existing OPEN parent/deletion LR; all ranks tested for each explicitly listed profile. Not exhaustive.','profiles':len(rows),'rows':rows}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({'profiles':len(rows),'lc_failures':[x for x in rows if x['lc_failures']],'lr_failure_profiles':sum(bool(x['ordinary_parent_deletion_lr_failures']) for x in rows)}))
