from math import comb
from pathlib import Path
import json
BR={1:[1,2],2:[1,3,1],3:[1,4,3,1],4:[1,5,6,4,1]}
def at(a,k):return a[k]if 0<=k<len(a)else 0
def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,u in enumerate(a):
  for j,v in enumerate(b):c[i+j]+=u*v
 return c
def prod(rs):
 q=[1]
 for r in rs:q=mul(q,BR[r])
 return q
profiles=[(0,22,0),(0,38,0),(0,0,39),(0,0,40),(0,0,69),(0,0,120),(0,0,172),(0,0,266),(0,0,500),(0,500,0),(500,0,0),(1,1,30),(100,1,1),(1,100,1),(1,1,100),(120,80,60),(60,20,300),(1,1,498)]
fail=[];rows=[]
for a2,a3,a4 in profiles:
 rs=[2]*a2+[3]*a3+[4]*a4;m=len(rs);N=sum(rs);Q=prod(rs);C=mul([1,2],Q);P=[at(C,k)+(comb(N+1,k-1)if 1<=k<=N+2 else 0)for k in range(N+3)]
 x=next(k for k in range(len(P))if at(P,k+1)<P[k]);polys={0:mul([1,1],Q)}
 for r in set(rs):
  rem=rs[:];rem.remove(r);polys[r]=mul(mul([1,2],BR[r-1]),prod(rem))
 tested=0;bad=[]
 for r,f in polys.items():
  A=[at(f,k)+(comb(N,k-1)if 1<=k<=N+1 else 0)for k in range(N+2)]
  for k in range(N+2):
   tested+=1;gap=P[k+1]*at(A,k)-P[k]*at(A,k+1)
   if gap<0:
    bad.append({'branch':r,'k':k,'gap':gap,'P_k':P[k],'P_k1':P[k+1],'A_k':at(A,k),'A_k1':at(A,k+1),'actual_eligible_at_k':x+2<=k and 3*k<2*(N+2)+1 and 2*k<=N+2})
    break
 row={'counts':[a2,a3,a4],'m':m,'N':N,'n':N+m+3,'x':x,'tested_adjacent_pairs':tested,'failures':bad};rows.append(row)
 if bad:fail.append(row)
 print(m,N,'failures',len(bad),flush=True)
out={'scope':'Controller-private fixed-profile likelihood-ratio diagnostic. All adjacent ranks checked on18 prescribed controls; no universal or formal award.','rows':rows,'failure_profiles':len(fail)}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n')
