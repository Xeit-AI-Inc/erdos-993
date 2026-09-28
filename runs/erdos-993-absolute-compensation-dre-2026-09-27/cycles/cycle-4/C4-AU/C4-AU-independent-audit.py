import json
from fractions import Fraction
from math import comb
from pathlib import Path


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a):
        out[i] += x
    for i, x in enumerate(b):
        out[i] += x
    return out


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def binom(n, k):
    return comb(n, k) if 0 <= k <= n else 0


def profile(rs):
    N = sum(rs)
    q = N + 1
    alpha = N + 2
    G = [1, 2]
    Q = [1]
    factors = []
    for r in rs:
        B = [binom(r, k) for k in range(r + 1)]
        B[1] += 1
        factors.append(B)
        Q = mul(Q, B)
    C = mul(G, Q)
    zLq = [0] + [binom(q, k) for k in range(q + 1)]
    P = add(C, zLq)
    x = next(k for k in range(len(P)) if coeff(P, k + 1) < coeff(P, k))
    LQ = mul([1, 1], Q)
    zLN = [0] + [binom(N, k) for k in range(N + 1)]
    A0 = add(LQ, zLN)
    As = []
    Ts = []
    cofactor_cache = {}
    for i, r in enumerate(rs):
        if r in cofactor_cache:
            A, T = cofactor_cache[r]
            As.append(A)
            Ts.append(T)
            continue
        H = [1]
        for h, B in enumerate(factors):
            if h != i:
                H = mul(H, B)
        Brm1 = [binom(r - 1, k) for k in range(r)]
        Brm1[1] += 1
        A = add(mul(mul(G, Brm1), H), zLN)
        F = [sum(binom(h, k) for h in range(r - 1)) for k in range(r - 1)]
        T = mul(mul(G, F), H)
        cofactor_cache[r] = (A, T)
        As.append(A)
        Ts.append(T)
    return dict(N=N, q=q, alpha=alpha, C=C, P=P, x=x, A0=A0, As=As, Ts=Ts)


def eligible(d, p):
    return d['x'] + 2 <= p and 3 * p < 2 * d['alpha'] + 1 and 2 * p <= d['alpha']


def payment(d, rs, p, T_override=None):
    assert eligible(d, p)
    j = p - 2
    delta = d['q'] - j
    e0 = int(coeff(d['A0'], p + 1) < coeff(d['A0'], p))
    es = [int(coeff(A, p + 1) < coeff(A, p)) for A in d['As']]
    b = e0 + sum(r * e for r, e in zip(rs, es))
    T = [coeff(t, j) for t in d['Ts']] if T_override is None else T_override
    amount = sum(r * e * t for r, e, t in zip(rs, es, T))
    cj, cj1 = coeff(d['C'], j), coeff(d['C'], j + 1)
    Dj = binom(d['N'], j + 1) - binom(d['N'], j)
    K = delta * cj - (delta - 1) * cj1
    assert cj > cj1 > 0 and Dj > 0 and delta > 0 and K > 0
    return dict(p=p, j=j, delta=delta, e0=e0, branch_flags=es,
                b=b, Cj=cj, Cj1=cj1, Dj=Dj, K=K, amount=amount,
                margin=K * amount - b * delta * Dj * cj)


def drift_row(rs, p):
    d = profile(rs)
    assert eligible(d, p)
    x, j, q, N, C = d['x'], p - 2, d['q'], d['N'], d['C']
    beta = binom(q, x) - binom(q, x - 1)
    assert beta > 0 and coeff(d['P'], x + 1) - coeff(d['P'], x) < 0
    ratio_x = Fraction(coeff(C, x + 1), coeff(C, x))
    ratio_j = Fraction(coeff(C, j + 1), coeff(C, j))
    bound = Fraction(2 * j - N) - Fraction((j + 1) * beta, coeff(C, x))
    drift = (j + 1) * ratio_j - (q - j)
    assert 0 < ratio_j <= ratio_x < 1 - Fraction(beta, coeff(C, x))
    assert drift < bound < 2 * j - N
    return dict(counts=[rs.count(2), rs.count(3), rs.count(4)], x=x, p=p, j=j,
                beta=beta, Cx=coeff(C, x), delta_x_C=coeff(C, x + 1)-coeff(C, x),
                ratio_x=str(ratio_x), ratio_j=str(ratio_j), drift=str(drift),
                bound=str(bound), payment_margin=str(payment(d, rs, p)['margin']))


def layers(m, j):
    # F4=1+L+L^2=(3,3,1) in z; G*F4=(3,9,7,2).
    G = [1, 2]
    F4 = add(add([1], [1, 1]), [1, 2, 1])
    gf4 = mul(G, F4)
    assert gf4 == [3, 9, 7, 2]
    rows = [sum(gf4[s] * binom(m - 1, a) * binom(4 * (m - 1 - a), j - a - s)
                for s in range(4)) for a in range(m)]
    return gf4, rows


def shifted_row(rs, k):
    d = profile(rs)
    C = d['C']
    W = [0]
    for r, A in zip(rs, d['As']):
        W = add(W, [r * v for v in A])
    def margin(A):
        return coeff(A, k) * coeff(C, k) - coeff(A, k + 1) * coeff(C, k - 1)
    return dict(counts=[rs.count(2), rs.count(3), rs.count(4)], N=d['N'], x=d['x'],
                k=k, guarded=2*k<=d['N']+2, eligible=eligible(d, k),
                endpoint_margin=margin(d['A0']), tip_margins=[margin(A) for A in d['As']],
                weighted_margin=margin(W), delta_W=coeff(W,k+1)-coeff(W,k),
                Ckm1=coeff(C,k-1), Ck=coeff(C,k), Wk=coeff(W,k))


def endpoint_guarded_scan(max_m=18):
    checked = 0
    first_failure = None
    minimum = None
    minimum_row = None
    for a2 in range(max_m + 1):
        for a3 in range(max_m + 1 - a2):
            for a4 in range(max_m + 1 - a2 - a3):
                if a2 + a3 + a4 == 0:
                    continue
                rs = [2]*a2 + [3]*a3 + [4]*a4
                N = sum(rs)
                Q = [1]
                for r in rs:
                    B = [binom(r,k) for k in range(r+1)]
                    B[1] += 1
                    Q = mul(Q,B)
                C = mul([1,2],Q)
                A0 = add(mul([1,1],Q),[0]+[binom(N,k) for k in range(N+1)])
                for k in range(1,(N+2)//2+1):
                    margin = coeff(A0,k)*coeff(C,k)-coeff(A0,k+1)*coeff(C,k-1)
                    checked += 1
                    if minimum is None or margin < minimum:
                        minimum = margin
                        minimum_row = dict(counts=[a2,a3,a4],N=N,k=k,margin=str(margin))
                    if margin < 0 and first_failure is None:
                        first_failure = dict(counts=[a2,a3,a4],N=N,k=k,margin=str(margin))
    return dict(max_m=max_m,endpoint_comparisons=checked,minimum=minimum_row,first_failure=first_failure)


def main():
    out = {}
    out['drift_boundary'] = drift_row([3]*12+[4]*10, 39)
    out['drift_interior'] = drift_row([3]*10+[4]*28, 72)
    m, rs = 173, [4]*173
    d = profile(rs)
    assert d['x'] == 336
    full = payment(d, rs, 338)
    gf4, terms = layers(m, 336)
    assert sum(terms) == coeff(d['Ts'][0], 336)
    margins = {}
    for depth in (1, 2, m-1):
        val = sum(terms[:depth+1])
        margins[str(depth)] = str(payment(d, rs, 338, [val]*m)['margin'])
    assert int(margins['1']) < 0 < int(margins['2']) <= int(margins[str(m-1)])
    assert int(margins[str(m-1)]) == full['margin']
    # Exact adjacent-layer cancellation at two positive interior points.
    ratios = {}
    for a,s in [(0,0),(80,2)]:
        n,k = 4*(m-1-a),336-a-s
        R = lambda a: gf4[s]*binom(m-1,a)*binom(4*(m-1-a),336-a-s)
        direct = Fraction(R(a+1),R(a))
        factored = Fraction(m-1-a,a+1)*Fraction(k*(n-k)*(n-k-1)*(n-k-2),n*(n-1)*(n-2)*(n-3))
        assert direct == factored
        ratios[f'{a},{s}']=str(direct)
    out['depth_witness'] = dict(m=m,N=d['N'],x=d['x'],p=338,j=336,
        guards=eligible(d,338),endpoint_flag=full['e0'],all_tip_flags=all(full['branch_flags']),
        b=full['b'],GF4_monomial=gf4,Cj=str(full['Cj']),Cj1=str(full['Cj1']),
        Dj=str(full['Dj']),K=str(full['K']),Tj=str(coeff(d['Ts'][0],336)),
        layer0=str(terms[0]),layer1=str(terms[1]),layer2=str(terms[2]),
        signed_margins=margins,adjacent_ratios=ratios)
    good = shifted_row([3]*22,34)
    assert good['x']==32 and good['eligible'] and good['weighted_margin']>0 and good['delta_W']<0
    bad = shifted_row([2]*38+[4],77)
    assert bad['N']==80 and not bad['guarded'] and bad['tip_margins'][-1]==-49239834336
    for row in (good,bad):
        row['tip_margins'] = [str(min(row['tip_margins'])),str(max(row['tip_margins']))]
        for key in ['endpoint_margin','weighted_margin','delta_W','Ckm1','Ck','Wk']:
            row[key]=str(row[key])
    out['shifted_eligible']=good
    out['shifted_unguarded_control']=bad
    out['endpoint_guarded_scan']=endpoint_guarded_scan()
    assert out['endpoint_guarded_scan']['endpoint_comparisons']==27954
    assert out['endpoint_guarded_scan']['first_failure'] is None
    Path('C4-AU-independent-evidence.json').write_text(json.dumps(out,indent=2)+'\n')
    print('independent checks passed; U2 depth signs:',{k:('positive' if int(v)>0 else 'negative') for k,v in margins.items()})


if __name__=='__main__':
    main()
