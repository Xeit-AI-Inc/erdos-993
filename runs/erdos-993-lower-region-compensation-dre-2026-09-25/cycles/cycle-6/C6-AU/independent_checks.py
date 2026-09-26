#!/Library/Frameworks/Python.framework/Versions/3.11/bin/python3
"""Small exact adjudication checks; no source artifact is modified."""
from fractions import Fraction
from math import comb
from pathlib import Path
import json

HERE = Path(__file__).resolve().parent

def convolution(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out

def finite_ulc(a, order):
    degree = len(a) - 1
    assert order >= degree and all(x > 0 for x in a)
    return all(Fraction(a[j], comb(order, j)) ** 2 >=
               Fraction(a[j-1], comb(order, j-1)) *
               Fraction(a[j+1], comb(order, j+1))
               for j in range(1, degree))

def least_order(a):
    n = len(a) - 1
    bounds = [n]
    for j in range(1, n):
        A = j*a[j]**2 - (j+1)*a[j-1]*a[j+1]
        R = (j+1)*a[j-1]*a[j+1]
        if A <= 0:
            return None, j
        bounds.append(j + (R+A-1)//A)
    d = max(bounds)
    assert finite_ulc(a, d)
    return d, None

def poly_power(a, q):
    out = [1]
    for _ in range(q):
        out = convolution(out, a)
    return out

def factor(r, s, q):
    F = [comb(r-1, j+1) for j in range(r-1)]
    B = [comb(s, j) + (j == 1) for j in range(s+1)]
    return convolution(F, poly_power(B, q))

# The U1 interface: B has degree 3 yet finite order 4, while order 3 fails.
B3 = [1, 4, 3, 1]
ulc = {
    'B_coefficients': B3,
    'B_order3': finite_ulc(B3, 3),
    'B_order4': finite_ulc(B3, 4),
    'B_least_order': least_order(B3)[0],
    'factor_least_orders': {
        'L': least_order([1, 1])[0],
        'G': least_order([1, 2])[0],
        'B': least_order(B3)[0],
        'one_three_one': least_order([1, 3, 1])[0],
        'two_five_two': least_order([2, 5, 2])[0],
    },
}
assert ulc['B_order3'] is False and ulc['B_order4'] is True
assert ulc['factor_least_orders'] == {'L': 1, 'G': 1, 'B': 4,
                                       'one_three_one': 2, 'two_five_two': 2}

# U3: recompute two informative rows directly from binomial coefficients.
u3 = {}
for r, s in [(2, 2), (20, 2)]:
    u3[f'{r},{s}'] = [dict(q=q, degree=len(factor(r,s,q))-1,
                           least_order=least_order(factor(r,s,q))[0],
                           blocking_index=least_order(factor(r,s,q))[1])
                       for q in range(1,5)]
assert u3['20,2'][-1]['least_order'] == 117
assert all(row['least_order'] is None for row in u3['20,2'][:3])

# U4: Delta_p(H+zR) has PLUS Delta_(p-1)(R).
H, R, p = [1, 3, 2, 1, 0], [1, 2, 1, 0], 2
J = [H[j] + (R[j-1] if j else 0) for j in range(len(H))]
selector = {'H': H, 'R': R, 'p': p,
            'delta_full': J[p+1]-J[p],
            'delta_H_plus_delta_R': (H[p+1]-H[p])+(R[p]-R[p-1])}
assert selector['delta_full'] == selector['delta_H_plus_delta_R']

# U5: with hub 0 and arm leaf 2 fixed, all chokes are absent. A private
# leaf's support is its support vertex, whose other neighbor is a choke;
# hence private tags are inactive. The arm tag's support 1 sees hub 0.
n = 8*92
lower = 2**490 * comb(n,490)
upper = 2**491 * comb(n,491)
assert upper*491 == lower*492
sector = {
    'pair_count': n,
    'lower_rank': 490,
    'upper_rank': 491,
    'active_tags_per_member': 1,
    'lower_mass': str(lower),
    'upper_mass': str(upper),
    'upper_over_lower': '492/491',
    'deletion_only_deficit': str(upper-lower),
    'deficit_formula': '|R_490|/491',
    'producer_weight_upper_over_lower': '493/491',
    'producer_weight_is_active_tag_weight': False,
}
assert upper-lower == lower//491

out = {'U1_finite_ULC': ulc, 'U3_spot_checks': u3,
       'U4_selector_sign': selector, 'U5_active_sector': sector}
(HERE/'INDEPENDENT-CHECKS.json').write_text(json.dumps(out, indent=2, sort_keys=True)+'\n')
print(json.dumps({'U1': ulc['factor_least_orders'],
                  'U3_20_2': u3['20,2'],
                  'U4': selector['delta_full'],
                  'U5_ratio': sector['upper_over_lower']}))
