from ordinary_tree_copy import *
import json

def x_contract(poly):
    for k in range(len(poly)):
        if delta(poly,k)<0: return k
    raise AssertionError

def compact(tree,p):
    poly=tree.forest_independence_polynomial(); alpha=len(poly)-1; x=x_contract(poly)
    entries=[]
    for v in tree.leaves():
        if delta(tree.remove({v}).forest_independence_polynomial(),p)<0:
            entries.append(leaf_data(tree,v,p))
    vals=[z['g'] for z in entries]
    from collections import Counter
    return {'order':len(tree.vertices),'alpha':alpha,'x':x,'rank':p,'eligible_target':p==alpha-2 and x+2<=p,
            'all_favorable_leaf_tags':len(tree.leaves())==len(entries),'favorable_leaf_count':len(entries),
            'summand_multiplicities':{str(k):v for k,v in sorted(Counter(vals).items())},
            'aggregate':sum(vals),'positive_summands':sum(v>0 for v in vals)}

out={'method':'Exact integer forest-DP on a byte-copy of admitted ordinary_tree.py; x computed through Delta_alpha=-1 zero extension; strict original-leaf selector and distinct leaf records.'}
for m, rank in ((22,66),(60,180)):
    t,_=t_family(m); out[f'T{m}_alpha_minus_2']=compact(t,rank)
for m, rank in ((22,34),(60,90)):
    t,_=t_family(m); out[f'T{m}_interior_fence']=compact(t,rank)
# Exact bounded labeled Prüfer sweep; all orders have zero target-eligible rows.
counts=[]
for n in range(2,9):
    eligible=0
    for _,_,t in all_labeled_trees(n,n):
        poly=t.forest_independence_polynomial(); p=len(poly)-3
        if x_contract(poly)+2<=p: eligible+=1
    counts.append({'order':n,'labeled_trees':n**(n-2),'eligible_target_rows':eligible})
out['bounded_labeled_sweep']=counts
print(json.dumps(out,sort_keys=True,indent=2))
