#!/usr/bin/env python3
"""Exact coefficient replay for T_m, m=1..80; Python integers only."""
import json
from pathlib import Path


def add(a, b):
    c=[0]*max(len(a),len(b))
    for i,v in enumerate(a): c[i]+=v
    for i,v in enumerate(b): c[i]+=v
    return c


def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return c


def power(a,n):
    r=[1]
    for _ in range(n): r=mul(r,a)
    return r


def shift(a,n=1): return [0]*n+a

def scale(a,s): return [s*x for x in a]

def delta(a,j): return (a[j+1] if j+1<len(a) else 0)-(a[j] if j<len(a) else 0)

def main():
    L=[1,1]
    B=[1,4,3,1]
    rows=[]
    for m in range(1,81):
        L3=power(L,3*m)
        Bm=power(B,m)
        Bprev=power(B,m-1)
        P=add(mul([1,2],Bm),shift(power(L,3*m+1)))
        Darm=add(mul([1,1],Bm),shift(L3))
        Dclaw=add(mul([1,3,1],Bprev),shift(L3))
        qarm=shift(L3)
        # q_claw=z(2+z)(1+2z)B^(m-1)+zL^(3m).
        # (2+z)(1+2z)=2+5z+2z^2
        qclaw=add(mul(shift([2,5,2]),Bprev),qarm)
        alpha=len(P)-1
        x=next(j for j in range(alpha+1) if delta(P,j)<0)
        elig=[]
        for p in range(x+2,alpha+1):
            if 3*p < 2*alpha+1:
                arm=delta(Darm,p)<0
                claw=delta(Dclaw,p)<0
                k=p-1
                term_arm=delta(qarm,k)
                term_claw=delta(qclaw,k)
                S=(term_arm if arm else 0)+3*m*(term_claw if claw else 0)
                elig.append({"p":p,"arm_favorable":arm,"claw_favorable":claw,
                             "arm_delta":delta(Darm,p),"claw_delta":delta(Dclaw,p),
                             "term_arm":term_arm,"term_claw":term_claw,"S":S})
        rows.append({"m":m,"alpha":alpha,"x":x,"eligible_rows":elig})
    out={"method":"Exact polynomial coefficient arithmetic with zero extension; T_m polynomial formulas as stated in report.",
         "generation_boundary":"all m=1,...,80; for each, every p satisfying x+2<=p<=alpha and 3p<2alpha+1",
         "m_count":80,"eligible_row_count":sum(len(r['eligible_rows']) for r in rows),
         "positive_full_s_count":sum(e['S']>0 for r in rows for e in r['eligible_rows']),
         "rows":rows}
    path=Path(__file__).with_name('evidence.json')
    path.write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps({k:v for k,v in out.items() if k!='rows'},indent=2))
    print('selector-patterns:',sorted({(e['arm_favorable'],e['claw_favorable']) for r in rows for e in r['eligible_rows']}))
    print('nonempty eligible m:',sum(bool(r['eligible_rows']) for r in rows))
    print('positive S:',out['positive_full_s_count'])

if __name__=='__main__': main()
