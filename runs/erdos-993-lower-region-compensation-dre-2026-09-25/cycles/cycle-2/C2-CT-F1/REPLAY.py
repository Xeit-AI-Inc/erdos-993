"""Bounded exact p=7, order-16 shell census for worker C2-F1."""
from pathlib import Path
import sys, json, hashlib

B = Path(__file__).resolve().parent
sys.path.insert(0, str(B))
import ordinary_tree_checked as O
import forest24 as F

def graph(code):
    edges=[]; cursor=0
    def parse(s, at, parent=None):
        nonlocal cursor
        assert s[at]=='('
        u=cursor; cursor+=1; at+=1
        if parent is not None: edges.append((parent,u))
        while s[at]!=')': _,at=parse(s,at,u)
        return u,at+1
    if code.startswith('U:'):
        s=code[2:]; _,end=parse(s,0); assert end==len(s)
    else:
        a,b=code[2:].split('|'); u,end=parse(a,0); assert end==len(a)
        _,end=parse(b,0,u); assert end==len(b)
    return O.Graph.from_edges(range(cursor),edges)

def subset_replay(T, p, poly, x):
    n=len(T.vertices); adj=[sum(1<<w for w in T.adjacency[v]) for v in range(n)]
    allmask=(1<<n)-1; leaves=T.leaves(); needed={allmask}
    for v in leaves:
        s=T.support(v)
        needed.update((allmask^(1<<v), allmask&~((1<<v)|(1<<s)), allmask&~((1<<s)|adj[s])))
    counts={mask:[0]*(n+1) for mask in needed}
    independent=[True]*(1<<n)
    for mask in range(1<<n):
        if mask:
            bit=mask&-mask; v=bit.bit_length()-1; rest=mask^bit
            independent[mask]=independent[rest] and not(adj[v]&rest)
        if independent[mask]:
            k=mask.bit_count()
            for universe,c in counts.items():
                if not(mask&~universe): c[k]+=1
    assert O.trim(counts[allmask])==poly
    leaf_checks=[]; terms=[]; total=0
    for v in leaves:
        s=T.support(v); dv=O.delta(counts[allmask^(1<<v)],p)
        selected=dv<0; term=None
        if selected:
            H=counts[allmask&~((1<<v)|(1<<s))]
            Q=counts[allmask&~((1<<s)|adj[s])]
            term=O.delta(H,p-1)-O.delta(Q,p-1); total+=term
            terms.append({'leaf':v,'support':s,'delta_p_T_minus_v':dv,'delta_p_minus_1_H':O.delta(H,p-1),'delta_p_minus_1_R':O.delta(Q,p-1),'summand':term})
        leaf_checks.append({'leaf':v,'support':s,'delta_p_T_minus_v':dv,'selected':selected})
    assert total==sum(t['summand'] for t in terms)
    return leaf_checks,terms,total

def main():
    rows=[]; codes=set(); eligible_count=0; max_x=None
    R=F.rooted(8)
    def take(packed,code):
        assert code and code not in codes
        codes.add(code)
        T=graph(code); assert len(T.vertices)==16
        poly=T.forest_independence_polynomial()
        assert poly[:F.DIGITS]==F.coeffs(packed)
        a=len(poly)-1; x=O.first_strict_descent(poly); p=7
        assert x is not None # terminal zero extension gives strict descent at alpha
        if not (x+2<=p and 3*p<2*a+1): return False
        nonlocal eligible_count,max_x
        eligible_count+=1; max_x=x if max_x is None else max(max_x,x)
        selectors=[{'leaf':v,'support':T.support(v),'delta_p_T_minus_v':O.delta(T.remove({v}).forest_independence_polynomial(),p)} for v in T.leaves()]
        row=O.aggregate_row(T,p)
        assert row['favorable_leaves']==[z['leaf'] for z in selectors if z['delta_p_T_minus_v']<0]
        leaf_checks,terms,total=subset_replay(T,p,poly,x)
        assert leaf_checks==[{'leaf':z['leaf'],'support':z['support'],'delta_p_T_minus_v':z['delta_p_T_minus_v'],'selected':z['delta_p_T_minus_v']<0} for z in selectors]
        by_leaf={z['leaf']:z for z in terms}
        for s in row['summands']:
            t=by_leaf[s['leaf']]
            assert t['summand']==s['g']
            assert t['delta_p_minus_1_H']-t['delta_p_minus_1_R']==s['g']
        assert total==row['aggregate']
        rows.append({'centroid_code':code,'order':16,'p':p,'alpha':a,'first_strict_descent_x':x,'independence_polynomial':poly,'terminal_delta_alpha':-poly[a],'selector_values':selectors,'favorable_leaves':[z['leaf'] for z in selectors if z['delta_p_T_minus_v']<0],'summands':terms,'S':total,'subset_replay':'exact over all 2^16 vertex subsets'})
        return False
    F.visit_trees(16,R,take,codes_all=True)
    assert len(codes)==F.TREE_COUNTS[16]==19320
    result={'scope':'all unlabeled ordinary trees of order 16 at p=7, satisfying x+2<=7 and 21<2alpha+1','evidence_grade':'bounded_computation','formal_award':False,'generation':'pinned centroid generator forest24.rooted(8), visit_trees(16,...,codes_all=True); unique unlabeled classes checked by centroid codes; expected free-tree class count from pinned generator is 19320','source_sha256':{'inputs/ordinary_tree_checked.py':'a012bb78915ccdfa2f729c0cdb520cd8f29572277123c92e80ba6091498f533d','instruments/p6-order14-15/forest24.py':'72fa4ee0ffee32a3e022e1467e8a24185f5f509ce968521df3285298d35fc836'},'class_count':len(codes),'eligible_count':eligible_count,'max_x_among_eligible':max_x,'eligible_rows':rows}
    out=Path(__file__).with_name('REPLAY-RESULT.json')
    out.write_text(json.dumps(result,sort_keys=True,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k!='eligible_rows'},sort_keys=True))

if __name__=='__main__': main()
