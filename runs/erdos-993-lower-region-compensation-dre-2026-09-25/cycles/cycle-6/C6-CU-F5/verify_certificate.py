import json
from pathlib import Path
D=json.loads(Path('EVIDENCE.json').read_text())
for z in D['profiles']:
    n=z['n']; edges=z['tree_edges']; adj=[0]*n
    for a,b in edges:
        adj[a]|=1<<b; adj[b]|=1<<a
    row=z['eligible_ranks'][0]; p=row['p']; F=set(row['F'])
    assert z['alpha']==len(z['tree_poly'])-1
    x=next(j for j in range(len(z['tree_poly'])) if (z['tree_poly'][j+1] if j+1<len(z['tree_poly']) else 0)-z['tree_poly'][j]<0)
    assert x==z['x'] and x+2<=p and 3*p<2*z['alpha']+1
    upper={}; lower={}
    # Enumerate all masks and retain positive fixed-tag weights on the two ranks.
    for mask in range(1<<n):
        if any((mask>>v&1) and adj[v]&mask for v in range(n)): continue
        rank=mask.bit_count(); w=sum(mask>>v&1 for v in F)
        if rank==p+1 and w: upper[mask]=w
        if rank==p and w: lower[mask]=w
    assert len(upper)==row['upper_set_count'] and len(lower)==row['lower_set_count']
    assert sum(upper.values())==row['upper_supply'] and sum(lower.values())==row['lower_capacity']
    out={}; inc={}
    for I,J,amt in row['positive_flow_arcs']:
        assert I in upper and J in lower and amt>0 and J.bit_count()==p
        # Literal deletion or insertion of an absent vertex with exactly two selected neighbors.
        ok=(I.bit_count()-J.bit_count()==1 and J&I==J and (I^J).bit_count()==1)
        if not ok:
            for s in range(n):
                ns=adj[s]&I
                if not (I>>s&1) and ns.bit_count()==2 and (I&~ns)|(1<<s)==J:
                    ok=True; break
        assert ok,(z['profile'],I,J)
        out[I]=out.get(I,0)+amt; inc[J]=inc.get(J,0)+amt
    assert all(q<=upper[I] for I,q in out.items())
    assert all(q<=lower[J] for J,q in inc.items())
    assert sum(out.values())==sum(inc.values())==row['flow']==row['upper_supply']
    assert row['cut_deficit']==0
    assert sum(t['term'] for t in row['terms'])==row['S']
    print({'profile':z['profile'],'upper_nodes':len(upper),'lower_nodes':len(lower),'positive_arcs':len(row['positive_flow_arcs']),'flow':sum(out.values()),'supply':sum(upper.values()),'capacity':sum(lower.values()),'S':row['S'],'guards':'pass','literal_arc_feasibility':'pass'})
