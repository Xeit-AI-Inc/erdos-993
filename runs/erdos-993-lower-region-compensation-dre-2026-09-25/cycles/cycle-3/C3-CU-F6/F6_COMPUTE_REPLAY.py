from itertools import product
from math import comb
import json

def poly(n, edges):
    adj=[set() for _ in range(n)]
    for a,b in edges: adj[a].add(b); adj[b].add(a)
    seen=set()
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
    def visit(v,parent):
        seen.add(v); ex=[1]; inc=[0,1]
        for w in adj[v]:
            if w==parent: continue
            e,i=visit(w,v); ex=mul(ex,add(e,i)); inc=mul(inc,e)
        return ex,inc
    out=[1]
    for v in range(n):
        if v not in seen:
            e,i=visit(v,-1); out=mul(out,add(e,i))
    return out,adj

def coeff(a,j): return a[j] if 0<=j<len(a) else 0
def delta(a,j): return coeff(a,j+1)-coeff(a,j)
def stats(n,edges):
    f,adj=poly(n,edges); alpha=len(f)-1
    x=next((j for j in range(len(f)) if delta(f,j)<0),None)
    eligible=[]; terms=[]
    for v in range(n):
        if len(adj[v])!=1: continue
        s=next(iter(adj[v]))
        # original labels are contiguous; generic induced polynomial helper
        def induced(removed):
            keep=[u for u in range(n) if u not in removed]; remap={u:i for i,u in enumerate(keep)}
            return poly(len(keep),[(remap[a],remap[b]) for a,b in edges if a in remap and b in remap])[0]
        pv=induced({v})
        h=induced({v,s}); r=induced({s}|adj[s])
        terms.append((v,s,pv,h,r))
    for p in range(2,alpha+1):
        F=[(v,s,pv,h,r) for v,s,pv,h,r in terms if delta(pv,p)<0]
        S=sum((coeff(h,p)-coeff(r,p))-(coeff(h,p-1)-coeff(r,p-1)) for v,s,pv,h,r in F)
        if x is not None and x+2<=p and 3*p<2*alpha+1:
            eligible.append((p,x,alpha,len(F),S,[(v,s,(coeff(h,p)-coeff(r,p))-(coeff(h,p-1)-coeff(r,p-1)),delta(pv,p)) for v,s,pv,h,r in F]))
    return f,eligible

def graft_family(m,l,extra_claw=False):
    # T_m: one pendant support-leaf arm and m root-adjacent K1,3 branches;
    # graft a pendant path of l edges at the root (and optionally one claw at root).
    root=0; edges=[(0,1),(1,2)]; n=3
    for _ in range(m):
        c=n; leaves=[n+1,n+2,n+3]; n+=4; edges.append((root,c)); edges.extend((c,v) for v in leaves)
    prev=root
    for _ in range(l): edges.append((prev,n)); prev=n; n+=1
    if extra_claw:
        c=n; ls=[n+1,n+2,n+3]; n+=4; edges.append((root,c)); edges.extend((c,v) for v in ls)
    return n,edges

rows=[]
for claw in (False,True):
 for m in range(0,9):
  for l in range(1,9):
   n,e=graft_family(m,l,claw); f,elig=stats(n,e)
   for row in elig:
    p,x,a,k,S,ts=row
    rows.append(dict(family='T_m+path'+('+claw' if claw else ''),m=m,l=l,extra_claw=claw,n=n,p=p,x=x,alpha=a,F_count=k,S=S,terms=ts,poly=f))
graft={'scope':'T_m with a pendant path of length 1..8 grafted at root, optionally one additional root-adjacent K1,3; m=0..8; all eligible integer ranks','rows':rows,'eligible_rows':len(rows),'positive_rows':sum(r['S']>0 for r in rows),'nonpositive_rows':sum(r['S']<=0 for r in rows)}
def two_T(m,k,l):
    n,e=graft_family(m,0,False)
    # remove existing dummy path contribution (l=0 adds none)
    n2,e2=graft_family(k,0,False); offset=n
    e += [(a+offset,b+offset) for a,b in e2]
    # roots are 0 and offset; allocate bridge vertices after both blocks
    total=n+n2; prev=0
    for j in range(1,l): e.append((prev,total)); prev=total; total+=1
    e.append((prev,offset))
    return total,e
# Second graft locus: append the path at the marked support or at the first claw center.
shift=[]
for m in range(0,9):
 for l in range(1,9):
  for locus in ('marked_support','claw_center'):
   if locus=='claw_center' and m==0: continue
   n,e=graft_family(m,0,False); attach=1 if locus=='marked_support' else 3
   prev=attach
   for _ in range(l): e.append((prev,n)); prev=n; n+=1
   f,elig=stats(n,e)
   for p,x,a,c,S,ts in elig:
    shift.append(dict(family='T_m+path-at-'+locus,m=m,l=l,n=n,p=p,x=x,alpha=a,F_count=c,S=S,terms=ts,poly=f))
graft_at={'scope':'T_m with path length 1..8 grafted at marked support or first claw center; m=0..8 (claw-center locus requires m>=1)','rows':shift,'eligible_rows':len(shift),'positive_rows':sum(r['S']>0 for r in shift),'nonpositive_rows':sum(r['S']<=0 for r in shift)}
more=[]
for m in range(0,7):
 for k in range(0,7):
  for l in range(1,5):
   n,e=two_T(m,k,l); f,elig=stats(n,e)
   for p,x,a,c,S,ts in elig:
    more.append(dict(family='T_m--path--T_k',m=m,k=k,l=l,n=n,p=p,x=x,alpha=a,F_count=c,S=S,terms=ts,poly=f))
glue={'scope':'T_m grafted to T_k by a path of length 1..4; m,k=0..6','rows':more,'eligible_rows':len(more),'positive_rows':sum(r['S']>0 for r in more),'nonpositive_rows':sum(r['S']<=0 for r in more)}
with open('F6_RESULTS.json','w') as out: json.dump({'root_graft_family':graft,'support_or_center_graft_family':graft_at,'two_core_gluing_family':glue},out,indent=2)
print('wrote F6_RESULTS.json:',graft['eligible_rows'],'root-graft rows;',graft_at['eligible_rows'],'support/center rows;',glue['eligible_rows'],'two-core rows; positive full sums:',graft['positive_rows']+graft_at['positive_rows']+glue['positive_rows'])
