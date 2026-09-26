from itertools import combinations
import json
edges=[(0,1),(1,2),(0,3),(3,4),(3,5),(0,6),(6,7),(6,8),(0,9),(9,10),(9,11),(9,12)]
V=list(range(13))
def poly(V, edges):
    counts=[0]*(len(V)+1)
    for k in range(len(V)+1):
        for A in combinations(V,k):
            S=set(A)
            if all(not (u in S and v in S) for u,v in edges): counts[k]+=1
    while len(counts)>1 and counts[-1]==0: counts.pop()
    return counts
def delta(c,j): return (c[j+1] if 0<=j+1<len(c) else 0)-(c[j] if 0<=j<len(c) else 0)
def induced(keep): return [(u,v) for u,v in edges if u in keep and v in keep]
f=poly(V,edges); a=len(f)-1; x=next(j for j in range(a+1) if delta(f,j)<0); p=6; k=p-1
leaves=[v for v in V if sum(v in e for e in edges)==1]
rows=[]
for v in leaves:
 s=next(u if v==w else w for u,w in edges if v in (u,w))
 fv=poly([u for u in V if u!=v],induced(set(V)-{v}))
 dv=delta(fv,p)
 if dv<0:
  Hnodes=set(V)-{v,s}; Hedges=induced(Hnodes); Ncs={s,v}|{u if w==s else w for u,w in edges if s in (u,w)}
  Rnodes=set(V)-Ncs; Redges=induced(Rnodes)
  hpoly=poly(sorted(Hnodes),Hedges); rpoly=poly(sorted(Rnodes),Redges)
  qk=(hpoly[k] if k<len(hpoly) else 0)-(rpoly[k] if k<len(rpoly) else 0)
  qk1=(hpoly[k+1] if k+1<len(hpoly) else 0)-(rpoly[k+1] if k+1<len(rpoly) else 0)
  marked_k=[]; e=0
  for A in combinations(sorted(Hnodes),k):
   S=set(A)
   if not S.intersection(Ncs-{v,s}): continue
   if any(u in S and w in S for u,w in Hedges): continue
   marked_k.append(S)
   e+=sum(1 for z in Hnodes-S if all(not ((u==z and w in S) or (w==z and u in S)) for u,w in Hedges))
  c=0
  for A in combinations(sorted(Hnodes),k+1):
   S=set(A)
   if any(u in S and w in S for u,w in Hedges): continue
   if len(S.intersection(Ncs-{v,s}))>=2: c+=1
  d=2*(a-1-k)*qk-e
  summand=delta(hpoly,k)-delta(rpoly,k)
  rows.append(dict(leaf=v,support=s,delta_p_minus_leaf=dv,q_k=qk,q_k1=qk1,E=e,C=c,D=d,summand=summand))
result=dict(edges=edges,independence_vector=f,alpha=a,x=x,i_x=f[x],i_x_plus_1=f[x+1],p=p,k=k,original_leaves=leaves,rows=rows,S=sum(r['summand'] for r in rows),Q=sum(r['q_k'] for r in rows),U=sum(r['q_k1'] for r in rows),E=sum(r['E'] for r in rows),C=sum(r['C'] for r in rows),D=sum(r['D'] for r in rows))
assert (a,x,f[x],f[x+1],leaves)==(9,4,258,231,[2,4,5,7,8,10,11,12])
assert [r['delta_p_minus_leaf'] for r in rows]==[-46,-38,-38,-38,-38,-31,-31,-31]
assert result['S']==-307 and (result['Q'],result['U'],result['E'],result['C'],result['D'])==(578,271,1514,159,1954)
assert result['E']==k*result['U']+result['C']
assert result['D']+result['C']-(2*a+1-3*p)*result['Q']==1535==-k*result['S']
print(json.dumps(result,indent=2))
