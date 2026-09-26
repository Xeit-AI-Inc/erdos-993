from math import comb, ceil
from pathlib import Path
import json

ROOT = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25/scratchpad/C6-CF-U3')
OUT = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25/scratchpad/C6-CF-U3')

def conv(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return c

def factors(r,s,q):
    # F_r=((1+z)^(r-1)-1)/z; B_s=(1+z)^s+z.
    f=[comb(r-1,j+1) for j in range(r-1)]
    b=[comb(s,j) for j in range(s+1)]
    b[1]+=1
    a=f
    for _ in range(q): a=conv(a,b)
    return a

def least_order(a):
    n=len(a)-1
    d=n
    blockers=[]
    for j in range(1,n):
        left=j*a[j]*a[j]
        right=(j+1)*a[j-1]*a[j+1]
        gap=left-right
        if gap<=0:
            blockers.append({'index':j,'left':left,'right':right,'gap':gap})
        else:
            d=max(d,j+(right+gap-1)//gap)
    if blockers:
        return None, blockers[0], blockers
    # Direct exact check of normalized minors at the claimed d, with cross-products.
    checks=[]
    for j in range(1,n):
        lhs=j*a[j]*a[j]*(d-j)
        rhs=(j+1)*a[j-1]*a[j+1]*(d-j+1)
        checks.append(lhs>=rhs)
    assert all(checks)
    # Minimality follows because each positive gap imposes d >= j+ceil(right/gap).
    return d, None, []

rows=[]
for r in range(2,21):
    for s in range(2,21):
        qrows=[]
        for q in range(1,5):
            a=factors(r,s,q)
            d,blocker,all_blockers=least_order(a)
            qrows.append({'q':q,'degree':len(a)-1,'coefficients':a,
                          'least_finite_ulc_order':d,
                          'first_blocking_interior_index':None if blocker is None else blocker['index'],
                          'blocking_minor':blocker})
        finite=[x for x in qrows if x['least_finite_ulc_order'] is not None]
        first=min(finite,key=lambda x:x['q']) if finite else None
        rows.append({'r':r,'s':s,'tests':qrows,
                     'minimum_absorbed_count':None if first is None else first['q'],
                     'minimum_order_at_that_count':None if first is None else first['least_finite_ulc_order']})

# Recompute the published 2..12, one-absorbed-factor certificate independently.
pin=json.loads((ROOT/'pinned_121_factor_rows.json').read_text())
pinned={(x['r'],x['s']):(x['coefficients'],x['finite_ULC_order']) for x in pin['rows']}
independent={(x['r'],x['s']):(x['tests'][0]['coefficients'],x['tests'][0]['least_finite_ulc_order']) for x in rows if x['r']<=12 and x['s']<=12}
assert len(pinned)==121 and pinned==independent

summary={
 'scope':'F_r B_s^q, 2<=r,s<=20, q=1,2,3,4; exact integer coefficient arithmetic',
 'definitions':{'F_r':'((1+z)^(r-1)-1)/z','B_s':'(1+z)^s+z'},
 'finite_ulc_test':'For each 1<=j<degree, A_j=j*a_j^2-(j+1)*a_(j-1)*a_(j+1). A finite order exists iff every A_j>0. The least d is max(degree, max_j(j+ceil((j+1)*a_(j-1)*a_(j+1)/A_j))).',
 'tested_pairs':len(rows),'polynomial_tests':sum(len(x['tests']) for x in rows),
 'no_finite_order':sum(t['least_finite_ulc_order'] is None for x in rows for t in x['tests']),
 'one_absorption_finite_count':sum(x['tests'][0]['least_finite_ulc_order'] is not None for x in rows),
 'minimum_q_distribution':{str(q):sum(x['minimum_absorbed_count']==q for x in rows) for q in range(1,5)},
 'no_recovery_through_four':sum(x['minimum_absorbed_count'] is None for x in rows),
 'max_least_order_by_q':{str(q):max(t['least_finite_ulc_order'] for x in rows for t in x['tests'] if t['q']==q and t['least_finite_ulc_order'] is not None) for q in range(1,5)},
 'independent_match_to_pinned_121_pairs':True,
 'rows':rows
}
(OUT/'ABSORPTION-CENSUS.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps({k:v for k,v in summary.items() if k!='rows'},indent=2))
for x in rows:
    if x['minimum_absorbed_count'] is None:
        print('NO_RECOVERY',x['r'],x['s'],[(t['q'],t['first_blocking_interior_index']) for t in x['tests']])
