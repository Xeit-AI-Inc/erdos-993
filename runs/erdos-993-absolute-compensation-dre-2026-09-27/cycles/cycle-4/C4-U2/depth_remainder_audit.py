from math import comb
from fractions import Fraction
from pathlib import Path
import json

def C(n,k): return comb(n,k) if 0<=k<=n else 0
m=173; N=4*m; j=336; delta=357; b=N+1
# Polynomial G*F_4 = 3 + 9z + 7z^2 + 2z^3.
g=(3,9,7,2)
terms=[]
for a in range(m):
    term=comb(m-1,a)*sum(c*C(4*(m-1-a),j-s-a) for s,c in enumerate(g))
    terms.append(term)
T=sum(terms)
# Independent exact parent/deletion coefficients come from the copied literal replay.
rec=json.load(open('truncation_literal_check_independent.json'))
Cj=int(rec['Cj']); Cj1=int(rec['Cj1']); D=int(rec['D'])
K=delta*Cj-(delta-1)*Cj1
rhs=b*delta*D*Cj
cum=0; rows=[]; first=None
for d,t in enumerate(terms):
    cum+=t
    margin=K*N*cum-rhs
    if d in [0,1,2,4,8,16,24,32,48,64,80,96,112,128,144,160,172]:
        rows.append({'depth':d,'fraction':str(cum),'payment_margin':str(margin)})
    if margin>=0 and first is None: first=d
assert T==int(rec['Tj'])
assert sum(terms[:2])==int(rec['truncated_Tj'])
assert first is not None
out={'scope':'exact homogeneous-r4 center-subset depth audit at retained eligible witness; not a universal bound','profile':{'m':m,'N':N,'x':336,'p':338,'j':j,'delta':delta,'b':b,'all_original_leaf_flags_selected':True},'term_count':len(terms),'minimal_depth_sufficing_exact_payment':first,'depth_one_margin':str(K*N*sum(terms[:2])-rhs),'depth_one_payment_ratio':float(Fraction(K*N*sum(terms[:2]),rhs)),'depth_at_first_margin':str(K*N*sum(terms[:first+1])-rhs),'depth_at_first_payment_ratio':float(Fraction(K*N*sum(terms[:first+1]),rhs)),'full_margin':str(K*N*T-rhs),'selected_depth_rows':rows}
Path('depth_remainder_audit.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k not in ['selected_depth_rows']}))
print('rows',json.dumps(rows))
