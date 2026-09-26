import json
import ordinary_tree_checked as O

def graph(m):
    return O.Graph.from_edges(range(3*m+1), [(u,v) for i in range(m) for u,v in [(0,3*i+1),(3*i+1,3*i+2),(3*i+2,3*i+3)]])
def power(base, exp):
    out=[1]
    for _ in range(exp): out=O.mul_poly(out,base)
    return out
def sub(a,b):
    return O.trim([O.coefficient(a,j)-O.coefficient(b,j) for j in range(max(len(a),len(b)))])

m=6; G=graph(m); row=O.aggregate_row(G,8)
Q=[1,3,1]; V=[1,2]; L=[1,1]
expected_P=O.add_poly(power(Q,m),[0]+power(V,m))
expected_A=O.add_poly(O.mul_poly(V,power(Q,m-1)),[0]+O.mul_poly(L,power(V,m-1)))
assert G.forest_independence_polynomial()==expected_P
assert G.remove({18}).forest_independence_polynomial()==expected_A
assert row['order']==19 and row['alpha']==12 and row['first_strict_descent']==6
assert row['favorable_count']==6 and row['aggregate']==-2130
assert all(x['pointwise_delta']==-550 and x['g']==-355 for x in row['summands'])
expected_q=[0]+power(Q,m-1)
leaf_checks=[]
for leaf in G.leaves():
    support=G.support(leaf)
    H=G.remove({leaf,support}).forest_independence_polynomial()
    R=G.remove(G.closed_neighborhood({support})).forest_independence_polynomial()
    assert sub(H,R)==expected_q
    leaf_checks.append({'leaf':leaf,'support':support,'H_minus_R':sub(H,R)})
print(json.dumps({'m':m,'p':8,'graph_edges':[(u,v) for i in range(m) for u,v in [(0,3*i+1),(3*i+1,3*i+2),(3*i+2,3*i+3)]],'P':expected_P,'A':expected_A,'x':row['first_strict_descent'],'leaf_checks':leaf_checks,'aggregate_row':row},indent=2))
