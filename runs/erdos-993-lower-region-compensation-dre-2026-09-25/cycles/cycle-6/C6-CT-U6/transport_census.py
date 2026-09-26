#!/Library/Frameworks/Python.framework/Versions/3.11/bin/python3
"""Exact labeled-tree check of the fixed-selector marked-rank transport, n<=8."""
import json, sys
from pathlib import Path
B=Path(__file__).parent
sys.path.insert(0, str(B))
import ordinary_tree_checked as otc

counts={}
eligible_rows=0
nonempty_rows=0
positive=[]
min_row=None
max_row=None
independent_crosschecks=0
trees=[(1,0,otc.Graph.from_edges([0],[]))]
trees.extend(otc.all_labeled_trees(2,8))
for n,index,T in trees:
    P=T.forest_independence_polynomial()
    alpha=len(P)-1
    x=otc.first_strict_descent(P)
    assert x is not None
    # coefficient-level recurrence cross-check by subset enumeration for all n<=6,
    # and the first labeled trees at n=7,8.
    if n<=6 or (n>=7 and index==0):
        assert P==T.brute_independence_polynomial()
        independent_crosschecks += 1
    rows_n=counts.setdefault(str(n), {'labeled_trees':0,'eligible_tree_rank_rows':0,'nonempty_selector_rows':0})
    rows_n['labeled_trees'] += 1
    for p in range(x+2, alpha+1):
        if 3*p >= 2*alpha+1:
            continue
        eligible_rows+=1; rows_n['eligible_tree_rank_rows']+=1
        F=otc.favorable_leaves(T,p)
        if F:
            nonempty_rows+=1; rows_n['nonempty_selector_rows']+=1
        summands=[otc.leaf_data(T,v,p)['g'] for v in F]
        S=sum(summands)
        k=p-1
        Qlo=sum(otc.coefficient(T.remove({v,T.support(v)}).forest_independence_polynomial(),k)-
                otc.coefficient(T.remove(T.closed_neighborhood({T.support(v)})).forest_independence_polynomial(),k) for v in F)
        Qhi=sum(otc.coefficient(T.remove({v,T.support(v)}).forest_independence_polynomial(),p)-
                otc.coefficient(T.remove(T.closed_neighborhood({T.support(v)})).forest_independence_polynomial(),p) for v in F)
        assert S==Qhi-Qlo
        row={'n':n,'prufer_index':index,'edges':[list(e) for e in sorted({tuple(sorted((u,v))) for u in T.vertices for v in T.adjacency[u]}) if e[0]<e[1]],
             'alpha':alpha,'x':x,'p':p,'F':F,'summands':summands,'Q_p_minus_1':Qlo,'Q_p':Qhi,'S':S}
        if min_row is None or S<min_row['S']: min_row=row
        if max_row is None or S>max_row['S']: max_row=row
        if S>0: positive.append(row)
result={'scope':'singleton plus all labeled Prüfer trees of orders 2 through 8; every p satisfying x+2<=p and 3p<2alpha+1',
        'generation':'singleton graph directly; for each n=2,...,8 enumerate every sequence in {0,...,n-1}^{n-2} and decode by standard smallest-leaf Prüfer algorithm',
        'counts_by_order':counts,'eligible_tree_rank_rows':eligible_rows,'nonempty_selector_rows':nonempty_rows,
        'positive_full_sum_rows':positive,'minimum_S_row':min_row,'maximum_S_row':max_row,
        'subset_enumeration_crosschecks':independent_crosschecks,
        'identities_checked':'For every eligible row, direct selected leaf summands equal Q_p-Q_(p-1) computed from H_v and R_v; P coefficient vectors independently matched subset enumeration for every labeled tree through order 6 and first Prüfer tree at orders 7,8.'}
out=Path(__file__).with_name('transport_census.json')
out.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ['counts_by_order','eligible_tree_rank_rows','nonempty_selector_rows','positive_full_sum_rows','minimum_S_row','maximum_S_row','subset_enumeration_crosschecks']},indent=2))
