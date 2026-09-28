"""Exact independent finite audit of the C3-U1 rank statements."""
from math import comb
import sys

def mul(f,g):
    out=[0]*(len(f)+len(g)-1)
    for i,a in enumerate(f):
        for j,b in enumerate(g): out[i+j]+=a*b
    return out

def add_shift(f,g,s):
    out=f[:]
    if len(out)<s+len(g): out += [0]*(s+len(g)-len(out))
    for i,a in enumerate(g): out[s+i]+=a
    return out

def choose_row(n): return [comb(n,k) for k in range(n+1)]

def make_parent(a2,a3,a4):
    N=2*a2+3*a3+4*a4
    q=N+1
    Q=[1]
    for r,count in ((2,a2),(3,a3),(4,a4)):
        B=choose_row(r)
        B[1]+=1
        for _ in range(count): Q=mul(Q,B)
    C=mul([1,2],Q)
    P=add_shift(C,choose_row(q),1)
    return N,q,P

def audit(limit):
    profiles=descent_rows=forbidden_positions=0
    min_slack=None; witness=None
    for m in range(1,limit+1):
        for a2 in range(m+1):
            for a3 in range(m-a2+1):
                a4=m-a2-a3
                N,q,P=make_parent(a2,a3,a4)
                P += [0]*max(0,N+3-len(P))
                profiles+=1
                h6=4*a2+3*a3
                for k in range(N+3):
                    u=P[k] if k<len(P) else 0
                    v=P[k+1] if k+1<len(P) else 0
                    # Exact coefficient of 6*(D_q^(4)(P)+hP).
                    op6=6*(5*(k+1)*v-4*(q-k)*u)+h6*u
                    if op6<0:
                        raise AssertionError(('D4+h coefficient',a2,a3,a4,k,op6))
                    slack=54*k-(24*N-4*a2-3*a3-5)
                    if v<u:
                        descent_rows+=1
                        if min_slack is None or slack<min_slack:
                            min_slack=slack; witness=(a2,a3,a4,N,k,v-u)
                        if slack<0:
                            raise AssertionError(('rank counterexample',a2,a3,a4,N,k,v-u,slack))
                    if slack<0: forbidden_positions+=1
    # The weaker E=(1+z)P'-(N+2)P cone fails at this non-descent rank.
    N,q,P=make_parent(0,0,2)
    k=3
    delta=P[k+1]-P[k]
    E=(k+1)*P[k+1]-(N+2-k)*P[k]
    slack=54*k-(24*N-5)
    assert (P[k],P[k+1],delta,E,slack)==(178,298,120,-54,-25)
    return {'profiles':profiles,'strict_descent_rows':descent_rows,
            'rank_forbidden_positions':forbidden_positions,
            'minimum_slack':min_slack,'minimum_slack_witness':witness,
            'weaker_E_cone_obstruction':(0,0,2,N,k,P[k],P[k+1],delta,E,slack)}

if __name__=='__main__':
    print(audit(int(sys.argv[1]) if len(sys.argv)>1 else 45))
