from math import comb
from itertools import product

def conv(a,b):
    c=[0]*(len(a)+len(b)-1)
    for u,x in enumerate(a):
        for v,y in enumerate(b): c[u+v]+=x*y
    return c

def poly_pow(a,n):
    o=[1]
    for _ in range(n): o=conv(o,a)
    return o

def add(a,b):
    c=[0]*max(len(a),len(b))
    for i,x in enumerate(a): c[i]+=x
    for i,x in enumerate(b): c[i]+=x
    return c

def at(a,k): return a[k] if 0<=k<len(a) else 0
def delta(a,k): return at(a,k+1)-at(a,k)
def check(counts):
    a2,a3,a4=counts; N=2*a2+3*a3+4*a4; m=sum(counts)
    L=[1,1]; G=[1,2]
    Q=[1]
    for r,a in zip((2,3,4),counts): Q=conv(Q,poly_pow(add(poly_pow(L,r),[0,1]),a))
    C=conv(G,Q)
    # closed binomial basis, independent of polynomial powering of L
    d=[0]+[comb(N+1,k-1) for k in range(1,N+3)]
    P=add(C,d)
    x=next(k for k in range(len(P)) if delta(P,k)<0)
    ps=[p for p in range(x+2,len(P)) if 3*p<2*(N+2)+1 and 2*p<=N+2]
    vals=[]
    for p in ps:
        j=p-2
        # Exact substitution: d[j+1]C[j]-d[j]C[j+1]
        lhs=at(d,j+1)*at(C,j)-at(d,j)*at(C,j+1)
        # split identity and signs
        dd=at(d,j+1)-at(d,j); dc=at(C,j+1)-at(C,j)
        rhs=dd*at(C,j)-at(d,j)*dc
        assert lhs==rhs and lhs>0 and at(C,j)>0 and at(d,j)>=0 and dd>0 and dc<0
        vals.append((p,j,lhs,dd,dc))
    print({'counts':counts,'N':N,'x':x,'eligible_p':[v[0] for v in vals], 'boundary_values':vals[:1]+([] if len(vals)<=1 else [vals[-1]]), 'interior': vals[len(vals)//2] if len(vals)>2 else None})
    return vals

# Includes an exact endpoint of the guarded band and a profile with multiple eligible ranks.
for c in [(10,0,0),(0,12,10),(3,0,0),(4,1,0),(0,4,0),(1,1,1),(0,0,4)]: check(c)

# Verify the unrestricted (not eligible) r2,m10 negative minor and current-p flags.
counts=(10,0,0); a2,a3,a4=counts; N=20; p=6; k=4
L=[1,1]; G=[1,2]; Q=[1]
for r,a in zip((2,3,4),counts): Q=conv(Q,poly_pow(add(poly_pow(L,r),[0,1]),a))
C=conv(G,Q); d=[0]+[comb(N+1,t-1) for t in range(1,N+3)]
minor=at(d,k+1)*at(C,k)-at(d,k)*at(C,k+1)
E=conv([0,1],poly_pow(L,N)); A0=add(conv(L,Q),E)
H=poly_pow(add(poly_pow(L,2),[0,1]),9)
Ai=add(conv(conv(G,add(poly_pow(L,1),[0,1])),H),E)
assert (at(d,k),at(d,k+1),at(C,k),at(C,k+1),minor)==(1330,5985,27315,125586,-3549105)
assert delta(A0,p)==577440 and delta(Ai,p)==567414
parent=add(C,d); x=next(t for t in range(len(parent)) if delta(parent,t)<0)
assert x==11 and not (x+2<=p) and 3*p<2*(N+2)+1 and 2*p<=N+2
print({'unrestricted_control':{'profile':counts,'N':N,'n':33,'alpha':22,'x':x,'k':k,'minor':minor,'d_k':at(d,k),'d_k1':at(d,k+1),'C_k':at(C,k),'C_k1':at(C,k+1),'p':p,'Delta_A0':delta(A0,p),'e0':int(delta(A0,p)<0),'Delta_Ai':delta(Ai,p),'ei':int(delta(Ai,p)<0),'guards':{'x_plus_2_le_p':x+2<=p,'3p_lt_2alpha_plus_1':3*p<2*(N+2)+1,'2p_le_alpha':2*p<=N+2}}})
