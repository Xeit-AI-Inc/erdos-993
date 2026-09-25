"""Independent closed-form T_100 audit and direct-subset mixed-rank test."""
import json
from math import comb

def add(a, b):
    return [((a[k] if k < len(a) else 0) + (b[k] if k < len(b) else 0)) for k in range(max(len(a), len(b)))]

def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for k, v in enumerate(a):
        for j, w in enumerate(b):
            out[k+j] += v*w
    return out

def power(a, m):
    out = [1]
    for _ in range(m):
        out = mul(out, a)
    return out

def choose_poly(n):
    return [comb(n, k) for k in range(n+1)]

def c(a, k):
    return a[k] if 0 <= k < len(a) else 0

def d(a, k):
    return c(a, k+1)-c(a, k)

def trim(a):
    while a and a[-1] == 0:
        a.pop()
    return a

def first_descent(a):
    return next(k for k in range(len(a)) if d(a,k)<0)

m=100
A=[1,4,3,1]  # one 3-leaf star: center chosen or omitted
Am=power(A,m)
P=trim(add(mul([1,2],Am),mul([0,1],choose_poly(3*m+1))))
p=len(P)-3
x=first_descent(P)
# Marked arm leaf, from inclusion/exclusion of central hub.
H0=trim(add(Am,mul([0,1],choose_poly(3*m))))
R0=Am
Pv0=trim(add(mul([1,1],Am),mul([0,1],choose_poly(3*m))))
q0p=c(H0,p)-c(R0,p)
q0m=c(H0,p-1)-c(R0,p-1)
# A leaf of a 3-leaf star. The removed support isolates its two siblings.
Hm=trim(add(mul(mul([1,2],[1,2,1]),power(A,m-1)),mul([0,1],choose_poly(3*m))))
Rm=mul([1,2],power(A,m-1))
Pvm=trim(add(Hm,mul([0,1],Rm)))
qmp=c(Hm,p)-c(Rm,p)
qmm=c(Hm,p-1)-c(Rm,p-1)
big={"order":4*m+3,"alpha":len(P)-1,"x":x,"p":p,"eligible":x+2<=p,
     "marked":{"delta_selector":d(Pv0,p),"q_p":q0p,"q_pm1":q0m,"g":q0p-q0m},
     "star_leaf":{"delta_selector":d(Pvm,p),"q_p":qmp,"q_pm1":qmm,"g":qmp-qmm},
     "aggregate":q0p-q0m+3*m*(qmp-qmm)}

# A hub with a length-three arm and m 3-leaf stars has both residual and
# non-residual original leaves. Enumerate all subsets directly at m=2.
m=2
edges=[(0,1),(1,2),(2,3)]
for j in range(m):
    s=4+4*j
    edges.append((0,s))
    edges.extend((s,s+t) for t in (1,2,3))
n=4+4*m
adj=[set() for _ in range(n)]
for u,v in edges:
    adj[u].add(v); adj[v].add(u)

def enumerate_poly(removed):
    alive=[v for v in range(n) if v not in removed]
    out=[0]*(len(alive)+1)
    maxsets=[]
    for bits in range(1<<len(alive)):
        chosen={alive[j] for j in range(len(alive)) if bits>>j&1}
        if any(u in chosen and v in chosen for u,v in edges):
            continue
        out[len(chosen)]+=1
        if len(chosen)>len(maxsets[0]) if maxsets else True:
            maxsets=[chosen]
        elif len(chosen)==len(maxsets[0]):
            maxsets.append(chosen)
    return trim(out),maxsets

Q,maxsets=enumerate_poly(set())
p2=len(Q)-3
x2=first_descent(Q)
rows=[]
for v in range(n):
    if len(adj[v])!=1:
        continue
    s=next(iter(adj[v])); W=adj[s]-{v}
    H,_=enumerate_poly({v,s})
    R,_=enumerate_poly({s}|adj[s])
    Pv,_=enumerate_poly({v})
    rows.append({"leaf":v,"support":s,"residual":all(v in M for M in maxsets),
                 "alpha_H":len(H)-1,"alpha_R":len(R)-1,
                 "selector":d(Pv,p2),"favorable":d(Pv,p2)<0,
                 "q_p":c(H,p2)-c(R,p2),"q_pm1":c(H,p2-1)-c(R,p2-1),
                 "g":d(H,p2-1)-d(R,p2-1),
                 "identity_check":d(Pv,p2)==d(H,p2)+d(R,p2-1)})
mixed={"order":n,"edges":edges,"independence_coefficients":Q,"alpha":len(Q)-1,"x":x2,"p":p2,
       "eligible":x2+2<=p2,"maxsets":[sorted(M) for M in maxsets],"rows":rows,
       "aggregate":sum(r["g"] for r in rows if r["favorable"])}

print(json.dumps({"T100":big,"mixed_T2":mixed},indent=2,sort_keys=True))
