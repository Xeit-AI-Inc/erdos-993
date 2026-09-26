#!/usr/bin/env python3
"""Independent replay checks for the copied C1-F1 search and standing controls."""
from pathlib import Path
import importlib.util, json
HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('search_copy', HERE/'replay_search.py')
search=importlib.util.module_from_spec(spec); spec.loader.exec_module(search)
checked=search.checked

def row_at(result,p):
    return next(r for r in result['rows'] if r['p']==p)

checks=[]
# Recompute the two named multi-hub anchors with the copied route program.
for tag, branches, control_name in [('T22',22,'standing_t22-order91.json'),('T60',60,'standing_t60-order243.json')]:
    result=search.analyze([3]*branches,1,0)
    p=34 if tag=='T22' else 90
    row=row_at(result,p)
    control=json.loads((HERE/control_name).read_text())
    positive_terms=[(v,term,sel,supp) for v,term,sel,supp in row['terms'] if term>0]
    assert (result['alpha'],result['x'],p)==(control['alpha'],control['first_strict_descent'],control['rank'])
    assert row['S']==int(control['aggregate']) and len(row['favorable_leaves'])==control['favorable_count']
    assert positive_terms and positive_terms[0][1]==control['marked_g']
    assert row['eligible_guard'] and 3*p<2*result['alpha']+1 and result['x']+2<=p
    checks.append({'control':tag,'recipe':result['recipe'],'alpha':result['alpha'],'x':result['x'],'p':p,'guard':3*p<2*result['alpha']+1,'favorable_count':len(row['favorable_leaves']),'positive_terms':[[v,str(t),str(sel),s] for v,t,sel,s in positive_terms],'S':str(row['S']),'matches_standing_control':True})
# The star control checks the nonempty strict lower region on a distinct family.
tree=checked.star_graph(12)
poly=tree.forest_independence_polynomial(); a=len(poly)-1
x=next(j for j in range(a+1) if checked.delta(poly,j)<0); p=8
terms=[]; favored=[]
for v in tree.leaves():
    pv=tree.remove({v}).forest_independence_polynomial()
    sel=checked.delta(pv,p)
    if sel<0:
        s=tree.support(v)
        h=tree.remove({v,s}).forest_independence_polynomial()
        r=tree.remove(tree.closed_neighborhood({s})).forest_independence_polynomial()
        terms.append([v,str(checked.delta(h,p-1)-checked.delta(r,p-1)),str(sel),s]); favored.append(v)
S=sum(int(t[1]) for t in terms)
assert (a,x,p,len(favored),S)==(12,6,8,12,-1980)
assert x+2<=p and 3*p<2*a+1
checks.append({'control':'K1,12','alpha':a,'x':x,'p':p,'guard':3*p<2*a+1,'favorable_count':len(favored),'terms':terms,'S':str(S),'matches_handoff':True})
# Full seeded result comparison: all per-rank rows are equal between sealed source output and replay.
source_results=json.loads((HERE/'source_search_results.json').read_text())
replayed=json.loads((HERE/'replay_results.json').read_text())
assert source_results['seed']==replayed['seed']==99320260925
assert source_results['candidates']==replayed['candidates']==30
assert source_results['rows_tested']==replayed['rows_tested']==582
assert source_results['tested_rows']==replayed['tested_rows']
assert replayed['positive_count']==0 and all(int(r['S'])<=0 for r in replayed['tested_rows'])
assert len(replayed['full_rows'])==582
for fr in replayed['full_rows']:
    selectors={v:int(sel) for v,sel,supp in fr['selector_values']}
    selected=sorted(v for v,sel,supp in fr['selector_values'] if int(sel)<0)
    term_ids=[term[0] for term in fr['terms']]
    assert len(selectors)==len(fr['selector_values'])
    assert selected==fr['favorable_leaves']==term_ids
    assert all(int(term[2])==selectors[term[0]]<0 for term in fr['terms'])
    assert sum(int(term[1]) for term in fr['terms'])==int(fr['S'])
assert all(3*r['p']<2*r['alpha']+1 and r['p']>=r['x']+2 for r in replayed['tested_rows'])
groups={}
for rr in replayed['tested_rows']:
    groups.setdefault(rr['candidate'],[]).append(rr)
assert sorted(groups)==list(range(30))
orders={91:0,243:0}; rowcounts={91:0,243:0}
for candidate,rows in groups.items():
    first=rows[0]; a=first['alpha']; x=first['x']; order=first['recipe']['order']
    assert order in orders and all(r['recipe']==first['recipe'] and r['alpha']==a and r['x']==x for r in rows)
    assert [r['p'] for r in rows]==list(range(x+2,(2*a)//3+1))
    orders[order]+=1; rowcounts[order]+=len(rows)
assert orders=={91:15,243:15} and rowcounts=={91:137,243:445}
checks.append({'control':'seeded_30_recipe_search','seed':replayed['seed'],'candidates':replayed['candidates'],'rows_tested':replayed['rows_tested'],'rows_identical_to_source':True,'full_selector_and_term_arithmetic_checked':True,'positive_count':replayed['positive_count'],'every_row_guard_checked':True,'complete_rank_ranges_checked':True,'recipes_per_order':{'91':15,'243':15},'rows_per_order':{'91':137,'243':445}})
out={'checks':checks,'overall':'pass'}
(HERE/'replay_audit.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
