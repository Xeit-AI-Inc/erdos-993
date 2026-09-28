"""Independent exact scalar-table check using direct binomials, not producer code."""
from fractions import Fraction
from functools import lru_cache
from math import comb, factorial
from pathlib import Path
import json
GF={2:(1,2),3:(2,5,2),4:(3,9,7,2)}
DEN=1000**12*factorial(12)
WEIGHTS=[1000**(12-h)*(factorial(12)//factorial(h)) for h in range(13)]
@lru_cache(None)
def g(r,M,k):
    if not 0<=k<=M: return Fraction(0)
    return Fraction(2*r,2*r+1)*Fraction(comb(M-r,k-1) if 0<=k-1<=M-r else 0,comb(M,k))
@lru_cache(None)
def floor_exponent(m,M,k):
    E=(3*m-M)*g(2,M,k)+(M-2*m)*g(3,M,k) if M<=3*m else (4*m-M)*g(3,M,k)+(M-3*m)*g(4,M,k)
    assert E>=0
    return 1000*E.numerator//E.denominator
@lru_cache(None)
def taylor_num(t):
    # E_12(t/1000) on the common denominator 1000^12*12!.
    return sum((t**h)*WEIGHTS[h] for h in range(13))
rows=[]; total=excluded=0; global_min=None
for m in range(70,120):
    count=exc=0; local_min=None
    for N in range(2*m,4*m+1):
        for r,cs in GF.items():
            M=N-r
            if not 2*(m-1)<=M<=4*(m-1): continue
            for j in range((2*N-1)//5+1,(N-2)//2+1):
                if M<10 or any(3*(j-s)<M for s in range(len(cs))):
                    exc+=1; continue
                numer=0
                for s,c in enumerate(cs):
                    k=j-s
                    numer+=c*comb(M,k)*taylor_num(floor_exponent(m-1,M,k))
                den=comb(N,j)*DEN
                # q/norm > (3/2)(N+1-j)(N-2j-1)/(j+1)
                lhs=2*(j+1)*numer
                rhs=3*(N+1-j)*(N-2*j-1)*den
                assert lhs>rhs,(m,N,r,j,lhs,rhs)
                margin=Fraction(lhs,rhs)
                count+=1
                if local_min is None or margin<local_min[0]: local_min=(margin,N,r,j)
                if global_min is None or margin<global_min[0]: global_min=(margin,m,N,r,j)
    total+=count; excluded+=exc
    rows.append({'m':m,'states':count,'excluded':exc,'minimum_ratio':{'numerator':str(local_min[0].numerator),'denominator':str(local_min[0].denominator)},'minimizer':list(local_min[1:])})
out={'method':'direct math.comb coefficient ratios, cached exact Fraction exponent floor, integer Taylor numerator, exact cross multiplication','total_states':total,'excluded':excluded,'rows':rows,'global_minimum_ratio':{'numerator':str(global_min[0].numerator),'denominator':str(global_min[0].denominator)},'global_minimizer':list(global_min[1:])}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='rows'},indent=2))
