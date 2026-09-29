from fractions import Fraction
from math import comb
from pathlib import Path
import json
b=lambda r:[comb(r,j)+int(j==1)for j in range(r+1)]
rows=[]
for r in [2,3,4]:
 a=b(r-1)+[0];c=b(r);ratios=[Fraction(x,y)for x,y in zip(a,c)];assert all(x>=y for x,y in zip(ratios,ratios[1:]))
 minors=[{'u':u,'v':v,'minor':a[u]*c[v]-a[v]*c[u]}for u in range(r+1)for v in range(u+1,r+1)]
 assert all(x['minor']>=0 for x in minors)
 rows.append({'r':r,'correct_numerator_B_r_minus_1':a,'denominator_B_r':c,'ratios':[str(x)for x in ratios],'ordered_minors':minors})
out={'status':'exact local finite checks; universal profile conversion uses separately justified convolution and ULC','pair':'B_(r-1),B_r; not F_r,B_r','ordered_minors_checked':sum(len(x['ordered_minors'])for x in rows),'rows':rows}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
