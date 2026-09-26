"""Exact graph-DP replay for the T_5 F3 checkpoint."""
from functools import lru_cache
import json


def add(*polys):
    out = [0] * max(map(len, polys))
    for poly in polys:
        for i, value in enumerate(poly):
            out[i] += value
    return out


def sub(a, b):
    return add(a, [-x for x in b])


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def power(poly, n):
    out = [1]
    for _ in range(n):
        out = mul(out, poly)
    return out


def shift(poly, n=1):
    return [0] * n + poly


def coeff(poly, j):
    return poly[j] if 0 <= j < len(poly) else 0


def delta(poly, j):
    return coeff(poly, j + 1) - coeff(poly, j)


def main():
    # T_m: path 0-1-2, with m claw centers attached to 0,
    # each center having three private leaves.
    m, p = 5, 10
    edges = [(0, 1), (1, 2)]
    next_vertex = 3
    claw_leaves = []
    claw_centers = []
    for _ in range(m):
        center = next_vertex
        next_vertex += 1
        claw_centers.append(center)
        edges.append((0, center))
        leaves = []
        for _ in range(3):
            leaf = next_vertex
            next_vertex += 1
            leaves.append(leaf)
            edges.append((center, leaf))
        claw_leaves.append(leaves)
    n = next_vertex
    adj = [set() for _ in range(n)]
    for u, v in edges:
        adj[u].add(v)
        adj[v].add(u)

    @lru_cache(None)
    def poly(removed):
        removed = frozenset(removed)
        live = [v for v in range(n) if v not in removed]
        if not live:
            return (1,)
        v = live[0]
        return tuple(add(
            list(poly(frozenset(set(removed) | {v}))),
            shift(list(poly(frozenset(set(removed) | {v} | adj[v])))),
        ))

    def deleted_poly(vertices):
        return list(poly(frozenset(vertices)))

    # Independent polynomial from root decomposition, independently checked
    # against the graph recursion above.
    L = [1, 1]
    B = [1, 4, 3, 1]
    B2 = [1, 3, 1]
    edge_poly = [1, 2]
    P = add(mul(edge_poly, power(B, m)), shift(power(L, 3 * m + 1)))
    assert P == deleted_poly(())

    # Two original leaf-deletion polynomials, one for the path endpoint and
    # one for a claw leaf.
    arm_deleted = add(mul(L, power(B, m)), shift(power(L, 3 * m)))
    claw_deleted = add(
        mul(mul(edge_poly, B2), power(B, m - 1)),
        shift(power(L, 3 * m)),
    )
    assert arm_deleted == deleted_poly({2})
    claw_leaf = claw_leaves[0][0]
    claw_center = claw_centers[0]
    assert claw_deleted == deleted_poly({claw_leaf}), (claw_deleted, deleted_poly({claw_leaf}))

    x = next(j for j in range(len(P) + 1) if delta(P, j) < 0)
    k = p - 1
    alpha = 3 * m + 2
    assert max(j for j, value in enumerate(P) if value) == alpha
    assert x == 8 and x + 2 <= p and 3 * p < 2 * alpha + 1
    assert delta(arm_deleted, p) < 0 and delta(claw_deleted, p) < 0

    # q_v(z)=i(H_v)-i(H_v-W_v), computed by formulas for each leaf orbit.
    arm_q = shift(power(L, 3 * m))
    claw_q = add(
        shift(power(L, 3 * m)),
        mul([0, 2, 5, 2], power(B, m - 1)),
    )  # z(2+z)(1+2z)B^(m-1) added to z(1+z)^(3m)
    arm_H = deleted_poly({1, 2})
    arm_H_without_W = deleted_poly({0, 1, 2})
    claw_H = deleted_poly({claw_leaf, claw_center})
    claw_H_without_W = deleted_poly({claw_leaf, claw_center, 0, *claw_leaves[0][1:]})
    assert arm_q == sub(arm_H, arm_H_without_W)
    assert claw_q == sub(claw_H, claw_H_without_W)

    # Count multiply-marked size-p upper sets for a claw tag. In H_v the
    # mark set W has three mutually independent vertices: root and two
    # sibling leaves. For t=|B intersect W|, 1[t>=2]=C(t,2)-2*C(t,3).
    W = [0] + claw_leaves[0][1:]

    def containing(S):
        removed = set()
        for w in S:
            removed.add(w)
            removed.update(adj[w])
        return shift(deleted_poly(removed), len(S))

    pair_sum = add(*(containing([W[i], W[j]])
                     for i in range(3) for j in range(i + 1, 3)))
    triple = containing(W)
    c_per_claw_tag = coeff(sub(pair_sum, [2 * a for a in triple]), p)

    claw_tag_count = 3 * m
    Q = coeff(arm_q, k) + claw_tag_count * coeff(claw_q, k)
    U = coeff(arm_q, k + 1) + claw_tag_count * coeff(claw_q, k + 1)
    C = claw_tag_count * c_per_claw_tag  # arm W has size one, hence C_arm=0
    E = k * U + C
    S_incidence = (E - C - k * Q) // k

    # Direct full-sum calculation using original supports and closed neighborhoods.
    arm_term = delta(deleted_poly({1, 2}), k) - delta(deleted_poly({0, 1, 2}), k)
    claw_closed = {claw_center, 0, *claw_leaves[0]}
    claw_term = delta(deleted_poly({claw_leaf, claw_center}), k) - delta(deleted_poly(claw_closed), k)
    S_direct = arm_term + claw_tag_count * claw_term

    result = {
        "family": "T_m: path 0-1-2; m claws attached at 0; three private leaves per claw",
        "m": m,
        "computation_scope": {"explicit_graphs": 1, "ranks_checked": [p], "random_seed": None},
        "order": n,
        "alpha": alpha,
        "x": x,
        "p": p,
        "k": k,
        "guards": {"x_plus_2_le_p": x + 2 <= p, "three_p_lt_two_alpha_plus_one": 3 * p < 2 * alpha + 1},
        "orbit_selector": {
            "path_endpoint_delta_p_after_leaf_deletion": delta(arm_deleted, p),
            "claw_leaf_delta_p_after_leaf_deletion": delta(claw_deleted, p),
            "selected_orbits": ["path endpoint", "all 15 claw leaves"],
            "complete_favorable_set_size": 16,
        },
        "marked_counts": {
            "q_arm_k": coeff(arm_q, k),
            "q_claw_k_per_leaf": coeff(claw_q, k),
            "q_arm_k_plus_1": coeff(arm_q, k + 1),
            "q_claw_k_plus_1_per_leaf": coeff(claw_q, k + 1),
            "Q": Q,
            "U": U,
            "C_claw_per_tag": c_per_claw_tag,
            "C_total": C,
            "E_from_incidence_identity_kU_plus_C": E,
        },
        "full_aggregate": {
            "arm_summand": arm_term,
            "claw_summand_per_leaf": claw_term,
            "S_direct": S_direct,
            "S_from_E_minus_C_minus_kQ_over_k": S_incidence,
            "identity_check": S_direct == S_incidence,
        },
        "limits": [
            "One eligible symmetric family member only; this is not a census or a universal proof.",
            "No exact deficient cut in the enlarged mixed Hall network was found or certified.",
            "Orbit counts Q,U,C do not encode arbitrary-neighborhood capacities and are not a Hall certificate.",
        ],
    }
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
