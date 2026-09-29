"""Independent exact monomial-basis replay of C5-T2 claims and controls."""
from math import comb
import json

def add(a,b):
    c=[0]*max(len(a),len(b))
    for i,v in enumerate(a): c[i]+=v
    for i,v in enumerate(b): c[i]+=v
    return c

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return c

def scale(a,s): return [s*x for x in a]
def coeff(a,k): return a[k] if 0<=k<len(a) else 0
def shifted(a): return [0]+a
def lp(n): return [comb(n,k) for k in range(n+1)]
def B(r): return add(lp(r),[0,1])
def G(): return [1,2]
def prod(xs):
    out=[1]
    for x in xs: out=mul(out,x)
    return out
def minor(a,c,k): return coeff(a,k)*coeff(c,k)-coeff(a,k+1)*coeff(c,k-1)
def first_fall(p):
    return next(k for k in range(len(p)+1) if coeff(p,k+1)-coeff(p,k)<0)
def profile(rs):
    N=sum(rs); q=N+1; C=mul(G(),prod([B(r) for r in rs])); E=shifted(lp(N)); P=add(C,shifted(lp(q)))
    As=[]
    for i,r in enumerate(rs):
        co=prod([B(s) for t,s in enumerate(rs) if t!=i])
        Ui=mul(mul(G(),B(r-1)),co)
        As.append(add(Ui,E))
    A0=add(mul([1,1],prod([B(r) for r in rs])),E)
    return N,C,E,P,As,A0

def bivar_add(a,b):
    c=[[] for _ in range(max(len(a),len(b)))]
    for i in range(len(c)): c[i]=add(a[i] if i<len(a) else [],b[i] if i<len(b) else [])
    return c
def bivar_mul(a,b):
    c=[[] for _ in range(len(a)+len(b)-1)]
    for i,x in enumerate(a):
      for j,y in enumerate(b): c[i+j]=add(c[i+j],mul(x,y))
    return c
def bivar_zcoef(a,k): return [coeff(x,k) for x in a]
def activity_case():
    r=4; N=12; k=7
    # Distinguished branch fixed, the other two independently receive L^4+t z.
    af=[lp(r),[0,1]]
    Ct=bivar_mul(bivar_mul([[1,2]],[B(r)]),bivar_mul(af,af))
    Ut=bivar_mul(bivar_mul([[1,2]],[B(r-1)]),bivar_mul(af,af))
    Et=[shifted(lp(N))]
    At=bivar_add(Ut,Et)
    N,C,E,P,As,A0=profile([4,4,4])
    ranks=[]
    for kk in [1,4,7]:
        cs=add(mul(bivar_zcoef(At,kk),bivar_zcoef(Ct,kk)),scale(mul(bivar_zcoef(At,kk+1),bivar_zcoef(Ct,kk-1)),-1))
        ranks.append({'k':kk,'guarded':1<=kk and 2*kk<=N+2,'activity_coefficients':['%d'%x for x in cs],'value_at_t1':sum(cs)})
    coeffs=add(mul(bivar_zcoef(At,k),bivar_zcoef(Ct,k)),scale(mul(bivar_zcoef(At,k+1),bivar_zcoef(Ct,k-1)),-1))
    return {'profile':[0,0,3], 'N':N, 'n':18, 'k':k, 'guard_1_le_k_2k_le_N_plus_2':1<=k and 2*k<=N+2,
            'activity_margin_coefficients_z_t0_up':['%d'%x for x in coeffs], 'negative_t3':coeff(coeffs,3), 'at_t1':sum(coeffs),
            'boundary_and_interior_rank_checks':ranks,'C_coefficients_kminus1_k_kplus1':[coeff(C,k-1),coeff(C,k),coeff(C,k+1)],
            'A_coefficients_k_kplus1':[coeff(As[0],k),coeff(As[0],k+1)],'first_descent':first_fall(P),
            'no_actual_eligible_p':not any(first_fall(P)+2<=p and 3*p<2*(N+2)+1 and 2*p<=N+2 for p in range(N+10))}

def large_case():
    rs=[3]*22; N,C,E,P,As,A0=profile(rs); x=first_fall(P); alpha=N+2; p=34; j=p-2; k=27
    d0=coeff(A0,p+1)-coeff(A0,p)<0; di=coeff(As[0],p+1)-coeff(As[0],p)<0
    h=1+4*22
    out={'profile':[0,22,0],'m':22,'N':N,'n':91,'alpha':alpha,'x':x,'p':p,'j':j,'guards':[x+2<=p,3*p<2*alpha+1,2*p<=alpha],
         'selectors':[d0,di],'selected_tag_weight':int(d0)+3*22*int(di),'k':k,'k_guard':[1<=k,2*k<=N+2],
         'E_minor_k27':str(minor(E,C,k)),'full_tip_minor_k27':str(minor(As[0],C,k)),'full_tip_minor_j':str(minor(As[0],C,j)),
         'full_tip_minor_boundary_interior':[{'k':kk,'minor':str(minor(As[0],C,kk))} for kk in [1,27,34]],
         'reported_full_tip_minor_k27': '777419068009671422357461153834912453824',
         'recomputed_full_tip_minor_k27':str(minor(As[0],C,k))}
    # Check the exact-ratio surplus condition at representative guarded boundaries/interior.
    rows=[]
    for kk in [1,27,34]:
       Ui=add(As[0],scale(E,-1)); ME=minor(E,C,kk); d=(kk+1)*(h-kk+1)
       lhs=(h+1)*coeff(Ui,kk)*coeff(C,kk)+d*ME
       rows.append({'k':kk,'h':h,'factor_d':d,'U_k':coeff(Ui,kk),'C_k':coeff(C,kk),'M_E':str(ME),'exact_surplus_lhs':str(lhs),'full_tip_minor':str(minor(As[0],C,kk))})
    out['ulc_surplus_checks']=rows
    # Sum direction, with original multiplicity retained; symmetry makes this exactly 3m times one branch here.
    W=[0]
    for r,A in zip(rs,As): W=add(W,scale(A,r))
    out['weighted_minor_k27']=str(minor(W,C,k))
    out['weighted_equals_66_individual']=minor(W,C,k)==66*minor(As[0],C,k)
    return out

if __name__=='__main__': print(json.dumps({'activity':activity_case(),'large_profile':large_case()},indent=2))
