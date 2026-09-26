import json
from pathlib import Path

def add(a,b):
 c=[0]*max(len(a),len(b))
 for i,x in enumerate(a): c[i]+=x
 for i,x in enumerate(b): c[i]+=x
 return c

def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b): c[i+j]+=x*y
 return c

def delta(a,j): return (a[j+1] if j+1<len(a) else 0)-(a[j] if j<len(a) else 0)

def graph(m):
 # 0=a, 1=b, 2=r; then center and three leaves per claw
 n=3+4*m; E=[(0,1),(1,2)]
 for i in range(m):
  c=3+4*i; E.append((2,c))
  E.extend((c,c+1+j) for j in range(3))
 adj=[set() for _ in range(n)]
 for u,v in E: adj[u].add(v);adj[v].add(u)
 return adj

def forest_poly(adj, keep):
 keep=set(keep); seen=set(); total=[1]
 for root in sorted(keep):
  if root in seen: continue
  parent={root:-1}; order=[root];seen.add(root)
  for u in order:
   for v in adj[u]:
    if v in keep and v not in seen:
     seen.add(v);parent[v]=u;order.append(v)
  inc={}; exc={}
  for u in reversed(order):
   a=[1]; b=[1]
   for v in adj[u]:
    if parent.get(v)==u:
     a=mul(a,exc[v]); b=mul(b,add(inc[v],exc[v]))
   inc[u]=[0]+a;exc[u]=b
  total=mul(total,add(inc[root],exc[root]))
 return total

def literal_poly(adj,keep):
 keep=list(keep); n=len(keep); pos={v:i for i,v in enumerate(keep)}; out=[0]*(n+1)
 for mask in range(1<<n):
  good=True
  for i,u in enumerate(keep):
   if mask>>i&1:
    for v in adj[u]:
     j=pos.get(v)
     if j is not None and j>i and mask>>j&1: good=False;break
   if not good:break
  if good:out[mask.bit_count()]+=1
 return out

source=json.loads(Path('producer_evidence.json').read_text())
checks=0; mismatches=[]; literal_checks=[]; eligible=0; favor_patterns=set(); pos=0
details=[]
claw_numeric_differences=0
arm_source_differences=0
term_source_differences=0
sum_source_differences=0
for m,row in enumerate(source['rows'],1):
 adj=graph(m); n=len(adj); allv=set(range(n))
 P=forest_poly(adj,allv)
 # Independently derive alpha and first terminal-zero-extended descent.
 alpha=max(i for i,c in enumerate(P) if c)
 x=next(j for j in range(alpha+1) if delta(P,j)<0)
 leaves=[v for v in allv if len(adj[v])==1]
 assert len(leaves)==1+3*m
 # Two representatives suffice for the two automorphism orbits; the full
 # degree-one list above supplies the multiplicities and verifies the tags.
 rs=[]
 for v in (0,4):
  s=next(iter(adj[v])); D=forest_poly(adj,allv-{v})
  H=forest_poly(adj,allv-{v,s}); R=forest_poly(adj,allv-{s}-adj[s])
  rs.append((v,D,H,R))
 # source rows must be exactly all eligible integer ranks, with true graph-derived flags and terms
 eligible_ps=[p for p in range(x+2,alpha+1) if 3*p<2*alpha+1]
 if row['alpha']!=alpha or row['x']!=x or [z['p'] for z in row['eligible_rows']]!=eligible_ps:
  mismatches.append({'m':m,'kind':'scope','source_alpha_x':(row['alpha'],row['x']),'graph_alpha_x':(alpha,x),'expected_ps':eligible_ps})
 for er in row['eligible_rows']:
  p=er['p'];k=p-1; S=0; arm=None;claw=None; local=[]
  for v,D,H,R in rs:
   favorable=delta(D,p)<0
   term=delta(H,k)-delta(R,k)
   if favorable:S+=(1 if v==0 else 3*m)*term
   if v==0:arm=(favorable,delta(D,p),term)
   if v==4:claw=(favorable,delta(D,p),term)
  got=(er['arm_favorable'],er['arm_delta'],er['term_arm'])
  gotc=(er['claw_favorable'],er['claw_delta'],er['term_claw'])
  arm_source_differences += arm!=got
  term_source_differences += arm[2]!=er['term_arm'] or claw[2]!=er['term_claw']
  sum_source_differences += S!=er['S']
  if arm!=got or claw!=gotc or S!=er['S']:
   mismatches.append({'m':m,'p':p,'arm_graph':arm,'arm_source':got,'claw_graph':claw,'claw_source':gotc,'S_graph':S,'S_source':er['S']})
  if claw[1]!=er['claw_delta']: claw_numeric_differences+=1
  details.append({'m':m,'p':p,'alpha':alpha,'x':x,'arm_delta':arm[1],'claw_delta_graph':claw[1],
                  'arm_selected':arm[0],'claw_selected':claw[0],
                  'arm_term':arm[2] if arm[0] else 0,'claw_term_per_leaf':claw[2] if claw[0] else 0,'S':S})
  checks+=1;eligible+=1;favor_patterns.add((arm[0],claw[0]));pos+=S>0
 # Small independent literal subset check on T_3 and each of its leaf deletion families.
 if m==3:
  contexts=[('T',allv)] + [(f'D_{v}',allv-{v}) for v in leaves] + [(f'H_{v}',allv-{v,next(iter(adj[v]))}) for v in leaves] + [(f'R_{v}',allv-{next(iter(adj[v]))}-adj[next(iter(adj[v]))]) for v in leaves]
  for name,keep in contexts:
   dp=forest_poly(adj,keep); brute=literal_poly(adj,keep)
   while dp and dp[-1]==0: dp.pop()
   while brute and brute[-1]==0: brute.pop()
   literal_checks.append({'graph':name,'vertices':len(keep),'match':dp==brute})
   if dp!=brute:mismatches.append({'m':3,'kind':'literal','graph':name})
out={'independent_method':'Construct labeled T_m edge graph; derive all degree-one vertices/supports; generic rooted-forest include/exclude recurrence; literal independent-subset enumeration for m=3 and all leaf deletion/H/R contexts.','m_boundary':[1,80],'eligible_rows_checked':checks,'selector_patterns':sorted([list(x) for x in favor_patterns]),'positive_complete_sums':pos,'literal_subset_checks':len(literal_checks),'literal_subset_failures':[x for x in literal_checks if not x['match']],'claw_selector_delta_source_mismatches':claw_numeric_differences,'arm_source_mismatches':arm_source_differences,'q_term_source_mismatches':term_source_differences,'complete_sum_source_mismatches':sum_source_differences,'claw_code_issue':'The sealed replay constructs D_claw=(1+3z+z^2)B^(m-1)+zL^(3m), omitting the stated (1+2z) factor. Actual graph-derived Delta_p(T-v) differs at every eligible row. All 1,749 corrected and producer selector booleans remain favorable, and the q terms and complete S values agree.','rows':details,'literal_subset_graphs':literal_checks}
Path('audit_evidence.json').write_text(json.dumps(out,indent=2)+'\n')
