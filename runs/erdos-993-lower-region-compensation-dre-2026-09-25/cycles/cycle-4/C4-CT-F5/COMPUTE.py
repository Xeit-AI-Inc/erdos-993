#!/usr/bin/env python3
"""Exact polynomial audit of T_m and equal-arm lopsided variants; Python integers only."""
import json
from pathlib import Path

def add(a,b):
    n=max(len(a),len(b)); out=[0]*n
    for i,x in enumerate(a): out[i]+=x
    for i,x in enumerate(b): out[i]+=x
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

def scale(a,c): return [c*x for x in a]
def coeff(a,j): return a[j] if 0<=j<len(a) else 0
def delta(a,j): return coeff(a,j+1)-coeff(a,j)
def pad_add(*polys):
    out=[0]
    for p in polys: out=add(out,p)
    return out

L=[1,1]
ONE2=[1,2]

def row(m,r=3):
    # Each of m branches has one center and r private leaves; path is 0-1-2.
    B=add(power(L,r),[0,1])
    Btip=add(power(L,r-1),[0,1])
    P=pad_add(mul(ONE2,power(B,m)),mul([0,1],power(L,r*m+1)))
    alpha=r*m+2
    # First strict descent, explicitly including zero extension through degree alpha+1.
    x=next(j for j in range(alpha+1) if delta(P,j)<0)
    Pend=pad_add(mul(L,power(B,m)),mul([0,1],power(L,r*m)))
    Ptip=pad_add(mul(ONE2,mul(Btip,power(B,m-1))),mul([0,1],power(L,r*m)))
    # Per original leaf tag: q_v=I(H_v)-I(R_v). Endpoint and branch-tip formulas.
    qend=mul([0,1],power(L,r*m))
    qtip=pad_add(mul(ONE2,mul([c-(1 if i==0 else 0) for i,c in enumerate(power(L,r-1))],power(B,m-1))),
                 mul([0,1],power(L,r*m)))
    favorable=[]
    for p in range(x+2, (2*r*m+4)//3 + 1): # overwritten by strict guard below
        if 3*p < 2*alpha+1:
            tags=[]
            if delta(Pend,p)<0: tags.append(('endpoint',1,qend))
            if delta(Ptip,p)<0: tags.append(('branch_tip',r*m,qtip))
            F=[name for name,_,_ in tags]
            S=sum(mult*delta(q,p-1) for _,mult,q in tags)
            favorable.append({'p':p,'F_orbits':F,'delta_P':delta(P,p),'delta_Pend':delta(Pend,p),'delta_Ptip':delta(Ptip,p),'S':S})
    return {'m':m,'r':r,'alpha':alpha,'x':x,'eligible_rows':favorable}

def lopsided_row(m,special,r=3):
    # m branches: one has special leaves, m-1 have r leaves.
    sizes=[special]+[r]*(m-1); N=sum(sizes)
    Bs=[add(power(L,t),[0,1]) for t in sizes]
    prod=[1]
    for B in Bs: prod=mul(prod,B)
    P=pad_add(mul(ONE2,prod),mul([0,1],power(L,N+1)))
    alpha=N+2
    x=next(j for j in range(alpha+1) if delta(P,j)<0)
    Pend=pad_add(mul(L,prod),mul([0,1],power(L,N)))
    qend=mul([0,1],power(L,N))
    groups=[]
    for ix,t in enumerate(sizes):
        other=[1]
        for j,B in enumerate(Bs):
            if j!=ix: other=mul(other,B)
        Bdeleted=add(power(L,t-1),[0,1])
        Pdel=pad_add(mul(ONE2,mul(Bdeleted,other)),mul([0,1],power(L,N)))
        Lminus=[c-(1 if j==0 else 0) for j,c in enumerate(power(L,t-1))]
        q=pad_add(mul(ONE2,mul(Lminus,other)),mul([0,1],power(L,N)))
        groups.append((t,Pdel,q))
    result=[]
    for p in range(x+2,(2*N+4)//3+1):
        if 3*p<2*alpha+1:
            S=0; selected=[]
            if delta(Pend,p)<0:
                S+=delta(qend,p-1); selected.append('endpoint')
            for t,Pdel,q in groups:
                if delta(Pdel,p)<0:
                    S+=t*delta(q,p-1); selected.append('tips_'+str(t))
            result.append({'p':p,'F_orbits':selected,'delta_P':delta(P,p),
                           'delta_Pend':delta(Pend,p),
                           'tip_selector_deltas':[{'t':t,'delta':delta(Pdel,p)} for t,Pdel,_ in groups],
                           'S':S})
    return {'m':m,'special_leaves':special,'regular_leaves':r,'alpha':alpha,'x':x,'eligible_rows':result}

def main():
    base=[row(m,3) for m in range(1,101)]
    lopsided=[lopsided_row(m,s) for s in (1,2,4,5) for m in range(2,21)]
    variants=[row(m,r) for r in range(1,7) for m in range(1,16)]
    positives=[{'m':v['m'],'r':v['r'],'row':e} for v in variants for e in v['eligible_rows'] if e['S']>0]
    payload={'scope':{'original_family':'m=1..100','equal_arm_variants':'r=1..6,m=1..15','arithmetic':'exact arbitrary-precision integer polynomial coefficients'},
             'original_family':base,
             'lopsided_variants':lopsided,
             'variant_summary':{str(r):{'m_min':1,'m_max':15,'eligible_rows':sum(len(v['eligible_rows']) for v in variants if v['r']==r),'positive_full_sums':sum(e['S']>0 for v in variants if v['r']==r for e in v['eligible_rows'])} for r in range(1,7)},
             'positive_variant_rows':positives,
             'lopsided_summary':{str(s):{'m_min':2,'m_max':20,'eligible_rows':sum(len(v['eligible_rows']) for v in lopsided if v['special_leaves']==s),'positive_full_sums':sum(e['S']>0 for v in lopsided if v['special_leaves']==s for e in v['eligible_rows']),'selector_patterns':{','.join(k):n for k,n in __import__('collections').Counter(tuple(e['F_orbits']) for v in lopsided if v['special_leaves']==s for e in v['eligible_rows']).items()}} for s in (1,2,4,5)}}
    Path(__file__).with_name('EVIDENCE.json').write_text(json.dumps(payload,indent=2)+'\n')
    eligible=sum(len(v['eligible_rows']) for v in base)
    poss=[(v['m'],e) for v in base for e in v['eligible_rows'] if e['S']>0]
    print(json.dumps({'original_m': [1,100], 'eligible_rows':eligible,'positive_full_sums':len(poss),
      'first_rows':[{'m':v['m'],'alpha':v['alpha'],'x':v['x'],'rows':v['eligible_rows']} for v in base[:5]],
      'last_rows':[{'m':v['m'],'alpha':v['alpha'],'x':v['x'],'rows':v['eligible_rows']} for v in base[-3:]],
      'variant_summary':payload['variant_summary'],'positive_variant_rows':len(positives)},indent=2))
if __name__=='__main__': main()
