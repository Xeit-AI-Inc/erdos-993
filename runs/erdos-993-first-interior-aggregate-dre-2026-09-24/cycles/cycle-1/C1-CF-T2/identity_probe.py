import json
from pathlib import Path
from ordinary_tree import path_graph, t_family, coefficient, delta

HERE=Path(__file__).resolve().parent

def contract_x(poly):
    for k in range(len(poly)+1):
        if delta(poly,k)<0: return k
    raise AssertionError("contract terminal descent was not found")

def inspect(tree,label):
    poly=tree.forest_independence_polynomial(); alpha=len(poly)-1; p=alpha-2; x=contract_x(poly)
    rows=[]
    for v in tree.leaves():
        s=tree.support(v); H=tree.remove({v,s}); R=tree.remove(tree.closed_neighborhood({s}))
        hp=H.forest_independence_polynomial(); rp=R.forest_independence_polynomial()
        a=delta(tree.remove({v}).forest_independence_polynomial(),p)
        g=delta(hp,p-1)-delta(rp,p-1)
        rhs_a=delta(hp,p)+delta(rp,p-1)
        q=coefficient(hp,p+1)-coefficient(hp,p-1)
        rows.append((a,g,a==rhs_a,g==q-a))
    favored=[r for r in rows if r[0]<0]
    return dict(label=label,n=len(tree.vertices),alpha=alpha,x=x,p=p,eligible=x+2<=p,
                leaves=len(rows),favorable_count=len(favored),aggregate=sum(r[1] for r in favored),
                positive_favorable_summands=sum(r[1]>0 for r in favored),
                all_selector_identities=all(r[2] for r in rows),all_target_identities=all(r[3] for r in rows))

rows=[inspect(path_graph(501),"P_501")]
tree,marked=t_family(125)
r=inspect(tree,"T_125"); r['marked_leaf']=marked; rows.append(r)
(HERE/'large_constructed_summary.json').write_text(json.dumps(rows,indent=2,sort_keys=True)+'\n')
print(json.dumps(rows,indent=2,sort_keys=True))
