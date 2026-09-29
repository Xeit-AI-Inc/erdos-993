from fractions import Fraction as F
from math import comb, factorial
import json

def choose(n,k): return comb(n,k) if 0 <= k <= n else 0

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return c

def B(a):
    # (1+z)^a + z, in monomial-z coefficients
    f=[comb(a,j) for j in range(a+1)]
    f[1]+=1
    return f

def coeff(f,k): return f[k] if 0 <= k < len(f) else 0

# Recheck coefficient bases and local coefficient operator in z.
blocks={a:B(a) for a in range(1,5)}
ops={}
for a,f in blocks.items():
    d=len(f)-1
    vals=[]
    for k in range(d+1):
        # [z^k] ((3+2z) f' - 2d f)
        vals.append(3*(k+1)*coeff(f,k+1)+(2*k-2*d)*coeff(f,k))
    ops[a]=vals
assert blocks == {1:[1,2],2:[1,3,1],3:[1,4,3,1],4:[1,5,6,4,1]}
assert ops == {1:[4,0],2:[5,0,0],3:[6,2,3,0],4:[7,6,12,4,0]}

# Exact ratio hierarchy, first complementary rank, an interior rank, and midpoint,
# for both parities at the threshold N=200 and the first odd N=201.
g=lambda r,n,k:F(2*r,2*r+1)*F(choose(n-r,k-1),choose(n,k))
gchecks=[]
for n in (200,201):
    for k in sorted({(n+1)//4+1, n//3, (n+2)//2}):
        vals=[g(r,n,k) for r in (2,3,4)]
        assert vals[0]>=vals[1]>=vals[2]>=F(1,20)
        gchecks.append({'N':n,'k':k,'g2_g3_g4':[str(x) for x in vals]})
# Verify the parity closed forms against direct binomial ratios at the midpoint.
for n in (200,201):
    s=n//2; k=(n+2)//2
    if n%2==0:
        closed=F(2,9)*F((s+1)*(s-2)*(s-3),s*(2*s-1)*(2*s-3))
    else:
        closed=F(2,9)*F((s+1)*(s-2),(2*s+1)*(2*s-1))
    assert closed==g(4,n,k)

# Check the exact rational Taylor constants and their tangent lower bound.
a=F(99,20)
def E(d,x): return sum((x**j/F(factorial(j)) for j in range(d+1)),F(0))
e8,e7=E(8,a),E(7,a)
assert e8>102 and e7>20
for t in (F(0),F(1,20),F(5)):
    assert E(8,a+t)>=e8+t*e7

# Check the final positive scalar clearing on boundary/interior values.
final=[]
for n,m,k in ((200,100,51),(200,100,60),(200,100,101),(201,100,51),(201,100,101)):
    lam=F(n+2,(k+1)*(n+1-k+1)) # h=N+1 boundary case, hence h+1=N+2
    b=F(n+1-k,k)
    lhs=4*n*(m+2)
    rhs=(n+4)*(n+2)
    assert lam>F(1,k+1)>=F(2,n+4)
    assert b>=F(n,n+2)
    assert lhs>=rhs
    final.append({'N':n,'m':m,'k':k,'lambda_h_eq_Nplus1':str(lam),'b':str(b),'final_clear_difference':lhs-rhs})

# Directly verify low-rank term cross-products including a support boundary.
low=0
for n in range(2,30):
    for s in range(1,n+1):
        for R in range(s,min(4*s,n)+1):
            for k in range(1,(n+1)//4+1):
                x=choose(n,k-1)*choose(n-R,k-s)-choose(n,k)*choose(n-R,k-1-s)
                # This is the numerator of normalized term-at-k minus term-at-(k-1).
                assert x>=0, (n,s,R,k,x)
                low+=1

out={
 'grade':'independent exact arithmetic diagnostics; universal proof assessed algebraically in REPORT.md',
 'B_r_monomial_z':{str(a):v for a,v in blocks.items()},
 'ratio_floor_operator_monomial_z':{str(a):v for a,v in ops.items()},
 'g_boundary_interior_midpoint_checks':gchecks,
 'E8_99over20':str(e8),'E7_99over20':str(e7),
 'final_positive_clearing_checks':final,
 'low_rank_cross_product_cases':low
}
print(json.dumps(out,sort_keys=True))
