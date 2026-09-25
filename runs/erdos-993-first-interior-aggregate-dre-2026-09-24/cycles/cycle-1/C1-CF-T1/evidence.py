import sys, json
sys.path.insert(0, __file__.rsplit('/',1)[0])
from ordinary_tree import path_graph, t_family, aggregate_row, first_strict_descent

def summary(T, name, construction):
    poly=T.forest_independence_polynomial(); alpha=len(poly)-1; p=alpha-2; x=first_strict_descent(poly)
    row=aggregate_row(T,p)
    leaves=T.leaves(); summands=row['summands']
    return {
      'name':name,'construction':construction,'order':len(T.vertices),
      'tree':True,'alpha':alpha,'first_strict_descent':x,'p':p,
      'eligible':x+2<=p,'leaf_count':len(leaves),
      'favorable_leaf_count':len(summands),'favorable_leaf_ids':row['favorable_leaves'],
      'summand_value_counts':{str(k):sum(e['g']==k for e in summands) for k in sorted(set(e['g'] for e in summands))},
      'complete_aggregate':row['aggregate']
    }
T,v=t_family(60)
out={'evaluator':'ordinary_tree.py exact integer forest DP; no floats','examples':[
 summary(path_graph(60),'P60','vertices 0..59; edges (i,i+1) for i=0..58'),
 summary(T,'T60','root 0; marked arm 0-1-2; for j=0..59, arm center c=3+4j adjacent to 0 and leaves c+1,c+2,c+3')
]}
print(json.dumps(out,indent=2,sort_keys=True))
