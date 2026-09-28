from math import comb
from pathlib import Path
import json
def c(n,k):return comb(n,k)if 0<=k<=n else 0
m=40;N=4*m;j=78;delta=N+1-j;D=c(N,j+1)-c(N,j)
rows=[]
for d in [1,2,3]:
 U=sum(comb(m-1,h)*sum(c(N-4-4*h+s,j-h)+2*c(N-4-4*h+s,j-h-1)for s in range(3))for h in range(d+1))
 rows.append({'depth':d,'U':str(U),'margin':str(2*U-3*delta*D)})
o={'scope':'Controller independent exact correction of the U3 m40 alleged floor failure; coefficient sum in L powers, not the false monomial coefficient vector. No universal or formal award.','m':m,'N':N,'j':j,'delta':delta,'D':str(D),'rows':rows}
Path(__file__).with_suffix('.json').write_text(json.dumps(o,indent=2)+'\n')
assert all(int(r['margin'])>0 for r in rows)
