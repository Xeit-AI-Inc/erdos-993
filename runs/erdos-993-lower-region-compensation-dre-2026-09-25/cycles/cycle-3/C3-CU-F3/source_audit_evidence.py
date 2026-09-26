"""Cross-check exact aggregate rows for the literal F3 flow search."""
import json, sys
from pathlib import Path
B=Path.cwd()
HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(B))
import ordinary_tree_checked as O
flows=json.loads((HERE/'source_flow-results.json').read_text())
cases=[]
for f in flows:
    edges=[tuple(e) for e in f['edges_list']]
    n=f['n']; T=O.Graph.from_edges(range(n),edges)
    poly=T.forest_independence_polynomial(); alpha=len(poly)-1
    x=O.first_strict_descent(poly); p=f['p']
    row=O.aggregate_row(T,p)
    guard={'x_plus_2_le_p':x+2<=p,'strict_lower_region':3*p<2*alpha+1}
    assert guard['x_plus_2_le_p'] and guard['strict_lower_region']
    assert (alpha,x,row['favorable_leaves'],row['aggregate'])==(f['alpha'],f['x'],f['F'],f['S'])
    assert f['flow']==f['supply'] and f['deficit']==0
    cases.append({
      'branch_long_limb_lengths':f['arms'],
      'vertices':n,'edges':edges,'independence_vector':poly,
      'alpha':alpha,'terminal_delta_at_alpha':O.delta(poly,alpha),
      'x':x,'p':p,'guards':guard,'selector_F_original_leaf_ids':f['F'],
      'selected_leaf_summands':[{'leaf':q['leaf'],'support':q['support'],'delta_p_tree_minus_leaf':q['pointwise_delta'],'summand':q['g']} for q in row['summands']],
      'full_aggregate_S':row['aggregate'],
      'upper_positive_weight_states':f['upper_states'],'lower_positive_capacity_states':f['lower_states'],
      'legal_set_pair_arcs':f['edges'],'upper_supply':f['supply'],'lower_capacity':f['capacity'],
      'max_flow':f['flow'],'residual_cut_deficit':f['deficit']
    })
evidence={
  'schema':'C3-F3.literal-asymmetric-flow-search.v1',
  'method':'No orbit quotient. Enumerate every independent p- and p+1-set literally. Upper supply and lower capacity are w_F(B). Include all deletion arcs and every absent-s vertex switch when s has exactly two neighbors in B. Directed set-pair arcs have unlimited capacity relative to total supply; clones for a pair are fully compatible. Integral max flow is computed by Dinic in search.py.',
  'tree_recipe':'Vertex 0 is a hub, with marked arm 0-1-2. For each listed L, add a hub-adjacent branch center c and three internally disjoint paths from c of lengths 1, 1, L. IDs are assigned consecutively in branch order, then path order. Leaves retain their original support.',
  'generation_boundary':'Exactly the five listed trees, using L-lists [1,1,2], [1,1,3], [1,2,3], [1,1,2,3], [1,1,2,4], at p=x+2. No claim of exhaustive tree coverage.',
  'cases':cases,
  'conclusion':'All five literal networks saturate upper supply. This bounded result finds no deficient cut and proves neither universal weighted Hall nor the primary aggregate.'
}
(HERE/'replay_evidence.json').write_text(json.dumps(evidence,indent=2)+'\n')
print('cases',len(cases),'all saturated',all(c['max_flow']==c['upper_supply'] for c in cases))
