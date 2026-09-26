from itertools import combinations
from math import comb
import json

def conv(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): out[i+j]+=x*y
    return out

def add(a,b):
    n=max(len(a),len(b)); return [(a[i] if i<len(a) else 0)+(b[i] if i<len(b) else 0) for i in range(n)]

def independent_poly(n, edges, keep=None):
    if keep is None: keep=set(range(n))
    vs=sorted(keep); out=[0]*(len(vs)+1)
    em=[(u,v) for u,v in edges if u in keep and v in keep]
    for mask in range(1<<len(vs)):
        chosen={vs[i] for i in range(len(vs)) if mask>>i&1}
        if all(not(u in chosen and v in chosen) for u,v in em): out[len(chosen)]+=1
    while len(out)>1 and out[-1]==0: out.pop()
    return out

def coeff(a,j): return a[j] if 0<=j<len(a) else 0
def delta(a,j): return coeff(a,j+1)-coeff(a,j)
def shift_z(a): return [0]+a

def trial(profile):
    m=len(profile); n=3+m+sum(profile); centers=list(range(3,3+m)); edges={(0,1),(1,2)}
    leaves=[2]; support={2:1}
    next_leaf=3+m
    for i,(c,r) in enumerate(zip(centers,profile)):
        edges.add((0,c))
        for _ in range(r):
            v=next_leaf; next_leaf+=1; leaves.append(v); support[v]=c; edges.add((c,v))
    E=sorted(edges); P=independent_poly(n,E); N=sum(profile); L=[1,1];
    Q=[1]
    for r in profile: Q=conv(Q,add([comb(r,j) for j in range(r+1)],[0,1]))
    formulaP=add(conv([1,2],Q),[0]+[comb(N+1,j) for j in range(N+2)])
    assert P==formulaP,(profile,'P',P,formulaP)
    a=len(P)-1
    d=[delta(P,j) for j in range(a+1)]
    x=next(j for j,y in enumerate(d) if y<0)
    tippolys=[]
    summands=[]
    for v in leaves:
        A=independent_poly(n,E,set(range(n))-{v})
        # Original selector uses Delta_p(T-v).
        # For each p below, calculate its polynomial directly.
        tippolys.append(A)
    eligible=[]
    for p in range(x+2, (2*a)//3+1 if (2*a)//3+1>=x+2 else x+2):
        if 3*p>=2*a+1: continue
        F=[]; S=0; vals=[]
        for v in leaves:
            c=support[v]
            Av=independent_poly(n,E,set(range(n))-{v})
            if delta(Av,p)<0:
                F.append(v)
                H=independent_poly(n,E,set(range(n))-{v,c})
                R=independent_poly(n,E,set(range(n))-{c}-({u for u in range(n) if u!=c and any((min(u,c),max(u,c))==e for e in E)}))
                term=delta(H,p-1)-delta(R,p-1)
                vals.append((v,term)); S+=term
        eligible.append({'p':p,'eligible_count':len(F),'selected_count':len(F),'S':S,'terms':vals})
    return {'profile':profile,'n':n,'alpha':a,'x':x,'P_coefficients_match':True,'eligible':eligible}

rows=[trial([12]),trial([2,3])]
print(json.dumps(rows,indent=2))
