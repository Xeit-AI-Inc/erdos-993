from math import comb
import json
from pathlib import Path

OUT = Path(__file__).with_suffix('.json')

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return c

def add(a,b):
    c=[0]*max(len(a),len(b))
    for i,x in enumerate(a): c[i]+=x
    for i,x in enumerate(b): c[i]+=x
    return c

def scale(a,s): return [s*x for x in a]
def at(a,k): return a[k] if 0<=k<len(a) else 0
def powp(a,n):
    v=[1]
    for _ in range(n): v=mul(v,a)
    return v
L=[1,1]; G=[1,2]
def B(r): return add(powp(L,r),[0,1])

def products(counts):
    Q=[1]
    for r,n in zip((2,3,4),counts):
        for _ in range(n): Q=mul(Q,B(r))
    N=sum(r*n for r,n in zip((2,3,4),counts))
    C=mul(G,Q)
    E=[0]+[comb(N,k) for k in range(N+1)]
    return N,Q,C,E

def profile_rows(max_m=20):
    for m in range(1,max_m+1):
        for a2 in range(m+1):
            for a3 in range(m-a2+1):
                yield (a2,a3,m-a2-a3)

def first_descent(P):
    # through terminal degree, strict forward difference only
    for k in range(len(P)):
        if at(P,k+1)-at(P,k)<0: return k
    return len(P)

def deletion_polys(counts,N,Q):
    A0=add(mul(L,Q),[0]+[comb(N,k) for k in range(N+1)])
    Ai={}
    for r,n in zip((2,3,4),counts):
        if n:
            # exact division avoided: form all other factors
            H=[1]
            for s,ns in zip((2,3,4),counts):
                use=ns-(s==r)
                for _ in range(use): H=mul(H,B(s))
            Ui=mul(mul(G,B(r-1)),H)
            Ai[r]=add(Ui,[0]+[comb(N,k) for k in range(N+1)])
    return A0,Ai

# Mandatory E-only control, with full-deletion margins.
counts=(0,22,0); N,Q,C,E=products(counts); A0,Ai=deletion_polys(counts,N,Q); k=27
margin=lambda V,k: at(V,k)*at(C,k)-at(V,k+1)*at(C,k-1)
e_control={
    'counts':list(counts),'m':sum(counts),'n':N+sum(counts)+3,'N':N,'alpha':N+2,
    'x':first_descent(add(C,[0]+[comb(N+1,s) for s in range(N+2)])),
    'p':34,'guarded_k':k,'guard_1_le_k':1<=k,'guard_2k_le_N_plus_2':2*k<=N+2,
    'E_only_signed_margin':str(margin(E,k)),
    'full_endpoint_signed_margin':str(margin(A0,k)),
    'full_tip_r3_signed_margin':str(margin(Ai[3],k)),
    'original_tag_multiplicities':{'endpoint':1,'arity3_tip_tags':66,'total':67},
    'strict_selectors_at_p':{'p':34,'e0':int(at(A0,35)-at(A0,34)<0),'e3':int(at(Ai[3],35)-at(Ai[3],34)<0)},
    'meaning':'E-only comparison fails; full endpoint and represented-tip comparisons are positive. The primary selectors use strict Delta_p<0.'}

# Required activity-layer countercontrol, independently evaluating t-coefficients.
# For all r=4, m=3 and distinguished tip branch, coefficient t^a corresponds
# to choose(m-1,a) z^a G B_4 B_4^(m-1-a) and similarly for U_i.
r=4;m=3;N=r*m;k=7
C_layers=[];U_layers=[]
for a in range(m):
    V=[0]*a + scale(mul(G,powp(L,r*(m-1-a))),comb(m-1,a))
    C_layers.append(mul(B(r),V))
    U_layers.append(mul(B(r-1),V))
E=[0]+[comb(N,s) for s in range(N+1)]
layer_margins=[]
for d in range(2*m-1):
    z=0
    for a in range(m):
        b=d-a
        if 0<=b<m:
            z += at(U_layers[a],k)*at(C_layers[b],k)-at(U_layers[a],k+1)*at(C_layers[b],k-1)
    if d<m:
        z += at(E,k)*at(C_layers[d],k)-at(E,k+1)*at(C_layers[d],k-1)
    layer_margins.append(z)
Ctot=[0]; Utot=[0]
for p in C_layers: Ctot=add(Ctot,p)
for p in U_layers: Utot=add(Utot,p)
full_A=add(Utot,scale(E,m*r))
activity_control={'profile':'all arity 4, m=3','N':N,'n':N+m+3,'k':k,'guard_1_le_k':1<=k,'guard_2k_le_N_plus_2':2*k<=N+2,
                  'negative_layer_degree':3,'layer_degree_3_margin':str(layer_margins[3]),
                  'sum_of_all_layer_margins':str(sum(layer_margins)),
                  'direct_full_tip_margin':str(at(add(mul(B(3),mul(G,powp(B(4),m-1))),E),k)*at(Ctot,k)-at(add(mul(B(3),mul(G,powp(B(4),m-1))),E),k+1)*at(Ctot,k-1)),
                  'full_weighted_tip_margin':str(margin(full_A,k)),
                  'meaning':'A negative formal-layer coefficient does not imply a negative t=1 total.'}

# Required n=122 out-of-guard actual ordinary path-star control.
counts=(38,0,1); N,Q,C,E=products(counts); P=add(C,[0]+[comb(N+1,s) for s in range(N+2)])
x=first_descent(P); k=77
r=4; H=[1]
for s,ns in zip((2,3,4),counts):
    for _ in range(ns-(s==r)): H=mul(H,B(s))
A4=add(mul(mul(G,B(3)),H),[0]+[comb(N,t) for t in range(N+1)])
n122={'counts':list(counts),'m':sum(counts),'N':N,'n':N+sum(counts)+3,'alpha':N+2,'x_actual_first_strict_descent':x,
      'k':k,'guard_1_le_k':1<=k,'guard_2k_le_N_plus_2':2*k<=N+2,'guard_failure':f'2k={2*k}>N+2={N+2}',
      'full_tip_shifted_margin':str(margin(A4,k)),
      'meaning':'Negative shifted margin lies outside the registered guarded band; it refutes no guarded target.'}

# Focused falsification run for the OPEN weighted tip-deck guarded comparison.
# Enumerates arity-count profiles through m=20 and every exact guarded k.
profiles=0; ranks=0; failures=[]; minrow=None
for counts in profile_rows(20):
    profiles+=1
    N,Q,C,E=products(counts)
    W=[0]
    for r,n in zip((2,3,4),counts):
        if not n: continue
        H=[1]
        for s,ns in zip((2,3,4),counts):
            for _ in range(ns-(s==r)): H=mul(H,B(s))
        U=mul(mul(G,B(r-1)),H)
        Ai=add(U,E)
        W=add(W,scale(Ai,r*n))
    for k in range(1,(N+2)//2+1):
        ranks+=1
        v=at(W,k)*at(C,k)-at(W,k+1)*at(C,k-1)
        if minrow is None or v<minrow['margin']:
            minrow={'counts':list(counts),'N':N,'k':k,'margin':v}
        if v<0 and len(failures)<10:
            failures.append({'counts':list(counts),'N':N,'k':k,'margin':str(v)})

out={'schema':'C5-F1-adversarial.v1','arithmetic':'exact Python integers; zero-extended coefficients','mandatory_controls':{'E_only':e_control,'activity_layer':activity_control,'n122_out_of_guard':n122},
     'weighted_guarded_shifted_C_focused_scan':{'profile_horizon_m_le':20,'profiles':profiles,'guarded_profile_rank_tests':ranks,
                                                'observed_failures':failures,'minimum_margin_row':{**minrow,'margin':str(minrow['margin'])},
                                                'scope':'bounded falsification evidence only; not a universal proof and not a census beyond this horizon'}}
OUT.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
