"""Independent exact checks for C4-CF-U3 critique; monomial z basis."""
import json, random
from pathlib import Path


def add(a,b):
    n=max(len(a),len(b)); return [(a[i] if i<len(a) else 0)+(b[i] if i<len(b) else 0) for i in range(n)]
def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return c
def scale(a,s): return [s*x for x in a]
def at(a,k): return a[k] if 0<=k<len(a) else 0
def power(a,n):
    o=[1]
    for _ in range(n): o=mul(o,a)
    return o
def delta(a,k): return at(a,k+1)-at(a,k)

L=[1,1]; G=[1,2]
def profile(rs):
    N=sum(rs); B={r:add(power(L,r),[0,1]) for r in (2,3,4)}
    Q=[1]
    for r in rs: Q=mul(Q,B[r])
    C=mul(G,Q); perturb=[0]+power(L,N+1); P=add(C,perturb)
    zLN=[0]+power(L,N); A=[]
    for i,r in enumerate(rs):
        H=[1]
        for h,s in enumerate(rs):
            if h!=i: H=mul(H,B[s])
        A.append(add(mul(mul(G,add(power(L,r-1),[0,1])),H),zLN))
    W=[0]
    for r,a in zip(rs,A): W=add(W,scale(a,r))
    return N,C,P,A,W

# Literal-tree independent-set polynomial by tree DP. Include/exclude arrays per node.
def tree_poly(adj, root=0, deleted_vertex=None):
    def visit(v,parent):
        inc=[0,1]; exc=[1]
        for w in adj[v]:
            if w==parent or w==deleted_vertex: continue
            wi,we=visit(w,v)
            inc=mul(inc,we); exc=mul(exc,add(wi,we))
        return inc,exc
    i,e=visit(root,-1)
    return add(i,e)

def literal_path_star(rs, deleted_vertex=None):
    # Vertices: path 0-1-2; branch centers then each private tip.
    adj=[[] for _ in range(3+len(rs)+sum(rs))]
    def edge(a,b): adj[a].append(b); adj[b].append(a)
    edge(0,1); edge(1,2); v=3; tip_ids=[]
    for r in rs:
        c=v; v+=1; edge(0,c); ids=[]
        for _ in range(r): ids.append(v); edge(c,v); v+=1
        tip_ids.append(ids)
    return tree_poly(adj,deleted_vertex=deleted_vertex)

def check_profile(rs):
    N,C,P,A,W=profile(rs); assert literal_path_star(rs)==P
    return N,C,P,A,W

# Correct literal deletion cross-check using explicit graph builder with node map.
def literal_all(rs):
    adj=[[] for _ in range(3+len(rs)+sum(rs))]
    def edge(a,b): adj[a].append(b); adj[b].append(a)
    edge(0,1); edge(1,2); v=3; centers=[]; tips=[]
    for r in rs:
        c=v; v+=1; centers.append(c); edge(0,c); group=[]
        for _ in range(r): group.append(v); edge(c,v); v+=1
        tips.append(group)
    parent=tree_poly(adj)
    endpoint=tree_poly(adj,deleted_vertex=2)
    deletions=[tree_poly(adj,deleted_vertex=group[0]) for group in tips]
    return parent,endpoint,deletions

def run():
    # Independent literal graph/polynomial identity check, including a 22-branch row.
    graph_profiles=[[2],[3],[4],[2,3,4],[3]*22]
    literal_checks=[]
    for rs in graph_profiles:
        N,C,P,A,W=profile(rs); GP,GA0,GA=literal_all(rs)
        assert GP==P and GA==A
        # Endpoint deletion has leaf vertex 2 removed: independent DP verifies A0.
        literal_checks.append({'branches':len(rs),'N':N,'parent_match':True,'every_tip_deletion_match':True})
    # A0 directly from its closed expression and literal deletion of vertex 2.
    endpoint_checks=[]
    for rs in graph_profiles:
        N,C,P,A,W=profile(rs); _,GA0,_=literal_all(rs)
        Q=[1]
        for r in rs: Q=mul(Q,add(power(L,r),[0,1]))
        A0=add(mul(L,Q),[0]+power(L,N))
        assert GA0==A0
        endpoint_checks.append({'branches':len(rs),'N':N,'endpoint_match':True})
    # Boundary and interior k values for small heterogeneous profiles.
    edge_rows=[]
    for rs in ([2],[3],[4],[2,3,4],[2,2,4,3]):
        N,C,P,A,W=profile(list(rs)); maxk=(N+2)//2
        row={'rs':list(rs),'N':N,'guarded_k_range':[1,maxk],'samples':[]}
        for k in sorted(set([1,maxk,max(1,maxk//2)])):
            if 2*k>N+2: continue
            im=[at(a,k)*at(C,k)-at(a,k+1)*at(C,k-1) for a in A]
            wm=at(W,k)*at(C,k)-at(W,k+1)*at(C,k-1)
            row['samples'].append({'k':k,'min_individual_margin':min(im),'weighted_margin':wm,'Ckm1':at(C,k-1),'Ck':at(C,k),'Wk':at(W,k)})
            assert min(im)>=0 and wm>=0
        edge_rows.append(row)
    # Random targeted adversarial profiles (not a census).
    rng=random.Random(993)
    random_profiles=[]; failures=[]
    for _ in range(50):
        m=rng.randint(1,45); rs=[rng.choice((2,3,4)) for _ in range(m)]
        N,C,P,A,W=profile(rs); maxk=(N+2)//2
        for k in set((1,max(1,maxk//2),maxk)):
            if 2*k>N+2: continue
            for a in A:
                margin=at(a,k)*at(C,k)-at(a,k+1)*at(C,k-1)
                if margin<0: failures.append({'rs':rs,'k':k,'type':'individual','margin':margin})
            margin=at(W,k)*at(C,k)-at(W,k+1)*at(C,k-1)
            if margin<0: failures.append({'rs':rs,'k':k,'type':'weighted','margin':margin})
        random_profiles.append({'m':m,'N':N})
    assert not failures
    # Known unguarded control, evaluated in the monomial z basis and tied to exact guard failure.
    rs=[2]*38+[4]; N,C,P,A,W=profile(rs); k=77
    r4=A[-1]; margin=at(r4,k)*at(C,k)-at(r4,k+1)*at(C,k-1)
    assert margin==-49239834336 and 2*k>N+2
    # Verify the conditional bridge's signs and strict descent on U3 actual row.
    rs=[3]*22; N,C,P,A,W=profile(rs)
    x=next(t for t in range(len(P)+1) if delta(P,t)<0); p=x+2
    assert delta(P,x)<0 and delta(C,x)<0 and x==32 and p==34
    assert x+2<=p and 2*p<=N+2 and 3*p<2*(N+2)+1
    ratio_x=(at(C,x+1),at(C,x)); ratio_p=(at(C,p),at(C,p-1))
    assert ratio_x[0]*ratio_p[1] > ratio_p[0]*ratio_x[1] # strict C ratio decrease here
    assert at(W,p)>0
    bridge_margin=at(W,p)*at(C,p)-at(W,p+1)*at(C,p-1)
    assert bridge_margin>0 # comparison is W[p+1]C[p-1] <= W[p]C[p]
    assert delta(W,p)<0
    strict_count=sum(delta(a,p)<0 for a in A)
    return {'basis':'monomial z coefficients; L=[1,1], G=[1,2], B_r=(1+z)^r+z',
      'literal_graph_checks':literal_checks,'endpoint_deletion_checks':endpoint_checks,
      'boundary_interior_checks':edge_rows,'random_targeted_profiles':len(random_profiles),
      'random_failures':failures,'unguarded_control':{'counts':[38,0,1],'N':N if False else 80,'k':77,'guard_2k_le_Nplus2':False,'signed_margin_AkCk_minus_Ak1Ckm1':margin},
      'conditional_bridge_row':{'counts':[0,22,0],'N':66,'x':x,'p':p,'Delta_x_P':delta(P,x),'Delta_x_C':delta(C,x),'Delta_p_W':delta(W,p),'strict_tip_selectors':strict_count,'W_p':at(W,p),'LR_cross_product_margin':bridge_margin,'C_ratio_x':ratio_x,'C_ratio_p':ratio_p}}

if __name__=='__main__':
    print(json.dumps(run(),indent=2))
