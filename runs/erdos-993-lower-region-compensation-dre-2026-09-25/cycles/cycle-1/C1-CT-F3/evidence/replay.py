import json
from pathlib import Path
import ordinary_tree_checked_copy as e

root = Path(__file__).parent
source = json.loads((root / 'source_graft_pair_copy.json').read_text())
base, _ = e.t_family(22)
base_edges = sorted((v, w) for v in base.vertices for w in base.adjacency[v] if v < w)
graft = e.Graph.from_edges(range(94), base_edges + [(4, 91), (91, 92), (92, 93)])

def x_terminal(poly):
    return next(j for j in range(len(poly)) if e.delta(poly, j) < 0)

def connected_and_tree(g):
    seen=set(); stack=[next(iter(g.vertices))]
    while stack:
        v=stack.pop()
        if v in seen: continue
        seen.add(v); stack.extend(g.adjacency[v]-seen)
    return len(seen)==len(g.vertices) and sum(map(len,g.adjacency.values()))//2 == len(g.vertices)-1

def result(g):
    poly=g.forest_independence_polynomial(); a=len(poly)-1; p=35
    row=e.aggregate_row(g,p)
    selectors={str(v):e.delta(g.remove({v}).forest_independence_polynomial(),p) for v in g.leaves()}
    return {
      'vertices':sorted(g.vertices),
      'edges':sorted((v,w) for v in g.vertices for w in g.adjacency[v] if v<w),
      'order':len(g.vertices), 'connected_acyclic':connected_and_tree(g),
      'independence_vector_i_0_through_alpha':poly,
      'alpha':a, 'delta_0_through_alpha':[e.delta(poly,j) for j in range(a+1)],
      'x_including_terminal':x_terminal(poly), 'p':p,
      'guard_x_plus_2_le_p':x_terminal(poly)+2<=p,
      'guard_3p_lt_2alpha_plus_1':3*p<2*a+1,
      'original_leaves':g.leaves(), 'all_original_leaf_Delta_p_T_minus_v':selectors,
      'favorable_leaves':row['favorable_leaves'], 'summands':row['summands'],
      'S':row['aggregate']}

replay={'construction':'t_family(22), then attach path 4-91-92-93 to vertex 4','rank':35,
        'base':result(base),'grafted':result(graft)}
# Exact equality against all source fields, including the graph encoding and every selector/summand.
checks={}
for name in ('base','grafted'):
    checks[name]={}
    for k in source[name]:
        got = replay[name]['x_including_terminal'] if k=='x' else replay[name][k]
        if k=='edges': got=[list(edge) for edge in got]
        checks[name][k]=(got==source[name][k])
summary={name:{'order':replay[name]['order'],'alpha':replay[name]['alpha'],'x':replay[name]['x_including_terminal'],
  'guards':[replay[name]['guard_x_plus_2_le_p'],replay[name]['guard_3p_lt_2alpha_plus_1'],
            3*35,2*replay[name]['alpha']+1],
  'leaf_count':len(replay[name]['original_leaves']),'favorable_count':len(replay[name]['favorable_leaves']),
  'favorable_leaves':replay[name]['favorable_leaves'],'S':replay[name]['S'],
  'positive_summands':[q for q in replay[name]['summands'] if q['g']>0],
  'negative_summand_count':sum(q['g']<0 for q in replay[name]['summands']),
  'summand_sum_check':sum(q['g'] for q in replay[name]['summands'])==replay[name]['S']} for name in ('base','grafted')}
(root/'replay_result.json').write_text(json.dumps({'source_evidence_field_checks':checks,'summary':summary},indent=2)+'\n')
print(json.dumps({'all_fields_match':all(v for group in checks.values() for v in group.values()),'summary':summary},indent=2))
