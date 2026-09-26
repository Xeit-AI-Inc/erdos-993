from fractions import Fraction as F
from math import comb,factorial
from pathlib import Path
import json
factors={'L':([1,1],1),'one_plus_2z':([1,2],1),'B1':([1,2],1),'B2':([1,3,1],2),'B3':([1,4,3,1],4),'B4':([1,5,6,4,1],7),'F2':([1],0),'F3':([2,1],1),'F4':([3,3,1],3)}
rows={}
for name,(c,n) in factors.items():
 v=[F(a,comb(n,k)) for k,a in enumerate(c)];lc=[v[k]**2-v[k-1]*v[k+1] for k in range(1,len(c)-1)];assert all(x>=0 for x in lc)
 d=len(c)-1;lower=[];upper=[]
 for k in range(d+1):
  der=(k+1)*c[k+1] if k<d else 0;base=(d-k)*c[k];lower.append(F(der)-F(base,3));upper.append(2*base-der)
 assert min(lower)>=0 and min(upper)>=0
 rows[name]={'coefficients':c,'ulc_order':n,'normalized':[str(x) for x in v],'ulc_margins':[str(x) for x in lc],'derivative_lower_margins':[str(x) for x in lower],'derivative_upper_margins':upper}
minor_rows={}
for r in [2,3,4]:
 g=factors[f'B{r}'][0]
 for typ,c in [('deletion',factors[f'B{r-1}'][0]),('marked',factors[f'F{r}'][0])]:
  cc=c+[0]*(len(g)-len(c));minors=[{'r':i,'s':j,'value':cc[i]*g[j]-cc[j]*g[i]} for i in range(len(g)) for j in range(i+1,len(g))];assert all(x['value']>=0 for x in minors)
  minor_rows[f'{typ}_arity{r}']=minors
K=256*factorial(8)*640**8;cut=F(80328*K,100000**7);assert 0<cut<1
out={'authority':'controller arithmetic probe only, not an independent audit or proof award','factors':rows,'minors':minor_rows,'K':str(K),'cutoff_m':100000,'exact_cutoff_ratio':{'numerator':str(cut.numerator),'denominator':str(cut.denominator)},'display_only':float(cut),'remaining':'Uniform graph/count bridge, coefficient and index inequalities, mixed-minor argument and selector propagation require independent mathematical review.'}
p=Path(__file__).with_name('C6-HETEROGENEOUS-LARGE-BRANCH-ARITHMETIC.json');p.write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({'factors':len(rows),'minor_families':len(minor_rows),'cutoff_ratio':float(cut),'passed':True}))
