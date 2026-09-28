from math import comb,factorial
from fractions import Fraction
from pathlib import Path
from functools import lru_cache
import json
GF={2:(1,2),3:(2,5,2),4:(3,9,7,2)}
D=12; SCALE=1000; TAYDEN=SCALE**D*factorial(D)
@lru_cache(None)
def g(s,M,k):
 if k<1 or k>M-s+1:return Fraction(0)
 return Fraction(2*s*comb(M-s,k-1),(2*s+1)*comb(M,k))
@lru_cache(None)
def balanced_floor(mprime,M,k):
 if M<=3*mprime:
  E=(3*mprime-M)*g(2,M,k)+(M-2*mprime)*g(3,M,k)
 else:
  E=(4*mprime-M)*g(3,M,k)+(M-3*mprime)*g(4,M,k)
 return (SCALE*E.numerator)//E.denominator
def poly_num(z):
 # Positive degree-12 Taylor polynomial at z/1000, over TAYDEN.
 return sum((z**a)*(SCALE**(D-a))*(factorial(D)//factorial(a)) for a in range(D+1))
# Independent exact check of the convexity identity across the candidate's entire stated band.
convexity_pairs=0
for M in range(10,151):
 for k in range((M+2)//3,M+1):
  lhs=g(2,M,k)-2*g(3,M,k)+g(4,M,k)
  if lhs<0: raise ArithmeticError(('convexity',M,k,lhs))
  convexity_pairs+=1
rows=[];nstates=excluded=0;overall=None
for m in range(70,120):
 worst=None;tested=omitted=0
 for N in range(2*m,4*m+1):
  for r,cs in GF.items():
   M=N-r
   if not 2*(m-1)<=M<=4*(m-1):continue
   for j in range((2*N-1)//5+1,(N-2)//2+1):
    if M<10 or any(3*(j-s)<M for s in range(len(cs))):
     omitted+=1;continue
    num=0
    for s,c in enumerate(cs):
     k=j-s;z=balanced_floor(m-1,M,k)
     num+=c*comb(M,k)*poly_num(z)
    # Ratio of LHS comparison to RHS comparison, held as an exact Fraction.
    ratio=Fraction(2*(j+1)*num,3*(N+1-j)*(N-2*j-1)*comb(N,j)*TAYDEN)
    if ratio<=1:raise ArithmeticError(('failed',m,N,r,j,ratio))
    if worst is None or ratio<worst:worst=ratio;where=(N,r,j)
    tested+=1
 nstates+=tested;excluded+=omitted
 if overall is None or worst<overall[0]:overall=(worst,m,where)
 rows.append({'m':m,'tested':tested,'excluded':omitted,'minimum_ratio':f'{worst.numerator}/{worst.denominator}','minimizer':where})
src=json.loads(Path('C3-AU-scalar-producer.json').read_text())
summary={'states':nstates,'excluded':excluded,'rows':rows,'overall_minimum_ratio':f'{overall[0].numerator}/{overall[0].denominator}','overall_minimizer':{'m':overall[1],'N':overall[2][0],'r':overall[2][1],'j':overall[2][2]},'convexity_pairs':convexity_pairs,'producer_states':src['total_states'],'producer_excluded':src['total_excluded'],'state_totals_match':nstates==src['total_states'] and excluded==src['total_excluded']}
Path('C3-AU-scalar-replay.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps({k:v for k,v in summary.items() if k!='rows'},indent=2))
