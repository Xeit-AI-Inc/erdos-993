"""Independent exact coefficient check for the guarded weighted LR claim."""
from itertools import product
from math import comb
import json


def add(a,b):
    out=[0]*max(len(a),len(b))
    for i,v in enumerate(a): out[i]+=v
    for i,v in enumerate(b): out[i]+=v
    return out

def mul(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): out[i+j]+=x*y
    return out

def scale(a,s): return [s*x for x in a]
def binpow(n): return [comb(n,j) for j in range(n+1)]
def branch(r):
    v=binpow(r)
    v[1]+=1
    return v

def coeff(a,k): return a[k] if 0<=k<len(a) else 0

def profile(counts):
    rs=[r for r,c in zip((2,3,4),counts) for _ in range(c)]
    N=sum(rs)
    C=[1,2]
    for r in rs: C=mul(C,branch(r))
    # Directly form each original-tip deletion main term and preserve r_i weight.
    U=[0]
    for i,r in enumerate(rs):
        term=[1,2]
        for h,s in enumerate(rs): term=mul(term,branch(s-1 if h==i else s))
        U=add(U,scale(term,r))
    E=mul([0,1],binpow(N))
    W=add(U,scale(E,N))
    return N,C,U,E,W

profiles=[]
for m in range(1,6):
    for a in range(m+1):
        for b in range(m-a+1):
            c=m-a-b
            profiles.append((a,b,c))
profiles += [(2,3,4),(4,1,2),(0,12,10),(0,0,1),(1,0,0),(0,1,0)]
rows=[]
for counts in profiles:
    N,C,U,E,W=profile(counts)
    upper=(N+2)//2
    margins=[coeff(W,k)*coeff(C,k)-coeff(W,k+1)*coeff(C,k-1) for k in range(1,upper+1)]
    # The listed boundary and interior values expose the exact sign convention.
    probes=sorted(set([1,upper,max(1,(upper+1)//2)]))
    rows.append({"counts":counts,"N":N,"guard":upper,"ranks_checked":len(margins),
                 "minimum_signed_target_margin":min(margins),
                 "all_target_margins_nonnegative":all(v>=0 for v in margins),
                 "probe_margins":{"%d"%k:margins[k-1] for k in probes}})
N,C,U,E,W=profile((0,22,0))
controls=[]
for k in (26,27,28):
    controls.append({"k":k,"in_guard":2*k<=N+2,
        "E_only_minor":coeff(E,k)*coeff(C,k)-coeff(E,k+1)*coeff(C,k-1),
        "full_W_target_margin":coeff(W,k)*coeff(C,k)-coeff(W,k+1)*coeff(C,k-1)})
print(json.dumps({"method":"direct products and direct weighted sum of original tip-deletion factors; exact integers; integer zero extension",
                  "profiles_checked":len(rows),"guarded_ranks_checked":sum(x['ranks_checked'] for x in rows),
                  "all_nonnegative":all(x['all_target_margins_nonnegative'] for x in rows),
                  "rows":rows,
                  "signed_E_obstruction_control":{"counts":[0,22,0],"N":N,"guard":(N+2)//2,"ranks":controls}},indent=2))
