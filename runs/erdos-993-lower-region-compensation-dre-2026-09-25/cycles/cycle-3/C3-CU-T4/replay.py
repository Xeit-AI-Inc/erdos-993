import json
from pathlib import Path
from ordinary_tree_checked import Graph, aggregate_row, coefficient, delta

m = 6
edges = [(0, 1), (1, 2), (1, 3), (0, 4)]
next_vertex = 5
for _ in range(m):
    support = next_vertex
    edges.extend([(4, support), (support, support + 1), (support, support + 2)])
    next_vertex += 3
T = Graph.from_edges(range(next_vertex), edges)
p = 10
k = p - 1
parent_poly = T.forest_independence_polynomial()
row = aggregate_row(T, p)
v = 2
s = T.support(v)
H = T.remove({v, s})
W = sorted(T.adjacency[s] - {v})
H_poly = H.forest_independence_polynomial()
R = H.remove(W)
R_poly = R.forest_independence_polynomial()
q = [coefficient(H_poly, r) - coefficient(R_poly, r) for r in range(len(H.vertices) + 1)]
# Choose the nonisolated mark first, then the isolated mark.
order = [0, 3]
classes = []
for w in order:
    removed = H.closed_neighborhood({w}) | frozenset(order[:order.index(w)])
    J = H.remove(removed)
    poly = J.forest_independence_polynomial()
    classes.append({
        'mark': w,
        'degree_in_H': len(H.adjacency[w]),
        'removed_vertices': sorted(removed),
        'residual_order': len(J.vertices),
        'i_k': coefficient(poly, k),
        'i_k_minus_1': coefficient(poly, k - 1),
        'difference': coefficient(poly, k) - coefficient(poly, k - 1),
    })
result = {
    'tree': {'order': len(T.vertices), 'edges': [list(e) for e in edges], 'construction': 'vertices 0..4 with edges 0-1,1-2,1-3,0-4; for j=0..5 add support 5+3j, edges 4-(5+3j), (5+3j)-(6+3j), (5+3j)-(7+3j)'},
    'p': p,
    'alpha': len(parent_poly) - 1,
    'parent_independence_polynomial': parent_poly,
    'x_first_strict_descent_including_terminal_zero_extension': row['first_strict_descent'],
    'eligibility': {'x_plus_2_le_p': row['first_strict_descent'] + 2 <= p, 'three_p': 3*p, 'two_alpha_plus_1': 2*row['alpha'] + 1, 'strict_lower_region': 3*p < 2*row['alpha'] + 1},
    'favorable_leaves_complete': row['favorable_leaves'],
    'favorable_leaf_count': row['favorable_count'],
    'favorable_summands_complete': row['summands'],
    'complete_aggregate': row['aggregate'],
    'selected_leaf': v,
    'support': s,
    'delta_p_T_minus_v': row['summands'][row['favorable_leaves'].index(v)]['pointwise_delta'],
    'selected_leaf_summand': row['summands'][row['favorable_leaves'].index(v)]['g'],
    'selected_leaf_summand_record': row['summands'][row['favorable_leaves'].index(v)],
    'H_order': len(H.vertices),
    'H_independence_polynomial': H_poly,
    'W': W,
    'W_degrees_in_H': {str(w): len(H.adjacency[w]) for w in W},
    'q_rank_values': {'q_k_minus_1': q[k-1], 'q_k': q[k], 'q_k_plus_1': q[k+1], 'difference': q[k+1]-q[k]},
    'first_mark_order': order,
    'first_mark_classes': classes,
    'first_mark_difference_sum': sum(c['difference'] for c in classes),
    'first_mark_identity_check': sum(c['difference'] for c in classes) == q[k+1]-q[k],
    'alternate_isolate_first': {'mark': 3, 'removed_vertices': [3], 'residual_order': len(H.vertices)-1, 'equals_2k_plus_2': len(H.vertices)-1 == 2*k+2},
}
Path('critique-evidence.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result, indent=2))
