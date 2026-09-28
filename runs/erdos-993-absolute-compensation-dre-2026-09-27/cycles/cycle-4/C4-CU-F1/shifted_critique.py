#!/usr/bin/env python3
"""Independent exact-arithmetic checks of Cycle 4 shifted-C claims."""
import json
from pathlib import Path

def trim(a):
    while len(a)>1 and a[-1]==0: a.pop()
    return a

def add(a,b):
    c=[0]*max(len(a),len(b))
    for i,v in enumerate(a): c[i]+=v
    for i,v in enumerate(b): c[i]+=v
    return trim(c)

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return trim(c)

def powp(a,n):
    out=[1]
    for _ in range(n): out=mul(out,a)
    return out

def at(a,k): return a[k] if 0<=k<len(a) else 0
def d(a,k): return at(a,k+1)-at(a,k)
def factors(rs):
    L=[1,1]; G=[1,2]
    B={r:add(powp(L,r),[0,1]) for r in (1,2,3,4)}
    Q=[1]
    for r in rs: Q=mul(Q,B[r])
    C=mul(G,Q); N=sum(rs)
    A0=add(mul(L,Q),[0]+powp(L,N))
    As={}
    for r in sorted(set(rs)):
        rem=rs.copy(); rem.remove(r)
        H=[1]
        for s in rem: H=mul(H,B[s])
        As[r]=add(mul(mul(G,B[r-1]),H),[0]+powp(L,N))
    W=[0]
    for r,A in As.items(): W=add(W,[rs.count(r)*r*z for z in A])
    P=add(C,[0]+powp(L,N+1))
    return N,P,C,A0,As,W

def tree_poly(rs,deleted=None):
    adj={0:[1],1:[0,2],2:[1]}; v=3
    for r in rs:
        c=v; v+=1; adj[c]=[0]; adj[0].append(c)
        for _ in range(r):
            t=v;v+=1;adj[c].append(t);adj[t]=[c]
    if deleted is not None:
        adj.pop(deleted)
        for u in adj: adj[u]=[w for w in adj[u] if w!=deleted]
    seen=set()
    def visit(u,par):
        seen.add(u); no=[1]; yes=[0,1]
        for v in adj[u]:
            if v==par: continue
            n,y=visit(v,u); no=mul(no,add(n,y)); yes=mul(yes,n)
        return no,yes
    a,b=visit(0,-1)
    return add(a,b)

def check(rs, literal=False):
    N,P,C,A0,As,W=factors(rs)
    x=next(k for k in range(len(P)) if d(P,k)<0)
    failures=[]; n_ind=0
    for k in range(1,(N+2)//2+1):
        for label,A in [('A0',A0)]+[(f'A{r}',a) for r,a in As.items()]:
            margin=at(A,k+1)*at(C,k-1)-at(A,k)*at(C,k)
            n_ind+=1
            if margin>0: failures.append((label,k,margin))
    wbad=[]
    for k in range(1,(N+2)//2+1):
        margin=at(W,k+1)*at(C,k-1)-at(W,k)*at(C,k)
        if margin>0: wbad.append((k,margin))
    out={'counts':[rs.count(r) for r in (2,3,4)],'n':N+len(rs)+3,'N':N,
         'first_strict_descent_x':x,'delta_x_P':d(P,x),'terminal_delta_P':d(P,len(P)-1),
         'guarded_individual_comparisons':n_ind,'individual_positive_violations':failures,
         'guarded_weighted_comparisons':(N+2)//2,'weighted_positive_violations':wbad}
    # Inspect exact boundary and first actual eligible interior point when one exists.
    kmax=(N+2)//2
    out['guard_boundary']={'k':kmax,'2k_le_Nplus2':2*kmax<=N+2,
      'individual_margins':{label:at(A,kmax+1)*at(C,kmax-1)-at(A,kmax)*at(C,kmax)
                            for label,A in [('A0',A0)]+[(f'A{r}',a) for r,a in As.items()]},
      'weighted_margin':at(W,kmax+1)*at(C,kmax-1)-at(W,kmax)*at(C,kmax)}
    p=x+2
    guards={'x_plus_2_le_p':x+2<=p,'3p_lt_2alpha_plus1':3*p<2*(N+2)+1,'2p_le_alpha':2*p<=N+2}
    out['actual_rank_check']={'p':p,'j':p-2,'guards':guards}
    if all(guards.values()):
        out['actual_rank_check']['selectors']={label:d(A,p)<0 for label,A in [('A0',A0)]+[(f'A{r}',a) for r,a in As.items()]}
        out['actual_rank_check']['weighted_delta']=d(W,p)
        out['actual_rank_check']['ratio_check']={}
        for label,A in [('A0',A0)]+[(f'A{r}',a) for r,a in As.items()]:
            # Use integer cross products to avoid floating-point ratios.
            lhs=at(A,p+1)*at(C,p-1); rhs=at(A,p)*at(C,p)
            out['actual_rank_check']['ratio_check'][label]={'shifted_margin':lhs-rhs,
                'Delta_p_A':d(A,p),'A_p_positive':at(A,p)>0,
                'C_ratio_below_one':at(C,p)<at(C,p-1)}
    if literal:
        tip=3
        for r in rs:
            center=tip
            if r==4:
                tip=center+1
                break
            tip=center+1+r
        out['literal_graph_crosscheck']={'P':tree_poly(rs)==P,'A0_vertex2':tree_poly(rs,2)==A0,
             'A4_first_tip':tree_poly(rs,tip)==As[4]}
        k=77; A=As[4]
        out['unguarded_witness']={'k':k,'C_k':at(C,k),'C_k_minus_1':at(C,k-1),
            'A_k':at(A,k),'A_k_plus_1':at(A,k+1),
            'target_violation_margin':at(A,k+1)*at(C,k-1)-at(A,k)*at(C,k),
            'guard_2k_le_Nplus2':2*k<=N+2}
    return out

profiles=[[1,0,0],[1,1,1],[38,0,1],[500,0,0],[0,500,0],[0,0,500],
          [499,0,1],[0,499,1],[1,0,499],[0,1,499]]
rows=[]
for c in profiles:
    rs=[2]*c[0]+[3]*c[1]+[4]*c[2]
    rows.append(check(rs,literal=(c==[38,0,1])))
Path(__file__).with_suffix('.json').write_text(json.dumps(rows,indent=2)+'\n')
print(json.dumps(rows,indent=2))
