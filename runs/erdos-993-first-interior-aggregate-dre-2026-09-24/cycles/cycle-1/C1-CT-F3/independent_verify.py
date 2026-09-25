"""Second evaluator: independent rooted recurrence from explicit edges."""
import json
from pathlib import Path

def add(a,b):
 c=[0]*max(len(a),len(b))
 for i,x in enumerate(a): c[i]+=x
 for i,x in enumerate(b): c[i]+=x
 while len(c)>1 and c[-1]==0:c.pop()
 return c

def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b): c[i+j]+=x*y
 while len(c)>1 and c[-1]==0:c.pop()
 return c

def poly(vertices, edges):
 adj={v:set() for v in vertices}
 for u,v in edges:adj[u].add(v);adj[v].add(u)
 seen=set(); out=[1]
 def rec(v,parent):
  seen.add(v); no=[1]; yes=[0,1]
  for w in sorted(adj[v]):
   if w==parent:continue
   a,b=rec(w,v); no=mul(no,add(a,b));yes=mul(yes,a)
  return no,yes
 for v in vertices:
  if v not in seen:
   a,b=rec(v,None);out=mul(out,add(a,b))
 return out

def coef(p,k):return p[k] if 0<=k<len(p) else 0
def delta(p,k):return coef(p,k+1)-coef(p,k)
def main():
 data=json.load(open('C1-F3-fresh-examples.json'))
 checks=[]
 for r in data:
  vs=range(r['vertices']); E=[tuple(e) for e in r['edges']]; full=poly(vs,E); a=len(full)-1; p=a-2
  adj={v:set() for v in vs}
  for u,v in E:adj[u].add(v);adj[v].add(u)
  leaves=sorted(v for v in vs if len(adj[v])==1)
  F=[]; summands=[]
  for v in leaves:
   edges1=[e for e in E if v not in e]; vert1=[u for u in vs if u!=v]
   pv=poly(vert1,edges1)
   if delta(pv,p)<0:
    F.append(v); s=next(iter(adj[v])); closed={s}|adj[s]
    Hverts=[u for u in vs if u not in {v,s}]
    Rverts=[u for u in vs if u not in closed]
    Hedges=[e for e in E if e[0] in Hverts and e[1] in Hverts]
    Redges=[e for e in E if e[0] in Rverts and e[1] in Rverts]
    hp=poly(Hverts,Hedges); rp=poly(Rverts,Redges); g=delta(hp,p-1)-delta(rp,p-1)
    summands.append({'leaf':v,'support':s,'delta_p_T_minus_leaf':delta(pv,p),'delta_pminus1_H':delta(hp,p-1),'delta_pminus1_R':delta(rp,p-1),'g':g})
  x=next((k for k in range(len(full)+1) if delta(full,k)<0),None)
  checks.append({'label':r['label'],'order':len(list(vs)),'alpha':a,'p':p,'x':x,'eligible':x is not None and x+2<=p,'leaves':leaves,'favorable_leaves':F,'summands':summands,'S':sum(q['g'] for q in summands),'polynomial':full})
 with open('C1-F3-independent-checks.json','w') as f:json.dump(checks,f,indent=2)
 print('independent evaluations',len(checks),'all eligible',all(x['eligible'] for x in checks),'matches aggregates',all(x['S']==r['aggregate'] for x,r in zip(checks,data)),'all selected lists match',all(x['favorable_leaves']==r['favorable_leaves'] for x,r in zip(checks,data)))
if __name__=='__main__':main()
