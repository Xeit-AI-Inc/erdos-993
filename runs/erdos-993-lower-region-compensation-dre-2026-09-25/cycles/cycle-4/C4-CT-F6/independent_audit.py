"""Independent closed-form audit for C4-F6's stated root/star-arm family."""
from itertools import combinations
import json
from pathlib import Path


def add(a,b):
    z=[0]*max(len(a),len(b))
    for i,x in enumerate(a): z[i]+=x
    for i,x in enumerate(b): z[i]+=x
    return trim(z)
def mul(a,b):
    z=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): z[i+j]+=x*y
    return trim(z)
def trim(a):
    while len(a)>1 and a[-1]==0: a.pop()
    return a
def power_binom(m):
    a=[1]
    for _ in range(m): a=mul(a,[1,1])
    return a
def shift(a): return [0]+a
def at(a,j): return a[j] if 0<=j<len(a) else 0
def delta(a,j): return at(a,j+1)-at(a,j)
def arm(m): return add(power_binom(m),[0,1])
def prod(xs):
    out=[1]
    for x in xs: out=mul(out,x)
    return out
def parts(total,c,lo=1,prefix=()):
    if c==0:
        if total==0: yield prefix
        return
    for x in range(lo,total//c+1):
        yield from parts(total-x,c-1,x,prefix+(x,))

def graph_shape(ms):
    edges=[]; deg={0:0}; nextv=1; centers=[]; leaves=[]
    for m in ms:
        c=nextv; nextv+=1; centers.append(c); edges.append((0,c)); deg[c]=1; deg[0]+=1
        armleaves=[]
        for _ in range(m):
            v=nextv; nextv+=1; armleaves.append(v); edges.append((c,v)); deg[v]=1; deg[c]+=1
        leaves.append(armleaves)
    # This explicit constructor is a connected tree: c disjoint stars attached once to root.
    assert len(edges)==nextv-1 and len(centers)==len(ms)
    originals=[v for v,d in deg.items() if d==1]
    expected={v for armleaves in leaves for v in armleaves}
    if len(ms)==1: expected.add(0)  # the root is also an original leaf when c=1
    assert len(originals)==len(expected) and set(originals)==expected
    return edges,centers,leaves,originals

def row(p,ms):
    L=sum(ms); A=[arm(m) for m in ms]
    P=add(prod(A),shift(power_binom(L)))
    alpha=len(P)-1
    ds=[delta(P,j) for j in range(alpha+2)]
    x=next(j for j,d in enumerate(ds) if d<0)
    lo=3*p<2*alpha+1
    edges,centers,leaves,originals=graph_shape(ms)
    selected=[]; allleaf=[]
    for j,m in enumerate(ms):
        aa=A[:]; aa[j]=arm(m-1)
        Pv=add(prod(aa),shift(power_binom(L-1)))
        dv=delta(Pv,p)
        for v in leaves[j]:
            allleaf.append({'vertex':v,'center':centers[j],'delta_p_T_minus_v':dv})
            if dv<0:
                # Delete marked leaf and its original support center. The other arm leaves become isolated.
                H=add(mul(prod(A[:j]+A[j+1:]),power_binom(m-1)),shift(power_binom(L-1)))
                R=prod(A[:j]+A[j+1:])
                hdelta=delta(H,p-1); rdelta=delta(R,p-1)
                selected.append({'vertex':v,'center':centers[j],'delta_p_T_minus_v':dv,
                                 'H_delta':hdelta,'R_delta':rdelta,'term':hdelta-rdelta})
    if len(ms)==1:
        # For c=1, root 0 has original degree one and must also be tested/tagged.
        root_deleted=prod(A)
        dv=delta(root_deleted,p)
        allleaf.append({'vertex':0,'center':centers[0],'delta_p_T_minus_v':dv})
        if dv<0:
            q=power_binom(L)
            selected.append({'vertex':0,'center':centers[0],'delta_p_T_minus_v':dv,
                             'H_delta':delta(q,p-1),'R_delta':delta(q,p-1),'term':0})
    eligible=x+2<=p and lo
    return {'p':p,'branch_leaf_counts':list(ms),'order':2*p+4,'edge_count':len(edges),
            'original_leaf_count':len(originals),'alpha':alpha,'delta_vector':ds,'x':x,
            'strict_lower_region':lo,'first_descent_guard':x+2<=p,'eligible':eligible,
            'favorable_count':len(selected),'favorable_vertices':selected,
            'all_leaf_selector_values':allleaf,'S':sum(z['term'] for z in selected) if eligible else None}

out={'method':'Direct branch product P(z)=prod_i((1+z)^m_i+z)+z(1+z)^L, with closed deletion products for T-v, H_v, and R_v; integer polynomial arithmetic.',
     'generation':'All sorted positive integer partitions m_1<=...<=m_c of 2p+3-c for c=1..6, p=10..13.',
     'candidates':{},'eligible_rows':[]}
for p in range(10,14):
    count=lo_count=xguard=eligible=0
    rows=[]
    for c in range(1,7):
        for ms in parts(2*p+3-c,c):
            count+=1; z=row(p,ms)
            lo_count+=z['strict_lower_region']; xguard+=z['first_descent_guard']; eligible+=z['eligible']
            if z['eligible']: rows.append(z)
    out['candidates'][str(p)]={'count':count,'strict_lower_region':lo_count,'x_plus_2_le_p':xguard,'eligible':eligible}
    out['eligible_rows'].extend(rows)
assert out['candidates']=={
 '10':{'count':199,'strict_lower_region':199,'x_plus_2_le_p':1,'eligible':1},
 '11':{'count':279,'strict_lower_region':279,'x_plus_2_le_p':0,'eligible':0},
 '12':{'count':384,'strict_lower_region':384,'x_plus_2_le_p':0,'eligible':0},
 '13':{'count':517,'strict_lower_region':517,'x_plus_2_le_p':0,'eligible':0}}
assert len(out['eligible_rows'])==1
r=out['eligible_rows'][0]
assert r['branch_leaf_counts']==[2,3,3,3,3,3]
assert r['favorable_count']==17 and r['S']==-122805
assert all(z['term']<0 for z in r['favorable_vertices'])
out['conclusion']='The bounded family claim is reproduced exactly. It does not imply a census of all six-cover trees or any universal aggregate/sign theorem.'
Path('independent_audit_evidence.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'candidate_counts':out['candidates'],'eligible_rows':len(out['eligible_rows']),
 'witness':{'p':r['p'],'profile':r['branch_leaf_counts'],'alpha':r['alpha'],'x':r['x'],
            'rank_differences':r['delta_vector'],'favorable':r['favorable_count'],'S':r['S'],
            'term_values':sorted({t['term'] for t in r['favorable_vertices']}),
            'all_terms_negative':all(t['term']<0 for t in r['favorable_vertices'])}},indent=2))
