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
fail=[];tested=0
for m in range(1,70):
 for a2 in range(m+1):
  for a3 in range(m-a2+1):
   a4=m-a2-a3;rs=[2]*a2+[3]*a3+[4]*a4;N=sum(rs);Q=prod(rs);C=mul([1,2],Q);P=[at(C,k)+(comb(N+1,k-1)if 1<=k<=N+2 else 0)for k in range(N+3)]
   polys={0:mul([1,1],Q)}
   for r in set(rs):
    rem=rs[:];rem.remove(r);polys[r]=mul(mul([1,2],BR[r-1]),prod(rem))
   for r,f in polys.items():
    A=[at(f,k)+(comb(N,k-1)if 1<=k<=N+1 else 0)for k in range(N+2)]
    for k in range(1,N+2):
     tested+=1;gap=at(C,k)*at(A,k)-at(C,k-1)*at(A,k+1)
     if gap<0:
      fail.append({'m':m,'counts':[a2,a3,a4],'N':N,'branch':r,'k':k,'gap':gap,'C_k':at(C,k),'C_kminus1':at(C,k-1),'A_k':at(A,k),'A_k1':at(A,k+1)})
      break
   if fail:break
  if fail:break
 if fail:break
out={'scope':'Controller-private bounded shifted C-to-deletion ratio diagnostic, not theorem or registered award. All ranks, first found obstruction only; does not assert eligible selector failure.','max_m':69,'tested_adjacent_pairs':tested,'failures':fail}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
