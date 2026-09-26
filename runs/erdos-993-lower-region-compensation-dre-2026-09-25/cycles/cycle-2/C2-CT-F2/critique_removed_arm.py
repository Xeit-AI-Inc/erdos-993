"""Exact replay after deleting one root-adjacent K_1,3 arm from T_family(60)."""
import importlib.util, json, sys
from pathlib import Path
EVALUATOR=Path(str(Path(__file__).with_name("ordinary_tree_checked_copy.py")))
spec=importlib.util.spec_from_file_location("ordinary_tree_checked",EVALUATOR); EV=importlib.util.module_from_spec(spec);sys.modules[spec.name]=EV;spec.loader.exec_module(EV)
# The original T_family(60) has 60 root-adjacent K_1,3 arms; remove one whole arm.
edges=[(0,1),(1,2)]; n=3; centers=[]; leaf_groups=[]
for _ in range(59):
 c=n;n+=1;centers.append(c);edges.append((0,c));ls=[]
 for _ in range(3):ls.append(n);edges.append((c,n));n+=1
 leaf_groups.append(ls)
T=EV.Graph.from_edges(range(n),edges); p=90; poly=T.forest_independence_polynomial(); a=len(poly)-1;x=EV.first_strict_descent(poly)
assert (n,a,x)==(239,179,86) and x+2<=p and 3*p<2*a+1
reps={"distinguished":2,"three_leaf_arm":leaf_groups[0][0]}; data={}
for name,v in reps.items():
 t=T.remove({v}).forest_independence_polynomial(); d=EV.leaf_data(T,v,p)
 data[name]={"representative_leaf":v,"multiplicity":1 if name=="distinguished" else 177,"selector_delta_p_T_minus_leaf":EV.delta(t,p),"selector_polynomial_T_minus_leaf":t,"h_polynomial":T.remove({v,T.support(v)}).forest_independence_polynomial(),"r_polynomial":T.remove(T.closed_neighborhood({T.support(v)})).forest_independence_polynomial(),"summand":d}
fav=[]
for name,d in data.items():
 if d["selector_delta_p_T_minus_leaf"]<0:
  vs=[2] if name=="distinguished" else [v for group in leaf_groups for v in group]
  for v in vs:fav.append({"leaf":v,"support":T.support(v),"summand":d["summand"]["g"],"delta_p_T_minus_leaf":d["summand"]["pointwise_delta"],"class":name})
S=sum(z["summand"] for z in fav)
assert len(fav)==178 and S==-171264854442676707009763817014456168190942415840549034149
out={"recipe":{"parent":"t_family(60)","operation":"delete one entire root-adjacent K_1,3 arm","remaining_K_1_3_arms":59,"edges":[[0,1],[1,2]],"rank_p":p,"order":n},"guards":{"alpha":a,"first_strict_descent_x":x,"x_plus_2_le_p":True,"3p":3*p,"2alpha_plus_1":2*a+1,"strict_lower_region":True},"tree_independence_polynomial_coefficients":poly,"first_descent_check_deltas_0_through_x":[EV.delta(poly,j) for j in range(x+1)],"leaf_class_data":data,"complete_favorable_leaf_summands":fav,"favorable_leaf_count":len(fav),"aggregate_S":S,"method":"Exact integer tree dynamic programming from inputs/ordinary_tree_checked.py; all arms and within-arm leaves are automorphic."}
Path(__file__).with_name("EVIDENCE-REMOVED-ARM.json").write_text(json.dumps(out,indent=2)+"\n")
print(json.dumps({k:out[k] for k in ("recipe","guards","favorable_leaf_count","aggregate_S")},indent=2))
