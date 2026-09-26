"""Independent subset-enumeration audit of copied C5-F3 fixture evidence."""
import json
from itertools import combinations
from pathlib import Path

src = json.loads(Path('SOURCE-EVIDENCE.json').read_text())['fixture']
n = src['n']
edges = [tuple(e) for e in src['edges']]
adj = [0] * n
for u, v in edges:
    adj[u] |= 1 << v
    adj[v] |= 1 << u
assert len(edges) == n - 1

def counts(vertices):
    vertices = tuple(vertices)
    out = [0] * (len(vertices) + 1)
    independent_by_rank = [[] for _ in range(len(vertices) + 1)]
    for r in range(len(vertices) + 1):
        for tup in combinations(vertices, r):
            mask = sum(1 << v for v in tup)
            if all((adj[v] & mask) == 0 for v in tup):
                out[r] += 1
                independent_by_rank[r].append(mask)
    while len(out) > 1 and out[-1] == 0:
        out.pop()
    return out, independent_by_rank

def coeff(poly, r):
    return poly[r] if 0 <= r < len(poly) else 0

def delta(poly, r):
    return coeff(poly, r+1) - coeff(poly, r)

f, _ = counts(range(n))
a = len(f) - 1
x = next(j for j in range(a + 1) if delta(f, j) < 0)
p = src['p']
leaves = [v for v in range(n) if adj[v].bit_count() == 1]
selector = {}
for v in leaves:
    fv, _ = counts(vv for vv in range(n) if vv != v)
    selector[str(v)] = delta(fv, p)
F = [v for v in leaves if selector[str(v)] < 0]
k = p - 1
rows=[]
S=Q=U=E=C=D=0
for v in F:
    s = (adj[v].bit_length() - 1)
    Hverts = [u for u in range(n) if u not in (v,s)]
    Rverts = [u for u in range(n) if not ((1<<u) & ((1<<s) | adj[s]))]
    hp, hsets = counts(Hverts)
    rp, _ = counts(Rverts)
    W = [u for u in range(n) if u != v and ((adj[s] >> u) & 1)]
    qk = sum(bool(mask & sum(1<<z for z in W)) for mask in hsets[k])
    qk1 = sum(bool(mask & sum(1<<z for z in W)) for mask in hsets[k+1])
    marked_k = [mask for mask in hsets[k] if any((mask >> z)&1 for z in W)]
    e = 0
    for mask in marked_k:
        for z in Hverts:
            if not ((mask >> z)&1) and (adj[z] & mask) == 0:
                e += 1
    c = sum(sum((mask>>z)&1 for z in W) >= 2 for mask in hsets[k+1])
    d = 2 * (a-1-k) * qk - e
    summand = delta(hp,k) - delta(rp,k)
    assert summand == qk1-qk
    S += summand; Q += qk; U += qk1; E += e; C += c; D += d
    rows.append({'leaf':v,'support':s,'W':W,'H_order':len(Hverts),'H_alpha':len(hp)-1,
                 'R_order':len(Rverts),'R_alpha':len(rp)-1,
                 'q_k':qk,'q_k1':qk1,'E_v':e,'C_v':c,'D_v':d,'summand':summand})
coef = 2*a+1-3*p
out = {
 'method':'exhaustive subset enumeration on each explicitly induced vertex subset',
 'n':n,'edges':src['edges'],'independence_vector':f,'alpha':a,'x':x,'p':p,'k':k,
 'lower_region_guard':p>=x+2 and 3*p<2*a+1,
 'original_leaves':leaves,'selector_leaf_deltas':selector,'favorable_leaves':F,
 'tag_rows':rows,'Q':Q,'U':U,'E':E,'C':C,'D':D,'S':S,
 'E_equals_kU_plus_C':E==k*U+C,
 'coefficient_2a1_minus_3p':coef,
 'budget_margin':D+C-coef*Q,'kS':k*S,
 'budget_identity': k*S == coef*Q-(D+C),
 'comparison_to_source_fixture':None,
}
for key in ('n','edges','independence_vector','alpha','x','p','k','lower_region_guard','original_leaves','selector_leaf_deltas','favorable_leaves','Q','U','E','C','D','S','E_equals_kU_plus_C','coefficient_2a1_minus_3p','budget_margin','kS'):
    assert out[key] == src[key], (key,out[key],src[key])
for row, source_row in zip(rows, src['tag_rows']):
    for key in ('leaf','support','W','q_k','q_k1','E_v','C_v','D_v','summand'):
        assert row[key] == source_row[key], (key,row,source_row)
    assert row['H_alpha'] == a-1 == 8
out['comparison_to_source_fixture']='all listed fixture fields match copied source evidence'
assert out['S'] == -307 and out['budget_margin'] == 1535 and out['budget_identity']
Path('AUDIT.json').write_text(json.dumps(out, indent=2)+'\n')
print(json.dumps(out, indent=2))
