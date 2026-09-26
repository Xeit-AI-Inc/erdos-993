"""Independent literal-mask probe of all labeled trees through order 7.
No imported evaluator is used. Run with Python 3: python3 REPLAY.py.
"""
from itertools import product
import random
import json
from pathlib import Path

OUT = Path(__file__).with_name('EVIDENCE.json')

def tree_edges(n, code):
    deg = [1] * n
    for v in code: deg[v] += 1
    edges = []
    for v in code:
        leaf = next(i for i,d in enumerate(deg) if d == 1)
        edges.append((leaf,v)); deg[leaf] -= 1; deg[v] -= 1
    a,b = [i for i,d in enumerate(deg) if d == 1]
    edges.append((a,b))
    return tuple(sorted(tuple(sorted(e)) for e in edges))

def adjacency(n, edges):
    a = [0] * n
    for u,v in edges:
        a[u] |= 1 << v; a[v] |= 1 << u
    return a

def poly(n, adj, removed=0):
    # Literal subset enumeration; zero coefficients outside the retained vertex set.
    kept = ((1 << n) - 1) & ~removed
    out = [0] * (n + 1)
    sub = kept
    while True:
        independent = True
        bits = sub
        while bits:
            bit = bits & -bits; v = bit.bit_length()-1; bits -= bit
            if adj[v] & sub:
                independent = False; break
        if independent: out[sub.bit_count()] += 1
        if sub == 0: break
        sub = (sub - 1) & kept
    while len(out) > 1 and out[-1] == 0: out.pop()
    return out

def coeff(p,j): return p[j] if 0 <= j < len(p) else 0
def delta(p,j): return coeff(p,j+1)-coeff(p,j)
def first_descent(p):
    # Include the last nonzero rank, where the next zero-extended coefficient is tested.
    for j in range(len(p)):
        if delta(p,j) < 0: return j
    return None

def forest_poly(n, adj, removed=0):
    """Separate tree-DP count method for larger sampled trees."""
    kept = ((1 << n) - 1) & ~removed
    seen = 0
    result = [1]
    def add(a,b):
        c=[0]*max(len(a),len(b))
        for i,x in enumerate(a): c[i]+=x
        for i,x in enumerate(b): c[i]+=x
        return c
    def mul(a,b):
        c=[0]*(len(a)+len(b)-1)
        for i,x in enumerate(a):
            for j,y in enumerate(b): c[i+j]+=x*y
        return c
    def visit(v,parent):
        nonlocal seen
        seen |= 1<<v
        no=[1]; yes=[0,1]
        nbrs=adj[v]&kept
        while nbrs:
            bit=nbrs&-nbrs; w=bit.bit_length()-1; nbrs-=bit
            if w==parent: continue
            child_no,child_yes=visit(w,v)
            no=mul(no,add(child_no,child_yes)); yes=mul(yes,child_no)
        return no,yes
    while kept & ~seen:
        bit=(kept & ~seen)&-(kept & ~seen); root=bit.bit_length()-1
        no,yes=visit(root,-1); result=mul(result,add(no,yes))
    while len(result)>1 and result[-1]==0: result.pop()
    return result

def whole_tree_poly_from_root(n, adj, root):
    """Independent-root entry point for checking the recurrence boundary."""
    def add(a,b):
        c=[0]*max(len(a),len(b))
        for i,x in enumerate(a): c[i]+=x
        for i,x in enumerate(b): c[i]+=x
        return c
    def mul(a,b):
        c=[0]*(len(a)+len(b)-1)
        for i,x in enumerate(a):
            for j,y in enumerate(b): c[i+j]+=x*y
        return c
    def rec(v,parent):
        no=[1]; yes=[0,1]
        nbrs=adj[v]
        while nbrs:
            bit=nbrs&-nbrs; w=bit.bit_length()-1; nbrs-=bit
            if w==parent: continue
            cn,cy=rec(w,v); no=mul(no,add(cn,cy)); yes=mul(yes,cn)
        return no,yes
    no,yes=rec(root,-1)
    return add(no,yes)

def sampled_probe():
    rng=random.Random(20260926)
    counts={}; examples=[]; changed=None; shared=None; eligible_audit=[]
    for n in range(16,61):
        eligible_rows=proper_rows=0
        for sample in range(40):
            code=tuple(rng.randrange(n) for _ in range(n-2))
            edges=tree_edges(n,code); adj=adjacency(n,edges)
            P=forest_poly(n,adj); a=len(P)-1; x=first_descent(P)
            if x is None: continue
            leaves=[v for v in range(n) if adj[v].bit_count()==1]
            supports={v:(adj[v]&-adj[v]).bit_length()-1 for v in leaves}
            selectors={}; maxp=(2*a)//3
            for p in range(x+2,maxp+1):
                F=[v for v in leaves if delta(forest_poly(n,adj,1<<v),p)<0]
                selectors[p]=F
                if not F: continue
                eligible_rows+=1
                if len(F)<len(leaves): proper_rows+=1
                if shared is None:
                    for s in set(supports.values()):
                        vs=[v for v in F if supports[v]==s]
                        if len(vs)>1:
                            shared={'n':n,'edges':[list(e) for e in edges],'alpha':a,'x':x,'p':p,'F':F,'support':s,'same_support_leaves':vs}
                            break
                summands=[]
                for v in F:
                    s=supports[v]; H=forest_poly(n,adj,(1<<v)|(1<<s)); R=forest_poly(n,adj,(1<<s)|adj[s])
                    summands.append({'leaf':v,'support':s,'term':delta(H,p-1)-delta(R,p-1),
                                     'H_delta':delta(H,p-1),'R_delta':delta(R,p-1),
                                     'deletion_delta_p':delta(forest_poly(n,adj,1<<v),p)})
                eligible_audit.append({'n':n,'sample_index':sample,'prufer_code':list(code),'alpha':a,'x':x,'p':p,
                                       'original_leaves':leaves,'F':F,'proper_selector':len(F)<len(leaves),
                                       'summands':summands,'S':sum(z['term'] for z in summands)})
                if len(examples)<12:
                    examples.append({'n':n,'edges':[list(e) for e in edges],'alpha':a,'x':x,'p':p,
                                     'tree_polynomial':P,'F':F,'original_leaves':leaves,
                                     'proper_selector':len(F)<len(leaves),'summands':summands,
                                     'S':sum(z['term'] for z in summands)})
            ps=sorted(selectors)
            for p0,p1 in zip(ps,ps[1:]):
                if selectors[p0]!=selectors[p1] and changed is None:
                    changed={'n':n,'edges':[list(e) for e in edges],'alpha':a,'x':x,'p0':p0,'F0':selectors[p0],
                             'p1':p1,'F1':selectors[p1],'polynomial':P}
        counts[str(n)]={'seeded_prufer_samples':40,'eligible_parameter_rows':eligible_rows,'proper_selector_rows':proper_rows}
    return counts,examples,changed,shared,eligible_audit

def run():
    per_order = {}
    examples = []
    selector_change = None
    shared_support = None
    total_trees = total_eligible = proper_rows = 0
    for n in range(2,8):
        tree_count=eligible_count=proper_count=0
        for code in product(range(n), repeat=n-2):
            edges=tree_edges(n,code); adj=adjacency(n,edges); tree_count+=1; total_trees+=1
            P=poly(n,adj); a=len(P)-1; x=first_descent(P)
            if x is None: continue
            leaves=[v for v in range(n) if adj[v].bit_count()==1]
            supports={v:(adj[v]&-adj[v]).bit_length()-1 for v in leaves}
            maxp=(2*a)//3 # strict 3p < 2a+1 iff p <= floor(2a/3)
            favorable_by_p={}
            for p in range(x+2,maxp+1):
                F=[]
                for v in leaves:
                    if delta(poly(n,adj,1<<v),p)<0: F.append(v)
                favorable_by_p[p]=F
                if not F: continue
                eligible_count+=1; total_eligible+=1
                if len(F)<len(leaves): proper_count+=1; proper_rows+=1
                if shared_support is None:
                    fibers={s:[v for v in F if supports[v]==s] for s in set(supports.values())}
                    for s,vs in fibers.items():
                        if len(vs)>1:
                            shared_support={'n':n,'edges':[list(e) for e in edges],'alpha':a,'x':x,'p':p,'F':F,'support':s,'same_support_leaves':vs}
                            break
                if len(examples)<8:
                    summands=[]
                    for v in F:
                        s=supports[v]
                        H=poly(n,adj,(1<<v)|(1<<s))
                        closed=(1<<s)|adj[s]
                        R=poly(n,adj,closed)
                        term=delta(H,p-1)-delta(R,p-1)
                        summands.append({'leaf':v,'support':s,'term':term,
                                         'H_delta':delta(H,p-1),'R_delta':delta(R,p-1),
                                         'deletion_delta_p':delta(poly(n,adj,1<<v),p)})
                    examples.append({'n':n,'edges':[list(e) for e in edges],'alpha':a,'x':x,'p':p,
                                     'tree_polynomial':P,'F':F,'original_leaves':leaves,
                                     'proper_selector':len(F)<len(leaves),'summands':summands,
                                     'S':sum(z['term'] for z in summands)})
            ps=sorted(favorable_by_p)
            for p0,p1 in zip(ps,ps[1:]):
                if favorable_by_p[p0]!=favorable_by_p[p1] and selector_change is None:
                    selector_change={'n':n,'edges':[list(e) for e in edges],'alpha':a,'x':x,
                                     'p0':p0,'F0':favorable_by_p[p0],
                                     'p1':p1,'F1':favorable_by_p[p1],
                                     'polynomial':P}
        per_order[str(n)]={'labeled_trees':tree_count,'eligible_tree_parameter_rows':eligible_count,
                           'proper_selector_rows':proper_count}
    sampled,large_examples,large_change,large_shared,eligible_audit=sampled_probe()
    root_row=large_examples[0]
    root_adj=adjacency(root_row['n'],[tuple(e) for e in root_row['edges']])
    root_checks=[{'root':v,'root_is_leaf':root_adj[v].bit_count()==1,
                  'polynomial_matches':whole_tree_poly_from_root(root_row['n'],root_adj,v)==root_row['tree_polynomial']}
                 for v in range(root_row['n'])]
    data={'method':'literal independent-set mask enumeration on every vertex subset for exhaustive small orders; separately coded include/exclude tree DP for seeded larger Prüfer samples; no imported evaluator',
          'boundary':'all labeled trees of orders 2 through 7 plus 40 seeded Prüfer samples at each order 16 through 60; every integer p satisfying x+2<=p and 3p<2 alpha+1; no universal inference',
          'per_order':per_order,'totals':{'labeled_trees':total_trees,'eligible_tree_parameter_rows':total_eligible,
                                          'proper_selector_rows':proper_rows},
          'seeded_sample_per_order':sampled,'selector_change_example':selector_change or large_change,
          'shared_support_example':shared_support or large_shared,'sample_rows':examples+large_examples,
          'all_seeded_eligible_rows':eligible_audit,
          'root_boundary_check':{'tree_edges':root_row['edges'],'roots_checked':len(root_checks),
                                 'leaf_roots_checked':sum(r['root_is_leaf'] for r in root_checks),
                                 'all_root_polynomials_match':all(r['polynomial_matches'] for r in root_checks),
                                 'per_root':root_checks}}
    OUT.write_text(json.dumps(data,indent=2,sort_keys=True)+'\n')
    print(json.dumps(data,indent=2,sort_keys=True))

if __name__=='__main__': run()
