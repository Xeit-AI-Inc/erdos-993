"""Exact finite mixed-minor base for an UNAWARDED root T_m candidate."""
from pathlib import Path
from fractions import Fraction
from math import factorial
import json,hashlib
from tm_central_lc_base import mul,add,binomial
K=Fraction(factorial(8))*Fraction(125,124)**8*Fraction(150,49)**27
constants={'A0':Fraction(47),'Astar':Fraction(431),'R':Fraction(14688,21)}
assert all(c*2003*K<1000**8 for c in constants.values())
bm=[1];checks=0;failures=[];stream=hashlib.sha256()
for m in range(1,1000):
 old=bm;bm=mul(bm,[1,4,3,1])
 if m<3:continue
 l=binomial(3*m)
 P=add(mul([1,2],bm),[0]+binomial(3*m+1))
 seqs={'A0':add(mul([1,1],bm),[0]+l),'Astar':add(mul([1,5,7,2],old),[0]+l),'R':add([3*m*x for x in mul([2,5,2],old)],[(3*m+1)*x for x in l])}
 for label,z in seqs.items():
  for j in range(m,2*m+3):
   margin=z[j]*P[j+1]-z[j+1]*P[j];checks+=1
   if margin<=0:failures.append({'m':m,'j':j,'Z':label,'margin':str(margin)})
   stream.update(f'{m}:{label}:{j}:{margin}\n'.encode())
result={'scope':'m=3..999; Z=A0,Astar,R; m<=j<=2m+2; mixed minor Z_j P_(j+1)-Z_(j+1)P_j strictly positive','exact_checks':checks,'failure_count':len(failures),'first_failures':failures[:10],'margin_stream_sha256':stream.hexdigest(),'large_m_constants':{z:{'numerator':str(c.numerator),'denominator':str(c.denominator),'cutoff_ratio':float(c*2003*K/1000**8),'exact_cutoff_pass':c*2003*K<1000**8}for z,c in constants.items()},'status_authority':'unawarded root evidence; not an independent audit or theorem award'}
Path(__file__).with_name('C5-TM-CENTRAL-LR-BASE.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result))
