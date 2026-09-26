from collections import deque
from functools import lru_cache
import json

# Build the stated graph without importing worker code.
m, p = 5, 10
edges = [(0, 1), (1, 2)]
next_v = 3
claws = []
for _ in range(m):
    c = next_v; next_v += 1
    leaves = list(range(next_v, next_v + 3)); next_v += 3
    edges.append((0, c))
    edges.extend((c, z) for z in leaves)
    claws.append((c, leaves))
n = next_v
adj = [set() for _ in range(n)]
for u, v in edges:
    adj[u].add(v); adj[v].add(u)

# Structural checks from the full edge list.
seen = {0}; todo = [0]
while todo:
    u = todo.pop()
    for v in adj[u] - seen:
        seen.add(v); todo.append(v)
assert len(seen) == n and len(edges) == n - 1
orig_leaves = sorted(v for v in range(n) if len(adj[v]) == 1)
assert orig_leaves == [2] + sorted(z for _, ls in claws for z in ls)

# Generic forest polynomial DP, using rooted include/exclude states.
def add(a,b):
    out=[0]*max(len(a),len(b))
    for i,x in enumerate(a): out[i]+=x
    for i,x in enumerate(b): out[i]+=x
    return trim(out)
def trim(a):
    while len(a)>1 and a[-1]==0: a.pop()
    return a
def mul(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): out[i+j]+=x*y
    return trim(out)
def shift(a): return [0]+a

def forest_poly(removed):
    live=set(range(n))-set(removed)
    @lru_cache(None)
    def states(v, parent):
        children=[w for w in adj[v] if w != parent and w in live]
        excluded=[1]
        included=[1]
        for w in children:
            e,i=states(w,v)
            excluded=mul(excluded,add(e,i))
            included=mul(included,e)
        return excluded, shift(included)
    total=[1]
    remaining=set(live)
    while remaining:
        root=min(remaining); stack=[root]; comp=set()
        while stack:
            v=stack.pop()
            if v in comp: continue
            comp.add(v); stack.extend((adj[v]&live)-comp)
        remaining-=comp
        e,i=states(root,-1)
        total=mul(total,add(e,i))
    return total

def coeff(poly,j): return poly[j] if 0<=j<len(poly) else 0
def delta(poly,j): return coeff(poly,j+1)-coeff(poly,j)
def delpoly(V): return forest_poly(frozenset(V))

P=forest_poly(frozenset())
a=max(j for j,c in enumerate(P) if c)
x=next(j for j in range(len(P)+1) if delta(P,j)<0)
assert a==17 and x==8 and n==23
terms=[]; selector=[]
for v in orig_leaves:
    s=next(iter(adj[v]))
    dv=delta(delpoly({v}),p)
    if dv<0:
        selector.append(v)
        term=delta(delpoly({v,s}),p-1)-delta(delpoly({v,s,*adj[s]}),p-1)
        terms.append((v,s,dv,term))
assert p>=x+2 and 3*p<2*a+1 and len(selector)==16
assert all(t[2]<0 for t in terms)
S=sum(t[3] for t in terms)
assert S==-84215
result={"vertices":n,"edges":len(edges),"connected":len(seen)==n,"original_leaves":orig_leaves,"alpha":a,"x":x,"p":p,"guards":{"x_plus_2_le_p":p>=x+2,"three_p_lt_two_alpha_plus_one":3*p<2*a+1},"selected_count":len(selector),"selected_vertices":selector,"selected_terms":terms,"full_S":S,"independence_polynomial":P}
print(json.dumps(result,indent=2))
