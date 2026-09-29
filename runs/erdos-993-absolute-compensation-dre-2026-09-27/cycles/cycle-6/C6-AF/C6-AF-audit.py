"""Independent exact checks for the C6-AF adjudication; no producer imports."""
import json
import hashlib
from fractions import Fraction
from math import comb, factorial
from pathlib import Path


def conv(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def coefficient(a, k):
    return a[k] if 0 <= k < len(a) else 0


def blocks(r):
    b = [comb(r, t) for t in range(r + 1)]
    b[1] += 1
    return b


def operator(f):
    d = len(f) - 1
    deriv = [(i + 1) * f[i + 1] for i in range(d)]
    ans = [-2 * d * x for x in f]
    for i, x in enumerate(deriv):
        ans[i] += 3 * x
        ans[i + 1] += 2 * x
    return ans


def polynomials(profile, marked):
    n = sum(r * c for r, c in profile.items())
    q = [1]
    h = [1]
    for r in (2, 3, 4):
        for t in range(profile.get(r, 0)):
            q = conv(q, blocks(r))
            if r != marked or t != 0:
                h = conv(h, blocks(r))
    c = conv(blocks(1), q)
    ui = conv(conv(blocks(1), blocks(marked - 1)), h)
    u0 = conv([1, 1], q)
    e = [0] + [comb(n, j) for j in range(n + 1)]
    return n, c, ui, u0, e


def g(n, k, r):
    return Fraction(2 * r * comb(n-r, k-1), (2*r+1) * comb(n, k))


def check_profile(profile, marked, ranks):
    m = sum(profile.values())
    n, c, u, u0, e = polynomials(profile, marked)
    h = 1 + 2*profile.get(2,0) + 4*profile.get(3,0) + 7*profile.get(4,0)
    out = []
    for k in ranks:
        assert 1 <= k and 2*k <= n+2
        mk = coefficient(e,k)*coefficient(c,k)-coefficient(e,k+1)*coefficient(c,k-1)
        sk = (h+1)*coefficient(u,k)*coefficient(c,k)+(k+1)*(h-k+1)*mk
        a = [coefficient(u,j)+coefficient(e,j) for j in range(k+2)]
        a0 = [coefficient(u0,j)+coefficient(e,j) for j in range(k+2)]
        tip_minor = a[k]*coefficient(c,k)-a[k+1]*coefficient(c,k-1)
        endpoint_minor = a0[k]*coefficient(c,k)-a0[k+1]*coefficient(c,k-1)
        floor_margin = 3*k*coefficient(c,k)-2*(n+2-k)*coefficient(c,k-1)
        row = dict(profile={str(r):v for r,v in profile.items()},m=m,n=n,h=h,
                   marked=marked,k=k,guard=True, surplus_sign=(sk>0),
                   tip_minor_sign=(tip_minor>=0),endpoint_minor_sign=(endpoint_minor>=0),
                   ratio_floor_sign=(floor_margin>=0),e_minor_sign=(mk>=0),
                   surplus_digits=len(str(abs(sk))),tip_minor_digits=len(str(abs(tip_minor))))
        if m == 1:
            row.update(Ck_1=coefficient(c,k-1),Ck=coefficient(c,k),
                       Uk=coefficient(u,k),Ek=coefficient(e,k),Ek_1=coefficient(e,k+1),
                       e_minor=mk,surplus=sk,tip_minor=tip_minor,endpoint_minor=endpoint_minor)
        assert sk>0 and tip_minor>=0 and endpoint_minor>=0 and floor_margin>=0
        out.append(row)
    return out


def main():
    here = Path(__file__).resolve().parent
    root = next(p for p in here.parents if (p/'manifests/C6-COMMON-DISPATCH.json').is_file())
    common = json.loads((root/'manifests/C6-COMMON-DISPATCH.json').read_text())
    packet = json.loads((root/'packets/C6-AF.json').read_text())
    for group in (common['members'],packet['allowed_source_files']):
        for item in group:
            assert hashlib.sha256((root/item['path']).read_bytes()).hexdigest()==item['sha256'],item['path']
    assert [blocks(r) for r in range(1,5)] == [[1,2],[1,3,1],[1,4,3,1],[1,5,6,4,1]]
    assert [operator(blocks(r)) for r in range(1,5)] == [[4,0],[5,0,0],[6,2,3,0],[7,6,12,4,0]]
    # C6-F2 finite coverage, enumerated independently from the closed expression.
    profiles = rows = rows20 = 0
    for m in range(1,100):
        pm = rm = 0
        for a2 in range(m+1):
            for a3 in range(m-a2+1):
                a4 = m-a2-a3
                n = 2*a2+3*a3+4*a4
                s = (a2>0)+(a3>0)+(a4>0)
                pm += 1
                rm += s*((n+2)//2)
        sm = 3*comb(m+1,2)
        u = m//2
        om = 3*u*u+u if m%2==0 else (u+1)*(3*u+1)
        assert pm == comb(m+2,2)
        assert 2*rm == (3*m+2)*sm-om
        profiles += pm
        rows += rm
        if m<=20: rows20 += rm
    assert (profiles,rows,rows20)==(171699,56245000,109175)
    # True strict norm bound, including m=1 empty cofactor.
    for r in (2,3,4):
        n=r;m=1
        assert sum(polynomials({r:1},r)[2]) == 3*(2**(r-1)+1) < 3*2**(n+m-1)
    t = Fraction(99,20)
    e8 = sum((t**j/Fraction(factorial(j))) for j in range(9))
    e7 = sum((t**j/Fraction(factorial(j))) for j in range(8))
    assert e8 == Fraction(2162945642595007,16384000000000) and e8>102
    assert e7 == Fraction(88220922596671,716800000000) and e7>20
    gchecks=[]
    for n in (200,201,290,400):
        first=(n+1)//4+1
        last=(n+2)//2
        for k in sorted({first, min(first+1,last),last}):
            vals=[g(n,k,r) for r in (2,3,4)]
            assert vals[0]>=vals[1]>=vals[2]>=Fraction(1,20)
            gchecks.append(dict(n=n,k=k,g2=str(vals[0]),g3=str(vals[1]),g4=str(vals[2])))
    assert g(200,101,4)==Fraction(480053,8820675)
    assert g(201,101,4)==Fraction(19796,359991)
    samples=[]
    for r in (2,3,4):
        n=r
        samples += check_profile({r:1},r,[1,(n+2)//2])
    for profile,marked in [({2:100},2),({3:100},3),({4:100},4),({2:40,3:30,4:30},4)]:
        n=sum(r*v for r,v in profile.items())
        first=(n+1)//4+1
        samples+=check_profile(profile,marked,sorted({first,min(first+1,(n+2)//2),(n+2)//2}))
    controls=[]
    for profile,marked,k in [({3:22},3,27),({2:38,4:1},4,77)]:
        n,c,u,u0,e=polynomials(profile,marked)
        eonly=coefficient(e,k)*coefficient(c,k)-coefficient(e,k+1)*coefficient(c,k-1)
        tip=(coefficient(u,k)+coefficient(e,k))*coefficient(c,k)-(coefficient(u,k+1)+coefficient(e,k+1))*coefficient(c,k-1)
        controls.append(dict(profile={str(r):v for r,v in profile.items()},n=n,k=k,guard=2*k<=n+2,e_only=eonly,full_tip=tip))
    assert controls[0]['e_only']==-518620474811633289768751398606375936
    assert controls[0]['full_tip']==777419068009671422357461955841645743808
    assert controls[1]['full_tip']==-49239834336 and not controls[1]['guard']
    # The m=3 homogeneous arity-4 activity coefficient is a layer, not t=1.
    layers_c=[];layers_a=[]
    for a in range(3):
        tail=[0]*a+[comb(8-4*a,j) for j in range(8-4*a+1)]
        factor=comb(2,a)
        layers_c.append([factor*v for v in conv(conv(blocks(1),blocks(4)),tail)])
        layers_a.append([factor*v for v in conv(conv(blocks(1),blocks(3)),tail)])
    activity=sum(coefficient(layers_a[a],7)*coefficient(layers_c[3-a],7)-
                 coefficient(layers_a[a],8)*coefficient(layers_c[3-a],6)
                 for a in (1,2))
    assert activity==-66
    n,c,u,u0,e=polynomials({4:3},4)
    full=(u[7]+e[7])*c[7]-(u[8]+e[8])*c[6]
    assert full==2076267 and 12*full==24915204
    # A critic RETURN has an incorrect same-arity cofactor on mixed profiles.
    _,_,mixed_u,_,_=polynomials({2:1,4:1},2)
    incorrect_u=conv(conv(blocks(1),blocks(1)),blocks(2))
    assert mixed_u[1]==9 and incorrect_u[1]==7
    result=dict(source_hash_checks=dict(common=len(common['members']),packet=len(packet['allowed_source_files'])),
                coverage=dict(profiles=profiles,rows=rows,rows_through_m20=rows20),
                monomial_blocks={str(r):blocks(r) for r in range(1,5)},
                operator_nonzero={str(r):operator(blocks(r))[:r] for r in range(1,5)},
                taylor=dict(E8=str(e8),E7=str(e7)),g_boundary_interior=gchecks,samples=samples,
                obstruction_controls=controls,activity_control=dict(coefficient_t3=activity,full_tip=full,weighted_tip=12*full),
                critic_formula_control=dict(profile={'2':1,'4':1},marked=2,actual_U_coefficient_1=mixed_u[1],incorrect_U_coefficient_1=incorrect_u[1]))
    with open(here/'C6-AF-audit.json','w') as f: json.dump(result,f,indent=2,sort_keys=True)
    print('coverage',profiles,rows,rows20,'g rows',len(gchecks),'sample rows',len(samples),'all exact assertions pass')


if __name__=='__main__': main()
