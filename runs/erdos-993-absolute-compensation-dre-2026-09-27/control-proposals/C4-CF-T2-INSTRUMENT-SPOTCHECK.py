from math import comb
from pathlib import Path
import json

def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c

def at(a,k):return a[k]if 0<=k<len(a)else 0
b4=[1,5,6,4,1];b3=[1,4,3,1];H=[1]
for _ in range(23):H=mul(H,b4)
V=mul([1,2],H);C=mul(V,b4);U=mul(V,b3);Ubad=mul(V,[1,3,3,1]);E=[0]+[comb(96,k)for k in range(97)]
W=[96*(at(U,k)+at(E,k))for k in range(99)];WB=[96*(at(Ubad,k)+at(E,k))for k in range(99)]
rows=[{'k':k,'correct_margin':str(at(W,k)*at(C,k)-at(W,k+1)*at(C,k-1)),'omitted_z_margin':str(at(WB,k)*at(C,k)-at(WB,k+1)*at(C,k-1))}for k in [1,24,49]]
out={'scope':'Root independent exact replay of AT correction: original weighted deck at24arity4branches; wrong instrument omits+z from B3. No universal proof.','rows':rows}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
