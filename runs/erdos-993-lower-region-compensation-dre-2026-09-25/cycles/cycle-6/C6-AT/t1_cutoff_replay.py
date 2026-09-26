"""Independent exact replay of the cutoff-400 central margins.
B^m coefficients use the logarithmic-derivative recurrence; all arithmetic is integer/Fraction.
"""
from fractions import Fraction
from math import factorial
import hashlib, json
from pathlib import Path

ROOT=Path(__file__).resolve().parent

def coeff(poly,j): return poly[j] if 0 <= j < len(poly) else 0

def binom_row(n):
    r=[1]*(n+1)
    for j in range(1,n+1):
        q,rem=divmod(r[j-1]*(n-j+1),j)
        assert rem==0
        r[j]=q
    return r

def branch_power(m):
    # B=1+4z+3z^2+z^3, from B (B^m)' = m B' B^m.
    q=[1]+[0]*(3*m)
    for j in range(1,3*m+1):
        v=4*(m-j+1)*q[j-1]
        if j>=2: v+=(6*m-3*j+6)*q[j-2]
        if j>=3: v+=(3*m-j+3)*q[j-3]
        q[j],rem=divmod(v,j)
        assert rem==0
    return q

def family(m):
    bm,prev=branch_power(m),branch_power(m-1)
    choose=binom_row(3*m)
    chooseL=[coeff(choose,j)+coeff(choose,j-1) for j in range(3*m+2)]
    # P=(1+2z)B^m+z(1+z)^(3m+1)
    P=[coeff(bm,j)+2*coeff(bm,j-1)+coeff(chooseL,j-1) for j in range(3*m+3)]
    A0=[coeff(bm,j)+coeff(bm,j-1)+coeff(choose,j-1) for j in range(3*m+3)]
    Ast=[coeff(prev,j)+5*coeff(prev,j-1)+7*coeff(prev,j-2)+2*coeff(prev,j-3)+coeff(choose,j-1) for j in range(3*m+3)]
    R=[3*m*(2*coeff(prev,j)+5*coeff(prev,j-1)+2*coeff(prev,j-2))+(3*m+1)*coeff(choose,j) for j in range(3*m+3)]
    return P,{'A0':A0,'Astar':Ast,'R':R}

def calc():
    h=17; m0=400
    eps=Fraction(factorial(h)*(3*m0)**54,(m0-h)**h*(2*m0-14)**16*(m0-39)**38)
    cutoff={k:Fraction(c)*(2*m0+3)*eps for k,c in [('LC',24),('A0',47),('Astar',431),('R',Fraction(14688,21))]}
    assert all(0<x<1 for x in cutoff.values())
    lc_hash=hashlib.sha256(); lr_hash=hashlib.sha256(); n=0
    min_lc=None; min_lr=None
    for m in range(3,400):
        P,Z=family(m)
        for name,z in Z.items():
            for j in range(m,2*m+3):
                v=z[j]*z[j]-z[j-1]*z[j+1]
                w=z[j]*P[j+1]-z[j+1]*P[j]
                assert v>0 and w>0,(m,name,j,v,w)
                lc_hash.update(f'{m}:{name}:{j}:{v}\n'.encode())
                lr_hash.update(f'{m}:{name}:{j}:{w}\n'.encode())
                if min_lc is None or v<min_lc[0]: min_lc=(v,m,name,j)
                if min_lr is None or w<min_lr[0]: min_lr=(w,m,name,j)
                n+=1
    early=[]
    for m in (1,2,3):
        p,_=family(m)
        x=next(j for j in range(len(p)) if coeff(p,j+1)<coeff(p,j))
        early.append({'m':m,'P_coefficients':p,'first_descent_x':x,'alpha':3*m+2})
    result={'scope':{'m':[3,399],'j':'m..2m+2 inclusive','auxiliaries':['A0','Astar','R']},
      'checks_per_margin':n,'total_margin_checks':2*n,
      'lc_sha256':lc_hash.hexdigest(),'mixed_minor_sha256':lr_hash.hexdigest(),
      'minimum_lc':[str(min_lc[0]),*min_lc[1:]],'minimum_mixed_minor':[str(min_lr[0]),*min_lr[1:]],
      'cutoff400_ratios':{k:{'numerator':str(v.numerator),'denominator':str(v.denominator),'less_than_one':v<1} for k,v in cutoff.items()},
      'early_exact_rows':early,
      'method':'exact recurrence and explicit polynomial coefficient formulas; no imported producer arrays'}
    (ROOT/'EVIDENCE.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))
if __name__=='__main__': calc()
