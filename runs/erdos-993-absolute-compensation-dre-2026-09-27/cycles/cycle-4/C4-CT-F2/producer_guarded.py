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
def add(a,b):return [at(a,k)+at(b,k) for k in range(max(len(a),len(b)))]
def profile(rs):
 N=sum(rs);Q=prod(rs);C=mul([1,2],Q);P=add(C,[0]+[comb(N+1,k) for k in range(N+2)])
 W=[0];Ais={}
 for r in set(rs):
  rem=rs[:];rem.remove(r)
  base=mul(mul([1,2],BR[r-1]),prod(rem))
  Ai=add(base,[0]+[comb(N,k) for k in range(N+1)])
  Ais[r]=Ai
  W=add(W,[len([x for x in rs if x==r])*r*a for a in Ai])
 x=next(k for k in range(len(P)) if at(P,k+1)<P[k])
 return N,C,P,W,Ais,x
profiles=[]
for m in [1,2,3,4,5,8,12,20,22,38,39,40,69,120,172,266,500]:
 for rs in ([2]*m,[3]*m,[4]*m,([2]*(m//3)+[3]*(m//3)+[4]*(m-2*(m//3)))):
  profiles.append(rs)
profiles += [[2]*38+[4],[2]*100+[3]+[4],[2]+[3]*100+[4],[3]+[4]*20,[2,3,4],[2,2,3,4],[2,2,2,4],[2,2,3,3],[3,3,4,4]]
seen=set();bad=[];rows=[]
for rs in profiles:
 key=tuple(sorted(rs))
 if not rs or key in seen:continue
 seen.add(key);N,C,P,W,Ais,x=profile(rs);fails=[];individual_fails=[];eligible=0
 for p in range(max(1,x+2),N+3):
  if 3*p<2*(N+2)+1 and 2*p<=N+2:
   eligible+=1
   margin=at(C,p)*at(W,p)-at(C,p-1)*at(W,p+1)
   if margin<0:fails.append({'p':p,'margin':margin,'Cpm1':at(C,p-1),'Cp':at(C,p),'Wp':at(W,p),'Wp1':at(W,p+1)})
   for r,Ai in Ais.items():
    im=at(C,p)*at(Ai,p)-at(C,p-1)*at(Ai,p+1)
    if im<0:individual_fails.append({'p':p,'arity':r,'margin':im})
 if fails or individual_fails:bad.append({'rs':rs,'m':len(rs),'N':N,'x':x,'weighted_failures':fails[:2],'individual_failures':individual_fails[:2]})
 rows.append({'m':len(rs),'N':N,'eligible_rows':eligible,'weighted_failures':len(fails),'individual_failures':len(individual_fails)})
out={'scope':'Exact polynomial weighted-tip shifted comparison tested only at actual eligible lower-half p for selected profiles; bounded diagnostics, not proof.','profiles':rows,'failures':bad}
open(__file__.replace('.py','.json'),'w').write(json.dumps(out,indent=2))
print(json.dumps({'profiles':len(rows),'eligible_rows':sum(r['eligible_rows'] for r in rows),'failures':bad},indent=2))
