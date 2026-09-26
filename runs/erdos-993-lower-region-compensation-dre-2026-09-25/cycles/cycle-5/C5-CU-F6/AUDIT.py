from itertools import combinations
from functools import lru_cache
import json

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return c

def add(a,b):
    c=[0]*max(len(a),len(b))
    for i,x in enumerate(a): c[i]+=x
    for i,x in enumerate(b): c[i]+=x
    return c

def graph(ds):
    adj=[]; edges=[]; leaves=[]; centers=[]; root=0
    adj.append(set()); nxt=1
    for d in ds:
        c=nxt; nxt+=1; centers.append(c)
        while len(adj)<=c: adj.append(set())
        adj[root].add(c); adj[c].add(root); edges.append((root,c))
        arm=[]
        for _ in range(d):
            v=nxt; nxt+=1
            while len(adj)<=v: adj.append(set())
            adj[c].add(v); adj[v].add(c); edges.append((c,v)); arm.append(v)
        leaves.extend(arm)
    leaves.extend(c for c in centers if len(adj[c])==1)
    return adj,edges,leaves,centers

def forest_poly(adj, deleted=frozenset()):
    alive=set(range(len(adj)))-set(deleted)
    seen=set(); components=[]
    for v in sorted(alive):
        if v in seen: continue
        stack=[v]; seen.add(v); comp=[]
        while stack:
            u=stack.pop(); comp.append(u)
            for w in adj[u]:
                if w in alive and w not in seen: seen.add(w); stack.append(w)
        components.append(comp)
    total=[1]
    for comp in components:
        cset=set(comp)
        @lru_cache(None)
        def rooted(u,parent):
            kids=[rooted(w,u) for w in adj[u] if w in cset and w!=parent]
            no=[1]; yes=[1]
            for n,y in kids:
                no=mul(no,add(n,y)); yes=mul(yes,n)
            return no,[0]+yes
        root=comp[0]
        n,y=rooted(root,-1)
        total=mul(total,add(n,y))
    return total

def delta(poly,j):
    return (poly[j+1] if 0<=j+1<len(poly) else 0)-(poly[j] if 0<=j<len(poly) else 0)

def first_descent(poly):
    alpha=len(poly)-1
    for j in range(alpha+1):
        if delta(poly,j)<0:return j
    raise ValueError('no descent')

def partitions(total, slots=6, least=0):
    if slots==1:
        if total>=least: yield (total,)
        return
    for x in range(least,total//slots+1):
        for rest in partitions(total-x,slots-1,x): yield (x,)+rest

def analyze(ds,p):
    adj,edges,leaves,centers=graph(ds)
    P=forest_poly(adj); alpha=len(P)-1; x=first_descent(P)
    if not(x+2<=p and 3*p<2*alpha+1):return None
    rows=[]; S=0
    for v in leaves:
        supp=next(iter(adj[v]))
        dp=delta(forest_poly(adj,{v}),p)
        if dp<0:
            H=forest_poly(adj,{v,supp})
            closed={supp}|adj[supp]
            R=forest_poly(adj,closed)
            term=delta(H,p-1)-delta(R,p-1)
            S+=term
            rows.append({'leaf':v,'support':supp,'selector_delta':dp,'H_delta':delta(H,p-1),'R_delta':delta(R,p-1),'term':term})
        else: rows.append({'leaf':v,'support':supp,'selector_delta':dp,'selected':False})
    return {'ds':list(ds),'n':len(adj),'alpha':alpha,'x':x,'independence_counts':P,'leaves':leaves,'selected':rows,'S':S,'tau':len(centers) if all(ds) else None,'edges':[list(e) for e in edges]}

summary=[]; witness=None
for p in range(10,14):
    tuples=list(partitions(2*p-3))
    elig=[]
    for ds in tuples:
        z=analyze(ds,p)
        if z is not None: elig.append(z)
    summary.append({'p':p,'n':2*p+4,'enumerated':len(tuples),'eligible':len(elig),'eligible_results':elig})
    if p==10 and elig:witness=elig[0]
print(json.dumps({'method':'independent explicit-edge forest DP with include/exclude recursion; all sorted 6-part tuples enumerated','summary':summary,'witness':witness},indent=2))
