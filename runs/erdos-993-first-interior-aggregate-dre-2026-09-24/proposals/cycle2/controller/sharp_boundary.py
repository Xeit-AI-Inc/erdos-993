from ordinary_tree import *
from pathlib import Path
import json
rows=[]
for m in [3,4,5,6,10,100]:
 edges=[(0,1),(1,2),(2,3)]+[(3,4+2*j)for j in range(m)]+[(4+2*j,5+2*j)for j in range(m)]
 T=Graph.from_edges(range(4+2*m),edges);a=T.forest_independence_polynomial();alpha=len(a)-1;p=alpha-2;x=next(k for k in range(alpha+1)if delta(a,k)<0)
 row=aggregate_row(T,p);row['first_strict_descent']=x
 marked=leaf_data(T,0,p)
 rows.append({'m':m,'edges':edges,'eligible':x+2<=p,'marked':marked,'row':row})
Path(__file__).with_suffix('.json').write_text(json.dumps(rows,indent=2,sort_keys=True)+'\n')
print(json.dumps([{'m':r['m'],'alpha':r['row']['alpha'],'p':r['row']['rank'],'x':r['row']['first_strict_descent'],'eligible':r['eligible'],'marked_g':r['marked']['g'],'aggregate':r['row']['aggregate']}for r in rows]))
