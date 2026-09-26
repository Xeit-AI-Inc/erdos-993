"""Independent small-profile graph-polynomial check for the C6-F3 formulas."""
from itertools import combinations
from math import comb
import json


def conv(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def poly(vertices, edges):
    vs = list(vertices)
    idx = {v: i for i, v in enumerate(vs)}
    edge_masks = [(1 << idx[a]) | (1 << idx[b]) for a, b in edges if a in idx and b in idx]
    out = [0] * (len(vs) + 1)
    for mask in range(1 << len(vs)):
        if all((mask & em) != em for em in edge_masks):
            out[mask.bit_count()] += 1
    while len(out) > 1 and out[-1] == 0:
        out.pop()
    return out


def tree(profile):
    # Path 0-1-2, m centers 3.., and private tips after centers.
    m = len(profile)
    edges = {(0, 1), (1, 2)}
    centers = []
    tips = []
    nxt = 3
    for r in profile:
        c = nxt
        nxt += 1
        centers.append(c)
        edges.add((0, c))
        row = []
        for _ in range(r):
            row.append(nxt)
            edges.add((c, nxt))
            nxt += 1
        tips.append(row)
    return set(range(nxt)), edges, centers, tips


def formula(profile):
    N = sum(profile)
    L = [1, 1]
    B = [[comb(r, j) + (1 if j == 1 else 0) for j in range(r + 1)] for r in profile]
    Q = [1]
    for b in B:
        Q = conv(Q, b)
    P = conv([1, 2], Q)
    perturb = [0] + [comb(N + 1, j) for j in range(N + 2)]
    if len(P) < len(perturb):
        P += [0] * (len(perturb) - len(P))
    for j, x in enumerate(perturb):
        P[j] += x
    A0 = conv(L, Q)
    zLN = [0] + [comb(N, j) for j in range(N + 1)]
    if len(A0) < len(zLN):
        A0 += [0] * (len(zLN) - len(A0))
    for j, x in enumerate(zLN):
        A0[j] += x
    qtip = []
    for i, r in enumerate(profile):
        H = [1]
        for k, b in enumerate(B):
            if k != i:
                H = conv(H, b)
        F = [comb(r - 1, j + 1) for j in range(r - 1)]
        main = conv(conv([1, 2], F), H)
        q = [0] + main
        if len(q) < len(zLN):
            q += [0] * (len(zLN) - len(q))
        for j, x in enumerate(zLN):
            q[j] += x
        qtip.append(q)
    return P, A0, zLN, qtip


cases = []
for profile in ((2,), (2, 3)):
    vertices, edges, centers, tips = tree(profile)
    P, A0, q2, qtip = formula(profile)
    got_P = poly(vertices, edges)
    got_A0 = poly(vertices - {2}, edges)
    got_H2 = poly(vertices - {1, 2}, edges)
    neigh1 = {0, 1, 2}
    got_R2 = poly(vertices - neigh1, edges)
    assert got_P == P, (profile, got_P, P)
    assert got_A0 == A0, (profile, got_A0, A0)
    assert [(got_H2[j] if j < len(got_H2) else 0) - (got_R2[j] if j < len(got_R2) else 0)
            for j in range(len(q2))] == q2
    tag_rows = []
    for i, row in enumerate(tips):
        for tip in row:
            support = centers[i]
            H = poly(vertices - {tip, support}, edges)
            closed = {support, 0, *row}
            R = poly(vertices - closed, edges)
            n = max(len(H), len(R), len(qtip[i]))
            diff = [(H[j] if j < len(H) else 0) - (R[j] if j < len(R) else 0) for j in range(n)]
            expected = qtip[i] + [0] * (n - len(qtip[i]))
            assert diff == expected, (profile, i, tip, diff, expected)
            tag_rows.append([i, tip, support])
    cases.append({"profile": profile, "vertices": len(vertices), "independence_polynomial": got_P,
                  "leaf_tag_count": 1 + sum(profile), "tip_tags_checked": len(tag_rows),
                  "endpoint_marked_polynomial": q2, "all_tip_marked_polynomials_match": True})

print(json.dumps({"check": "explicit independent-set enumeration against P, endpoint deletion, and every original leaf marked polynomial",
                  "cases": cases}, indent=2))
