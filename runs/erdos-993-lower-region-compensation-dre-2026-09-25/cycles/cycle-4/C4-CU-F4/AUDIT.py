import sys, random, json
from pathlib import Path
from itertools import combinations
sys.path.insert(0,str(Path(__file__).parent))
import REPLAY as prod
# Check the reporting boundary: count every parameter passing rank guards,
# including the case F is empty.
rng=random.Random(20260926)
guard_rows=empty_selector=[]
for n in range(16,61):
 for sample in range(40):
  code=tuple(rng.randrange(n) for _ in range(n-2))
  edges=prod.tree_edges(n,code); adj=prod.adjacency(n,edges)
  P=prod.forest_poly(n,adj); a=len(P)-1; x=prod.first_descent(P)
  if x is None: continue
  leaves=[v for v in range(n) if adj[v].bit_count()==1]
  for p in range(x+2,(2*a)//3+1):
   guard_rows.append((n,sample,p))
   F=[v for v in leaves if prod.delta(prod.forest_poly(n,adj,1<<v),p)<0]
   if not F: empty_selector.append((n,sample,p,x,a))
print('sampled_guard_parameter_rows',len(guard_rows))
print('empty_selector_guard_rows',len(empty_selector),'examples',empty_selector[:8])
# Direct literal-subset check on first eligible order-17 fixture, no tree DP.
ev=json.loads((Path(__file__).parent/'SOURCE_EVIDENCE.json').read_text())
row=next(r for r in ev['sample_rows'] if r['n']==17)
n=row['n']; edges=[tuple(e) for e in row['edges']]
adj=[0]*n
for u,v in edges: adj[u]|=1<<v; adj[v]|=1<<u

def literal_poly(removed=0):
 out=[0]*(n+1); kept=((1<<n)-1)&~removed; sub=kept
 while True:
  ok=True; bits=sub
  while bits:
   b=bits&-bits; v=b.bit_length()-1; bits-=b
   if adj[v]&sub: ok=False; break
  if ok: out[sub.bit_count()]+=1
  if sub==0: break
  sub=(sub-1)&kept
 while len(out)>1 and out[-1]==0: out.pop()
 return out
P=literal_poly(); leaves=[v for v in range(n) if adj[v].bit_count()==1]
def d(poly,j): return (poly[j+1] if j+1<len(poly) else 0)-(poly[j] if j<len(poly) else 0)
x=next(j for j in range(len(P)) if d(P,j)<0)
a=len(P)-1;p=row['p']; F=[]; terms=[]
for v in leaves:
 s=(adj[v]&-adj[v]).bit_length()-1
 pv=literal_poly(1<<v)
 if d(pv,p)<0:
  F.append(v); H=literal_poly((1<<v)|(1<<s)); R=literal_poly((1<<s)|adj[s])
  terms.append((v,s,d(H,p-1),d(R,p-1),d(H,p-1)-d(R,p-1),d(pv,p)))
print('literal_fixture_match_poly',P==row['tree_polynomial'],'x_a_p',x,a,p,'guards',p>=x+2,3*p<2*a+1)
print('literal_fixture_leaves',leaves,'selector',F,'source_F_match',F==row['F'])
print('literal_fixture_terms',terms,'sum',sum(t[4] for t in terms),'source_S',row['S'])
print('literal_fixture_poly',P)
