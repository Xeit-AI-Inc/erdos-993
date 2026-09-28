"""Exact independent reconstruction of the negative cofactor-slope control."""
import json
from math import comb
from pathlib import Path

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for k,y in enumerate(b): c[i+k]+=x*y
    return c

def add(a,b):
    return [(a[k] if k<len(a) else 0)+(b[k] if k<len(b) else 0)
            for k in range(max(len(a),len(b)))]

def slope(a,k):
    return (a[k+1] if k+1<len(a) else 0)-(a[k] if k<len(a) else 0)

def power(a,n):
    v=[1]
    for _ in range(n): v=mul(v,a)
    return v

counts={2:0,3:12,4:10}
m=sum(counts.values()); N=sum(r*c for r,c in counts.items()); q=N+1; alpha=N+2
B={r:[comb(r,k)+(k==1) for k in range(r+1)] for r in (1,2,3,4)}
Q=mul(power(B[3],12),power(B[4],10))
C=mul([1,2],Q)
LN=[comb(N,k) for k in range(N+1)]
P=add(C,[0]+[comb(q,k) for k in range(q+1)])
x=next(k for k in range(len(P)) if slope(P,k)<0)
p=39; j=p-2; delta=q-j; D=LN[j+1]-LN[j]
A0=add(mul([1,1],Q),[0]+LN)
record={'profile':[0,12,10],'m':m,'n':3+m+N,'N':N,'q':q,'alpha':alpha,
        'x':x,'p':p,'j':j,'delta':delta,'D_j':D,
        'guards':[x+2<=p,3*p<2*alpha+1,2*p<=alpha],
        'Delta_p_A0':slope(A0,p),'C_j':C[j],'C_j1':C[j+1]}
T={}; flags={}
for r in (3,4):
    H=mul(power(B[3],12-(r==3)),power(B[4],10-(r==4)))
    F=[0]
    for h in range(r-1):F=add(F,[comb(h,k) for k in range(h+1)])
    Ai=add(mul(mul([1,2],B[r-1]),H),[0]+LN)
    d=slope(mul(F,H),p-3)
    ai=slope(Ai,p)
    record[f'Delta_p_A{r}']=ai
    record[f'd_{r}']=d
    record[f'threshold_margin_{r}']=d-record['Delta_p_A0']
    T[r]=mul(mul([1,2],F),H)[j]
    flags[r]=int(ai<0)
    record[f'T_{r}_j']=T[r]
record['e0']=int(record['Delta_p_A0']<0)
record['e3']=flags[3];record['e4']=flags[4]
record['b']=record['e0']+3*12*flags[3]+4*10*flags[4]
record['A']=3*12*flags[3]*T[3]+4*10*flags[4]*T[4]
record['MASS_margin']=record['A']-record['b']*delta*D
record['payment_margin']=(delta*C[j]-(delta-1)*C[j+1])*record['A']-record['b']*delta*D*C[j]
assert all(record['guards']) and x==37 and record['e0']==record['e3']==record['e4']==1
assert record['d_3']<0 and record['d_4']<0
assert record['threshold_margin_3']>0 and record['threshold_margin_4']>0
Path(__file__).with_suffix('.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(record,indent=2))
