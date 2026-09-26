#!/Library/Frameworks/Python.framework/Versions/3.11/bin/python3
"""Exact checks for equal-length-three spiders; bounded evidence only."""
import json
from pathlib import Path
from sys import path

B = Path(__file__).resolve().parent
path.insert(0, str(B))
from ordinary_tree_checked import Graph, add_poly, mul_poly, delta, first_strict_descent

def power(poly, n):
    out = [1]
    for _ in range(n):
        out = mul_poly(out, poly)
    return out

def spider(m):
    edges = []
    for i in range(m):
        a, b, c = 1 + 3*i, 2 + 3*i, 3 + 3*i
        edges.extend(((0,a),(a,b),(b,c)))
    return Graph.from_edges(range(3*m+1), edges)

def formula(m):
    Q, V = [1,3,1], [1,2]
    qm, vm = power(Q,m), power(V,m)
    P = add_poly(qm, [0]+vm)
    A = add_poly(mul_poly(V,power(Q,m-1)), [0]+mul_poly([1,1],power(V,m-1)))
    return P,A

rows=[]
for m in range(2,61):
    P,A=formula(m)
    x=first_strict_descent(P)
    alpha=2*m
    eligible=[]
    for p in range(x+2, alpha+2):
        if 3*p < 2*alpha+1:
            favorable = delta(A,p)<0
            s = m*delta(power([1,3,1],m-1),p-2) if favorable else None
            eligible.append({'p':p,'delta_endpoint_deleted':delta(A,p),'selected':favorable,'S_if_selected':s})
    rows.append({'m':m,'order':3*m+1,'alpha':alpha,'x':x,'eligible':eligible})

# Independently use tree dynamic programming on the literal graph for m=2..8.
graph_checks=[]
for m in range(2,9):
    G=spider(m)
    P,A=formula(m)
    actual=G.forest_independence_polynomial()
    for leaf in G.leaves():
        deleted=G.remove({leaf}).forest_independence_polynomial()
        assert deleted==A
    assert actual==P
    graph_checks.append({'m':m,'vertices':len(G.vertices),'edges':sum(map(len,G.adjacency.values()))//2,'leaves':G.leaves(),'polynomial_matches':True,'all_tip_deletions_match':True})

# Full eligible witness: m=6, p=8.
m=6; p=8
G=spider(m); P,A=formula(m); x=first_strict_descent(P)
assert x==6 and len(P)-1==12 and p>=x+2 and 3*p<2*12+1 and delta(A,p)<0
summands=[]
for leaf in G.leaves():
    s=G.support(leaf)
    H=G.remove({leaf,s})
    R=G.remove(G.closed_neighborhood({s}))
    Hp=H.forest_independence_polynomial()
    Rp=R.forest_independence_polynomial()
    term=delta(Hp,p-1)-delta(Rp,p-1)
    summands.append({'leaf':leaf,'support':s,'delta_H_p_minus_1':delta(Hp,p-1),'delta_R_p_minus_1':delta(Rp,p-1),'term':term})
S=sum(x['term'] for x in summands)
assert len(summands)==m and S==-2130
witness={'m':m,'vertex_encoding':'vertices 0..18; root 0; arm i has vertices (a_i,b_i,c_i)=(1+3i,2+3i,3+3i), with edges (0,a_i),(a_i,b_i),(b_i,c_i), for i=0..5','edges_compact':'for i=0..5: (0,a_i),(a_i,b_i),(b_i,c_i)','P':P,'A_tip_deleted':A,'alpha':12,'x':x,'p':p,'guard_x_plus_2':p>=x+2,'guard_strict_alpha':3*p<2*12+1,'delta_A_p':delta(A,p),'F':[r['leaf'] for r in summands],'summands':summands,'S':S,'identity_S':m*delta(power([1,3,1],m-1),p-2)}

out={'method':'integer coefficient convolutions; first strict descent scans through the final positive coefficient with zero extension','bounded_scope':{'m_min':2,'m_max':60,'profiles':59,'p_scope':'all integer p with x+2<=p and 3p<2alpha+1','rows':rows},'literal_graph_tree_dp_checks':graph_checks,'complete_eligible_witness':witness,'limitations':['Finite range does not prove x(P)>=m for all m.','The exact computations do not prove that every eligible leaf is favorable for all m.','No general non-star rooted-branch theorem follows from this family census.']}
Path('EVIDENCE.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'bounded_m':59,'m6_x':x,'m6_alpha':12,'m6_p':p,'m6_delta_deleted':delta(A,p),'m6_favorable_count':len(summands),'m6_S':S,'graph_checks':len(graph_checks)},indent=2))
