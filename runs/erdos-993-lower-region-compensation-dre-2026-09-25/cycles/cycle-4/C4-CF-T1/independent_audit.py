import json,itertools
EDGES=[[0,1],[3,2],[2,4],[4,17],[5,10],[6,19],[10,18],[12,7],[14,11],[11,13],[15,8],[17,9],[18,19],[19,13],[13,7],[20,8],[8,9],[9,1],[21,1],[22,1],[1,7],[7,16],[16,23]]
n=24
adj=[set() for _ in range(n)]
parent=list(range(n))
def find(a):
 while parent[a]!=a: parent[a]=parent[parent[a]];a=parent[a]
 return a
for a,b in EDGES:
 assert b not in adj[a]
 assert find(a)!=find(b)
 parent[find(a)]=find(b);adj[a].add(b);adj[b].add(a)
assert len(EDGES)==n-1 and len({find(i) for i in range(n)})==1

def forest_poly(mask):
 seen=set(); total=[1]
 for r in range(n):
  if not mask>>r&1 or r in seen: continue
  # root this component and recursively combine child-excluded/included states
  def rooted(v,p):
   seen.add(v); f0=[1]; f1=[0,1]
   for c in adj[v]:
    if c==p or not(mask>>c&1): continue
    c0,c1=rooted(c,v); ct=add(c0,c1)
    f0=mul(f0,ct); f1=mul(f1,c0)
   return f0,f1
  x,y=rooted(r,-1); total=mul(total,add(x,y))
 return total
def add(a,b):
 z=[0]*max(len(a),len(b))
 for i,v in enumerate(a):z[i]+=v
 for i,v in enumerate(b):z[i]+=v
 while len(z)>1 and z[-1]==0:z.pop()
 return z
def mul(a,b):
 z=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):z[i+j]+=x*y
 return z
full=(1<<n)-1
def coeff(poly,j): return poly[j] if 0<=j<len(poly) else 0
it=forest_poly(full);alpha=len(it)-1
deltas=[coeff(it,j+1)-coeff(it,j) for j in range(alpha+1)]
x=next(j for j,d in enumerate(deltas) if d<0)
leaves=[v for v in range(n) if len(adj[v])==1]
rows=[]
for v in leaves:
 s=next(iter(adj[v]));tv=forest_poly(full^(1<<v)); dp=coeff(tv,11)-coeff(tv,10)
 H=full^(1<<v)^(1<<s); W=set(adj[s])-{v}; R=H
 for z in W:R &= ~(1<<z)
 ph=forest_poly(H);pr=forest_poly(R); q9=coeff(ph,9)-coeff(pr,9);q10=coeff(ph,10)-coeff(pr,10)
 rows.append([v,s,dp,q9,q10,q10-q9])
# Literal rank enumeration for v=0 independently checks actual addability and multiply-marked upper sets.
v,s=0,1; H=full^(1<<v)^(1<<s); W=set(adj[s])-{v}; hv=[z for z in range(n) if H>>z&1]
def independent(xs): return all(b not in adj[a] for i,a in enumerate(xs) for b in xs[i+1:])
E=C=0
for A in itertools.combinations(hv,9):
 if not independent(A) or not set(A)&W: continue
 E+=sum(1 for z in hv if z not in A and all(z not in adj[a] for a in A))
for B in itertools.combinations(hv,10):
 if independent(B) and len(set(B)&W)>=2:C+=1
result={"connectivity_acyclicity_checked":True,"edges":len(EDGES),"tree_counts_rooted_forest_dp":it,"alpha":alpha,"deltas_through_terminal":deltas,"x":x,"original_degree_one_vertices":leaves,"leaf_rows_v_support_delta_qk_qk1_summand":rows,"v0_literal_rank9_actual_addability_E":E,"v0_literal_rank10_multiply_marked_sets_C":C,"v0_covariance_numerator":E*coeff(forest_poly(H),9)-(coeff(forest_poly(H),9)-coeff(forest_poly(H & ~sum(1<<z for z in W)),9))*10*coeff(forest_poly(H),10),"full_selected_sum":sum(r[5] for r in rows if r[2]<0),"selector":[r[0] for r in rows if r[2]<0]}
print(json.dumps(result,separators=(',',':')))
