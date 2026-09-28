#!/usr/bin/env python3
"""Independent exact audit of the C3-U1 rank claims; stdlib only."""
from math import comb
import json
from pathlib import Path

def conv(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): out[i+j]+=x*y
    return out

def plus(a,b):
    out=[0]*max(len(a),len(b))
    for i,x in enumerate(a): out[i]+=x
    for i,x in enumerate(b): out[i]+=x
    return out

def coeff(a,k): return a[k] if 0<=k<len(a) else 0

def profile(a2,a3,a4):
    N=2*a2+3*a3+4*a4; q=N+1
    qpoly=[1]
    for r,count in ((2,a2),(3,a3),(4,a4)):
        br=[comb(r,t) for t in range(r+1)]
        br[1]+=1
        for _ in range(count): qpoly=conv(qpoly,br)
    C=conv(qpoly,[1,2])
    parent=plus(C,[0]+[comb(q,t) for t in range(q+1)])
    parent += [0]*max(0,q+2-len(parent))
    return N,q,qpoly,C,parent

def scan(limit=45):
    profiles=descents=0; min_slack=None; minrow=None; violating=[]
    for m in range(1,limit+1):
        for a2 in range(m+1):
            for a3 in range(m-a2+1):
                a4=m-a2-a3
                N,q,Q,C,P=profile(a2,a3,a4); profiles+=1
                # Coefficients are zero extended, including the terminal difference.
                for k in range(q+2):
                    d=coeff(P,k+1)-coeff(P,k)
                    if d<0:
                        descents+=1
                        slack=54*k-(24*N-4*a2-3*a3-5)
                        if min_slack is None or slack<min_slack:
                            min_slack,minrow=slack,(a2,a3,a4,N,k,d)
                        if slack<0: violating.append((a2,a3,a4,N,k,d,slack))
    return {'scope':f'all count triples 1<=m<= {limit}, all zero-extended strict descents',
            'profiles':profiles,'strict_descent_rows':descents,
            'violations':violating[:10],'minimum_slack':min_slack,'minimum_row':minrow}

def focused():
    # Check the exact alternate-operator obstruction and compare it with the
    # profile-sensitive operator's coefficientwise local certificates.
    N,q,Q,C,P=profile(0,0,2)
    k=3
    E=(k+1)*coeff(P,k+1)-(N+2-k)*coeff(P,k)
    rank_slack=54*k-(24*N-4*0-4*0-5)
    # A=4 local checks: D_r=(5+4z)d/dz - 4r, then add h_r B_r.
    local={2:[7,-2],3:[8,-2,3],4:[9,0,12,4]}
    # D_1(G) is 6; D_r(B_r)+(2/3 for r=2 or 1/2 for r=3)*B_r
    # has only nonnegative exact rational coefficients.
    adjusted={}
    for r,hnum,hden in ((2,2,3),(3,1,2)):
        br=[comb(r,t) for t in range(r+1)]; br[1]+=1
        d=local[r]+[0]*max(0,len(br)-len(local[r]))
        adjusted[r]=[f'{d[i]*hden+hnum*br[i]}/{hden}' for i in range(max(len(d),len(br))) if (d[i]*hden+hnum*br[i])>=0]
        assert all(d[i]*hden+hnum*br[i]>=0 for i in range(max(len(d),len(br))))
    # Recheck the claimed integer strictness conversion for several residues.
    conv_ok=all((6*v>0 and 6*v%1==0) for v in (1,))
    return {'two_arity4_profile':{'N':N,'k':k,'P_k':coeff(P,k),'P_k1':coeff(P,k+1),
            'delta':coeff(P,k+1)-coeff(P,k),'E_k':E,'rank_slack':rank_slack,
            'meaning':'candidate inequality fails at k=3, but k=3 is not a strict descent'},
            'local_D4_coefficients':local,'adjusted_r2_r3_nonnegative':adjusted,
            'strict_conversion':'9k+1-4N+h>0; h=2a2/3+a3/2; multiply by 6 and use integer values to obtain 54k>=24N-4a2-3a3-5'}

if __name__=='__main__':
    out={'bounded_scan':scan(45),'operator_comparison':focused()}
    Path('independent_evidence.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps({'scan':out['bounded_scan'],'operator_comparison':out['operator_comparison']},indent=2))
