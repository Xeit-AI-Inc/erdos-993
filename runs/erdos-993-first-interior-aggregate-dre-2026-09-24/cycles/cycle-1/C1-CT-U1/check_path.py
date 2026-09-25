import json
from ordinary_tree_copy import Graph, coefficient, delta

def add(a,b):
    out=[0]*max(len(a),len(b))
    for i,x in enumerate(a): out[i]+=x
    for i,x in enumerate(b): out[i]+=x
    while len(out)>1 and out[-1]==0: out.pop()
    return out

def path(n):
    return Graph.from_edges(range(n), ((i,i+1) for i in range(n-1)))

def first_descent(poly):
    # Include the terminal zero-extended coefficient at k=alpha.
    return next(k for k in range(len(poly)) if coefficient(poly,k+1)-coefficient(poly,k)<0)

def replay_graph(G, family):
    n=len(G.vertices); f=G.forest_independence_polynomial(); alpha=len(f)-1; p=alpha-2; x=first_descent(f)
    records=[]; S=0
    for v in G.leaves():
        s=G.support(v); H=G.remove({v,s}); R=G.remove(G.closed_neighborhood({s})); Tv=G.remove({v})
        hp,rp,tvp=H.forest_independence_polynomial(),R.forest_independence_polynomial(),G.remove({v}).forest_independence_polynomial()
        favorable=delta(tvp,p)<0
        term=(coefficient(hp,p)-coefficient(hp,p-1))-(coefficient(rp,p)-coefficient(rp,p-1))
        assert add(hp,[0]+rp)==tvp
        q=lambda k: coefficient(hp,k)-coefficient(rp,k)
        assert term==q(p)-q(p-1)
        if favorable: S+=term
        records.append({'leaf':v,'support':s,'favorable':favorable,'delta_p_T_minus_v':delta(tvp,p),'q_p':q(p),'q_p_minus_1':q(p-1),'summand':term})
    return {'family':family,'order':n,'alpha':alpha,'x':x,'p':p,'eligibility_x_plus_2_le_p':x+2<=p,'all_original_leaves':G.leaves(),'records':records,'complete_aggregate':S,'checks':['forest-DP exact integer coefficients','contract first descent including k=alpha',f'P(T-v)=P(H_v)+z*P(R_v) coefficientwise for all {len(G.leaves())} original leaves',f'summand=q_p-q_(p-1) for all favorable leaves']}

def path_replay(n=100): return replay_graph(path(n),f'ordinary path P_{n}; edges (i,i+1), 0<=i<{n-1}')
def repeated_support_tree(m=30):
    # Hub 0, supports 1..m, and two tagged leaf vertices per support.
    edges=[]; leaves=[]; nextv=m+1
    for s in range(1,m+1):
        edges.append((0,s))
        for _ in range(2): edges.append((s,nextv)); leaves.append(nextv); nextv+=1
    G=Graph.from_edges(range(nextv),edges)
    return replay_graph(G,f'{m}-support double-leaf hub tree; hub 0 adjacent to supports 1..{m}; each support has two distinct leaves; {len(G.vertices)} vertices')
if __name__=='__main__': print(json.dumps({'path_P100':path_replay(),'double_leaf_hub_m30':repeated_support_tree()},sort_keys=True,indent=2))
