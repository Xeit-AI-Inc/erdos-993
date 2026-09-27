from math import comb
import json,sys
MAX_M=int(sys.argv[1]) if len(sys.argv)>1 else 35

def conv(a,b):
 out=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  if x:
   for j,y in enumerate(b): out[i+j]+=x*y
 return out

def first_descent(P):
 for k,x in enumerate(P):
  if (P[k+1] if k+1<len(P) else 0)-x<0:return k
 raise AssertionError

def delta(a,k):return (a[k+1] if k+1<len(a) else 0)-(a[k] if k<len(a) else 0)
def add(a,b):
 c=[0]*max(len(a),len(b))
 for i,x in enumerate(a): c[i]+=x
 for i,x in enumerate(b): c[i]+=x
 return c

def shift(a,s):return [0]*s+a

def mul_small(a,b):return conv(a,b)

def F(r):
 # sum h=0..r-2 L^h
 f=[0]
 for h in range(r-1):
  row=[comb(h,t) for t in range(h+1)]
  f=add(f,row)
 return f

bases=[[1,3,1],[1,4,3,1],[1,5,6,4,1]]
table={(0,0,0):[1]}
for m in range(1,MAX_M+1):
 for a in range(m+1):
  for b in range(m-a+1):
   c=m-a-b
   if a:prev=(a-1,b,c);base=bases[0]
   elif b:prev=(a,b-1,c);base=bases[1]
   else:prev=(a,b,c-1);base=bases[2]
   table[(a,b,c)]=conv(table[prev],base)

def parent(Q,N):
 p=conv(Q,[1,2])
 for t in range(N+2):
  i=t+1
  if i>=len(p):p.extend([0]*(i+1-len(p)))
  p[i]+=comb(N+1,t)
 return p

def deletions(counts,N):
 a,b,c=counts; Q=table[tuple(counts)]
 # endpoint deletion: L Q + z L^N
 LQ=conv([1,1],Q)
 A0=add(LQ,shift([comb(N,t) for t in range(N+1)],1))
 Ds={}
 for r,num in ((2,a),(3,b),(4,c)):
  if not num: continue
  sub=list(counts);sub[r-2]-=1
  H=table[tuple(sub)]
  # B_(r-1) = (1+z)^(r-1)+z
  B=[comb(r-1,t) for t in range(r)];B[1]+=1
  Ai=add(conv(conv([1,2],B),H),shift([comb(N,t) for t in range(N+1)],1))
  Ds[r]=Ai
 return A0,Ds

def S_data(counts,N,x,p):
 A0,Ds=deletions(counts,N)
 e0=int(delta(A0,p)<0)
 es={r:int(delta(poly,p)<0) for r,poly in Ds.items()}
 b=e0+sum(counts[r-2]*r*e for r,e in es.items())
 j=p-2
 # S = b Delta_j L^N + sum_r multiplicity*r*e_r*Delta_j T_r
 s=b*delta([comb(N,t) for t in range(N+1)],j)
 Tvals={}
 for r,e in es.items():
  sub=list(counts);sub[r-2]-=1
  H=table[tuple(sub)]
  f=F(r)
  T=conv(conv([1,2],f),H)
  Tvals[r]=T
  s+=counts[r-2]*r*e*delta(T,j)
 return {'S':s,'e0':e0,'e_by_r':es,'b':b,'T_by_r':Tvals,'A0':A0,'Ai':Ds}

res={'max_m':MAX_M,'spread_profiles':0,'common_eligible_rows':0,'violations':[],'min_diff':None,'max_common_p_rows_one_profile':0}
for m in range(2,MAX_M+1):
 for a in range(m+1):
  for b in range(2,m-a+1):
   c=m-a-b; old=[a,b,c];new=[a+1,b-2,c+1]
   N=2*a+3*b+4*c
   xo=first_descent(parent(table[tuple(old)],N));xn=first_descent(parent(table[tuple(new)],N))
   pmin=max(xo,xn)+2
   pmax=(2*N+4)//3
   rows=0
   for p in range(pmin,pmax+1):
    o=S_data(old,N,xo,p);n=S_data(new,N,xn,p)
    rows+=1;res['common_eligible_rows']+=1
    diff=n['S']-o['S']
    if res['min_diff'] is None or diff<res['min_diff'][0]:res['min_diff']=[diff,old,new,p,xo,xn,o['S'],n['S']]
    if diff>0:
     res['violations'].append({'counts_old':old,'counts_new':new,'N':N,'p':p,'x_old':xo,'x_new':xn,'S_old':o['S'],'S_new':n['S'],'difference':diff,'old_flags':{'endpoint':o['e0'],'by_arity':o['e_by_r'],'b':o['b']},'new_flags':{'endpoint':n['e0'],'by_arity':n['e_by_r'],'b':n['b']},'old_parent':parent(table[tuple(old)],N),'new_parent':parent(table[tuple(new)],N),'old_deletions':{'A0':o['A0'],'Ai':o['Ai']},'new_deletions':{'A0':n['A0'],'Ai':n['Ai']},'old_T':o['T_by_r'],'new_T':n['T_by_r']})
   res['spread_profiles']+=1
   res['max_common_p_rows_one_profile']=max(res['max_common_p_rows_one_profile'],rows)
print(json.dumps(res,separators=(',',':')))
