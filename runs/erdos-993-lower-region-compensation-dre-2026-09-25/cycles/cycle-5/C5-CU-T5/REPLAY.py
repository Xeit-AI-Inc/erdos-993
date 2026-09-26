from itertools import combinations
import json


def independent_sets(h, r):
    out = []
    for chosen in combinations(range(2*h), r):
        if all(not (2*e in chosen and 2*e+1 in chosen) for e in range(h)):
            out.append(frozenset(chosen))
    return out


def mat_rank(rows):
    if not rows:
        return 0
    a = [list(map(int, row)) for row in rows]
    m, n = len(a), len(a[0])
    piv = 0
    for col in range(n):
        pivot = next((i for i in range(piv, m) if a[i][col]), None)
        if pivot is None:
            continue
        a[piv], a[pivot] = a[pivot], a[piv]
        q = a[piv][col]
        # Fraction-free elimination is unnecessary for rank: row operations
        # over Q can normalize exactly with Python fractions.
        from fractions import Fraction
        a[piv] = [Fraction(x, q) for x in a[piv]]
        for i in range(m):
            if i != piv and a[i][col]:
                c = a[i][col]
                a[i] = [x-c*y for x, y in zip(a[i], a[piv])]
        piv += 1
        if piv == m:
            break
    return piv


checks = []
for h in range(1, 6):
    for r in range(h):
        low = independent_sets(h, r)
        high = independent_sets(h, r+1)
        low_index = {s:i for i,s in enumerate(low)}
        high_index = {s:i for i,s in enumerate(high)}
        U = [[0 for _ in low] for _ in high]
        for j, s in enumerate(low):
            for z in range(2*h):
                t = s | {z}
                if len(t) == r+1 and all(not (2*e in t and 2*e+1 in t) for e in range(h)):
                    U[high_index[t]][j] += 1
        rank = mat_rank(U)
        if r < h/2:
            assert rank == len(low) == __import__('math').comb(h,r)*2**r
        # Check the claimed Gram commutator entrywise in the basis of Omega_r.
        D = [list(row) for row in zip(*U)]
        # D_{r+1} U_r is U^T U. Build U_{r-1} U_{r-1}^T as the down/up product.
        if r == 0:
            down_up = [[0 for _ in low] for _ in low]
        else:
            prev = independent_sets(h, r-1)
            prev_index = {s:i for i,s in enumerate(prev)}
            Uprev = [[0 for _ in prev] for _ in low]
            for j,s in enumerate(prev):
                for z in range(2*h):
                    t=s|{z}
                    if len(t)==r and all(not(2*e in t and 2*e+1 in t) for e in range(h)):
                        Uprev[low_index[t]][j] += 1
            down_up = [[sum(Uprev[i][k]*Uprev[j][k] for k in range(len(prev))) for j in range(len(low))] for i in range(len(low))]
        gram = [[sum(U[k][i]*U[k][j] for k in range(len(high))) for j in range(len(low))] for i in range(len(low))]
        R = [[0 for _ in low] for _ in low]
        for i,s in enumerate(low):
            for j,t in enumerate(low):
                if i != j and len(s-t)==1 and len(t-s)==1:
                    a,b=next(iter(s-t)),next(iter(t-s))
                    if a//2 == b//2:
                        R[i][j]=1
        lhs = [[gram[i][j]-down_up[i][j] for j in range(len(low))] for i in range(len(low))]
        rhs = [[((2*h-3*r) if i==j else 0)-R[i][j] for j in range(len(low))] for i in range(len(low))]
        assert lhs == rhs
        checks.append({"h":h,"r":r,"domain_size":len(low),"codomain_size":len(high),"rank":rank,"injectivity_claimed":bool(r<h/2),"commutator_identity":True})
print(json.dumps({"checks":checks,"check_count":len(checks),"verified_injective_cases":sum(c['injectivity_claimed'] for c in checks)}, indent=2))
