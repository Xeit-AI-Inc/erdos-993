"""Independent exact checks for the C6-F1 T_m cutoff candidate.
Uses integer coefficient recurrences, explicit candidate polynomials, and the
pinned ordinary_tree_checked graph evaluator for tiny graph cross-checks.
"""
from fractions import Fraction
from math import factorial
import hashlib, importlib.util, json, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent

def at(a,j): return a[j] if 0 <= j < len(a) else 0

def bpower(m):
    # B=1+4z+3z^2+z^3; B(B^m)'=mB'B^m.
    c=[1]+[0]*(3*m)
    for j in range(1,3*m+1):
        n=4*(m-j+1)*at(c,j-1)+(6*m-3*j+6)*at(c,j-2)+(3*m-j+3)*at(c,j-3)
        c[j],rem=divmod(n,j)
        assert rem==0
    return c

def choose(n):
    c=[1]*(n+1)
    for j in range(1,n+1): c[j]=c[j-1]*(n-j+1)//j
    return c

def polys(m):
    bm,old=bpower(m),bpower(m-1)
    binom=choose(3*m)
    bp=[at(binom,j)+at(binom,j-1) for j in range(3*m+2)]
    # Coefficient forms from the pinned candidates, zero extended.
    p=[at(bm,j)+2*at(bm,j-1)+at(bp,j-1) for j in range(3*m+4)]
    a0=[at(bm,j)+at(bm,j-1)+at(binom,j-1) for j in range(3*m+4)]
    astar=[at(old,j)+5*at(old,j-1)+7*at(old,j-2)+2*at(old,j-3)+at(binom,j-1) for j in range(3*m+4)]
    rr=[3*m*(2*at(old,j)+5*at(old,j-1)+2*at(old,j-2))+(3*m+1)*at(binom,j) for j in range(3*m+4)]
    return p,{'A0':a0,'Astar':astar,'R':rr}

# Exact finite central base, the proposed range 3 <= m < 400.
lc=hashlib.sha256(); mixed=hashlib.sha256(); checks=0
lc_min=None; mixed_min=None
for m in range(3,400):
    p,zs=polys(m)
    for name,z in zs.items():
        for j in range(m,2*m+3):
            v=z[j]*z[j]-z[j-1]*z[j+1]
            w=z[j]*p[j+1]-z[j+1]*p[j]
            assert v>0 and w>0,(m,name,j,v,w)
            lc.update(f'{m}:{name}:{j}:{v}\n'.encode())
            mixed.update(f'{m}:{name}:{j}:{w}\n'.encode())
            checks+=1
            if lc_min is None or v<lc_min[0]: lc_min=(v,m,name,j)
            if mixed_min is None or w<mixed_min[0]: mixed_min=(w,m,name,j)

# Exact cutoff constants from the C6 proposal. The monotonicity argument is
# analytic in the report; here only the endpoint rational inequalities replay.
M=400
E=Fraction(factorial(17)*(3*M)**54, (M-17)**17*(2*M-14)**16*(M-39)**38)
cuts={name:Fraction(c)*(2*M+3)*E for name,c in [('LC',24),('A0',47),('Astar',431),('R',Fraction(14688,21))]}
assert all(0<v<1 for v in cuts.values())

# Tiny graph identity check via the pinned checked evaluator. Full graph and
# leaf deletions use tree DP; this is an independent implementation from the
# coefficient recurrence above.
spec=importlib.util.spec_from_file_location('checked_tree',ROOT/'ordinary_tree_checked.py')
mod=importlib.util.module_from_spec(spec); sys.modules[spec.name]=mod; spec.loader.exec_module(mod)
tiny=[]
for m in (1,2,3):
    tree,marked=mod.t_family(m)
    p,zs=polys(m)
    assert tree.forest_independence_polynomial()==p[:3*m+3]
    leaves=tree.leaves()
    pathleaf=[v for v in leaves if v==marked]
    starleaves=[v for v in leaves if v!=marked]
    assert len(pathleaf)==1 and len(starleaves)==3*m
    assert tree.remove({marked}).forest_independence_polynomial()==zs['A0'][:3*m+2]
    for v in starleaves:
        assert tree.remove({v}).forest_independence_polynomial()==zs['Astar'][:3*m+2]
    tiny.append({'m':m,'order':len(tree.vertices),'alpha':len(tree.forest_independence_polynomial())-1,'leaves':len(leaves),'P_and_deletions_match':True})

result={
 'finite_m_range':[3,399], 'central_j_range':'m..2m+2 inclusive',
 'checks_each_margin':checks, 'lc_stream_digest':lc.hexdigest(), 'mixed_stream_digest':mixed.hexdigest(),
 'minimum_lc':[str(lc_min[0]),lc_min[1],lc_min[2],lc_min[3]],
 'minimum_mixed':[str(mixed_min[0]),mixed_min[1],mixed_min[2],mixed_min[3]],
 'cutoff':400,'cutoff_ratios':{k:[str(v.numerator),str(v.denominator)] for k,v in cuts.items()},
 'tiny_tree_checks':tiny,
 'scope':'Exact finite coefficient checks and m=1..3 tree-DP identities only; no universal tree conclusion.'
}
Path('EVIDENCE.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
