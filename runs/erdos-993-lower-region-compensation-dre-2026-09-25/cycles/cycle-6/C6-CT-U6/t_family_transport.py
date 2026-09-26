#!/Library/Frameworks/Python.framework/Versions/3.11/bin/python3
"""Exact fixed-selector marked-rank data for t_family, branches 1..8."""
import json,sys
from pathlib import Path
B=Path(__file__).parent
sys.path.insert(0,str(B))
import ordinary_tree_checked as o
rows=[]
for m in range(1,9):
 T,marked=o.t_family(m); P=T.forest_independence_polynomial(); a=len(P)-1; x=o.first_strict_descent(P)
 for p in range(x+2,a+1):
  if 3*p>=2*a+1: continue
  data=o.aggregate_row(T,p)
  rows.append({'m':m,'order':len(T.vertices),'alpha':a,'x':x,'p':p,
   'edge_list':[list(e) for e in sorted({tuple(sorted((u,v))) for u in T.vertices for v in T.adjacency[u]}) if e[0]<e[1]],
   'favorable_leaves':data['favorable_leaves'],'summands':[x['g'] for x in data['summands']],
   'Q_p_minus_1':sum(x['c_previous'] for x in data['summands']),
   'Q_p':sum(x['c_rank'] for x in data['summands']),'S':data['aggregate']})
out={'scope':'T_m from inputs/ordinary_tree_checked.py, all m=1..8 and every eligible p','rows':rows,
 'recipe':'T_m has path 0-1-2, with m root-adjacent K1,3 branches; use checked helper forest DP, original-leaf selector, supports, and all distinct leaves.',
 'assertion':'For every row, S=Q_p-Q_(p-1) from exact per-leaf H_v-R_v coefficient counts.'}
Path(__file__).with_name('t_family_transport.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(rows,indent=2))
