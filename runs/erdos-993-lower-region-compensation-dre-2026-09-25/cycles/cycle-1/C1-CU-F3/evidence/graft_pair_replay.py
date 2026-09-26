import json
import sys
from pathlib import Path
sys.path.insert(0, 'evidence')
import ordinary_tree_checked as e


def first_descent_including_terminal(poly):
    # Integer zero extension makes Delta_alpha = -i_alpha a candidate.
    return next(j for j in range(len(poly)) if e.delta(poly, j) < 0)


def serialize(T, p):
    edges = sorted((v, w) for v in T.vertices for w in T.adjacency[v] if v < w)
    poly = T.forest_independence_polynomial()
    alpha = len(poly) - 1
    x = first_descent_including_terminal(poly)
    selector = {}
    for leaf in T.leaves():
        leafpoly = T.remove({leaf}).forest_independence_polynomial()
        selector[str(leaf)] = e.delta(leafpoly, p)
    row = e.aggregate_row(T, p)
    return {
        'vertices': sorted(T.vertices),
        'edges': edges,
        'order': len(T.vertices),
        'independence_vector_i_0_through_alpha': poly,
        'alpha': alpha,
        'delta_0_through_alpha': [e.delta(poly, j) for j in range(alpha + 1)],
        'x': x,
        'p': p,
        'guard_x_plus_2_le_p': x + 2 <= p,
        'guard_3p_lt_2alpha_plus_1': 3 * p < 2 * alpha + 1,
        'original_leaves': T.leaves(),
        'all_original_leaf_Delta_p_T_minus_v': selector,
        'favorable_leaves': row['favorable_leaves'],
        'summands': row['summands'],
        'S': row['aggregate'],
    }

base, _ = e.t_family(22)
base_edges = [(v, w) for v in base.vertices for w in base.adjacency[v] if v < w]
# Graft the path 4--91--92--93 onto original T_22 leaf 4.
graft = e.Graph.from_edges(range(94), base_edges + [(4, 91), (91, 92), (92, 93)])
result = {'construction': 'T_22 from t_family(22); graft path 4-91-92-93 onto original leaf 4',
          'rank': 35,
          'base': serialize(base, 35),
          'grafted': serialize(graft, 35)}
out = Path('evidence/graft_pair.replayed.json')
out.write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps({k: {'order':v['order'],'alpha':v['alpha'],'x':v['x'],'guards':[v['guard_x_plus_2_le_p'],v['guard_3p_lt_2alpha_plus_1']], 'leaves':len(v['original_leaves']),'favorable':v['favorable_leaves'],'S':v['S'],'positive_terms':[(z['leaf'],z['g']) for z in v['summands'] if z['g']>0]} for k,v in [('base',result['base']),('grafted',result['grafted'])]}, indent=2))
