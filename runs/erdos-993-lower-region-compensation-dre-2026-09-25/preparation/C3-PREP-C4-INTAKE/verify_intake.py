#!/usr/bin/env python3
"""Bounded, independent intake checks on brief-listed inputs only."""
import hashlib
import json
import math
from functools import lru_cache
from pathlib import Path

BASE = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25')
HERE = Path(__file__).resolve().parent
BRIEF = BASE / 'control/C3-PREP-C4-INTAKE.json'
brief = json.loads(BRIEF.read_text())
hashes = {}
for item in brief['allowed_source_files']:
    actual = hashlib.sha256((BASE / item['path']).read_bytes()).hexdigest()
    hashes[item['path']] = actual == item['sha256']
assert all(hashes.values())

reg = json.loads((BASE / 'control/C2-ORDER-BANDS-AWARDED-CLAIM-IDENTITY.json').read_text())['claims']
ref = json.loads((BASE / 'inputs/TRANSITIVE-REFUTED-CLAIMS.json').read_text())
draft = json.loads((BASE / 'control-proposals/C4-NEW-CLAIMS-DRAFT.json').read_text())
by_key = {c['claim_key']: c for c in reg}
assert len(reg) == len(by_key) == 418
assert len(ref) == 92 and len({c['claim_key'] for c in ref}) == 92
assert all(c['claim_key'] in by_key and by_key[c['claim_key']]['status'] == 'REFUTED'
           and by_key[c['claim_key']]['statement'] == c['statement'] for c in ref)
assert len(draft) == len({c['claim_key'] for c in draft}) == 6
assert not ({c['claim_key'] for c in draft} & set(by_key))

obj = json.loads((BASE / 'control-proposals/THIRD-SHELL-P10-COVER-OBSTRUCTION.json').read_text())
edges = [tuple(e) for e in obj['edges']]
vertices = set(range(24))
assert len(edges) == 23 and len(set(edges)) == 23
adj = {v: set() for v in vertices}
for u, v in edges:
    assert u in vertices and v in vertices and u != v
    adj[u].add(v); adj[v].add(u)
seen = {0}; frontier = [0]
while frontier:
    for w in adj[frontier.pop()]:
        if w not in seen:
            seen.add(w); frontier.append(w)
assert seen == vertices  # 23 edges then imply acyclicity.
leaves = sorted(v for v in vertices if len(adj[v]) == 1)
assert leaves == obj['row']['favorable_leaves']

@lru_cache(None)
def poly(mask):
    if not mask:
        return (1,)
    # Independent deletion/contraction evaluator, choosing a highest-degree vertex.
    v = max((u for u in vertices if mask & (1 << u)),
            key=lambda u: (sum(bool(mask & (1 << w)) for w in adj[u]), u))
    without = mask & ~(1 << v)
    without_closed = without
    for w in adj[v]:
        without_closed &= ~(1 << w)
    a, b = poly(without), poly(without_closed)
    result = [0] * max(len(a), len(b) + 1)
    for j, n in enumerate(a): result[j] += n
    for j, n in enumerate(b): result[j + 1] += n
    while result[-1] == 0: result.pop()
    return tuple(result)

def delta(coeff, j):
    return (coeff[j + 1] if j + 1 < len(coeff) else 0) - (coeff[j] if j < len(coeff) else 0)

full = (1 << 24) - 1
P = poly(full)
x = next(j for j in range(len(P)) if delta(P, j) < 0)
p = 10
assert list(P) == obj['P'] and len(P) - 1 == 18 and x == 8
assert x + 2 <= p and 3 * p < 2 * (len(P) - 1) + 1
F, terms = [], []
for v in leaves:
    s = next(iter(adj[v]))
    minus_v = full & ~(1 << v)
    if delta(poly(minus_v), p) < 0:
        F.append(v)
        h = minus_v & ~(1 << s)
        residual = h
        for w in adj[s]: residual &= ~(1 << w)
        term = delta(poly(h), p - 1) - delta(poly(residual), p - 1)
        terms.append({'leaf': v, 'support': s, 'term': term})
assert F == leaves
S = sum(t['term'] for t in terms)
assert S == obj['row']['aggregate'] == -122805
assert sorted(t['term'] for t in terms) == sorted([-7537] * 15 + [-4875] * 2)
cover = set(obj['cover'])
matching = [tuple(e) for e in obj['matching_edges']]
assert len(cover) == len(matching) == 6
assert all(u in cover or v in cover for u, v in edges)
assert all(tuple(e) in edges for e in matching)
assert len({v for edge in matching for v in edge}) == 12

def C(n, k):
    return math.comb(n, k) if 0 <= k <= n else 0
def E(n, k):
    return C(n, k + 1) - C(n, k)
def cat(k):
    return C(2 * k, k) // (k + 1)
def loss(c, r):
    return sum(C(c, a) * cat(r - a) for a in range(1, min(c, r) + 1))
second = {}
for p, bmin in [(6, 8), (7, 9)]:
    vals = []
    for r in range(p - 1):
        N = 2 * p - 2
        if r == 0:
            vals.append(E(N, 0))
        else:
            vals.append(E(N, r) + E(bmin, r - 1) - loss(5, r) + cat(r - 1))
    second[str(p)] = vals
assert second == {'6': [9, 38, 81, 90, 1], '7': [11, 58, 167, 295, 284, 0]}
third = [E(26, r) - loss(6, r) for r in range(13)]
assert third[-1] == 16848 and all(v > 0 for v in third)

out = {
    'status_authority': 'proposal_to_controller_only',
    'source_hashes': {'matched': sum(hashes.values()), 'listed': len(hashes), 'all_match': all(hashes.values())},
    'identity_inventory': {'canonical_count': len(reg), 'refutation_count': len(ref),
                           'proposed_count': len(draft), 'exact_key_collisions': []},
    'p10_cover_obstruction_independent_replay': {
        'method': 'edge-derived leaves and supports; independent deletion-contraction polynomial recurrence',
        'order': 24, 'edge_count': 23, 'connected': True, 'alpha': len(P) - 1,
        'x': x, 'p': 10, 'selector': F, 'summands': terms, 'S': S,
        'cover_size': len(cover), 'disjoint_matching_size': len(matching),
        'conclusion': 'refutes cover>=7 extension only; all pointwise terms and S are negative'},
    'shell_arithmetic_replay': {'second_shell_p6_p7_margins': second,
                               'third_shell_six_cover_N26_margins_r0_to_12': third},
    'limitations': ['No raw matching injection certificate or Lean source was available in this brief.',
                    'The p10 replay is one encoded tree, not a census of low-cover trees.',
                    'The shell arithmetic checks numerical margins, not the universal graph reductions.']
}
(HERE / 'EVIDENCE.json').write_text(json.dumps(out, indent=2) + '\n')
print(json.dumps({'source_files': len(hashes), 'registry': len(reg), 'refutations': len(ref),
                  'p10_S': S, 'second_margins': second, 'third_r12': third[-1],
                  'dp_states': poly.cache_info().currsize}))
