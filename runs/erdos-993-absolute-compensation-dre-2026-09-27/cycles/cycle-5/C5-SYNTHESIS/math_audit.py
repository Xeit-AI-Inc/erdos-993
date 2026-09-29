"""Independent exact-integer checks for the C5 synthesis; no source script imports."""
import json
from math import comb


def add(a, b):
    return [((a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0)) for i in range(max(len(a), len(b)))]


def mul(a, b, cap=None):
    out = [0] * (len(a) + len(b) - 1 if cap is None else min(cap + 1, len(a) + len(b) - 1))
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            if i + j < len(out):
                out[i + j] += x * y
    return out


def power(a, n, cap=None):
    out = [1]
    while n:
        if n & 1:
            out = mul(out, a, cap)
        n //= 2
        if n:
            a = mul(a, a, cap)
    return out


def at(a, k):
    return a[k] if 0 <= k < len(a) else 0


def delta(a, k):
    return at(a, k + 1) - at(a, k)


def minor(a, c, k):
    return at(a, k) * at(c, k) - at(a, k + 1) * at(c, k - 1)


def block(r):
    b = [comb(r, i) for i in range(r + 1)]
    b[1] += 1
    return b


def shift(a):
    return [0] + a


def profile(counts, cap=None):
    a2, a3, a4 = counts
    nbranches = a2 + a3 + a4
    n = 3 + sum((r + 1) * counts[r - 2] for r in (2, 3, 4))
    N = sum(r * counts[r - 2] for r in (2, 3, 4))
    q = N + 1
    Q = [1]
    for r in (2, 3, 4):
        Q = mul(Q, power(block(r), counts[r - 2], cap), cap)
    G = [1, 2]
    C = mul(G, Q, cap)
    E = shift([comb(N, t) for t in range(N + 1)])[:cap + 1 if cap is not None else None]
    d = shift([comb(q, t) for t in range(q + 1)])[:cap + 1 if cap is not None else None]
    P = add(C, d)
    A0 = add(mul([1, 1], Q, cap), E)
    tips = {}
    U = [0]
    W = [0]
    for r in (2, 3, 4):
        if counts[r - 2]:
            H = [1]
            for s in (2, 3, 4):
                H = mul(H, power(block(s), counts[s - 2] - (s == r), cap), cap)
            Ur = mul(mul(G, block(r - 1), cap), H, cap)
            Ar = add(Ur, E)
            tips[r] = (Ur, Ar)
            U = add(U, [r * counts[r - 2] * t for t in Ur])
            W = add(W, [r * counts[r - 2] * t for t in Ar])
    x = next((k for k in range(len(P) + 1) if delta(P, k) < 0), None)
    return dict(counts=counts, m=nbranches, n=n, N=N, alpha=N + 2, q=q, C=C, E=E, d=d, P=P, A0=A0, tips=tips, U=U, W=W, x=x)


def eligible_row(v, p):
    N, C, E, x = (v[t] for t in ('N', 'C', 'E', 'x'))
    a = v['counts']
    j, q, alpha = p - 2, v['q'], v['alpha']
    e0 = int(delta(v['A0'], p) < 0)
    er = {r: int(delta(v['tips'][r][1], p) < 0) for r in v['tips']}
    b = e0 + sum(a[r - 2] * r * er[r] for r in er)
    A = 0
    for r in er:
        # T_r = G(1+L+...+L^(r-2))H_r, computed in the z basis.
        fr = [sum(comb(h, z) for h in range(z, r - 1)) for z in range(r - 1)]
        H = [1]
        for s in (2, 3, 4):
            H = mul(H, power(block(s), a[s - 2] - (s == r)))
        Tr = mul(mul([1, 2], fr), H)
        A += a[r - 2] * r * er[r] * at(Tr, j)
    D = comb(N, j + 1) - comb(N, j)
    delta_q = q - j
    payment = (delta_q * at(C, j) - (delta_q - 1) * at(C, j + 1)) * A - b * delta_q * D * at(C, j)
    return dict(p=p, j=j, x=x, guards=dict(first=x + 2 <= p, three=3 * p < 2 * alpha + 1, half=2 * p <= alpha), selector_deltas=dict(endpoint=delta(v['A0'], p), tips={r: delta(v['tips'][r][1], p) for r in er}), flags=dict(endpoint=e0, tips=er), b=b, A=A, D=D, Cj=at(C, j), Cj1=at(C, j + 1), payment_margin=payment)


def activity(m, k):
    # B4(t)=L^4+t z on all undistinguished branches; coefficient lists are in t.
    L4 = [comb(4, i) for i in range(5)]
    # The t^t term has z^t L^(4(m-1-t)).
    def coefficient(core, t, rank):
        base = mul([1, 2], core)
        base = mul(base, power(L4, m - 1 - t, rank), rank)
        return comb(m - 1, t) * at(base, rank - t)
    A = [[coefficient(block(3), t, rank) + (comb(4 * m, rank - 1) if t == 0 and 1 <= rank <= 4 * m + 1 else 0) for t in range(m)] for rank in (k, k + 1)]
    C = [[coefficient(block(4), t, rank) for t in range(m)] for rank in (k - 1, k)]
    ans = [0] * (2 * m - 1)
    for t in range(m):
        for u in range(m):
            ans[t + u] += A[0][t] * C[1][u] - A[1][t] * C[0][u]
    return ans


def main():
    assert block(2) == [1, 3, 1] and block(3) == [1, 4, 3, 1] and block(4) == [1, 5, 6, 4, 1]
    F4 = add(add([1], [1, 1]), [1, 2, 1])
    assert F4 == [3, 3, 1] and mul([1, 2], F4) == [3, 9, 7, 2]
    out = {'basis': {'B2': block(2), 'B3': block(3), 'B4': block(4), 'F4_z': F4, 'GF4_z': mul([1, 2], F4)}}
    v = profile((0, 22, 0))
    assert (v['n'], v['N'], v['x']) == (91, 66, 32)
    out['E_control'] = dict(profile=v['counts'], n=v['n'], N=v['N'], k=27, guard=2 * 27 <= v['alpha'], E_minor=minor(v['E'], v['C'], 27), endpoint_minor=minor(v['A0'], v['C'], 27), tip_minor=minor(v['tips'][3][1], v['C'], 27), weighted_minor=minor(v['W'], v['C'], 27), eligible=eligible_row(v, 34))
    assert out['E_control']['E_minor'] == -518620474811633289768751398606375936
    out['E_control']['boundary_minors'] = {str(k): minor(v['tips'][3][1], v['C'], k) for k in (1, 27, 32, 34)}
    v = profile((10, 0, 0))
    out['root_control'] = dict(profile=v['counts'], n=v['n'], N=v['N'], x=v['x'], p=6, j=4, d4=at(v['d'], 4), d5=at(v['d'], 5), C4=at(v['C'], 4), C5=at(v['C'], 5), minor=at(v['d'], 5) * at(v['C'], 4) - at(v['d'], 4) * at(v['C'], 5), eligible=eligible_row(v, 6))
    assert out['root_control']['minor'] == -3549105
    v = profile((0, 12, 10))
    out['root_extension'] = dict(profile=v['counts'], n=v['n'], N=v['N'], x=v['x'], rows={str(j): dict(p=j + 2, half=2 * (j + 2) <= v['alpha'], root_minor=at(v['d'], j + 1) * at(v['C'], j) - at(v['d'], j) * at(v['C'], j + 1), eligible=eligible_row(v, j + 2)) for j in (37, 38)})
    assert v['x'] == 37 and out['root_extension']['rows']['38']['root_minor'] == 226392114664217074296074723522548726747489840
    out['activity'] = {str(m): {'k': m + 4, 'guard': 2 * (m + 4) <= 4 * m + 2, 'layers': activity(m, m + 4)} for m in (3, 4, 5)}
    v3 = profile((0, 0, 3))
    out['activity']['3']['n'] = v3['n']
    out['activity']['3']['N'] = v3['N']
    out['activity']['3']['eligible_diagnostic'] = eligible_row(v3, 7)
    out['activity']['3']['full_tip_minor'] = minor(v3['tips'][4][1], v3['C'], 7)
    out['activity']['3']['full_weighted_minor'] = minor(v3['W'], v3['C'], 7)
    assert out['activity']['3']['layers'] == [1898616, 171542, 6175, -66, 0]
    assert all(out['activity'][str(m)]['layers'][2 * m - 3] == -33 * (m - 1) for m in (3, 4, 5))
    v = profile((0, 0, 4))
    k = 8; r = 4; h = 1 + 7 * 4; g = (k + 1) * (h - k + 1); Ui = v['tips'][r][0]
    out['surplus_control'] = dict(profile=v['counts'], k=k, N=v['N'], h=h, g=g, exact=(h + 1) * at(Ui, k) * at(v['C'], k) + g * minor(v['E'], v['C'], k), crude=2 * (v['N'] + 2 - k) * (h + 1) * at(Ui, k) - at(v['E'], k) * (v['N'] - k - 1) * g)
    assert out['surplus_control']['exact'] == 45380234160 and out['surplus_control']['crude'] == -87840
    out['surplus_boundaries'] = []
    for counts, k in (((1, 0, 0), 1), ((1, 0, 0), 2), ((2, 0, 0), 3)):
        vsmall = profile(counts)
        r = 2; hs = 1 + 2 * counts[0]; ds = (k + 1) * (hs - k + 1)
        us = vsmall['tips'][r][0]; cs = vsmall['C']
        out['surplus_boundaries'].append(dict(profile=counts, k=k, guard=2 * k <= vsmall['alpha'], value=(hs + 1) * at(us, k) * at(cs, k) + ds * minor(vsmall['E'], cs, k), main_ratio_margin=at(us, k) * at(cs, k + 1) - at(us, k + 1) * at(cs, k), curvature_margin=k * (hs - k) * at(cs, k)**2 - ds * at(cs, k - 1) * at(cs, k + 1)))
    v = profile((0, 0, 24))
    k = 49; r = 4; h = 1 + 7 * 24; g = (k + 1) * (h - k + 1); Ui = v['tips'][r][0]
    out['surplus_eligible'] = dict(profile=v['counts'], n=v['n'], N=v['N'], k=k, h=h, exact=(h + 1) * at(Ui, k) * at(v['C'], k) + g * minor(v['E'], v['C'], k), crude=2 * (v['N'] + 2 - k) * (h + 1) * at(Ui, k) - at(v['E'], k) * (v['N'] - k - 1) * g, eligible=eligible_row(v, k))
    assert out['surplus_eligible']['crude'] == -1134884788104385426929377214036680
    v = profile((38, 0, 1))
    out['out_of_guard'] = dict(profile=v['counts'], n=v['n'], N=v['N'], x=v['x'], k=77, guard=2 * 77 <= v['alpha'], tip_minor=minor(v['tips'][4][1], v['C'], 77), selector_deltas=dict(endpoint=delta(v['A0'], 77), tip4=delta(v['tips'][4][1], 77)))
    assert out['out_of_guard']['tip_minor'] == -49239834336 and not out['out_of_guard']['guard']
    v = profile((151, 0, 0))
    old_N, kk = 300, 4
    correction = 2 * comb(302, 3) - old_N * comb(300, 2)
    out['recurrence_control'] = dict(profile=v['counts'], n=v['n'], N=v['N'], x=v['x'], k=kk, guard=2 * kk <= v['alpha'], correction=correction, correction_k1=2, correction_k2=304, weighted_minor=minor(v['W'], v['C'], kk), upper_guard_minor=minor(v['W'], v['C'], v['alpha'] // 2), eligible_diagnostic=eligible_row(v, kk))
    assert correction == -4364800 and out['recurrence_control']['weighted_minor'] == 185586251584170562390
    out['abstract_sum'] = dict(separate=(-10, -80), total=90 * 101 - 81 * 101)
    out['abstract_floor'] = dict(f=[1, 2, 100], C=[1, 2, 1], k1=2 * 2 - 100, k2=100)
    scanned_profiles = scanned_ranks = 0
    minimum = None
    argmin = None
    for m in range(1, 21):
        for a2 in range(m + 1):
            for a3 in range(m - a2 + 1):
                counts = (a2, a3, m - a2 - a3)
                v = profile(counts)
                scanned_profiles += 1
                for k in range(1, v['alpha'] // 2 + 1):
                    scanned_ranks += 1
                    value = minor(v['W'], v['C'], k)
                    if minimum is None or value < minimum:
                        minimum, argmin = value, (counts, k)
    out['weighted_bounded_scan'] = dict(m_le=20, profiles=scanned_profiles, guarded_ranks=scanned_ranks, minimum=minimum, argmin=argmin)
    assert (scanned_profiles, scanned_ranks, minimum, argmin) == (1770, 41205, 38, ((1, 0, 0), 1))
    print(json.dumps(out, indent=2))


if __name__ == '__main__':
    main()
