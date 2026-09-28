from math import comb, factorial, gcd
from fractions import Fraction
from functools import lru_cache
import json

S=1000; D=12; DEN=S**D*factorial(D)
W=[S**(D-h)*(factorial(D)//factorial(h)) for h in range(D+1)]
GF={2:(1,2),3:(2,5,2),4:(3,9,7,2)}
@lru_cache(None)
def g(r,M,k):
    if k==M: return Fraction(0)
    return Fraction(2*r,2*r+1)*Fraction(comb(M-r,k-1),comb(M,k))
@lru_cache(None)
def E(m,M,k):
    if M<=3*m: a,b,c=3*m-M,M-2*m,0
    else: a,b,c=0,4*m-M,M-3*m
    return a*g(2,M,k)+b*g(3,M,k)+c*g(4,M,k)
def taylor_scaled(t):
    # t is floor(1000 E); return P_12(t/1000) on denominator 1000^12*12!
    return sum(t**h*W[h] for h in range(D+1))
rows=[]
for m in range(70,120):
    nstates=nexcluded=0; worst=None
    for N in range(2*m,4*m+1):
      for r,coef in GF.items():
        M=N-r
        if not (2*(m-1)<=M<=4*(m-1)): continue
        for j in range((2*N-1)//5+1,(N-2)//2+1):
          ks=[j-s for s in range(len(coef))]
          if M<10 or any(3*k<M for k in ks):
            nexcluded+=1; continue
          # Convolve shifted coefficient ratios exactly, factoring choose(N,j)
          total=0
          for s,c in enumerate(coef):
            k=ks[s]; ev=E(m-1,M,k); floor=(ev.numerator*S)//ev.denominator
            assert Fraction(floor,S)<=ev
            total += c*comb(M,k)*taylor_scaled(floor)
          # T[j]/choose(N,j) weighted sum > 3 delta D_j / ... protocol's rearrangement
          left=2*(j+1)*total
          right=3*(N+1-j)*(N-2*j-1)*comb(N,j)*DEN
          if left<=right: raise AssertionError((m,N,r,j,left,right))
          margin=Fraction(left,right)
          if worst is None or margin<worst[0]: worst=(margin,N,r,j)
          nstates+=1
    rows.append({'m':m,'states':nstates,'excluded':nexcluded,'min_ratio':f'{worst[0].numerator}/{worst[0].denominator}','minimizer':worst[1:]})
print(json.dumps({'states':sum(x['states'] for x in rows),'excluded':sum(x['excluded'] for x in rows),'rows':rows},indent=2))
