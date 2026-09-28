#!/usr/bin/env python3
"""Independent exact replay of C4-T1's key examples using coefficient formulas."""
import json
from math import comb
from pathlib import Path

B = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')

def add(a,b):
    n=max(len(a),len(b)); return [ (a[i] if i<len(a) else 0)+(b[i] if i<len(b) else 0) for i in range(n)]
def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,u in enumerate(a):
        for j,v in enumerate(b): c[i+j]+=u*v
    return c
def powpoly(a,n):
    p=[1]
    for _ in range(n): p=mul(p,a)
    return p
def coef(a,k): return a[k] if 0<=k<len(a) else 0
def shift(a): return [0]+a
def branch(r): return add(powpoly([1,1],r),[0,1])

def tree_poly(adj, removed=None):
    seen=set()
    def visit(v,parent):
        seen.add(v); out=[1]; inc=[0,1]
        for u in adj[v]:
            if u==parent or u==removed: continue
            a,b=visit(u,v); out=mul(out,add(a,b)); inc=mul(inc,a)
        return out,inc
    total=[1]
    for v in adj:
        if v==removed or v in seen: continue
        out,inc=visit(v,-1); total=mul(total,add(out,inc))
    return total

def profile(counts):
    rs=[r for r,c in zip((2,3,4),counts) for _ in range(c)]
    N=sum(rs); Q=[1]
    for r in rs: Q=mul(Q,branch(r))
    C=mul([1,2],Q)
    P=add(C,shift(powpoly([1,1],N+1))) # z L^(N+1)
    # endpoint A0=LQ+zL^N
    A0=add(mul([1,1],Q),shift(powpoly([1,1],N)) )
    Ais=[]
    for idx,r in enumerate(rs):
        H=[1]
        for h,s in enumerate(rs):
            if idx!=h: H=mul(H,branch(s))
        main=mul(mul([1,2],branch(r-1)),H)
        Ais.append(add(main,shift(powpoly([1,1],N))))
    x=next(k for k in range(len(P)) if coef(P,k+1)-coef(P,k)<0)
    eligible=[p for p in range(x+2,N+3) if 3*p<2*(N+2)+1 and 2*p<=N+2]
    checks=[]
    for p in eligible:
        rows=[]
        for nm,A in [('A0',A0)]+[(f'A{i}',a) for i,a in enumerate(Ais)]:
            rows.append({'deletion':nm,'A_p':coef(A,p),'Delta_p':coef(A,p+1)-coef(A,p),
                         'shift_margin':coef(A,p)*coef(C,p)-coef(A,p+1)*coef(C,p-1)})
        checks.append({'p':p,'rho_numerator_Cp':coef(C,p),'rho_denominator_Cpm1':coef(C,p-1),'rows':rows})
    # Check guarded individual and weighted margins at rank endpoints and all ranks for these profiles.
    individual_bad=[]; weighted_bad=[]
    W=[0]
    for r,A in zip(rs,Ais): W=add(W,[r*v for v in A])
    for k in range(1,(N+2)//2+1):
        for i,A in enumerate([A0]+Ais):
            margin=coef(A,k)*coef(C,k)-coef(A,k+1)*coef(C,k-1)
            if margin<0: individual_bad.append({'k':k,'deletion_index':i,'margin':margin})
        margin=coef(W,k)*coef(C,k)-coef(W,k+1)*coef(C,k-1)
        if margin<0: weighted_bad.append({'k':k,'margin':margin})
    return {'counts':counts,'N':N,'x':x,'eligible_p':eligible,'selector_checks':checks,
            'guarded_individual_failures':individual_bad,'guarded_weighted_failures':weighted_bad,
            'guarded_k_count':(N+2)//2}


def boundary_examples():
    N=66; counts=[0,22,0]; rs=[3]*22; Q=[1]
    for r in rs: Q=mul(Q,branch(r))
    C=mul([1,2],Q); As=[add(mul([1,1],Q),shift(powpoly([1,1],N)))]
    for idx,r in enumerate(rs):
        H=[1]
        for h,s in enumerate(rs):
            if idx!=h: H=mul(H,branch(s))
        As.append(add(mul(mul([1,2],branch(r-1)),H),shift(powpoly([1,1],N))))
    W=[0]
    for A in As[1:]: W=add(W,[3*v for v in A])
    rows=[]
    for k in (1,17,34):
        rows.append({'k':k,'endpoint_margin':coef(As[0],k)*coef(C,k)-coef(As[0],k+1)*coef(C,k-1),
                     'one_tip_margin':coef(As[1],k)*coef(C,k)-coef(As[1],k+1)*coef(C,k-1),
                     'weighted_deck_margin':coef(W,k)*coef(C,k)-coef(W,k+1)*coef(C,k-1),
                     'Ckm1':coef(C,k-1),'Ck':coef(C,k)})
    return rows

def main():
    # Direct binomial expansion E[k]=binom(N,k-1), including zero extension.
    N=66; k=27
    counts=[0,22,0]
    data=profile(counts)
    Q=[1]
    for r,c in zip((2,3,4),counts):
        for _ in range(c): Q=mul(Q,branch(r))
    C=mul([1,2],Q)
    E=lambda j: comb(N,j-1) if 0<=j-1<=N else 0
    margin=E(k)*coef(C,k)-E(k+1)*coef(C,k-1)
    binomial={'N':N,'k':k,'Ek':E(k),'Ek1':E(k+1),'Ck':coef(C,k),'Ckm1':coef(C,k-1),'signed_margin':margin}
    witness=json.loads((B/'sources/cycle4/FUTURE-shifted-ratio-literal-witness.json').read_text())
    counts=witness['counts']; N2=witness['N']; rs=[r for r,c in zip((2,3,4),counts) for _ in range(c)]
    Q=[1]
    for r in rs: Q=mul(Q,branch(r))
    C2=mul([1,2],Q)
    H=[1]
    for r in rs[:-1]: H=mul(H,branch(r))
    A=add(mul(mul([1,2],branch(3)),H),shift(powpoly([1,1],N2)))
    kw=witness['comparison_rank']
    margin_w=coef(A,kw)*coef(C2,kw)-coef(A,kw+1)*coef(C2,kw-1)
    literal={'n':witness['n'],'counts':counts,'N':N2,'alpha':witness['alpha'],'x':witness['x'],'k':kw,
             'guard_2k_le_N_plus2':2*kw<=N2+2,'Ck':coef(C2,kw),'Ckm1':coef(C2,kw-1),
             'Ak':coef(A,kw),'Ak1':coef(A,kw+1),'signed_margin':margin_w}
    adj={v:set() for v in range(witness['n'])}
    for u,v in witness['edges']: adj[u].add(v); adj[v].add(u)
    full=tree_poly(adj); deleted=tree_poly(adj,witness['deleted_original_tip'])
    parent_formula=add(C2,shift(powpoly([1,1],N2+1)))
    literal['independent_tree_parent_matches_formula']=full==parent_formula
    literal['independent_tree_original_tip_deletion_matches_formula']=deleted==A
    literal['independent_tree_parent_degree']=len(full)-1
    literal['independent_tree_first_strict_descent']=next(j for j in range(len(full)) if coef(full,j+1)-coef(full,j)<0)
    dataout={'binomial_component':binomial,'literal_formula_control':literal,
             'bounded_profiles':[profile(c) for c in ([0,22,0],[0,0,39],[0,12,10],[1,1,30],[100,1,1],[38,0,1])]}
    print(json.dumps({'binomial_component':binomial,'literal_formula_control':literal,'bounded_profiles':[{'counts':p['counts'],'N':p['N'],'x':p['x'],'eligible_p':p['eligible_p'],'guarded_individual_failures':p['guarded_individual_failures'],'guarded_weighted_failures':p['guarded_weighted_failures'],'guarded_k_count':p['guarded_k_count'],'selector_checks':p['selector_checks']} for p in dataout['bounded_profiles']], 'first_profile_boundary_and_interior':boundary_examples()},indent=2))
if __name__=='__main__': main()
