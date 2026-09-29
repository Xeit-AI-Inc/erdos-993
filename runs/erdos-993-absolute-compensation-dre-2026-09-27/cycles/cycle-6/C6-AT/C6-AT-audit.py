"""Independent exact spot audit; no producer code is imported or executed."""
import hashlib
import json
from fractions import Fraction
from math import comb, factorial
from pathlib import Path

ROOT = next(p for p in Path(__file__).resolve().parents
            if (p/'sources/cycle6/C6-SURPLUS-PREFIX-EXPECTED-COUNTS.json').is_file())


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def B(r):
    a = [comb(r, j) for j in range(r + 1)]
    a[1] += 1
    return a


def minors(a, b):
    return [coeff(a, u) * coeff(b, v) - coeff(a, v) * coeff(b, u)
            for u in range(max(len(a), len(b)))
            for v in range(u + 1, max(len(a), len(b)))]


def polynomials(rs, marked):
    q = [1]
    h = [1]
    for i, r in enumerate(rs):
        q = mul(q, B(r))
        if i != marked:
            h = mul(h, B(r))
    n = sum(rs)
    c = mul([1, 2], q)
    u = mul(mul([1, 2], B(rs[marked] - 1)), h)
    e = [0] + [comb(n, j) for j in range(n + 1)]
    return n, c, u, e


def exact_row(rs, marked, k):
    n, c, u, e = polynomials(rs, marked)
    counts = [rs.count(r) for r in (2, 3, 4)]
    h = 1 + sum(a * w for a, w in zip(counts, (2, 4, 7)))
    em = coeff(e, k) * coeff(c, k) - coeff(e, k + 1) * coeff(c, k - 1)
    surplus = (h + 1) * coeff(u, k) * coeff(c, k) + (k + 1) * (h - k + 1) * em
    full = (coeff(u, k) + coeff(e, k)) * coeff(c, k) - (coeff(u, k + 1) + coeff(e, k + 1)) * coeff(c, k - 1)
    return dict(counts=counts, N=n, h=h, r=rs[marked], k=k,
                guard=(1 <= k and 2 * k <= n + 2), E_minor=str(em),
                surplus=str(surplus), full_tip_minor=str(full),
                U_k=str(coeff(u, k)), U_kp1=str(coeff(u, k + 1)),
                C_k=str(coeff(c, k)), C_km1=str(coeff(c, k - 1)),
                E_k=str(coeff(e, k)), E_kp1=str(coeff(e, k + 1)))


def g(r, n, k):
    return Fraction(2 * r, 2 * r + 1) * Fraction(comb(n-r, k-1), comb(n, k))


def taylor(d, x):
    return sum((x ** j / factorial(j) for j in range(d + 1)), Fraction(0))


def main():
    local = {}
    for r in (2, 3, 4):
        mm = minors(B(r-1), B(r))
        assert all(v >= 0 for v in mm)
        local[str(r)] = mm
    endpoint = minors([1, 1], [1, 2])
    assert endpoint == [1]
    endpoint_factor = {}
    for r in (2, 3, 4):
        left = mul([1, 1], B(r))
        right = mul([1, 2], B(r-1))
        diff = [coeff(left, j) - coeff(right, j)
                for j in range(max(len(left), len(right)))]
        expected = [0, 0] + [comb(r-1, j) - (j == 0)
                              for j in range(r)]
        assert diff == expected and all(v >= 0 for v in diff)
        endpoint_factor[str(r)] = diff
    operator = {}
    for r in (1, 2, 3, 4):
        f = B(r)
        out = [3 * (j + 1) * coeff(f, j + 1) + 2 * j * coeff(f, j)
               - 2 * r * coeff(f, j) for j in range(r + 1)]
        assert all(v >= 0 for v in out)
        operator[str(r)] = out
    assert operator == {'1': [4, 0], '2': [5, 0, 0],
                        '3': [6, 2, 3, 0], '4': [7, 6, 12, 4, 0]}
    for r, order in ((1, 1), (2, 2), (3, 4), (4, 7)):
        f = B(r)
        for k in range(1, r):
            assert k*(order-k)*f[k]**2 >= (k+1)*(order-k+1)*f[k-1]*f[k+1]
    ratios = {}
    for n in (200, 201, 202, 203):
        lo = (n + 1) // 4 + 1
        hi = (n + 2) // 2
        ks = sorted({lo, min(lo + 1, hi), (lo + hi) // 2, hi})
        vals = []
        for k in ks:
            g2, g3, g4 = (g(r, n, k) for r in (2, 3, 4))
            assert g2 >= g3 >= g4 >= Fraction(1, 20)
            vals.append({'k': k, 'g4': str(g4), 'g3_over_g2': str(g3/g2),
                         'g4_over_g3': str(g4/g3)})
        ratios[str(n)] = vals
    assert g(4, 200, 101) == Fraction(480053, 8820675)
    a = Fraction(99, 20)
    e8, e7 = taylor(8, a), taylor(7, a)
    assert e8 == Fraction(2162945642595007, 16384000000000) > 102
    assert e7 == Fraction(88220922596671, 716800000000) > 20
    for t in (Fraction(0), Fraction(1, 20), Fraction(5, 2)):
        assert taylor(8, a+t) >= e8+t*e7 > 102+20*t

    rows = [exact_row([2], 0, 1), exact_row([2, 3, 4], 0, 1),
            exact_row([2, 3, 4], 1, 4), exact_row([2, 3, 4], 2, 5),
            exact_row([3]*22, 0, 27), exact_row([2]*38+[4], 38, 77)]
    assert rows[0]['surplus'] == '98' and rows[0]['full_tip_minor'] == '19'
    assert rows[4]['E_minor'] == '-518620474811633289768751398606375936'
    assert rows[4]['full_tip_minor'] == '777419068009671422357461955841645743808'
    assert not rows[5]['guard'] and rows[5]['full_tip_minor'] == '-49239834336'
    assert all(int(r['surplus']) > 0 for r in rows if r['guard'])
    n100, c100, u100, e100 = polynomials([2]*100, 0)
    assert n100 == 200
    tail_profile_checks = []
    for k in (50, 51, 75, 101):
        ck, ckm = coeff(c100, k), coeff(c100, k-1)
        assert 3*k*ck >= 2*(n100+2-k)*ckm
        em = coeff(e100, k)*ck - coeff(e100, k+1)*ckm
        surplus = 202*coeff(u100, k)*ck+(k+1)*(202-k)*em
        assert surplus > 0
        if k > 50:
            lam = Fraction(202, (k+1)*(202-k))
            assert Fraction(em, coeff(e100, k)*ck) > Fraction(-1, 2)
            assert lam*Fraction(coeff(u100, k), coeff(e100, k)) > Fraction(1, 2)
        tail_profile_checks.append({'k': k, 'C_ratio_floor': True,
                                    'positive_surplus': True,
                                    'surplus_decimal_digits': len(str(surplus))})

    # Check the source's finite-result rows against independently enumerated
    # profile/rank coverage counts, without replaying the 56M sign tests.
    result = json.loads((ROOT/'cycles/cycle-6/C6-T2/run-full/RESULT.json').read_text())
    expected = json.loads((ROOT/'sources/cycle6/C6-SURPLUS-PREFIX-EXPECTED-COUNTS.json').read_text())
    assert result['status'] == 'complete' and len(result['rows']) == 99
    assert len(expected['layers']) == 99
    profiles = tests = 0
    global_min = None
    for m in range(1, 100):
        pc = tc = 0
        for a2 in range(m + 1):
            for a3 in range(m-a2 + 1):
                a4 = m-a2-a3
                n = 2*a2+3*a3+4*a4
                pc += 1
                tc += sum(a > 0 for a in (a2, a3, a4)) * ((n+2)//2)
        source = result['rows'][m-1]
        forecast = expected['layers'][m-1]
        checkpoint = json.loads((ROOT/f'cycles/cycle-6/C6-T2/run-full/RESULT-checkpoints/m-{m:02d}.json').read_text())
        assert checkpoint == source
        assert (pc, tc) == (source['profiles'], source['represented_tip_rank_tests'])
        assert (pc, tc) == (forecast['profiles'], forecast['represented_tip_rank_tests'])
        assert not source['failures']
        margin = int(source['minimum_signed_surplus']['margin'])
        global_min = margin if global_min is None else min(global_min, margin)
        profiles += pc
        tests += tc
    assert (profiles, tests) == (171699, 56245000)
    assert result['totals'] == {'profiles': profiles, 'represented_tip_rank_tests': tests}
    assert global_min == 98
    report = {'local_tip_minors': local, 'endpoint_minors': endpoint,
              'endpoint_factor_coefficients': endpoint_factor,
              'monomial_operator_coefficients': operator, 'g_boundary_interior': ratios,
              'taylor': {'E8_99_over_20': str(e8), 'E7_99_over_20': str(e7)},
              'literal_rows': rows, 'homogeneous_m100_boundary_interior': tail_profile_checks,
              'finite_result_coverage':
              {'profiles': profiles, 'represented_tip_rank_tests': tests,
               'per_m_rows_checked': 99, 'checkpoint_rows_checked': 99,
               'reported_global_minimum': global_min, 'sign_rows_recomputed': 0,
               'method': 'independent combinatorial coverage only'}}
    Path(__file__).resolve().with_name('C6-AT-audit.json').write_text(json.dumps(report, indent=2)+'\n')
    print('C6-AT exact audit passed')


if __name__ == '__main__':
    main()
