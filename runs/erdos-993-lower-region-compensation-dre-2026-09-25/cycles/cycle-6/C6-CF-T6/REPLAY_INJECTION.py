import json
from functools import lru_cache
import ordinary_tree_checked as O

def rectangle(a,b):
    if a<b: return [[(j,i) for i,j in chain] for chain in rectangle(b,a)]
    return [[(i,t) for i in range(a-t+1)]+[(a-t,j) for j in range(t+1,b+1)] for t in range(b+1)]
@lru_cache(None)
def chains(d):
    if d==0: return (((),),)
    return tuple(tuple(c[i]+(j,) for i,j in rect) for c in chains(d-1) for rect in rectangle(len(c)-1,2))
@lru_cache(None)
def successor(d):
    out={}
    for chain in chains(d):
        assert sum(chain[0])+sum(chain[-1])==2*d
        for x,y in zip(chain,chain[1:]):
            assert sum(y)==sum(x)+1
            out[x]=y
    states=[x for chain in chains(d) for x in chain]
    assert len(states)==len(set(states))==3**d
    return out

def graph(m):
    return O.Graph.from_edges(range(3*m+1),[(u,v) for i in range(m) for u,v in [(0,3*i+1),(3*i+1,3*i+2),(3*i+2,3*i+3)]])
def inject(A,m,j):
    fixed=[]; free=[]; state=[]
    for i in range(m):
        a,b,c=3*i+1,3*i+2,3*i+3; part=set(A)&{a,b,c}
        if part in [{b},{c}]: fixed.extend(part)
        else:
            free.append(i); state.append(0 if not part else 1 if part=={a} else 2)
            assert part in [set(),{a},{a,c}]
    if 0 in A:
        assert len(fixed)==j-1 and all(t==0 for t in state) and len(free)>=2
        i=free[0]; return frozenset(fixed+[3*i+1,3*i+3])
    if len(fixed)==j-1:
        assert sum(state)==1 and len(free)>=2
        at=state.index(1)
        if at==0: state[1]=1
        else: state[at]=2
    else:
        state=list(successor(len(free))[tuple(state)])
    out=list(fixed)
    for i,t in zip(free,state):
        if t>=1: out.append(3*i+1)
        if t==2: out.append(3*i+3)
    return frozenset(out)

rows=[]
for m in range(2,7):
    G=graph(m)
    for j in range(m):
        lower=G.independent_sets(j); upper=set(G.independent_sets(j+1))
        images=[inject(A,m,j) for A in lower]
        assert len(images)==len(set(images)) and set(images)<=upper
        assert len(upper)>len(lower)
        rows.append({'m':m,'j':j,'lower':len(lower),'upper':len(upper),'image_count':len(set(images))})
print(json.dumps({'scope':'independent-set injection replay for m=2..6 and 0<=j<m','rows':rows,'rows_checked':len(rows)},indent=2))
