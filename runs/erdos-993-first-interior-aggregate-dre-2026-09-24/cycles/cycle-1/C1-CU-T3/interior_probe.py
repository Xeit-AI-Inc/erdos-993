"""Exact target-rank probes for the admitted T_m family; not a universal argument."""
import json
from ordinary_tree import t_family, aggregate_row, delta

def coeff(poly, k):
    return poly[k] if 0 <= k < len(poly) else 0

def first_descent(poly):
    alpha=len(poly)-1
    for k in range(alpha+1):
        if coeff(poly,k+1)-coeff(poly,k) < 0:
            return k
    raise AssertionError('terminal zero extension must descend')

out=[]
for m in (22,60,100):
    T, marked=t_family(m)
    poly=T.forest_independence_polynomial()
    alpha=len(poly)-1
    p=alpha-2
    x=first_descent(poly)
    row=aggregate_row(T,p)
    # Check the exact local deletion recurrence I(T-v)=I(H_v)+z I(R_v).
    selector_mismatches=[]
    for v in T.leaves():
        s=T.support(v)
        H=T.remove({v,s})
        R=T.remove(T.closed_neighborhood({s}))
        hp=H.forest_independence_polynomial()
        rp=R.forest_independence_polynomial()
        actual=delta(T.remove({v}).forest_independence_polynomial(),p)
        recurrence=delta(hp,p)+delta(rp,p-1)
        if actual != recurrence:
            selector_mismatches.append(v)
    # Since all leaves with one support are interchangeable, each fiber is all-in or all-out.
    fibers={}
    for e in row['summands']:
        f=fibers.setdefault(e['support'], {'multiplicity':0,'g':e['g'],'leaves':[]})
        f['multiplicity']+=1; f['leaves'].append(e['leaf'])
    selected_by_support={T.support(v) for v in row['favorable_leaves']}
    fiber_mismatches=[]
    for s in {T.support(v) for v in T.leaves()}:
        leaves={v for v in T.leaves() if T.support(v)==s}
        if bool(leaves & set(row['favorable_leaves'])) != (leaves <= set(row['favorable_leaves'])):
            fiber_mismatches.append(s)
    pos=[e for e in row['summands'] if e['g']>0]
    out.append({'m':m,'order':len(T.vertices),'alpha':alpha,'p':p,'x':x,'eligible':x+2<=p,
                'favorable_tags':row['favorable_count'],'aggregate':row['aggregate'],
                'positive_summands':len(pos),'max_summand':max((e['g'] for e in row['summands']),default=0),
                'fibers':len(fibers),'positive_fibers':sum(f['g']>0 for f in fibers.values()),
                'selector_recurrence_mismatches':selector_mismatches,
                'partial_favorable_fibers':fiber_mismatches,
                'marked_leaf_selected':marked in row['favorable_leaves'],
                'marked_leaf_g':next((e['g'] for e in row['summands'] if e['leaf']==marked),None)})
print(json.dumps(out,indent=2))
