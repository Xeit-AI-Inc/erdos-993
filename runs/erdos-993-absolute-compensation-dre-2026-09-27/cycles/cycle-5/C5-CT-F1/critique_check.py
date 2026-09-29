"""Independent exact-integer spot checks for C5-CT-F1 critique."""
from math import comb
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

def scale(a,s): return [s*x for x in a]
def at(a,k): return a[k] if 0<=k<len(a) else 0

def power(a,n):
    out=[1]
    for _ in range(n): out=mul(out,a)
    return out

L=[1,1]; G=[1,2]
def B(r): return add(power(L,r),[0,1])
def Epoly(N): return [0]+[comb(N,k) for k in range(N+1)]
def product(counts):
    q=[1]
    for r,n in zip((2,3,4),counts):
        for _ in range(n): q=mul(q,B(r))
    N=sum(r*n for r,n in zip((2,3,4),counts))
    return N,q,mul(G,q),Epoly(N)
def minor(V,C,k): return at(V,k)*at(C,k)-at(V,k+1)*at(C,k-1)
def parent(C,N): return add(C,[0]+[comb(N+1,k) for k in range(N+2)])
def first_descent(P):
    for k in range(len(P)):
        if at(P,k+1)-at(P,k)<0: return k
    return len(P)
def deletion(counts,N,typ,r=None):
    q=[1]
    if typ=='endpoint':
        _,q,_,_=product(counts)
        return add(mul(L,q),Epoly(N))
    for s,n in zip((2,3,4),counts):
        for _ in range(n-(s==r)): q=mul(q,B(s))
    return add(mul(mul(G,B(r-1)),q),Epoly(N))

def ratio_surplus(counts,r,k):
    N,q,C,E=product(counts)
    h=1+2*counts[0]+4*counts[1]+7*counts[2]
    U=deletion(counts,N,'tip',r)
    # Deletion includes E; recover U from A_i-E.
    U=[at(U,i)-at(E,i) for i in range(max(len(U),len(E)))]
    g=(k+1)*(h-k+1)
    raw=(h+1)*at(U,k)*at(C,k)+g*minor(E,C,k)
    Mfull=minor(add(U,E),C,k)
    # Exact identity: g*M_full = raw + g*M_U - (h+1)U[k]C[k]
    # Independent direct bound check: M_U >= lambda U[k]C[k].
    MU=minor(U,C,k)
    return {'N':N,'h':h,'k':k,'U_k':at(U,k),'C_k':at(C,k),'C_km1':at(C,k-1),'C_kp1':at(C,k+1),
            'E_k':at(E,k),'E_kp1':at(E,k+1),'M_E':minor(E,C,k),'M_U':MU,'g':g,
            'lambda_num':h+1,'surplus':raw,'full_tip_minor':Mfull,
            'identity_residual':g*Mfull-(raw+g*MU-(h+1)*at(U,k)*at(C,k))}

# Verify highlighted controls from independently constructed monomial polynomials.
rows=[]
counts=(0,22,0); N,q,C,E=product(counts); P=parent(C,N); x=first_descent(P); p=34
A0=deletion(counts,N,'endpoint'); A3=deletion(counts,N,'tip',3)
rows.append({'control':'E-only','counts':counts,'N':N,'n':N+sum(counts)+3,'alpha':N+2,'x':x,'p':p,
 'eligible':x+2<=p and 3*p<2*(N+2)+1 and 2*p<=N+2,
 'e0':int(at(A0,p+1)-at(A0,p)<0),'e3':int(at(A3,p+1)-at(A3,p)<0),
 'E_minor':minor(E,C,27),'A0_minor':minor(A0,C,27),'A3_minor':minor(A3,C,27),
 'guard':1<=27 and 2*27<=N+2})
counts=(0,0,3); N,q,C,E=product(counts); r=4; k=7
A=deletion(counts,N,'tip',r)
# activity expansion independent of F1's layer summation: expand marked factors in a formal t,
# then multiply coefficient polynomials by ordinary convolution for all pairs of layers.
cl=[]; ul=[]
for a in range(3):
  v=scale(mul(G,power(L,4*(2-a))),comb(2,a))
  cl.append(mul(B(4),[0]*a+v))
  ul.append(mul(B(3),[0]*a+v))
layer=[]
for d in range(5):
  val=0
  for a in range(3):
    b=d-a
    if 0<=b<3: val+=minor(mul(ul[a],cl[b]),[sum(at(v,j) for v in cl) for j in range(max(map(len,cl)))],k) if False else 0
  # Coefficient of t^d in U(t)[k]C(t)[k]-U(t)[k+1]C(t)[k-1], plus E*C(t).
  ctot=[0]
  for z in cl: ctot=add(ctot,z)
  for a in range(3):
    b=d-a
    if 0<=b<3: val+=at(ul[a],k)*at(cl[b],k)-at(ul[a],k+1)*at(cl[b],k-1)
  if d<3: val+=at(E,k)*at(cl[d],k)-at(E,k+1)*at(cl[d],k-1)
  layer.append(val)
rows.append({'control':'activity-layer','counts':counts,'N':N,'n':N+sum(counts)+3,'k':k,'guard':1<=k and 2*k<=N+2,
             'layers':layer,'layer_sum':sum(layer),'direct_full_tip_minor':minor(A,C,k)})
counts=(38,0,1); N,q,C,E=product(counts); x=first_descent(parent(C,N)); k=77; A4=deletion(counts,N,'tip',4)
rows.append({'control':'n122','counts':counts,'N':N,'n':N+sum(counts)+3,'alpha':N+2,'x':x,'k':k,
 'guard_1':1<=k,'guard_2':2*k<=N+2,'A4_minor':minor(A4,C,k)})

# Boundary/interior sanity checks of the exact-ratio implication, with exact signs.
small=[]
for counts in [(1,0,0),(0,1,0),(0,0,1),(2,0,0),(1,1,0),(0,1,1)]:
    N=sum(r*n for r,n in zip((2,3,4),counts))
    for r,n in zip((2,3,4),counts):
        if not n: continue
        for k in sorted({1,(N+2)//2}):
            if 2*k>N+2: continue
            small.append(ratio_surplus(counts,r,k))

# Monomial bases used by source: explicitly expand B_r and the factor G.
basis={str(r):B(r) for r in (2,3,4)}
result={'schema':'C5-CT-F1-independent-check.v1','basis_z':{'G':G,'B':basis},'controls':rows,'surplus_boundary_interior':small}
Path('critique_check.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))

# Independent reconstruction of the complete m<=20 weighted scan.
profiles=rank_tests=0; failures=[]; minrow=None
for m in range(1,21):
  for a2 in range(m+1):
    for a3 in range(m-a2+1):
      counts=(a2,a3,m-a2-a3); N,q,C,E=product(counts); W=[0]
      for r,n in zip((2,3,4),counts):
        if n: W=add(W,scale(deletion(counts,N,'tip',r),r*n))
      profiles+=1
      for k in range(1,(N+2)//2+1):
        rank_tests+=1; v=minor(W,C,k)
        if minrow is None or v<minrow['margin']: minrow={'counts':counts,'N':N,'k':k,'margin':v}
        if v<0: failures.append({'counts':counts,'N':N,'k':k,'margin':v})
scan={'profiles':profiles,'guarded_profile_rank_tests':rank_tests,'failures':failures[:10],
      'minimum_margin_row':{**minrow,'margin':str(minrow['margin'])}}
result['weighted_m20_independent_scan']=scan
Path('critique_check.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'weighted_m20_independent_scan':scan},indent=2))
