from math import comb
import json

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):
            c[i+j]+=x*y
    return c

def coeff(a,k):
    return a[k] if 0 <= k < len(a) else 0

def B(r):
    return [comb(r,k)+(1 if k==1 else 0) for k in range(r+1)]

def profile(counts, tip_r):
    N=sum(r*c for r,c in zip((2,3,4),counts))
    h=1+sum(q*c for q,c in zip((2,4,7),counts))
    C=[1,2]
    for r,n in zip((2,3,4),counts):
        for _ in range(n): C=mul(C,B(r))
    V=[1,2]
    for r,n in zip((2,3,4),counts):
        for j in range(n-(r==tip_r)): V=mul(V,B(r))
    U=mul(V,B(tip_r-1))
    E=[0]+[comb(N,s) for s in range(N+1)]
    return N,h,C,U,E

def surplus(counts,tip_r,k):
    N,h,C,U,E=profile(counts,tip_r)
    eu=coeff(U,k); ck=coeff(C,k); ckm=coeff(C,k-1)
    ek=coeff(E,k); ekp=coeff(E,k+1)
    me=ek*ck-ekp*ckm
    sm=(h+1)*eu*ck+(k+1)*(h-k+1)*me
    full=(eu+ek)*ck-(coeff(U,k+1)+ekp)*ckm
    return dict(counts=counts,tip_r=tip_r,N=N,h=h,k=k,
                U_k=eu,C_k=ck,C_km1=ckm,E_k=ek,E_kp1=ekp,
                M_E=me,exact_surplus=sm,full_tip_minor=full)

def parent_first_descent(counts):
    N=sum(r*c for r,c in zip((2,3,4),counts))
    C=[1,2]
    for r,n in zip((2,3,4),counts):
        for _ in range(n): C=mul(C,B(r))
    P=[coeff(C,k)+(comb(N+1,k-1) if 1<=k<=N+2 else 0) for k in range(N+3)]
    return next(k for k in range(len(P)) if coeff(P,k+1)<coeff(P,k))

checks=[]
for counts,r,k in [([0,0,4],4,8),([0,22,0],3,27),([0,0,24],4,49)]:
    row=surplus(counts,r,k)
    x=parent_first_descent(counts)
    N=row["N"]; alpha=N+2
    row.update(x=x,n=N+sum(counts)+3,
               actual_guards={"x_plus_2_le_k":x+2<=k,
                 "3k_lt_2alpha_plus_1":3*k<2*alpha+1,
                 "2k_le_alpha":2*k<=alpha,
                 "surplus_band":1<=k and 2*k<=N+2})
    checks.append(row)

# Direct rank-boundary and zero-extension spot checks for the binomial E minor.
boundary=[]
for counts,r in [([2,1,1],2),([0,0,1],4)]:
    N,h,C,U,E=profile(counts,r)
    for k in (0,1,(N+2)//2,(N+2)//2+1,N+1):
        boundary.append(surplus(counts,r,k))

print(json.dumps({"checks":checks,"boundary_zero_extension":boundary},indent=2))
