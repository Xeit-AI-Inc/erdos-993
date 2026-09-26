import json
from pathlib import Path
from collections import Counter
from itertools import combinations
base=Path(__file__).resolve().parents[2]
old=json.loads((base/'cycles/cycle-6/C6-F5/EVIDENCE.json').read_text())
new=json.loads((base/'cycles/cycle-6/C6-F5/C6-F5-ROOT-CORRECTED-FLOW-EVIDENCE.json').read_text())
results=[]
for source,record in [('old',old),('corrected',new)]:
 for item in record['profiles']:
  n=item['n']; edges=[tuple(e) for e in item['tree_edges']]
  assert len(edges)==n-1
  adj=[set() for _ in range(n)]
  for u,v in edges: adj[u].add(v);adj[v].add(u)
  def independent(mask):
   return all(not(mask>>u&1 and mask>>v&1) for u,v in edges)
  masks=[q for q in range(1<<n) if independent(q)]
  bins=Counter(q.bit_count() for q in masks)
  poly=[bins[k] for k in range(max(bins)+1)]
  assert poly==item['tree_poly']
  x=next(k for k in range(len(poly)) if (poly[k+1] if k+1<len(poly) else 0)<poly[k])
  assert x==item['x']
  assert max(bins)==item['alpha']
  for row in item['eligible_ranks']:
   p=row['p']; assert x+2<=p and 3*p<2*item['alpha']+1
   leaves=[v for v in range(n) if len(adj[v])==1]
   def count(vertices,k):
    vs=set(vertices)
    return sum(q.bit_count()==k and all(not(q>>v&1) for v in range(n) if v not in vs) for q in masks)
   def delta(vertices,k):
    return count(vertices,k+1)-count(vertices,k)
   favorable={v:delta(set(range(n))-{v},p) for v in leaves}
   assert {int(k):v for k,v in row['favorable_leaf_delta_p'].items()}==favorable
   F=sorted(v for v in leaves if favorable[v]<0)
   assert F==row['F']
   terms=[]
   for v in F:
    s=next(iter(adj[v]))
    H=set(range(n))-{v,s}
    R=set(range(n))-{s}-adj[s]
    terms.append({'leaf':v,'support':s,'term':delta(H,p-1)-delta(R,p-1)})
   assert terms==row['terms']
   S=sum(t['term'] for t in terms)
   assert S==row['S']
   upper=[q for q in masks if q.bit_count()==p+1]
   lower=[q for q in masks if q.bit_count()==p]
   assert len(upper)==row['upper_set_count'] and len(lower)==row['lower_set_count']
   lower_set=set(lower)
   relation_count=0
   for u in upper:
    neighbors={u&~(1<<v) for v in range(n) if u>>v&1}
    for t in range(n):
     if u>>t&1: continue
     selected_neighbors=sum(1<<v for v in adj[t] if u>>v&1)
     if selected_neighbors.bit_count()==2:
      neighbors.add((u&~selected_neighbors)|(1<<t))
    relation_count+=len(neighbors&lower_set)
   assert relation_count==row['adjacency_arc_count']
   def weight(q,active):
    return sum(bool(q>>v&1) and (not active or any(q>>t&1 for t in adj[next(iter(adj[v]))] if t!=v)) for v in F)
   supply=sum(weight(q,source=='corrected') for q in upper)
   capacity=sum(weight(q,source=='corrected') for q in lower)
   assert supply==row['upper_supply'] and capacity==row['lower_capacity']
   outflow=Counter();inflow=Counter()
   assert len(row['positive_flow_arcs'])==row['positive_flow_arc_count']
   seen=set()
   for u,l,amount in row['positive_flow_arcs']:
    assert amount>0 and (u,l) not in seen
    seen.add((u,l));assert u in upper and l in lower
    removed=u&~l;added=l&~u
    if added==0:
     assert removed.bit_count()==1
    else:
     assert added.bit_count()==1 and removed.bit_count()==2
     t=added.bit_length()-1
     assert removed==sum(1<<w for w in adj[t] if u>>w&1)
    outflow[u]+=amount;inflow[l]+=amount
   assert all(outflow[u]<=weight(u,source=='corrected') for u in upper)
   assert all(inflow[l]<=weight(l,source=='corrected') for l in lower)
   assert sum(outflow.values())==row['flow']==supply
   results.append({'source':source,'profile':item['profile'],'n':n,'p':p,'alpha':item['alpha'],'x':x,'leaves':len(leaves),'F':F,'S':S,'supply':supply,'capacity':capacity,'difference':supply-capacity,'flow':row['flow'],'relation_arcs_checked':relation_count,'positive_arcs_checked':len(seen),'matches_S':supply-capacity==S})
out=Path(__file__).with_name('FLOW-VERIFICATION.json')
out.write_text(json.dumps(results,indent=2)+'\n')
print(out.read_text())
