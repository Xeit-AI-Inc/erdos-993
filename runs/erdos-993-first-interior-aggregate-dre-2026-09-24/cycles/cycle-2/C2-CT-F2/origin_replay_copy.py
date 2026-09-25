from itertools import combinations

N = 9
EDGES = [(0,2),(1,2),(3,2),(5,4),(7,4),(4,6),(6,2),(2,8)]
ADJ = [set() for _ in range(N)]
for u,v in EDGES:
    ADJ[u].add(v); ADJ[v].add(u)
assert len(EDGES) == N - 1
seen = {0}
frontier = [0]
for u in frontier:
    for v in ADJ[u] - seen:
        seen.add(v); frontier.append(v)
assert len(seen) == N

def counts(vertices, edges):
    vs = list(vertices)
    adj = {v:set() for v in vs}
    for u,v in edges:
        if u in adj and v in adj:
            adj[u].add(v); adj[v].add(u)
    out=[]
    for k in range(len(vs)+1):
        c=0
        for S in combinations(vs,k):
            if all(v not in adj[u] for u,v in combinations(S,2)):
                c+=1
        out.append(c)
    return out

def delta(cs,k):
    def coeff(j): return cs[j] if 0 <= j < len(cs) else 0
    return coeff(k+1)-coeff(k)

cT = counts(range(N), EDGES)
a = max(i for i,c in enumerate(cT) if c)
x = next(k for k in range(len(cT)+1) if delta(cT,k)<0)
p = a-2
leaves = [v for v in range(N) if len(ADJ[v]) == 1]
terms=[]
for v in leaves:
    s=next(iter(ADJ[v]))
    cTv = counts(set(range(N))-{v}, EDGES)
    sel = delta(cTv,p)
    Hvs=set(range(N))-{v,s}
    Nclosed={s}|ADJ[s]
    Rvs=set(range(N))-Nclosed
    cH=counts(Hvs, EDGES)
    cR=counts(Rvs, EDGES)
    term=delta(cH,p-1)-delta(cR,p-1)
    terms.append((v,s,sel,term))
print("n",N,"edges",EDGES)
print("i",cT,"alpha",a,"deltas",[delta(cT,k) for k in range(len(cT)+1)],"x",x,"p",p,"eligible",x+2<=p)
print("leaf rows (leaf,support,selector Delta_p(T-v),term)",terms)
print("S",sum(t for _,_,sel,t in terms if sel<0),"favorable count",sum(sel<0 for _,_,sel,_ in terms))
print("LB check n<=4x", N <= 4*x)
