"""Independent exact replay and small literal path-star cross-check for C4-CT-U3."""
import json
from pathlib import Path

def add(a, b):
    n = max(len(a), len(b))
    return [(a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0) for i in range(n)]

def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i+j] += x*y
    return out

def scale(a, c): return [c*x for x in a]
def at(a, k): return a[k] if 0 <= k < len(a) else 0
def power(a, n):
    out = [1]
    for _ in range(n): out = mul(out, a)
    return out

L, G = [1, 1], [1, 2]

def formula(rs):
    n = sum(rs)
    B = {r: add(power(L, r), [0, 1]) for r in (2, 3, 4)}
    Q = [1]
    for r in rs: Q = mul(Q, B[r])
    C = mul(G, Q)
    zLn = [0] + power(L, n)
    A0 = add(mul(L, Q), zLn)
    As = []
    for i, r in enumerate(rs):
        H = [1]
        for h, s in enumerate(rs):
            if i != h: H = mul(H, B[s])
        As.append(add(mul(mul(G, add(power(L, r-1), [0, 1])), H), zLn))
    W = [0]
    for r, A in zip(rs, As): W = add(W, scale(A, r))
    P = add(C, [0] + power(L, n+1))
    return n, C, A0, As, W, P

def forest_poly(adj, removed=()):
    gone = set(removed)
    seen = set(gone)
    total = [1]
    for start in range(len(adj)):
        if start in seen: continue
        parent = {start: None}
        order = [start]
        seen.add(start)
        for v in order:
            for u in adj[v]:
                if u not in seen:
                    seen.add(u); parent[u] = v; order.append(u)
        dp0, dp1 = {}, {}
        for v in reversed(order):
            children = [u for u in adj[v] if parent.get(u) == v]
            no = [1]
            yes = [0, 1]
            for u in children:
                no = mul(no, add(dp0[u], dp1[u]))
                yes = mul(yes, dp0[u])
            dp0[v], dp1[v] = no, yes
        total = mul(total, add(dp0[start], dp1[start]))
    return total

def literal_graph(rs):
    # Vertices 0-1-2, then branch centers and their private tips.
    nverts = 3 + len(rs) + sum(rs)
    adj = [set() for _ in range(nverts)]
    def edge(a,b): adj[a].add(b); adj[b].add(a)
    edge(0,1); edge(1,2)
    centers, tip_lists = [], []
    nxt = 3
    for r in rs:
        c = nxt; nxt += 1; centers.append(c); edge(0,c)
        tips=[]
        for _ in range(r):
            t=nxt; nxt+=1; tips.append(t); edge(c,t)
        tip_lists.append(tips)
    return adj, tip_lists

def scan_worker_case(max_m=18):
    profiles=individual=weighted=0
    for a2 in range(max_m+1):
      for a3 in range(max_m-a2+1):
       for a4 in range(max_m-a2-a3+1):
        if a2+a3+a4 == 0: continue
        rs=[2]*a2+[3]*a3+[4]*a4
        n,C,A0,As,W,P=formula(rs); profiles+=1
        for k in range(1,(n+2)//2+1):
            if 2*k > n+2: continue
            for A in As:
                individual += 1
                assert at(A,k)*at(C,k)-at(A,k+1)*at(C,k-1) >= 0
            weighted += 1
            assert at(W,k)*at(C,k)-at(W,k+1)*at(C,k-1) >= 0
    return {'max_branches':max_m,'profiles':profiles,'individual_comparisons':individual,'weighted_comparisons':weighted,'all_margins_nonnegative':True}

def literal_check():
    rs=[2,3,4]
    n,C,A0,As,W,P=formula(rs)
    adj,tips=literal_graph(rs)
    parent=forest_poly(adj)
    endpoint_deleted=forest_poly(adj,[2])
    tip_deleted=[forest_poly(adj,[ts[0]]) for ts in tips]
    return {'profile':[1,1,1], 'parent_formula_equals_literal':parent==P,
            'endpoint_A0_equals_literal_delete_v2':endpoint_deleted==A0,
            'each_tip_Ai_equals_literal_delete':tip_deleted==As,
            'parent_degree':len(P)-1,'literal_tree_vertices':len(adj)}

def bridge_and_boundary():
    rs=[3]*22
    n,C,A0,As,W,P=formula(rs)
    x=next(k for k in range(len(P)) if at(P,k+1)-at(P,k)<0)
    alpha=n+2
    p=34
    guard={'x_plus_2_le_p':x+2<=p,'3p_lt_2alpha_plus1':3*p<2*alpha+1,'2p_le_alpha':2*p<=alpha}
    assert all(guard.values())
    # Cross-multiply the weighted LR at actual p; denominators W[p], C[p-1] are positive.
    wm=at(W,p)*at(C,p)-at(W,p+1)*at(C,p-1)
    assert wm >= 0 and at(W,p)>0 and at(C,p-1)>0 and at(C,p)>0
    ratio_lhs_num=at(W,p+1); ratio_rhs_num=at(C,p); ratio_den_l=at(W,p); ratio_den_r=at(C,p-1)
    assert ratio_lhs_num*ratio_den_r <= ratio_rhs_num*ratio_den_l
    # Strict descent of C at x is checked directly; then log concavity gives monotone ratios.
    cx_drop=at(C,x+1)-at(C,x)
    assert cx_drop < 0
    assert at(C,p)*at(C,x) <= at(C,p-1)*at(C,x+1)
    dw=at(W,p+1)-at(W,p)
    assert dw < 0
    maxk=(n+2)//2
    sample=[]
    for k in (1,17,maxk):
        im=min(at(A,k)*at(C,k)-at(A,k+1)*at(C,k-1) for A in As)
        mm=at(W,k)*at(C,k)-at(W,k+1)*at(C,k-1)
        sample.append({'k':k,'individual_min_margin':im,'weighted_margin':mm})
    selected=sum(at(A,p+1)-at(A,p)<0 for A in As)
    assert selected==22
    return {'profile':[0,22,0],'N':n,'alpha':alpha,'actual_first_strict_descent_x':x,'p':p,'guards':guard,
            'Delta_x_C':cx_drop,'weighted_shifted_margin_at_p':wm,'Delta_p_W':dw,
            'ratio_cross_multiply_lhs_le_rhs':True,'weighted_tip_strict_count':selected,
            'boundary_and_interior_margins':sample,'nontrivial_factors_positive':{'W[p]':at(W,p),'C[p-1]':at(C,p-1),'C[p]':at(C,p)}}

def unguarded_control():
    rs=[2]*38+[4]
    n,C,A0,As,W,P=formula(rs)
    r4_index=len(rs)-1; A=As[r4_index]; k=77
    x=next(k0 for k0 in range(len(P)) if at(P,k0+1)-at(P,k0)<0)
    margin=at(A,k)*at(C,k)-at(A,k+1)*at(C,k-1)
    return {'profile':[38,0,1],'N':n,'tree_order':len(rs)+3+n,'actual_first_strict_descent_x':x,'comparison_k':k,
            '2k_le_Nplus2':2*k<=n+2,'A_k':at(A,k),'A_kplus1':at(A,k+1),'C_k':at(C,k),'C_kminus1':at(C,k-1),
            'signed_shifted_margin':margin}

if __name__ == '__main__':
    out={'bounded_replay':scan_worker_case(),'literal_tree_crosscheck':literal_check(),'bridge_exact_checks':bridge_and_boundary(),
         'known_unguarded_control':unguarded_control(),
         'method':'integer coefficient multiplication, zero extension, and rooted-forest independent-set dynamic programming'}
    Path('independent_critique.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps(out,indent=2))
