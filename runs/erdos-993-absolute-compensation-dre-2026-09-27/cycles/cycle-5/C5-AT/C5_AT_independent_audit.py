"""Independent exact monomial-basis audit for the C5 T routes.

Replay: PYTHONDONTWRITEBYTECODE=1 python3 C5_AT_independent_audit.py > C5_AT_independent_audit.json
"""
import json
from math import comb


def add(a, b):
    return [(a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0)
            for i in range(max(len(a), len(b)))]


def sub(a, b):
    return add(a, [-v for v in b])


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def scale(a, n):
    return [n * v for v in a]


def at(a, k):
    return a[k] if 0 <= k < len(a) else 0


def L(n):
    return [comb(n, k) for k in range(n + 1)]


def B(r):
    return add(L(r), [0, 1])


def prod(xs):
    out = [1]
    for x in xs:
        out = mul(out, x)
    return out


def first_descent(a):
    return next(k for k in range(len(a)) if at(a, k + 1) < at(a, k))


def minor(V, C, k):
    return at(V, k) * at(C, k) - at(V, k + 1) * at(C, k - 1)


def profile(counts):
    rs = [r for r, n in zip((2, 3, 4), counts) for _ in range(n)]
    N = sum(rs)
    Q = prod([B(r) for r in rs])
    C = mul([1, 2], Q)
    E = [0] + L(N)
    P = add(C, [0] + L(N + 1))
    A0 = add(mul([1, 1], Q), E)
    reps = {}
    for r in sorted(set(rs)):
        idx = rs.index(r)
        H = prod([B(s) for j, s in enumerate(rs) if j != idx])
        U = mul([1, 2], mul(B(r - 1), H))
        reps[r] = (U, add(U, E))
    W = [0]
    Uweight = [0]
    for r, count in zip((2, 3, 4), counts):
        if count:
            U, Ai = reps[r]
            W = add(W, scale(Ai, r * count))
            Uweight = add(Uweight, scale(U, r * count))
    h = 1 + counts[0] * 2 + counts[1] * 4 + counts[2] * 7
    return locals()


def spot(counts, ks, p=None):
    d = profile(counts)
    N, C, E, A0, W, Uw, h = (d[t] for t in ('N', 'C', 'E', 'A0', 'W', 'Uweight', 'h'))
    x = first_descent(d['P'])
    alpha = N + 2
    rows = []
    for k in ks:
        den = (k + 1) * (h - k + 1)
        row = dict(k=k, guard=(k >= 1 and 2 * k <= alpha),
                   Cprev=at(C, k - 1), Ck=at(C, k), Cnext=at(C, k + 1),
                   ulc_curvature_margin=den*(at(C,k)**2-at(C,k-1)*at(C,k+1))-(h+1)*at(C,k)**2,
                   Eminor=minor(E, C, k), endpoint_minor=minor(A0, C, k),
                   weighted_minor=minor(W, C, k),
                   weighted_surplus=(h + 1) * at(Uw, k) * at(C, k) + den * d['N'] * minor(E, C, k))
        row['tips'] = {}
        for r, (U, Ai) in d['reps'].items():
            row['tips'][str(r)] = dict(Uk=at(U, k), Aik=at(Ai, k),
                                      main_ratio_margin=at(U,k)*at(C,k+1)-at(U,k+1)*at(C,k),
                                      tip_minor=minor(Ai, C, k),
                                      main_minor=minor(U, C, k),
                                      surplus=(h + 1) * at(U, k) * at(C, k) + den * minor(E, C, k),
                                      coarse_floor_margin=2*(N+2-k)*(h+1)*at(U,k)-at(E,k)*(N-k-1)*den,
                                      ratio_floor_margin=3*k*at(C,k)-2*(N+2-k)*at(C,k-1),
                                      ulc_main_bound_margin=den * minor(U, C, k) - (h + 1) * at(U, k) * at(C, k))
        rows.append(row)
    out = dict(counts=counts, N=N, n=N+sum(counts)+3, alpha=alpha, h=h, x=x, rows=rows)
    if p is not None:
        e0 = int(at(A0, p + 1) < at(A0, p))
        es = {str(r): int(at(Ai, p + 1) < at(Ai, p)) for r, (_, Ai) in d['reps'].items()}
        b = e0 + sum(r * n * es.get(str(r), 0) for r, n in zip((2, 3, 4), counts))
        out['actual'] = dict(p=p, xplus2=x+2, threep=3*p, twoalphaplus1=2*alpha+1,
                             twop=2*p, e0=e0, es=es, b=b,
                             eligible=(x+2<=p and 3*p<2*alpha+1 and 2*p<=alpha))
    return out


def t_add(a, b):
    return [add(a[i] if i < len(a) else [], b[i] if i < len(b) else [])
            for i in range(max(len(a), len(b)))]


def t_mul(a, b):
    out = [[] for _ in range(len(a)+len(b)-1)]
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i+j] = add(out[i+j], mul(x, y))
    return out


def activity(k):
    variable_factor = [L(4), [0, 1]]
    Ht = t_mul(variable_factor, variable_factor)
    Ct = t_mul([mul([1, 2], B(4))], Ht)
    At = t_add(t_mul([mul([1, 2], B(3))], Ht), [[0]+L(12)])
    av, anv = [at(v, k) for v in At], [at(v, k+1) for v in At]
    cv, cpv = [at(v, k) for v in Ct], [at(v, k-1) for v in Ct]
    def conv(x, y):
        out = [0]*(len(x)+len(y)-1)
        for i, a in enumerate(x):
            for j, b in enumerate(y):
                out[i+j] += a*b
        return out
    return dict(k=k, coefficients=sub(conv(av, cv), conv(anv, cpv)),
                evaluated_minor=sum(sub(conv(av, cv), conv(anv, cpv))))


def recurrence(counts, r):
    d=profile(counts)
    new=profile(tuple(counts[i]+(i+2==r) for i in range(3)))
    N=d['N']; E=d['E']; C=d['C']; U=d['Uweight']; W=d['W']
    rightC=mul(B(r), C)
    rightU=add(mul(B(r), U), scale(mul(B(r-1), C), r))
    rightE=mul(L(r), E)
    rightW=add(add(mul(B(r), W), scale(mul(B(r-1), C), r)), mul(sub(scale(L(r),r),[0,N]), E))
    return dict(counts=counts, added_r=r,
                C=rightC==new['C'], U=rightU==new['Uweight'],
                E=rightE==new['E'], W=rightW==new['W'],
                old_guard=(N+2)//2, new_guard=(N+r+2)//2,
                correction_z_coefficient=r*r-N)


if __name__ == '__main__':
    data=dict(bases={'B2':B(2),'B3':B(3),'B4':B(4),
                     'F4_L_basis':[1,1,1], 'F4_z_basis':[3,3,1],
                     'GF4_z_basis':mul([1,2],[3,3,1])},
              recurrence=[recurrence((1,0,0),r) for r in (2,3,4)] + [recurrence((0,22,0),3)],
              activity=[activity(k) for k in (1,4,7)],
              spots=[spot((0,0,3),(1,4,7),p=9),
                     spot((0,22,0),(1,27,32,34),p=34),
                     spot((0,0,24),(1,24,49),p=49),
                     spot((0,0,4),(1,8,9)),
                     spot((0,0,1),(1,2,3))])
    assert all(all(x[key] for key in ('C','U','E','W')) for x in data['recurrence'])
    print(json.dumps(data, indent=2))
