import sys
sys.path.insert(0, __file__.rsplit('/',1)[0])
from ordinary_tree import path_graph, aggregate_row, delta, first_strict_descent
for n in [30,42,60,90]:
 T=path_graph(n); poly=T.forest_independence_polynomial(); alpha=len(poly)-1; p=alpha-2; x=first_strict_descent(poly)
 if x+2<=p:
  row=aggregate_row(T,p)
  print(n,alpha,x,p,row['favorable_leaves'],[s['g'] for s in row['summands']],row['aggregate'])
