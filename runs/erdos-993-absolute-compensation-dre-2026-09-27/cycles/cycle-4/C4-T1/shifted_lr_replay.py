#!/usr/bin/env python3
"""Independent exact checks for selected guarded shifted-C comparisons."""
import json
from pathlib import Path

ROOT = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')

def add(a, b):
    n=max(len(a),len(b)); c=[0]*n
    for i,v in enumerate(a): c[i]+=v
    for i,v in enumerate(b): c[i]+=v
    return trim(c)

def trim(a):
    while len(a)>1 and a[-1]==0: a.pop()
    return a

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return trim(c)

def power(a,n):
    v=[1]
    for _ in range(n): v=mul(v,a)
    return v

def shift(a,n=1): return [0]*n+a

def coef(a,k): return a[k] if 0<=k<len(a) else 0

def profile(counts):
    L=[1,1]; G=[1,2]
    bs=[]
    for r,c in zip((2,3,4),counts):
        B=add(power(L,r),[0,1])
        bs += [B]*c
    Q=[1]
    for B in bs: Q=mul(Q,B)
    Hs=[]
    for idx,r in enumerate([r for r,c in zip((2,3,4),counts) for _ in range(c)]):
        H=[1]
        for j,B in enumerate(bs):
            if j!=idx: H=mul(H,B)
        Hs.append((r,H))
    N=sum(r*c for r,c in zip((2,3,4),counts)); q=N+1
    C=mul(G,Q)
    P=add(C,shift(power(L,q)))
    A0=add(mul(L,Q),shift(power(L,N)))
    Ais=[]
    for r,H in Hs:
        Brm1=add(power(L,r-1),[0,1])
        Ai=add(mul(mul(G,Brm1),H),shift(power(L,N)))
        Ais.append((r,Ai))
    x=next(k for k in range(len(P)) if coef(P,k+1)-coef(P,k)<0)
    return N,q,C,P,x,A0,Ais

def tree_poly(adj, root, forbidden=None):
    seen=set()
    def visit(v,parent):
        seen.add(v)
        out=[1]; inc=[0,1]
        for u in adj[v]:
            if u==parent or u==forbidden: continue
            child_out,child_in=visit(u,v)
            out=mul(out,add(child_out,child_in))
            inc=mul(inc,child_out)
        return out,inc
    if forbidden==root:
        # forest after deleting root
        total=[1]
        for u in adj[root]:
            if u not in seen:
                o,i=visit(u,root); total=mul(total,add(o,i))
        return total
    o,i=visit(root,-1)
    return add(o,i)

def check_profile(counts):
    N,q,C,P,x,A0,Ais=profile(counts)
    alpha=N+2
    result={'counts':counts,'N':N,'x':x,'eligible_p':[],'guarded_k_failures':[], 'part_failures':[]}
    allA=[('endpoint',A0)]+[(f'tip_r{r}_{i}',a) for i,(r,a) in enumerate(Ais)]
    L=[1,1]; G=[1,2]
    Q=[1]
    branch_rs=[r for r,c in zip((2,3,4),counts) for _ in range(c)]
    for r in branch_rs: Q=mul(Q,add(power(L,r),[0,1]))
    components=[('endpoint_main',mul(L,Q)),('binomial_perturbation',shift(power(L,N)))]
    for idx,r in enumerate(branch_rs):
        H=[1]
        for j,s in enumerate(branch_rs):
            if idx!=j: H=mul(H,add(power(L,s),[0,1]))
        components.append((f'tip_main_r{r}_{idx}',mul(mul(G,add(power(L,r-1),[0,1])),H)))
    for k in range(1,(N+2)//2+1):
        for name,a in components:
            gap=coef(a,k)*coef(C,k)-coef(a,k+1)*coef(C,k-1)
            if gap<0: result['part_failures'].append({'k':k,'part':name,'margin':gap})
    for k in range(1,(N+2)//2+1):
        for name,a in allA:
            gap=coef(a,k)*coef(C,k)-coef(a,k+1)*coef(C,k-1)
            if gap<0: result['guarded_k_failures'].append({'k':k,'type':name,'margin':gap})
    for p in range(x+2,alpha+1):
        if 3*p<2*alpha+1 and 2*p<=alpha:
            result['eligible_p'].append(p)
    # Test the exact descent-derived strict-selector implication at eligible rows.
    result['eligible_selector_failures']=[]
    result['selector_rows']=[]
    for p in result['eligible_p']:
        e0=int(coef(A0,p+1)-coef(A0,p)<0)
        tips=[int(coef(a,p+1)-coef(a,p)<0) for _,a in Ais]
        result['selector_rows'].append({'p':p,'endpoint_selected':e0,'selected_tip_branch_copies':sum(r*e for (r,_),e in zip(Ais,tips)),'tip_branch_copies':sum(r for r,_ in Ais)})
        if not e0: continue
        if not any(tips):
            result['eligible_selector_failures'].append(p)
    result['part_failure_summary']={}
    for part in sorted({x['part'] for x in result['part_failures']}):
        rows=[x for x in result['part_failures'] if x['part']==part]
        first=rows[0]
        first['component_coefficient_k']=coef(components[[n for n,_ in components].index(part)][1],first['k'])
        first['component_coefficient_k1']=coef(components[[n for n,_ in components].index(part)][1],first['k']+1)
        first['C_k']=coef(C,first['k'])
        first['C_km1']=coef(C,first['k']-1)
        result['part_failure_summary'][part]={'count':len(rows),'first':first}
    result.pop('part_failures')
    result['guarded_k_checked']=((N+2)//2)
    return result

def graph_crosscheck():
    w=json.loads((ROOT/'sources/cycle4/FUTURE-shifted-ratio-literal-witness.json').read_text())
    adj={i:set() for i in range(w['n'])}
    for u,v in w['edges']: adj[u].add(v); adj[v].add(u)
    parent=tree_poly(adj,0)
    deleted=tree_poly(adj,0,forbidden=w['deleted_original_tip'])
    N=w['N']; L=[1,1]; G=[1,2]
    Q=[1]
    for r,c in zip((2,3,4),w['counts']):
        B=add(power(L,r),[0,1])
        for _ in range(c): Q=mul(Q,B)
    H=[1]
    for r,c in zip((2,3,4),w['counts']):
        B=add(power(L,r),[0,1])
        for _ in range(c-(1 if r==4 else 0)): H=mul(H,B)
    A=add(mul(mul(G,add(power(L,3),[0,1])),H),shift(power(L,N)))
    C=mul(G,Q); P=add(C,shift(power(L,N+1)))
    k=w['comparison_rank']
    return {
       'tree_parent_matches_formula': parent==P,
       'tree_tip_deletion_matches_formula': deleted==A,
       'target_row': {'n':w['n'],'alpha':w['alpha'],'x':w['x'],'k':k,'2k_le_N_plus2':2*k<=N+2,
          'Ck':coef(C,k),'Ckm1':coef(C,k-1),'Ak':coef(A,k),'Ak1':coef(A,k+1),
          'signed_margin':coef(A,k)*coef(C,k)-coef(A,k+1)*coef(C,k-1)},
       'independent_tree_degree':len(parent)-1
    }

def main():
    profiles=[[0,22,0],[0,0,39],[0,12,10],[1,1,30],[100,1,1],[38,0,1]]
    data={'profiles':[check_profile(c) for c in profiles], 'literal_graph':graph_crosscheck()}
    print(json.dumps(data,indent=2))

if __name__=='__main__': main()
