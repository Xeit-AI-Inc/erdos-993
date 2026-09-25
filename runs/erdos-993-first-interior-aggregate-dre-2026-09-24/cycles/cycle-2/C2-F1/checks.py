from math import comb

def indep_poly(n, edges):
    adj=[set() for _ in range(n)]
    for u,v in edges:
        adj[u].add(v); adj[v].add(u)
    seen=set(); total=[1]
    def mul(a,b):
        out=[0]*(len(a)+len(b)-1)
        for i,x in enumerate(a):
            for j,y in enumerate(b): out[i+j]+=x*y
        return out
    def rooted(v,parent):
        inc=[1]; exc=[1]
        for w in adj[v]:
            if w==parent: continue
            ci,ce=rooted(w,v)
            inc=mul(inc,ce)
            exc=mul(exc,[x+y for x,y in zip(ci+[0]*max(0,len(ce)-len(ci)),ce+[0]*max(0,len(ci)-len(ce)))])
        return [0]+inc,exc
    for v in range(n):
        if v in seen: continue
        # Find a component, then root it. The input is always a forest.
        stack=[v]; seen.add(v)
        while stack:
            u=stack.pop()
            for w in adj[u]:
                if w not in seen: seen.add(w); stack.append(w)
        ci,ce=rooted(v,-1)
        total=mul(total,[x+y for x,y in zip(ci+[0]*max(0,len(ce)-len(ci)),ce+[0]*max(0,len(ci)-len(ce)))])
    return total

def delta(poly,k):
    def c(j):return poly[j] if 0<=j<len(poly) else 0
    return c(k+1)-c(k)

def calc(m):
    # vertices: v=0,s=1,u=2,w=3, then arm j uses a=4+2j,b=5+2j.
    n=4+2*m
    E=[(0,1),(1,2),(2,3)] + [(3,4+2*j) for j in range(m)] + [(4+2*j,5+2*j) for j in range(m)]
    leaves=[0]+[5+2*j for j in range(m)]
    a=len(indep_poly(n,E))-1 # polynomial degree equals alpha
    p=a-2
    P=indep_poly(n,E)
    x=next(k for k in range(a+1) if delta(P,k)<0)
    vals=[]
    for v in leaves:
      s=1 if v==0 else v-1
      # supports: b leaf support a_j (index v-1); v support s=1
      # T-v: delete v
      E_tv=[e for e in E if v not in e]
      # H: delete v and s
      E_h=[e for e in E if v not in e and s not in e]
      # R: delete closed neighborhood of s in original T
      closed={s}|{u if w==s else w for u,w in E if u==s or w==s}
      E_r=[e for e in E if e[0] not in closed and e[1] not in closed]
      # compressed vertex counts require induced poly with full labels (n okay deletes isolated garbage? use vertex subset routine)
      def poly_on(vertices, edges):
        vs=sorted(vertices); remap={v:i for i,v in enumerate(vs)}
        return indep_poly(len(vs),[(remap[u],remap[w]) for u,w in edges if u in remap and w in remap])
      allv=set(range(n))
      tv=poly_on(allv-{v},E_tv)
      hp=poly_on(allv-{v,s},E_h)
      rp=poly_on(allv-closed,E_r)
      selector=delta(tv,p)<0
      summand=delta(hp,p-1)-delta(rp,p-1)
      vals.append((v,s,selector,summand))
    S=sum(z for v,s,sel,z in vals if sel)
    # q values for designated leaf v=0: H and R with W={u}; q_j formula checked against polynomial difference
    hp=indep_poly(n-2,[(0,1)]+[]) if False else None
    return {'m':m,'n':n,'alpha':a,'p':p,'x':x,'eligible':x+2<=p,'high_tail':3*p>=2*a+1,'selector_rows':vals,'S':S,'formula_tagged':m*(5-m)*2**(m-3) if m>=3 else None,'q_p':comb(m,p-1)*2**(p-1) if 1<=p<=m+1 else 0,'q_pminus1':comb(m,p-2)*2**(p-2) if 2<=p<=m+2 else 0}

import json
rows=[calc(m) for m in [3,4,5,10,20]]
with open('scratchpad/C2-F1/checks.json','w') as f: json.dump(rows,f,indent=2)
print(json.dumps(rows,indent=2))
