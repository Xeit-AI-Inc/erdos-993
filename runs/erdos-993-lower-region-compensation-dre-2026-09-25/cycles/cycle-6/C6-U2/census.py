#!/Library/Frameworks/Python.framework/Versions/3.11/bin/python3
"""Exact recurrence census for heterogeneous arity-2..4 profiles, 1<=m<=40."""
from itertools import combinations_with_replacement
from pathlib import Path
import importlib.util, json, math, sys

ROOT=Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25')

def trim(a):
    while len(a)>1 and a[-1]==0: a.pop()
    return a

def add(a,b):
    c=[0]*max(len(a),len(b))
    for i,x in enumerate(a): c[i]+=x
    for i,x in enumerate(b): c[i]+=x
    return trim(c)

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return trim(c)

def scale(a,k): return [x*k for x in a]
def coeff(a,j): return a[j] if 0<=j<len(a) else 0
def delta(a,j): return coeff(a,j+1)-coeff(a,j)
def shift(a): return [0]+a

def power(a,n):
    out=[1]
    for _ in range(n): out=mul(out,a)
    return out

L=[1,1]
B={r:add(power(L,r),[0,1]) for r in (2,3,4)}
B[1]=add(L,[0,1])
F={2:[1],3:[2,1],4:[3,3,1]}

def profile_polys(rs):
    m=len(rs); N=sum(rs)
    Q=[1]
    for r in rs: Q=mul(Q,B[r])
    LN=power(L,N)
    P=add(mul([1,2],Q),shift(power(L,N+1)))
    A0=add(mul(L,Q),shift(LN))
    As={}; Zs={}; Zdist={}; Ws={}
    for r in sorted(set(rs)):
        H=[1]
        for s in rs:
            if s!=None: pass
        # omit one occurrence of arity r
        omitted=False
        for s in rs:
            if s==r and not omitted: omitted=True; continue
            H=mul(H,B[s])
        As[r]=add(mul(mul([1,2],B[r-1]),H),shift(LN))
        Zs[r]=add(mul(mul([1,2],F[r]),H),LN)
        # N times the handoff's endpoint-redistributed marked polynomial.
        Zdist[r]=add(scale(mul(mul([1,2],F[r]),H),N),scale(LN,N+1))
        # H_v-R_v = z Z_v, so this is each private leaf summand polynomial
        Ws[r]=Zs[r]
    return N,Q,P,A0,As,Zs,Zdist,Ws,LN

counts={'profiles':0,'eligible_profile_ranks':0,'nonempty_selector_rows':0,'positive_full_sums':0,'zero_full_sums':0,'negative_full_sums':0,'selected_leaf_tags':0}
by_m={str(m):{'profiles':0,'eligible_rows':0,'nonempty_rows':0,'positive':0,'zero':0,'negative':0} for m in range(1,41)}
positive=[]; selector_summary={'endpoint_selected':0,'private_leaf_tags_selected':0,'eligible_ranks':0}
central={'interval_profile_margin_checks':0,'lc_failures':0,'lc_failures_at_eligible_descent':0,'lc_failures_profile_records':[]}
central_margins_seen=set()
graph_checks=[]
# profiles generated as canonical sorted tuples
sample_specs={1:(2,),2:(2,2),3:(2,3,4),10:(2,)*10,20:(4,)*20,40:(2,)*14+(3,)*13+(4,)*13}
spec_values={}
for m in range(1,41):
    for rs in combinations_with_replacement((2,3,4),m):
        N,Q,P,A0,As,Zs,Zdist,Ws,LN=profile_polys(rs)
        a=N+2
        # first strict descent, including the terminal zero extension rank deg
        x=next((j for j in range(len(P)) if delta(P,j)<0),None)
        assert x is not None
        pmax=(2*a)//3
        eligible=range(x+2,pmax+1) if x+2<=pmax else ()
        count_prof=0
        for p in eligible:
            counts['eligible_profile_ranks']+=1; by_m[str(m)]['eligible_rows']+=1; selector_summary['eligible_ranks']+=1
            selected=[]
            if delta(A0,p)<0: selected.append(('endpoint',1,LN))
            for r in sorted(set(rs)):
                if delta(As[r],p)<0:
                    mult=rs.count(r)*r
                    selected.append(('arity'+str(r),mult,Zs[r]))
            if selected:
                counts['nonempty_selector_rows']+=1; by_m[str(m)]['nonempty_rows']+=1
            S=0; tag_ct=0
            per=[]
            for name,mult,Z in selected:
                term=coeff(Z,p-1)-coeff(Z,p-2)
                S+=mult*term; tag_ct+=mult
                per.append({'tag_type':name,'multiplicity':mult,'per_leaf_term':str(term)})
            counts['selected_leaf_tags']+=tag_ct
            if S>0:
                outcome='positive'; counts['positive_full_sums']+=1; by_m[str(m)]['positive']+=1
                positive.append({'profile':list(rs),'N':N,'alpha':a,'x':x,'p':p,'selected':per,'S':str(S)})
            elif S==0:
                outcome='zero'; counts['zero_full_sums']+=1; by_m[str(m)]['zero']+=1
            else:
                outcome='negative'; counts['negative_full_sums']+=1; by_m[str(m)]['negative']+=1
            if delta(A0,p)<0: selector_summary['endpoint_selected']+=1
            selector_summary['private_leaf_tags_selected']+=sum(rs.count(r)*r for r in As if delta(As[r],p)<0)
            count_prof+=1
        counts['profiles']+=1; by_m[str(m)]['profiles']+=1
        # Inspect the exact central LC margins used by the candidate proof.
        # The central interval is ceil(N/4)..floor(2N/3+3), integer ranks.
        lo=(N+3)//4; hi=(2*N)//3+3
        polys=[('P',P),('A0',A0)]+[(f'A{r}',As[r]) for r in sorted(As)]+[(f'Z{r}',Zs[r]) for r in sorted(Zs)]+[(f'N*Zdist{r}',Zdist[r]) for r in sorted(Zdist)]
        bad_here=[]
        for nm,poly in polys:
            for j in range(max(1,lo),min(hi,len(poly)-1)+1):
                central['interval_profile_margin_checks']+=1
                margin=coeff(poly,j)**2-coeff(poly,j-1)*coeff(poly,j+1)
                if margin<0:
                    central['lc_failures']+=1; bad_here.append({'poly':nm,'j':j,'margin':str(margin)})
                    if x is not None and j==x: central['lc_failures_at_eligible_descent']+=1
        if bad_here and len(central['lc_failures_profile_records'])<100:
            central['lc_failures_profile_records'].append({'profile':list(rs),'x':x,'eligible_p':list(eligible),'failures':bad_here})
        # Six fixed graph checks compare profile recurrences, selector deletions, and tagged terms.
        if m in sample_specs and rs==sample_specs[m]:
            spec_values[m]=(rs,N,P,A0,As,Zs,Zdist)

# Load the pinned exact graph evaluator and independently check selected profiles.
spec=importlib.util.spec_from_file_location('ordinary_tree_checked',ROOT/'inputs/ordinary_tree_checked.py')
mod=importlib.util.module_from_spec(spec); sys.modules[spec.name]=mod; spec.loader.exec_module(mod)
for m,(rs,N,P,A0,As,Zs,Zdist) in sorted(spec_values.items()):
    # graph: path 0-1-2; each branch center adjacent to 0 with r private leaves
    edges=[(0,1),(1,2)]; labels=[]; cursor=3
    for i,r in enumerate(rs):
        c=cursor; cursor+=1; leaves=list(range(cursor,cursor+r)); cursor+=r
        edges.append((0,c)); edges.extend((c,v) for v in leaves)
        labels.append((r,c,leaves))
    G=mod.Graph.from_edges(range(cursor),edges)
    checks=[]
    actual=G.forest_independence_polynomial(); checks.append(('P',actual,P))
    actual0=G.remove({2}).forest_independence_polynomial(); checks.append(('A0',actual0,A0))
    for r,c,leaves in labels:
        actual_del=G.remove({leaves[0]}).forest_independence_polynomial(); checks.append((f'A{r}',actual_del,As[r]))
        h=G.remove({leaves[0],c}).forest_independence_polynomial()
        rem=G.remove(G.closed_neighborhood({c})).forest_independence_polynomial()
        diff=add(h,scale(rem,-1))
        expected=shift(Zs[r])
        checks.append((f'zZ{r}',diff,expected))
    mismatches=[{'name':n,'actual':v,'recurrence':w} for n,v,w in checks if v!=w]
    graph_checks.append({'profile':list(rs),'order':cursor,'polynomial_comparisons':len(checks),'mismatches':mismatches})

out={
 'scope':{'family':'path 0-1-2 with m root-adjacent centers of arities r_i in {2,3,4}; unordered multisets; 1<=m<=40','profile_count_expected':12340,'profile_count_actual':counts['profiles'],'rank_guards':'x is first j with Delta_j(P)<0 under zero extension; x+2<=p and 3p<2 alpha+1, with alpha=N+2','exact_arithmetic':'Python arbitrary-precision integers'},
 'method':{'primary':'coefficient recurrences P=(1+2z)Q+zL^(N+1), A0=LQ+zL^N, Ar=(1+2z)L^(r-1)H_r+zL^N, Zr=(1+2z)F_r H_r+L^N','full_sum':'endpoint selected term Delta_(p-1)(z L^N); each private leaf of arity r contributes Delta_(p-1)(z Zr); selectors use Delta_p(A0), Delta_p(Ar)','graph_check_recipe':'independently construct path plus branches and compare tree-DP polynomials for P, endpoint deletion, private-leaf deletions, and each H_v-R_v against z Zr on six fixed profiles; pinned inputs/ordinary_tree_checked.py'},
 'counts':counts,'by_m':by_m,'selector_summary':selector_summary,
 'central_margins':central,'positive_full_sum_rows':positive,'graph_checks':graph_checks
}
path=ROOT/'scratchpad/C6-U2/EVIDENCE.json'; path.write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
print(json.dumps({'counts':counts,'selector_summary':selector_summary,'central_margins':{k:v for k,v in central.items() if k!='lc_failures_profile_records'},'positive_rows':len(positive),'graph_checks':[{k:v for k,v in c.items() if k!='mismatches'}|{'mismatch_count':len(c['mismatches'])} for c in graph_checks]},indent=2))
