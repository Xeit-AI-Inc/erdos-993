"""Independent exact replay of the C4-U2 homogeneous arity-4 row."""
from math import comb
from fractions import Fraction
import json
from pathlib import Path

def add(a,b):
    out=[0]*max(len(a),len(b))
    for i,x in enumerate(a): out[i]+=x
    for i,x in enumerate(b): out[i]+=x
    return out

def mul(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): out[i+j]+=x*y
    return out

def scale(a,c): return [c*x for x in a]
def shifted(a,k=1): return [0]*k+a
def at(a,k): return a[k] if 0<=k<len(a) else 0
def delta(a,k): return at(a,k+1)-at(a,k)
def choose(n,k): return comb(n,k) if 0<=k<=n else 0

m=173; r=4; N=r*m; q=N+1; alpha=N+2
L=[1,1]; G=[1,2]; B4=add([1,4,6,4,1],[0,1]) # (1+z)^4+z
B3=add([1,3,3,1],[0,1])
Q=[1]
for _ in range(m): Q=mul(Q,B4)
C=mul(G,Q)
P=add(C,shifted([choose(q,k) for k in range(q+1)])) # z(1+z)^q
x=next(k for k in range(len(P)+1) if delta(P,k)<0)
p=x+2; j=p-2; de=q-j
A0=add(mul(L,Q),shifted([choose(N,k) for k in range(N+1)]))
Ai=add(mul(mul(G,B3),Q[:-4] if False else [1]), [0]) if False else None
Qother=[1]
for _ in range(m-1): Qother=mul(Qother,B4)
Ai=add(mul(mul(G,B3),Qother),shifted([choose(N,k) for k in range(N+1)]))
# For this symmetric profile every tip deletion has the same coefficient sequence.
assert x==336 and p==338 and j==336 and de==357
assert p>=x+2 and 3*p<2*alpha+1 and 2*p<=alpha
assert delta(A0,p)<0 and delta(Ai,p)<0
# C ratio / binomial gap exact positivity at the target coefficient.
Cj=at(C,j); Cj1=at(C,j+1); D=choose(N,j+1)-choose(N,j)
assert 0<Cj1<Cj and D>0 and de>0
K=de*Cj-(de-1)*Cj1
assert K==Cj+(de-1)*(Cj-Cj1)>0
# Expand G*F_4 in monomial z explicitly; not the L-basis coefficients.
GF4=mul(G,add(add([1],L),mul(L,L)))
assert GF4==[3,9,7,2]
# a-layer contributions to [z^j] G F_4 (L^4+z)^(m-1).
g=(3,9,7,2)
terms=[]
for a in range(m):
    inner=sum(g[s]*choose(4*(m-1-a),j-a-s) for s in range(4))
    terms.append(choose(m-1,a)*inner)
Tj=sum(terms)
assert Tj==at(mul(mul(G,add(add([1],L),mul(L,L))),Qother),j)
# Exact-ratio margins, cleared only by positive factors C[j], delta.
b=N+1
rhs=b*de*D*Cj
Afull=N*Tj
A1=N*sum(terms[:2])
A2=N*sum(terms[:3])
margin=lambda A: K*A-rhs
assert margin(A1)<0<margin(A2)<=margin(Afull)
# Check adjacent-layer ratio identity at feasible edge/interior samples.
ratio_checks=[]
for a,s in [(0,0),(0,3),(1,1),(80,2),(170,0)]:
    k=j-a-s; n=4*(m-1-a)
    if 0<=a<m-1 and 1<=k<=n-3:
        left=Fraction(choose(m-1,a+1)*g[s]*choose(n-4,k-1),choose(m-1,a)*g[s]*choose(n,k))
        right=Fraction(m-1-a,a+1)*Fraction(k*(n-k)*(n-k-1)*(n-k-2),n*(n-1)*(n-2)*(n-3))
        assert left==right and left>0
        ratio_checks.append({'a':a,'s':s,'k':k,'n':n,'ratio':str(left)})
# Positive scaling preserves margin sign; calculate exact truncated/full ratios.
out={
 'profile':{'m':m,'r':r,'N':N,'q':q,'alpha':alpha,'x':x,'p':p,'j':j,'delta':de,'b':b},
 'polynomial_basis_GF4_z':GF4,
 'strict_actual_selectors':{'endpoint_selected':delta(A0,p)<0,'all_tip_deletions_selected':delta(Ai,p)<0},
 'checks':{'Cj_positive':Cj>0,'Cj_minus_Cj1_positive':Cj-Cj1>0,'D_positive':D>0,'K_positive':K>0,'depth_layer_sum_equals_Tj':True},
 'margins':{'depth1':str(margin(A1)),'depth2':str(margin(A2)),'full':str(margin(Afull))},
 'ratios':{'depth1_over_rhs':str(Fraction(K*A1,rhs)),'depth2_over_rhs':str(Fraction(K*A2,rhs)),'full_over_rhs':str(Fraction(K*Afull,rhs))},
 'adjacent_layer_ratio_checks':ratio_checks
}
Path('critic_replay.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
