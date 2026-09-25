import json
from ordinary_tree import t_family, kl_spider, aggregate_row, delta, log_concavity_failures

def row(label, tree, p):
    poly=tree.forest_independence_polynomial(); alpha=len(poly)-1
    x=next((k for k in range(len(poly)+1) if delta(poly,k)<0),None)
    r=aggregate_row(tree,p); selected=[]
    for leaf in r['favorable_leaves']:
        s=tree.support(leaf)
        hp=tree.remove({leaf,s}).forest_independence_polynomial()
        rp=tree.remove(tree.closed_neighborhood({s})).forest_independence_polynomial()
        deleted=tree.remove({leaf}).forest_independence_polynomial()
        selected.append({'leaf':leaf,'support':s,'delta_p_T_minus_leaf':delta(deleted,p),'delta_pminus1_H':delta(hp,p-1),'delta_pminus1_R':delta(rp,p-1),'g':delta(hp,p-1)-delta(rp,p-1)})
    return {'label':label,'vertices':len(tree.vertices),'edges':sorted([list(sorted((v,u))) for v in tree.vertices for u in tree.adjacency[v] if v<u]),'independence_polynomial':poly,'alpha':alpha,'p':p,'first_strict_descent_zero_extended':x,'eligible':x is not None and x+2<=p,'leaves':tree.leaves(),'favorable_leaves':r['favorable_leaves'],'favorable_count':r['favorable_count'],'summands':selected,'aggregate':sum(q['g'] for q in selected),'log_concavity_failures':log_concavity_failures(poly)}

out=[]
for m in [22,60,100]:
 t,_=t_family(m); alpha=len(t.forest_independence_polynomial())-1; out.append(row(f'T_m_{m}_alpha_minus_2',t,alpha-2))
for arms in [(3,4,4),(3,4,5),(3,5,5),(3,5,6),(3,6,6),(4,6,8),(5,7,9)]:
 t=kl_spider(arms); alpha=len(t.forest_independence_polynomial())-1; out.append(row(f'KL_{arms}_alpha_minus_2',t,alpha-2))
with open('C1-F3-fresh-examples.json','w') as f: json.dump(out,f,indent=2)
for x in out:
 print(x['label'],'n',x['vertices'],'alpha',x['alpha'],'p',x['p'],'x',x['first_strict_descent_zero_extended'],'elig',x['eligible'],'L',len(x['leaves']),'F',x['favorable_count'],'S',x['aggregate'],'g-range',(min(q['g'] for q in x['summands']),max(q['g'] for q in x['summands'])))
