"""Exact foreground recurrence for the allocated T_m claw family, m=1..40."""
import json
from pathlib import Path

# Low-degree-first integer polynomial arithmetic.
def add(a,b):
    c=[0]*max(len(a),len(b))
    for i,x in enumerate(a): c[i]+=x
    for i,x in enumerate(b): c[i]+=x
    return trim(c)
def trim(a):
    while len(a)>1 and a[-1]==0: a.pop()
    return a
def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return trim(c)
def power(a,n):
    out=[1]
    for _ in range(n): out=mul(out,a)
    return out
def scale(a,c): return [c*x for x in a]
def delta(a,j):
    # zero extension beyond all degrees
    x=a[j] if 0<=j<len(a) else 0
    y=a[j+1] if 0<=j+1<len(a) else 0
    return y-x
def first_descent(a):
    # Check through terminal zero-extended descent; alpha is deg(a).
    for j in range(len(a)):
        if delta(a,j)<0: return j
    raise AssertionError('finite nonempty independence polynomial must descend')
def alpha(a): return len(a)-1

z=[0,1]; onepz=[1,1]
A=[1,4,3,1]       # claw with root excluded: (1+z)^3+z
B=[1,3,3,1]       # three isolated tips when root is selected
C=[1,3,1]         # one distinguished claw after deleting a tip
oneplus2z=[1,2]
z_onepz=[0,1,1]
z_onepz2=[0,1,2,1]

def P(m):
    return add(mul(oneplus2z,power(A,m)),mul(z_onepz,power(B,m)))
def P_tip_deleted(m):
    return add(mul(mul(oneplus2z,power(A,m-1)),C),mul(mul(z_onepz2,onepz),power(B,m-1)))
def P_end_deleted(m):
    return add(mul(onepz,power(A,m)),mul(z,power(B,m)))
def H_tip(m):
    base=add(mul(oneplus2z,power(A,m-1)),mul(z_onepz,power(B,m-1)))
    return mul([1,2,1],base)
def R_tip(m): return mul(oneplus2z,power(A,m-1))
def H_end(m): return add(power(A,m),mul(z,power(B,m)))
def R_end(m): return power(A,m)

rows=[]
m_checks=[]
for m in range(1,41):
    ppoly=P(m); x=first_descent(ppoly); a=alpha(ppoly)
    assert x+2<=a
    legal_ps=[p for p in range(x+2,a+1) if 3*p<2*a+1]
    m_checks.append({'m':m,'n':3+4*m,'alpha':a,'x':x,'eligible_ranks':legal_ps})
    leaf_rows=[]
    for name,mult,delpoly,H,R in [
        ('claw_tip',3*m,P_tip_deleted(m),H_tip(m),R_tip(m)),
        ('path_endpoint_2',1,P_end_deleted(m),H_end(m),R_end(m)),
    ]:
        vals=[]
        for p in range(x+2,a+1):
            if 3*p<2*a+1:
                d=delta(delpoly,p)
                vals.append({'p':p,'delta_p_deleted':d,'favorable':d<0,
                             'summand':delta(H,p-1)-delta(R,p-1)})
        leaf_rows.append({'orbit':name,'multiplicity':mult,'eligible':vals})
    eligible_ps=sorted({r['p'] for o in leaf_rows for r in o['eligible']})
    for p in eligible_ps:
        selected=[]; total=0
        for o in leaf_rows:
            row=next(r for r in o['eligible'] if r['p']==p)
            if row['favorable']:
                total+=o['multiplicity']*row['summand']
                selected.append({'orbit':o['orbit'],'multiplicity':o['multiplicity'],
                                 'delta_p_deleted':row['delta_p_deleted'],
                                 'per_leaf_summand':row['summand']})
        rows.append({'m':m,'n':3+4*m,'alpha':a,'x':x,'p':p,
                     'guard_x_plus_2':x+2<=p,'guard_lower_region':3*p<2*a+1,
                     'selected_orbits':selected,'S':total})
result={'scope':{'family':'path 0-1-2 with m disjoint K1,3 claws attached by each claw center to vertex 0; m=1..40',
                 'calculation':'exact integer polynomial recurrence and zero-extended coefficient differences',
                 'rows':len(rows)},
        'polynomials':{'A':[1,4,3,1],'B':[1,3,3,1],'C':[1,3,1]},
        'formulae':{
          'I_T':'(1+2z)A^m + z(1+z)B^m',
          'I_T_minus_tip':'(1+2z)A^(m-1)C + z(1+z)^2 B^(m-1)',
          'I_T_minus_endpoint_2':'(1+z)A^m + z B^m',
          'I_H_tip':'(1+z)^2*((1+2z)A^(m-1)+z(1+z)B^(m-1))',
          'I_R_tip':'(1+2z)A^(m-1)',
          'I_H_endpoint_2':'A^m+zB^m',
          'I_R_endpoint_2':'A^m'},
        'm_checks':m_checks,
        'eligible_rows':rows,
        'summary':{'all_S_negative':all(r['S']<0 for r in rows),
                   'S_zero_or_positive':[r for r in rows if r['S']>=0],
                   'm_values':sorted(set(r['m'] for r in rows))}}
Path(__file__).with_name('CORRECTED-EVIDENCE.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'m_range':[1,40],'eligible_rows':len(rows),'summary':result['summary']},indent=2))
