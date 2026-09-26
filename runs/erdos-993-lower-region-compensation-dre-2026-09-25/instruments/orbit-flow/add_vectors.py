from pathlib import Path
import sys,json
P=Path(__file__).resolve().parent;B=P.parents[1]
sys.path.insert(0,str(B/'inputs'))
import ordinary_tree_checked as O
results=[]
for m,p in [(22,34),(60,90),(66,98)]:
 T,_=O.t_family(m);leaves=T.leaves()
 edges=sorted((v,w) for v in T.vertices for w in T.adjacency[v] if v<w)
 poly=T.forest_independence_polynomial(); records=[]
 for v in leaves:
  s=T.support(v); closed=T.closed_neighborhood({s})
  records.append({'leaf':v,'support':s,'closed_neighborhood':sorted(closed),
   'deleted_leaf_polynomial':T.remove({v}).forest_independence_polynomial(),
   'h_polynomial':T.remove({v,s}).forest_independence_polynomial(),
   'r_polynomial':T.remove(closed).forest_independence_polynomial()})
 favored=[r['leaf'] for r in records if O.delta(r['deleted_leaf_polynomial'],p)<0]
 total=sum(O.delta(r['h_polynomial'],p-1)-O.delta(r['r_polynomial'],p-1) for r in records if r['leaf'] in favored)
 old=json.loads((P/f'm{m}-p{p}.json').read_text())['graph_row']
 assert favored==old['favorable_leaves'] and total==old['aggregate']
 results.append({'m':m,'p':p,'edges':edges,'polynomial':poly,'x':O.first_strict_descent(poly),'alpha':len(poly)-1,'favorable_leaves':favored,'aggregate':total,'leaf_records':records})
with (P/'FULL-POLYNOMIALS.json').open('x') as f:json.dump({'scope':'full promised vector envelope for the three sealed orbit-flow cases','rows':results},f,sort_keys=True);f.write('\n')
print('All original-leaf vectors and graph recipes reconciled')
