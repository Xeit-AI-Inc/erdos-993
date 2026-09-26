"""Exact finite base and rational constant check for an UNAWARDED root candidate."""
from math import factorial
from fractions import Fraction
from pathlib import Path
import json,hashlib

def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c

def add(a,b):
 return [(a[j]if j<len(a)else 0)+(b[j]if j<len(b)else 0)for j in range(max(len(a),len(b)))]

def binomial(n):
 a=[1]
 for j in range(n):a.append(a[-1]*(n-j)//(j+1))
 return a

def run():
 K=Fraction(factorial(8))*Fraction(125,124)**8*Fraction(150,49)**27
 assert 24*2003*K<1000**8
 failures=[];checks=0;digest=hashlib.sha256();bm=[1];counts={}
 for m in range(1,1000):
  old=bm;bm=mul(bm,[1,4,3,1])
  if m<3:continue
  l=binomial(3*m)
  seqs={'A0':add(mul([1,1],bm),[0]+l),'Astar':add(mul([1,5,7,2],old),[0]+l),'R':add([3*m*x for x in mul([2,5,2],old)],[(3*m+1)*x for x in l])}
  for label,z in seqs.items():
   assert 2*m+3<len(z)
   for j in range(m,2*m+3):
    margin=z[j]*z[j]-z[j-1]*z[j+1];checks+=1
    if margin<=0:failures.append({'m':m,'j':j,'label':label,'margin':str(margin)})
    digest.update(f'{m}:{label}:{j}:{margin}\n'.encode())
  counts[str(m)]=3*(m+3)
 result={'scope':'m=3..999; each Z=A0,Astar,R; all integer m<=j<=2m+2; strict LC only','exact_checks':checks,'failure_count':len(failures),'first_failures':failures[:20],'integer_margin_stream_sha256':digest.hexdigest(),'rational_constant':{'numerator':str(K.numerator),'denominator':str(K.denominator),'cutoff':1000,'strict_cutoff_inequality':24*2003*K<1000**8},'per_m_checks':counts,'status_authority':'unawarded root computational evidence; independent audit required'}
 Path(__file__).with_name('C5-TM-CENTRAL-LC-BASE.json').write_text(json.dumps(result,indent=2)+'\n')
 print(json.dumps({k:v for k,v in result.items()if k!='per_m_checks'}))
if __name__=='__main__':run()
