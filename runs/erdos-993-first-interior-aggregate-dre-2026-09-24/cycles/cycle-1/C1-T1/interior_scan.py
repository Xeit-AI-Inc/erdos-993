import sys
sys.path.insert(0, __file__.rsplit('/',1)[0])
import networkx as nx
from ordinary_tree import Graph, delta, first_strict_descent, aggregate_row
out=[]; eligible=0; pos=[]; point=[]
for n in range(4,19):
  for ix,gx in enumerate(nx.nonisomorphic_trees(n)):
    T=Graph.from_edges(range(n),gx.edges())
    poly=T.forest_independence_polynomial(); alpha=len(poly)-1; p=alpha-2
    x=first_strict_descent(poly)
    if p<0 or x is None or x+2>p: continue
    eligible+=1
    row=aggregate_row(T,p)
    if row['aggregate']>0: pos.append((n,ix,p,x,row))
    for s in row['summands']:
      if s['g']>0: point.append((n,ix,p,x,s))
print({'eligible':eligible,'positive_agg':len(pos),'positive_term':len(point)})
if pos:
 print('first positive agg:',pos[0])
if point:
 print('first positive term:',point[0])
