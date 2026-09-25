import random,json
from ordinary_tree import prufer_tree, aggregate_row, delta
rng=random.Random(9932401)
by_order={}; sums=[]; max_g=None; eligible=0
for n in [16,20,24,30,40]:
 count=0; local=[]
 for j in range(300):
  t=prufer_tree([rng.randrange(n) for _ in range(n-2)])
  poly=t.forest_independence_polynomial(); a=len(poly)-1; p=a-2
  x=next((k for k in range(len(poly)+1) if delta(poly,k)<0),None)
  if x is None or x+2>p: continue
  row=aggregate_row(t,p); count+=1; eligible+=1; local.append(row['aggregate']); sums.append(row['aggregate'])
  gmax=max((q['g'] for q in row['summands']),default=None)
  if gmax is not None: max_g=gmax if max_g is None else max(max_g,gmax)
 by_order[str(n)]={'sampled_labeled_trees':300,'eligible':count,'aggregate_min':min(local) if local else None,'aggregate_max':max(local) if local else None,'positive_complete_rows':sum(v>0 for v in local)}
summary={'seed':9932401,'method':'uniform independent Prüfer words at each listed order, 300 samples each; target rank p=alpha-2; zero-extended first descent; exact integer tree DP','by_order':by_order,'eligible_checked':eligible,'aggregate_min':min(sums),'aggregate_max':max(sums),'positive_complete_rows':sum(v>0 for v in sums),'maximum_selected_summand':max_g}
with open('C1-F3-random-summary.json','w') as f:json.dump(summary,f,indent=2)
print(json.dumps(summary,indent=2))
