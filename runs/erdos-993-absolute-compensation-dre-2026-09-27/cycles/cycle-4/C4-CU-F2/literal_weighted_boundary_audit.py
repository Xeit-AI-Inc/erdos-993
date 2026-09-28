from math import comb
import json
BR={1:[1,2],2:[1,3,1],3:[1,4,3,1],4:[1,5,6,4,1]}
def at(a,k):return a[k] if 0<=k<len(a) else 0
def add(a,b):return [at(a,k)+at(b,k) for k in range(max(len(a),len(b)))]
def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,u in enumerate(a):
  for j,v in enumerate(b):c[i+j]+=u*v
 return c
def prod(rs):
 q=[1]
 for r in rs:q=mul(q,BR[r])
 return q
def F(r):
 f=[0]
 for h in range(r-1):f=add(f,[comb(h,k) for k in range(h+1)])
 return f
def literal_poly(adj, deleted=-1):
 def rec(v,par):
  outside=[1];inside=[0,1]
  for w in adj[v]:
   if w==par or w==deleted:continue
   o,i=rec(w,v);outside=mul(outside,add(o,i));inside=mul(inside,o)
  return outside,inside
 o,i=rec(0,-1)
 return add(o,i)
def graph(rs):
 edges=[(0,1),(1,2)];branches=[];n=3
 for r in rs:
  c=n;n+=1;tips=list(range(n,n+r));n+=r
  edges.append((0,c));edges.extend((c,t) for t in tips);branches.append((c,tips))
 adj=[[] for _ in range(n)]
 for u,v in edges:adj[u].append(v);adj[v].append(u)
 return adj,branches,n
def inspect(rs,ranks):
 N=sum(rs);m=len(rs);q=N+1;alpha=N+2;Q=prod(rs);C=mul([1,2],Q)
 P=add(C,[0]+[comb(q,k) for k in range(q+1)])
 x=next(k for k in range(len(P)) if at(P,k+1)<P[k])
 Ai={}
 for r in sorted(set(rs)):
  rest=rs[:];rest.remove(r)
  base=mul(mul([1,2],BR[r-1]),prod(rest))
  Ai[r]=add(base,[0]+[comb(N,k) for k in range(N+1)])
 W=[0]
 for r in Ai:
  copies=rs.count(r)*r
  W=add(W,[copies*c for c in Ai[r]])
 adj,branches,n=graph(rs)
 assert literal_poly(adj)==P
 chosen=branches[-1][1][-1]
 assert literal_poly(adj,chosen)==Ai[rs[-1]]
 A0=add(mul([1,1],Q),[0]+[comb(N,k) for k in range(N+1)])
 out={'counts':[rs.count(2),rs.count(3),rs.count(4)],'m':m,'N':N,'n':n,'alpha':alpha,'x':x,'actual_first_descent_verified_literal':True,'literal_tip_deleted_matches_Ai':True,'rank_rows':[]}
 for p in ranks:
  if not (x+2<=p and 3*p<2*alpha+1 and 2*p<=alpha):continue
  j=p-2;delta=q-j;D=comb(N,j+1)-comb(N,j)
  e0=at(A0,p+1)-at(A0,p)<0
  ei={r:at(Ai[r],p+1)-at(Ai[r],p)<0 for r in Ai}
  gap=at(C,p)*at(W,p)-at(C,p-1)*at(W,p+1)
  individual_margins={str(r):at(C,p)*at(Ai[r],p)-at(C,p-1)*at(Ai[r],p+1) for r in Ai}
  branch=[]
  for r,v in ei.items():
   if v:
    T=mul(mul([1,2],F(r)),prod(rs[:rs.index(r)]+rs[rs.index(r)+1:]))
    branch.append({'arity':r,'represented_branches':rs.count(r),'original_tip_multiplicity':rs.count(r)*r,'T_j':at(T,j),'branchwise_3halves_margin_2T_minus_3deltaD':2*at(T,j)-3*delta*D})
  b=int(e0)+sum(rs.count(r)*r for r,v in ei.items() if v)
  A=sum(z['original_tip_multiplicity']*z['T_j'] for z in branch)
  out['rank_rows'].append({'p':p,'j':j,'delta':delta,'D_j':D,'endpoint_selector':e0,'tip_selector_by_arity':ei,'weighted_shift_margin_CpWp_minus_Cpm1Wp1':gap,'individual_tip_shift_margins_by_arity':individual_margins,'W_p_positive':at(W,p)>0,'C_p_and_C_pminus1_positive':at(C,p)>0 and at(C,p-1)>0,'guards':{'x_plus2_le_p':x+2<=p,'3p_lt_2alpha_plus1':3*p<2*alpha+1,'2p_le_alpha':2*p<=alpha,'2p_le_Nplus2':2*p<=N+2},'selected_branch_payments':branch,'b_original_tag_count':b,'selected_A':A,'selected_mass_margin_A_minus_bdeltaD':A-b*delta*D,'ratio_t_C_jplus1_over_C_j':{'numerator':at(C,j+1),'denominator':at(C,j)}})
 return out
results=[inspect([4]*40,[80,81]),inspect([2,3]+[4]*30,[63])]
open(__file__.replace('.py','.json'),'w').write(json.dumps(results,indent=2))
print(json.dumps(results,indent=2))
