from collections import defaultdict
import json
from pathlib import Path


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a): out[i] += x
    for i, x in enumerate(b): out[i] += x
    while len(out) > 1 and out[-1] == 0: out.pop()
    return out


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): out[i+j] += x*y
    while len(out) > 1 and out[-1] == 0: out.pop()
    return out


def delta(poly, j):
    def c(k): return poly[k] if 0 <= k < len(poly) else 0
    return c(j+1)-c(j)


def family(m):
    n = 4*m+3
    adj = [set() for _ in range(n)]
    def edge(a,b): adj[a].add(b); adj[b].add(a)
    edge(0,1); edge(1,2)
    for i in range(m):
        c=3+4*i
        edge(0,c)
        for l in range(c+1,c+4): edge(c,l)
    return adj


def forest_poly(adj, vertices):
    vertices=set(vertices); seen=set()
    def rooted(v,parent):
        seen.add(v); ex=[1]; inc=[0,1]
        for w in sorted(adj[v] & vertices):
            if w==parent: continue
            ce,ci=rooted(w,v)
            ex=mul(ex,add(ce,ci)); inc=mul(inc,ce)
        return ex,inc
    out=[1]
    for v in sorted(vertices):
        if v not in seen:
            ex,inc=rooted(v,None); out=mul(out,add(ex,inc))
    return out


def rooted_messages(adj, vertices, root, parent=None):
    children=sorted((adj[root] & vertices)-({parent} if parent is not None else set()))
    child_j=[]; child_e=[]
    for c in children:
        j,e=rooted_messages(adj,vertices,c,root); child_j.append(j); child_e.append(e)
    product_j=[1]; product_e=[1]
    for p in child_j: product_j=mul(product_j,p)
    for p in child_e: product_e=mul(product_e,p)
    return add(product_j,[0]+product_e), product_j


def run(m, rank):
    adj=family(m); V=set(range(len(adj))); whole=forest_poly(adj,V)
    alpha=len(whole)-1
    x=next(j for j in range(alpha+1) if delta(whole,j)<0)
    leaves=sorted(v for v in V if len(adj[v])==1)
    by_support=defaultdict(list)
    for v in leaves: by_support[next(iter(adj[v]))].append(v)
    groups=[]
    selected_total=0
    for s, leafs in sorted(by_support.items()):
        m_s=len(leafs); branch_roots=sorted((adj[s]&V)-set(leafs))
        P=[1]
        for _ in range(m_s-1): P=mul(P,[1,1])
        Q=[1]
        for w in branch_roots:
            comp=set(); stack=[w]; blocked={s}
            while stack:
                q=stack.pop()
                if q in comp or q in blocked: continue
                comp.add(q); stack.extend(adj[q]-comp-blocked)
            J,E=rooted_messages(adj,comp,w)
            P=mul(P,J); Q=mul(Q,E)
        PT=add(P,[0]+Q)
        direct=[]
        for v in leafs:
            H=forest_poly(adj,V-{v,s})
            closed={s}|adj[s]
            R=forest_poly(adj,V-closed)
            Tminus=forest_poly(adj,V-{v})
            assert H==P and R==Q and Tminus==PT
            direct.append(delta(Tminus,rank)<0)
        favorable=delta(PT,rank)<0
        assert all(b==favorable for b in direct)
        term=delta(P,rank-1)-delta(Q,rank-1)
        if favorable: selected_total += m_s*term
        groups.append({'support':s,'leaf_count':m_s,'selector_delta':delta(PT,rank),
                       'favorable':favorable,'per_leaf_summand':term,
                       'selected_fibre_sum':m_s*term if favorable else 0,
                       'rooted_equals_direct_for_all_fibre_leaves':True})
    return {'family_branches':m,'order':len(V),'rank':rank,'alpha':alpha,'x_terminal_checked':x,
            'eligible':x+2<=rank and 3*rank<2*alpha+1,
            'selected_favorable_leaf_count':sum(g['leaf_count'] for g in groups if g['favorable']),
            'positive_selected_local_fibres':[g for g in groups if g['favorable'] and g['per_leaf_summand']>0],
            'aggregate_from_rooted_fibres':selected_total,'support_fibres':groups}


out={'method':'standalone rooted-message recursion plus independent forest DP and original-graph deletions',
     'cases':[run(22,34),run(60,90)]}
Path(__file__).with_name('rooted_transfer_replay.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps([{k:v for k,v in c.items() if k not in ('support_fibres','positive_selected_local_fibres')} | {'positive_fibre_count':len(c['positive_selected_local_fibres'])} for c in out['cases']],indent=2))
