from pathlib import Path
from math import comb
from fractions import Fraction
import json

def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c

def B(r):return [comb(r,k)+(k==1)for k in range(r+1)]
def at(a,k):return a[k]if 0<=k<len(a)else 0
base=[]
for r,d in [(2,2),(3,4),(4,7)]:
 a=B(r)+[0]*(d-r);w=[Fraction(v,comb(d,k))for k,v in enumerate(a)]
 base.append({'r':r,'inflated_order':d,'normalized':[str(x)for x in w],'LC_gaps':[str(w[k]**2-w[k-1]*w[k+1])for k in range(1,d)]})
bad=[];exact_bad=[];profiles=tests=0
for m in range(1,21):
 for a2 in range(m+1):
  for a3 in range(m-a2+1):
   a4=m-a2-a3;counts=[a2,a3,a4];N=2*a2+3*a3+4*a4;h=1+2*a2+4*a3+7*a4;profiles+=1
   C=[1,2]
   for cr,cn in zip([2,3,4],counts):
    for _ in range(cn):C=mul(C,B(cr))
   for r in [2,3,4]:
    if not counts[r-2]:continue
    U=[1,2]
    for s,ns in zip([2,3,4],counts):
     for _ in range(ns-(s==r)):U=mul(U,B(s))
    U=mul(U,B(r-1))
    for k in range(1,(N+2)//2+1):
     E=comb(N,k-1)
     # Candidate sufficient bound using inflated ULC main surplus and C2 ratio lower bound.
     margin=2*(N+2-k)*(h+1)*at(U,k)-E*(N-k-1)*(k+1)*(h-k+1)
     tests+=1
     exact_margin=(h+1)*at(U,k)*at(C,k)+(k+1)*(h-k+1)*(E*at(C,k)-comb(N,k)*at(C,k-1))
     if exact_margin<0 and len(exact_bad)<20:exact_bad.append({"counts":counts,"r":r,"k":k,"signed_margin":str(exact_margin)})
     if margin<0 and len(bad)<20:bad.append({'counts':counts,'r':r,'k':k,'N':N,'h':h,'signed_margin':str(margin),'U_k':str(at(U,k)),'E_k':str(E)})
out={'scope':'Private diagnostic of a sufficient quantitative surplus bound, not the full shifted comparison. No mathematical award. Inflated ULC order h=1+2a2+4a3+7a4, distinct from the refuted degree-normalized full bracket ULC. Exact profile enumeration through m20 only.','base_factors':base,'profiles':profiles,'tests':tests,'first_twenty_failures':bad,'exact_ratio_surplus_first_twenty_failures':exact_bad}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({'profiles':profiles,'tests':tests,'first_failures':bad[:4],'exact_ratio_failures':exact_bad[:4]}))
