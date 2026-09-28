"""Independent exact audit of C3 m=70..119 relaxed Jensen/Taylor states."""
from math import comb, factorial, gcd
from fractions import Fraction
import json
from pathlib import Path

SCALE, DEG = 1000, 12
TAYLOR_DEN = SCALE**DEG * factorial(DEG)
GF = {2: (1, 2), 3: (2, 5, 2), 4: (3, 9, 7, 2)}

def g(r, M, k):
    if not (0 <= k <= M):
        return Fraction(0)
    if k == M:
        return Fraction(0)
    return Fraction(2*r, 2*r+1) * Fraction(comb(M-r, k-1), comb(M, k))

def balanced_exp(mblocks, M, k):
    """Adjacent endpoint mixture from discrete convexity, as a Fraction."""
    if M <= 3*mblocks:
        c2, c3, c4 = 3*mblocks-M, M-2*mblocks, 0
    else:
        c2, c3, c4 = 0, 4*mblocks-M, M-3*mblocks
    assert min(c2,c3,c4) >= 0 and c2+c3+c4 == mblocks
    assert 2*c2+3*c3+4*c4 == M
    return c2*g(2,M,k) + c3*g(3,M,k) + c4*g(4,M,k)

def taylor12_num(floor_milli):
    # Sum_{h=0}^12 (floor_milli/1000)^h/h!, exact common denominator.
    return sum(floor_milli**h * SCALE**(DEG-h) * (factorial(DEG)//factorial(h)) for h in range(DEG+1))

rows=[]
for m in range(70,120):
    count=0; low= None; witness=None
    for N in range(2*m,4*m+1):
        for r, weights in GF.items():
            M=N-r
            if not (2*(m-1) <= M <= 4*(m-1)):
                continue
            for j in range((2*N-1)//5+1, (N-2)//2+1):
                # Guards verified for the entire scanned interval below.
                assert M >= 10
                total = 0
                for s,c in enumerate(weights):
                    k=j-s
                    assert 3*k >= M, (m,N,r,j,s,M,k)
                    ef=balanced_exp(m-1,M,k)
                    flo=(SCALE*ef.numerator)//ef.denominator
                    # floor is a lower bound because all terms are positive.
                    assert Fraction(flo,SCALE) <= ef
                    total += c*comb(M,k)*taylor12_num(flo)
                # Normalize each shifted coefficient by binom(N,j), preserving exactness.
                lhs = 2*(j+1)*total
                rhs = 3*(N+1-j)*(N-2*j-1)*comb(N,j)*TAYLOR_DEN
                assert lhs > rhs, (m,N,r,j,lhs,rhs)
                ratio=Fraction(lhs,rhs)
                if low is None or ratio<low:
                    low=ratio; witness=(N,r,j)
                count += 1
    rows.append({'m':m,'states':count,'minimum_ratio':f'{low.numerator}/{low.denominator}','minimizer':witness})

out={'scope':'Independent exact reimplementation; relaxed states m=70..119, rank and shift guards asserted, balanced exponent and degree-12 positive Taylor lower bound.','scale':SCALE,'degree':DEG,'states':sum(x['states'] for x in rows),'minimum_ratio':min((Fraction(x['minimum_ratio']) for x in rows)) .__str__(),'rows':rows}
Path(__file__).with_name('independent_balanced_check.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'states':out['states'],'minimum_ratio':out['minimum_ratio'],'first':rows[0],'last':rows[-1]},indent=2))
