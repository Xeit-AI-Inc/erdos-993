#!/usr/bin/env python3
"""Independent exact checks for C6-U3 implication audit; bounded controls only."""
from itertools import product
from math import comb
from fractions import Fraction


def add(a,b):
    n=max(len(a),len(b)); out=[0]*n
    for i,x in enumerate(a): out[i]+=x
    for i,x in enumerate(b): out[i]+=x
    return trim(out)

def mul(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): out[i+j]+=x*y
    return trim(out)

def trim(a):
    while len(a)>1 and a[-1]==0: a.pop()
    return a

def scale(a,c): return trim([c*x for x in a])
def shift(a,k): return [0]*k+a
def coeff(a,k): return a[k] if 0<=k<len(a) else 0
def delta(a,k): return coeff(a,k+1)-coeff(a,k)
def powpoly(a,n):
    if a == [1,1]: return choosepoly(n)
    out=[1]
    for _ in range(n): out=mul(out,a)
    return out

def choosepoly(n): return [comb(n,k) for k in range(n+1)]

def profile(rs):
    L=[1,1]; G=[1,2]; N=sum(rs); q=N+1; alpha=N+2
    Bs={r:add(powpoly(L,r),[0,1]) for r in (2,3,4)}
    Q=[1]
    for r in rs: Q=mul(Q,Bs[r])
    C=mul(G,Q)
    homogeneous=len(set(rs))==1
    Hhom=[1]
    if homogeneous:
        for _ in range(len(rs)-1): Hhom=mul(Hhom,Bs[rs[0]])
    P=add(C,shift(powpoly(L,q),1))
    A0=add(mul(L,Q),shift(powpoly(L,N),1))
    Ais=[]; Tis=[]
    for i,r in enumerate(rs):
        H=Hhom if homogeneous else [1]
        if not homogeneous:
            for h,s in enumerate(rs):
                if h!=i: H=mul(H,Bs[s])
        Brm1=add(powpoly(L,r-1),[0,1])
        F=[0]
        for h in range(r-1): F=add(F,powpoly(L,h))
        Ais.append(add(mul(mul(G,Brm1),H),shift(powpoly(L,N),1)))
        Tis.append(mul(mul(G,F),H))
    return N,q,alpha,C,P,A0,Ais,Tis

def first_descent(P):
    # Include the last nonzero coefficient and zero-extended terminal difference.
    for k in range(len(P)):
        if delta(P,k)<0: return k
    raise AssertionError('no strict descent')

profiles=0; guarded=0; premise_cases=0; ratios=[]; kappas=[]; edge_rows=[]
cases=[rs for m in range(1,5) for rs in product((2,3,4), repeat=m)]
cases += [(r,)*m for r in (2,3,4) for m in range(5,21)] + [(r,)*100 for r in (2,3,4)]
for rs in cases:
    profiles+=1
    N,q,alpha,C,P,A0,Ais,Tis=profile(rs)
    x=first_descent(P)
    for p in range(x+2, len(P)+1):
      if not (3*p < 2*alpha+1 and 2*p <= alpha): continue
      guarded+=1; j=p-2; d=q-j
      D=comb(N,j+1)-comb(N,j) if 0<=j<=N+1 else 0
      assert d>0 and D>0
      c0,c1=coeff(C,p-1),coeff(C,p)
      assert c0>0 and c1>0 and c1<c0
      t_num,t_den=coeff(C,j+1),coeff(C,j)
      assert t_num>0 and t_den>t_num
      t=Fraction(t_num,t_den); kap=1-t+t/d
      kappas.append((d,t_num,t_den,kap*d))
      e0=int(delta(A0,p)<0)
      es=[int(delta(a,p)<0) for a in Ais]
      b=e0+sum(r*e for r,e in zip(rs,es))
      A=sum(r*e*coeff(T,j) for r,e,T in zip(rs,es,Tis))
      # Formal relative margin after substitution, exact integer direction.
      for T in Tis:
        assert 2*coeff(T,j) >= 3*d*D
      for e,T in zip(es,Tis):
        if e:
          lhs=(d-1)*coeff(T,j)*coeff(C,j+1)
          rhs=d*coeff(T,j+1)*coeff(C,j)
          assert lhs>=rhs, (rs,p,j,lhs,rhs)
      S=b*D+sum(r*e*delta(T,j) for r,e,T in zip(rs,es,Tis))
      assert Fraction(S) <= b*D - kap*A
      # MASS implies exact-ratio payment; cross multiply all rational terms.
      if A>=b*d*D:
        assert (d*coeff(C,j) - (d-1)*coeff(C,j+1))*A >= b*d*D*coeff(C,j)
      W=[0]
      for r,a in zip(rs,Ais): W=add(W,scale(a,r))
      deck=(coeff(W,p+1)*coeff(C,p-1) <= coeff(W,p)*coeff(C,p))
      if deck:
        premise_cases+=1
        assert delta(W,p)<0
        assert any(es) and sum(r*e for r,e in zip(rs,es))>=2
        B=sum(r*e for r,e in zip(rs,es))
        assert A >= b*d*D
      if p==x+2 or 2*p==alpha or 3*p==2*alpha:
        edge_rows.append((rs,x,p,j,d,D,e0,es,b,A,S,deck,t_num,t_den,min(2*coeff(T,j)-3*d*D for T in Tis)))
print(f'profiles={profiles} guarded_rows={guarded} weighted-premise_rows={premise_cases}')
print('sample edge/interior rows (arity,m,x,p,j,delta,D,e0,selected-tip-count,b,A,S,deck):')
for row in edge_rows[:12]:
    rs,x,p,j,d,D,e0,es,b,A,S,deck,tn,td,branch_slack=row
    print((rs[0],len(rs),x,p,j,d,D,e0,sum(es),b,A,S,deck,tn,td,branch_slack))
print('first/last kappa*delta samples:', kappas[0][0],str(kappas[0][3]),kappas[-1][0],str(kappas[-1][3]))
print('bounded exact checks passed; this is not a universal proof.')
