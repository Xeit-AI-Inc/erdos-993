from functools import lru_cache
from itertools import product
import json

# Exact polynomial arithmetic over Z for the tree path 0-1-2 with m stars
# whose center is adjacent to 0 and which have r_i tip leaves, r_i in {2,3,4}.
def add(a,b):
    out=[0]*max(len(a),len(b))
    for j,x in enumerate(a): out[j]+=x
    for j,x in enumerate(b): out[j]+=x
    while len(out)>1 and out[-1]==0: out.pop()
    return tuple(out)
def mul(a,b):
    out=[0]*(len(a)+len(b)-1)
    for j,x in enumerate(a):
        for k,y in enumerate(b): out[j+k]+=x*y
    while len(out)>1 and out[-1]==0: out.pop()
    return tuple(out)
def shift(a): return (0,)+a

def tree_poly(adj, deleted=frozenset()):
    alive=set(range(len(adj)))-set(deleted)
    seen=set(); total=(1,)
    for root in sorted(alive):
        if root in seen: continue
        parent={root:-1}; order=[root]; seen.add(root)
        for u in order:
            for v in adj[u]:
                if v in alive and v!=parent[u] and v not in seen:
                    seen.add(v); parent[v]=u; order.append(v)
        inc={}; exc={}
        for u in reversed(order):
            a=(1,); b=(1,)
            for v in adj[u]:
                if v in alive and parent.get(v)==u:
                    a=mul(a,exc[v]); b=mul(b,add(inc[v],exc[v]))
            inc[u]=shift(a); exc[u]=b
        total=mul(total,add(inc[root],exc[root]))
    return total

def delta(poly,j):
    return (poly[j+1] if j+1<len(poly) else 0)-(poly[j] if j<len(poly) else 0)
def descent(poly):
    for j in range(len(poly)+1):
        if delta(poly,j)<0: return j
    raise AssertionError('no negative delta')
def zeros(poly,j): return poly[j] if 0<=j<len(poly) else 0

def make_tree(profile):
    adj=[[] for _ in range(3)]
    def edge(u,v): adj[u].append(v); adj[v].append(u)
    edge(0,1); edge(1,2)
    leaves=[(2,1)]
    nextv=3
    for b,r in enumerate(profile):
        c=nextv; nextv+=1; adj.append([]); edge(0,c)
        for _ in range(r):
            t=nextv; nextv+=1; adj.append([]); edge(c,t); leaves.append((t,c))
    supports=[1]+[s for _,s in leaves[1:]]
    # leaf pairs include path endpoint 2 first, then each star tip
    return adj,leaves

def assess(profile):
    adj,leaves=make_tree(profile)
    P=tree_poly(adj); a=len(P)-1; x=descent(P)
    rows=[]
    for p in range(x+2, (2*a)//3+1): # 3p < 2a+1 iff p <= floor(2a/3)
        if not (3*p<2*a+1): continue
        F=[]; terms=[]; leafd=[]
        for v,s in leaves:
            pv=tree_poly(adj,frozenset((v,)))
            d=delta(pv,p); leafd.append([v,d])
            if d<0:
                F.append(v)
                H=tree_poly(adj,frozenset((v,s)))
                R=tree_poly(adj,frozenset(adj[s])|{s})
                t=delta(H,p-1)-delta(R,p-1)
                terms.append([v,s,t])
        S=sum(t for _,_,t in terms)
        rows.append({'p':p,'F':F,'leaf_deltas':leafd,'terms':terms,'S':S})
    return {'profile':list(profile),'n':len(adj),'a':a,'x':x,'P':list(P),'rows':rows}

# Exact canonical profile census for every nondecreasing r-sequence of lengths 1..10.
out=[]; stats={'profiles':0,'eligible_rows':0,'positive_S':0,'empty_F_rows':0,'partial_F_rows':0,'all_F_rows':0,'all_rows_S_nonpositive':True}
for m in range(1,11):
  for cnt2 in range(m+1):
    for cnt3 in range(m-cnt2+1):
      cnt4=m-cnt2-cnt3
      profile=(2,)*cnt2+(3,)*cnt3+(4,)*cnt4
      z=assess(profile); out.append(z); stats['profiles']+=1
      for row in z['rows']:
        stats['eligible_rows']+=1
        if row['S']>0: stats['positive_S']+=1; stats['all_rows_S_nonpositive']=False
        if not row['F']: stats['empty_F_rows']+=1
        elif len(row['F'])<sum(z['profile'])+1: stats['partial_F_rows']+=1
        else: stats['all_F_rows']+=1
result={'recipe':'path 0-1-2; for each r_i in sorted profile, add center c_i adjacent to 0 and r_i tip leaves adjacent only to c_i; 2<=r_i<=4','boundary':'all nondecreasing arity profiles with 1<=m<=10 (285 profiles); every p satisfying x+2<=p and 3p<2alpha+1','stats':stats,'profiles':out}
with open('PROFILE-CENSUS.json','w') as f: json.dump(result,f,separators=(',',':'))
print(json.dumps({'boundary':result['boundary'],'stats':stats},sort_keys=True))
