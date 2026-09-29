from math import comb
import json

def mul(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): out[i+j]+=x*y
    return out

def at(a,k): return a[k] if 0<=k<len(a) else 0

def B(r): return [comb(r,s)+(s==1) for s in range(r+1)]
def G(): return [1,2]
def profile(counts,tip_r):
    rs=(2,3,4); N=sum(r*c for r,c in zip(rs,counts)); h=1+sum(w*c for w,c in zip((2,4,7),counts))
    C=G(); U=G()
    removed=False
    for r,c in zip(rs,counts):
        for _ in range(c):
            C=mul(C,B(r))
            if r==tip_r and not removed:
                U=mul(U,[comb(r-1,s)+(s==1) for s in range(r)])
                removed=True
            else: U=mul(U,B(r))
    E=[0]+[comb(N,s) for s in range(N+1)]
    return N,h,C,U,E

def measures(counts,r,k):
    N,h,C,U,E=profile(counts,r)
    me=at(E,k)*at(C,k)-at(E,k+1)*at(C,k-1)
    mu=at(U,k)*at(C,k)-at(U,k+1)*at(C,k-1)
    lam_num=(h+1)*at(U,k)*at(C,k)
    lam_den=(k+1)*(h-k+1)
    margin=lam_num+lam_den*me
    full=mu+me
    assert lam_den>0
    # Exact sufficient implication: mu >= lambda*U_k*C_k, hence full >= 0 if surplus >= 0.
    lhs_ulc=mu*lam_den-lam_num
    return dict(counts=counts,r=r,N=N,h=h,k=k,guard=(1<=k and 2*k<=N+2),
                Ck=at(C,k),Ckm1=at(C,k-1),Ckp1=at(C,k+1),Uk=at(U,k),Ukp1=at(U,k+1),
                M_E=me,M_U=mu,lambda_den=lam_den,ULC_LR_cross_margin=lhs_ulc,
                exact_surplus=margin,full_tip_minor=full)

def first_descent(counts):
    N=sum(r*c for r,c in zip((2,3,4),counts));C=[1,2]
    for r,c in zip((2,3,4),counts):
        for _ in range(c): C=mul(C,B(r))
    P=[at(C,k)+(comb(N+1,k-1) if 1<=k<=N+2 else 0) for k in range(N+3)]
    return next(k for k in range(len(P)) if at(P,k+1)<at(P,k))

cases=[]
for counts,r,k in [([0,0,1],4,1),([0,0,1],4,2),([0,0,4],4,8),([0,22,0],3,27),([0,0,24],4,49)]:
    row=measures(counts,r,k); x=first_descent(counts); N=row['N']; alpha=N+2
    row.update(x=x,n=N+sum(counts)+3,actual_guards={'x+2<=k':x+2<=k,'3k<2alpha+1':3*k<2*alpha+1,'2k<=alpha':2*k<=alpha})
    cases.append(row)
# Explicit coefficient-basis check: L^r+z expands in monomials as binomial(r,s)+[s=1].
basis={str(r):{'monomial_from_binomial_expansion':B(r),'L_basis_plus_z':[[r,1]]} for r in (2,3,4)}
# Probe denominator positivity over the full guard for a nonempty minimal profile, mixed and large homogeneous profile.
for c in ([1,0,0],[0,0,1],[1,1,1],[0,0,24]):
    N,h,*_=profile(c, next(r for r,n in zip((2,3,4),c) if n))
    for k in range(1,(N+2)//2+1): assert (k+1)*(h-k+1)>0
print(json.dumps({'basis_check':basis,'cases':cases,'denominator_guard':'positive in all asserted checked ranges'},indent=2))
# At the one spot check that also satisfies the original actual-rank guards, compute the literal strict selectors.
def actual_selectors(counts,p):
    N=sum(r*c for r,c in zip((2,3,4),counts));Q=[1]
    for r,c in zip((2,3,4),counts):
        for _ in range(c): Q=mul(Q,B(r))
    E=[0]+[comb(N,s) for s in range(N+1)]
    A0=mul([1,1],Q)
    if len(A0)<len(E): A0 += [0]*(len(E)-len(A0))
    if len(E)<len(A0): E += [0]*(len(A0)-len(E))
    A0=[a+b for a,b in zip(A0,E)]
    flags={'e0_delta':at(A0,p+1)-at(A0,p),'e0':int(at(A0,p+1)-at(A0,p)<0),'tips':{}}
    for r,c in zip((2,3,4),counts):
        if c:
            H=[1]
            skipped=False
            for s,cs in zip((2,3,4),counts):
                for _ in range(cs):
                    if s==r and not skipped: skipped=True
                    else: H=mul(H,B(s))
            Ai=mul(G(),mul([comb(r-1,s)+(s==1) for s in range(r)],H))
            if len(Ai)<len(E): Ai += [0]*(len(E)-len(Ai))
            if len(E)<len(Ai): E += [0]*(len(Ai)-len(E))
            Ai=[a+b for a,b in zip(Ai,E)]
            d=at(Ai,p+1)-at(Ai,p)
            flags['tips'][str(r)]={'delta':d,'e':int(d<0),'multiplicity':r*c}
    return flags
cases[-1]['actual_strict_selectors_at_p49']=actual_selectors([0,0,24],49)
with open('independent_check.json','w') as f: json.dump({'basis_check':basis,'cases':cases,'denominator_guard':'positive in all asserted checked ranges'},f,indent=2)
