"""Independent exact-rational replay of the m=70..119 scalar grid."""
from fractions import Fraction
from math import comb, factorial, gcd
import json
from pathlib import Path

ROOT = Path(__file__).parent
SCALE, DEG = 1000, 12
DEN = SCALE**DEG * factorial(DEG)
TAYLOR_COEFF = [SCALE**(DEG-h) * (factorial(DEG)//factorial(h)) for h in range(DEG+1)]
GF = {2:(1,2), 3:(2,5,2), 4:(3,9,7,2)}

def exponent_floor(branches, M, k):
    """Compute Jensen exponent directly from rational g_r and adjacent counts."""
    if 2*branches <= M <= 3*branches:
        counts = {2:3*branches-M, 3:M-2*branches}
    elif 3*branches <= M <= 4*branches:
        counts = {3:4*branches-M, 4:M-3*branches}
    else:
        raise AssertionError((branches,M))
    E = sum((counts[r] * Fraction(2*r,2*r+1) *
             Fraction(comb(M-r,k-1),comb(M,k)) for r in counts), Fraction(0))
    assert E >= 0
    return (SCALE*E.numerator)//E.denominator

def taylor_num(f):
    # Common-denominator numerator of sum_(h=0)^12 (f/1000)^h/h!.
    return sum(TAYLOR_COEFF[h] * f**h for h in range(DEG+1))

producer = json.loads((ROOT/'copied_producer_balanced_finite.json').read_text())
assert producer['total_states'] == 799895 and producer['total_excluded'] == 0
by_m=[]
alltested=allexcluded=0
for m in range(70,120):
    best=None; tested=excluded=0
    for N in range(2*m,4*m+1):
        for r, coeffs in GF.items():
            M=N-r
            if not 2*(m-1) <= M <= 4*(m-1):
                continue
            for j in range((2*N-1)//5+1,(N-2)//2+1):
                ks=[j-s for s in range(len(coeffs))]
                if M<10 or any(k<0 or k>M or 3*k<M for k in ks):
                    excluded += 1
                    continue
                # Every term has common denominator DEN*binom(N,j).
                num=sum(c*comb(M,k)*taylor_num(exponent_floor(m-1,M,k))
                        for s,(c,k) in enumerate(zip(coeffs,ks)))
                den=DEN*comb(N,j)
                # Compare convolution lower bound strictly against (3/2)*delta*D/B.
                left=2*(j+1)*num
                right=3*(N+1-j)*(N-2*j-1)*den
                assert left>right, (m,N,r,j,left,right)
                ratio=Fraction(left,right)
                if best is None or ratio<best[0]:
                    best=(ratio,N,r,j)
                tested+=1
    alltested+=tested; allexcluded+=excluded
    pr=producer['rows'][m-70]
    assert tested==pr['tested_states'] and excluded==pr['excluded_states']
    # Producer's displayed ratio is exactly lhs/rhs after reduction.
    assert best[0].numerator==int(pr['minimum_ratio']['numerator'])
    assert best[0].denominator==int(pr['minimum_ratio']['denominator'])
    assert (best[1],best[2],best[3])==(pr['minimizer']['N'],pr['minimizer']['r'],pr['minimizer']['j'])
    by_m.append({'m':m,'states':tested,'excluded':excluded,
                 'minimum_ratio':f'{best[0].numerator}/{best[0].denominator}',
                 'minimizer':[best[1],best[2],best[3]]})
assert alltested==799895 and allexcluded==0
out={'method':'direct Fraction evaluation of adjacent-mixture g_r; direct positive Taylor polynomial; independent state loops and exact cross multiplication',
     'm_range':[70,119],'total_states':alltested,'total_excluded':allexcluded,'strict_inequalities_passed':alltested,'rows':by_m}
(ROOT/'independent_balanced_finite.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'total_states':alltested,'excluded':allexcluded,'rows':len(by_m),
                  'all_strict_targets_passed':True,'producer_counts_minima_and_witnesses_match':True}))
