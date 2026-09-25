"""Independent closed-form family check and brute labeled Prüfer sweep."""
from collections import Counter
from itertools import product
from math import comb
import json

def add(*polys):
    out = [0] * max(map(len, polys))
    for p in polys:
        for k, a in enumerate(p): out[k] += a
    return out

def mul(a, b):
    out = [0] * (len(a)+len(b)-1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): out[i+j] += x*y
    return out

def power(p, n):
    out = [1]
    for _ in range(n): out = mul(out, p)
    return out

def coeff(p,k): return p[k] if 0 <= k < len(p) else 0
def delta(p,k): return coeff(p,k+1)-coeff(p,k)
def descent(p): return next(k for k in range(len(p)) if delta(p,k)<0)

def family_row(m,p):
    A=[1,4,3,1]
    B=[1,3,1]
    one=[1,1]
    T=add(mul([1,2],power(A,m)),mul([0,1],power(one,3*m+1)))
    marked_deleted=add(mul(one,power(A,m)),mul([0,1],power(one,3*m)))
    arm_deleted=add(mul(mul([1,2],B),power(A,m-1)),mul([0,1],power(one,3*m)))
    # H-R for marked leaf: z(1+z)^(3m).
    marked_hr=mul([0,1],power(one,3*m))
    # H-R for each arm leaf: (2z+5z^2+2z^3) A^(m-1)+z(1+z)^(3m).
    arm_hr=add(mul([0,2,5,2],power(A,m-1)),marked_hr)
    marked_g=delta(marked_hr,p-1)
    arm_g=delta(arm_hr,p-1)
    favorable_marked=delta(marked_deleted,p)<0
    favorable_arm=delta(arm_deleted,p)<0
    return dict(m=m,order=4*m+3,alpha=len(T)-1,x=descent(T),rank=p,
      marked_selector_delta=delta(marked_deleted,p),arm_selector_delta=delta(arm_deleted,p),
      marked_favorable=favorable_marked,arm_favorable=favorable_arm,
      favorable_leaf_count=int(favorable_marked)+3*m*int(favorable_arm),
      marked_g=marked_g,arm_g=arm_g,
      complete_aggregate=(marked_g if favorable_marked else 0)+(3*m*arm_g if favorable_arm else 0))

def prufer_adjacency(seq,n):
    deg=[1]*n
    for v in seq: deg[v]+=1
    adj=[0]*n
    for v in seq:
        u=min(i for i in range(n) if deg[i]==1)
        adj[u] |= 1<<v; adj[v] |= 1<<u
        deg[u]-=1; deg[v]-=1
    u,v=[i for i in range(n) if deg[i]==1]
    adj[u] |= 1<<v; adj[v] |= 1<<u
    return adj

def brute_poly(adj):
    n=len(adj)
    valid=bytearray(1<<n);valid[0]=1
    counts=[1]+[0]*n
    for mask in range(1,1<<n):
        bit=mask&-mask; v=bit.bit_length()-1; rest=mask^bit
        if valid[rest] and not (adj[v]&rest):
            valid[mask]=1; counts[mask.bit_count()]+=1
    while len(counts)>1 and counts[-1]==0: counts.pop()
    return counts

if __name__=='__main__':
    rows=[family_row(m,p) for m,p in ((22,66),(22,34),(60,180),(60,90))]
    sweeps=[]
    for n in range(2,9):
        total=eligible=0
        by_alpha=Counter()
        for seq in product(range(n),repeat=n-2):
            pol=brute_poly(prufer_adjacency(seq,n))
            alpha=len(pol)-1;x=descent(pol)
            total+=1
            if x+2<=alpha-2:
                eligible+=1;by_alpha[alpha]+=1
        assert total==n**(n-2)
        sweeps.append(dict(order=n,processed=total,eligible=eligible,eligible_alpha_counts=dict(by_alpha)))
    print(json.dumps(dict(family=rows,sweep=sweeps,sweep_total=sum(x['processed'] for x in sweeps)),indent=2))
