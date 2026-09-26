#!/usr/bin/env python3
"""Independent graph-DP check using the pinned ordinary_tree_checked evaluator."""
import importlib.util, json, hashlib, sys
from pathlib import Path
B=Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25')
source=B/'inputs/ordinary_tree_checked.py'
assert hashlib.sha256(source.read_bytes()).hexdigest()=='a012bb78915ccdfa2f729c0cdb520cd8f29572277123c92e80ba6091498f533d'
spec=importlib.util.spec_from_file_location('ordinary_tree_checked',source)
ev=importlib.util.module_from_spec(spec); sys.modules[spec.name]=ev; spec.loader.exec_module(ev)
formula_path=Path(__file__).with_name('COMPUTE.py')
fspec=importlib.util.spec_from_file_location('formula_audit',formula_path)
fm=importlib.util.module_from_spec(fspec); sys.modules[fspec.name]=fm; fspec.loader.exec_module(fm)

def lopsided(m,special,r=3):
    sizes=[special]+[r]*(m-1); edges=[(0,1),(1,2)]; vertices=[0,1,2]; cur=3
    for t in sizes:
        c=cur; vertices.append(c); edges.append((0,c))
        for v in range(cur+1,cur+t+1): vertices.append(v); edges.append((c,v))
        cur+=t+1
    return ev.Graph.from_edges(vertices,edges)

def audit(g):
    poly=g.forest_independence_polynomial(); alpha=len(poly)-1; x=ev.first_strict_descent(poly)
    out=[]
    for p in range(x+2,alpha+3):
        if not 3*p < 2*alpha+1: continue
        a=ev.aggregate_row(g,p)
        # Exact target eligibility / selector / full sum from original edge graph.
        assert a['first_strict_descent']==x and a['alpha']==alpha
        out.append({'p':p,'F_count':a['favorable_count'],'F_leaves':a['favorable_leaves'],'S':a['aggregate']})
    return {'order':len(g.vertices),'alpha':alpha,'x':x,'eligible_rows':out}

base=[]
for m in range(1,21):
    g,_=ev.t_family(m); checked=audit(g); formula=fm.row(m,3)
    byp={x['p']:x for x in formula['eligible_rows']}
    assert {x['p'] for x in checked['eligible_rows']}==set(byp)
    for x in checked['eligible_rows']:
        assert x['S']==byp[x['p']]['S'] and x['F_count']==3*m+1
    base.append({'m':m,**checked})
lop=[]
for s in (1,2,4,5):
    for m in range(2,9):
        checked=audit(lopsided(m,s)); formula=fm.lopsided_row(m,s)
        byp={x['p']:x for x in formula['eligible_rows']}
        assert {x['p'] for x in checked['eligible_rows']}==set(byp)
        for x in checked['eligible_rows']:
            fcount=(1 if 'endpoint' in byp[x['p']]['F_orbits'] else 0)+sum(t for t in [s]+[3]*(m-1) if 'tips_'+str(t) in byp[x['p']]['F_orbits'])
            assert x['S']==byp[x['p']]['S'] and x['F_count']==fcount
        lop.append({'m':m,'special_leaves':s,**checked})
result={'evaluator':'inputs/ordinary_tree_checked.py','evaluator_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),
        'method':'forest DP on explicit original tree edge lists; evaluator reconstructs original leaves/supports and computes every favorable tag and summand; exact orbit polynomial sums and selector counts are asserted against COMPUTE.py',
        'original_Tm':base,'lopsided_star_variants':lop}
Path(__file__).with_name('GRAPH-CROSSCHECK.json').write_text(json.dumps(result,indent=2)+'\n')
allrows=[e for row in base for e in row['eligible_rows']]
print(json.dumps({'T_m_m1_20_eligible_rows':len(allrows),'T_m_positive':sum(e['S']>0 for e in allrows),
                  'lopsided_cases':len(lop),'lopsided_eligible_rows':sum(len(v['eligible_rows']) for v in lop),
                  'lopsided_positive':sum(e['S']>0 for v in lop for e in v['eligible_rows'])},indent=2))
