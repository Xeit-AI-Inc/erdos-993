import json
from math import comb
from ordinary_tree_checked_copy import star_graph, t_family, coefficient, delta

def poly_and_x(g):
    poly = g.forest_independence_polynomial()
    alpha = max(j for j, c in enumerate(poly) if c)
    # Include the terminal zero-extended comparison at rank alpha.
    x = next(j for j in range(alpha + 1) if delta(poly, j) < 0)
    return poly, alpha, x

def row(g, p):
    poly, a, x = poly_and_x(g)
    fav = [v for v in g.leaves() if delta(g.remove({v}).forest_independence_polynomial(), p) < 0]
    terms = []
    for v in fav:
        s = g.support(v)
        h = g.remove({v, s})
        r = g.remove(g.closed_neighborhood({s}))
        terms.append(delta(h.forest_independence_polynomial(), p-1)-delta(r.forest_independence_polynomial(), p-1))
    return {"order":len(g.vertices),"coefficient_vector":poly,"a":a,"x":x,"p":p,"eligible":x+2<=p and 3*p<2*a+1,"fav_count":len(fav),"sum":sum(terms),"term_min":min(terms),"term_max":max(terms),"first_terms":terms[:3]}

out = {}
g = star_graph(12)
out["star_original"] = row(g,8)
v=1; s=g.support(v)
pruned=g.remove({v,s})
p_poly,p_a,p_x=poly_and_x(pruned)
out["star_pruned"]={"order":len(pruned.vertices),"poly":p_poly,"a":p_a,"x":p_x,"p":8,"rank_guard":p_x+2<=8,"lower_guard":3*8<2*p_a+1}

for name, branches, p, marked_leaf, marked_support in [("t22",22,34,2,1),("t60",60,90,2,1)]:
    tree,_=t_family(branches)
    result=row(tree,p)
    result.pop("coefficient_vector")
    cut=tree.remove({marked_leaf,marked_support})
    cpoly,ca,cx=poly_and_x(cut)
    result["marked_prune"]={"order":len(cut.vertices),"alpha":ca,"x":cx,"p":p,"rank_guard":cx+2<=p,"lower_guard":3*p<2*ca+1,"component_count":sum(1 for v in cut.vertices if not cut.adjacency[v])}
    out[name]=result
print(json.dumps(out,indent=2))
