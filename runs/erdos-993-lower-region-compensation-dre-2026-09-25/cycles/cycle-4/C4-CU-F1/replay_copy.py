#!/usr/bin/env python3
"""Exact labeled-Pruefer bounded search for C4-F1; Python standard library only."""
from itertools import product
import random
import json
from pathlib import Path

OUT = Path(__file__).with_name('EVIDENCE.json')
MIN_N = 8
MAX_N = 16
SAMPLES_PER_ORDER = 200
SEED = 993041

def prufer_edges(n, code):
    deg = [1] * n
    for x in code: deg[x] += 1
    edges=[]
    for x in code:
        leaf=next(i for i,d in enumerate(deg) if d==1)
        edges.append((leaf,x)); deg[leaf]-=1; deg[x]-=1
    a=[i for i,d in enumerate(deg) if d==1]
    edges.append((a[0],a[1]))
    return edges

def independent_data(n, edges):
    adj=[0]*n
    for a,b in edges: adj[a]|=1<<b; adj[b]|=1<<a
    inds=[]; counts=[0]*(n+2); deleted=[[0]*(n+2) for _ in range(n)]; is_ind=[False]*(1<<n); is_ind[0]=True
    for m in range(1<<n):
        bit=m & -m; v=bit.bit_length()-1; rest=m^bit
        if (adj[v] & rest)==0 and is_ind[rest]:
            # m is independent iff rest independent and v has no neighbor in rest
            is_ind[m]=True; inds.append(m); j=m.bit_count(); counts[j]+=1
            absent=((1<<n)-1)^m
            while absent:
                b=absent & -absent; absent-=b
                deleted[b.bit_length()-1][j]+=1
    return adj, inds, counts, deleted

def poly_on(inds, n, removed):
    rc=[0]*(n+2)
    for m in inds:
        if m & removed == 0: rc[m.bit_count()]+=1
    return rc

def deltas(c):
    return [c[j+1]-c[j] for j in range(len(c)-1)]

def first_descent(ds):
    return next((j for j,d in enumerate(ds) if d<0), None)

def run():
    totals={}; eligible=0; proper_total=0
    rng=random.Random(SEED)
    for n in range(MIN_N,MAX_N+1):
        codes=[tuple(rng.randrange(n) for _ in range(n-2)) for _ in range(SAMPLES_PER_ORDER)]
        # Add four exact shape-biased words per order: endpoint-heavy, alternating hubs, and two separated hubs.
        if n>=4:
            codes += [tuple([0]*(n-2)), tuple([n//2]*(n-2)), tuple(i%2 for i in range(n-2)), tuple((i//2)%max(2,n//3) for i in range(n-2))]
        labeled=0; eligible_n=0; proper_n=0; best=None; best_margin=None; feasible_encodings=0; eligible_rows_data=[]; profiles=set(); max_degree_seen=0; branched4=0; leaf_min=n; leaf_max=0
        for code in codes:
            labeled+=1; edges=prufer_edges(n,code)
            deg=[0]*n
            for a,b in edges: deg[a]+=1; deg[b]+=1
            leaves=[v for v,d in enumerate(deg) if d==1]
            profiles.add(tuple(sorted(deg,reverse=True))); max_degree_seen=max(max_degree_seen,max(deg)); branched4 += (max(deg)>=4); leaf_min=min(leaf_min,len(leaves)); leaf_max=max(leaf_max,len(leaves))
            adj,inds,counts,deleted=independent_data(n,edges)
            a=max(j for j,c in enumerate(counts) if c)
            ds=deltas(counts); x=first_descent(ds)
            if x is None: continue
            pmax=(2*a)//3
            margin=pmax-(x+2)
            if margin>=0: feasible_encodings+=1
            candidate={'edges':[list(e) for e in edges],'alpha':a,'x':x,'pmax_strict':pmax,'eligibility_margin':margin,'leaves':leaves}
            if best_margin is None or margin>best_margin['eligibility_margin']: best_margin=candidate
            for p in range(x+2,n+1):
                if 3*p >= 2*a+1: continue
                F=[v for v in leaves if deleted[v][p+1]-deleted[v][p] < 0]
                eligible_n+=1
                if len(F)<len(leaves): proper_n+=1
                leaf_selector_tests=[{'leaf':v,'Delta_p_T_minus_v':deleted[v][p+1]-deleted[v][p],'selected':v in F} for v in leaves]
                summands=[]; qtotal=0; etotal=0; ctotal=0; utotal=0
                for v in F:
                    u=next(w for w in range(n) if adj[v]>>w&1)
                    Hrem=(1<<v)|(1<<u)
                    Rrem=Hrem|adj[u]
                    H=poly_on(inds,n,Hrem); R=poly_on(inds,n,Rrem)
                    k=p-1
                    q=H[k]-R[k]; up=H[k+1]-R[k+1]
                    # E counts actual addable vertices over marked independent k-sets in H.
                    E_v=0; C_v=0
                    for m in inds:
                        if m&Hrem or m.bit_count()!=k or not (m&adj[u]): continue
                        addable=sum(1 for w in range(n) if not (Hrem>>w&1) and not (m>>w&1) and not (adj[w]&m))
                        E_v+=addable
                    # C counts (k+1)-sets in H with >=2 vertices in W=N(u)-{v}.
                    W=adj[u] & ~(1<<v)
                    for m in inds:
                        if m&Hrem or m.bit_count()!=k+1: continue
                        if (m&W).bit_count()>=2: C_v+=1
                    term=(deltas(H)[k]-deltas(R)[k]) if k>=1 else 0
                    summands.append({'leaf':v,'support':u,'q':q,'U':up,'E':E_v,'C':C_v,'S_term':term})
                    qtotal+=q; utotal+=up; etotal+=E_v; ctotal+=C_v
                S=sum(z['S_term'] for z in summands)
                Dtotal=sum(2*(a-1-(p-1))*z['q']-z['E'] for z in summands)
                assert etotal==(p-1)*utotal+ctotal, (n,edges,p,'E=kU+C',etotal,(p-1)*utotal+ctotal)
                assert (p-1)*S==(2*a+1-3*p)*qtotal-Dtotal-ctotal, (n,edges,p,'specialization')
                row={'n':n,'edges':[list(e) for e in edges],'alpha':a,'x':x,'p':p,'leaves':leaves,'leaf_selector_tests':leaf_selector_tests,'F':F,'proper_selector':len(F)<len(leaves),'i':counts,'Delta':ds,'summands':summands,'Q':qtotal,'U':utotal,'E':etotal,'C':ctotal,'S':S,'CTx_gap':(x+1)*qtotal-etotal,'flat_gap':(x+1)*qtotal-etotal,'current_gap':(p-1)*qtotal-etotal,'target_gap':(p-1)*qtotal-etotal+ctotal}
                eligible_rows_data.append(row)
                if best is None or (row['proper_selector'] and not best['proper_selector']) or (row['proper_selector']==best['proper_selector'] and row['S']>best['S']): best=row
        totals[str(n)]={'labeled_prufer_codes':labeled,'eligible_rows':eligible_n,'proper_selector_rows':proper_n,'encodings_with_any_eligible_p':feasible_encodings,'distinct_degree_profiles':len(profiles),'max_degree_seen':max_degree_seen,'encodings_with_max_degree_at_least_4':branched4,'leaf_count_range':[leaf_min,leaf_max],'best_margin_row':best_margin,'best_row':best,'eligible_rows_data':eligible_rows_data}
        eligible+=eligible_n; proper_total+=proper_n
    result={'protocol':{'generator':'200 deterministic pseudorandom labeled Prüfer words per order n=8..16 using Python random.Random(993041), plus four stated shape-biased words per order: constant 0, constant floor(n/2), alternating 0/1, and paired residues modulo max(2,floor(n/3))','MAX_N':MAX_N,'MIN_N':MIN_N,'samples_per_order':SAMPLES_PER_ORDER,'seed':SEED,'exact_scope':'sampled labeled tree encodings; duplicate unlabeled isomorphism classes retained; not exhaustive','selector':'original degree-one vertices v with Delta_p(T-v)<0','guard':'p>=x+2 and 3p<2alpha+1','zero_extension':'vectors are explicitly padded with zeros beyond order n; first descent scanned through j=n'},'summary':totals,'eligible_rows_total':eligible,'proper_selector_rows_total':proper_total}
    OUT.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:{kk:vv for kk,vv in v.items() if kk not in ('best_row','best_margin_row','eligible_rows_data')} for k,v in totals.items()},indent=2))
    print('eligible',eligible,'proper selector',proper_total,'evidence',OUT)
    print('per-order max eligibility margins',json.dumps({n:d['best_margin_row']['eligibility_margin'] for n,d in totals.items()},sort_keys=True))
    for n,d in totals.items():
        r=d['best_row']
        if r and r['proper_selector']:
            print('proper sample',n,json.dumps(r,sort_keys=True)); break

if __name__=='__main__': run()
