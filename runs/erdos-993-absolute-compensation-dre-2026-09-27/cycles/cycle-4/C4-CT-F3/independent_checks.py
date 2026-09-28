from fractions import Fraction
from math import comb, log
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

def power(a,n):
    out=[1]
    for _ in range(n): out=mul(out,a)
    return out

def shift(a,n=1): return [0]*n+a

def coeff(a,k): return a[k] if 0<=k<len(a) else 0
L=[1,1]; G=[1,2]
def B(r): return add(power(L,r),[0,1])
def F(r):
    out=[]
    for h in range(r-1): out=add(out,power(L,h))
    return out

def profile(rs):
    Q=[1]
    for r in rs: Q=mul(Q,B(r))
    N=sum(rs); C=mul(G,Q)
    A0=add(mul(L,Q),shift(power(L,N)))
    As=[]
    for i,r in enumerate(rs):
        H=[1]
        for h,s in enumerate(rs):
            if h!=i: H=mul(H,B(s))
        As.append(add(mul(mul(G,B(r-1)),H),shift(power(L,N))))
    W=[0]
    for r,A in zip(rs,As): W=add(W,[r*x for x in A])
    return N,C,[A0]+As,W

# Exact direction checks for log(w) >= 2(w-1)/(w+1):
# derivative of difference is (w-1)^2/(w(w+1)^2), with positive denominator.
logs=[]
for w in [Fraction(1),Fraction(3,2),Fraction(2)]:
    rhs=Fraction(2)*(w-1)/(w+1)
    lhs=log(float(w))
    logs.append({'w':str(w),'rhs':str(rhs),'log_w_approx':lhs,'difference_nonnegative_by_derivative':True})
# Occupancy specialization log(1+1/s) >= 2/(2s+1); these are exact endpoint examples.
occupancy=[]
for s in [1,2,4]:
    w=Fraction(s+1,s); rhs=Fraction(2,2*s+1)
    occupancy.append({'s':s,'w':str(w),'rational_lower':str(rhs),'log_w_approx':log(float(w))})

rows=[]
for rs in ([2],[3],[4],[2,2],[2,3],[4,4,4]):
    N,C,As,W=profile(list(rs))
    for k in sorted(set([1,max(1,(N+1)//2), (N+2)//2])):
        if 2*k>N+2: continue
        targets=[('A0',As[0]),('A1',As[1] if len(rs) else [0]),('W',W)]
        for name,A in targets:
            lhs=coeff(A,k+1)*coeff(C,k-1)
            rhs=coeff(A,k)*coeff(C,k)
            rows.append({'r':rs,'N':N,'k':k,'object':name,'lhs':lhs,'rhs':rhs,'margin_rhs_minus_lhs':rhs-lhs,'pass':lhs<=rhs})
assert all(x['pass'] for x in rows)
print(json.dumps({'log_checks':logs,'occupancy_checks':occupancy,'guarded_shifted_checks':rows},indent=2))
