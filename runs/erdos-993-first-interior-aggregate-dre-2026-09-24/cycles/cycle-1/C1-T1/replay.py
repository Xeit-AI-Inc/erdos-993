import sys, json
sys.path.insert(0, __file__.rsplit('/',1)[0])
from ordinary_tree import path_graph, t_family, delta, aggregate_row, first_strict_descent

def check(T,name):
    poly=T.forest_independence_polynomial(); alpha=len(poly)-1; p=alpha-2; x=first_strict_descent(poly)
    row=aggregate_row(T,p); rows=[]
    for v in T.leaves():
        s=T.support(v); H=T.remove({v,s}); R=T.remove(T.closed_neighborhood({s}))
        hp=H.forest_independence_polynomial(); rp=R.forest_independence_polynomial()
        a=delta(hp,p); b=delta(rp,p-1); c=delta(hp,p-1)
        selector=delta(T.remove({v}).forest_independence_polynomial(),p)
        assert selector == a+b
        if selector < 0: rows.append({'leaf':v,'support':s,'selector_delta':selector,'A':a,'B':b,'C':c,'summand':c-b})
    assert [r['leaf'] for r in rows] == row['favorable_leaves']
    assert sum(r['summand'] for r in rows) == row['aggregate']
    return {'name':name,'order':len(T.vertices),'alpha':alpha,'x':x,'p':p,'eligible':x+2<=p,
            'leaf_count':len(T.leaves()),'favorable_count':len(rows),
            'summand_value_counts':{str(k):sum(r['summand']==k for r in rows) for k in sorted(set(r['summand'] for r in rows))},
            'complete_aggregate':sum(r['summand'] for r in rows),'branch_selector_check':'pass','tag_sum_check':'pass'}
T,_=t_family(60)
print(json.dumps({'checks':[check(path_graph(60),'P60'),check(T,'T60')]},indent=2,sort_keys=True))
