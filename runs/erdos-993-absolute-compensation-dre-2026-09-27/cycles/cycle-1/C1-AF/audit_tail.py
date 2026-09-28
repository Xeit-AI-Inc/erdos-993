"""Independent exact checks of the predecessor's 86-layer scalar certificate.

Run from the experiment root with PYTHONDONTWRITEBYTECODE=1.
"""

from fractions import Fraction
from math import comb
import json
from pathlib import Path


def b(n, k):
    return comb(n, k) if 0 <= k <= n else 0


def J(N):
    return N // 2 + 3


def f(N, k):
    return Fraction(b(N - 4*k - 4, J(N) - k), b(N, J(N) - 1))


def diff_ratio_den_minus_num(N, j, k, s):
    a = (j + 1 - k) * (N - j + s)
    c = (N - 4*k - 4 - j + k) * (j + 1 - s)
    closed = (4*k + 4)*j - (k-s)*N + (3*k+4+s)*(1-s) - (k-s)*s
    assert a-c == closed
    return closed


def check():
    base_layers = sum(b(265,k)*b(528-4*k,269-k) for k in range(1,87))
    base_debt = 217*536*b(532,268)
    assert base_layers > base_debt
    # Exact binomial-ratio identities at both parity transitions.
    for k in range(1,87):
        n=266
        odd = Fraction((2*n-4*k-3)*(n-1),(n-3*k-6)*(2*n+1))
        even = Fraction((2*n-4*k-2)*(2*n-4*k-3)*(n+3)*(n-1),
                        (n+4-k)*(n-3*k-6)*(2*n+2)*(2*n+1))
        assert f(2*n+1,k)/f(2*n,k) == odd > 1
        assert f(2*n+2,k)/f(2*n,k) == even > 1
    # A finite cross-check over extreme arities and parity; the report gives
    # the algebraic argument for all N and j.
    for m in [266,267,300,394]:
        for N in sorted(set([2*m,3*m,4*m])):
            lo=(2*N-1)//5+1
            for j in range(lo,J(N)+1):
                for k in range(1,87):
                    for s in [0,1]:
                        assert diff_ratio_den_minus_num(N,j,k,s)>0
            for k in range(1,87):
                assert f(N,k) >= f(532,k)
    result={
        'base_certificate': '217*536*C(532,268) < sum_{k=1}^{86} C(265,k) C(528-4k,269-k)',
        'base_left_over_right': str(Fraction(base_debt,base_layers)),
        'base_margin': str(base_layers-base_debt),
        'base_ratio_decimal': f'{base_debt/base_layers:.12f}',
        'checked_k': [1,86],
        'sampled_m': [266,267,300,394],
    }
    (Path(__file__).resolve().parent/'tail-check.json').write_text(json.dumps(result,indent=2)+'\n')
    print('86-layer base strict:',base_layers>base_debt,'left/right',result['base_ratio_decimal'])
    print('ratio identities and sampled monotonicity checks passed')


if __name__ == '__main__':
    check()
