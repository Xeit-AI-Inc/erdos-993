from math import comb
import json
from pathlib import Path
from fractions import Fraction

def add(a,b):
    c=[0]*max(len(a),len(b))
    for i,v in enumerate(a): c[i]+=v
    for i,v in enumerate(b): c[i]+=v
    return c

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,u in enumerate(a):
        for k,v in enumerate(b): c[i+k]+=u*v
    return c

def power(a,n):
    r=[1]
    for _ in range(n): r=mul(r,a)
    return r

def at(a,k): return a[k] if 0<=k<len(a) else 0

def choose(n,k): return comb(n,k) if 0<=k<=n else 0

m=173; r=4; N=4*m; q=N+1; alpha=N+2
L=[1,1]; z=[0,1]; G=[1,2]
B4=add(power(L,4),z)
B3=add(power(L,3),z)
F4=add(add([1],L),power(L,2))
GF4=mul(G,F4)
assert B4==[1,5,6,4,1]
assert GF4==[3,9,7,2], 'GF4 is in monomial z basis'
Q=power(B4,m); H=power(B4,m-1)
C=mul(G,Q); P=add(C,mul(z,power(L,q)))
A0=add(mul(L,Q),mul(z,power(L,N)))
Ai=add(mul(mul(G,B3),H),mul(z,power(L,N)))
T=mul(mul(G,F4),H)
x=next(k for k in range(len(P)) if at(P,k+1)<at(P,k))
p=x+2; j=p-2; delta=q-j
assert (x,p,j,delta)==(336,338,336,357)
assert x+2<=p and 3*p<2*alpha+1 and 2*p<=alpha
flags=[at(A0,p+1)<at(A0,p), at(Ai,p+1)<at(Ai,p)]
assert flags==[True,True]
# Symmetry makes the tested Ai flag identical for all 692 private-tip tags.
e0=1; ei=1; b=e0+N*ei; A=N*at(T,j)
D=choose(N,j+1)-choose(N,j)
Cj=at(C,j); Cj1=at(C,j+1)
K=delta*Cj-(delta-1)*Cj1
rhs=b*delta*D*Cj
assert Cj>Cj1>0 and D>0 and K>0
# Center-subset layers a=0,1,2, independently accumulated from the monomial GF4 basis.
layers=[]
for a in range(3):
    layer=choose(m-1,a)*sum(g*choose(4*(m-1-a),j-a-s) for s,g in enumerate(GF4))
    layers.append(layer)
Tdepth1=sum(layers[:2]); Tdepth2=sum(layers)
margin1=K*N*Tdepth1-rhs
margin2=K*N*Tdepth2-rhs
marginfull=K*A-rhs
assert Tdepth1<Tdepth2<=at(T,j)
assert margin1<0<margin2 and marginfull>0
# Check the divided coefficient kappa=1-(1-1/delta)t at boundary and interior t.
kappa={str(t):str(Fraction(1)-Fraction(delta-1,delta)*t) for t in [Fraction(0),Fraction(1,2),Fraction(1)]}
assert all(Fraction(v)>0 for v in kappa.values())
# Exact normalized check after division by the positive integer delta*Cj.
normalized_lhs=Fraction(K,delta*Cj)*A
assert (K*A>=rhs)==(normalized_lhs>=b*D)
assert K*A>=rhs and K*N*Tdepth2>=rhs
out={
 'profile':{'m':m,'N':N,'q':q,'alpha':alpha,'x':x,'p':p,'j':j,'delta':delta,'b':b},
 'basis_check':{'B4_z':B4,'GF4_z':GF4},
 'actual_flags':{'endpoint_strict':flags[0],'representative_tip_strict':flags[1],'original_tip_multiplicity':N},
 'coefficients':{'Cj':str(Cj),'Cj1':str(Cj1),'D':str(D),'Tj':str(at(T,j))},
 'center_layers':{'a0':str(layers[0]),'a1':str(layers[1]),'a2':str(layers[2]),'depth1':str(Tdepth1),'depth2':str(Tdepth2)},
 'signed_primary_margins':{'depth1':str(margin1),'depth2':str(margin2),'full':str(marginfull)},
 'positive_divisor':{'K':str(K),'delta_Cj':str(delta*Cj),'t_strictly_between_0_and_1':True,'kappa_at_t_0_half_1':kappa},
 'scope':'independent direct-factor exact replay of the two bounded worker claims; no universal inference'
}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k not in ['coefficients','center_layers']}))

