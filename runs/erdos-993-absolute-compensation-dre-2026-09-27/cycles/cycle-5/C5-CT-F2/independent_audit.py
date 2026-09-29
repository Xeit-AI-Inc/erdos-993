from math import comb
from fractions import Fraction
import json
from pathlib import Path

# Independently reconstruct B2^10, C=G B2^10 and d=z L^21.
def conv(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out

def coeff(v, k):
    return v[k] if 0 <= k < len(v) else 0

B2 = [1, 3, 1]
Q = [1]
for _ in range(10):
    Q = conv(Q, B2)
C = conv([1, 2], Q)
N = 20
E = [0] + [comb(N + 1, j) for j in range(N + 2)]
k = 4
vals = [coeff(E,k), coeff(E,k+1), coeff(C,k), coeff(C,k+1)]
minor = vals[1]*vals[2] - vals[0]*vals[3]
assert vals == [1330, 5985, 27315, 125586]
assert minor == -3549105
assert Fraction(vals[0], vals[2]) > Fraction(vals[1], vals[3])
# Since Ck,Ck+1 > 0, u -> u/(1+u) is strictly increasing for u>=0.
assert Fraction(vals[0], vals[0]+vals[2]) > Fraction(vals[1], vals[1]+vals[3])
# Reconstruct full parent P=C+E and check actual first strict coefficient descent.
P = [coeff(C,j)+coeff(E,j) for j in range(max(len(C),len(E)))]
x = next(j for j in range(len(P)) if coeff(P,j+1)-coeff(P,j) < 0)
assert x == 11
eligible = (k >= x+2 and 3*k < 2*(N+2)+1 and 2*k <= N+2)
assert (1 <= k and 2*k <= N+2) and not eligible

# Different-denominator addition counterexample. At both ranks all denominators >0.
C1, A1, C2, A2 = [1,100], [1,90], [100,1], [80,0]
minor1 = A1[1]*C1[0] - A1[0]*C1[1]
minor2 = A2[1]*C2[0] - A2[0]*C2[1]
Cs = [C1[i]+C2[i] for i in range(2)]
As = [A1[i]+A2[i] for i in range(2)]
sum_minor = As[1]*Cs[0] - As[0]*Cs[1]
assert (minor1, minor2, Cs, As, sum_minor) == (-10, -80, [101,101], [81,90], 909)
assert Fraction(A1[1],C1[1]) <= Fraction(A1[0],C1[0])
assert Fraction(A2[1],C2[1]) <= Fraction(A2[0],C2[0])
assert Fraction(As[1],Cs[1]) > Fraction(As[0],Cs[0])

# Same denominator closure: positive weighted sum preserves the signed inequality.
Cfix = [5, 7]
X1, X2 = [2, 3], [4, 6]
w1, w2 = 2, 3
m1 = X1[1]*Cfix[0] - X1[0]*Cfix[1]
m2 = X2[1]*Cfix[0] - X2[0]*Cfix[1]
mix = (w1*X1[1]+w2*X2[1])*Cfix[0] - (w1*X1[0]+w2*X2[0])*Cfix[1]
assert mix == w1*m1+w2*m2

out = {
 "root_mixture": {"profile":{"a2":10,"a3":0,"a4":0},"N":N,"m":10,"n":33,"alpha":22,"k":k,"E_k_E_k1_C_k_C_k1":vals,"signed_minor":minor,"ratio_k":str(Fraction(vals[0],vals[2])),"ratio_k1":str(Fraction(vals[1],vals[3])),"parent_first_strict_descent_x":x,"simple_guard":True,"actual_eligibility":eligible},
 "different_denominators": {"component_minors":[minor1,minor2],"sum_denominator":Cs,"sum_numerator":As,"sum_minor":sum_minor},
 "same_denominator": {"component_minors":[m1,m2],"weights":[w1,w2],"weighted_minor":mix,"identity_holds":mix==w1*m1+w2*m2}
}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
