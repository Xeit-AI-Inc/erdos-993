from pathlib import Path
import sys,json,itertools,math,hashlib
P=Path(__file__).resolve().parent;B=P.parents[1]
sys.path.insert(0,str(B/'inputs'));import ordinary_tree_checked as O
sys.path.insert(0,str(B/'instruments/p6-order14-15'));import forest24 as F

# Independently enumerate all order-six graphs and all markings containing
# some non-isolated vertex, restricted only by actual cover number >=3.
edges=list(itertools.combinations(range(6),2));graph_count=0;marked_cases=0
for code in range(1<<len(edges)):
    adj=[0]*6
    for i,(u,v) in enumerate(edges):
        if code>>i&1:adj[u]|=1<<v;adj[v]|=1<<u
    independent=[a for a in range(64) if all(not(adj[v]&a) for v in range(6) if a>>v&1)]
    alpha=max(a.bit_count() for a in independent)
    if 6-alpha<3:continue
    graph_count+=1
    low=[a for a in independent if a.bit_count()==2]
    high=[a for a in independent if a.bit_count()==3]
    noniso=sum(1<<v for v in range(6) if adj[v])
    for W in range(64):
        if not W&noniso:continue
        q2=sum(bool(a&W) for a in low);q3=sum(bool(a&W) for a in high)
        assert q3<=q2,(code,W,q2,q3)
        marked_cases+=1

# Exact arithmetic of the uniform cover-three lower bound.
def cat(j):return math.comb(2*j,j)//(j+1) if j>=0 else 0
gamma=[]
for r in range(501):
    n=2*r+3;val=math.comb(n,r+1)-math.comb(n,r)-3*cat(r-1)-3*cat(r-2)-cat(r-3)
    assert val>0,(r,val)
    if r<8:gamma.append(val)

# Ordinary-tree check includes every original leaf, even unselected ones,
# and deliberately does not impose the lower-region alpha inequality.
def graph(code):
    es=[];cur=0
    def parse(s,at,parent=None):
        nonlocal cur
        assert s[at]=='(';u=cur;cur+=1;at+=1
        if parent is not None:es.append((parent,u))
        while s[at]!=')':_,at=parse(s,at,u)
        return u,at+1
    if code.startswith('U:'):
        s=code[2:];_,end=parse(s,0);assert end==len(s)
    else:
        a,b=code[2:].split('|');u,end=parse(a,0);assert end==len(a)
        _,end=parse(b,0,u);assert end==len(b)
    return O.Graph.from_edges(range(cur),es)
R=F.rooted(8);rows=[]
for n in (8,10,12,14,16):
    p=(n-2)//2;counts={'order':n,'rank':p,'classes':0,'early_descent_trees':0,'all_original_leaf_tests':0}
    def visit(packed,code):
        counts['classes']+=1;T=graph(code);poly=T.forest_independence_polynomial()
        assert len(T.vertices)==n and [O.coefficient(poly,j) for j in range(9)]==F.coeffs(packed)
        x=O.first_strict_descent(poly)
        if x+2<=p:
            counts['early_descent_trees']+=1
            assert n-(len(poly)-1)>=4
            for v in T.leaves():
                z=O.leaf_data(T,v,p);assert z['g']<=0,(n,p,code,v,z)
                counts['all_original_leaf_tests']+=1
        return False
    F.visit_trees(n,R,visit,codes_all=True);assert counts['classes']==F.TREE_COUNTS[n];rows.append(counts)
out={'status_authority':'controller bounded falsification only','formal_award':False,'generic_graph_order':6,'generic_graphs_with_cover_ge3':graph_count,'nonisolated_mark_cases':marked_cases,'gamma_r_checked':[0,500],'first_gamma_values':gamma,'tree_checks':rows,'failures':0,'source_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
with (P/'SANITY-RESULT.json').open('x') as f:json.dump(out,f,indent=2)
print(json.dumps(out),flush=True)
