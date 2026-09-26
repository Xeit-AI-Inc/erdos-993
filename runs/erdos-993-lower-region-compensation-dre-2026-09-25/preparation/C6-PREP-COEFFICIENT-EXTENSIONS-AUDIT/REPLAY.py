"""Independent exact arithmetic: direct polynomial multiplication and literal graph masks."""
import hashlib
import json
from fractions import Fraction
from itertools import product
from math import comb, factorial
from pathlib import Path


OUT = Path(__file__).parent


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def add(*arrays):
    ans = [0] * max(map(len, arrays))
    for a in arrays:
        for j, x in enumerate(a):
            ans[j] += x
    return ans


def shift(a):
    return [0] + a


def scale(a, c):
    return [c * v for v in a]


def at(a, j):
    return a[j] if 0 <= j < len(a) else 0


def lp(n):
    return [comb(n, j) for j in range(n + 1)]


def tm(bm, bm1, m):
    u = lp(3 * m)
    P = add(mul([1, 2], bm), shift(lp(3 * m + 1)))
    A0 = add(mul([1, 1], bm), shift(u))
    Ast = add(mul([1, 5, 7, 2], bm1), shift(u))
    R = add(mul([6 * m, 15 * m, 6 * m], bm1), scale(u, 3 * m + 1))
    return P, {'A0': A0, 'Astar': Ast, 'R': R}


def finite_tm():
    b = [1, 4, 3, 1]
    bm1 = [1]
    lc_hash, lr_hash = hashlib.sha256(), hashlib.sha256()
    lc_min = lr_min = None
    count = 0
    eligible_rows = 0
    early_descents = {}
    for m in range(1, 400):
        bm = mul(bm1, b)
        P, zs = tm(bm, bm1, m)
        x = next(j for j in range(len(P)) if at(P,j+1)<at(P,j))
        if m <= 3:
            early_descents[str(m)] = x
        for rank in range(x+2, 2*m+2):
            if 3*rank >= 2*(3*m+2)+1:
                continue
            eligible_rows += 1
            assert at(zs['A0'],rank+1)<at(zs['A0'],rank)
            assert at(zs['Astar'],rank+1)<at(zs['Astar'],rank)
            assert at(zs['R'],rank-1)<at(zs['R'],rank-2)
        if m >= 3:
            for name, Z in zs.items():
                for j in range(m, 2 * m + 3):
                    lc = at(Z, j)**2 - at(Z, j-1)*at(Z, j+1)
                    lr = at(Z, j)*at(P, j+1) - at(Z, j+1)*at(P, j)
                    assert lc > 0 and lr > 0, (m, name, j, lc, lr)
                    lc_hash.update(f'{m}:{name}:{j}:{lc}\n'.encode())
                    lr_hash.update(f'{m}:{name}:{j}:{lr}\n'.encode())
                    if lc_min is None or lc < lc_min[0]:
                        lc_min = (lc, m, name, j)
                    if lr_min is None or lr < lr_min[0]:
                        lr_min = (lr, m, name, j)
                    count += 1
        bm1 = bm
    M = 400
    E = Fraction(factorial(17) * (3*M)**54,
                 (M-17)**17 * (2*M-14)**16 * (M-39)**38)
    cuts = {k: c*(2*M+3)*E for k,c in
            [('LC', Fraction(24)), ('A0',Fraction(47)),
             ('Astar',Fraction(431)), ('R',Fraction(14688,21))]}
    assert all(v < 1 for v in cuts.values())
    return {'method':'iterative convolution B^m=B^(m-1)*B, independent of pinned recurrence',
            'm_range':[3,399], 'central_checks_each':count,
            'lc_sha256':lc_hash.hexdigest(), 'mixed_sha256':lr_hash.hexdigest(),
            'lc_min':lc_min, 'mixed_min':lr_min,
            'eligible_rows_m1_to_399':eligible_rows,'early_first_descents':early_descents,
            'cutoff_ratios':{k:[str(v.numerator),str(v.denominator)] for k,v in cuts.items()}}


def graph(rs):
    edges = [(0, 1), (1, 2)]
    leaves = [2]
    nextv = 3
    for r in rs:
        c = nextv
        nextv += 1
        edges.append((0, c))
        for _ in range(r):
            edges.append((c, nextv))
            leaves.append(nextv)
            nextv += 1
    return nextv, edges, leaves


def literal_indep(n, edges, kept):
    v = sorted(kept)
    out = [0] * (len(v) + 1)
    for mask in range(1 << len(v)):
        chosen = {v[i] for i in range(len(v)) if mask & (1 << i)}
        if all(a not in chosen or b not in chosen for a,b in edges):
            out[len(chosen)] += 1
    return out


def hetero_formula(rs):
    N = sum(rs)
    bs = [add(lp(r), [0,1]) for r in rs]
    Q = [1]
    for b in bs:
        Q = mul(Q, b)
    P = add(mul([1,2], Q), shift(lp(N+1)))
    A0 = add(mul([1,1],Q), shift(lp(N)))
    A = []
    Z = []
    Rscaled = [0]
    for i,r in enumerate(rs):
        H = [1]
        for k,b in enumerate(bs):
            if k != i:
                H = mul(H,b)
        A.append(add(mul(mul([1,2],add(lp(r-1),[0,1])),H),shift(lp(N))))
        F = [comb(r-1,k+1) for k in range(r-1)]
        zi = add(scale(mul(mul([1,2],F),H),N),scale(lp(N),N+1))
        Z.append(zi)  # Z_i multiplied by N; no fraction in literal replay.
        Rscaled = add(Rscaled,scale(zi,r))
    return P,A0,A,Z,Rscaled


def finite_graph():
    rows=[]
    for rs in [(2,), (3,), (4,), (3,3), (3,3,3), (2,4), (2,3,4)]:
        n,edges,leaves=graph(rs)
        N=sum(rs)
        P,A0,A,Z,Rscaled=hetero_formula(rs)
        full=set(range(n))
        actual_p=literal_indep(n,edges,full)
        assert all(at(actual_p,j)==at(P,j) for j in range(max(len(actual_p),len(P))))
        actual_q=[]
        for leaf in leaves:
            s=next(b if a==leaf else a for a,b in edges if leaf in (a,b))
            del_one=literal_indep(n,edges,full-{leaf})
            expected=A0 if leaf==2 else A[next(i for i in range(len(rs)) if leaf in range(4+sum(rs[:i])+i,4+sum(rs[:i])+i+rs[i]))]
            assert all(at(del_one,j)==at(expected,j) for j in range(max(len(del_one),len(expected))))
            closed={s}|{b if a==s else a for a,b in edges if s in (a,b)}
            h=literal_indep(n,edges,full-{leaf,s})
            rem=literal_indep(n,edges,full-closed)
            q=[at(h,j)-at(rem,j) for j in range(max(len(h),len(rem)))]
            actual_q.append(q)
            if leaf==2:
                assert all(at(q,j)==at(shift(lp(N)),j) for j in range(len(q)))
            else:
                i=next(i for i in range(len(rs)) if leaf in range(4+sum(rs[:i])+i,4+sum(rs[:i])+i+rs[i]))
                # q_leaf = z[(1+2z)F_r H_i + L^N]. Recover from N Z_i.
                qscaled=shift(add(Z[i],scale(lp(N),-1)))
                assert all(N*at(q,j)==at(qscaled,j) for j in range(max(len(q),len(qscaled))))
        summed=add(*actual_q)
        assert all(N*at(summed,j)==at(shift(Rscaled),j) for j in range(max(len(summed),len(Rscaled)+1)))
        assert max(j for j,c in enumerate(P) if c)>N+1 and P[N+2]>0
        if all(r==3 for r in rs):
            m=len(rs)
            bm=[1]
            for _ in range(m):
                bm=mul(bm,[1,4,3,1])
            bm1=[1]
            for _ in range(m-1):
                bm1=mul(bm1,[1,4,3,1])
            pt,zt=tm(bm,bm1,m)
            assert all(at(P,j)==at(pt,j) for j in range(max(len(P),len(pt))))
            assert all(at(A0,j)==at(zt['A0'],j) for j in range(max(len(A0),len(zt['A0']))))
            assert all(at(A[0],j)==at(zt['Astar'],j) for j in range(max(len(A[0]),len(zt['Astar']))))
            assert all(at(Rscaled,j)==N*at(zt['R'],j) for j in range(max(len(Rscaled),len(zt['R']))))
        rows.append({'arities':list(rs),'n':n,'N':N,'leaves':len(leaves),'alpha':max(j for j,c in enumerate(P) if c),
                     'tagged_q_sum':summed})
    return rows


def arithmetic():
    facs={'B1':([1,2],1),'B2':([1,3,1],2),'B3':([1,4,3,1],4),
          'B4':([1,5,6,4,1],7),'F2':([1],0),'F3':([2,1],1),
          'F4':([3,3,1],3),'L':([1,1],1),'C':([1,2],1)}
    facrows={}
    for name,(c,order) in facs.items():
        norm=[Fraction(v,comb(order,j)) for j,v in enumerate(c)]
        margins=[norm[j]**2-norm[j-1]*norm[j+1] for j in range(1,len(c)-1)]
        d=len(c)-1
        dlo=[Fraction((j+1)*at(c,j+1))-Fraction((d-j)*c[j],3) for j in range(len(c))]
        dhi=[2*(d-j)*c[j]-(j+1)*at(c,j+1) for j in range(len(c))]
        assert all(v>=0 for v in margins+dlo+dhi)
        facrows[name]={'ulc_order':order,'normalized':[str(v) for v in norm],
                       'ulc_margins':[str(v) for v in margins]}
    K=256*factorial(8)*640**8
    cutoff=Fraction(80328*K,100000**7)
    assert cutoff<1
    minors={}
    for r in (2,3,4):
        g=facs['B'+str(r)][0]
        for label,c in [('delete',facs['B'+str(r-1)][0]),('marked',facs['F'+str(r)][0])]:
            vals=[at(c,i)*at(g,j)-at(c,j)*at(g,i) for i in range(len(g)) for j in range(i+1,len(g))]
            assert all(v>=0 for v in vals)
            minors[label+str(r)]={'min':min(vals),'01':at(c,0)*at(g,1)-at(c,1)*at(g,0)}
    return {'factors':facrows,'minors':minors,'K':str(K),
            'cutoff_ratio':[str(cutoff.numerator),str(cutoff.denominator)]}


if __name__=='__main__':
    res={'tm':finite_tm(),'heterogeneous_small_graphs':finite_graph(),
         'heterogeneous_arithmetic':arithmetic()}
    (OUT/'REPLAY-RESULTS.json').write_text(json.dumps(res,indent=2)+'\n')
    print(json.dumps({'tm':res['tm'],'graph_profiles':[r['arities'] for r in res['heterogeneous_small_graphs']],
                      'heterogeneous_cutoff':res['heterogeneous_arithmetic']['cutoff_ratio']},indent=2))
