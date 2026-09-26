"""Independent generic induced-subgraph recurrence for the C5-F6 witness."""
import json
from functools import lru_cache
from pathlib import Path
from math import comb

case = json.loads(Path('EVIDENCE.json').read_text())['eligible_witness']
n = max(max(e) for e in case['edges']) + 1
adj = [0] * n
for u, v in case['edges']:
    adj[u] |= 1 << v
    adj[v] |= 1 << u
full = (1 << n) - 1

def poly(mask):
    @lru_cache(None)
    def rec(s):
        if not s:
            return (1,)
        # Branch on a highest-degree surviving vertex.
        vs = [i for i in range(n) if (s >> i) & 1]
        v = max(vs, key=lambda i: (adj[i] & s).bit_count())
        without = rec(s & ~(1 << v))
        with_v = rec(s & ~(1 << v) & ~(adj[v] & s))
        out = [0] * max(len(without), len(with_v) + 1)
        for i, x in enumerate(without): out[i] += x
        for i, x in enumerate(with_v): out[i + 1] += x
        while len(out) > 1 and out[-1] == 0: out.pop()
        return tuple(out)
    return list(rec(mask))

def d(a, j):
    return (a[j+1] if j+1 < len(a) else 0) - (a[j] if j < len(a) else 0)

P = poly(full)
assert P == case['independence_counts'], (P, case['independence_counts'])
# Check graph is connected and acyclic, hence an ordinary tree.
assert len(case['edges']) == n-1
seen={0}; todo=[0]
while todo:
    u=todo.pop()
    for v in range(n):
        if (adj[u]>>v)&1 and v not in seen:
            seen.add(v); todo.append(v)
assert len(seen)==n
# Identify original leaves and their unique supports directly from labeled graph.
leaves=[v for v in range(n) if adj[v].bit_count()==1]
assert len(leaves)==17
p=10
selectors={}
local={}
for v in leaves:
    s=(adj[v] & full).bit_length()-1
    tv=full & ~(1<<v)
    pv=poly(tv)
    favor=d(pv,p)<0
    selectors[str(v)]={'support':s,'Delta_p_T_minus_v':d(pv,p),'selected':favor}
    if favor:
        H=full & ~(1<<v) & ~(1<<s)
        closed=(1<<s)|adj[s]
        R=full & ~closed
        dh=d(poly(H),p-1); dr=d(poly(R),p-1)
        local[str(v)]={'Delta_p_minus_1_H':dh,'Delta_p_minus_1_R':dr,'G':dh-dr}
assert all(x['selected'] for x in selectors.values())
assert sum(x['G'] for x in local.values()) == -122805
# Exact first descent with zero extension.
x=next(j for j in range(len(P)) if d(P,j)<0)
assert x==8 and d(P,8)==-78
# Cover and matching certify tau=6.
centers=case['graph_labels']['centers']
assert len(centers)==6
cmask=sum(1<<c for c in centers)
assert all(((1<<u)|(1<<v)) & cmask for u,v in case['edges'])
matching=case['matching_edges']
assert len(matching)==6 and len({v for e in matching for v in e})==12
assert all((adj[u]>>v)&1 for u,v in matching)
print(json.dumps({'method':'generic induced-subgraph recurrence P(G)=P(G-v)+zP(G-N[v]) with memoized vertex masks','vertices':n,'edges':len(case['edges']),'connected':len(seen)==n,'tree':len(case['edges'])==n-1,'leaves':leaves,'leaf_supports':{k:v['support'] for k,v in selectors.items()},'selectors':selectors,'P':P,'alpha':len(P)-1,'x':x,'Delta_8':d(P,8),'alpha_guard':3*p < 2*(len(P)-1)+1,'x_guard':x+2<=p,'selected_local_terms':local,'S':sum(v['G'] for v in local.values()),'tau_certificate':'six centers cover all edges; six pairwise vertex-disjoint matching edges give tau=6'},indent=2))
# Independent census enumeration: combinations_with_replacement plus the
# generic induced-subgraph recurrence above, rather than the producer's
# recursive integer-partition generator and arm polynomial products.
from itertools import combinations_with_replacement

def graph_for(ds):
    es=[]; nxt=1; centers=[]; leaves_by=[]
    for d0 in ds:
        c=nxt; nxt+=1; centers.append(c); es.append((0,c)); leaves=[]
        for _ in range(d0):
            leaves.append(nxt); es.append((c,nxt)); nxt+=1
        leaves_by.append(leaves)
    aa=[0]*nxt
    for u,v in es: aa[u]|=1<<v; aa[v]|=1<<u
    return nxt,aa,es,centers,leaves_by

def poly_graph(nn, aa, keep=None):
    if keep is None: keep=(1<<nn)-1
    @lru_cache(None)
    def rec(s):
        if not s: return (1,)
        vv=[i for i in range(nn) if (s>>i)&1]
        v=max(vv,key=lambda i:(aa[i]&s).bit_count())
        q0=rec(s&~(1<<v)); q1=rec(s&~(1<<v)&~(aa[v]&s))
        out=[0]*max(len(q0),len(q1)+1)
        for j,y in enumerate(q0): out[j]+=y
        for j,y in enumerate(q1): out[j+1]+=y
        while len(out)>1 and out[-1]==0: out.pop()
        return tuple(out)
    return list(rec(keep))

census=[]
for pp in range(10,14):
    total=2*pp-3
    tuples=[ds for ds in combinations_with_replacement(range(total+1),6) if sum(ds)==total]
    eligible=[]
    for ds in tuples:
        nn,aa,es,cc,ll=graph_for(ds)
        pp0=poly_graph(nn,aa); al=len(pp0)-1
        xx=next(j for j in range(len(pp0)) if d(pp0,j)<0)
        if xx+2<=pp and 3*pp<2*al+1:
            selected_terms=[]
            all_sel=True
            for i, leaves0 in enumerate(ll):
                # d_i>0: every pendant leaf shares one type; d_i=0: center is leaf.
                if leaves0:
                    reps=leaves0
                    support=cc[i]
                else:
                    reps=[cc[i]]; support=0
                for v in reps:
                    kv=(1<<nn)-1
                    qv=poly_graph(nn,aa,kv&~(1<<v))
                    fav=d(qv,pp)<0
                    if fav:
                        hmask=((1<<nn)-1)&~(1<<v)&~(1<<support)
                        rmask=((1<<nn)-1)&~((1<<support)|aa[support])
                        gh=d(poly_graph(nn,aa,hmask),pp-1)-d(poly_graph(nn,aa,rmask),pp-1)
                        selected_terms.append(gh)
            eligible.append({'ds':list(ds),'alpha':al,'x':xx,'selected_terms':selected_terms,'S':sum(selected_terms)})
    census.append({'p':pp,'n':2*pp+4,'enumeration':'itertools.combinations_with_replacement filtered by sum','multisets':len(tuples),'eligible':eligible})
assert [z['multisets'] for z in census]==[163,235,331,454]
assert [len(z['eligible']) for z in census]==[1,0,0,0]
assert census[0]['eligible'][0]['ds']==[2,3,3,3,3,3]
assert census[0]['eligible'][0]['selected_terms']==[-4875]*2+[-7537]*15
with open('CENSUS-CHECK.json','w') as f: json.dump({'method':'independent combinations_with_replacement enumeration and generic induced-subgraph recurrence','census':census},f,indent=2)
