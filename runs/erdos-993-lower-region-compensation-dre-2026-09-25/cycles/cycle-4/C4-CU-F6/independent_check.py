from math import comb
import json

def add(a,b):
 z=[0]*max(len(a),len(b))
 for i,v in enumerate(a): z[i]+=v
 for i,v in enumerate(b): z[i]+=v
 return z

def mul(a,b):
 z=[0]*(len(a)+len(b)-1)
 for i,v in enumerate(a):
  for j,w in enumerate(b): z[i+j]+=v*w
 return z

def binompoly(m): return [comb(m,j) for j in range(m+1)]
def shift(a): return [0]+a
def delta(a,r): return (a[r+1] if r+1<len(a) else 0)-(a[r] if r<len(a) else 0)
def parts(n,c,lo=1):
 if c==1:
  if n>=lo: yield (n,)
 else:
  for a in range(lo,n//c+1):
   for tail in parts(n-a,c-1,a): yield (a,)+tail

def P(ms):
 L=sum(ms); q=[1]
 for m in ms: q=mul(q,add(binompoly(m),[0,1]))
 return add(q,shift(binompoly(L)))

def witness(ms,p):
 L=sum(ms); fac=[add(binompoly(m),[0,1]) for m in ms]
 allprod=[1]
 for f in fac: allprod=mul(allprod,f)
 tree=add(allprod,shift(binompoly(L)))
 alpha=len(tree)-1
 x=next(r for r in range(alpha+2) if delta(tree,r)<0)
 # Explicit original graph: root=0, centers 1..6; append leaves.
 edges=[]; leaf_support={}; adj={i:set() for i in range(7)}; v=7
 for j,m in enumerate(ms):
  c=j+1; edges.append((0,c)); adj[0].add(c); adj[c].add(0)
  for _ in range(m):
   leaf=v; v+=1; edges.append((c,leaf)); adj[c].add(leaf); adj[leaf]={c}; leaf_support[leaf]=c
 leaves=sorted(u for u,a in adj.items() if len(a)==1)
 rows=[]
 for leaf in leaves:
  c=leaf_support[leaf]; j=c-1; m=ms[j]
  rest=[1]
  for h,f in enumerate(fac):
   if h!=j: rest=mul(rest,f)
  # T-v: branch j has m-1 remaining pendant vertices.
  fv=add(mul(rest,add(binompoly(m-1),[0,1])),shift(binompoly(L-1)))
  d=delta(fv,p)
  if d<0:
   # H=T-{v,c}; other branch product and m-1 isolated leaves.
   H=add(mul(rest,binompoly(m-1)),shift(binompoly(L-1)))
   # R=T-N[c]: root, c, and all m leaves deleted; other branches remain.
   R=rest
   rows.append({'leaf':leaf,'support':c,'delta_p_deleted_leaf':d,'Hdelta':delta(H,p-1),'Rdelta':delta(R,p-1),'term':delta(H,p-1)-delta(R,p-1)})
 return {'profile':ms,'order':v,'edge_count':len(edges),'root_degree':len(adj[0]),'degree_one_vertices':leaves,'polynomial':tree,'alpha':alpha,'x':x,'delta_x':delta(tree,x),'terminal_delta':delta(tree,alpha+1),'lower_guard':3*p<2*alpha+1,'rank_guard':x+2<=p,'selected':rows,'S':sum(r['term'] for r in rows)}

counts={}; eligibility={}; nfirst={}
for p in range(10,14):
 count=eligible=lower=0
 for c in range(1,7):
  for ms in parts(2*p+3-c,c):
   count+=1; q=P(ms); a=len(q)-1
   x=next(r for r in range(a+2) if delta(q,r)<0)
   lower+=int(3*p<2*a+1)
   eligible+=int(x+2<=p and 3*p<2*a+1)
 counts[p]=count; eligibility[p]=eligible; nfirst[p]=lower
w=witness((2,3,3,3,3,3),10)
print(json.dumps({'candidate_counts':counts,'strict_lower_counts':nfirst,'eligible_counts':eligibility,'witness':w},indent=2))
