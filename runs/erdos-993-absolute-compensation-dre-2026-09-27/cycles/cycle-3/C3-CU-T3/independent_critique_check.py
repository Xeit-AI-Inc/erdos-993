"""Independent exact audit of the C3-T3 Jensen/Taylor scalar certificate."""
from fractions import Fraction
from math import comb, factorial, gcd
import json
from pathlib import Path

SCALE, DEG = 1000, 12
TAYLOR_DEN = SCALE**DEG * factorial(DEG)
GF = {2: (1, 2), 3: (2, 5, 2), 4: (3, 9, 7, 2)}

def g(r, M, k):
    # Direct binomial quotient from the claim, including zero extension.
    if not (0 <= k <= M) or k == M:
        return Fraction(0)
    return Fraction(2*r, 2*r+1) * Fraction(comb(M-r, k-1), comb(M, k))

def balanced(mb, M, k):
    if M <= 3*mb:
        counts = (3*mb-M, M-2*mb, 0)
    else:
        counts = (0, 4*mb-M, M-3*mb)
    a2,a3,a4=counts
    assert min(counts) >= 0 and sum(counts)==mb and 2*a2+3*a3+4*a4==M
    return sum((a*g(r,M,k) for a,r in zip(counts,(2,3,4))), Fraction(0))

def floor_milli(E):
    return (SCALE*E.numerator)//E.denominator

def taylor_num(t):
    # Exact common-denominator sum_{h=0}^{12}(t/1000)^h/h!.
    return sum(t**h*SCALE**(DEG-h)*(factorial(DEG)//factorial(h))
               for h in range(DEG+1))

def check_factorization():
    # Verify the stated algebraic factorization over a broad exact grid;
    # the universal step is the displayed polynomial identity in REPORT.md.
    for M in range(10,301):
        for k in range((M+2)//3, M):
            u=M-k-1
            v=3*k-M
            f=63*(M-2)*(M-3)-135*u*(M-3)+70*u*(u-1)
            rhs=37*(M-10)**2+290*(M-10)+217+v*(125*M-585)+70*v*v
            assert 9*f==rhs and rhs>0
            assert g(2,M,k)-2*g(3,M,k)+g(4,M,k)>=0
        assert g(2,M,M)-2*g(3,M,M)+g(4,M,M)==0

def check_endpoint_exhaustively():
    for mb in range(1,25):
        for M in range(2*mb,4*mb+1):
            for a2 in range(mb+1):
                for a3 in range(mb-a2+1):
                    a4=mb-a2-a3
                    if 2*a2+3*a3+4*a4 != M:
                        continue
                    if M < 10:
                        continue
                    for k in range((M+2)//3,M+1):
                        actual=a2*g(2,M,k)+a3*g(3,M,k)+a4*g(4,M,k)
                        assert actual >= balanced(mb,M,k)

def main():
    check_factorization()
    check_endpoint_exhaustively()
    rows=[]
    alln=0
    global_min=None
    for m in range(70,120):
        n=0; exclusions=0; worst=None
        for N in range(2*m,4*m+1):
            jlo=(2*N-1)//5+1
            jhi=(N-2)//2
            for r,weights in GF.items():
                M=N-r
                if not (2*(m-1)<=M<=4*(m-1)):
                    continue
                assert M>=10
                # The source rank lower bound and all GF shifts are checked,
                # not inferred from a sampled subset.
                assert N>=10*r-12
                assert 3*(jlo-(r-1))>=M
                for j in range(jlo,jhi+1):
                    assert 5*j>2*N-1 and 2*j<=N-2
                    assert all(3*(j-s)>=M for s in range(len(weights)))
                    total=0
                    for s,c in enumerate(weights):
                        k=j-s
                        E=balanced(m-1,M,k)
                        t=floor_milli(E)
                        assert Fraction(t,SCALE)<=E and t>=0
                        total += c*comb(M,k)*taylor_num(t)
                    lhs=2*(j+1)*total
                    rhs=3*(N+1-j)*(N-2*j-1)*comb(N,j)*TAYLOR_DEN
                    assert rhs>0
                    assert lhs>rhs, (m,N,r,j)
                    rat=Fraction(lhs,rhs)
                    item=(rat,(N,r,j))
                    if worst is None or rat<worst[0]: worst=item
                    n+=1
        assert n>0 and exclusions==0
        alln+=n
        rat,(N,r,j)=worst
        row={'m':m,'states':n,'exclusions':exclusions,
             'minimum_ratio':f'{rat.numerator}/{rat.denominator}',
             'minimizer':{'N':N,'r':r,'j':j}}
        rows.append(row)
        if global_min is None or rat<global_min[0]:global_min=(rat,m,N,r,j)
    assert alln==799895
    rat,m,N,r,j=global_min
    out={'scope':'Independent exact Fraction/binomial replay of all relaxed scalar states m=70..119; plus exact algebraic and endpoint checks.',
         'factorization_grid_M_10_300':'passed','endpoint_profiles_mprime_1_24':'passed',
         'states':alln,'exclusions':0,
         'global_minimum':{'ratio':f'{rat.numerator}/{rat.denominator}','m':m,'N':N,'r':r,'j':j},
         'rows':rows}
    Path(__file__).with_name('independent_critique_check.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps({k:out[k] for k in ('factorization_grid_M_10_300','endpoint_profiles_mprime_1_24','states','exclusions','global_minimum')},indent=2))

if __name__=='__main__': main()
