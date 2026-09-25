#!/usr/bin/env python3
"""Independent exact coefficient checks for assigned tagged-shadow claim."""
from math import comb
import json


def path_poly(n, allowed):
    """Independence polynomial on P_n restricted to allowed vertices."""
    free, taken = [1], [0]
    for v in range(n):
        new_free = [0] * max(len(free), len(taken))
        for poly in (free, taken):
            for j, c in enumerate(poly):
                new_free[j] += c
        new_taken = [0] * (len(free) + 1)
        if v in allowed:
            for j, c in enumerate(free):
                new_taken[j + 1] += c
        free, taken = new_free, new_taken
    out = [0] * max(len(free), len(taken))
    for poly in (free, taken):
        for j, c in enumerate(poly):
            out[j] += c
    return out


def check(q, a):
    vals = []
    for k in range(1, a + 1):
        lhs = k * (q[k+1] if k+1 < len(q) else 0)
        rhs = 2 * (a-k) * (q[k] if k < len(q) else 0)
        assert lhs <= rhs, (k, lhs, rhs)
        vals.append((k, lhs, rhs))
    return {
        'ranks_checked': len(vals),
        'minimum_slack': min(rhs-lhs for _,lhs,rhs in vals),
        'positive_equalities': [k for k,lhs,rhs in vals if lhs == rhs and lhs > 0],
        'nonzero_q_ranks': [k for k in range(len(q)) if q[k] > 0],
        'sample': [{'k':k,'lhs':lhs,'rhs':rhs} for k,lhs,rhs in vals if k in {1,2,60,61,62,122,123}],
    }


def main():
    # 122 disjoint edges and one tagged isolated vertex, order 245.
    # Any tagged independent j-set contains the isolate and chooses j-1
    # edges with one of two endpoints from each.
    m = 122
    a = m+1
    q = [0] * (a+2)
    for j in range(1,a+1):
        q[j] = comb(m,j-1) * 2**(j-1)
    matching = check(q,a)
    assert matching['positive_equalities'] == list(range(1,a))
    matching.update({'graph':'122K2 + K1','order':245,'alpha':a,
                     'tag':'isolated vertex','q_1':q[1], 'q_2':q[2],
                     'q_123':q[123]})

    n=245
    verts=set(range(n))
    full=path_poly(n,verts)
    alpha=max(j for j,c in enumerate(full) if c)
    path={}
    for name,W in [('empty',set()),('full',verts),('endpoints',{0,n-1}),
                   ('center',{n//2}),('odd_vertices',set(range(1,n,2)))]:
        no_tags=path_poly(n,verts-W)
        q=[(full[j] if j < len(full) else 0)-(no_tags[j] if j < len(no_tags) else 0)
           for j in range(alpha+2)]
        assert all(x >= 0 for x in q)
        path[name]=check(q,alpha)
    print(json.dumps({'matching_plus_isolate':matching,
                      'path':{'graph':'P245','order':245,'alpha':alpha,'tag_checks':path}},
                     indent=2,sort_keys=True))


if __name__ == '__main__':
    main()
