import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).parent))
import ordinary_tree_copy as ot

def contract_x(poly):
    # Integer zero extension: inspect through terminal k=alpha.
    alpha=len(poly)-1
    for k in range(alpha+1):
        if ot.delta(poly,k)<0: return k
    raise AssertionError('terminal extension must descend')

rows=[]
for m in (75,100,150):
    T, marked=ot.t_family(m)
    c=T.forest_independence_polynomial()
    alpha=len(c)-1; p=alpha-2; x=contract_x(c)
    row=ot.aggregate_row(T,p)
    rows.append({'family':'T_m','m':m,'order':len(T.vertices),'alpha':alpha,'x_zero_extended':x,'p_alpha_minus_2':p,'eligible':x+2<=p,'favorable_leaves':row['favorable_count'],'complete_aggregate':row['aggregate'],'summand_min':min((e['g'] for e in row['summands']),default=None),'summand_max':max((e['g'] for e in row['summands']),default=None)})
Path(__file__).with_name('fresh_family_results.json').write_text(json.dumps(rows,indent=2)+'\n')
print(json.dumps(rows,indent=2))
