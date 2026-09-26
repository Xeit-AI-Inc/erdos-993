#!/usr/bin/env python3
"""Independent subset-enumeration audit of every eligible C4-F1 evidence row."""
import json
from pathlib import Path

DATA = json.loads(Path('EVIDENCE.json').read_text())

def indep_masks(n, edges):
    edge_masks = [(1 << a) | (1 << b) for a, b in edges]
    return [m for m in range(1 << n) if all((m & e) != e for e in edge_masks)]

def poly(ms, n, excluded=0):
    out = [0] * (n + 2)
    for m in ms:
        if not (m & excluded):
            out[m.bit_count()] += 1
    return out

def delta(c):
    return [c[j+1] - c[j] for j in range(len(c)-1)]

checked = 0
rows = 0
for n_text, block in DATA['summary'].items():
    n = int(n_text)
    rows += len(block['eligible_rows_data'])
    for row in block['eligible_rows_data']:
        edges = [tuple(e) for e in row['edges']]
        adj = [set() for _ in range(n)]
        for a,b in edges:
            assert 0 <= a < n and 0 <= b < n and a != b
            adj[a].add(b); adj[b].add(a)
        # Independently certify the full edge encoding is a connected acyclic graph.
        seen={0}; stack=[0]
        while stack:
            z=stack.pop()
            for w in adj[z]-seen:
                seen.add(w); stack.append(w)
        assert len(seen)==n and len(edges)==n-1
        leaves=[v for v in range(n) if len(adj[v])==1]
        assert leaves==row['leaves']
        supports={v:next(iter(adj[v])) for v in leaves}
        ms=indep_masks(n,edges)
        counts=poly(ms,n)
        assert counts==row['i']
        ds=delta(counts)
        x=next(j for j,d in enumerate(ds) if d<0)
        a=max(j for j,c in enumerate(counts) if c)
        p=row['p']; k=p-1
        assert (a,x)==(row['alpha'],row['x'])
        assert p>=x+2 and 3*p<2*a+1 and p==x+2
        assert ds==row['Delta']
        selector=[]
        for v in leaves:
            tv=poly(ms,n,1<<v)
            dv=delta(tv)[p]
            selector.append({'leaf':v,'Delta_p_T_minus_v':dv,'selected':dv<0})
        assert selector==row['leaf_selector_tests']
        F=[z['leaf'] for z in selector if z['selected']]
        assert F==row['F']==leaves
        assert len(set(supports.values())) <= len(F) # repeated support tags retained below
        sum_q=sum_u=sum_e=sum_c=sum_s=0
        summands=[]
        for v in F:
            u=supports[v]
            Hmask=(1<<v)|(1<<u)
            Rmask=Hmask
            for w in adj[u]: Rmask|=1<<w
            hc=poly(ms,n,Hmask); rc=poly(ms,n,Rmask)
            q=hc[k]-rc[k]; upper=hc[k+1]-rc[k+1]
            # Count every actual addable vertex for each marked k-set.
            W=set(adj[u])-{v}
            E=C=0
            for m in ms:
                if m&Hmask or m.bit_count()!=k or not any((m>>w)&1 for w in W):
                    continue
                E += sum(1 for w in range(n) if not (Hmask>>w)&1 and not (m>>w)&1 and all(not ((m>>z)&1) for z in adj[w]))
            for m in ms:
                if m&Hmask or m.bit_count()!=k+1: continue
                if sum(1 for w in W if (m>>w)&1)>=2: C+=1
            s=(hc[k+1]-hc[k])-(rc[k+1]-rc[k])
            assert s==upper-q
            assert E==k*upper+C
            summands.append({'leaf':v,'support':u,'q':q,'U':upper,'E':E,'C':C,'S_term':s})
            sum_q+=q;sum_u+=upper;sum_e+=E;sum_c+=C;sum_s+=s
        assert summands==row['summands']
        assert (sum_q,sum_u,sum_e,sum_c,sum_s)==(row['Q'],row['U'],row['E'],row['C'],row['S'])
        assert sum_s<0 and (x+1)*sum_q-sum_e==row['CTx_gap']>0
        checked+=1

assert rows==37 and checked==37
result={
 'method':'Direct enumeration of all 2^n vertex subsets for each of the 37 eligible rows, using edge-conflict tests; recomputed tree status, original leaves, independence counts, leaf-deleted selector deltas, H/R counts, actual addability, multiply-marked upper sets, and aggregate sums.',
 'eligible_rows_checked':checked,
 'checks':'All 37 encodings are connected trees with n-1 edges; their original leaf lists, i(T), first descent, alpha, p eligibility, each T-v selector value, all selected leaves, every per-leaf H/R summand and E=kU+C identity, and the reported aggregate values match. Every row has p=x+2, F equal to the full original leaf set, S<0, and (x+1)Q-E>0.',
 'limitations':'This audits the producer evidence rows independently but does not prove the sampled Prüfer generation is exhaustive; it is not exhaustive over ordinary trees and has no universal implication.'
}
Path('AUDIT-RESULT.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
