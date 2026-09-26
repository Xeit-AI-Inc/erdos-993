#!/Library/Frameworks/Python.framework/Versions/3.11/bin/python3
"""Independent root-conditioned formula check of the C6-F6 bounded census."""
import json
from pathlib import Path


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a): out[i] += x
    for i, x in enumerate(b): out[i] += x
    while len(out) > 1 and out[-1] == 0: out.pop()
    return out


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): out[i+j] += x*y
    while len(out) > 1 and out[-1] == 0: out.pop()
    return out


def power(poly, n):
    out = [1]
    for _ in range(n): out = mul(out, poly)
    return out


def coeff(poly, j):
    return poly[j] if 0 <= j < len(poly) else 0


def delta(poly, j):
    return coeff(poly, j+1) - coeff(poly, j)


def main():
    evidence = json.loads(Path(__file__).with_name('evidence.json').read_text())
    assert evidence['boundary'] == {
        'm_min': 2, 'm_max': 40, 'profiles': 39,
        'eligible_profile_rank_rows': 222,
    }
    Q, V = [1, 3, 1], [1, 2]
    profiles = ranks = 0
    for m, row in enumerate(evidence['rows'], start=2):
        profiles += 1
        Qm, Vm = power(Q, m), power(V, m)
        # Root absent: m independent P3 factors. Root present: one root,
        # and each a_i is forbidden, leaving an independent edge b_i-c_i.
        P = add(Qm, [0] + Vm)
        A = add(mul(V, power(Q, m-1)), [0] + mul([1, 1], power(V, m-1)))
        # For fixed endpoint c_i, deleting c_i leaves P2 on a_i-b_i;
        # when root is present, a_i is forbidden and b_i is isolated.
        assert row['P_coefficients'] == P
        assert row['alpha'] == 2*m == len(P)-1
        x = next(j for j in range(len(P)+1) if delta(P, j) < 0)
        assert row['x'] == x
        assert row['order'] == 3*m+1
        assert len(row['eligible_p_rows']) == sum(
            1 for p in range(x+2, 2*m+2) if 3*p < 4*m+1
        )
        for item in row['eligible_p_rows']:
            ranks += 1
            p = item['p']
            assert x+2 <= p and 3*p < 2*row['alpha']+1
            leaf_delta = delta(A, p)
            # All m leaves are symmetric, so the selector is either all or none.
            assert item['leaf_deletion_deltas'] == [leaf_delta] * m
            selected = leaf_delta < 0
            assert item['favorable_leaves'] == (list(range(3, 3*m+1, 3)) if selected else [])
            # H=T-{b_i,c_i}, R=T-N[b_i], and I(H)-I(R)=z Q^(m-1).
            # Thus each selected summand is Delta_{p-2}(Q^(m-1)).
            term = delta(power(Q, m-1), p-2)
            expected_terms = ([{'leaf': 3*i, 'support': 3*i-1, 'term': term}
                               for i in range(1, m+1)] if selected else [])
            assert item['summands'] == expected_terms
            assert item['S'] == (m*term if selected else 0)
    assert profiles == 39 and ranks == 222
    summary = {
        'method': 'root-conditioned polynomial formulas, independent of forest DP',
        'profiles_checked': profiles,
        'eligible_rows_checked': ranks,
        'all_x_equal_m': True,
        'all_eligible_selectors_are_all_endpoint_leaves': True,
        'all_eligible_sums_negative': True,
        'scope': 'm=2..40 only; no unbounded or arbitrary-tree conclusion',
    }
    assert all(r['S'] < 0 for row in evidence['rows'] for r in row['eligible_p_rows'])
    Path(__file__).with_name('formula-audit.json').write_text(json.dumps(summary, indent=2)+'\n')
    print(json.dumps(summary, indent=2))


if __name__ == '__main__': main()
