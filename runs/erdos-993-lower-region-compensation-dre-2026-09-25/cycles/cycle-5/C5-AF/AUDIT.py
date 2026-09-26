"""Independent exact arithmetic checks for the C5-AF adjudication."""
from fractions import Fraction
from math import comb, factorial
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parents[2]


def conv(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def power(a, m):
    v = [1]
    for _ in range(m):
        v = conv(v, a)
    return v


def add(a, b):
    c = [0] * max(len(a), len(b))
    for i, v in enumerate(a):
        c[i] += v
    for i, v in enumerate(b):
        c[i] += v
    return c


def coeff(a, j):
    return a[j] if 0 <= j < len(a) else 0


def delta(a, j):
    return coeff(a, j + 1) - coeff(a, j)


def check_factors():
    factors = [([1, 1], 1), ([1, 2], 1), ([1, 4, 3, 1], 4),
               ([1, 3, 1], 2), ([2, 5, 2], 2)]
    for f, order in factors:
        norm = [Fraction(v, comb(order, j)) for j, v in enumerate(f)]
        assert all(norm[j] ** 2 >= norm[j-1] * norm[j+1]
                   for j in range(1, len(norm)-1))
        d = len(f)-1
        for j, v in enumerate(f):
            fp = (j+1)*coeff(f, j+1)
            rem = (d-j)*v
            assert 2*rem <= 3*fp and fp <= 2*rem
    # The three displayed coefficient minors, including zero-extended endpoints.
    B = [1, 4, 3, 1]
    pairs = [([1, 1], [1, 2]), ([1, 3, 1], B),
             ([6, 15, 6], conv([1, 2], B))]
    first = []
    for c, g in pairs:
        vals = []
        for r in range(max(len(c), len(g))):
            for s in range(r+1, max(len(c), len(g))):
                vals.append(coeff(c,r)*coeff(g,s)-coeff(c,s)*coeff(g,r))
        assert all(v >= 0 for v in vals)
        first.append(c[0]*g[1]-c[1]*g[0])
    assert first == [1, 1, 21]
    K = Fraction(factorial(8)) * Fraction(125,124)**8 * Fraction(150,49)**27
    ratios = {name: Fraction(C*2003,1000**8)*K for name,C in
              [('LC',24),('A0',47),('Astar',431),('R',Fraction(14688,21))]}
    assert all(v < 1 for v in ratios.values())
    return {k: [v.numerator,v.denominator] for k,v in ratios.items()}


def check_t22():
    d = json.loads((ROOT/'cycles/cycle-5/C5-F5/CONTROLLER-T22-GRAPH-REPLAY.json').read_text())
    edges = [tuple(e) for e in d['edges']]
    expected = [(0,1),(1,2)]
    for i in range(22):
        c=3+4*i
        expected.append((0,c))
        expected += [(c,c+t) for t in (1,2,3)]
    assert set(edges) == set(expected) and len(edges)==90
    m=22; p=34; L=[1,1]; B=[1,4,3,1]
    L66=power(L,3*m); B22=power(B,m); B21=power(B,m-1)
    P=add(conv([1,2],B22),conv([0,1,1],L66))
    A0=add(conv(L,B22),conv([0,1],L66))
    Ast=add(conv([1,5,7,2],B21),conv([0,1],L66))
    qa=conv([0,1],L66)
    qc=add(conv([0,2,5,2],B21),qa)
    x=next(j for j in range(len(P)) if delta(P,j)<0)
    assert P==d['poly'] and len(P)-1==68 and x==32
    assert x+2==p and 3*p<2*68+1
    assert d['row']['favorable_leaves']==[2]+[3+4*i+t for i in range(m) for t in (1,2,3)]
    assert delta(A0,p)==d['row']['summands'][0]['pointwise_delta']<0
    assert delta(Ast,p)==d['row']['summands'][1]['pointwise_delta']<0
    ga=delta(qa,p-1); gc=delta(qc,p-1)
    assert ga==212336130412243110 and gc==-7560098737536570631
    assert ga+66*gc==d['row']['aggregate']==-498754180547001418536
    for item in d['row']['summands']:
        assert item['g']==(ga if item['leaf']==2 else gc)
    return {'order':91,'alpha':68,'x':x,'p':p,'favorable_count':67,
            'path_tag_g':ga,'arm_tag_g':gc,'full_S':ga+66*gc,
            'delta_A0_p':delta(A0,p),'delta_Astar_p':delta(Ast,p)}


def main():
    output={'analytic_endpoint_ratios':check_factors(),'t22':check_t22()}
    print(json.dumps(output,indent=2))


if __name__=='__main__':
    main()
