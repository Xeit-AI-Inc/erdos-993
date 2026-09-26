import hashlib, json
from pathlib import Path
import replay_ordinary_tree_checked as ev

E = json.loads(Path('replay_input_EVIDENCE.json').read_text())
base, marked = ev.t_family(22)
assert marked == 2 and len(base.vertices) == 91
padded = ev.Graph.from_edges(set(base.vertices) | {91},
    [(u,v) for u,ns in base.adjacency.items() for v in ns if u<v] + [(0,91)])
assert len(padded.vertices) == 92
checks=[]
for run, tree in zip(E['runs'], (base,padded)):
    poly=tree.forest_independence_polynomial()
    assert poly == run['independence_polynomial']
    alpha=len(poly)-1
    x=ev.first_strict_descent(poly)
    assert (alpha,x)==(run['alpha'],run['x'])
    assert ev.delta(poly,alpha) == -poly[alpha] == run['terminal_delta_at_alpha']
    expected_ps=[p for p in range(len(poly)+1) if x+2<=p and 3*p<2*alpha+1]
    assert expected_ps==run['eligible_p']
    rowchecks=[]
    for stored in run['rows']:
        p=stored['p']
        row=ev.aggregate_row(tree,p)
        assert row['favorable_leaves']==stored['favorable_leaves']
        assert row['aggregate']==stored['S']
        assert len(row['summands'])==len(stored['summands'])
        for actual, recorded in zip(row['summands'],stored['summands']):
            for key in ('leaf','support','witness_vertices','h_order','r_order','c_rank','c_previous','g','pointwise_delta'):
                assert actual[key]==recorded[key],(run['padding_length'],p,key,actual[key],recorded[key])
        selector_values={str(v):ev.delta(tree.remove({v}).forest_independence_polynomial(),p) for v in tree.leaves()}
        selected=[int(v) for v,d in selector_values.items() if d<0]
        assert selected==row['favorable_leaves']
        rowchecks.append({'p':p,'selector_delta_p_T_minus_v':selector_values,'favorable_leaves':row['favorable_leaves'],'summands':row['summands'],'S':row['aggregate']})
    assert [z['p'] for z in rowchecks]==expected_ps
    checks.append({'padding_length':run['padding_length'],'graph_recipe':'T_22; root 0, marked path 0-1-2, for j=0..21 claw center 3+4j joined to root and leaves 4+4j through 6+4j; if L=1 add vertex 91 and edge 0-91.','n':len(tree.vertices),'edge_count':sum(map(len,tree.adjacency.values()))//2,'alpha':alpha,'x':x,'terminal_delta_at_alpha':ev.delta(poly,alpha),'eligible_p':expected_ps,'coefficient_vector':poly,'rows':rowchecks})
Path('replay_check.json').write_text(json.dumps({'method':'Copied pinned evaluator; regenerated both graphs from the exact recipe; compared coefficient vectors, alpha, terminal delta, x, eligible rank intervals, every leaf selector, every selected summand, and every complete sum against the copied sealed evidence.','source_copy':'replay_ordinary_tree_checked.py','source_copy_sha256':hashlib.sha256(Path('replay_ordinary_tree_checked.py').read_bytes()).hexdigest(),'evidence_copy':'replay_input_EVIDENCE.json','evidence_copy_sha256':hashlib.sha256(Path('replay_input_EVIDENCE.json').read_bytes()).hexdigest(),'checks':checks},indent=2)+'\n')
print(json.dumps([{'L':r['padding_length'],'alpha':r['alpha'],'x':r['x'],'eligible_ranks':len(r['eligible_p']),'replayed_sums':[row['S'] for row in r['rows']]} for r in checks],indent=2))
