"""Small independent checks for the C1-AF adjudication; integer arithmetic only."""
import hashlib
import json
from collections import Counter
from itertools import combinations
from math import comb
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def polynomial(vertices, edges):
    edge_set = {frozenset(e) for e in edges}
    counts = [0] * (len(vertices) + 1)
    maximum = []
    for mask in range(1 << len(vertices)):
        subset = {vertices[j] for j in range(len(vertices)) if mask & (1 << j)}
        if any(e <= subset for e in edge_set):
            continue
        counts[len(subset)] += 1
        if len(subset) > (len(maximum[0]) if maximum else -1):
            maximum = [sorted(subset)]
        elif len(subset) == len(maximum[0]):
            maximum.append(sorted(subset))
    while counts[-1] == 0:
        counts.pop()
    return counts, maximum


def delta(poly, k):
    def coef(j):
        return poly[j] if 0 <= j < len(poly) else 0
    return coef(k + 1) - coef(k)


def graph_audit(edges):
    vertices = list(range(10))
    assert len(edges) == 9
    reached = {0}
    while True:
        more = reached | {b for a, b in edges if a in reached} | {a for a, b in edges if b in reached}
        if more == reached:
            break
        reached = more
    assert len(reached) == 10
    poly, maximum = polynomial(vertices, edges)
    alpha = len(poly) - 1
    x = next(k for k in range(alpha + 1) if delta(poly, k) < 0)
    p = alpha - 2
    degrees = Counter(t for e in edges for t in e)
    leaves = [v for v in vertices if degrees[v] == 1]
    rows = []
    for v in leaves:
        s = next(b if a == v else a for a, b in edges if v in (a, b))
        h_vertices = [a for a in vertices if a not in (v, s)]
        n_support = {s} | {b if a == s else a for a, b in edges if s in (a, b)}
        r_vertices = [a for a in vertices if a not in n_support]
        dpoly, _ = polynomial([a for a in vertices if a != v], edges)
        hpoly, _ = polynomial(h_vertices, edges)
        rpoly, _ = polynomial(r_vertices, edges)
        selector = delta(dpoly, p)
        if selector < 0:
            dh, dr = delta(hpoly, p - 1), delta(rpoly, p - 1)
            rows.append([v, s, selector, dh, dr, dh - dr])
    return dict(poly=poly, alpha=alpha, x=x, p=p, eligible=x+2 <= p,
                leaves=leaves, selected_rows=rows, S=sum(r[-1] for r in rows),
                maximum_independent_sets=maximum,
                nonresidual_leaves=[v for v in leaves if any(v not in M for M in maximum)])


def product(a, b):
    c = [0] * (len(a)+len(b)-1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i+j] += x*y
    return c


def power(a, k):
    result = [1]
    for _ in range(k):
        result = product(result, a)
    return result


def family_audit(m):
    q = 3*m
    A = [1, 1]
    Q = [1, 4, 3, 1]
    B = [1, 3, 1]
    qt = power(Q, m)
    pt = product([1, 2], qt)
    inc = product([0, 1], power(A, q+1))
    pt += [0]*(len(inc)-len(pt))
    pt = [a+b for a,b in zip(pt, inc)]
    dm = product(A, qt)
    db = product(product([1, 2], B), power(Q, m-1))
    inc_del = product([0,1], power(A, q))
    dm += [0]*(len(inc_del)-len(dm))
    db += [0]*(len(inc_del)-len(db))
    dm = [a+b for a,b in zip(dm, inc_del)]
    db = [a+b for a,b in zip(db, inc_del)]
    marked_selector = delta(dm, q)
    arm_selector = delta(db, q)
    marked = q-comb(q,2)
    arm = 3-q-comb(q,2)
    actual = dict(alpha=len(pt)-1, p=q,
                  x=next(k for k in range(len(pt)) if delta(pt,k)<0),
                  delta_p_minus_2=delta(pt,q-2),
                  marked_selector=marked_selector, arm_selector=arm_selector,
                  marked_summand=marked, arm_summand=arm,
                  S=marked+q*arm)
    expected = dict(alpha=q+2, p=q,
                    delta_p_minus_2=5*m-39*m*(m-1)//2-54*comb(m,3)+comb(q+1,3)-comb(q+1,4),
                    marked_selector=1-6*m, arm_selector=-q-1,
                    marked_summand=-9*m*(m-1)//2,
                    arm_summand=3-6*m-9*m*(m-1)//2,
                    S=-q*q+4*q-(q+1)*comb(q,2))
    for key, value in expected.items():
        assert actual[key] == value, (m,key,actual[key],value)
    return actual


def main():
    packet = json.loads((ROOT/'packets/C1-AF.json').read_text())
    bad = []
    for item in packet['allowed_source_files']:
        got = hashlib.sha256((ROOT/item['path']).read_bytes()).hexdigest()
        if got != item['sha256']:
            bad.append(item['path'])
    assert not bad, bad
    true_edges = json.loads((ROOT/'cycles/cycle-1/C1-F2/nonresidual-example.json').read_text())['edges']
    prose_edges = [[0,8],[1,2],[2,5],[3,7],[3,8],[4,8],[5,8],[6,8],[7,9]]
    f3_edges = json.loads((ROOT/'cycles/cycle-1/C1-F3/nonresidual_target.json').read_text())['edges']
    f2_to_f3 = {3:1, 0:0, 5:3, 8:8, 7:4, 6:2, 2:5, 4:7, 1:9, 9:6}
    assert len(set(f2_to_f3.values())) == 10
    assert {frozenset((f2_to_f3[a], f2_to_f3[b])) for a,b in true_edges} == {frozenset(e) for e in f3_edges}
    out = dict(pinned_file_count=len(packet['allowed_source_files']),
               pinned_hash_mismatches=bad,
               f2_f3_edge_isomorphism=f2_to_f3,
               f2_certificate=graph_audit(true_edges),
               f2_prose_graph=graph_audit(prose_edges),
               f3_certificate=graph_audit(f3_edges),
               family_rows=[dict(m=m, **family_audit(m)) for m in [1,2,3,5,22,60,100]],
               labeled_orders_2_through_8=sum(n**(n-2) for n in range(2,9)))
    print(json.dumps(out, indent=2, sort_keys=True))


if __name__ == '__main__':
    main()
