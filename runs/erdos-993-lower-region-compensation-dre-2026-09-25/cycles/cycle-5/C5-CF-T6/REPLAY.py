import json
from pathlib import Path
from ordinary_tree_checked import Graph, aggregate_row, delta, first_strict_descent

base = Path(__file__).resolve().parent
e = json.loads((base / 'SOURCE-EVIDENCE.json').read_text())
g = Graph.from_edges(e['vertices'], [tuple(edge) for edge in e['edges']])
# Independently check that the encoded graph is a connected tree.
seen = set()
stack = [min(g.vertices)]
while stack:
    v = stack.pop()
    if v in seen:
        continue
    seen.add(v)
    stack.extend(g.adjacency[v] - seen)
assert len(seen) == len(g.vertices) and len(e['edges']) == len(g.vertices)-1
poly = g.forest_independence_polynomial()
row = aggregate_row(g, e['p'])
all_leaf_checks = []
for v in g.leaves():
    q = g.remove({v}).forest_independence_polynomial()
    d = delta(q, e['p'])
    all_leaf_checks.append({'leaf': v, 'support': g.support(v), 'delta_p_T_minus_v': d, 'selected': d < 0})
result = {
    'tree_connected': len(seen) == len(g.vertices),
    'tree_edge_count': len(e['edges']) == len(g.vertices)-1,
    'order': len(g.vertices),
    'leaves': g.leaves(),
    'independence_polynomial': poly,
    'alpha': len(poly)-1,
    'first_strict_descent': first_strict_descent(poly),
    'p': e['p'],
    'delta_p_T': delta(poly, e['p']),
    'lower_guard': first_strict_descent(poly) is not None and first_strict_descent(poly)+2 <= e['p'],
    'strict_alpha_guard': 3*e['p'] < 2*(len(poly)-1)+1,
    'all_leaf_checks': all_leaf_checks,
    'aggregate_row': row,
    'source_evidence_matches': (
        poly == e['polynomial'] and len(poly)-1 == e['alpha'] and
        first_strict_descent(poly) == e['first_strict_descent'] and
        row['favorable_leaves'] == e['favorable_leaves'] and
        row['summands'] == e['summands'] and row['aggregate'] == e['S']
    )
}
(base/'REPLAY.json').write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps(result, indent=2))
