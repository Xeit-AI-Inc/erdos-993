"""Independent exact checks for the restricted wide-arity candidate; scratch only."""
import hashlib
import json
from fractions import Fraction
from math import comb, factorial
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "inputs"))
from ordinary_tree_checked import Graph, coefficient, delta

HERE = Path(__file__).resolve().parent


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i+j] += x*y
    return out


def plus(*parts):
    out = [0] * max(map(len, parts))
    for p in parts:
        for j, x in enumerate(p):
            out[j] += x
    return out


def L(n):
    return [comb(n, j) for j in range(n+1)]


def B(r):
    a = L(r)
    a[1] += 1
    return a


def F(r):
    return [comb(r-1, j+1) for j in range(r-1)]


def ulc_order(a):
    n = len(a)-1
    d = n
    for j in range(1, n):
        gap = j*a[j]**2-(j+1)*a[j-1]*a[j+1]
        assert gap > 0, (a, j, gap)
        d = max(d, j + ((j+1)*a[j-1]*a[j+1] + gap-1)//gap)
    for j in range(1, n):
        assert a[j]**2*comb(d,j-1)*comb(d,j+1) >= a[j-1]*a[j+1]*comb(d,j)**2
    if d>n:
        assert any(a[j]**2*comb(d-1,j-1)*comb(d-1,j+1) < a[j-1]*a[j+1]*comb(d-1,j)**2 for j in range(1,n))
    return d


def factor_checks():
    cert = json.loads((ROOT/'control-proposals/C6-MARKED-FACTOR-ABSORPTION.json').read_text())
    rows = {(x['r'],x['s']):x for x in cert['rows']}
    assert len(rows) == 121
    by_r = {}
    largest = (0,None)
    for r in range(2,13):
        d = ulc_order(B(r))
        assert d == comb(r,2)+1, (r,d)
        by_r[str(r)] = d
        for s in range(2,13):
            p = mul(F(r), B(s))
            order = ulc_order(p)
            assert p == rows[r,s]['coefficients']
            assert order == rows[r,s]['finite_ULC_order']
            if order > largest[0]: largest = (order, [r,s])
    for r in range(2,13):
        for a in (B(r), F(r)):
            n=len(a)-1
            for j in range(n+1):
                left=(j+1)*(a[j+1] if j<n else 0)
                right=(n-j)*a[j]
                assert left*3>=right and left<=right*2, (r,a,j)
        a=B(r); n=len(a)-1
        assert all(2*(j+1)*(a[j+1] if j<n else 0)>=(n-j)*a[j] for j in range(n+1))
        g=B(r); c=B(r-1); f=F(r)
        for arr, lower in ((c,1),(f,(r-1)*(r+4)//2)):
            for i in range(len(g)):
                for j in range(i+1,len(g)):
                    ai=arr[i] if i<len(arr) else 0
                    aj=arr[j] if j<len(arr) else 0
                    assert ai*g[j]-aj*g[i]>=0,(r,arr,i,j)
            assert arr[0]*g[1]-(arr[1] if len(arr)>1 else 0)*g[0]==lower
    return {'pairs':len(rows),'B_orders':by_r,'largest_pair_order':largest,
            'derivative_and_mixed_factor_checks':True}


def cutoffs():
    out={}
    for name,D,h,m,C,source in (
        ('arity2to4',4,29,2000,26776*3,'control-proposals/C6-HETEROGENEOUS-CUTOFF2000-ARITHMETIC.json'),
        ('arity2to12',12,17,100000000,76*9**11+352,'control-proposals/C6-ARITY12-CUTOFF-ARITHMETIC.json')):
        A=Fraction(2,3)-Fraction(h,2*m)
        B_=Fraction(1,3)-Fraction((D-1)*h+D+2,2*m)
        # For D=4, candidate uses 3h+8; for D=12, 11h+15=202.
        if D==4: B_=Fraction(1,3)-Fraction(3*h+8,2*m)
        if D==12: B_=Fraction(1,3)-Fraction(11*h+15,2*m)
        E=Fraction(factorial(h), (m-h)**h)*A**(-(h-1))*B_**(-((D-1)*h+D+1))
        scale = m*C
        if D==12: scale=9*m*C
        ratio=scale*E
        saved=json.loads((ROOT/source).read_text())
        assert A==Fraction(saved['A']) and B_==Fraction(saved['B'])
        assert E==Fraction(saved['epsilon'])
        saved_ratio=Fraction(saved['controlling_rational'] if D==4 else saved['control_ratio'])
        assert ratio==saved_ratio and 0<ratio<1
        quotient_rows=[]
        for N in (2*m,D*m):
            # The analytic proof uses J=floor(2N/3+3), a slightly larger cap.
            J=(2*N)//3+3
            lo=(N+3)//4
            for s in (0,1):
                def falling(v,k):
                    z=1
                    for t in range(k):z*=v-t
                    return z
                K=(D-1)*h+D+s
                def fq(j):
                    return Fraction(falling(j-s,h-s)*falling(N-j+s,K),falling(N,D*(h+1)))
                assert lo-s-h+1>0 and N-J+s-K+1>0
                assert fq(lo)>fq(lo+1)>fq(J)
                assert fq(J)>=A**(h-1)*B_**((D-1)*h+D+1)
                quotient_rows.append({'N':N,'s':s,'lower_j':lo,'upper_j':J,
                                      'endpoint_lower_bound':True,'decreasing_at_endpoints':True})
        out[name]={'D':D,'h':h,'m0':m,'C':C,'A':str(A),'B':str(B_),
                   'ratio_num':str(ratio.numerator),'ratio_den':str(ratio.denominator),
                   'ratio_decimal':float(ratio),'below_one':ratio<1,
                   'quotient_rows':quotient_rows}
    return out


def graph_checks():
    out=[]
    for arities in ((2,), (4,), (12,), (2,3), (4,6), (2,12)):
        edge=[(0,1),(1,2)]; branch=[]; cursor=3
        for r in arities:
            center=cursor; cursor+=1
            tips=list(range(cursor,cursor+r)); cursor+=r
            edge.append((0,center)); edge.extend((center,v) for v in tips)
            branch.append((center,tips))
        G=Graph.from_edges(range(cursor),edge)
        N=sum(arities)
        Q=[1]
        for r in arities: Q=mul(Q,B(r))
        H=[]
        for i in range(len(arities)):
            v=[1]
            for k,r in enumerate(arities):
                if k!=i:v=mul(v,B(r))
            H.append(v)
        P=plus(mul([1,2],Q),[0]+L(N+1))
        assert G.forest_independence_polynomial()==P
        assert len(G.vertices)==N+len(arities)+3
        assert len(P)-1==N+2
        A0=plus(mul([1,1],Q),[0]+L(N))
        assert G.remove({2}).forest_independence_polynomial()==A0
        assert G.leaves()==sorted([2]+[v for _,tips in branch for v in tips])
        actual_q=[]
        for i,(center,tips) in enumerate(branch):
            Ai=plus(mul(mul([1,2],B(arities[i]-1)),H[i]),[0]+L(N))
            q=[0]+plus(mul(mul([1,2],F(arities[i])),H[i]),L(N))
            for tip in tips:
                assert G.remove({tip}).forest_independence_polynomial()==Ai
                hv=G.remove({tip,center}).forest_independence_polynomial()
                rv=G.remove(G.closed_neighborhood({center})).forest_independence_polynomial()
                assert all(coefficient(hv,j)-coefficient(rv,j)==coefficient(q,j) for j in range(len(q)))
                actual_q.append(q)
        q2=[0]+L(N)
        h2=G.remove({1,2}).forest_independence_polynomial()
        r2=G.remove(G.closed_neighborhood({1})).forest_independence_polynomial()
        assert all(coefficient(h2,j)-coefficient(r2,j)==coefficient(q2,j) for j in range(len(q2)))
        actual_q.append(q2)
        R=plus([(N+1)*x for x in L(N)],
               *[[arities[i]*v for v in mul(mul([1,2],F(arities[i])),H[i])] for i in range(len(arities))])
        assert plus(*actual_q)==[0]+R
        x=next(j for j in range(len(P)) if delta(P,j)<0)
        eligible=[]
        for p in range(x+2,N+3):
            if 3*p>=2*(N+2)+1:continue
            selected=[q for v,q in zip([v for _,tips in branch for v in tips]+[2],actual_q)
                      if delta(G.remove({v}).forest_independence_polynomial(),p)<0]
            S=sum(delta(q,p-1) for q in selected)
            eligible.append({'p':p,'selected':len(selected),'S':S})
        if N<=5:
            assert G.brute_independence_polynomial()==P
        out.append({'arities':list(arities),'vertices':cursor,'alpha':N+2,'tag_count':N+1,
                    'x':x,'eligible':eligible,
                    'P_sha256':hashlib.sha256(str(P).encode()).hexdigest()})
    return out


def identity_checks():
    claims=json.loads((ROOT/'control/C5-REGISTERED-CLAIM-IDENTITY.json').read_text())['claims']
    assert len(claims)==428
    candidates=[x['claim_key'] for x in claims if any(q in (x.get('statement','')+' '+x.get('scope','')).lower() for q in ('path0-1-2','private degree-one','private leaves','heterogeneous arit'))]
    return {'total':len(claims),'refuted':sum(x['status']=='REFUTED' for x in claims),
            'graph_text_matches':candidates}


if __name__=='__main__':
    data={'factors':factor_checks(),'cutoffs':cutoffs(),'graphs':graph_checks(),'identities':identity_checks()}
    (HERE/'INDEPENDENT_EVIDENCE.json').write_text(json.dumps(data,indent=2)+'\n')
    print(json.dumps({'factors':data['factors'],'cutoffs':{k:{'ratio_decimal':v['ratio_decimal'],'below_one':v['below_one']} for k,v in data['cutoffs'].items()},'graphs':data['graphs'],'identities':data['identities']},indent=2))
