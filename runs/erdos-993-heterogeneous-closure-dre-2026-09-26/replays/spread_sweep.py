from math import comb
import json, hashlib, sys

MAX_M=int(sys.argv[1]) if len(sys.argv)>1 else 80

def add_shift(poly, amount, factor=1):
    out=[0]*(len(poly)+amount)
    for i,a in enumerate(poly): out[i+amount]+=factor*a
    return out

def conv_small(poly, b):
    out=[0]*(len(poly)+len(b)-1)
    for i,a in enumerate(poly):
        if a:
            for j,c in enumerate(b): out[i+j]+=a*c
    return out

def first_descent(p):
    # coefficients of parent, with terminal zero extension
    for k in range(len(p)):
        nxt=p[k+1] if k+1<len(p) else 0
        if nxt-p[k]<0: return k
    raise AssertionError('strict descent must occur by terminal')

def parent(Q,N):
    C=conv_small(Q,[1,2])
    # add z L^(N+1), direct binomial coefficients
    for t in range(N+2):
        idx=t+1
        if idx>=len(C): C.extend([0]*(idx-len(C)+1))
        C[idx]+=comb(N+1,t)
    return C

def delta_at(poly,k):
    a=poly[k] if 0<=k<len(poly) else 0
    b=poly[k+1] if 0<=k+1<len(poly) else 0
    return b-a

def coeffs_pow_base(counts):
    # dynamic Q lattice by total branch count; all values are exact integer coefficients
    table={(0,0,0):[1]}
    bases=([1,3,1],[1,4,3,1],[1,5,6,4,1])
    for m in range(1,MAX_M+1):
        for a in range(m+1):
            for b in range(m-a+1):
                c=m-a-b
                if a:
                    prev=(a-1,b,c); base=bases[0]
                elif b:
                    prev=(a,b-1,c); base=bases[1]
                else:
                    prev=(a,b,c-1); base=bases[2]
                table[(a,b,c)]=conv_small(table[prev],base)
    return table

def spread_increment(K):
    # E = G z^3 L^2 K; z^3 L^2 coefficients [1,2,1]
    return conv_small(add_shift(conv_small(K,[1,2,1]),3),[1,2])

Qtab=coeffs_pow_base(None)
results={'max_m':MAX_M,'profiles':0,'spreads':0,'first_descent_reversals':[],'optional_increment_failures':[], 'min_x_gap':None}
# Scan every multiset profile with >=2 arity-3 branches. Pair identity is independent of which two 3s are selected.
for m in range(2,MAX_M+1):
  for a in range(m+1):
    for b in range(2,m-a+1):
      c=m-a-b
      oldQ=Qtab[(a,b,c)]
      N=2*a+3*b+4*c
      oldP=parent(oldQ,N)
      xo=first_descent(oldP)
      K=Qtab[(a,b-2,c)]
      E=spread_increment(K)
      newQ=conv_small(K,conv_small([1,3,1],[1,5,6,4,1]))
      newP=parent(newQ,N)
      xn=first_descent(newP)
      results['profiles']+=1; results['spreads']+=1
      gap=xn-xo
      if results['min_x_gap'] is None or gap<results['min_x_gap'][0]:
        results['min_x_gap']=[gap,[a,b,c],xo,xn]
      if gap<0:
        results['first_descent_reversals'].append({'counts_old':[a,b,c], 'N':N,'x_old':xo,'x_new':xn,'gap':gap,'parent_old':oldP,'parent_new':newP})
      fail=None
      for k in range(xo):
        d=delta_at(E,k)
        if d<0:
          fail={'counts_old':[a,b,c], 'N':N,'x_old':xo,'k':k,'delta_E':d,'K':K,'E':E}
          break
      if fail: results['optional_increment_failures'].append(fail)
print(json.dumps(results, separators=(',',':')))
