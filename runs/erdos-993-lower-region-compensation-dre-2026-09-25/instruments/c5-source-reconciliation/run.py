from pathlib import Path
import sys,json
D=Path(__file__).resolve().parent;B=D.parents[1];sys.path.insert(0,str(B/'inputs'));import ordinary_tree_checked as O
T,_=O.t_family(22);row=O.aggregate_row(T,34);standing=json.loads((B/'inputs/standing-controls/t22-order91.json').read_text())
assert row==standing['complete_row']
poly=T.forest_independence_polynomial();leaves=[]
for v in T.leaves():
 s=T.support(v);H=T.remove({v,s});R=T.remove(T.closed_neighborhood({s}))
 leaves.append({'leaf':v,'support':s,'selector_poly':T.remove({v}).forest_independence_polynomial(),'H_poly':H.forest_independence_polynomial(),'R_poly':R.forest_independence_polynomial()})
out={'scope':'exact T22 p34 only; known control replay, no new award','edges':[[v,w]for v in sorted(T.vertices)for w in sorted(T.adjacency[v])if v<w],'poly':poly,'row':row,'leaf_vectors':leaves,'standing_row_exactly_matches':True}
with (D/'REPLAY.json').open('x')as f:json.dump(out,f,indent=2);f.write('\n')
print(json.dumps({'order':len(T.vertices),'leaves':len(leaves),'aggregate':row['aggregate'],'standing_row_exactly_matches':True}))
