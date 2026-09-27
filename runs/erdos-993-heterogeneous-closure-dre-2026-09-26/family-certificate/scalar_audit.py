"""Independent exact base scalar and fixed-layer support checks. No source writes."""
import json
from math import comb
from fractions import Fraction
from pathlib import Path

def C(n,j):
    return comb(n,j) if 0 <= j <= n else 0

m=266
N=2*m
J=N//2+3
terms=[comb(m-1,k)*C(N-4*k-4,J-k) for k in range(1,87)]
base=sum(terms)
den=max(C(N,J),C(N,J-1))
lhs=217*(2*m+4)*den
assert lhs<base
assert all(t>0 for t in terms)
assert all(k <= int((2*N-1)//5)+1 for k in range(1,87))
for n in range(266,270):
    for k in range(1,87):
        if n < 3*k+7:
            continue
        def f(N):
            j=N//2+3
            return Fraction(C(N-4*k-4,j-k),max(C(N,j),C(N,j-1)))
        assert f(2*n+1)/f(2*n)==Fraction((2*n-4*k-3)*(n-1),(n-3*k-6)*(2*n+1))
        assert f(2*n+2)/f(2*n)==Fraction((2*n-4*k-2)*(2*n-4*k-3)*(n+3)*(n-1),
                                           (n+4-k)*(n-3*k-6)*(2*n+2)*(2*n+1))
        assert f(2*n+1)>f(2*n)
        assert f(2*n+2)>f(2*n)
out={"m":m,"N":N,"J":J,"K":[1,86],"lhs":str(lhs),"rhs":str(base),
     "ratio_numerator":str(Fraction(lhs,base).numerator),
     "ratio_denominator":str(Fraction(lhs,base).denominator),
     "margin":str(base-lhs),"all_86_terms_positive":True,
     "sampled_parity_ratios_checked_exact":True}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({"passes":lhs<base,"ratio":float(Fraction(lhs,base))}))
