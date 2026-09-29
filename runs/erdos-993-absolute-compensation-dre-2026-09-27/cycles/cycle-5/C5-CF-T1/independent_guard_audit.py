"""Independent exact coefficient checks for the C5-T1 weighted LR claim."""
from math import comb
import json


def conv(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): c[i+j] += x*y
    return c

def plus(a, b):
    c = [0] * max(len(a), len(b))
    for i, x in enumerate(a): c[i] += x
    for i, x in enumerate(b): c[i] += x
    return c

def times(a, q): return [q*x for x in a]
def coef(a, k): return a[k] if 0 <= k < len(a) else 0
def powL(n): return [comb(n,k) for k in range(n+1)]
def B(r):
    x = [comb(r,k) for k in range(r+1)]
    x[1] += 1
    return x

def profile(counts):
    N=sum(r*c for r,c in zip((2,3,4),counts))
    C=[1,2]
    for r,c in zip((2,3,4),counts):
        for _ in range(c): C=conv(C,B(r))
    arities=[]
    for r,c in zip((2,3,4),counts): arities += [r]*c
    U=[0]
    for i,r in enumerate(arities):
        H=[1]
        for j,s in enumerate(arities):
            if i != j: H=conv(H,B(s))
        Ui=conv(conv([1,2],B(r-1)),H)
        U=plus(U,times(Ui,r))
    E=[0]+powL(N)
    W=plus(U,times(E,N))
    h=1+2*counts[0]+4*counts[1]+7*counts[2]
    return N,C,U,E,W,h

def margin(poly,C,k):
    return coef(poly,k)*coef(C,k)-coef(poly,k+1)*coef(C,k-1)

profiles=[(1,0,0),(0,1,0),(0,0,1),(2,3,4),(4,1,2),(0,1,1),(1,1,1),(3,0,2)]
rows=[]
for counts in profiles:
    N,C,U,E,W,h=profile(counts)
    guard=(N+2)//2
    ranks=sorted(set((1,max(1,guard//2),guard)))
    checks=[]
    for k in ranks:
        mW,mU,mE=margin(W,C,k),margin(U,C,k),margin(E,C,k)
        sufficient=(h+1)*coef(U,k)*coef(C,k)+(k+1)*(h-k+1)*N*mE
        assert mW==mU+N*mE
        assert (k+1)*(h-k+1)>0
        checks.append({'k':k,'is_boundary':k==guard,'M_W':mW,'M_U':mU,'M_E':mE,'ulc_sufficient_margin':sufficient})
    rows.append({'counts':counts,'N':N,'guard':guard,'h':h,'checks':checks})

def focused(counts,k):
    N,C,U,E,W,h=profile(counts)
    return {'counts':counts,'N':N,'vertices_n':3+sum(counts)+N,'k':k,
            'guard':(N+2)//2,'guarded':1<=k and 2*k<=N+2,
            'M_E':margin(E,C,k),'M_W':margin(W,C,k)}

controls=[focused((0,22,0),27),focused((38,0,1),77)]
print(json.dumps({'scope':'Exact integer spot checks at lower/interior/boundary guarded ranks on eight profiles; plus handoff controls. Not a universal proof.',
 'profile_count':len(rows),'rank_checks':sum(len(x['checks']) for x in rows),
 'all_weighted_checks_nonnegative':all(c['M_W']>=0 for x in rows for c in x['checks']),
 'all_ulc_sufficient_checks_nonnegative':all(c['ulc_sufficient_margin']>=0 for x in rows for c in x['checks']),
 'rows':rows,'controls':controls},indent=2))
