import json
from pathlib import Path
from ordinary_tree_checked import Graph, aggregate_row, delta, first_strict_descent

root = Path(__file__).parent
source = json.loads((root / 'source-EVIDENCE.json').read_text())
g = Graph.from_edges(source['vertices'], [tuple(e) for e in source['edges']])
# Verify the encoded graph is connected and acyclic by the tree criterion.
seen=set(); stack=[0]
while stack:
    v=stack.pop()
    if v in seen: continue
    seen.add(v); stack.extend(g.adjacency[v]-seen)
assert len(seen)==24 and sum(map(len,g.adjacency.values()))//2==23
poly=g.forest_independence_polynomial()
row=aggregate_row(g,10)
selector=sorted(g.leaves())
selected=row['favorable_leaves']
# Prove encoded six-center set covers each listed edge.
cover=set(source['cover'])
assert all(u in cover or v in cover for u,v in source['edges'])
assert poly==source['polynomial']
assert len(poly)-1==18 and first_strict_descent(poly)==8
assert delta(poly,10)==-21766
assert selected==source['favorable_leaves'] and row['aggregate']==source['S']
assert row['summands']==source['summands']
assert len(selector)==17 and len(selected)==17
print(json.dumps({'tree_vertices':len(g.vertices),'edges':23,'connected':True,'acyclic_by_tree_criterion':True,'vertex_cover_size':len(cover),'polynomial_matches':True,'alpha':len(poly)-1,'x':first_strict_descent(poly),'Delta_10':delta(poly,10),'original_leaf_count':len(selector),'selected_leaves':len(selected),'all_leaf_deltas_strict_negative':all(e['pointwise_delta']<0 for e in row['summands']),'summands_match':True,'S':row['aggregate']},indent=2))
