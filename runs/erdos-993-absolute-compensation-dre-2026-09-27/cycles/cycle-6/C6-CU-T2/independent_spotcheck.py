#!/usr/bin/env python3
"""Independent literal monomial-factor checks of C6 formulas and edge cases."""
import json
from math import comb
from pathlib import Path

def mul(a,b):
 out=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b): out[i+j]+=x*y
 return out

def br(r):
 return [comb(r,j)+(1 if j==1 else 0) for j in range(r+1)]
def coeff(a,k): return a[k] if 0<=k<len(a) else 0

def build(counts,r=None):
 q=[1]
 for ar,n in zip((2,3,4),counts):
  for _ in range(n): q=mul(q,br(ar))
 C=mul([1,2],q)
 if r is not None:
  qmark=[1]
  for ar,n in zip((2,3,4),counts):
   for t in range(n-(ar==r)):
    qmark=mul(qmark,br(ar))
  U=mul(mul([1,2],br(r-1)),qmark)
  return C,U
 return C

def row(counts,r,k):
 N=sum(a*x for a,x in zip((2,3,4),counts)); h=1+sum(a*x for a,x in zip((2,4,7),counts))
 C,U=build(counts,r); E=[0]+[comb(N,j) for j in range(N+1)]
 S=(h+1)*coeff(U,k)*coeff(C,k)+(k+1)*(h-k+1)*(coeff(E,k)*coeff(C,k)-coeff(E,k+1)*coeff(C,k-1))
 full=(coeff(U,k)+coeff(E,k))*coeff(C,k)-(coeff(U,k+1)+coeff(E,k+1))*coeff(C,k-1)
 return {'counts':counts,'N':N,'h':h,'r':r,'k':k,'U_k':coeff(U,k),'U_kp1':coeff(U,k+1),'C_k':coeff(C,k),'C_km1':coeff(C,k-1),'E_k':coeff(E,k),'E_kp1':coeff(E,k+1),'S':S,'full_tip_minor':full,'guard':k>=1 and 2*k<=N+2}

def main():
 cases=[row([1,0,0],2,1),row([0,22,0],3,27),row([38,0,1],4,77),row([0,0,100],4,101),row([0,0,100],4,99)]
 assert cases[0]['S']==98 and cases[0]['full_tip_minor']==19 and cases[0]['guard']
 assert cases[1]['guard'] and cases[1]['full_tip_minor']==777419068009671422357461955841645743808
 assert cases[2]['S'] is not None and not cases[2]['guard'] and cases[2]['full_tip_minor']==-49239834336
 assert cases[3]['guard'] and cases[4]['guard']
 result={'cases':cases,'factor_arrays':{str(r):br(r) for r in (1,2,3,4)}}
 Path(__file__).with_name('independent_spotcheck_result.json').write_text(json.dumps(result,indent=2)+'\n')
 print(json.dumps(result,sort_keys=True))
if __name__=='__main__': main()
