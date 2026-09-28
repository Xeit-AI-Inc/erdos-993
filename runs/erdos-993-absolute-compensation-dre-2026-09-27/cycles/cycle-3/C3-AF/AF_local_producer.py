from fractions import Fraction as F
from math import factorial,comb
from pathlib import Path
import json
v=sum((F(119,20)**h/F(factorial(h)) for h in range(9)),F(0));assert v>288
n=0
for M in range(44,251):
 for k in range((M+2)//3,M//2+2):
  if 2*k>M+2:continue
  for a in (2,3,4):
   g=F(2*a*comb(M-a,k-1),(2*a+1)*comb(M,k));assert g>=F(1,20);n+=1
out={'scope':'controller exact base scalar and finite local probability checks for unreviewed m120 local-MASS argument; no universal award','E8_numerator':str(v.numerator),'E8_denominator':str(v.denominator),'E8_approx':float(v),'threshold':288,'probability_checks':n,'M_range':[44,250]}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
