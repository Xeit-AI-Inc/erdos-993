"""Independent literal-tree and factor-relation checks for the C4-F2 case."""
from math import comb
import json


def add(a, b):
    return [coef(a, k) + coef(b, k) for k in range(max(len(a), len(b)))]


def coef(a, k):
    return a[k] if 0 <= k < len(a) else 0


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, u in enumerate(a):
        for j, v in enumerate(b):
            out[i + j] += u * v
    return out


def power_l(n):
    return [comb(n, k) for k in range(n + 1)]


def branch_poly(r):
    # L^r + z, constructed directly from binomial coefficients.
    out = power_l(r)
    return add(out, [0, 1])


def literal_graph(rs):
    edges = [(0, 1), (1, 2)]
    branches = []
    n = 3
    for r in rs:
        center = n
        n += 1
        tips = list(range(n, n + r))
        n += r
        edges.append((0, center))
        edges.extend((center, tip) for tip in tips)
        branches.append((center, tips))
    adj = [[] for _ in range(n)]
    for u, v in edges:
        adj[u].append(v)
        adj[v].append(u)
    return adj, branches, edges


def tree_independence(adj, deleted=None):
    def visit(v, parent):
        out, inn = [1], [0, 1]
        for w in adj[v]:
            if w == parent or w == deleted:
                continue
            child_out, child_in = visit(w, v)
            out = mul(out, add(child_out, child_in))
            inn = mul(inn, child_out)
        return out, inn
    out, inn = visit(0, -1)
    return add(out, inn)


def formulas(rs):
    nsum = sum(rs)
    q = [1]
    for r in rs:
        q = mul(q, branch_poly(r))
    c = mul([1, 2], q)
    parent = add(c, [0] + power_l(nsum + 1))
    a0 = add(mul([1, 1], q), [0] + power_l(nsum))
    ais = {}
    tis = {}
    for r in sorted(set(rs)):
        reduced = list(rs)
        reduced.remove(r)
        h = [1]
        for s in reduced:
            h = mul(h, branch_poly(s))
        ai = add(mul(mul([1, 2], branch_poly(r - 1)), h), [0] + power_l(nsum))
        f = [0]
        for hdeg in range(r - 1):
            f = add(f, power_l(hdeg))
        tis[r] = mul(mul(mul([1, 2], f), h), [1])
        ais[r] = ai
    w = [0]
    for r, ai in ais.items():
        w = add(w, [rs.count(r) * r * coef(ai, k) for k in range(len(ai))])
    return nsum, q, c, parent, a0, ais, tis, w


def first_strict_descent(poly):
    # Includes the terminal zero-extended difference.
    for k in range(len(poly)):
        if coef(poly, k + 1) - coef(poly, k) < 0:
            return k
    raise AssertionError('no strict descent')


def inspect(rs, ranks):
    N, qpoly, C, P, A0, Ais, Tis, W = formulas(rs)
    adj, branches, edges = literal_graph(rs)
    assert tree_independence(adj) == P
    x = first_strict_descent(P)
    rows = []
    shift_checks = []
    shift_ranks = sorted({1, max(1, (N + 2) // 4), (N + 2) // 2})
    for k in shift_ranks:
        assert 1 <= k and 2 * k <= N + 2
        margins = {'endpoint_A0': coef(A0, k) * coef(C, k) - coef(A0, k + 1) * coef(C, k - 1)}
        margins.update({f'A{r}': coef(ai, k) * coef(C, k) - coef(ai, k + 1) * coef(C, k - 1)
                        for r, ai in Ais.items()})
        margins['weighted_W'] = coef(W, k) * coef(C, k) - coef(W, k + 1) * coef(C, k - 1)
        assert all(v >= 0 for v in margins.values())
        shift_checks.append({'k': k, 'guarded': True, 'RHS_minus_LHS_margins': margins})
    for p in ranks:
        assert x + 2 <= p and 3 * p < 2 * (N + 2) + 1 and 2 * p <= N + 2
        assert 1 <= p and 2 * p <= N + 2
        j, delta = p - 2, (N + 1) - (p - 2)
        D = comb(N, j + 1) - comb(N, j)
        e0 = coef(A0, p + 1) < coef(A0, p)
        selected = {r: coef(Ais[r], p + 1) < coef(Ais[r], p) for r in Ais}
        selected_r = [r for r, flag in selected.items() if flag]
        assert any(selected_r), 'weighted strict decrease must yield selected branch'
        # Cross-check a literal deletion from one selected arity (if available).
        chosen_r = selected_r[0]
        chosen_branch = next(tips for _, tips in branches if len(tips) == chosen_r)
        assert tree_independence(adj, chosen_branch[0]) == Ais[chosen_r]
        b = int(e0) + sum(rs.count(r) * r for r in selected_r)
        A = sum(rs.count(r) * r * coef(Tis[r], j) for r in selected_r)
        wmargin = coef(W, p) * coef(C, p) - coef(W, p + 1) * coef(C, p - 1)
        assert wmargin >= 0
        assert coef(C, p - 1) > coef(C, p) > 0 and coef(W, p) > 0
        # Positive denominator preserves order; strict C ratio makes W[p+1] < W[p].
        assert coef(W, p + 1) < coef(W, p)
        assert 0 < D and delta > 0
        for r in selected_r:
            assert 2 * coef(Tis[r], j) >= 3 * delta * D
        R = sum(rs.count(r) * r for r in selected_r)
        assert R >= 2 and A >= (R + 1) * delta * D >= b * delta * D
        tnum, tden = coef(C, j + 1), coef(C, j)
        assert 0 < tnum < tden
        payment_factor_num = delta * (tden - tnum) + tnum
        assert payment_factor_num >= tden
        assert payment_factor_num * A >= tden * b * D
        rows.append({
            'p': p, 'x': x, 'j': j, 'delta': delta, 'D_j': D,
            'strict_endpoint_flag': e0, 'strict_selected_arities': selected_r,
            'tip_multiplicity_R': R, 'b_original_tag_count': b,
            'weighted_shift_margin_RHS_minus_LHS': wmargin,
            'C_pminus1_gt_Cp_gt_0': True, 'W_p_positive': True,
            'literal_parent_matches_factored_P': True,
            'literal_selected_tip_deletion_matches_Ai': True,
            'selected_A': A, 'selected_mass_margin': A - b * delta * D,
            'ratio_t': [tnum, tden],
            'payment_factor_delta_times_(1-t+t/delta)': [payment_factor_num, tden],
        })
    return {'profile': {'r_counts': [rs.count(2), rs.count(3), rs.count(4)], 'm': len(rs), 'N': N,
                        'n': len(adj), 'alpha': N + 2, 'edge_count': len(edges), 'first_strict_descent_x': x},
            'guarded_shift_boundary_and_interior_checks': shift_checks, 'actual_eligible_rows': rows}


checks = [inspect([4] * 40, [80, 81]), inspect([2, 3] + [4] * 30, [63])]
rs = [2] * 38 + [4]
N, _, C, P, _, Ais, _, _ = formulas(rs)
adj, branches, edges = literal_graph(rs)
deleted_tip = branches[-1][1][-1]
literal_P = tree_independence(adj)
literal_A = tree_independence(adj, deleted_tip)
k = 77
assert literal_P == P and literal_A == Ais[4]
x = first_strict_descent(P)
shifted_margin = coef(literal_A, k) * coef(C, k) - coef(literal_A, k + 1) * coef(C, k - 1)
assert (len(adj), x, shifted_margin, 2 * k <= N + 2) == (122, 41, -49239834336, False)
checks.append({'known_unguarded_control': {'r_counts': [38, 0, 1], 'N': N, 'n': len(adj),
               'alpha': N + 2, 'x': x, 'k': k,
               'literal_parent_and_deletion_match_factored_forms': True,
               'signed_shifted_margin': shifted_margin,
               'guard_2k_le_Nplus2': 2 * k <= N + 2,
               'guard_3k_lt_2alpha_plus1': 3 * k < 2 * (N + 2) + 1}})
print(json.dumps(checks, indent=2))
