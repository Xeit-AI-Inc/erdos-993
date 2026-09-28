#!/usr/bin/env python3
"""Exact path-star selector audit; stdlib integers only."""
import json
from pathlib import Path
from math import comb


def conv(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        if x:
            for k,y in enumerate(b):
                if y: c[i+k]+=x*y
    return c

def add(a,b):
    c=[0]*max(len(a),len(b))
    for i,x in enumerate(a): c[i]+=x
    for i,x in enumerate(b): c[i]+=x
    return c

def delta(a,k):
    return (a[k+1] if k+1<len(a) else 0)-(a[k] if k<len(a) else 0)

def lp(n): return [comb(n,k) for k in range(n+1)]
def B(r):
    a=lp(r); a[1]+=1; return a
def F(r):
    a=[0]
    for h in range(r-1): a=add(a,lp(h))
    return a

def divide(a,b):
    assert b[0]==1
    n=max(1,len(a)-len(b)+1); q=[0]*n
    for j in range(n):
        v=a[j] if j<len(a) else 0
        for k in range(1,min(j,len(b)-1)+1): v-=b[k]*q[j-k]
        q[j]=v
    assert conv(q,b)==a
    return q

def profile_polys(counts):
    a2,a3,a4=counts
    cs={2:a2,3:a3,4:a4}
    m=sum(counts); N=2*a2+3*a3+4*a4; q=N+1; alpha=N+2
    # Exact differential recurrence for Q=prod B_r^a_r.
    D=[1]
    for r in (2,3,4): D=conv(D,B(r))
    A=[0]
    for r,c in cs.items():
        if c:
            term=conv(divide(D,B(r)),[(i+1)*v for i,v in enumerate(B(r)[1:])])
            A=add(A,[c*v for v in term])
    Q=[0]*(N+1); Q[0]=1
    for n in range(1,N+1):
        rhs=sum(A[k]*Q[n-1-k] for k in range(min(n-1,len(A)-1)+1))
        lhs=sum(D[i]*(n-i)*Q[n-i] for i in range(1,min(n,len(D)-1)+1))
        assert (rhs-lhs)%n==0
        Q[n]=(rhs-lhs)//n
    C=conv([1,2],Q); P=add(C,[0]+lp(q))
    x=next(k for k in range(len(P)) if delta(P,k)<0)
    beta=lambda k: comb(q,k)-(comb(q,k-1) if k>=1 else 0)
    assert delta(C,x-1)>=-beta(x-1) and delta(C,x)<-beta(x)
    A0=add(conv([1,1],Q),[0]+lp(N))
    Ais={}
    for r,c in cs.items():
        if c:
            H=divide(Q,B(r))
            Ai=add(conv(conv([1,2],B(r-1)),H),[0]+lp(N))
            rhs=conv([0,0,0,1],conv(F(r),H))
            # A0-Ai=z^3 F_r H_r, checked on complete zero-extended support.
            l=max(len(A0),len(Ai),len(rhs))
            pad=lambda f:f+[0]*(l-len(f))
            assert [u-v for u,v in zip(pad(A0),pad(Ai))]==pad(rhs)
            Ais[r]=Ai
    return m,N,q,alpha,Q,C,P,A0,Ais

def eval_profile(counts):
    m,N,q,alpha,Q,C,P,A0,Ais=profile_polys(counts)
    x=next(k for k in range(len(P)) if delta(P,k)<0)
    eligible=[]; endpoint_selected=[]; endpoint_only=[]; fully_selected=[]
    for p in range(x+2,N+4):
        if 3*p>=2*alpha+1 or 2*p>alpha: continue
        j=p-2; e0=delta(A0,p)<0
        flags={r:delta(Ai,p)<0 for r,Ai in Ais.items()}
        row={'p':p,'j':j,'delta':q-j,'e0':int(e0),'branch_flags':{str(r):int(e) for r,e in flags.items()}}
        eligible.append(row)
        if e0:
            endpoint_selected.append(row)
            if not any(flags.values()): endpoint_only.append(row)
        if e0 and all(flags.values()): fully_selected.append(row)
    return {'counts':list(counts),'m':m,'N':N,'alpha':alpha,'x':x,'eligible_rows':len(eligible),
            'endpoint_selected_rows':[r['p'] for r in endpoint_selected],
            'endpoint_only_rows':endpoint_only,
            'endpoint_and_all_arity_classes_selected_rows':[r['p'] for r in fully_selected]}

def direct_control(counts):
    # Independent direct product construction for explicit adversarial controls.
    a2,a3,a4=counts; cs={2:a2,3:a3,4:a4}; N=2*a2+3*a3+4*a4
    Q=[1]
    for r,c in cs.items():
        for _ in range(c): Q=conv(Q,B(r))
    m,N,q,alpha,Qrec,C,P,A0,Ais=profile_polys(counts)
    assert Q==Qrec
    x=next(k for k in range(len(P)) if delta(P,k)<0)
    dvals={}
    for p in range(x+2,N+4):
        if 3*p>=2*alpha+1 or 2*p>alpha or delta(A0,p)>=0: continue
        vals={}
        for r,Ai in Ais.items():
            # d_i = Delta_(p-3)(F_i H_i) = Delta_p(A0-Ai).
            H=divide(Q,B(r)); diff=conv([0,0,0,1],conv(F(r),H))
            d=delta(diff,p)
            assert d==delta(A0,p)-delta(Ai,p)
            vals[str(r)]={'ei':int(delta(Ai,p)<0),'delta_p_Ai':delta(Ai,p),'d_i':d}
        dvals[str(p)]={'delta_p_A0':delta(A0,p),'branches':vals}
    out=eval_profile(counts)
    return {'profile':out,'endpoint_on_rows_with_slopes':dvals}

def grid(max_m):
    profile_count=eligible_total=endpoint_selected_total=endpoint_only_total=full_total=0
    endpoint_only=[]
    for m in range(1,max_m+1):
        for a2 in range(m+1):
            for a3 in range(m-a2+1):
                a4=m-a2-a3; profile_count+=1
                row=eval_profile((a2,a3,a4))
                eligible_total+=row['eligible_rows']
                endpoint_selected_total+=len(row['endpoint_selected_rows'])
                endpoint_only_total+=len(row['endpoint_only_rows'])
                full_total+=len(row['endpoint_and_all_arity_classes_selected_rows'])
                if row['endpoint_only_rows']: endpoint_only.append(row)
    return {'scope':f'1<=m<={max_m}; all nonnegative count triples (a2,a3,a4) summing to m',
            'profile_count':profile_count,'eligible_lower_half_rows':eligible_total,
            'endpoint_selected_rows':endpoint_selected_total,'endpoint_only_rows':endpoint_only_total,
            'endpoint_on_full_selection_rows':full_total,'witnesses':endpoint_only}

if __name__=='__main__':
    summary={'grid_m_le_80':grid(80),
             'controls':[direct_control(c) for c in ((0,12,10),(0,12,11),(0,10,13),(1,8,14),(0,0,173))]}
    with open(Path(__file__).resolve().parent / 'selector-audit-replay.json','w') as f: json.dump(summary,f,indent=2,sort_keys=True)
    print(json.dumps({'grid_m_le_80':summary['grid_m_le_80'],
                      'controls':[c['profile'] for c in summary['controls']]},indent=2))
