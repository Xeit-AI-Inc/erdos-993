#!/usr/bin/env python3
"""Exact rational/integer spot checks for the C6 m>=100 tail proof."""
from fractions import Fraction as F
from math import comb

def poly_mul(a,b):
 o=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b): o[i+j]+=x*y
 return o

def op_coeff(a,d,k):
 return 3*(k+1)*(a[k+1] if k+1<len(a) else 0) + (2*k-2*d)*(a[k] if k<len(a) else 0)

def check():
 B={1:[1,2],2:[1,3,1],3:[1,4,3,1],4:[1,5,6,4,1]}
 assert {r:[op_coeff(a,len(a)-1,k) for k in range(len(a))] for r,a in B.items()}=={1:[4,0],2:[5,0,0],3:[6,2,3,0],4:[7,6,12,4,0]}
 # Verify arity-ordering cross products at boundary and interior integer N,k.
 for N in range(200,2001):
  for k in range(N//4+1, (N+2)//2+1):
   assert N+13<=15*k and N+25<=28*k
   g=[]
   for r in (2,3,4): g.append(F(2*r,2*r+1)*F(comb(N-r,k-1),comb(N,k)))
   assert g[0]>=g[1]>=g[2]>0
   # g4 nonincreasing k when 4k>=N-3, ratio multiplied out.
   if k<(N+2)//2:
    # ratio = (k+1)(N-k-3)/(k(N-k)); denominator positive
    assert (k+1)*(N-k-3)<=k*(N-k)
 # Exact parity midpoint closed forms at smallest tail boundary and a few larger sizes.
 for N in range(200,2001):
  K=(N+2)//2
  g4=F(8,9)*F(comb(N-4,K-1),comb(N,K))
  assert g4>=F(1,20)
 # Taylor rational exacts
 a=F(99,20)
 E8=sum(a**j/F(1,1) for j in [])
 E8=sum(a**j/__import__('math').factorial(j) for j in range(9))
 E7=sum(a**j/__import__('math').factorial(j) for j in range(8))
 assert E8>102 and E7>20
 # Deficit factor is strictly > -1/2; last denominator positive at guard.
 for N in (200,201,202,999,2000):
  for k in (1, max(1,(N+1)//4), (N+2)//2):
   if 2*k<=N+2:
    b=F(N+1-k,k)
    val=1-F(3,2)*F(N+1-k,N+2-k)
    assert val>F(-1,2)
    assert (k+1)>0 and (N+2-k)>0
 # Last polynomial comparison; exact smallest margin N=200,m=100.
 assert 4*200*(100+2)-(200+4)*(200+2)>0
 print({'operator_coefficients':True,'g_ordering_domain':'N=200..2000 all complementary-band ranks','g4_floor_minimum':str(min(F(8,9)*F(comb(N-4,(N+2)//2-1),comb(N,(N+2)//2)) for N in range(200,2001))),'E8_99_20':str(E8),'E7_99_20':str(E7),'tail_checks':'passed'})
if __name__=='__main__': check()
