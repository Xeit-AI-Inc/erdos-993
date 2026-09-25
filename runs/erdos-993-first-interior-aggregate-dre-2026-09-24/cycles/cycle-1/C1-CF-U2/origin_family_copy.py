import json, sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).parent))
from ordinary_tree_copy import t_family, aggregate_row, delta

def strict_x(poly):
    # include all k=0..alpha, where terminal delta_alpha=-i_alpha<0
    for k in range(len(poly)):
        if delta(poly,k)<0: return k
    raise AssertionError('terminal extension must descend')
rows=[]
for m in list(range(1,41))+[50,60,80,100]:
    T,_=t_family(m)
    poly=T.forest_independence_polynomial()
    alpha=len(poly)-1; p=alpha-2; x=strict_x(poly)
    row=aggregate_row(T,p)
    rows.append({'m':m,'order':len(T.vertices),'alpha':alpha,'x':x,'p':p,'eligible':x+2<=p,'sum':row['aggregate'],'favorables':row['favorable_count'],'summands':row['summands'] if m<=2 else None})
print(json.dumps(rows,indent=2))
