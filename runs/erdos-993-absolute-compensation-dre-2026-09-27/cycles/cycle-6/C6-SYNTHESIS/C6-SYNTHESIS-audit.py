"""Independent exact spot checks for the C6 synthesis; no producer imports."""
from fractions import Fraction
from math import comb, factorial
import json


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def poly_pow(a, n):
    out = [1]
    for _ in range(n):
        out = mul(out, a)
    return out


B = {r: [comb(r, k) + (k == 1) for k in range(r + 1)] for r in range(1, 5)}
G = B[1]


def row(counts, marked, k):
    m = sum(counts)
    N = sum(r * counts[r - 2] for r in range(2, 5))
    h = 1 + sum({2: 2, 3: 4, 4: 7}[r] * counts[r - 2] for r in range(2, 5))
    Q = [1]
    H = [1]
    for r in range(2, 5):
        Q = mul(Q, poly_pow(B[r], counts[r - 2]))
        H = mul(H, poly_pow(B[r], counts[r - 2] - (r == marked)))
    C = mul(G, Q)
    U = mul(mul(G, B[marked - 1]), H)
    U0 = mul([1, 1], Q)
    E = [0] + [comb(N, j) for j in range(N + 1)]
    M = coeff(E, k) * coeff(C, k) - coeff(E, k + 1) * coeff(C, k - 1)
    S = (h + 1) * coeff(U, k) * coeff(C, k) + (k + 1) * (h - k + 1) * M
    tip = (coeff(U, k) + coeff(E, k)) * coeff(C, k) - (coeff(U, k + 1) + coeff(E, k + 1)) * coeff(C, k - 1)
    endpoint = (coeff(U0, k) + coeff(E, k)) * coeff(C, k) - (coeff(U0, k + 1) + coeff(E, k + 1)) * coeff(C, k - 1)
    return dict(counts=counts, m=m, N=N, h=h, marked=marked, k=k,
                guard=2*k <= N+2, Ckm1=coeff(C,k-1), Ck=coeff(C,k),
                Ek=coeff(E,k), Ekp1=coeff(E,k+1), Uk=coeff(U,k),
                E_minor=M, surplus=S, tip_minor=tip, endpoint_minor=endpoint)


def g(N, k, r):
    return Fraction(2*r, 2*r+1) * Fraction(comb(N-r, k-1), comb(N,k))


def minors(a,b):
    return [coeff(a,u)*coeff(b,v)-coeff(a,v)*coeff(b,u)
            for u in range(len(b)) for v in range(u+1,len(b))]


coverage = []
for m in range(1,100):
    profiles = 0
    rows = 0
    for a2 in range(m+1):
        for a3 in range(m-a2+1):
            a4 = m-a2-a3
            N = 2*a2+3*a3+4*a4
            profiles += 1
            rows += sum(a > 0 for a in (a2,a3,a4))*((N+2)//2)
    S = 3*comb(m+1,2)
    u = m//2
    O = 3*u*u+u if m%2 == 0 else (u+1)*(3*u+1)
    assert rows == ((3*m+2)*S-O)//2
    coverage.append((profiles,rows))
assert sum(x for x,_ in coverage)==171699
assert sum(x for _,x in coverage)==56245000

operator = {}
for r,a in B.items():
    d = [0]*(r+1)
    for i in range(r):
        d[i] += 3*(i+1)*a[i+1]
        d[i+1] += 2*(i+1)*a[i+1]
    for i,c in enumerate(a):
        d[i] -= 2*r*c
    operator[r] = d
assert operator == {1:[4,0],2:[5,0,0],3:[6,2,3,0],4:[7,6,12,4,0]}
assert all(v>0 for r in (2,3,4) for v in minors(B[r-1],B[r]))
assert minors([1,1],G)==[1]

taylor = lambda d,x: sum((x**j/Fraction(factorial(j))) for j in range(d+1))
assert taylor(8,Fraction(99,20))>102 and taylor(7,Fraction(99,20))>20
g_checks=[]
for N in (200,201,240,400):
    K=(N+2)//2
    for k in (N//4+1,(N//4+1+K)//2,K):
        assert g(N,k,2)>=g(N,k,3)>=g(N,k,4)>=Fraction(1,20)
        g_checks.append((N,k,str(g(N,k,4))))

small = row((1,0,0),2,1)
assert (small['surplus'],small['tip_minor'])==(98,19)
mixed = row((1,0,1),2,1)
assert mixed['Uk']==9
obstructions=[row((0,22,0),3,27),row((38,0,1),4,77),row((0,0,3),4,7)]
assert obstructions[0]['E_minor']<0<obstructions[0]['tip_minor']
assert obstructions[1]['tip_minor']<0 and not obstructions[1]['guard']

# A separate actual-first-descent control, with both eligible boundary ranks.
m=40
N=3*m
Q=poly_pow(B[3],m)
C=mul(G,Q)
E=[0]+[comb(N,k) for k in range(N+1)]
Pbase=[0]+[comb(N+1,k) for k in range(N+2)]
P=[coeff(C,k)+coeff(Pbase,k) for k in range(max(len(C),len(Pbase)))]
x=next(k for k in range(len(P)) if coeff(P,k+1)<coeff(P,k))
assert x==58
H=poly_pow(B[3],m-1)
A0=mul([1,1],Q)
Ai=mul(mul(G,B[2]),H)
T=mul(mul(G,[2,1]),H)  # F3=1+L=2+z, expanded in z.
A0=[coeff(A0,k)+coeff(E,k) for k in range(max(len(A0),len(E)))]
Ai=[coeff(Ai,k)+coeff(E,k) for k in range(max(len(Ai),len(E)))]
actual=[]
for p in (60,61):
    assert x+2<=p and 3*p<2*(N+2)+1 and 2*p<=N+2
    j=p-2
    delta=N+1-j
    D=comb(N,j+1)-comb(N,j)
    e0=int(coeff(A0,p+1)<coeff(A0,p))
    ei=int(coeff(Ai,p+1)<coeff(Ai,p))
    b=e0+N*ei
    A=N*ei*coeff(T,j)
    mass=A-b*delta*D
    payment=(delta*coeff(C,j)-(delta-1)*coeff(C,j+1))*A-b*delta*D*coeff(C,j)
    margin=(delta-1)*coeff(T,j)*coeff(C,j+1)-delta*coeff(T,j+1)*coeff(C,j)
    assert D>0 and coeff(C,j)>0 and 0<coeff(C,j+1)<coeff(C,j)
    assert (e0,ei)==(1,1) and mass>0 and payment>0 and margin>=0
    actual.append(dict(p=p,j=j,x=x,delta=delta,e0=e0,ei=ei,b=b,
                       Cj=coeff(C,j),Cjp1=coeff(C,j+1),Tj=coeff(T,j),
                       D=D,mass_margin=mass,payment_margin=payment,
                       relative_margin=margin))

data=dict(blocks=B,operator=operator,local_minors={str(r):min(minors(B[r-1],B[r])) for r in (2,3,4)},
          coverage=dict(profiles=sum(x for x,_ in coverage), rows=sum(x for _,x in coverage),
                        first=coverage[0],last=coverage[-1]),
          taylor=dict(E8=str(taylor(8,Fraction(99,20))),E7=str(taylor(7,Fraction(99,20)))),
          g_boundary_interior=g_checks,small=small,mixed=mixed,obstructions=obstructions,
          actual_first_descent=actual)
with open('C6-SYNTHESIS-audit.json','w') as f:
    json.dump(data,f,indent=2,sort_keys=True)
print('exact checks passed')
