#!/usr/bin/env python3
"""Independent exact checks for the three bounded C4 fence candidates."""

import json
from itertools import combinations
from math import comb
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent


def load(rel):
    return json.loads((ROOT / rel).read_text())


def graph(n, edges):
    e = [tuple(sorted(pair)) for pair in edges]
    assert len(e) == len(set(e)) == n - 1
    assert all(0 <= u < v < n for u, v in e)
    adj = [set() for _ in range(n)]
    for u, v in e:
        adj[u].add(v)
        adj[v].add(u)
    seen = {0}
    todo = [0]
    while todo:
        u = todo.pop()
        for v in adj[u] - seen:
            seen.add(v)
            todo.append(v)
    assert len(seen) == n
    return adj


def add(a, b):
    c = [0] * max(len(a), len(b))
    for j, value in enumerate(a):
        c[j] += value
    for j, value in enumerate(b):
        c[j] += value
    return c


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def power(a, n):
    out = [1]
    for _ in range(n):
        out = mul(out, a)
    return out


def trim(a):
    while len(a) > 1 and a[-1] == 0:
        a.pop()
    return a


def polynomial(adj, removed=()):
    kept = set(range(len(adj))) - set(removed)
    seen = set()

    def subtree(u, parent):
        assert u not in seen
        seen.add(u)
        no, yes = [1], [0, 1]
        for v in sorted(adj[u] & kept):
            if v == parent:
                continue
            cno, cyes = subtree(v, u)
            no = mul(no, add(cno, cyes))
            yes = mul(yes, cno)
        return no, yes

    out = [1]
    for u in sorted(kept):
        if u not in seen:
            no, yes = subtree(u, None)
            out = mul(out, add(no, yes))
    return trim(out)


def coeff(a, j):
    return a[j] if 0 <= j < len(a) else 0


def delta(a, j):
    return coeff(a, j + 1) - coeff(a, j)


def first_descent(a):
    return next(j for j in range(len(a)) if delta(a, j) < 0)


def original_leaves(adj):
    return {v: next(iter(adj[v])) for v in range(len(adj)) if len(adj[v]) == 1}


def leaf_rows(adj, p):
    rows = []
    for v, s in original_leaves(adj).items():
        pd = delta(polynomial(adj, {v}), p)
        h = polynomial(adj, {v, s})
        r = polynomial(adj, {s} | adj[s])
        w = sorted(adj[s] - {v})
        qprev = coeff(h, p - 1) - coeff(r, p - 1)
        q = coeff(h, p) - coeff(r, p)
        rows.append(dict(leaf=v, support=s, W=w, pointwise_delta=pd,
                         q_previous=qprev, q_rank=q, g=q-qprev,
                         selected=pd < 0))
    return rows


def common_checks(adj, p):
    a = polynomial(adj)
    x = first_descent(a)
    return dict(order=len(adj), edge_count=sum(map(len, adj))//2,
                alpha=len(a)-1, first_strict_descent=x,
                p=p, lower_guard=x+2 <= p,
                upper_guard=3*p < 2*(len(a)-1)+1,
                three_p=3*p, two_alpha_plus_one=2*(len(a)-1)+1,
                delta_before_x=[delta(a,j) for j in range(x)],
                delta_at_x=delta(a,x))


def t22():
    source = load('cycles/cycle-3/C3-AU/REPAIR-A1-EVIDENCE.json')
    adj = graph(source['graph']['vertices'], source['graph']['edges'])
    p = 34
    ck = common_checks(adj, p)
    a = polynomial(adj)
    formula = add(mul([1,2], power([1,4,3,1],22)),
                  mul([0,1,1], power([1,1],66)))
    assert a == formula == source['tree_polynomial']
    rows = leaf_rows(adj,p)
    assert len(rows) == 67 and all(r['selected'] for r in rows)
    arm = next(r for r in rows if r['leaf'] == 2)
    assert arm['support'] == 1 and arm['W'] == [0]
    assert arm['q_rank'] == comb(66,33)
    assert arm['q_previous'] == comb(66,32)
    aggregate = sum(r['g'] for r in rows if r['selected'])
    assert aggregate == source['aggregate']
    assert ck['lower_guard'] and ck['upper_guard']
    return dict(**ck, polynomial_formula_verified=True, original_leaves=rows,
                selected_count=sum(r['selected'] for r in rows),
                arm_q_closed_form={'q_34':'C(66,33)','q_33':'C(66,32)'},
                arm_source_dimension=arm['q_rank'],
                arm_target_dimension=arm['q_previous'],
                arm_dimension_excess=arm['g'], aggregate=aggregate)


def order14():
    source = load('control-proposals/C3-U5-TRANSFER-DIAGNOSTIC/RANDOM-EVIDENCE.json')['rows'][0]
    n, p = source['n'], source['p']
    adj = graph(n, source['edges'])
    ck = common_checks(adj, p)
    assert ck['lower_guard'] and ck['upper_guard']
    leaves = original_leaves(adj)
    rows = leaf_rows(adj, p)
    F = {r['leaf'] for r in rows if r['selected']}
    assert F == set(source['F'])
    counts = [0]*(n+1)
    Q = E = 0
    for mask in range(1<<n):
        B = {v for v in range(n) if mask >> v & 1}
        if any(adj[v] & B for v in B):
            continue
        j = len(B)
        counts[j] += 1
        if j != p:
            continue
        w = sum(bool((adj[leaves[v]]-{v}) & B) for v in F & B)
        e = sum(not bool(adj[v] & B) for v in range(n) if v not in B)
        Q += w
        E += w*e
    counts = trim(counts)
    dp = polynomial(adj)
    assert counts == dp
    same_rank_gap = counts[p]*E - (p+1)*counts[p+1]*Q
    early_gap = counts[ck['first_strict_descent']]*E - (ck['first_strict_descent']+1)*counts[ck['first_strict_descent']+1]*Q
    aggregate = sum(r['g'] for r in rows if r['selected'])
    assert (Q,E,same_rank_gap,early_gap,aggregate) == (715,1905,19895,-587630,-378)
    return dict(**ck, original_leaves=rows, selector=sorted(F),
                literal_independent_counts=counts,
                Q=Q, E=E, i_p=counts[p], i_p_plus_1=counts[p+1],
                same_rank_gap=same_rank_gap, early_CT_x_gap=early_gap,
                aggregate=aggregate)


def order24():
    source = load('control-proposals/THIRD-SHELL-P10-COVER-OBSTRUCTION.json')
    adj = graph(24, source['edges'])
    p = 10
    ck = common_checks(adj,p)
    assert ck['lower_guard'] and ck['upper_guard']
    assert len(adj) == 2*p+4
    cover = set(source['cover'])
    assert len(cover) == 6 and all(cover & {u,v} for u,v in source['edges'])
    matching = [tuple(e) for e in source['matching_edges']]
    assert len(matching) == 6 and len({v for e in matching for v in e}) == 12
    assert all(v in adj[u] for u,v in matching)
    a = polynomial(adj)
    formula = add(mul(power(add(power([1,1],3),[0,1]),5),
                      add(power([1,1],2),[0,1])),
                  mul([0,1],power([1,1],17)))
    assert a == formula == source['P']
    rows = leaf_rows(adj,p)
    aggregate = sum(r['g'] for r in rows if r['selected'])
    assert aggregate == source['row']['aggregate']
    assert delta(a,p-2) == -78
    return dict(**ck, order_shell_verified=True, polynomial=a,
                polynomial_formula_verified=True, explicit_cover=sorted(cover),
                disjoint_matching=[list(e) for e in matching],
                vertex_cover_number=6, delta_at_p_minus_2=delta(a,p-2),
                original_leaves=rows,
                selected_count=sum(r['selected'] for r in rows),
                aggregate=aggregate)


def registry_check():
    d = load('control/C2-ORDER-BANDS-AWARDED-CLAIM-IDENTITY.json')['claims']
    t = load('inputs/TRANSITIVE-REFUTED-CLAIMS.json')
    draft = load('control-proposals/C4-FENCE-IDENTITIES-DRAFT.json')
    keys = [x['claim_key'] for x in d]
    tkeys = [x['claim_key'] for x in t]
    proposed = [x['claim_key'] for x in draft]
    assert len(keys) == len(set(keys)) == 418
    assert len(tkeys) == len(set(tkeys)) == 92
    assert set(tkeys) <= set(keys)
    assert not set(proposed) & set(keys)
    assert not set(proposed) & set(tkeys)
    return dict(existing_key_count=len(keys), transitive_refuted_count=len(tkeys),
                proposed_keys=proposed, exact_key_collisions=[],
                exact_statement_collisions=[x['claim_key'] for x in d
                    if x['statement'] in {y['statement'] for y in draft}])


if __name__ == '__main__':
    evidence = dict(methods=['rooted forest include/exclude integer polynomial recurrence',
                             'literal enumeration of all 2^14 subsets',
                             'independent binomial/structural polynomial formulas',
                             'explicit cover and matching certificates'],
                    registry=registry_check(), t22=t22(), order14=order14(),
                    order24=order24())
    (OUT/'INDEPENDENT-EVIDENCE.json').write_text(
        json.dumps(evidence,indent=2,ensure_ascii=False)+'\n')
    print(json.dumps({k: {key: value for key,value in v.items()
                          if key in ('order','alpha','first_strict_descent','p','aggregate',
                                     'arm_dimension_excess','same_rank_gap','early_CT_x_gap',
                                     'vertex_cover_number','delta_at_p_minus_2')}
                      for k,v in evidence.items() if k != 'methods' and k != 'registry'},
                     indent=2))
