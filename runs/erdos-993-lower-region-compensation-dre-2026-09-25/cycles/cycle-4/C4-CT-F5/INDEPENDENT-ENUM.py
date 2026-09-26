#!/usr/bin/env python3
"""Literal subset reconstruction of T_m for m=1..3; no producer polynomial routines."""
import json
from pathlib import Path

def graph(m):
    edges=[(0,1),(1,2)]; nextv=3; tips=[]
    for _ in range(m):
        c=nextv; nextv+=1; edges.append((0,c))
        for _ in range(3):
            v=nextv; nextv+=1; tips.append(v); edges.append((c,v))
    return nextv,edges,tips

def polynomial(n,edges,keep):
    adj=[0]*n
    for u,v in edges:
        if (keep>>u)&1 and (keep>>v)&1: adj[u]|=1<<v; adj[v]|=1<<u
    verts=[v for v in range(n) if (keep>>v)&1]
    counts=[0]*(len(verts)+1)
    for sub in range(1<<len(verts)):
        chosen=0; size=0
        for i,v in enumerate(verts):
            if (sub>>i)&1: chosen|=1<<v; size+=1
        if all(not ((chosen>>u)&1 and (adj[u]&chosen)) for u in verts): counts[size]+=1
    return counts

def coeff(a,j): return a[j] if 0<=j<len(a) else 0
def delta(a,j): return coeff(a,j+1)-coeff(a,j)

results=[]
for m in range(1,4):
    n,edges,tips=graph(m); adj=[[] for _ in range(n)]
    for u,v in edges: adj[u].append(v); adj[v].append(u)
    seen={0}; todo=[0]
    while todo:
        u=todo.pop()
        for v in adj[u]:
            if v not in seen: seen.add(v); todo.append(v)
    assert len(seen)==n and len(edges)==n-1
    leaves=[v for v in range(n) if len(adj[v])==1]
    assert set(leaves)=={2,*tips}
    full=(1<<n)-1; P=polynomial(n,edges,full)
    alpha=max(j for j,c in enumerate(P) if c)
    x=next(j for j in range(alpha+1) if delta(P,j)<0)
    rows=[]
    for p in range(x+2,alpha+2):
        if not 3*p<2*alpha+1: continue
        F=[]; summands=[]
        for v in leaves:
            s=adj[v][0]; pv=polynomial(n,edges,full^(1<<v))
            if delta(pv,p)<0:
                H=full^(1<<v)^(1<<s); R=full
                for u in {s,*adj[s]}: R^=1<<u
                assert H&R==R
                qh=polynomial(n,edges,H); qr=polynomial(n,edges,R)
                term=(coeff(qh,p)-coeff(qh,p-1))-(coeff(qr,p)-coeff(qr,p-1))
                F.append(v); summands.append({'leaf':v,'support':s,'term':term})
        rows.append({'p':p,'F':F,'summands':summands,'S':sum(z['term'] for z in summands)})
    results.append({'m':m,'order':n,'connected':True,'acyclic_by_edge_count':True,'P':P,'alpha':alpha,'x':x,'rows':rows})
Path(__file__).with_name('INDEPENDENT-ENUM.json').write_text(json.dumps({'method':'literal independent-subset enumeration on the explicit original graph and each induced deletion','max_order':15,'trees':results},indent=2)+'\n')
print(json.dumps([{'m':r['m'],'order':r['order'],'alpha':r['alpha'],'x':r['x'],'eligible_rows':len(r['rows']),'rows':[{'p':z['p'],'F_count':len(z['F']),'S':z['S']} for z in r['rows']]} for r in results],indent=2))
