"""Independent recursive forest-DP replay of T_100 at p=alpha-2."""
import json

def t_tree(m):
    edges=[]; n=4*m+3
    edges.extend([(0,1),(1,2)])
    c=3
    for _ in range(m):
        edges.append((0,c))
        edges.extend([(c,c+1),(c,c+2),(c,c+3)])
        c += 4
    adj=[set() for _ in range(n)]
    for a,b in edges: adj[a].add(b); adj[b].add(a)
    return adj, edges

def components_poly(adj, removed=frozenset()):
    live=set(range(len(adj)))-set(removed)
    seen=set(); out=[1]
    def mul(a,b):
        z=[0]*(len(a)+len(b)-1)
        for i,x in enumerate(a):
            for j,y in enumerate(b): z[i+j]+=x*y
        return z
    def add(a,b):
        z=[0]*max(len(a),len(b))
        for i,x in enumerate(a): z[i]+=x
        for i,x in enumerate(b): z[i]+=x
        return z
    def subtree(v,parent):
        # returns (poly when v excluded, poly when v included)
        seen.add(v); e=[1]; inc=[0,1]
        for w in adj[v]&live:
            if w==parent: continue
            pe,pi=subtree(w,v)
            e=mul(e,add(pe,pi)); inc=mul(inc,pe)
        return e,inc
    for v in sorted(live):
        if v not in seen:
            e,i=subtree(v,-1); out=mul(out,add(e,i))
    return out

def coeff(a,k): return a[k] if 0<=k<len(a) else 0
def delta(a,k): return coeff(a,k+1)-coeff(a,k)
def first_strict(a):
    # coefficients beyond alpha are zero, so terminal delta_alpha=-i_alpha<0.
    return next(k for k in range(len(a)) if delta(a,k)<0)

m=120; adj,edges=t_tree(m); P=components_poly(adj); alpha=len(P)-1; p=alpha-2; x=first_strict(P)
rows=[]; S=0
for v in range(len(adj)):
    if len(adj[v])!=1: continue
    s=next(iter(adj[v])); W=adj[s]-{v}; H=components_poly(adj,{v,s}); R=components_poly(adj,{s}|adj[s])
    Pv=components_poly(adj,{v})
    favourable=delta(Pv,p)<0
    # exact local deletion identity and count-difference representation
    assert len(H)-1==alpha-1
    assert delta(Pv,p)==delta(H,p)+delta(R,p-1)
    q_p=coeff(H,p)-coeff(R,p)
    q_pm1=coeff(H,p-1)-coeff(R,p-1)
    g=delta(H,p-1)-delta(R,p-1)
    assert g==q_p-q_pm1
    if favourable:
        S+=g
        rows.append({'leaf':v,'support':s,'W':sorted(W),'q_p':q_p,'q_p_minus_1':q_pm1,'g':g,'delta_p_Tminusv':delta(Pv,p)})
assert x+2<=p
print(json.dumps({'m':m,'order':len(adj),'alpha':alpha,'x':x,'p':p,'eligible':x+2<=p,'leaf_count':sum(len(a)==1 for a in adj),'favorable_count':len(rows),'aggregate':S,'summand_g_frequency':{str(g):sum(r['g']==g for r in rows) for g in sorted(set(r['g'] for r in rows))},'all_local_identities_checked':True,'alpha_H_all_leaves':alpha-1,'first_favorable_rows':rows[:3],'last_favorable_row':rows[-1]}, sort_keys=True, indent=2))
