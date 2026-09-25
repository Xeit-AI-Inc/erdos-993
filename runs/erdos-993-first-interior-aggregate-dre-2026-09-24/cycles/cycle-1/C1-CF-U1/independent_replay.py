import json
from math import comb

def add(a,b):
    q=[0]*max(len(a),len(b))
    for j,c in enumerate(a):q[j]+=c
    for j,c in enumerate(b):q[j]+=c
    return q

def mul(a,b):
    q=[0]*(len(a)+len(b)-1)
    for j,c in enumerate(a):
        for k,d in enumerate(b):q[j+k]+=c*d
    return q

def power(a,n):
    q=[1]
    for _ in range(n):q=mul(q,a)
    return q

def coeff(a,k):return a[k] if 0<=k<len(a) else 0

def delta(a,k):return coeff(a,k+1)-coeff(a,k)

def record(name,t,h,r,actual_tv,leaves,p):
    alpha=max(k for k,c in enumerate(t) if c)
    x=next(k for k in range(alpha+1) if delta(t,k)<0)
    tv=add(h,[0]+r)
    assert tv==actual_tv
    d=delta(tv,p)
    q=lambda k:coeff(h,k)-coeff(r,k)
    summand=q(p)-q(p-1)
    return {'case':name,'alpha':alpha,'x':x,'p':p,'eligible':x+2<=p,'leaf_count':leaves,'selector_each':d,'favorable':d<0,'summand_each':summand,'complete_sum':leaves*summand if d<0 else 0,'identity_checked':tv==actual_tv}

# Path P_n: i_k(P_n)=binomial(n-k+1,k), including zeros.
def path(n):return [comb(n-k+1,k) for k in range((n+1)//2+1)]
p100=record('P100',path(100),path(98),path(97),path(99),2,48)

# Hub and 30 arms: each arm contributes 1+3z+z^2 if hub omitted;
# if hub selected, the 60 distal leaves are free.
a=power([1,3,1],29)
t=add(mul(a,[1,3,1]),[0]+power([1,1],60))
h=mul([1,1], add(a,[0]+power([1,1],58)))
r=a
actual_tv=add(mul([1,2],a),[0]+power([1,1],59))
hub=record('30-support double-leaf hub',t,h,r,actual_tv,60,59)
print(json.dumps([p100,hub],indent=2))
