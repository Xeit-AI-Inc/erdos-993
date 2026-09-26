from itertools import combinations_with_replacement
from math import comb
import json

R=json.load(open('REPLAY-RESULTS.json'))

def add(a,b):
    c=[0]*max(len(a),len(b))
    for i,x in enumerate(a): c[i]+=x
    for i,x in enumerate(b): c[i]+=x
    while len(c)>1 and c[-1]==0: c.pop()
    return c

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    while len(c)>1 and c[-1]==0: c.pop()
    return c

def shift(a): return [0]+a

def poly_formula(profile):
    A=[1]; B=[1]
    for r in profile:
        Ar=[comb(r,j) for j in range(r+1)]
        Br=add(Ar,[0,1])
        A=mul(A,Ar); B=mul(B,Br)
    return add(mul([0,1,1],A),mul([1,2],B))

formula_checks=0
for row in R['rows']:
    assert poly_formula(row['profile'])==row['i'], row['profile']
    formula_checks+=1

# Direct subset enumeration, independently checking the (2,3,4), p=7 row.
profile=(2,3,4)
adj=[0]*15
edges=[(0,1),(1,2),(0,3),(3,4),(3,5),(0,6),(6,7),(6,8),(6,9),(0,10),(10,11),(10,12),(10,13),(10,14)]
for u,v in edges: adj[u]|=1<<v; adj[v]|=1<<u
leaves=[2,4,5,7,8,9,11,12,13,14]
def enum_poly(allowed):
    vs=[v for v in range(15) if allowed>>v&1]
    out=[0]*(len(vs)+1)
    for bits in range(1<<len(vs)):
        chosen=[vs[j] for j in range(len(vs)) if bits>>j&1]
        if all(not (adj[u]>>v&1) for u,v in combinations_with_replacement(chosen,2) if u!=v):
            out[len(chosen)]+=1
    while len(out)>1 and out[-1]==0: out.pop()
    return out

def delta(c,j):
    def coeff(k): return c[k] if 0<=k<len(c) else 0
    return coeff(j+1)-coeff(j)

full=(1<<15)-1
base=enum_poly(full)
row=next(row for row in R['rows'] if row['profile']==list(profile))
q=next(q for q in row['eligible_rows'] if q['p']==7)
assert base==row['i'] and row['alpha']==11 and row['x']==5
assert q['F']==leaves and q['S']==-1218
checked=[]
for sdata,v in zip(q['summands'],leaves):
    support=(adj[v]&-adj[v]).bit_length()-1
    H=full&~(1<<v)&~(1<<support)
    N=(1<<support)|adj[support]
    Rmask=full&~N
    lp=enum_poly(full&~(1<<v)); hp=enum_poly(H); rp=enum_poly(Rmask)
    term=delta(hp,6)-delta(rp,6)
    assert (sdata['leaf'],sdata['support'],sdata['delta_p_T_minus_leaf'],sdata['term'])==(v,support,delta(lp,7),term)
    checked.append({'leaf':v,'support':support,'selector_delta':delta(lp,7),'term':term})
assert sum(z['term'] for z in checked)==-1218

out={
 'formula_crosschecks_all_profiles':formula_checks,
 'formula_method':'Independent binomial convolution of A_r=(1+z)^r and B_r=(1+z)^r+z, followed by P=z(1+z)prod(A_r)+(1+2z)prod(B_r).',
 'direct_subset_spotcheck':{'profile':[2,3,4],'n':15,'alpha':11,'x':5,'p':7,'full_vector':base,'favorable_leaves':leaves,'summands':checked,'S':-1218},
 'replay_summary':R['summary'],
 'eligible_rows':sum(len(row['eligible_rows']) for row in R['rows']),
 'S_range':[min(q['S'] for row in R['rows'] for q in row['eligible_rows']),max(q['S'] for row in R['rows'] for q in row['eligible_rows'])],
 'local_term_range':[min(z['term'] for row in R['rows'] for q in row['eligible_rows'] for z in q['summands']),max(z['term'] for row in R['rows'] for q in row['eligible_rows'] for z in q['summands'])],
 'all_rows_all_leaves_selected':all(len(q['F'])==len([2]+[v for r in row['profile'] for v in []]) for row in [] for q in row['eligible_rows']),
 'disposition_note':'The finite statement is reproduced and spot-checked; no universal heterogeneous extension follows.'
}
# Record selector coverage using the recipe: one path leaf plus sum r_i tips.
out['all_rows_all_leaves_selected']=all(len(q['F'])==1+sum(row['profile']) for row in R['rows'] for q in row['eligible_rows'])
out['all_selected_terms_nonpositive']=all(z['term']<=0 for row in R['rows'] for q in row['eligible_rows'] for z in q['summands'])
out['all_full_sums_negative']=all(q['S']<0 for row in R['rows'] for q in row['eligible_rows'])
out['proper_selector_rows']=sum(q['proper_selector'] for row in R['rows'] for q in row['eligible_rows'])
out['whole_tree_logconcavity_failure']=R['heterogeneous_factor_lc_audit']['first_failure']
with open('EVIDENCE.json','w') as f: json.dump(out,f,indent=2,sort_keys=True); f.write('\n')
print(json.dumps({k:out[k] for k in ['formula_crosschecks_all_profiles','eligible_rows','S_range','local_term_range','all_rows_all_leaves_selected','all_selected_terms_nonpositive','all_full_sums_negative','proper_selector_rows','whole_tree_logconcavity_failure']},indent=2))
