from pathlib import Path
from math import factorial,gcd
import json
from functools import lru_cache
SCALE=1000;DEG=12
DEN=SCALE**DEG*factorial(DEG)
WEIGHTS=[SCALE**(DEG-h)*(factorial(DEG)//factorial(h)) for h in range(DEG+1)]
GF={2:[1,2],3:[2,5,2],4:[3,9,7,2]}
def fall(x,k):
 v=1
 for i in range(k):v*=x-i
 return v
@lru_cache(maxsize=None)
def poly(t):
 v=0
 for w in reversed(WEIGHTS):v=v*t+w
 return v
def exponent_floor(m,M,k):
 common=315*fall(M,4)
 a=252*k*(M-k)*(M-2)*(M-3)
 b=270*k*(M-k)*(M-k-1)*(M-3)
 c=280*k*(M-k)*(M-k-1)*(M-k-2)
 num=(3*m-M)*a+(M-2*m)*b if M<=3*m else (4*m-M)*b+(M-3*m)*c
 assert num>=0
 return SCALE*num//common
rows=[]
for m in range(70,120):
 worst=None; tested=0; excluded=0
 for N in range(2*m,4*m+1):
  for r,cs in GF.items():
   M=N-r
   if not 2*(m-1)<=M<=4*(m-1):continue
   for j in range((2*N-1)//5+1,(N-2)//2+1):
    if M<10 or any(3*(j-s)<M for s in range(len(cs))):excluded+=1;continue
    num=sum(c*fall(j,s)*fall(N-j,r-s)*poly(exponent_floor(m-1,M,j-s)) for s,c in enumerate(cs))
    den=fall(N,r)*DEN
    lhs=2*(j+1)*num;rhs=3*(N+1-j)*(N-2*j-1)*den
    tested+=1
    if lhs<=rhs:raise ArithmeticError((m,N,r,j,lhs,rhs))
    if worst is None or lhs*worst[1]<worst[0]*rhs:worst=(lhs,rhs,N,r,j)
 a,b,N,r,j=worst;d=gcd(a,b)
 rows.append({'m':m,'tested_states':tested,'excluded_states':excluded,'minimum_ratio':{'numerator':str(a//d),'denominator':str(b//d)},'minimizer':{'N':N,'r':r,'j':j}})
 print(json.dumps({'m':m,'tested':tested,'excluded':excluded,'min_approx':a/b}),flush=True)
out={'scope':'Exact relaxed scalar certificate, conditional on unreviewed occupancy/balancing/rank arguments; no selector or formal award.','protocol':'C3-balanced-finite-protocol.md','scale':SCALE,'degree':DEG,'total_states':sum(x['tested_states'] for x in rows),'total_excluded':sum(x['excluded_states'] for x in rows),'rows':rows}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n')
