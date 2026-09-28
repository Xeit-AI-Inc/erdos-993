from pathlib import Path
import json
from math import comb
rs=[2]*38+[4];N=sum(rs);edges=[(0,1),(1,2)];n=3;branches=[]
for r in rs:
 c=n;n+=1;tips=list(range(n,n+r));n+=r;edges.append((0,c));edges.extend((c,t)for t in tips);branches.append((c,tips))
adj=[[]for _ in range(n)]
for a,b in edges:adj[a].append(b);adj[b].append(a)
def at(a,k):return a[k]if 0<=k<len(a)else 0
def add(a,b):return [at(a,k)+at(b,k)for k in range(max(len(a),len(b)))]
def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,u in enumerate(a):
  for j,v in enumerate(b):c[i+j]+=u*v
 while len(c)>1 and c[-1]==0:c.pop()
 return c
def dp(v,parent,deleted):
 outside=[1];inside=[0,1]
 for w in adj[v]:
  if w==parent or w==deleted:continue
  o,t=dp(w,v,deleted);outside=mul(outside,add(o,t));inside=mul(inside,o)
 return outside,inside
C,inside=dp(0,-1,-1);P=add(C,inside);tip=branches[-1][1][-1];A=add(*dp(0,-1,tip));x=next(k for k in range(len(P))if at(P,k+1)<P[k]);k=77;gap=at(A,k)*at(C,k)-at(A,k+1)*at(C,k-1)
assert n==122 and len(edges)==121 and gap==-49239834336
out={'scope':'Exact literal ordinary-tree witness to the unguarded shifted-C deletion ratio. Not a counterexample at an actual eligible rank and not a MASS/payment/conjecture counterexample.','counts':[38,0,1],'m':39,'N':N,'n':n,'alpha':N+2,'x':x,'comparison_rank':k,'deleted_original_tip':tip,'original_branch_arity':4,'lower_half_guard':2*k<=N+2,'guards_if_p_equals_k':{'x_plus2_le_p':x+2<=k,'three_p_lt_two_alpha_plus1':3*k<2*(N+2)+1,'two_p_le_alpha':2*k<=N+2},'C_k':at(C,k),'C_kminus1':at(C,k-1),'A_k':at(A,k),'A_kplus1':at(A,k+1),'signed_shifted_ratio_margin':gap,'edges':edges,'root_absent_polynomial':C,'parent_polynomial':P,'leaf_deleted_polynomial':A,'minimality':'smallest retained known witness; no global minimality claim'}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print({a:out[a]for a in ['n','x','comparison_rank','signed_shifted_ratio_margin','lower_half_guard']})
