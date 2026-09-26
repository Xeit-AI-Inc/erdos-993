#!/usr/bin/env python3
"""Exact bounded F6 check for six-center rooted trees at n=2p+4.

The primary computation uses closed polynomial products for the specified
family. Selected rows are independently reconstructed with ordinary_tree_checked.py.
"""
from itertools import product
from math import comb
import importlib.util
import json
import sys
from pathlib import Path

B = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25')
EVAL_PATH = B / 'inputs/ordinary_tree_checked.py'
spec = importlib.util.spec_from_file_location('ordinary_tree_checked', EVAL_PATH)
ev = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = ev
spec.loader.exec_module(ev)

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
        if x:
            for j,y in enumerate(b):
                if y: c[i+j]+=x*y
    return trim(c)

def binpoly(m): return [comb(m,j) for j in range(m+1)]
def delta(a,r): return (a[r+1] if 0<=r+1<len(a) else 0)-(a[r] if 0<=r<len(a) else 0)
def composition(total, k=6, prefix=()):
    if k==1:
        yield prefix+(total,)
    else:
        for x in range(0,total+1):
            yield from composition(total-x,k-1,prefix+(x,))

def row(ls,p):
    L=sum(ls)
    bs=[add(binpoly(l),[0,1]) for l in ls]  # (1+z)^l + z
    P0=[1]
    for b in bs: P0=mul(P0,b)
    P=add(P0,[0]+binpoly(L)) # root included term z(1+z)^L
    alpha=len(P)-1
    x=next((r for r in range(len(P)) if delta(P,r)<0),None)
    if x is None:
        return {'eligible':False,'x':None,'alpha':alpha,'order':2*p+4}
    if x+2>p:
        return {'eligible':False,'x':x,'alpha':alpha,'order':2*p+4,'failure':'first_descent_guard'}
    if 3*p>=2*alpha+1:
        return {'eligible':False,'x':x,'alpha':alpha,'order':2*p+4,'failure':'strict_region_guard'}
    terms=[]; pointwise=[]
    for j,l in enumerate(ls):
        other=[1]
        for h,b in enumerate(bs):
            if h!=j: other=mul(other,b)
        if l>0:
            bminus=add(binpoly(l-1),[0,1])
            Pv=add(mul(other,bminus),[0]+binpoly(L-1))
            d=delta(Pv,p)
            H=mul(binpoly(l-1), add(other,[0]+binpoly(L-l)))
            R=other
            mult=l; vertex_type='private_leaf'
        else:
            # The center itself is an original leaf adjacent only to the root.
            Pv=add(other,[0]+binpoly(L))
            d=delta(Pv,p)
            H=other
            R=binpoly(L)
            mult=1; vertex_type='center_leaf'
        pointwise.append(d)
        g=delta(H,p-1)-delta(R,p-1)
        terms.append({'branch':j,'vertex_type':vertex_type,'leaf_multiplicity':mult,
                      'delta_p_T_minus_leaf':d,'g':g,'branch_contribution':mult*g if d<0 else 0})
    S=sum(t['branch_contribution'] for t in terms)
    return {'p':p,'order':2*p+4,'branch_leaf_counts':list(ls),'alpha':alpha,'x':x,
            'eligible':True,'original_leaf_count':sum(l if l>0 else 1 for l in ls),
            'favorable_branch_count':sum(1 for d in pointwise if d<0),
            'favorable_leaf_count':sum(t['leaf_multiplicity'] for t in terms if t['delta_p_T_minus_leaf']<0),
            'pointwise_delta_min':min(pointwise),'pointwise_delta_max':max(pointwise),
            'positive_pointwise_branch_count':sum(d>0 for d in pointwise),
            'zero_pointwise_branch_count':sum(d==0 for d in pointwise),
            'negative_pointwise_branch_count':sum(d<0 for d in pointwise),
            'summands':terms,'aggregate':S,'tree_polynomial':P}

def graph_for(ls):
    edges=[]; root=0; centers=range(1,7); v=7
    for j,c in enumerate(centers):
        edges.append((root,c))
        for _ in range(ls[j]): edges.append((c,v)); v+=1
    return ev.Graph.from_edges(range(v),edges)

results=[]; eligible_rows=[]; checked=[]
for p in range(10,14):
    count=0; elig=0; pos=0; allneg=0; minpoint=None; maxpoint=None; minS=None; maxS=None; minrow=None; maxrow=None; minptrow=None; maxptrow=None; x_hist={}; failures={}
    for ls in composition(2*p-3):
        count+=1
        r=row(ls,p)
        x_hist[str(r['x'])]=x_hist.get(str(r['x']),0)+1
        if not r['eligible']:
            failures[r.get('failure','no_strict_descent')]=failures.get(r.get('failure','no_strict_descent'),0)+1
            continue
        elig+=1; eligible_rows.append(r)
        if r['positive_pointwise_branch_count']: pos+=1
        if r['positive_pointwise_branch_count']==0: allneg+=1
        for t in r['summands']:
            d=t['delta_p_T_minus_leaf']
            if minpoint is None or d<minpoint: minpoint=d; minptrow=r
            if maxpoint is None or d>maxpoint: maxpoint=d; maxptrow=r
        if minS is None or r['aggregate']<minS: minS=r['aggregate']; minrow=r
        if maxS is None or r['aggregate']>maxS: maxS=r['aggregate']; maxrow=r
    results.append({'p':p,'order':2*p+4,'positive_six_part_compositions':count,'eligible_compositions':elig,
                    'eligible_rows_with_positive_pointwise_term':pos,'eligible_rows_all_pointwise_terms_nonpositive':allneg,'first_descent_histogram_over_all_compositions':x_hist,'ineligibility_counts':failures,
                    'minimum_pointwise_delta':minpoint,'minimum_pointwise_witness':minptrow,
                    'maximum_pointwise_delta':maxpoint,'maximum_pointwise_witness':maxptrow,
                    'minimum_full_aggregate':minS,'minimum_aggregate_witness':minrow,
                    'maximum_full_aggregate':maxS,'maximum_aggregate_witness':maxrow})
    # Independent evaluator check on a balanced row, plus the recorded p=10 obstruction branch tuple.
    checks=[tuple([((2*p-3)//6 + (i < ((2*p-3)%6))) for i in range(6)])]
    if p==10: checks.append((3,3,3,3,3,2))
    for ls in checks:
        if sum(ls)!=2*p-3: continue
        expected=row(ls,p)
        if not expected['eligible']: continue
        G=graph_for(ls)
        got=ev.aggregate_row(G,p)
        assert G.forest_independence_polynomial()==expected['tree_polynomial']
        assert got['first_strict_descent']==expected['x']
        assert got['aggregate']==expected['aggregate']
        assert len(got['favorable_leaves'])==expected['favorable_leaf_count']
        for branch, td in enumerate(expected['summands']):
            if td['delta_p_T_minus_leaf'] < 0:
                leaf=(1+branch) if td['vertex_type']=='center_leaf' else 7+sum(ls[:branch])
                gd=ev.leaf_data(G,leaf,p)
                assert td['g']==gd['g']
        checked.append({'p':p,'branch_leaf_counts':list(ls),'polynomial_match':True,'x_match':True,'selector_count_match':True,'all_selected_terms_match':True,'aggregate_match':True})

out={'scope':{'family':'root 0 joined to six centers 1..6, with l_i>=0 private leaves at center i','order':'n=2p+4, p in {10,11,12,13}','composition_boundary':'all ordered nonnegative 6-part compositions of 2p-3','cover_bound':'the six centers form a vertex cover','eligibility':'x+2<=p and 3p<2alpha+1, with x first strict descent of zero-extended polynomial'},
     'method':'Exact integer polynomial identities: P=prod_i((1+z)^l_i+z)+z(1+z)^L; per-leaf-deleted polynomial and H,R factors computed directly. Selected leaves reconstructed from Delta_p(T-v)<0. No random sampling.',
     'independent_cross_checks':'ordinary_tree_checked.py forest DP on balanced tuple for each p and the supplied (3,3,3,3,3,2) p=10 row; exact full polynomial, x, selector size, every selected term and S compared.',
     'enumeration':results,'independent_checks':checked,'generation_count_total':sum(z['positive_six_part_compositions'] for z in results)}
Path('RESULTS.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps([{'p':z['p'],'compositions':z['positive_six_part_compositions'],'eligible':z['eligible_compositions'],'positive_pointwise_rows':z['eligible_rows_with_positive_pointwise_term'],'all_nonpositive_rows':z['eligible_rows_all_pointwise_terms_nonpositive'],'min_delta':z['minimum_pointwise_delta'],'max_delta':z['maximum_pointwise_delta'],'min_S':z['minimum_full_aggregate'],'max_S':z['maximum_full_aggregate']} for z in results],indent=2))
print('independent checks:',len(checked))
