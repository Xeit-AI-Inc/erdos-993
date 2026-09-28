from math import comb
import json
from pathlib import Path

def mul(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for k,y in enumerate(b): out[i+k]+=x*y
    return out

def powp(a,n):
    out=[1]
    for _ in range(n): out=mul(out,a)
    return out

def at(a,k): return a[k] if 0<=k<len(a) else 0

def delta(a,k): return at(a,k+1)-at(a,k)

def case(m,r):
    N=m*r; alpha=N+2; q=N+1
    L=[1,1]
    Br=powp(L,r); Br[1]+=1
    Q=powp(Br,m)
    C=mul([1,2],Q)
    Lq=powp(L,q)
    P=[at(C,k)+at(Lq,k-1) for k in range(max(len(C),len(Lq)+1))]
    x=next(k for k in range(len(P)+1) if delta(P,k)<0)
    # G F_r = (1+2z) * sum_{h=0}^{r-2}(1+z)^h, using binomial coefficients.
    F=[sum(comb(h,k) for h in range(r-1) if k<=h) for k in range(r-1)]
    GF=mul([1,2],F)
    H=powp(Br,m-1)
    LN=powp(L,N)
    A0=mul(L,Q)
    A0 += [0]*max(0,N+2-len(A0))
    for k,v in enumerate(LN): A0[k+1]+=v
    Bri=powp(L,r-1); Bri[1]+=1
    Ai=mul([1,2],mul(Bri,H))
    Ai += [0]*max(0,N+2-len(Ai))
    for k,v in enumerate(LN): Ai[k+1]+=v
    rows=[]
    for p in range(x+2,alpha//2+1):
        if 3*p>=2*alpha+1: continue
        j=p-2; d=q-j; D=comb(N,j+1)-comb(N,j)
        layers=[]
        for dep in range(4):
            u=0
            for ell in range(min(dep,m-1)+1):
                residual=powp(L,N-r-r*ell)
                u+=comb(m-1,ell)*at(mul(GF,residual),j-ell)
            layers.append(u)
        full=at(mul(GF,H),j)
        rows.append({'p':p,'guards':[x+2<=p,3*p<2*alpha+1,2*p<=alpha],'selectors':[int(delta(A0,p)<0),int(delta(Ai,p)<0)],'p':p,'j':j,'delta':d,'D':D,'layers_U':layers,'full_T':full,'margins_2U_minus_3deltaD':[2*u-3*d*D for u in layers],'full_margin_2T_minus_3deltaD':2*full-3*d*D})
    return {'m':m,'r':r,'N':N,'alpha':alpha,'x':x,'GF':GF,'rows':rows}

out={'method':'Independent exact integer convolution; F_r coefficients obtained from sum_h binom(h,k), hence for r=4 F=(3,3,1).','cases':[case(40,4),case(150,4)]}
path=Path(__file__).with_name('independent_layer_check.json')
path.write_text(json.dumps(out,indent=2)+'\n')
for c in out['cases']:
    print('case',c['m'],'x',c['x'],'GF',c['GF'])
    for row in c['rows']:
        print('p',row['p'],'j',row['j'],'margins',row['margins_2U_minus_3deltaD'],'full',row['full_margin_2T_minus_3deltaD'])
