"""Independent finite audit of the two pinned orbit-flow outputs.

Reads only the brief's listed sources. Writes independent-evidence.json here.
Does not import or execute either producer script or the ordinary evaluator.
"""

from __future__ import annotations

from collections import Counter, defaultdict
from hashlib import sha256
from math import comb, factorial
from pathlib import Path
import json

ROOT = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25')
HERE = Path(__file__).resolve().parent
BRIEF = json.loads((ROOT / 'control/C2-PREP-ORBIT-AUDIT.json').read_text())


def ck(test, message):
    if not test:
        raise AssertionError(message)


def add(a, b):
    out = [0] * max(len(a), len(b))
    for j, v in enumerate(a): out[j] += v
    for j, v in enumerate(b): out[j] += v
    return out


def sub(a, b):
    out = [0] * max(len(a), len(b))
    for j, v in enumerate(a): out[j] += v
    for j, v in enumerate(b): out[j] -= v
    return out


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for j, x in enumerate(a):
        for k, y in enumerate(b): out[j+k] += x*y
    return out


def power(a, n):
    out = [1]
    for _ in range(n): out = mul(out, a)
    return out


def coef(a, j):
    return a[j] if 0 <= j < len(a) else 0


def delta(a, j):
    return coef(a, j+1)-coef(a, j)


def descent(a):
    return next((j for j in range(len(a)) if delta(a, j) < 0), None)


def graph(m):
    n = 4*m+3
    edges = [(0,1),(1,2)]
    for i in range(m):
        c = 3+4*i
        edges.append((0,c))
        edges.extend((c,c+j) for j in (1,2,3))
    adj = [set() for _ in range(n)]
    for u,v in edges: adj[u].add(v);adj[v].add(u)
    return edges,adj


def vectors(m):
    C = [1,4,3,1]
    L = [1,1]
    Cm, Cm1 = power(C,m),power(C,m-1)
    L3m,L3m1,L3mplus = power(L,3*m),power(L,3*m-1),power(L,3*m+1)
    T = add(mul([1,2],Cm),mul([0,1],L3mplus))
    special_D = add(mul([1,1],Cm),mul([0,1],L3m))
    special_H = add(Cm,mul([0,1],L3m))
    special_R = Cm
    claw_D = add(mul(mul([1,2],[1,3,1]),Cm1),mul([0,1],L3m))
    claw_H = add(mul(mul([1,2],power(L,2)),Cm1),mul([0,1],L3m))
    claw_R = mul([1,2],Cm1)
    return T, (special_D,special_H,special_R), (claw_D,claw_H,claw_R)


def row_and_full(m,p,full):
    edges,adj = graph(m)
    poly, special,claw = vectors(m)
    ck(full['edges']==[list(x) for x in sorted(edges)],f'edges {m}')
    ck(full['polynomial']==poly,f'polynomial {m}')
    x=descent(poly); alpha=len(poly)-1
    ck(full['x']==x and full['alpha']==alpha,f'x alpha {m}')
    ck(x+2<=p and 3*p<2*alpha+1,f'eligibility {m}')
    leaves=[v for v in range(len(adj)) if len(adj[v])==1]
    stored={r['leaf']:r for r in full['leaf_records']}
    ck(set(stored)==set(leaves),f'leaf records {m}')
    favored=[]; summands=[]
    for v in leaves:
        s=next(iter(adj[v])); D,H,R = special if v==2 else claw
        rec=stored[v]
        closed={s}|adj[s]
        ck(rec['support']==s and rec['closed_neighborhood']==sorted(closed),f'closed {m},{v}')
        ck(rec['deleted_leaf_polynomial']==D and rec['h_polynomial']==H and rec['r_polynomial']==R,f'vectors {m},{v}')
        if delta(D,p)<0:
            favored.append(v)
            witness=sorted(adj[s]-{v})
            cr=coef(H,p)-coef(R,p)
            prev=coef(H,p-1)-coef(R,p-1)
            summands.append(dict(leaf=v,support=s,witness_vertices=witness,
                                 h_order=len(adj)-2,r_order=len(adj)-len(closed),
                                 c_rank=cr,c_previous=prev,g=cr-prev,
                                 pointwise_delta=delta(D,p)))
    aggregate=sum(v['g'] for v in summands)
    ck(full['favorable_leaves']==favored and full['aggregate']==aggregate,f'full selector {m}')
    return dict(order=len(adj),rank=p,alpha=alpha,first_strict_descent=x,
                favorable_leaves=favored,favorable_count=len(favored),
                summands=summands,aggregate=aggregate), poly


def orbit_layer(m,rank):
    # A claw has types E,C,S,P,T of sizes 0,1,1,2,3.
    out={}
    for root in (0,1):
        for special in ((0,2) if root else (0,1,2)):
            available=rank-root-int(special!=0)
            if available<0: continue
            for t in range(min(m,available//3)+1):
                for p in range(min(m-t,(available-3*t)//2)+1):
                    r=available-3*t-2*p
                    for c in ((0,) if root else range(r+1)):
                        s=r-c;e=m-c-s-p-t
                        if e<0: continue
                        state=(root,special,e,c,s,p,t)
                        mult=factorial(m)//(factorial(e)*factorial(c)*factorial(s)*factorial(p)*factorial(t))
                        mult*=3**(s+p)
                        out[state]=mult
    return out


def wt(state):
    root,special,e,c,s,p,t=state
    return (int(special==2)+s+2*p+3*t) if root else 2*p+3*t


def adjacency(state, switch):
    root,special,e,c,s,p,t=state
    z=(e,c,s,p,t)
    out=set()
    if root: out.add((0,special,*z))
    if special: out.add((root,0,*z))
    for before,after in ((1,0),(2,0),(3,2),(4,3)):
        if z[before]:
            q=list(z);q[before]-=1;q[after]+=1
            out.add((root,special,*q))
    if switch:
        # Insert a claw center: exactly two occupied graph neighbors.
        if not root and p:
            out.add((0,special,e,c+1,s,p-1,t))
        if root and s:
            out.add((0,special,e,c+1,s-1,p,t))
        # Insert the distinguished support.
        if root and special==2:
            out.add((0,1,*z))
        # Insert root, removing exactly two occupied neighboring centers/support.
        if not root and c+int(special==1)==2:
            out.add((1,0 if special==1 else special,e+c,0,s,p,t))
    return out


def audit_artifact(m,p,kind,expected_row,poly):
    rel='orbit-flow-twoforone' if kind=='switch' else 'orbit-flow'
    path=ROOT/f'instruments/{rel}/m{m}-p{p}.json'
    art=json.loads(path.read_text())
    ck(art['graph_row']==expected_row,f'graph row {rel},{m}')
    U=orbit_layer(m,p+1);L=orbit_layer(m,p)
    ck(len(U)==art['upper_states'] and len(L)==art['lower_states'],f'layer states {rel},{m}')
    ck(sum(U.values())==coef(poly,p+1) and sum(L.values())==coef(poly,p),f'layer totals {rel},{m}')
    fav=set(expected_row['favorable_leaves'])
    ck(fav==set([2]+[3+4*i+j for i in range(m) for j in (1,2,3)]),f'all selected {m}')
    ucap={s:n*wt(s) for s,n in U.items()};lcap={s:n*wt(s) for s,n in L.items()}
    supply=sum(ucap.values());capacity=sum(lcap.values())
    ck((supply,capacity)==(art['upper_supply'],art['lower_capacity']),f'supply capacity {rel},{m}')
    ck(supply-capacity==expected_row['aggregate'],f'weighted identity {rel},{m}')
    switch=kind=='switch';arc_count=0
    for s in U:
        ns=adjacency(s,switch)
        ck(ns<=L.keys(),f'bad lower rank {rel},{m},{s}')
        arc_count+=len(ns)
    field='transport_orbit_arcs' if switch else 'deletion_orbit_arcs'
    ck(arc_count==art[field],f'all adjacency {rel},{m}')
    outgoing=defaultdict(int);incoming=defaultdict(int);seen=set()
    for raw_s,raw_t,f in art['positive_flow_arcs']:
        s=tuple(raw_s);t=tuple(raw_t)
        ck(s in U and t in L and f>0 and t in adjacency(s,switch),f'bad positive arc {rel},{m}')
        ck((s,t) not in seen,f'duplicate arc {rel},{m}')
        seen.add((s,t));outgoing[s]+=f;incoming[t]+=f
    ck(all(outgoing[s]<=ucap[s] for s in U),f'upper capacity {rel},{m}')
    ck(all(incoming[t]<=lcap[t] for t in L),f'lower capacity {rel},{m}')
    flow=sum(outgoing.values())
    ck(flow==sum(incoming.values())==art['flow'],f'conservation {rel},{m}')
    ck((flow==supply)==art['saturates'],f'saturation {rel},{m}')
    cut={tuple(x) for x in art['cut_upper_states']}
    ck(cut<=U.keys(),f'cut states {rel},{m}')
    nbr=set()
    for s in cut: nbr.update(adjacency(s,switch))
    deficit=sum(ucap[s] for s in cut)-sum(lcap[t] for t in nbr)
    ck(deficit==art['cut_deficit']==supply-flow,f'cut primal dual {rel},{m}')
    ck(art['evidence_grade']=='bounded_computation' and art['formal_award'] is False,f'grade {rel},{m}')
    return dict(instrument=rel,m=m,p=p,upper_states=len(U),lower_states=len(L),all_orbit_arcs=arc_count,
                positive_flow_arcs=len(seen),supply=supply,capacity=capacity,flow=flow,
                cut_upper_states=len(cut),cut_lower_neighbors=len(nbr),cut_source=sum(ucap[s] for s in cut),
                cut_neighbor_capacity=sum(lcap[t] for t in nbr),cut_deficit=deficit,
                cut_states_sha256=sha256(json.dumps(art['cut_upper_states'],separators=(',',':')).encode()).hexdigest(),
                cut_neighbors_sha256=sha256(json.dumps(sorted(nbr),separators=(',',':')).encode()).hexdigest(),
                cut_center_counts=dict(sorted(Counter(s[3] for s in cut).items())),
                cut_root_counts=dict(sorted(Counter(s[0] for s in cut).items())))


def center_free(m,p):
    # Root absent: a weighted occupied claw contributes 6z^2+3z^3.
    # Root present: distinguished and claw leaves give 3m+1 available leaves.
    a=mul(mul([0,0,6*m,3*m],power([1,1],3*m-3)),[1,2])
    b=mul([0,0,3*m+1],power([1,1],3*m))
    W=add(a,b)
    deficit=coef(W,p+1)-coef(W,p)
    source=coef(W,p+1);neighbor=coef(W,p)
    return dict(source=source,neighbor=neighbor,deficit=deficit,
                formula_terms=[m*(6*(comb(3*m-3,p-1)-comb(3*m-3,p-2))
                    +15*(comb(3*m-3,p-2)-comb(3*m-3,p-3))
                    +6*(comb(3*m-3,p-3)-comb(3*m-3,p-4))),
                    (3*m+1)*(comb(3*m,p-1)-comb(3*m,p-2))])


def smoke_independent():
    # Literal graph enumeration, independent of the producer's smoke.py.
    results=[]
    for m in (1,2,3):
        edges,adj=graph(m);n=len(adj)
        observed=defaultdict(set);counts=Counter()
        for mask in range(1<<n):
            A={v for v in range(n) if mask>>v&1}
            if any(u in A and v in A for u,v in edges):continue
            def state(B):
                z=[0]*5
                for i in range(m):
                    c=3+4*i
                    if c in B:typ=1
                    else:
                        q=sum(c+j in B for j in (1,2,3))
                        typ=0 if q==0 else q+1
                    z[typ]+=1
                return (int(0 in B),1 if 1 in B else 2 if 2 in B else 0,*z)
            s=state(A);counts[s]+=1
            for v in A:observed[s].add(state(A-{v}))
            for v in range(n):
                if v in A:continue
                occupied=adj[v]&A
                if len(occupied)==2:
                    B=(A-occupied)|{v}
                    ck(len(B)==len(A)-1 and not any(u in B and w in B for u,w in edges),f'smoke rule {m}')
                    observed[s].add(state(B))
        all_orbits={s:mult for rank in range(n+1) for s,mult in orbit_layer(m,rank).items()}
        ck(counts==all_orbits,f'smoke mult {m}')
        ck(all(observed[s]==adjacency(s,True) for s in counts),f'smoke adjacency {m}')
        results.append(dict(m=m,independent_sets=sum(counts.values()),orbits=len(counts)))
    return results


def check_saved_summaries(cases, smoke):
    by_key={(x['instrument'],x['m'],x['p']):x for x in cases}
    for rel in ('orbit-flow','orbit-flow-twoforone'):
        summary=json.loads((ROOT/f'instruments/{rel}/RESULTS.json').read_text())
        ck(len(summary['results'])==3 and summary['formal_award'] is False,f'summary scope {rel}')
        for item in summary['results']:
            m,p=item['m'],item['p'];case=by_key[rel,m,p]
            ck(item['upper_states']==case['upper_states'] and item['lower_states']==case['lower_states'],f'summary states {rel},{m}')
            ck(item['upper_supply']==case['supply'] and item['lower_capacity']==case['capacity'],f'summary weights {rel},{m}')
            ck(item['flow']==case['flow'] and item['cut_deficit']==case['cut_deficit'],f'summary flow {rel},{m}')
            field='transport_orbit_arcs' if rel.endswith('twoforone') else 'deletion_orbit_arcs'
            ck(item[field]==case['all_orbit_arcs'] and item['saturates']==(case['flow']==case['supply']),f'summary arcs {rel},{m}')
            source=ROOT/f'instruments/{rel}/{item["artifact"]}'
            ck(source.name==f'm{m}-p{p}.json' and sha256(source.read_bytes()).hexdigest()==item['sha256'],f'summary artifact hash {rel},{m}')
    prior=json.loads((ROOT/'instruments/orbit-flow-twoforone/SMOKE.json').read_text())['bounded_checks']
    ck([(x['m'],x['independent_sets'],x['orbits']) for x in prior]
       ==[(x['m'],x['independent_sets'],x['orbits']) for x in smoke], 'saved smoke counts')


def main():
    for item in BRIEF['allowed_source_files']:
        actual=sha256((ROOT/item['path']).read_bytes()).hexdigest()
        ck(actual==item['sha256'],f'hash {item["path"]}')
    full=json.loads((ROOT/'instruments/orbit-flow/FULL-POLYNOMIALS.json').read_text())
    rows={(x['m'],x['p']):x for x in full['rows']}
    findings=[];center=[]
    for m,p in ((22,34),(60,90),(66,98)):
        row,poly=row_and_full(m,p,rows[m,p])
        for kind in ('deletion','switch'):
            findings.append(audit_artifact(m,p,kind,row,poly))
        center.append(dict(m=m,p=p,**center_free(m,p)))
    smoke=smoke_independent()
    check_saved_summaries(findings,smoke)
    out=dict(status='all_assertions_passed',source_hashes_verified=len(BRIEF['allowed_source_files']),
             methods=['closed-form polynomial vectors','combinatorial orbit enumeration',
                      'literal small-graph move enumeration','saved-primal and exact-cut validation'],
             cases=findings,center_free=center,smoke=smoke)
    (HERE/'independent-evidence.json').write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
    print(json.dumps(dict(status=out['status'],cases=[(x['instrument'],x['m'],x['cut_deficit']) for x in findings],
                          center_free=center,smoke=smoke),indent=2))


if __name__=='__main__':main()
