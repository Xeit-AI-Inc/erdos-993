from itertools import combinations_with_replacement, combinations
from collections import deque
import json

# Rooted hub trees: branch P_l is a path of l vertices from the hub;
# branch C_t is a child center with t terminal leaves. Mixed multiplicities allowed.
def make_tree(spec):
    edges=[]; leaves=[]; n=1; desc=[]
    for typ,k in spec:
        if typ=='P':
            prev=0
            for _ in range(k):
                v=n;n+=1;edges.append((prev,v));prev=v
            leaves.append(prev);desc.append(f'P{k}')
        else:
            c=n;n+=1;edges.append((0,c))
            for _ in range(k):
                v=n;n+=1;edges.append((c,v));leaves.append(v)
            desc.append(f'C{k}')
    adj=[set() for _ in range(n)]
    for u,v in edges:adj[u].add(v);adj[v].add(u)
    return adj,leaves,desc

def poly(adj):
    seen=set()
    def rec(v,par):
        seen.add(v); ex=[1];inc=[0,1]
        for w in sorted(adj[v]):
            if w==par:continue
            e,i=rec(w,v);ex=mul(ex,add(e,i));inc=mul(inc,e)
        return ex,inc
    out=[1]
    for v in range(len(adj)):
        if v not in seen:
            e,i=rec(v,-1);out=mul(out,add(e,i))
    return out
def add(a,b):
    r=[0]*max(len(a),len(b))
    for i,x in enumerate(a):r[i]+=x
    for i,x in enumerate(b):r[i]+=x
    return trim(r)
def mul(a,b):
    r=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):r[i+j]+=x*y
    return trim(r)
def trim(x):
    while len(x)>1 and x[-1]==0:x.pop()
    return x
def coef(a,k):return a[k] if 0<=k<len(a) else 0
def delta(a,k):return coef(a,k+1)-coef(a,k)
def inds(adj,k):
    n=len(adj)
    for ss in combinations(range(n),k):
        mask=sum(1<<v for v in ss)
        if all(not (sum(1<<w for w in adj[v]) & mask) for v in ss):yield mask

def poly_rm(adj,rm):
    keep=[v for v in range(len(adj)) if v not in rm];ix={v:i for i,v in enumerate(keep)}
    aa=[set() for _ in keep]
    for v in keep:
        for w in adj[v]:
            if w in ix:aa[ix[v]].add(ix[w])
    return poly(aa)
def selector(adj,leaves,p):
    F=[];info={}
    for v in leaves:
        q=poly_rm(adj,{v})
        d=delta(q,p);info[v]=d
        if d<0:F.append(v)
    return F,info

def weight(mask,adj,F):
    z=0
    for v in F:
        if mask>>v&1:
            s=next(iter(adj[v]))
            W=adj[s]-{v}
            if any(mask>>w&1 for w in W):z+=1
    return z

def neighbors(mask,adj):
    n=len(adj);out=set()
    for v in range(n):
        if mask>>v&1:
            out.add(mask^(1<<v))
    for s in range(n):
        if mask>>s&1:continue
        ns=[v for v in adj[s] if mask>>v&1]
        if len(ns)==2:
            out.add((mask & ~(1<<ns[0]) & ~(1<<ns[1])) | (1<<s))
    return out
class Dinic:
    def __init__(self,n):self.g=[[] for _ in range(n)]
    def edge(self,u,v,c):
        a=[v,c,len(self.g[v])];b=[u,0,len(self.g[u])];self.g[u].append(a);self.g[v].append(b)
    def run(self,s,t,limit):
        flow=0;n=len(self.g)
        while flow<limit:
            lev=[-1]*n;lev[s]=0;q=deque([s])
            while q:
                u=q.popleft()
                for v,c,_ in self.g[u]:
                    if c and lev[v]<0:lev[v]=lev[u]+1;q.append(v)
            if lev[t]<0:break
            it=[0]*n
            def dfs(u,f):
                if u==t:return f
                while it[u]<len(self.g[u]):
                    e=self.g[u][it[u]];v,c,rev=e
                    if c and lev[v]==lev[u]+1:
                        z=dfs(v,min(f,c))
                        if z:e[1]-=z;self.g[v][rev][1]+=z;return z
                    it[u]+=1
                return 0
            while flow<limit:
                f=dfs(s,limit-flow)
                if not f:break
                flow+=f
        reach={s};q=deque([s])
        while q:
            u=q.popleft()
            for v,c,_ in self.g[u]:
                if c and v not in reach:reach.add(v);q.append(v)
        return flow,reach

def analyze(adj,leaves,p):
    a=poly(adj);x=next((j for j in range(len(a)) if delta(a,j)<0),None)
    F,ds=selector(adj,leaves,p)
    up={b:weight(b,adj,F) for b in inds(adj,p+1)}
    lo={b:weight(b,adj,F) for b in inds(adj,p)}
    sup=sum(up.values());cap=sum(lo.values());S=sup-cap
    # independent direct evaluation of the original leaf summands
    direct=0;terms={}
    for v in F:
        support=next(iter(adj[v])); closed={support,v}|set(adj[support])
        hp=poly_rm(adj,{v,support}); rp=poly_rm(adj,closed)
        terms[str(v)]=delta(hp,p-1)-delta(rp,p-1)
        direct += terms[str(v)]
    assert direct==S, (direct,S)
    # positive-weight nodes only; zero-capacity targets cannot improve routing.
    U=[b for b,w in up.items() if w];L=[b for b,w in lo.items() if w]
    li={b:i+1 for i,b in enumerate(L)};off=1+len(U);ui={b:1+i for i,b in enumerate(U)};sink=off+len(L)
    d=Dinic(sink+1)
    for b in U:d.edge(0,ui[b],up[b])
    for c in L:d.edge(off+li[c]-1,sink,lo[c])
    for b in U:
        for c in neighbors(b,adj):
            if c in li:d.edge(ui[b],off+li[c]-1,sup+1)
    flow,reach=d.run(0,sink,sup)
    cut=[b for b in U if ui[b] in reach]
    N=set().union(*(neighbors(b,adj) for b in cut)) if cut else set()
    deficit=sum(up[b] for b in cut)-sum(lo.get(c,0) for c in N)
    assert flow==sup-deficit
    return {'order':len(adj),'alpha':len(a)-1,'x':x,'p':p,'F':F,'leaf_delta_p_minus':ds,'polynomial':a,'upper_independent_sets':len(up),'lower_independent_sets':len(lo),'total_weight_upper':sup,'total_weight_lower':cap,'aggregate_S':S,'direct_summand_sum':direct,'summand_terms':terms,'flow':flow,'hall_deficit':deficit,'cut_upper_count':len(cut),'cut_neighborhood_count':len(N),'cut_upper_masks':cut,'cut_neighborhood_masks':sorted(N)}

# Heterogeneous multisets of path and claw branches. Keep the search bounded and reproducible.
types=[('P',1),('P',2),('P',3),('P',4),('C',2),('C',3),('C',4)]
results=[]; examined=0; eligible=0; eligible_all=0; empty_selector=0
for r in range(2,6):
  for ids in combinations_with_replacement(range(len(types)),r):
    spec=[types[i] for i in ids]
    adj,leaves,desc=make_tree(spec)
    if len(adj)>18:continue
    examined+=1; a=poly(adj);alpha=len(a)-1
    x=next((j for j in range(len(a)) if delta(a,j)<0),None)
    if x is None:continue
    for p in range(x+2,(2*alpha)//3+1):
      if not (3*p<2*alpha+1):continue
      eligible_all+=1
      F,ds=selector(adj,leaves,p)
      if not F:empty_selector+=1;continue
      eligible+=1
      row=analyze(adj,leaves,p)
      row['branches']=desc;row['edges']=[(u,v) for u in range(len(adj)) for v in sorted(adj[u]) if u<v]
      results.append(row)
      if row['hall_deficit']>0 and row['aggregate_S']<=0:
        print(json.dumps({'examined':examined,'eligible':eligible,'found':'deficient-cut-with-nonpositive-full-S','result':row},sort_keys=True));raise SystemExit
summary={'examined_trees':examined,'eligible_rows_with_nonempty_F':eligible,'eligible_rows_total':eligible_all,'empty_selector_rows':empty_selector,'rows':len(results),'deficient_cut_rows':sum(r['hall_deficit']>0 for r in results),'positive_full_S_rows':sum(r['aggregate_S']>0 for r in results),'best_deficit':max([r['hall_deficit'] for r in results],default=0),'all_sources_saturated':all(r['flow']==r['total_weight_upper'] for r in results),'S_min':min(r['aggregate_S'] for r in results) if results else None,'S_max':max(r['aggregate_S'] for r in results) if results else None,'heterogeneous_rows':sum(len(set(r['branches']))>1 for r in results)}
example=next((r for r in results if len(set(r['branches']))>1),results[0] if results else None)
with open('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25/scratchpad/C3-CT-F5/REPLAY-EVIDENCE.json','w') as f:json.dump({'scope':'finite search only; not a universal result','family':'hub with 2..5 unordered branches, each P_l (l=1..4 path vertices off hub) or C_t (one center with t=2..4 terminal leaves); total order <=18','generation':'one canonical sorted multiset per branch type multiset; all eligible p with x+2<=p and 3p<2alpha+1','move_rule':'all one-vertex deletions plus B -> (B - (N(s) intersect B)) union {s} for absent s with exactly two neighbors in B','weight_rule':'w_F(B)=count of v in F intersect B for which (B-{v}) intersects W_v, W_v=N(s_v)\{v}; capacities and supplies exact integer weights','summary':summary,'representative_exact_row':example},f,sort_keys=True,indent=2)
print(json.dumps(summary,sort_keys=True))
