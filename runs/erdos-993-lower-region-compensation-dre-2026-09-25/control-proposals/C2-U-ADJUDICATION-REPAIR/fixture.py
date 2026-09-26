from pathlib import Path
import json,sys
B=Path(__file__).resolve().parents[2];sys.path.insert(0,str(B/'inputs'));import ordinary_tree_checked as O
edges=[(i,i+1) for i in range(5)]+[(i,6+2*i+j)for i in range(6)for j in range(2)]
T=O.Graph.from_edges(range(18),edges);p=8;v=6;s=T.support(v);H=T.remove([v,s]);marks=sorted(T.adjacency[s]-{v});assert marks==[1,7]
rows=[]
for i,w in enumerate(marks):
 delete=H.closed_neighborhood([w])|set(marks[:i]);J=H.remove(delete)
 rows.append({'index':i+1,'mark':w,'deleted':sorted(delete),'vertices':sorted(J.vertices),'order':len(J.vertices),'polynomial':J.forest_independence_polynomial(),'Delta_k_minus_one':O.delta(J.forest_independence_polynomial(),p-2)})
P=T.forest_independence_polynomial();assert P==T.brute_independence_polynomial()
d={'scope':'one actual eligible shell tree disproves the asserted later-residual order bound, not the shell aggregate','order':len(T.vertices),'edges':edges,'p':p,'alpha':len(P)-1,'x':O.first_strict_descent(P),'P':P,'leaf':v,'support':s,'H_order':len(H.vertices),'marks_ordered':marks,'residuals':rows,'guarded':O.first_strict_descent(P)+2<=p and 3*p<2*(len(P)-1)+1,'false_assertion':'every i>=2 residual has order<=2k-1','countervalue':rows[1]['order'],'claimed_ceiling':2*(p-1)-1}
assert d['guarded'] and d['countervalue']>d['claimed_ceiling']
Path(__file__).with_name('FIXTURE.json').write_text(json.dumps(d,indent=2)+'\n');print('Eligible n18 p8 x6 a12; J2 actual order14 exceeds claimed13')
