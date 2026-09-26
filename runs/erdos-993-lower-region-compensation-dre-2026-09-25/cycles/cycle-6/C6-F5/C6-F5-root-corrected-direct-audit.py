from itertools import combinations
from collections import deque
import json


def build(rs):
    # Fixed labeled tree: path 0-1-2; each branch center adjacent to 0
    # and to r_i private leaves. Vertices are assigned consecutively.
    edges=[(0,1),(1,2)]; leaves=[2]; supports={2:1}; v=3; centers=[]
    for r in rs:
        c=v; v+=1; centers.append(c); edges.append((0,c))
        for _ in range(r):
            leaves.append(v); supports[v]=c; edges.append((c,v)); v+=1
    n=v; adj=[0]*n
    for a,b in edges: adj[a]|=1<<b;adj[b]|=1<<a
    return n,edges,adj,leaves,supports,centers

def independent_masks(n,adj, deleted=0):
    # Recursive include/exclude over vertex order; yields every set once.
    active=((1<<n)-1)^deleted
    def rec(v, chosen):
        while v<n and not (active>>v)&1: v+=1
        if v==n:
            yield chosen; return
        yield from rec(v+1,chosen)
        if not (adj[v]&chosen): yield from rec(v+1,chosen|1<<v)
    return list(rec(0,0))

def poly_from(masks,n):
    p=[0]*(n+1)
    for x in masks:p[x.bit_count()]+=1
    while len(p)>1 and p[-1]==0:p.pop()
    return p
def coeff(p,j):return p[j] if 0<=j<len(p) else 0
def delta(p,j):return coeff(p,j+1)-coeff(p,j)
def first_descent(p):
    return next(j for j in range(len(p)) if delta(p,j)<0)

class Dinic:
    def __init__(self,n):self.g=[[] for _ in range(n)]
    def add(self,u,v,c):
        f=[v,c,len(self.g[v])];b=[u,0,len(self.g[u])];self.g[u].append(f);self.g[v].append(b);return f
    def run(self,s,t):
        total=0;n=len(self.g)
        while True:
            level=[-1]*n;level[s]=0;q=deque([s])
            while q:
                u=q.popleft()
                for v,c,r in self.g[u]:
                    if c and level[v]<0:level[v]=level[u]+1;q.append(v)
            if level[t]<0:break
            it=[0]*n
            def dfs(u,f):
                if u==t:return f
                while it[u]<len(self.g[u]):
                    e=self.g[u][it[u]];v,c,r=e
                    if c and level[v]==level[u]+1:
                        d=dfs(v,min(f,c))
                        if d:e[1]-=d;self.g[v][r][1]+=d;return d
                    it[u]+=1
                return 0
            while (d:=dfs(s,10**100)):total+=d
        seen={s};q=deque([s])
        while q:
            u=q.popleft()
            for v,c,r in self.g[u]:
                if c and v not in seen:seen.add(v);q.append(v)
        return total,seen

def inspect(rs):
    n,edges,adj,leaves,supports,centers=build(rs)
    sets=independent_masks(n,adj); poly=poly_from(sets,n); x=first_descent(poly)
    # alpha is degree of independence polynomial.
    alpha=len(poly)-1
    out={'profile':rs,'n':n,'alpha':alpha,'x':x,'tree_edges':edges,'tree_poly':poly,'eligible_ranks':[]}
    leafpolys={v:poly_from(independent_masks(n,adj,1<<v),n) for v in leaves}
    for p in range(x+2, (2*alpha)//3+1):
        if not 3*p<2*alpha+1:continue
        F=[v for v in leaves if delta(leafpolys[v],p)<0]
        tagged={v for v in F}
        w=lambda I:sum(bool(I>>v&1) and bool((I & ~(1<<v)) & adj[supports[v]]) for v in tagged)
        upper=[I for I in sets if I.bit_count()==p+1 and w(I)]
        lower=[I for I in sets if I.bit_count()==p and w(I)]
        # literal deletion and exactly-two-neighbor switch arcs
        L={I:i+1 for i,I in enumerate(lower)}; U={I:i+1+len(lower) for i,I in enumerate(upper)}
        sink=1+len(lower)+len(upper);src=0;net=Dinic(sink+1)
        sup=sum(w(I) for I in upper);cap=sum(w(I) for I in lower)
        source_edges={I:net.add(src,U[I],w(I)) for I in upper}
        sink_edges={J:net.add(L[J],sink,w(J)) for J in lower}
        arcs=[]
        for I in upper:
            neigh=set()
            for v in range(n):
                if I>>v&1:neigh.add(I&~(1<<v))
            for s in range(n):
                if I>>s&1:continue
                ns=adj[s]&I
                if ns.bit_count()==2:neigh.add((I&~ns)|(1<<s))
            for J in neigh:
                if J in L:arcs.append((I,J,net.add(U[I],L[J],sup+1)))
                else:assert J.bit_count()==p and all(not (adj[v]&J) for v in range(n) if J>>v&1)  # zero-weight valid targets may be omitted
        flow,reach=net.run(src,sink)
        cutU=[I for I in upper if U[I] in reach]
        cutN=set(J for I in cutU for a,J,e in arcs if a==I)
        deficit=sum(w(I) for I in cutU)-sum(w(J) for J in cutN)
        row=[]
        for v in F:
            s=supports[v]; H=poly_from(independent_masks(n,adj,(1<<v)|(1<<s)),n)
            R=poly_from(independent_masks(n,adj, ((1<<s)|adj[s])),n)
            row.append({'leaf':v,'support':s,'term':delta(H,p-1)-delta(R,p-1)})
        S=sum(z['term'] for z in row)
        assert sup-cap==S, 'Active-tag weight must reproduce the full aggregate'
        source_flow={I:net.g[U[I]][source_edges[I][2]][1] for I in upper}
        sink_flow={J:net.g[sink][sink_edges[J][2]][1] for J in lower}
        positive=[];outgoing={I:0 for I in upper};incoming={J:0 for J in lower}
        for I,J,e in arcs:
            amount=net.g[L[J]][e[2]][1]
            if amount:
                positive.append([I,J,amount]);outgoing[I]+=amount;incoming[J]+=amount
        assert all(outgoing[I]==source_flow[I] and outgoing[I]<=w(I) for I in upper)
        assert all(incoming[J]==sink_flow[J] and incoming[J]<=w(J) for J in lower)
        assert sum(outgoing.values())==sum(incoming.values())==flow
        out['eligible_ranks'].append({'p':p,'favorable_leaf_delta_p':{str(v):delta(leafpolys[v],p) for v in leaves},'F':F,'terms':row,'S':S,'upper_set_count':len(upper),'lower_set_count':len(lower),'upper_supply':sup,'lower_capacity':cap,'flow':flow,'cut_deficit':deficit,'upper_cut_count':len(cutU),'cut_neighbor_count':len(cutN),'adjacency_arc_count':len(arcs),'positive_flow_arc_count':len(positive),'positive_flow_arcs':positive})
    return out

if __name__=='__main__':
    from pathlib import Path
    results=[inspect([2,3,4]),inspect([2,2,4,3])]
    Path(__file__).with_name('C6-F5-ROOT-CORRECTED-FLOW-EVIDENCE.json').write_text(json.dumps({'method':'direct labeled independent-set generation and exact integer max flow','profiles':results,'scope':'two explicitly listed heterogeneous trees, their unique eligible ranks, and the specified deletion plus exactly-two-neighbor insertion relation only'},indent=2)+'\n')
    print(json.dumps([{'profile':r['profile'],'n':r['n'],'alpha':r['alpha'],'x':r['x'],'eligible_ranks':[{'p':q['p'],'S':q['S'],'upper_supply':q['upper_supply'],'lower_capacity':q['lower_capacity'],'flow':q['flow'],'arc_count':q['adjacency_arc_count'],'positive_flow_arc_count':q['positive_flow_arc_count']} for q in r['eligible_ranks']]} for r in results],indent=2))
