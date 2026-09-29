"""Independent direct-convolution spot audit of sealed C6-U2 certificate."""
import json
from math import comb
from pathlib import Path

def mul(a,b):
    o=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): o[i+j]+=x*y
    return o

def power(a,n):
    o=[1]
    for _ in range(n): o=mul(o,a)
    return o

def add(a,b):
    o=[0]*max(len(a),len(b))
    for i,x in enumerate(a):o[i]+=x
    for i,x in enumerate(b):o[i]+=x
    return o

def B(r): return add(power([1,1],r),[0,1])
def poly_C(a):
    q=[1]
    for r in (2,3,4): q=mul(q,power(B(r),a[r-2]))
    return mul([1,2],q)
def poly_U(a,r):
    q=[1]
    for s in (2,3,4): q=mul(q,power(B(s),a[s-2]-(s==r)))
    return mul(mul([1,2],B(r-1)),q)
def at(a,k): return a[k] if 0<=k<len(a) else 0
def surplus(a,r,k):
    a2,a3,a4=a; N=2*a2+3*a3+4*a4; h=1+2*a2+4*a3+7*a4
    Cc=poly_C(a); U=poly_U(a,r); E=[0]+[comb(N,j) for j in range(N+1)]
    return (h+1)*at(U,k)*at(Cc,k)+(k+1)*(h-k+1)*(at(E,k)*at(Cc,k)-at(E,k+1)*at(Cc,k-1)), (Cc,U,E)

root=Path(__file__).parent
res=json.loads((root/'input-copy/final-run-1-99/RESULT.json').read_text())
expected=json.loads((root/'input-copy/EXPECTED.json').read_text())
assert len(res['rows'])==99
# Re-enumerate geometric coverage from triples and represented arities; no table formula imported.
counts=[]
for m in range(1,100):
    prof=rows=0
    for a2 in range(m+1):
      for a3 in range(m-a2+1):
        a4=m-a2-a3; prof+=1
        N=2*a2+3*a3+4*a4; guard=(N+2)//2
        rows+=sum(guard for r,a in zip((2,3,4),(a2,a3,a4)) if a)
    want=expected['layers'][m-1]
    assert prof==want['profiles'] and rows==want['represented_tip_rank_tests']
    assert res['rows'][m-1]['profile_count']==prof and res['rows'][m-1]['represented_type_rank_tests']==rows
    counts.append([m,prof,rows])
# Rebuild every reported per-m attaining witness from explicit monomial coefficients.
attainers=[]
for row in res['rows']:
    w=row['minimum_witness']; a=tuple(w['profile']); val, polys=surplus(a,w['r'],w['k']); Cc,U,E=polys
    assert val==int(row['minimum_signed_surplus'])==int(w['surplus'])
    assert [at(Cc,w['k']),at(Cc,w['k']-1),at(U,w['k']),at(E,w['k']),at(E,w['k']+1)] == [int(w[x]) for x in ('C_k','C_km1','U_k','E_k','E_kp1')]
    assert 1<=w['k']<=(2*(a[0]+a[1]+a[2])+2)//2
    attainers.append({'m':row['m'],'profile':a,'r':w['r'],'k':w['k'],'surplus':str(val)})
# Exact protocol controls by direct arrays.
small, _=surplus((1,0,0),2,1); assert small==98
n91=(0,22,0); Cc=poly_C(n91); U=poly_U(n91,3); N=66; E=[0]+[comb(N,j) for j in range(N+1)]
eonly=at(E,27)*at(Cc,27)-at(E,28)*at(Cc,26)
full=(at(U,27)+at(E,27))*at(Cc,27)-(at(U,28)+at(E,28))*at(Cc,26)
assert eonly==-518620474811633289768751398606375936
assert full==777419068009671422357461955841645743808
n122=(38,0,1); Cc=poly_C(n122); U=poly_U(n122,4); N=80; E=[0]+[comb(N,j) for j in range(N+1)]
full122=(at(U,77)+at(E,77))*at(Cc,77)-(at(U,78)+at(E,78))*at(Cc,76)
assert full122==-49239834336 and 2*77>N+2 and 77>(N+2)//2
out={'independent_method':'direct integer monomial convolution (not Kronecker packing)',
     'coverage_layers_recounted':len(counts),'profiles':sum(x[1] for x in counts),'rows':sum(x[2] for x in counts),
     'all_99_reported_minimum_witnesses_recomputed':len(attainers),'global_minimum_of_recorded_layer_minima':str(min(int(r['minimum_signed_surplus']) for r in res['rows'])),
     'controls':{'m1_r2_k1_surplus':str(small),'n91_E_minor':str(eonly),'n91_full_tip_minor':str(full),'n122_full_tip_minor':str(full122),'n122_outside_guard':True},
     'caveat':'Does not re-evaluate every one of the 56,245,000 certificate rows; full-row nonnegativity remains bounded evidence from the frozen run, with source and counts independently checked.'}
(root/'independent-replay.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
