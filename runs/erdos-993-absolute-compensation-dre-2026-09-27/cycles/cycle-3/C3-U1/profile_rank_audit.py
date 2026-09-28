from itertools import product

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return c

def add(a,b):
    c=[0]*max(len(a),len(b))
    for i,x in enumerate(a): c[i]+=x
    for i,x in enumerate(b): c[i]+=x
    return c

def binom_poly(q):
    a=[1]
    for _ in range(q): a=mul(a,[1,1])
    return a

def check(limit):
    checked=0; desc=0; min_slack=None; worst=None
    # enumerate all count triples with m<=limit
    for m in range(1,limit+1):
      for a2 in range(m+1):
       for a3 in range(m-a2+1):
        a4=m-a2-a3
        N=2*a2+3*a3+4*a4; q=N+1
        C=[1]
        for r,n in ((2,a2),(3,a3),(4,a4)):
          B=binom_poly(r); B[1]+=1
          for _ in range(n): C=mul(C,B)
        C=mul(C,[1,2])
        P=add(C,[0]+binom_poly(q))
        P += [0]*(q+2-len(P))
        for k in range(q+2):
          d=(P[k+1] if k+1<len(P) else 0)-(P[k] if k<len(P) else 0)
          if d<0:
            desc+=1
            slack=54*k-(24*N-4*a2-3*a3-5)
            if min_slack is None or slack<min_slack: min_slack=slack; worst=(a2,a3,a4,N,k,d,slack)
            if slack<0: return {'counterexample':(a2,a3,a4,N,k,d,slack),'profiles':checked+1,'descent_rows':desc}
        checked+=1
    return {'profiles':checked,'descent_rows':desc,'minimum_slack':min_slack,'worst':worst}
if __name__=='__main__':
 import sys
 print(check(int(sys.argv[1])))
