"""Independent exact profile audit for the sealed C3 adjudication case."""
import json
from fractions import Fraction
from math import comb
from pathlib import Path

OUT = Path(__file__).resolve().parent
R = {r: [comb(r, i) + (i == 1) for i in range(r + 1)] for r in (2, 3, 4)}

def product(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i+j] += x*y
    return c

def val(a, k):
    return a[k] if 0 <= k < len(a) else 0

def slope(a, k):
    return val(a, k+1) - val(a, k)

def add(a, b):
    return [val(a, k) + val(b, k) for k in range(max(len(a), len(b)))]

def shift(a):
    return [0] + a

def ratio_update(old, a, b, profile, r=None):
    if old is None or Fraction(a, b) < Fraction(old[0], old[1]):
        return [a, b, list(profile), r]
    return old

def prefix():
    powers = {r: [[1]] for r in R}
    for r in R:
        for _ in range(69):
            powers[r].append(product(powers[r][-1], R[r]))
    per_m = [{'profiles': 0, 'eligible_rows': 0, 'mass_failures': 0,
              'payment_failures': 0, 'local_failures': 0,
              'nonfull_rows': 0, 'minimum_local': None,
              'minimum_mass': None, 'minimum_payment': None}
             for _ in range(70)]
    for a in range(70):
      for b in range(70-a):
       for c in range(70-a-b):
        m = a+b+c
        if not m:
            continue
        profile = (a,b,c)
        row = per_m[m]
        row['profiles'] += 1
        N = 2*a+3*b+4*c
        q = N+1
        alpha = N+2
        parts = {2: powers[2][a], 3: powers[3][b], 4: powers[4][c]}
        Q = product(product(parts[2], parts[3]), parts[4])
        C = product([1,2], Q)
        LN = [comb(N,k) for k in range(N+1)]
        P = add(C, shift([comb(q,k) for k in range(q+1)]))
        x = next(k for k in range(len(P)) if slope(P,k)<0)
        ps = [p for p in range(x+2,alpha//2+1) if 3*p < 2*alpha+1]
        if not ps:
            continue
        A0 = add(product([1,1],Q),shift(LN))
        cofactors = {}
        for r,count in zip((2,3,4),profile):
            if count:
                h = product(product(powers[2][a-(r==2)],
                                  powers[3][b-(r==3)]),
                            powers[4][c-(r==4)])
                f = [0]
                for u in range(r-1):
                    f = add(f,[comb(u,k) for k in range(u+1)])
                cofactors[r] = (h, product([1,2],product(f,h)),
                                add(product([1,2],product(R[r-1] if r-1 in R else [1,2],h)),shift(LN)))
        for p in ps:
            j = p-2
            delta = q-j
            D = LN[j+1]-LN[j]
            assert D>0 and 5*j>2*N-1 and 2*j<=N-2
            e0 = slope(A0,p)<0
            flags = {r:slope(cofactors[r][2],p)<0 for r in cofactors}
            weights = {r:r*profile[r-2]*int(flags[r]) for r in cofactors}
            bsel = int(e0)+sum(weights.values())
            A = sum(weights[r]*val(cofactors[r][1],j) for r in cofactors)
            mass = A-bsel*delta*D
            payment = (delta*val(C,j)-(delta-1)*val(C,j+1))*A-bsel*delta*D*val(C,j)
            row['eligible_rows'] += 1
            row['nonfull_rows'] += int(not (e0 and all(flags.values())))
            row['mass_failures'] += int(mass<0)
            row['payment_failures'] += int(payment<0)
            if bsel:
                row['minimum_mass'] = ratio_update(row['minimum_mass'],A,bsel*delta*D,(a,b,c,x,p))
                row['minimum_payment'] = ratio_update(row['minimum_payment'],(delta*C[j]-(delta-1)*C[j+1])*A,bsel*delta*D*C[j],(a,b,c,x,p))
            for r in cofactors:
                t = val(cofactors[r][1],j)
                row['local_failures'] += int(2*t<3*delta*D)
                row['minimum_local'] = ratio_update(row['minimum_local'],2*t,3*delta*D,(a,b,c,x,p),r)
    return per_m

if __name__ == '__main__':
    rows = prefix()
    summary = {'profiles':sum(x['profiles'] for x in rows),
               'eligible_rows':sum(x['eligible_rows'] for x in rows),
               'mass_failures':sum(x['mass_failures'] for x in rows),
               'payment_failures':sum(x['payment_failures'] for x in rows),
               'local_failures':sum(x['local_failures'] for x in rows),
               'nonfull_rows':sum(x['nonfull_rows'] for x in rows),
               'layers':rows[1:]}
    (OUT/'C3-AT-independent-prefix.json').write_text(json.dumps(summary,indent=2)+'\n')
    print(json.dumps({k:v for k,v in summary.items() if k!='layers'}))
