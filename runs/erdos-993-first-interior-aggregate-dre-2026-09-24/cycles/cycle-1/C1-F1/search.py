from ordinary_tree_copy import *
import json

def x_contract(poly):
    # Delta at alpha is -1 by zero extension, so inspect through alpha.
    for k in range(len(poly)):
        if delta(poly,k)<0: return k
    raise AssertionError('terminal descent missing')

def target(tree):
    poly=tree.forest_independence_polynomial()
    alpha=len(poly)-1; p=alpha-2; x=x_contract(poly)
    if x+2>p: return None
    vals=[]
    for v in tree.leaves():
        if delta(tree.remove({v}).forest_independence_polynomial(),p)<0:
            d=leaf_data(tree,v,p); vals.append(d)
    return {'order':len(tree.vertices),'alpha':alpha,'x':x,'p':p,'selector':[d['leaf'] for d in vals], 'summands':[d['g'] for d in vals], 'aggregate':sum(d['g'] for d in vals)}

best=None; eligible=0; positives=[]
for n in range(2,9):
    c=0
    for _,_,t in all_labeled_trees(n,n):
        z=target(t)
        if z is not None:
            eligible+=1;c+=1
            if best is None or z['aggregate']>best['aggregate']:best=z
            if z['aggregate']>0: positives.append(z|{'edges':sorted([sorted([v,w]) for v in t.vertices for w in t.adjacency[v] if v<w])})
    print(json.dumps({'order':n,'eligible_labeled':c}))
print(json.dumps({'total_eligible_labeled':eligible,'maximum':best,'positive_witnesses':positives[:3]}))
for m in (22,60):
    t,_=t_family(m); z=target(t)
    print(json.dumps({'family':'T_m','m':m,**(z or {'eligible':False})}))
