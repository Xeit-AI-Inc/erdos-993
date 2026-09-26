from itertools import combinations
from collections import deque
from math import comb
import json

def graph(arms):
    # Rooted claw branches; each entry is the long limb length, short limbs have length 1.
    edges=[(0,1),(1,2)]; n=3; leaves=[2]
    for L in arms:
        c=n; n+=1; edges.append((0,c))
        for length in (1,1,L):
            prev=c
            for j in range(length):
                v=n; n+=1; edges.append((prev,v)); prev=v
            leaves.append(prev)
    adj=[set() for _ in range(n)]
    for u,v in edges: adj[u].add(v);adj[v].add(u)
    return adj,edges,leaves

def poly(adj):
    seen=set()
    def mul(a,b):
        c=[0]*(len(a)+len(b)-1)
        for i,x in enumerate(a):
            for j,y in enumerate(b): c[i+j]+=x*y
        return c
    def add(a,b):
        c=[0]*max(len(a),len(b))
        for i,x in enumerate(a):c[i]+=x
        for i,x in enumerate(b):c[i]+=x
        return c
    def dfs(v,p):
        e=[1]; inc=[0,1]
        for w in adj[v]:
            if w==p:continue
            a,b=dfs(w,v);e=mul(e,add(a,b));inc=mul(inc,a)
        return e,inc
    a,b=dfs(0,-1); return add(a,b)
def coef(a,j): return a[j] if 0<=j<len(a) else 0
def delta(a,j):return coef(a,j+1)-coef(a,j)
def indeps(adj,k):
    n=len(adj)
    out=[]
    for C in combinations(range(n),k):
        m=sum(1<<v for v in C)
        if all(not (sum(1<<w for w in adj[v])&m) for v in C):out.append(m)
    return out
def weight(B,F,ws):
    return sum(1 for v in F if B>>v&1 and (B&ws[v]))
class Dinic:
    def __init__(self,n):self.g=[[] for _ in range(n)]
    def add(self,u,v,c):self.g[u].append([v,c,len(self.g[v])]);self.g[v].append([u,0,len(self.g[u])-1])
    def flow(self,s,t,lim):
        f=0;n=len(self.g)
        while f<lim:
            lev=[-1]*n;lev[s]=0;q=deque([s])
            while q:
                u=q.popleft()
                for v,c,r in self.g[u]:
                    if c and lev[v]<0:lev[v]=lev[u]+1;q.append(v)
            if lev[t]<0:break
            at=[0]*n
            def dfs(u,x):
                if u==t:return x
                while at[u]<len(self.g[u]):
                    e=self.g[u][at[u]];v,c,r=e
                    if c and lev[v]==lev[u]+1:
                        z=dfs(v,min(x,c))
                        if z:e[1]-=z;self.g[v][r][1]+=z;return z
                    at[u]+=1
                return 0
            while f<lim:
                z=dfs(s,lim-f)
                if not z:break
                f+=z
        reach={s};q=deque([s])
        while q:
            u=q.popleft()
            for v,c,r in self.g[u]:
                if c and v not in reach:reach.add(v);q.append(v)
        return f,reach

def test(arms):
    adj,edges,leaves=graph(arms);n=len(adj);a=poly(adj);alpha=len(a)-1
    x=next((j for j in range(len(a)) if delta(a,j)<0),None)
    if x is None:return None
    for p in range(x+2, (2*alpha)//3+1):
        if 3*p>=2*alpha+1:continue
        F=[v for v in leaves if delta(poly([list(s) for s in []]) if False else [],0)<0]
        # per-leaf exact DP on forest after deleting leaf; simple generic forest poly
        def forest_poly(removed):
            rem=set(removed);seen=set()
            def dfs(v,p):
                e=[1];inc=[0,1]
                for w in adj[v]:
                    if w==p or w in rem:continue
                    q,r=dfs(w,v);e=mul(e,add(q,r));inc=mul(inc,q)
                return e,inc
            def mul(a,b):
                z=[0]*(len(a)+len(b)-1)
                for i,c in enumerate(a):
                    for j,d in enumerate(b):z[i+j]+=c*d
                return z
            def add(a,b):
                z=[0]*max(len(a),len(b))
                for i,c in enumerate(a):z[i]+=c
                for i,c in enumerate(b):z[i]+=c
                return z
            out=[1]
            for v in range(n):
                if v in rem or v in seen:continue
                def mark(z,p):
                    seen.add(z)
                    for w in adj[z]:
                        if w!=p and w not in rem:mark(w,z)
                mark(v,-1);q,r=dfs(v,-1);out=mul(out,add(q,r))
            return out
        supports={v:next(iter(adj[v])) for v in leaves}
        F=[v for v in leaves if delta(forest_poly({v}),p)<0]
        ws={v:sum(1<<w for w in adj[supports[v]] if w!=v) for v in F}
        U=indeps(adj,p+1);L=indeps(adj,p)
        uw={B:weight(B,F,ws) for B in U};lw={D:weight(D,F,ws) for D in L}
        supply=sum(uw.values());capacity=sum(lw.values());S=supply-capacity
        print('ROW',arms,'n',n,'a',alpha,'x',x,'p',p,'F',F,'S',S,'sup',supply,'cap',capacity,flush=True)
        if supply==0: continue
        uid={b:i+1 for i,b in enumerate(B for B in U if uw[B])};lid={b:len(uid)+i+1 for i,b in enumerate(B for B in L if lw[B])};sink=len(uid)+len(lid)+1
        net=Dinic(sink+1);source=0
        for B,i in uid.items():net.add(source,i,uw[B])
        for D,i in lid.items():net.add(i,sink,lw[D])
        edgepairs=[]
        for B,i in uid.items():
            ds=set()
            # delete one
            for q in range(n):
                if B>>q&1:ds.add(B^(1<<q))
            # switch absent s with exactly two neighbors in B
            for s in range(n):
                if B>>s&1:continue
                ns=[q for q in adj[s] if B>>q&1]
                if len(ns)==2:
                    D=(B & ~sum(1<<q for q in ns)) | (1<<s)
                    ds.add(D)
            for D in ds:
                if D in lid:
                    net.add(i,lid[D],supply+1);edgepairs.append((B,D))
        f,reach=net.flow(source,sink,supply)
        upp=[b for b,i in uid.items() if i in reach]
        neigh=set(d for b,d in edgepairs if b in set(upp))
        deficit=sum(uw[b] for b in upp)-sum(lw[d] for d in neigh)
        return dict(arms=arms,n=n,alpha=alpha,x=x,p=p,F=F,supply=supply,capacity=capacity,S=S,flow=f,deficit=deficit,upper_states=len(uid),lower_states=len(lid),edges=len(edgepairs),cut_upper=upp,cut_lower=sorted(neigh),edges_list=edges)
    return None

# Distinct branch elongations break the T_m arm symmetry while retaining its claw mechanism.
cand=([1,1,2], [1,1,3], [1,2,3], [1,1,2,3], [1,1,2,4])
all_results=[]
for arms in cand:
    print('TRY',arms,flush=True)
    r=test(arms)
    if r:
        all_results.append(r)
        with open('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25/scratchpad/C3-CT-F3/replay/found.json','w') as f:json.dump(r,f,indent=2)
        print('RESULT',json.dumps({k:v for k,v in r.items() if k not in ('cut_upper','cut_lower')}),flush=True)

with open('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25/scratchpad/C3-CT-F3/replay/flow-results.json','w') as f: json.dump(all_results,f,indent=2)
