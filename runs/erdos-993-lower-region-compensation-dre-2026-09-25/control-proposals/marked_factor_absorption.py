"""Exact finite factor certificate; stdout only, no tree theorem or status award."""
from math import comb
from fractions import Fraction
import json

def conv(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):c[i+j]+=x*y
    return c

def ulc_order(a):
    n=len(a)-1;d=n
    for j in range(1,n):
        L=j*a[j]*a[j];R=(j+1)*a[j-1]*a[j+1]
        if L<=R:return None
        d=max(d,j+(R+(L-R)-1)//(L-R))
    return d

rows=[]
for r in range(2,13):
    for s in range(2,13):
        F=[comb(r-1,j+1) for j in range(r-1)]
        B=[comb(s,j) for j in range(s+1)];B[1]+=1
        p=conv(F,B);d=ulc_order(p)
        if d:
            a=[Fraction(x,comb(d,j)) for j,x in enumerate(p)]
            assert all(a[j]**2>=a[j-1]*a[j+1] for j in range(1,len(a)-1))
        rows.append({'r':r,'s':s,'coefficients':p,'finite_ULC_order':d})
print(json.dumps({'status':'unawarded exact finite-factor arithmetic; no tree theorem','rows':rows,'failures':[(x['r'],x['s'])for x in rows if x['finite_ULC_order'] is None]},indent=2))
