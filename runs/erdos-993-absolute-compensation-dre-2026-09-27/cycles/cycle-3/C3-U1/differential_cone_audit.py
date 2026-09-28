from profile_rank_audit import mul,add,binom_poly

def check(limit):
 profiles=0; tested=0; failures=[]
 for m in range(1,limit+1):
  for a2 in range(m+1):
   for a3 in range(m-a2+1):
    a4=m-a2-a3; N=2*a2+3*a3+4*a4; q=N+1
    C=[1]
    for r,n in ((2,a2),(3,a3),(4,a4)):
     B=binom_poly(r); B[1]+=1
     for _ in range(n): C=mul(C,B)
    C=mul(C,[1,2]); P=add(C,[0]+binom_poly(q)); P += [0]*(q+2-len(P))
    # coeff of (1+z)P'-(N+2)P: (k+1)P[k+1]-(N+2-k)P[k]
    for k in range(q+2):
     rank_slack=54*k-(24*N-4*a2-3*a3-5)
     if rank_slack<0:
      tested+=1
      e=(k+1)*(P[k+1] if k+1<len(P) else 0)-(N+2-k)*(P[k] if k<len(P) else 0)
      if e<0 and len(failures)<10: failures.append((a2,a3,a4,N,k,e,rank_slack))
    profiles+=1
 return {'profiles':profiles,'rank_forbidden_positions':tested,'negative_cone_coefficients':failures}
if __name__=='__main__':
 import sys; print(check(int(sys.argv[1])))
