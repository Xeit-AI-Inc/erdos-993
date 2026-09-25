from ordinary_tree import kl_spider, t_family

def alpha(t): return len(t.forest_independence_polynomial())-1
for label,t in [('KL(3,4,4)',kl_spider((3,4,4))),('T22',t_family(22)[0])]:
 a=alpha(t); bad=[]
 for leaf in t.leaves():
  s=t.support(leaf)
  with_s=1+alpha(t.remove(t.closed_neighborhood({s})))
  if with_s==a: bad.append({'leaf':leaf,'support':s,'max_size_including_support':with_s})
 print(label,'alpha',a,'leaves',len(t.leaves()),'nonresidual_leaves',bad)
