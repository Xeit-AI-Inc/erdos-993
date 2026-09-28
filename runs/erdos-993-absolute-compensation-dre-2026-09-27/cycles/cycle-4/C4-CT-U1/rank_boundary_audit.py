#!/usr/bin/env python3
"""Exact boundary/interior rank checks for the C4-U1 drift bound."""
from fractions import Fraction
from independent_drift_audit import B, add, mul, power, delta, coeff, binom


def row(counts):
    a2,a3,a4=counts
    rs=[2]*a2+[3]*a3+[4]*a4
    N=sum(rs); q=N+1; alpha=N+2
    Q=[1]
    for r in rs: Q=mul(Q,B(r))
    C=mul([1,2],Q)
    P=add(C,mul([0,1],power([1,1],N+1)))
    x=next(k for k in range(len(P)) if delta(P,k)<0)
    assert all(delta(P,k)>=0 for k in range(x))
    p=x+2 if counts==(0,12,10) else x+3
    j=p-2
    assert x+2<=p and 3*p<2*alpha+1 and 2*p<=alpha
    beta=binom(q,x)-binom(q,x-1)
    assert beta>0 and coeff(C,x)>0 and coeff(C,j)>0
    drift=Fraction((j+1)*coeff(C,j+1),coeff(C,j))-(q-j)
    upper=Fraction(2*j-N)-Fraction((j+1)*beta,coeff(C,x))
    assert Fraction(coeff(C,j+1),coeff(C,j))<=Fraction(coeff(C,x+1),coeff(C,x))
    assert drift<upper
    print(counts,'N=',N,'x=',x,'p=',p,'j=',j)
    print('  guards=True; beta=',beta,'C[x]=',coeff(C,x))
    print('  ratio_x=',Fraction(coeff(C,x+1),coeff(C,x)))
    print('  ratio_j=',Fraction(coeff(C,j+1),coeff(C,j)))
    print('  E_jD=',drift,'strict_bound=',upper,'2j-N=',2*j-N)


if __name__=='__main__':
    row((0,12,10))
    row((0,10,28))
