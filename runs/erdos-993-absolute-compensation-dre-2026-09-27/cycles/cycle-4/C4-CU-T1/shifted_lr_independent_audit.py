#!/usr/bin/env python3
"""Independent binomial-basis reconstruction and audit for C4-T1 case."""
import json
from math import comb


def terms_for_profile(rs, special=None):
    """List (z_degree, L_exponent) terms before expanding L=1+z."""
    terms = {(0, 0): 1}
    for idx, r in enumerate(rs):
        arity = r - 1 if idx == special else r
        nxt = {}
        for (zdeg, lexp), ways in terms.items():
            nxt[(zdeg, lexp + arity)] = nxt.get((zdeg, lexp + arity), 0) + ways
            nxt[(zdeg + 1, lexp)] = nxt.get((zdeg + 1, lexp), 0) + ways
        terms = nxt
    return terms


def expand(terms, g_factor=False, l_factor=0, extra_zln=None):
    # multiply the branch product by G=1+2z and/or L^l_factor, then expand
    out = {}
    for (zdeg, lexp), ways in terms.items():
        for gd, gw in ((0, 1), (1, 2)) if g_factor else ((0, 1),):
            e = zdeg + gd
            top = lexp + l_factor
            for k in range(e, e + top + 1):
                out[k] = out.get(k, 0) + ways * gw * comb(top, k-e)
    if extra_zln is not None:
        n, wt = extra_zln
        for k in range(1, n+2):
            out[k] = out.get(k, 0) + wt * comb(n, k-1)
    return out


def c(a,k): return a.get(k,0)
def diff(a,k): return c(a,k+1)-c(a,k)
def first_descent(a):
    return next(k for k in range(max(a)+1) if diff(a,k)<0)


def run(rs):
    N=sum(rs); alpha=N+2
    q=expand(terms_for_profile(rs),g_factor=True)
    C=q
    P=expand(terms_for_profile(rs),g_factor=True,extra_zln=(N+1,1))
    x=first_descent(P)
    As=[('endpoint',expand(terms_for_profile(rs),l_factor=1,extra_zln=(N,1)))]
    for i,r in enumerate(rs):
        As.append((f'tip-{i}-r{r}',expand(terms_for_profile(rs,special=i),g_factor=True,extra_zln=(N,1))))
    W={}
    for i,r in enumerate(rs):
        Ai=As[i+1][1]
        for k in range(N+4): W[k]=W.get(k,0)+r*c(Ai,k)
    failures=[]; weight_fail=[]
    for k in range(1,(N+2)//2+1):
        for name,A in As:
            margin=c(A,k)*c(C,k)-c(A,k+1)*c(C,k-1)
            if margin<0: failures.append((name,k,margin))
        margin=c(W,k)*c(C,k)-c(W,k+1)*c(C,k-1)
        if margin<0: weight_fail.append((k,margin))
    elig=[p for p in range(x+2,alpha+1) if 3*p<2*alpha+1 and 2*p<=alpha]
    rows=[]
    for p in elig:
        selected=[(name,diff(A,p)) for name,A in As]
        rho_num,rho_den=c(C,p),c(C,p-1)
        rows.append({'p':p,'rho_p':f'{rho_num}/{rho_den}',
                     'rho_xplus1':f'{c(C,x+1)}/{c(C,x)}',
                     'rho_p_le_rho_xplus1':rho_num*c(C,x)<=c(C,x+1)*rho_den,
                     'rho_xplus1_lt_1':c(C,x+1)<c(C,x),
                     'selected':[(name,d<0) for name,d in selected],
                     'weighted_delta':sum(r*diff(As[i+1][1],p) for i,r in enumerate(rs))})
    return {'rs':rs,'m':len(rs),'N':N,'x':x,'guarded_k_count':(N+2)//2,
            'individual_failures':failures,'weighted_failures':weight_fail,
            'eligible_rows':rows,
            'boundary':{'k1_individual_margins':[c(A,1)*c(C,1)-c(A,2)*c(C,0) for _,A in As],
                        'kmax':(N+2)//2,
                        'kmax_individual_margins':[c(A,(N+2)//2)*c(C,(N+2)//2)-c(A,(N+2)//2+1)*c(C,(N+2)//2-1) for _,A in As]}}

if __name__=='__main__':
    cases=[[3]*22,[4]*39,[3]*12+[4]*10,[2,3]+[4]*30,[2]*100+[3,4],[2]*38+[4]]
    print(json.dumps([run(rs) for rs in cases],indent=2))
