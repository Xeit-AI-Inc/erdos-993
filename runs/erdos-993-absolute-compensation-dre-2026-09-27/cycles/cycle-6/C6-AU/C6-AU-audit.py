#!/usr/bin/env python3
"""Independent exact checks for the three assigned C6-U routes."""
import hashlib
import json
from math import comb
from pathlib import Path

B = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
HERE = Path(__file__).resolve().parent


def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def coef(a, k):
    return a[k] if 0 <= k < len(a) else 0


def power(a, n):
    out = [1]
    for _ in range(n):
        out = mul(out, a)
    return out


# These are monomial-z coefficients, explicitly expanded from L=1+z.
BRANCH = {1: [1, 2], 2: [1, 3, 1], 3: [1, 4, 3, 1], 4: [1, 5, 6, 4, 1]}
assert BRANCH[2] == [comb(2, j) + (j == 1) for j in range(3)]
assert BRANCH[3] == [comb(3, j) + (j == 1) for j in range(4)]
assert BRANCH[4] == [comb(4, j) + (j == 1) for j in range(5)]


def product(counts, marked=None):
    out = [1, 2]
    for r, n in zip((2, 3, 4), counts):
        for _ in range(n - (r == marked)):
            out = mul(out, BRANCH[r])
    if marked is not None:
        assert counts[marked - 2] > 0
        out = mul(out, BRANCH[marked - 1])
    return out


def surplus(counts, r, k):
    a2, a3, a4 = counts
    N = 2*a2 + 3*a3 + 4*a4
    h = 1 + 2*a2 + 4*a3 + 7*a4
    C, U = product(counts), product(counts, r)
    Ek = comb(N, k-1) if 1 <= k <= N+1 else 0
    Ek1 = comb(N, k) if 0 <= k <= N else 0
    M = Ek*coef(C,k) - Ek1*coef(C,k-1)
    S = (h+1)*coef(U,k)*coef(C,k) + (k+1)*(h-k+1)*M
    return dict(profile=list(counts), N=N, h=h, r=r, k=k,
                C_k=coef(C,k), C_km1=coef(C,k-1), U_k=coef(U,k),
                E_k=Ek, E_kp1=Ek1, E_minor=M, surplus=S)


def run():
    packet = json.loads((B/'packets/C6-AU.json').read_text())
    manifest = json.loads((B/'manifests/C6-COMMON-DISPATCH.json').read_text())
    bad_packet = [x['path'] for x in packet['allowed_source_files'] if sha(B/x['path']) != x['sha256']]
    bad_shared = [x['path'] for x in manifest['members'] if sha(B/x['path']) != x['sha256']]
    assert not bad_packet and not bad_shared

    result = json.loads((B/'cycles/cycle-6/C6-U2/final-run-1-99/RESULT.json').read_text())
    expected = json.loads((B/'sources/cycle6/C6-SURPLUS-PREFIX-EXPECTED-COUNTS.json').read_text())
    expected_by_m = {r['m']:r for r in expected['layers']}
    assert result['status'] == 'complete_exact_prefix' and result['scope'] == {'min_m':1,'max_m':99}
    assert len(result['rows']) == 99 and [r['m'] for r in result['rows']] == list(range(1,100))
    profile_total = row_total = 0
    minima = []
    for row in result['rows']:
        m = row['m']
        profile_count = rank_count = 0
        for a2 in range(m+1):
            for a3 in range(m-a2+1):
                a4 = m-a2-a3
                N = 2*a2+3*a3+4*a4
                profile_count += 1
                rank_count += sum(x>0 for x in (a2,a3,a4))*((N+2)//2)
        assert profile_count == row['profile_count'] == expected_by_m[m]['profiles']
        assert rank_count == row['represented_type_rank_tests'] == expected_by_m[m]['represented_tip_rank_tests']
        w = row['minimum_witness']
        check = surplus(tuple(w['profile']), w['r'], w['k'])
        for key in ('N','h','r','k'):
            assert check[key] == w[key]
        for key in ('C_k','C_km1','U_k','E_k','E_kp1','surplus'):
            assert check[key] == int(w[key]), (m,key)
        assert check['surplus'] == int(row['minimum_signed_surplus']) > 0
        assert row['failure_count'] == 0 and row['failures'] == []
        minima.append(check['surplus'])
        profile_total += profile_count
        row_total += rank_count
    assert profile_total == result['profile_count'] == 171699
    assert row_total == result['represented_type_rank_tests'] == 56245000
    assert min(minima) == int(result['minimum_signed_surplus']) == 98

    # Positive interior factor bounds, independently of digit encoding.
    interior=(1,1,1); interior_N=9; interior_m=3
    beta=1 << (interior_N+interior_m+4)
    interior_sums={'C':sum(product(interior)), **{f'U{r}':sum(product(interior,r)) for r in (2,3,4)}}
    assert all(0<v<beta for v in interior_sums.values())

    # Direct minor controls, using the same independently expanded z arrays.
    control91 = surplus((0,22,0),3,27)
    assert control91['E_minor'] == -518620474811633289768751398606375936
    C91,U91 = product((0,22,0)),product((0,22,0),3)
    full91 = (coef(U91,27)+comb(66,26))*coef(C91,27) - (coef(U91,28)+comb(66,27))*coef(C91,26)
    assert full91 == 777419068009671422357461955841645743808
    C122,U122 = product((38,0,1)),product((38,0,1),4)
    full122 = (coef(U122,77)+comb(80,76))*coef(C122,77) - (coef(U122,78)+comb(80,77))*coef(C122,76)
    assert full122 == -49239834336 and 77 > (80+2)//2

    # Universal U1 identity has an algebraic proof; this is finite corroboration.
    midpoint = []
    for m in range(1,13):
        Q = power(BRANCH[2],m)
        C = mul([1,2],Q)
        k=m+1
        M=comb(2*m,m)*coef(C,k)-comb(2*m,m+1)*coef(C,k-1)
        assert (m+1)*M == comb(2*m,m)*((m+2)*Q[m]-(m-1)*Q[m-1])
        assert M>0 and Q[m]>=Q[m-1]>0
        midpoint.append(M)

    # Actual first-descent and all guards for an interior homogeneous control.
    counts=(0,100,0); N=300; q=N+1; alpha=N+2
    C=product(counts); Q=power(BRANCH[3],100)
    P=C.copy()
    if len(P)<q+2: P += [0]*(q+2-len(P))
    for k in range(1,q+2): P[k] += comb(q,k-1)
    x=next(k for k in range(len(P)) if coef(P,k+1)-coef(P,k)<0)
    eligible=[p for p in range(N+2) if x+2<=p and 3*p<2*alpha+1 and 2*p<=alpha]
    assert x==145 and eligible[0]==147 and eligible[-1]==151
    U=product(counts,3)
    A0=mul([1,1],Q)
    Ai=U.copy()
    Z=[0]+[comb(N,k) for k in range(N+1)]
    for f in (A0,Ai):
        if len(f)<len(Z): f += [0]*(len(Z)-len(f))
        for k,v in enumerate(Z): f[k]+=v
    T=mul([1,2],mul([2,1],power(BRANCH[3],99)))
    row_checks=[]
    for p in (147,149,151):
        j=p-2; delta=q-j; D=comb(N,j+1)-comb(N,j)
        e0=int(coef(A0,p+1)<coef(A0,p)); ei=int(coef(Ai,p+1)<coef(Ai,p))
        b=e0+300*ei; A=300*ei*coef(T,j)
        margin=(delta-1)*coef(T,j)*coef(C,j+1)-delta*coef(T,j+1)*coef(C,j)
        payment=(delta*coef(C,j)-(delta-1)*coef(C,j+1))*A-b*delta*D*coef(C,j)
        mass=A-b*delta*D
        weighted_minor=300*(coef(Ai,p)*coef(C,p)-coef(Ai,p+1)*coef(C,p-1))
        assert e0==ei==1 and D>0 and coef(C,j)>coef(C,j+1)>0
        assert margin>=0 and payment>=0 and mass>=0 and weighted_minor>=0
        assert 2*coef(T,j)>=3*delta*D
        row_checks.append(dict(p=p,j=j,delta=delta,e0=e0,ei=ei,margin=margin,payment=payment,mass=mass,weighted_minor=weighted_minor))

    evidence = dict(packet_files=len(packet['allowed_source_files']),shared_files=len(manifest['members']),
                    hash_failures=bad_packet+bad_shared,finite_prefix=dict(profiles=profile_total,rows=row_total,
                    replayed_minima=len(minima),minimum=min(minima),maximum=minima[-1],
                    strict_validator_bug="validator uses >=0 on row minima; result minima are all >0"),
                    controls=dict(n91_E_minor=control91['E_minor'],n91_full_tip_minor=full91,
                                  n122_full_tip_minor=full122,n122_guard_max=41),
                    radix_interior=dict(profile=list(interior),beta=beta,coefficient_sums=interior_sums),
                    midpoint=dict(m_range=[1,12],minors=midpoint),
                    actual_homogeneous_control=dict(profile=list(counts),x=x,eligible=[eligible[0],eligible[-1]],rows=row_checks))
    (HERE/'C6-AU-evidence.json').write_text(json.dumps(evidence,sort_keys=True,indent=2)+'\n')
    print(json.dumps({'hash_failures':0,'profiles':profile_total,'rows':row_total,'minima':len(minima),
                      'least_surplus':min(minima),'midpoints':len(midpoint),'eligible_homogeneous_rows':len(eligible)}))


if __name__=='__main__':
    run()
