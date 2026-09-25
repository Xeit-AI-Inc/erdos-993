#!/usr/bin/env python3
"""Independent small-graph enumeration and symbolic family audit."""
import json
from pathlib import Path

BASE = Path(__file__).resolve().parent

def graph_row(n, edges):
    adj = [set() for _ in range(n)]
    for a, b in edges:
        assert a != b and b not in adj[a]
        adj[a].add(b); adj[b].add(a)
    assert len(edges) == n-1
    reached = {0}; fringe = [0]
    while fringe:
        a = fringe.pop()
        for b in adj[a] - reached:
            reached.add(b); fringe.append(b)
    assert len(reached) == n
    def poly(vertices):
        vs = sorted(vertices)
        counts = [0] * (len(vs)+1)
        for mask in range(1 << len(vs)):
            chosen = {vs[i] for i in range(len(vs)) if mask & (1 << i)}
            if all(not(adj[v] & chosen) for v in chosen):
                counts[len(chosen)] += 1
        while len(counts) > 1 and counts[-1] == 0: counts.pop()
        return counts
    def c(p,k): return p[k] if 0 <= k < len(p) else 0
    def d(p,k): return c(p,k+1)-c(p,k)
    full = set(range(n)); P = poly(full); alpha = len(P)-1; p = alpha-2
    x = next(k for k in range(alpha+1) if d(P,k)<0)
    leaves = [v for v in range(n) if len(adj[v]) == 1]
    terms=[]
    for v in leaves:
        sel_delta = d(poly(full-{v}),p)
        if sel_delta >= 0: continue
        s = next(iter(adj[v]))
        H = poly(full-{v,s})
        R = poly(full-({s}|adj[s]))
        terms.append(dict(leaf=v,support=s,selector_delta=sel_delta,
                          delta_H=d(H,p-1),delta_R=d(R,p-1),g=d(H,p-1)-d(R,p-1)))
    max_sets=[]
    for mask in range(1<<n):
        chosen={v for v in range(n) if mask & (1<<v)}
        if len(chosen)==alpha and all(not(adj[v]&chosen) for v in chosen): max_sets.append(sorted(chosen))
    return dict(edges=edges,poly=P,alpha=alpha,p=p,x=x,eligible=x+2<=p,
                leaves=leaves,terms=terms,S=sum(t['g'] for t in terms),
                max_sets=max_sets,nonresidual_leaves=[v for v in leaves if any(v not in M for M in max_sets)])

def add(A,B):
    return [(A[i] if i<len(A) else 0)+(B[i] if i<len(B) else 0) for i in range(max(len(A),len(B)))]
def mul(A,B):
    C=[0]*(len(A)+len(B)-1)
    for i,a in enumerate(A):
        for j,b in enumerate(B): C[i+j]+=a*b
    return C
def powp(A,m):
    P=[1]
    for _ in range(m): P=mul(P,A)
    return P
def cf(P,k): return P[k] if 0<=k<len(P) else 0
def df(P,k): return cf(P,k+1)-cf(P,k)

def family(m):
    # Root-excluded and root-included cases yield these explicit polynomials.
    A=[1,1]; Q=add(powp(A,3),[0,1]); Qminus=add(powp(A,2),[0,1])
    Qm=powp(Q,m)
    P=add(mul([1,2],Qm),mul([0,1],powp(A,3*m+1)))
    Dmark=add(mul(A,Qm),mul([0,1],powp(A,3*m)))
    Dbranch=add(mul([1,2],mul(Qminus,powp(Q,m-1))),mul([0,1],powp(A,3*m)))
    Hmark=add(Qm,mul([0,1],powp(A,3*m)))
    Rmark=Qm
    Hbranch=mul(powp(A,2),add(mul([1,2],powp(Q,m-1)),mul([0,1],powp(A,3*m-2))))
    Rbranch=mul([1,2],powp(Q,m-1))
    p=len(P)-3; x=next(k for k in range(len(P)) if df(P,k)<0)
    gm=df(Hmark,p-1)-df(Rmark,p-1)
    gb=df(Hbranch,p-1)-df(Rbranch,p-1)
    dm=df(Dmark,p); db=df(Dbranch,p)
    return dict(m=m,order=4*m+3,alpha=len(P)-1,p=p,x=x,eligible=x+2<=p,
                marked_selector_delta=dm,branch_selector_delta=db,
                marked_g=gm,branch_g=gb,favorable_count=int(dm<0)+3*m*int(db<0),
                S=(gm if dm<0 else 0)+3*m*(gb if db<0 else 0))

if __name__ == '__main__':
    pinned=json.loads((BASE/'nonresidual-example.json').read_text())
    pinned_row=graph_row(pinned['n'],pinned['edges'])
    prose_edges=[[0,8],[1,2],[2,5],[3,7],[3,8],[4,8],[5,8],[6,8],[7,9]]
    prose_row=graph_row(10,prose_edges)
    families=[family(m) for m in range(1,61)]
    out=dict(pinned=pinned_row,prose=prose_row,
             family_summary=dict(t22=families[21],t60=families[59],
                                 eligible_m=[r['m'] for r in families if r['eligible']],
                                 positive_eligible_m=[r['m'] for r in families if r['eligible'] and r['S']>0],
                                 nonnegative_eligible_m=[r['m'] for r in families if r['eligible'] and r['S']>=0]))
    (BASE/'independent-audit.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps({k:out[k] for k in ('family_summary',)},indent=2))
    print('pinned', {k:pinned_row[k] for k in ('poly','alpha','x','p','eligible','leaves','S','nonresidual_leaves')})
    print('prose', {k:prose_row[k] for k in ('poly','alpha','x','p','eligible','leaves','S','nonresidual_leaves')})
