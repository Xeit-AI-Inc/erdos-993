"""Independent coefficient and literal-tree replay of the C1-U2 spread witness."""
from math import comb
from fractions import Fraction
from collections import defaultdict
import json

# Sparse integer coefficient maps; zero-extension is implicit.
def add(a,b):
    c=dict(a)
    for k,v in b.items(): c[k]=c.get(k,0)+v
    return {k:v for k,v in c.items() if v}
def mul(a,b):
    c=defaultdict(int)
    for i,x in a.items():
        for j,y in b.items(): c[i+j]+=x*y
    return {k:v for k,v in c.items() if v}
def sub(a,b): return add(a,{k:-v for k,v in b.items()})
def power(a,n):
    out={0:1}
    for _ in range(n): out=mul(out,a)
    return out
def coefficient(a,k): return a.get(k,0)
def delta(a,k): return coefficient(a,k+1)-coefficient(a,k)
def poly1(n): return {k:comb(n,k) for k in range(n+1) if comb(n,k)}

L={0:1,1:1}; G={0:1,1:2}
def branch(r): return add(power(L,r),{1:1})
def run_f(r):
    out={}
    for h in range(r-1): out=add(out,power(L,h))
    return out

def tree(rs, deleted=None):
    # Actual tree vertices: 0-1-2, each branch center adjacent to 0,
    # and r private tips adjacent to its center. deleted is a vertex ID.
    n=3+len(rs)+sum(rs)
    adj=[set() for _ in range(n)]
    def edge(u,v): adj[u].add(v);adj[v].add(u)
    edge(0,1); edge(1,2)
    centers=[]; tips=[]; v=3
    for r in rs:
        c=v; v+=1; centers.append(c); edge(0,c)
        branch_tips=[]
        for _ in range(r):
            t=v; v+=1; edge(c,t); branch_tips.append(t)
        tips.append(branch_tips)
    if deleted is not None:
        for w in list(adj[deleted]): adj[w].remove(deleted)
        adj[deleted].clear()
    # Vertex deletion leaves an isolated deleted vertex; it contributes 1.
    seen=set(); total={0:1}
    for root in range(n):
        if root==deleted or root in seen: continue
        parent={root:None}; order=[root]
        for u in order:
            seen.add(u)
            for w in adj[u]:
                if w==parent[u] or w==deleted or w in parent: continue
                parent[w]=u; order.append(w)
        free={}; taken={}
        for u in reversed(order):
            f={0:1}; t={1:1}
            for w in adj[u]:
                if parent.get(w)==u:
                    f=mul(f,add(free[w],taken[w]))
                    t=mul(t,free[w])
            free[u]=f; taken[u]=t
        total=mul(total,add(free[root],taken[root]))
    return total, centers,tips

def profile(counts):
    rs=[r for r,count in zip((2,3,4),counts) for _ in range(count)]
    N=sum(rs); q=N+1; alpha=N+2
    P,centers,tips=tree(rs)
    Q={0:1}
    for r in rs: Q=mul(Q,branch(r))
    C=mul(G,Q)
    A0,_,_=tree(rs,deleted=2)
    parent_formula=add(C,{k+1:v for k,v in poly1(q).items()})
    endpoint_formula=add(mul(L,Q),{k+1:v for k,v in poly1(N).items()})
    assert P==parent_formula, 'literal parent graph disagrees with contract P'
    assert A0==endpoint_formula, 'literal endpoint-deletion graph disagrees with contract A0'
    As_by_r={}
    T_by_r={}
    for r in sorted(set(rs)):
        idx=rs.index(r); deleted_tip=tips[idx][0]
        As_by_r[r]=tree(rs,deleted=deleted_tip)[0]
        H={0:1}
        for s in rs:
            if s!=r or rs.index(s)!=idx: # not used; see rebuild below
                pass
        # Product with one branch factor omitted; avoid duplicate-index lookup.
        H={0:1}
        omitted=False
        for s in rs:
            if s==r and not omitted: omitted=True; continue
            H=mul(H,branch(s))
        leaf_formula=add(mul(mul(G,branch(r-1)),H),{k+1:v for k,v in poly1(N).items()})
        assert As_by_r[r]==leaf_formula, 'literal private-tip deletion disagrees with contract Ai'
        T_by_r[r]=mul(mul(G,run_f(r)),H)
    x=next(k for k in range(max(P)+2) if delta(P,k)<0)
    assert all(delta(P,k)>=0 for k in range(x))
    assert delta(P,x)<0
    return rs,N,q,alpha,P,C,A0,As_by_r,T_by_r,x

def payment(counts,p):
    rs,N,q,alpha,P,C,A0,As,Ts,x=profile(counts)
    j=p-2; d=q-j; Dj=comb(N,j+1)-comb(N,j)
    assert x+2<=p and 3*p<2*alpha+1 and 2*p<=alpha
    e0=int(delta(A0,p)<0)
    es={r:int(delta(a,p)<0) for r,a in As.items()}
    b=e0+sum(r*es[r]*rs.count(r) for r in es)
    A=sum(r*es[r]*rs.count(r)*coefficient(Ts[r],j) for r in es)
    Cj=coefficient(C,j); Cnext=coefficient(C,j+1)
    margin=(d*Cj-(d-1)*Cnext)*A-b*d*Dj*Cj
    quotient=Fraction((d*Cj-(d-1)*Cnext)*A,d*Cj*b*Dj) if b else None
    return {'counts':counts,'m':len(rs),'N':N,'q':q,'alpha':alpha,'x':x,'p':p,'j':j,'delta':d,'D':Dj,'Cj':Cj,'Cnext':Cnext,'eligible':{'x_plus_2_le_p':x+2<=p,'3p_lt_2alpha_plus_1':3*p<2*alpha+1,'2p_le_alpha':2*p<=alpha},'selector_deltas':{'endpoint':delta(A0,p),'private_tip_by_arity':{r:delta(a,p) for r,a in As.items()}},'e0':e0,'es':es,'b':b,'A':A,'margin':margin,'Q':str(quotient),'Q_num':quotient.numerator if quotient else 0,'Q_den':quotient.denominator if quotient else 1,'first_descent_prefix_min':min(delta(P,k) for k in range(x)),'dP_xm1':delta(P,x-1),'dP_x':delta(P,x)}

old=payment((0,10,13),42); new=payment((1,8,14),42)
# Exact rational direction by positive-denominator cross product.
cross=new['Q_num']*old['Q_den']-old['Q_num']*new['Q_den']
assert old['Q_num']>0 and old['Q_den']>0 and new['Q_num']>0 and new['Q_den']>0
assert cross<0
assert old['margin']>0 and new['margin']>0
print(json.dumps({'old':old,'new':new,'new_minus_old_Q_cross_product':cross,'all_literal_tree_and_payment_assertions_pass':True},indent=2))
