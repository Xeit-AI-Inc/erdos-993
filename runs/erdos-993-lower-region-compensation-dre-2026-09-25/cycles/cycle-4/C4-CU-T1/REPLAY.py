"""Independent audit using minimum-degree independence-polynomial recurrence."""
import itertools,json
N=24
edges=[[0,1],[3,2],[2,4],[4,17],[5,10],[6,19],[10,18],[12,7],[14,11],[11,13],[15,8],[17,9],[18,19],[19,13],[13,7],[20,8],[8,9],[9,1],[21,1],[22,1],[1,7],[7,16],[16,23]]
adj=[0]*N
for a,b in edges: adj[a]|=1<<b;adj[b]|=1<<a
# Connectivity and acyclicity from the encoded graph.
seen={0}; todo=[0]
while todo:
 u=todo.pop()
 for v in range(N):
  if adj[u]>>v&1 and v not in seen: seen.add(v);todo.append(v)
assert len(seen)==N and len(edges)==N-1
memo={0:(1,)}
def poly(mask):
 if mask in memo:return memo[mask]
 vs=[v for v in range(N) if mask>>v&1]
 v=min(vs,key=lambda z:(adj[z]&mask).bit_count())
 without=poly(mask&~(1<<v)); withv=poly(mask&~(1<<v)&~adj[v])
 out=[0]*max(len(without),len(withv)+1)
 for j,z in enumerate(without):out[j]+=z
 for j,z in enumerate(withv):out[j+1]+=z
 while len(out)>1 and out[-1]==0:out.pop()
 memo[mask]=tuple(out);return memo[mask]
def at(a,j):return a[j] if 0<=j<len(a) else 0
full=(1<<N)-1; it=poly(full);alpha=len(it)-1
x=next(j for j in range(N+1) if at(it,j+1)-at(it,j)<0)
p=10;k=p-1
leaves=[v for v in range(N) if adj[v].bit_count()==1]
rows=[]
for v in leaves:
 s=(adj[v]&-adj[v]).bit_length()-1
 tv=poly(full&~(1<<v)); d=at(tv,p+1)-at(tv,p)
 H=full&~(1<<v)&~(1<<s);W=adj[s]&~(1<<v); R=H&~W
 ih=poly(H);ir=poly(R);qk=at(ih,k)-at(ir,k);qk1=at(ih,k+1)-at(ir,k+1)
 rows.append({'leaf':v,'support':s,'delta_p_T_minus_v':d,'selected':d<0,'W':sorted(z for z in range(N) if W>>z&1),'iH_k':at(ih,k),'iH_k1':at(ih,k+1),'q_k':qk,'q_k1':qk1,'summand':qk1-qk})
F=[r for r in rows if r['selected']]
# Directly count actual addability for the reported covariance tag via rank-k subsets.
r=next(r for r in F if r['leaf']==0); v=0;s=r['support']; H=full&~1&~(1<<s);W=adj[s]&~1
verts=[z for z in range(N) if H>>z&1]; E0=0;rank_sets=0
for combo in itertools.combinations(verts,k):
 A=sum(1<<z for z in combo)
 if any(A>>z&1 and A&adj[z] for z in combo):continue
 if not A&W:continue
 rank_sets+=1
 E0+=sum(1 for z in verts if not A>>z&1 and not A&adj[z])
assert rank_sets==r['q_k']
covnum=E0*r['iH_k']-r['q_k']*(k+1)*r['iH_k1']
assert it==tuple([1,24,253,1553,6202,17052,33321,47118,48648,36729,20148,7898,2146,384,41,2])
assert x==8 and alpha==15 and leaves==[0,3,5,6,12,14,15,20,21,22,23]
assert F==[row for row in rows if row['selected']]
assert r['delta_p_T_minus_v']==-4599 and E0==58429 and covnum==1773113
out={'method':'minimum-induced-degree deletion recurrence for all independence polynomials; direct rank-9 subset enumeration for selected tag v=0 addability','connected_vertices':len(seen),'edge_count':len(edges),'tree_counts':list(it),'alpha':alpha,'x':x,'delta_alpha':at(it,alpha+1)-at(it,alpha),'p':p,'guards':{'x_plus_2_le_p':x+2<=p,'three_p_lt_two_alpha_plus_one':3*p<2*alpha+1},'all_original_leaves':leaves,'leaf_rows':rows,'F':[r['leaf'] for r in F],'Q':sum(r['q_k'] for r in F),'U':sum(r['q_k1'] for r in F),'S':sum(r['summand'] for r in F),'v0_rank_k_marked_sets':rank_sets,'v0_actual_addability_sum':E0,'v0_covariance_numerator':covnum}
print(json.dumps(out,separators=(',',':')))
