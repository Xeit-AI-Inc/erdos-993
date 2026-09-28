from math import comb
import json
from pathlib import Path

def conv(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b): c[i+j]+=x*y
 return c

def coeff(a,k): return a[k] if 0<=k<len(a) else 0

def delta(a,k): return coeff(a,k+1)-coeff(a,k)

def power(a,n):
 out=[1]
 for _ in range(n): out=conv(out,a)
 return out

def profile(m,r):
 N=m*r; q=N+1; alpha=N+2; L=[1,1]; B=power(L,r); B[1]+=1
 Q=power(B,m); H=power(B,m-1); G=[1,2]; C=conv(G,Q); Lq=power(L,q)
 P=[coeff(C,k)+coeff(Lq,k-1) for k in range(len(C)+1)]
 x=next(k for k in range(len(P)+1) if delta(P,k)<0)
 # A0=LQ+zL^N; Ai=G B_(r-1) H+zL^N.
 A0=conv([1,1],Q); A0 += [0]*(N+2-len(A0)); LN=power(L,N)
 for k,v in enumerate(LN): A0[k+1]+=v
 br1=power(L,r-1); br1[1]+=1
 Ai=conv(G,conv(br1,H)); Ai += [0]*(N+2-len(Ai))
 for k,v in enumerate(LN): Ai[k+1]+=v
 F=[1]*(r-1); GF=conv(G,F)
 rows=[]
 for p in range(x+2,alpha//2+1):
  if 3*p>=2*alpha+1: continue
  j=p-2; d=q-j; D=comb(N,j+1)-comb(N,j); target=3*d*D
  layers=[]
  for depth in range(4):
   u=0
   for ell in range(min(depth,m-1)+1):
    base=conv(GF,power(L,N-r-r*ell))
    u+=comb(m-1,ell)*coeff(base,j-ell)
   layers.append(u)
  trueT=coeff(conv(GF,H),j)
  rows.append({'p':p,'j':j,'e0':int(delta(A0,p)<0),'ei':int(delta(Ai,p)<0), 'D':D,'delta':d,'T_i_j':trueT,
   'target_3deltaD':target,'layers': [{'depth':ell,'U':v,'margin_2U_minus_target':2*v-target} for ell,v in enumerate(layers)]})
 return {'profile_counts': {'a2':m if r==2 else 0,'a3':m if r==3 else 0,'a4':m if r==4 else 0},'m':m,'N':N,'alpha':alpha,'q':q,'x':x,'eligible_rows':rows}

out={'method':'Exact integer center-layer lower bound; each chosen z from an unmarked B_r factor contributes one degree and leaves L^r; all omitted terms are nonnegative.', 'cases':[profile(40,4),profile(150,4)]}
Path(__file__).with_name('layer_probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps([{'m':c['m'],'N':c['N'],'x':c['x'],'rows':[{'p':r['p'],'j':r['j'],'selectors':[r['e0'],r['ei']],'margins':[x['margin_2U_minus_target'] for x in r['layers']]} for r in c['eligible_rows']]} for c in out['cases']],indent=2))
