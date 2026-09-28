from pathlib import Path
from math import comb,gcd
from hashlib import sha256
import json
MAX_M=69
BR={1:[1,2],2:[1,3,1],3:[1,4,3,1],4:[1,5,6,4,1]}
GF={2:[1,2],3:[2,5,2],4:[3,9,7,2]}
def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for j,v in enumerate(b):
  for i,u in enumerate(a):c[i+j]+=u*v
 return c
def at(a,k):return a[k] if 0<=k<len(a) else 0
def diff(a,k):return at(a,k+1)-at(a,k)
def coeffmul(a,b,k):return sum(v*at(a,k-s)for s,v in enumerate(b))
def divide(a,b):
 h=[]
 for k in range(len(a)-len(b)+1):h.append(a[k]-sum(b[s]*at(h,k-s)for s in range(1,len(b))))
 for k in range(len(a)-len(b)+1,len(a)):assert coeffmul(h,b,k)==a[k]
 assert all(v>=0 for v in h)
 return h
def ratio_record(num,den,meta,old):
 if old is not None and num*int(old['denominator'])>=int(old['numerator'])*den:return old
 g=gcd(num,den);return {'numerator':str(num//g),'denominator':str(den//g),**meta}
rows={m:{'m':m,'profiles':0,'eligible_rows':0,'endpoint_only_rows':0,'not_all_selected_rows':0,'MASS_failures':0,'primary_failures':0,'local_failures':0,'min_MASS_ratio':None,'min_primary_ratio':None,'min_local_ratio':None}for m in range(1,MAX_M+1)}
failures=[];digest=sha256();q2=[1]
for a2 in range(MAX_M+1):
 q23=q2[:]
 for a3 in range(MAX_M-a2+1):
  Q=q23[:]
  for a4 in range(MAX_M-a2-a3+1):
   counts=(a2,a3,a4);m=sum(counts)
   if m:
    R=rows[m];R['profiles']+=1;N=2*a2+3*a3+4*a4;alpha=N+2;q=N+1
    LN=[comb(N,k)for k in range(N+1)];Lq=[comb(q,k)for k in range(q+1)];C=mul(Q,[1,2]);P=[at(C,k)+at(Lq,k-1)for k in range(q+2)]
    x=next(k for k in range(len(P))if diff(P,k)<0)
    ps=[p for p in range(x+2,alpha//2+1)if 3*p<2*alpha+1]
    if ps:
     A0=[coeffmul(Q,[1,1],k)+at(LN,k-1)for k in range(N+2)]
     hs={r:divide(Q,BR[r])for r,c in zip((2,3,4),counts)if c}
     small={r:mul([1,2],BR[r-1])for r in hs}
     for p in ps:
      j=p-2;delta=q-j;D=at(LN,j+1)-at(LN,j);assert D>0 and 5*j>2*N-1 and 2*j<=N-2
      e0=diff(A0,p)<0;flags={r:(coeffmul(h,small[r],p+1)-coeffmul(h,small[r],p)+at(LN,p)-at(LN,p-1)<0)for r,h in hs.items()}
      ts={r:coeffmul(h,GF[r],j)for r,h in hs.items()};b=int(e0)+sum(r*counts[r-2]*int(flags[r])for r in hs);A=sum(r*counts[r-2]*int(flags[r])*ts[r]for r in hs)
      mass=A-b*delta*D;lhs=(delta*C[j]-(delta-1)*C[j+1])*A;rhs=b*delta*D*C[j];primary=lhs-rhs
      meta={'counts':list(counts),'N':N,'x':x,'p':p};R['eligible_rows']+=1;R['endpoint_only_rows']+=int(e0 and not any(flags.values()));R['not_all_selected_rows']+=int(not(e0 and all(flags.values())))
      R['MASS_failures']+=int(mass<0);R['primary_failures']+=int(primary<0)
      if b:R['min_MASS_ratio']=ratio_record(A,b*delta*D,meta,R['min_MASS_ratio']);R['min_primary_ratio']=ratio_record(lhs,rhs,meta,R['min_primary_ratio'])
      for r,t in ts.items():
       R['local_failures']+=int(2*t<3*delta*D);R['min_local_ratio']=ratio_record(2*t,3*delta*D,{**meta,'r':r},R['min_local_ratio'])
      record={**meta,'e0':int(e0),'flags':flags,'b':b,'A':A,'D':D,'Cj':C[j],'Cj1':C[j+1],'MASS_margin':mass,'primary_margin':primary,'local_coefficients':ts}
      digest.update((json.dumps(record,sort_keys=True,separators=(',',':'))+'\n').encode())
      if mass<0 or primary<0:failures.append(record)
   if a4<MAX_M-a2-a3:Q=mul(Q,BR[4])
  if a3<MAX_M-a2:q23=mul(q23,BR[3])
 if a2<MAX_M:q2=mul(q2,BR[2])
 print(json.dumps({'completed_a2':a2,'max_a2':MAX_M}),flush=True)
out={'scope':'Exact bounded controller instrument check; no formal or universal award.','protocol':'C3-small-prefix-protocol.md','max_m':MAX_M,'profile_count':sum(r['profiles']for r in rows.values()),'eligible_row_count':sum(r['eligible_rows']for r in rows.values()),'row_stream_sha256':digest.hexdigest(),'layers':list(rows.values()),'failures':failures}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n')
