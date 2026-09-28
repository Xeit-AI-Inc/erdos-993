#!/usr/bin/env python3
"""Independent exact audit of the C4-U1 conditioned drift claim."""
from fractions import Fraction
from math import comb


def trim(a):
    while len(a) > 1 and a[-1] == 0:
        a.pop()
    return a


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a): out[i] += x
    for i, x in enumerate(b): out[i] += x
    return trim(out)


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): out[i+j] += x*y
    return trim(out)


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def delta(a, k):
    return coeff(a, k+1) - coeff(a, k)


def power(a, n):
    out = [1]
    for _ in range(n): out = mul(out, a)
    return out


def B(r):
    return add([comb(r, k) for k in range(r+1)], [0, 1])


def binom(n, k):
    return comb(n, k) if 0 <= k <= n else 0


def divide_exact(a, b):
    # General high-degree exact polynomial long division over integers.
    rem = a[:]
    quotient = [0] * max(1, (len(a)-len(b)+1))
    while len(rem) >= len(b) and any(rem):
        shift = len(rem)-len(b)
        c, remlead = divmod(rem[-1], b[-1])
        assert remlead == 0
        quotient[shift] += c
        for k, v in enumerate(b): rem[shift+k] -= c*v
        trim(rem)
    assert rem == [0]
    return trim(quotient)


def main():
    rs = [3]*12 + [4]*10
    N = sum(rs); q = N+1; alpha = N+2
    L=[1,1]; G=[1,2]
    Q=[1]
    for r in rs: Q=mul(Q,B(r))
    C=mul(G,Q)
    P=add(C,mul([0,1],power(L,N+1)))
    x=next(k for k in range(len(P)) if delta(P,k)<0)
    assert x == 37
    assert all(delta(P,k)>=0 for k in range(x))
    assert delta(P,x) < 0
    p=x+2; j=p-2; d=q-j
    assert (x+2<=p and 3*p<2*alpha+1 and 2*p<=alpha)
    beta=binom(q,x)-binom(q,x-1)
    cx=coeff(C,x); cj=coeff(C,j); cj1=coeff(C,j+1)
    assert beta>0 and cx>0 and cj>0 and 0<cj1<cj
    # The exact descent and LR propagation inequalities, both with positive denominators.
    assert Fraction(delta(C,x),cx) < -Fraction(beta,cx)
    assert Fraction(cj1,cj) <= Fraction(coeff(C,x+1),cx)
    # Explicit coefficient identity from (1+z)C' - qC = Q + sum_i G(1-(r_i-1)z)H_i.
    rhs=Q[:]
    for r in rs:
        H=divide_exact(Q,B(r))
        local=mul(G, add([1], [0, -(r-1)]))
        rhs=add(rhs,mul(local,H))
    for k in range(q+2):
        lhs=(k+1)*coeff(C,k+1)-(q-k)*coeff(C,k)
        assert lhs==coeff(rhs,k), (k,lhs,coeff(rhs,k))
    drift=Fraction((j+1)*cj1,cj)-(q-j)
    upper=Fraction(2*j-N,1)-Fraction((j+1)*beta,cx)
    assert drift < upper
    # At j=x for this boundary-eligible row, compare the conditioned drift to fugacity one.
    numerator=Fraction(coeff(Q,x),1)
    for r in (3,4):
        h=divide_exact(Q,B(r)); gh=mul(G,h)
        mult=rs.count(r)
        numerator += mult*(coeff(gh,x)-(r-1)*coeff(gh,x-1))
    ex=numerator/cx
    e1=Fraction(1,3)+12*Fraction(-1,9)+10*Fraction(-2,17)
    assert ex == Fraction(-60593070467780913468600,26246340325222555216909)
    assert e1 == Fraction(-37,17)
    assert ex < e1
    # Exact selectors at the same current p, preserving one endpoint and r_i tags.
    A0=add(mul(L,Q),mul([0,1],power(L,N)))
    sel0=int(delta(A0,p)<0)
    sel=[]; tcoeff={}
    for r in (3,4):
        H=divide_exact(Q,B(r))
        Ai=add(mul(mul(G,B(r-1)),H),mul([0,1],power(L,N)))
        sel.append(int(delta(Ai,p)<0))
        F=[0]
        for h in range(r-1): F=add(F,power(L,h))
        Ti=mul(mul(G,F),H)
        tcoeff[r]=coeff(Ti,j)
    b=sel0+12*3*sel[0]+10*4*sel[1]
    assert (sel0,sel)==(1,[1,1]) and b==77
    A=12*3*tcoeff[3]+10*4*tcoeff[4]
    debt=binom(N,j+1)-binom(N,j)
    margin=(d*cj-(d-1)*cj1)*A-b*d*debt*cj
    assert margin==841657089276596927110510442162384388444656818560
    print('PASS exact coefficient identity for every zero-extended rank k=0..q+1')
    print('profile=(a2,a3,a4)=(0,12,10), N=76 q=77 alpha=78 x=37 p=39 j=37')
    print('guards=True; selectors=(e0,e3,e4)=(1,1,1); b=77')
    print('beta_x=',beta,'C[x]=',cx,'Delta_x C=',delta(C,x))
    print('E_x D=',ex,'fugacity1=',e1,'difference=',ex-e1)
    print('E_j D=',drift,'strict upper=',upper)
    print('A=',A,'D_j=',debt,'primary signed margin=',margin)


if __name__ == '__main__': main()
