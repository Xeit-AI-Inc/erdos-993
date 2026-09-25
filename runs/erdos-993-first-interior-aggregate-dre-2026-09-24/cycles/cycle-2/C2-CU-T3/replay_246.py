#!/usr/bin/env python3
"""Independent exact forest DP; P4, 120 length-two arms, two sibling leaves."""
import json

def add(a,b):
    c=[0]*max(len(a),len(b))
    for i,x in enumerate(a): c[i]+=x
    for i,x in enumerate(b): c[i]+=x
    return c

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return c

def poly(adj, available):
    seen=set()
    answer=[1]
    for root in sorted(available):
        if root in seen: continue
        parent={root:None}
        order=[root]
        for u in order:
            for v in sorted(adj[u] & available):
                if v not in parent:
                    parent[v]=u
                    order.append(v)
        seen.update(order)
        dp={}
        for u in reversed(order):
            no=[1]
            yes=[0,1]
            for v in sorted(adj[u] & available):
                if parent.get(v)==u:
                    cv0,cv1=dp[v]
                    no=mul(no,add(cv0,cv1))
                    yes=mul(yes,cv0)
            dp[u]=(no,yes)
        answer=mul(answer,add(*dp[root]))
    while len(answer)>1 and answer[-1]==0: answer.pop()
    return answer

def coeff(p,k):
    return p[k] if 0<=k<len(p) else 0

def delta(p,k):
    return coeff(p,k+1)-coeff(p,k)

def main():
    m=120
    q=2
    n=4+2*m+q
    edges=[(0,1),(1,2),(2,3)]
    edges += [(3,4+2*j) for j in range(m)]
    edges += [(4+2*j,5+2*j) for j in range(m)]
    edges += [(3,4+2*m+t) for t in range(q)]
    adj=[set() for _ in range(n)]
    for u,v in edges:
        adj[u].add(v);adj[v].add(u)
    assert len(edges)==n-1
    allv=set(range(n))
    P=poly(adj,allv)
    a=len(P)-1
    p=a-2
    x=next(k for k in range(a+1) if delta(P,k)<0)
    leaves=[v for v in range(n) if len(adj[v])==1]
    rows=[]
    for v in leaves:
        s=next(iter(adj[v]))
        dv=delta(poly(adj,allv-{v}),p)
        H=allv-{v,s}
        R=allv-({s}|adj[s])
        term=delta(poly(adj,H),p-1)-delta(poly(adj,R),p-1)
        rows.append((v,s,dv,term))
    selected=[row for row in rows if row[2]<0]
    S=sum(row[3] for row in selected)
    # Each original tag is counted, including both sibling leaves at support 3.
    assert a==m+q+2 and x+2<=p and p>=2
    assert all(t<=0 for _,_,_,t in rows)
    by_support={}
    for v,s,dv,term in rows:
        by_support.setdefault(str(s),[]).append([v,dv,term])
    assert len(by_support['3'])==2
    assert by_support['3'][0][1:]==by_support['3'][1][1:]
    print(json.dumps({'constructor':'P4 0-1-2-3; arms 3-(4+2j)-(5+2j), 0<=j<120; extra leaves 244,245 at support 3',
        'n':n,'edge_count':len(edges),'alpha':a,'p':p,'x':x,'eligible':x+2<=p,
        'original_leaf_count':len(leaves),'favorable_leaf_count':len(selected),
        'complete_sum':S,'by_support':by_support},indent=2))
if __name__=='__main__':main()
