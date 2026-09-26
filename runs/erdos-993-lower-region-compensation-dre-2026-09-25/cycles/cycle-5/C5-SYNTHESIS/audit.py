"""Small independent synthesis checks, using only sealed adjudicator sources."""
from fractions import Fraction
from math import comb, factorial
from pathlib import Path
import hashlib
import json

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent


def read(path):
    return json.loads((ROOT / path).read_text())


def sha(path):
    return hashlib.sha256((ROOT / path).read_bytes()).hexdigest()


def coeff(a, i):
    return a[i] if 0 <= i < len(a) else 0


def convolve(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def main():
    case = read('packets/C5-SYNTHESIS.json')
    common = read('packets/C5-COMMON.json')
    assert all(sha(x['path']) == x['sha256'] for x in case['allowed_source_files'])
    allowed = {x['path']: x['sha256'] for x in common['allowed_source_files']}
    common_checked = common['read_first'] + [
        'inputs/C4-r27-linear-bound-intake/Main.lean',
        'inputs/C4-r27-linear-bound-intake/THEOREM-CONTRACT.yaml',
        'inputs/C4-r27-linear-bound-intake/VERIFICATION-REPORT.md',
        'inputs/C4-r27-linear-bound-intake/kernel-verification.json',
    ]
    assert all(sha(p) == allowed[p] for p in common_checked)
    sources = [read(f'cycles/cycle-5/C5-A{q}/RETURN.json') for q in 'TFU']
    ids = [c['claim_id'] for src in sources for c in src['claims']]
    assert len(ids) == len(set(ids)) == 24
    assert set(ids) == set(case['required_covered_claim_ids'])
    assert [len(s['claims']) for s in sources] == [6, 7, 11]

    factors = {'L': ([1, 1], 1), '1+2z': ([1, 2], 1),
               'B': ([1, 4, 3, 1], 4), 'C': ([1, 3, 1], 2),
               'D': ([2, 5, 2], 2)}
    for a, order in factors.values():
        norm = [Fraction(v, comb(order, i)) for i, v in enumerate(a)]
        assert all(norm[i] ** 2 >= norm[i - 1] * norm[i + 1]
                   for i in range(1, len(norm) - 1))
        degree = len(a) - 1
        assert all(2 * (degree - i) * v <= 3 * (i + 1) * coeff(a, i + 1)
                   <= 6 * (degree - i) * v for i, v in enumerate(a))
    B = factors['B'][0]
    pairs = [([1, 1], [1, 2]), ([1, 3, 1], B),
             ([6, 15, 6], convolve([1, 2], B))]
    leads = []
    for c, g in pairs:
        vals = [coeff(c, r) * coeff(g, s) - coeff(c, s) * coeff(g, r)
                for r in range(max(len(c), len(g)))
                for s in range(r + 1, max(len(c), len(g)))]
        assert min(vals) >= 0
        leads.append(c[0] * g[1] - c[1] * g[0])
    assert leads == [1, 1, 21]
    K = Fraction(factorial(8)) * Fraction(125, 124) ** 8 * Fraction(150, 49) ** 27
    endpoints = {name: Fraction(c * 2003, 1000 ** 8) * K for name, c in
                 [('LC', 24), ('A0', 47), ('Astar', 431), ('R', Fraction(14688, 21))]}
    assert all(r < 1 for r in endpoints.values())
    analytic = read('cycles/cycle-5/C5-AT/ANALYTIC-CHECK.json')['cutoffs']
    assert all([v.numerator, v.denominator] == [int(analytic[k]['numerator']),
                                                  int(analytic[k]['denominator'])]
               for k, v in endpoints.items() if k in analytic)
    assert 212336130412243110 + 66 * (-7560098737536570631) == -498754180547001418536
    assert 2 * (-4875) + 15 * (-7537) == -122805
    finite = read('cycles/cycle-5/C5-AT/RESULTS.json')
    profiles = read('cycles/cycle-5/C5-AT/PROFILE-CENSUS.json')
    u1 = read('cycles/cycle-5/C5-AU/EVIDENCE.json')
    out = {
        'schema': 'e993.c5.synthesis.audit.v1',
        'case_source_pins': len(case['allowed_source_files']),
        'case_source_pins_match': True,
        'common_scope_pins_checked': common_checked,
        'common_scope_pins_match': True,
        'source_claim_counts': [len(s['claims']) for s in sources],
        'covered_claim_ids': ids,
        'factor_checks': 'finite-order ULC and displayed derivative inequalities pass',
        'short_mixed_minor_leads': leads,
        'analytic_cutoffs': {k: [str(v.numerator), str(v.denominator)] for k, v in endpoints.items()},
        'all_analytic_cutoffs_below_one': True,
        'finite_base_reported': finite['finite_base'],
        'heterogeneous_stats_reported': profiles['stats'],
        'u1_correction_reported': {k: u1[k] for k in
                                   ['eligible_rows', 'selector_values_changed_from_wrong_source',
                                    'selector_strict_sign_changes', 'nonnegative_full_sums']},
        't22_full_sum_arithmetic_passes': True,
        'cover6_full_sum_arithmetic_passes': True,
        'limitation': 'Does not replay the 1,507,464 finite margins or verify a Lean kernel; those remain pinned adjudicator evidence and imported receipts.'
    }
    (HERE / 'EVIDENCE.json').write_text(json.dumps(out, indent=2) + '\n')


if __name__ == '__main__':
    main()
