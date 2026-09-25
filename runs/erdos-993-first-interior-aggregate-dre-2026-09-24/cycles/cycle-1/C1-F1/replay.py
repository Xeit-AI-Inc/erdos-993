from ordinary_tree_copy import *
import json

def x_contract(poly):
    # Contract includes the zero-extension difference Delta_alpha=-1.
    for k in range(len(poly)):
        if delta(poly,k)<0: return k
    raise AssertionError('terminal descent missing')

def row(tree, p):
    poly=tree.forest_independence_polynomial(); alpha=len(poly)-1; x=x_contract(poly)
    favored=[]; summands=[]
    for v in tree.leaves():
        if delta(tree.remove({v}).forest_independence_polynomial(),p)<0:
            d=leaf_data(tree,v,p); favored.append(v); summands.append(d['g'])
    return {'order':len(tree.vertices),'alpha':alpha,'x':x,'p':p,'selector':favored,
            'summands':summands,'aggregate':sum(summands), 'target_eligible':x+2<=p and p==alpha-2}

cases=[]
for m, probe in ((22,34),(60,90)):
    t,_=t_family(m); poly=t.forest_independence_polynomial(); alpha=len(poly)-1
    cases.append({'family':'T_m','m':m,'target_alpha_minus_2':row(t,alpha-2),
                  'standing_fence_probe':row(t,probe)})
# Exact bounded labeled-tree sweep; no eligible target rows occurred through order 8.
counts=[]
for n in range(2,9):
    eligible=0
    for _,_,t in all_labeled_trees(n,n):
        poly=t.forest_independence_polynomial(); p=len(poly)-3; x=x_contract(poly)
        if x+2<=p: eligible+=1
    counts.append({'order':n,'labeled_trees':n**max(0,n-2),'eligible_alpha_minus_2':eligible})
print(json.dumps({'cases':cases,'labeled_sweep':counts},sort_keys=True))
