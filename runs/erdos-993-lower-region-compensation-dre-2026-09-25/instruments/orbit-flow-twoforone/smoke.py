from pathlib import Path
import json
import run

def state(A,m):
 root=int(0 in A);special=1 if 1 in A else 2 if 2 in A else 0
 counts=[0]*5
 for b in range(m):
  center=3+4*b
  count=sum(v in A for v in range(center+1,center+4))
  typ=1 if center in A else 0 if count==0 else count+1
  counts[typ]+=1
 return (root,special,*counts)

checks=[]
for m in (1,2,3):
 T,_=run.O.t_family(m);n=len(T.vertices);observed={};multiplicity={}
 for mask in range(1<<n):
  A={v for v in range(n) if mask>>v&1}
  if not T.is_independent(A):continue
  s=state(A,m);multiplicity[s]=multiplicity.get(s,0)+1
  neigh={state(A-{v},m) for v in A}
  for v in T.vertices-A:
   occupied=T.adjacency[v]&A
   if len(occupied)==2:
    D=(A-set(occupied))|{v}
    assert len(D)==len(A)-1 and T.is_independent(D)
    neigh.add(state(D,m))
  observed.setdefault(s,set()).update(neigh)
 for s,nbr in observed.items():assert nbr==run.neighbors(s),(m,s,nbr,run.neighbors(s))
 for rank in range(n+1):
  for s,mult in run.layer(m,rank).items():assert multiplicity[s]==mult
 checks.append({'m':m,'independent_sets':sum(multiplicity.values()),'orbits':len(observed),'all_neighbor_orbits_match':True,'all_multiplicities_match':True})
P=Path(__file__).resolve().parent
with (P/'SMOKE.json').open('x') as f:json.dump({'bounded_checks':checks},f,indent=2);f.write('\n')
print(checks)
