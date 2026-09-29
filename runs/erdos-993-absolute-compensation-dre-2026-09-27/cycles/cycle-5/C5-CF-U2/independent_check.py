from math import comb
import json
from pathlib import Path

def prod(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, ai in enumerate(a):
        for j, bj in enumerate(b):
            out[i+j] += ai*bj
    return out

def choose_poly(power):
    return [comb(power, j) for j in range(power+1)]

def coef(poly, i):
    return poly[i] if 0 <= i < len(poly) else 0

# Direct monomial expansions from G=1+2z, B3=L^3+z, B4=L^4+z.
G=[1,2]
B3=[1,4,3,1]
B4=[1,5,6,4,1]
L4=[1,4,6,4,1]
GB3=prod(G,B3)
GB4=prod(G,B4)
GB3L4=prod(GB3,L4)
GB4L4=prod(GB4,L4)
local=(coef(GB3L4,6)*coef(GB4,5)+coef(GB3,5)*coef(GB4L4,6)
       -coef(GB3L4,7)*coef(GB4,4)-coef(GB3,6)*coef(GB4L4,5))
assert (coef(GB3L4,6),coef(GB4,5),coef(GB3,5),coef(GB4L4,6),coef(GB3L4,7),coef(GB4,4),coef(GB3,6),coef(GB4L4,5)) == (51,2,0,142,15,9,0,205)
assert local == -33

# Independently enumerate activity layers as coefficient vectors in z; t^d
# layers are binom(m-1,d) z^d times the remaining L^4 factors.
def marked(base, m, d):
    if not 0 <= d <= m-1: return [0]
    v=prod(base, [comb(4*(m-1-d),j) for j in range(4*(m-1-d)+1)])
    return [0]*d + [comb(m-1,d)*x for x in v]

def minor_layer(m,d,k):
    u=[marked(GB3,m,a) for a in range(m)]
    c=[marked(GB4,m,a) for a in range(m)]
    s=0
    for a in range(m):
        b=d-a
        if 0<=b<m:
            s += coef(u[a],k)*coef(c[b],k)-coef(u[a],k+1)*coef(c[b],k-1)
    return s

# Direct t=1 polynomial for m=3, E uses N=12 and parent exponent q=13.
def add(a,b):
    o=[0]*max(len(a),len(b))
    for i,x in enumerate(a): o[i]+=x
    for i,x in enumerate(b): o[i]+=x
    return o

def powpoly(a,e):
    o=[1]
    for _ in range(e): o=prod(o,a)
    return o

cases=[]
for m in (3,4,8,20):
    k=m+4; d=2*m-3
    margin=minor_layer(m,d,k)
    assert 1<=k and 2*k<=4*m+2
    assert margin == -33*(m-1)
    cases.append({'m':m,'k':k,'2k':2*k,'N_plus_2':4*m+2,'layer_degree':d,'margin':margin})

m=3; N=12; k=7
C=prod(G,powpoly(B4,m))
U=prod(GB3,powpoly(B4,m-1))
E=[0]+choose_poly(N)
A=add(U,E)
t1=A[k]*C[k]-A[k+1]*C[k-1]
P=add(C,[0]+choose_poly(N+1))
x=next(i for i in range(len(P)) if coef(P,i+1)-coef(P,i)<0)
p_eligible=[p for p in range(x+2,100) if 3*p<2*(N+2)+1 and 2*p<=N+2]
assert t1==2076267 and x==7 and not p_eligible
out={'local_coefficients':[51,2,0,142,15,9,0,205], 'local_combination':local,
     'cases':cases,'m3_full_t1_minor':t1,'m3_parent_first_descent':x,
     'm3_eligible_p':p_eligible}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
