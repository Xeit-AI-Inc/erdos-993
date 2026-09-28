"""Exact bounded checks for the two C4 guarded shifted-C candidates."""
import json
from pathlib import Path

def add(a,b):
    n=max(len(a),len(b))
    return [(a[i] if i<len(a) else 0)+(b[i] if i<len(b) else 0) for i in range(n)]
def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return c
def scale(a,s): return [s*x for x in a]
def at(a,k): return a[k] if 0<=k<len(a) else 0
def power(a,n):
    out=[1]
    for _ in range(n): out=mul(out,a)
    return out
L=[1,1]; G=[1,2]

def family(a2,a3,a4):
    rs=[2]*a2+[3]*a3+[4]*a4; N=sum(rs)
    B={r:add(power(L,r),[0,1]) for r in (2,3,4)}
    Q=[1]
    for r in rs: Q=mul(Q,B[r])
    C=mul(G,Q); zLN=[0]+power(L,N); A=[]
    for i,r in enumerate(rs):
        H=[1]
        for h,s in enumerate(rs):
            if h!=i: H=mul(H,B[s])
        A.append(add(mul(mul(G,add(power(L,r-1),[0,1])),H),zLN))
    W=[0]
    for r,a in zip(rs,A): W=add(W,scale(a,r))
    return rs,N,C,A,W

def bounded_scan(max_m=18):
    count_i=count_w=0; first_i=first_w=None; profiles=0
    for a2 in range(max_m+1):
      for a3 in range(max_m-a2+1):
       for a4 in range(max_m-a2-a3+1):
        if a2+a3+a4==0: continue
        rs,N,C,A,W=family(a2,a3,a4); profiles+=1
        for k in range(1,(N+2)//2+1):
          if 2*k>N+2: continue
          for r,a in zip(rs,A):
            margin=at(a,k)*at(C,k)-at(a,k+1)*at(C,k-1); count_i+=1
            if margin<0 and first_i is None:first_i={'counts':[a2,a3,a4],'r':r,'N':N,'k':k,'margin':margin}
          margin=at(W,k)*at(C,k)-at(W,k+1)*at(C,k-1); count_w+=1
          if margin<0 and first_w is None:first_w={'counts':[a2,a3,a4],'N':N,'k':k,'margin':margin}
    return {'max_branches':max_m,'profile_count':profiles,'individual_comparisons':count_i,'weighted_comparisons':count_w,'first_individual_failure':first_i,'first_weighted_failure':first_w}

def actual_example():
    a2,a3,a4=0,22,0; rs,N,C,A,W=family(a2,a3,a4); q=N+1
    P=add(C,[0]+power(L,q))
    x=next(k for k in range(len(P)) if at(P,k+1)-at(P,k)<0)
    alpha=N+2; rows=[]
    for p in range(len(P)+1):
        if x+2<=p and 3*p<2*alpha+1 and 2*p<=alpha:
            rows.append({'p':p,'delta_P':at(P,p+1)-at(P,p),'delta_W':at(W,p+1)-at(W,p),
             'selected_branch_count':sum(at(a,p+1)-at(a,p)<0 for a in A),
             'minimum_individual_margin':min(at(a,p)*at(C,p)-at(a,p+1)*at(C,p-1) for a in A),
             'weighted_margin':at(W,p)*at(C,p)-at(W,p+1)*at(C,p-1)})
    return {'counts':[a2,a3,a4],'N':N,'alpha':alpha,'first_strict_descent_x':x,'eligible_rows':rows}

if __name__=='__main__':
    out={'bounded_guarded_scan':bounded_scan(),'targeted_actual_eligibility_example':actual_example(),
      'method':'direct integer polynomial multiplication and zero-extended coefficient access'}
    dest=Path(__file__).with_name('shifted_audit.json')
    dest.write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps(out,indent=2))
