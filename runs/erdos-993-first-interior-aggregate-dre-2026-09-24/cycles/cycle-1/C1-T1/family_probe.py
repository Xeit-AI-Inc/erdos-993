import sys
sys.path.insert(0, __file__.rsplit('/',1)[0])
from ordinary_tree import t_family, aggregate_row, first_strict_descent
for m in [1,2,3,5,10,22,60]:
 T,v=t_family(m); poly=T.forest_independence_polynomial(); alpha=len(poly)-1; p=alpha-2; x=first_strict_descent(poly)
 if x+2<=p:
  row=aggregate_row(T,p)
  pos=[s for s in row['summands'] if s['g']>0]
  print(m,len(T.vertices),alpha,x,p,row['favorable_count'],row['aggregate'],[(s['leaf'],s['g']) for s in pos])
 else: print(m,'ineligible',len(T.vertices),alpha,x,p)
