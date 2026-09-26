from functools import reduce
from operator import mul
from pathlib import Path
import json

# Reconstruct the edge-defined T_5 directly, then count each relevant forest
# with a separate rooted include/exclude recurrence (not the source replay).
m = 5
edges = [(0,1),(1,2)]
claws=[]
next_v=3
for _ in range(m):
    c=next_v; next_v+=1
    edges.append((0,c)); leaves=[]
    for _ in range(3):
        l=next_v; next_v+=1; leaves.append(l); edges.append((c,l))
    claws.append((c,leaves))
n=next_v
adj=[set() for _ in range(n)]
for a,b in edges: adj[a].add(b); adj[b].add(a)

def add(a,b):
    out=[0]*max(len(a),len(b))
    for i,x in enumerate(a): out[i]+=x
    for i,x in enumerate(b): out[i]+=x
    return out

def mulp(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): out[i+j]+=x*y
    return out

def shift(a,k=1): return [0]*k+a

def forest_poly(deleted):
    live=set(range(n))-set(deleted)
    seen=set(); result=[1]
    for r in sorted(live):
        if r in seen: continue
        parent={r:-1}; order=[r]; seen.add(r)
        for v in order:
            for w in adj[v]:
                if w in live and w not in seen:
                    seen.add(w); parent[w]=v; order.append(w)
        inc={}; exc={}
        for v in reversed(order):
            a=[1]; b=[1]
            for w in adj[v]:
                if parent.get(w)==v:
                    a=mulp(a,exc[w]); b=mulp(b,add(inc[w],exc[w]))
            inc[v]=shift(a); exc[v]=b
        result=mulp(result,add(inc[r],exc[r]))
    return result

def coeff(P,j): return P[j] if 0<=j<len(P) else 0
def delta(P,j): return coeff(P,j+1)-coeff(P,j)
def support(v): return next(w for w in adj[v] if len(adj[w])>1)
def closed(v): return {support(v)}|adj[support(v)]

P=forest_poly(set())
a=max(i for i,x in enumerate(P) if x)
x=next(j for j in range(a+2) if delta(P,j)<0)
leaves=[v for v in range(n) if len(adj[v])==1]
p=10;k=p-1
F=[v for v in leaves if delta(forest_poly({v}),p)<0]
terms=[]
for v in F:
    h=forest_poly({v,support(v)})
    r=forest_poly(closed(v))
    terms.append({'leaf':v,'support':support(v),'selector_delta':delta(forest_poly({v}),p),
                  'summand':delta(h,k)-delta(r,k)})
S=sum(t['summand'] for t in terms)
# Verify marked q and multiply-marked C with independent deletion counts.
Qs=[]; Us=[]; Cs=[]; Cs_without_H_deletions=[]
for v in F:
    s=support(v); Hdel={v,s}; W=sorted(adj[s]-{v})
    H=forest_poly(Hdel)
    R=forest_poly(Hdel|set(W))
    qpoly=add(H,[-z for z in R]) if len(H)>=len(R) else add(H,[-z for z in R])
    # pad subtraction explicitly
    L=max(len(H),len(R)); qpoly=[coeff(H,j)-coeff(R,j) for j in range(L)]
    Qs.append(coeff(qpoly,k)); Us.append(coeff(qpoly,k+1))
    from itertools import combinations
    pair_counts=0
    pair_counts_without_H=0
    for pair in combinations(W,2):
        gone=set(Hdel)|set(pair)
        for w in pair: gone.update(adj[w])
        pair_counts+=coeff(shift(forest_poly(gone),len(pair)),k+1)
        gone0=set(pair)
        for w in pair: gone0.update(adj[w])
        pair_counts_without_H+=coeff(shift(forest_poly(gone0),len(pair)),k+1)
    triple_counts=0; triple_counts_without_H=0
    if len(W)>=3:
        for triple in combinations(W,3):
            gone=set(Hdel)|set(triple)
            for w in triple: gone.update(adj[w])
            triple_counts+=coeff(shift(forest_poly(gone),len(triple)),k+1)
            gone0=set(triple)
            for w in triple: gone0.update(adj[w])
            triple_counts_without_H+=coeff(shift(forest_poly(gone0),len(triple)),k+1)
    Cs.append(pair_counts-2*triple_counts)
    Cs_without_H_deletions.append(pair_counts_without_H-2*triple_counts_without_H)
Q=sum(Qs); U=sum(Us); C=sum(Cs); E=k*U+C
reached={0}; todo=[0]
for v in todo:
    for w in adj[v]:
        if w not in reached: reached.add(w); todo.append(w)
connected=len(reached)==n
acyclic=connected and len(edges)==n-1
out={
 'construction':{'vertices':n,'edges':len(edges),'connected':connected,'acyclic_by_connected_n_minus_1':acyclic,'acyclic_tree_recipe':'path 0-1-2 with 5 centers joined to 0, each center joined to 3 new private leaves'},
 'original_leaves':leaves,'alpha':a,'x':x,'p':p,'k':k,
 'guards':{'x_plus_2_le_p':x+2<=p,'3p_lt_2a_plus_1':3*p<2*a+1,'3p':3*p,'2a_plus_1':2*a+1},
 'leaf_selector':{'all_leaf_deltas':{str(v):delta(forest_poly({v}),p) for v in leaves},'F':F,'size':len(F)},
 'terms':terms,'S':S,
 'incidence_check':{'q_k_per_selected_tag':Qs,'q_k1_per_selected_tag':Us,'C_per_selected_tag':Cs,'C_if_Hv_deletions_omitted':Cs_without_H_deletions,'Q':Q,'U':U,'C':C,'E_kU_plus_C':E,'E_minus_C_minus_kQ':E-C-k*Q,'divided_value':(E-C-k*Q)//k,'divisible':(E-C-k*Q)%k==0}
}
assert n==23 and len(edges)==22 and connected and acyclic and len(leaves)==16 and len(F)==16
assert (a,x)==(17,8) and out['guards']['x_plus_2_le_p'] and out['guards']['3p_lt_2a_plus_1']
assert S==-84215 and out['incidence_check']['divided_value']==S and out['incidence_check']['E_minus_C_minus_kQ']==k*S
print(json.dumps(out,indent=2))
