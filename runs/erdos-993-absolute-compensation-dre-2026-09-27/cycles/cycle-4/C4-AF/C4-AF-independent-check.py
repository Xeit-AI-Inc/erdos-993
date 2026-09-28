"""Exact, independent spot checks for C4-AF. Run with PYTHONDONTWRITEBYTECODE=1."""
import json
from fractions import Fraction
from math import comb

def at(a,k):
    return a[k] if 0 <= k < len(a) else 0

def add(a,b):
    return [at(a,k)+at(b,k) for k in range(max(len(a),len(b)))]

def mul(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,u in enumerate(a):
        for j,v in enumerate(b): out[i+j]+=u*v
    return out

def powpoly(a,n):
    out=[1]
    for _ in range(n):out=mul(out,a)
    return out

def bn(n):return [comb(n,k) for k in range(n+1)]
def D(a,k):return at(a,k+1)-at(a,k)

def path(counts):
    rs=sum(([r]*counts[r-2] for r in (2,3,4)),[])
    N=sum(rs); L=[1,1];G=[1,2]
    B={r:add(bn(r),[0,1]) for r in (1,2,3,4)}
    Q=[1]
    for r in rs:Q=mul(Q,B[r])
    C=mul(G,Q);P=add(C,[0]+bn(N+1));A0=add(mul(L,Q),[0]+bn(N))
    As={};Ts={}
    for r in set(rs):
        rem=rs.copy();rem.remove(r);H=[1]
        for s in rem:H=mul(H,B[s])
        As[r]=add(mul(mul(G,B[r-1]),H),[0]+bn(N))
        F=[0]
        for h in range(r-1):F=add(F,bn(h))
        Ts[r]=mul(mul(G,F),H)
    W=[0]
    for r in As:W=add(W,[r*rs.count(r)*v for v in As[r]])
    x=next(k for k in range(len(P)) if D(P,k)<0)
    return rs,N,P,C,A0,As,Ts,W,x

def tree_poly(counts,delete=None):
    rs=sum(([r]*counts[r-2] for r in (2,3,4)),[])
    adj={0:[],1:[0,2],2:[1]};adj[0].append(1);v=3;tips={}
    for r in rs:
        c=v;v+=1;adj[c]=[0];adj[0].append(c)
        for _ in range(r):
            t=v;v+=1;adj[t]=[c];adj[c].append(t)
            tips.setdefault(r,t)
    if delete is not None:
        adj.pop(delete)
        for u in adj:adj[u]=[w for w in adj[u] if w!=delete]
    def dfs(u,parent):
        no=[1];yes=[0,1]
        for w in adj[u]:
            if w==parent:continue
            wn,wy=dfs(w,u)
            no=mul(no,add(wn,wy));yes=mul(yes,wn)
        return no,yes
    seen=set();out=[0]
    for u in adj:
        if u in seen:continue
        # Graph after one leaf deletion remains connected, but handle components explicitly.
        stack=[u];seen.add(u)
        while stack:
            a=stack.pop()
            for b in adj[a]:
                if b not in seen:seen.add(b);stack.append(b)
        no,yes=dfs(u,-1);out=mul(out if out != [0] else [1],add(no,yes))
    return out,tips

def check(counts,rank):
    rs,N,P,C,A0,As,Ts,W,x=path(counts);p=rank;j=p-2;delta=N+1-j
    flags={r:int(D(a,p)<0) for r,a in As.items()};e0=int(D(A0,p)<0)
    R=sum(r*rs.count(r)*flags[r] for r in flags);b=R+e0
    AA=sum(r*rs.count(r)*flags[r]*at(Ts[r],j) for r in flags)
    Dj=comb(N,j+1)-comb(N,j) if 0<=j<N else 0
    out=dict(profile=counts,n=N+len(rs)+3,N=N,alpha=N+2,x=x,p=p,j=j,
        guards=[x+2<=p,3*p<2*(N+2)+1,2*p<=N+2],
        selectors=dict(e0=e0,ei=flags),original_tip_weight=R,
        c_ratio_margin=at(C,p-1)-at(C,p),
        endpoint_shift_margin=at(A0,p)*at(C,p)-at(A0,p+1)*at(C,p-1),
        tip_shift_margins={r:at(a,p)*at(C,p)-at(a,p+1)*at(C,p-1) for r,a in As.items()},
        weighted_shift_margin=at(W,p)*at(C,p)-at(W,p+1)*at(C,p-1),
        mass_margin=AA-b*delta*Dj,
        exact_payment_margin=(delta*at(C,j)-(delta-1)*at(C,j+1))*AA-b*delta*Dj*at(C,j))
    return out

def main():
    GF={}
    for r in (2,3,4):
        F=[0]
        for h in range(r-1):F=add(F,bn(h))
        GF[r]=mul([1,2],F)
    assert GF=={2:[1,2],3:[2,5,2],4:[3,9,7,2]}
    witness=check([38,0,1],77)
    rs,N,P,C,A0,As,Ts,W,x=path([38,0,1]);k=77;A=As[4]
    witness.update(Ckm1=at(C,k-1),Ck=at(C,k),Ak=at(A,k),Ak1=at(A,k+1),
        left_minus_right=at(A,k+1)*at(C,k-1)-at(A,k)*at(C,k),terminal_difference=D(P,len(P)-1),
        lower_half_guard=2*k<=N+2)
    assert witness['left_minus_right']==49239834336 and x==41 and not witness['lower_half_guard']
    literal,tips=tree_poly([38,0,1]);end,_=tree_poly([38,0,1],2);tip,_=tree_poly([38,0,1],tips[4])
    witness['literal_matches']=[literal==P,end==A0,tip==A]
    assert all(witness['literal_matches'])
    rows=[check([0,0,40],p) for p in (80,81)]+[check([1,1,30],63)]
    for row in rows:
        assert all(row['guards']) and row['c_ratio_margin']>0
        assert row['weighted_shift_margin']>=0 and row['mass_margin']>=0 and row['exact_payment_margin']>=0
    # Independent finite-block interior/boundary count-vector equality, including size one.
    sizes=[1,3];f=[[1,2],[1,4,3,1]];H=mul(f[0],f[1]); M=sum(sizes)
    subset=[]
    for k in (0,2,M):
        total=Fraction(0)
        for t in range(sizes[0]+1):
            u=k-t
            if 0<=u<=sizes[1]:
                law=Fraction(comb(sizes[0],t)*comb(sizes[1],u),comb(M,k))
                weight=Fraction(f[0][t],comb(sizes[0],t))*Fraction(f[1][u],comb(sizes[1],u))
                total+=law*weight
        assert total==Fraction(at(H,k),comb(M,k))
        subset.append(dict(k=k,numerator=total.numerator,denominator=total.denominator))
    print(json.dumps(dict(GF_monomial=GF,witness=witness,eligible_rows=rows,subset_checks=subset),indent=2))

if __name__=='__main__':main()
