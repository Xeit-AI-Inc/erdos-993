#!/usr/bin/env python3
"""Independent exact checks for the C4-AT adjudication; reads only listed case data."""
from functools import lru_cache
from math import comb
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent


def add(a, b):
    c = [0] * max(len(a), len(b))
    for j, v in enumerate(a): c[j] += v
    for j, v in enumerate(b): c[j] += v
    return c


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for j, v in enumerate(a):
        for k, w in enumerate(b): c[j+k] += v*w
    return c


def power(a, n):
    o = [1]
    for _ in range(n): o = mul(o, a)
    return o


def coeff(a, j): return a[j] if 0 <= j < len(a) else 0
def delta(a, j): return coeff(a, j+1)-coeff(a, j)


def forest_poly(n, edges, removed=()):
    adj = [0]*n
    for u,v in edges:
        adj[u] |= 1 << v; adj[v] |= 1 << u
    mask = ((1 << n)-1) & ~sum((1 << u) for u in removed)

    @lru_cache(None)
    def rec(m):
        if not m: return (1,)
        bit = m & -m; u = bit.bit_length()-1
        away = rec(m ^ bit)
        chosen = rec((m ^ bit) & ~adj[u])
        return tuple(add(list(away), [0]+list(chosen)))
    return list(rec(mask))


route = json.loads((ROOT/'cycles/cycle-4/C4-T1/EVIDENCE.json').read_text())
edges = route['edges']; n=route['n']
degree = [0]*n; neighbors = [set() for _ in range(n)]
for u,v in edges:
    degree[u] += 1; degree[v] += 1
    neighbors[u].add(v); neighbors[v].add(u)
assert len(edges) == n-1
seen={0}; stack=[0]
while stack:
    for w in neighbors[stack.pop()]:
        if w not in seen: seen.add(w); stack.append(w)
assert len(seen)==n
P = forest_poly(n,edges)
assert P == route['tree_counts']
alpha=len(P)-1
x=next(j for j in range(alpha+1) if delta(P,j)<0)
p=10; k=p-1
leaves=[u for u in range(n) if degree[u]==1]
rows=[]
for v in leaves:
    s=next(iter(neighbors[v]))
    D=forest_poly(n,edges,{v})
    H=forest_poly(n,edges,{v,s})
    R=forest_poly(n,edges,{s}|neighbors[s])
    selected=delta(D,p)<0
    qk=coeff(H,k)-coeff(R,k)
    qk1=coeff(H,k+1)-coeff(R,k+1)
    rows.append(dict(v=v,s=s,selector=delta(D,p),selected=selected,qk=qk,qk1=qk1,summand=qk1-qk))
assert (alpha,x,len(leaves)) == (15,8,11)
assert x+2<=p and 3*p<2*alpha+1
assert all(r['selected'] for r in rows)
assert sum(r['summand'] for r in rows)==-51095
assert [r['selector'] for r in rows]==[r['Delta_p_T_minus_v'] for r in route['leaf_rows']]
assert [r['summand'] for r in rows]==[r['summand'] for r in route['leaf_rows']]

L=[1,1]; B=[1,4,3,1]
tm_rows=0; nonempty=[]; selectors=set(); nonnegative=0; m3=None
for m in range(1,81):
    lm=power(L,3*m)
    P=add(mul([1,2],power(B,m)), mul([0,1],power(L,3*m+1)))
    armD=add(mul(L,power(B,m)),mul([0,1],lm))
    clawD=add(mul(mul([1,2],[1,3,1]),power(B,m-1)),mul([0,1],lm))
    qa=mul([0,1],lm)
    qc=add(mul(mul(mul([0,1],[2,1]),[1,2]),power(B,m-1)),qa)
    a=len(P)-1
    x=next(j for j in range(a+1) if delta(P,j)<0)
    anyrow=False
    for p in range(x+2,a+1):
        if 3*p>=2*a+1: continue
        anyrow=True; tm_rows+=1
        fa=delta(armD,p)<0; fc=delta(clawD,p)<0
        selectors.add((fa,fc))
        Sa=delta(qa,p-1); Sc=delta(qc,p-1)
        S=fa*Sa+3*m*fc*Sc
        if S>=0: nonnegative+=1
        if (m,p)==(3,7): m3=dict(a=a,x=x,arm_selector=delta(armD,p),claw_selector=delta(clawD,p),arm_term=Sa,claw_term=Sc,S=S)
    if anyrow: nonempty.append(m)
assert (tm_rows,len(nonempty),selectors,nonnegative)==(1749,78,{(True,True)},0)
assert m3==dict(a=11,x=5,arm_selector=-141,claw_selector=-110,arm_term=-42,claw_term=-125,S=-1167)

starP=[comb(12,j)+(j==1) for j in range(13)]
assert next(j for j in range(13) if delta(starP,j)<0)==6
assert delta([comb(11,j)+(j==1) for j in range(12)],8)==-110
assert 12*(comb(11,8)-comb(11,7))==-1980
result={
  'T1':{'n':n,'edges':len(edges),'alpha':alpha,'x':8,'p':10,'leaves':leaves,'rows':rows,'S':-51095},
  'T5':{'m_boundary':[1,80],'eligible_rows':tm_rows,'nonempty_m_count':len(nonempty),'selector_patterns':[list(v) for v in selectors],'nonnegative_sums':nonnegative,'m3p7':m3},
  'T4_star':{'alpha':12,'x':6,'p':8,'selected_tags':12,'selector_each':-110,'summand_each':-165,'S':-1980},
}
(OUT/'CHECK.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:({kk:vv for kk,vv in v.items() if kk!='rows'} if isinstance(v,dict) else v) for k,v in result.items()},indent=2))
