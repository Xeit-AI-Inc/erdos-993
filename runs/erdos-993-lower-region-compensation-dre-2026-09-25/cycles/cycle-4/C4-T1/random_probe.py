import random,json,math
rng=random.Random(993)
def tree_poly(adj, mask, memo):
    if mask==0:return (1,)
    if mask in memo:return memo[mask]
    # choose a present vertex of maximum induced degree
    bits=[u for u in range(len(adj)) if mask>>u&1]
    v=max(bits,key=lambda u:(adj[u]&mask).bit_count())
    without=tree_poly(adj,mask^(1<<v),memo)
    blocked=tree_poly(adj,mask & ~(1<<v) & ~adj[v],memo)
    out=[0]*max(len(without),len(blocked)+1)
    for j,x in enumerate(without):out[j]+=x
    for j,x in enumerate(blocked):out[j+1]+=x
    while len(out)>1 and out[-1]==0:out.pop()
    memo[mask]=tuple(out); return memo[mask]
def one(adj,edges):
    n=len(adj); full=(1<<n)-1; memo={}; it=tree_poly(adj,full,memo)
    alpha=len(it)-1
    delta=[(it[j+1] if j+1<len(it) else 0)-(it[j] if j<len(it) else 0) for j in range(alpha+1)]
    x=next(j for j,d in enumerate(delta) if d<0)
    leaves=[v for v in range(n) if adj[v].bit_count()==1]
    for p in range(x+2,alpha+1):
        if 3*p>=2*alpha+1:continue
        F=[]
        for v in leaves:
            tv=tree_poly(adj,full^(1<<v),memo)
            if (tv[p+1] if p+1<len(tv) else 0)-(tv[p] if p<len(tv) else 0)<0:F.append(v)
        k=p-1
        for v in F:
            s=(adj[v]&-adj[v]).bit_length()-1; H=full & ~(1<<v) & ~(1<<s); W=adj[s] & ~(1<<v)
            ih=tree_poly(adj,H,memo); ir=tree_poly(adj,H & ~W,memo)
            qk=(ih[k] if k<len(ih) else 0)-(ir[k] if k<len(ir) else 0)
            qk1=(ih[k+1] if k+1<len(ih) else 0)-(ir[k+1] if k+1<len(ir) else 0)
            if qk1>qk:
                return {"type":"q_increase","n":n,"edges":edges,"iT":it,"alpha":alpha,"x":x,"p":p,"F":F,"leaf":v,"support":s,"W":[u for u in range(n) if W>>u&1],"qk":qk,"qk1":qk1}
            if k<len(ih) and k+1<len(ih) and ih[k] and qk:
                # e(A) direct over independent k subsets of H, tag condition
                E=0
                for sub in range(1<<n):
                    if sub & ~H or sub.bit_count()!=k:continue
                    if any((sub>>u&1) and (sub&adj[u]) for u in range(n)):continue
                    if not (sub&W):continue
                    e=sum(1 for z in range(n) if H>>z&1 and not (sub>>z&1) and not (sub&adj[z]))
                    E+=e
                num=E*ih[k]-(k+1)*ih[k+1]*qk
                if num>0:
                    return {"type":"positive_covariance","n":n,"edges":edges,"iT":it,"alpha":alpha,"x":x,"p":p,"k":k,"F":F,"leaf":v,"support":s,"W":[u for u in range(n) if W>>u&1],"iHk":ih[k],"iHk1":ih[k+1],"qk":qk,"E":E,"covariance_numerator":num}
    return None
for n in [24,28,32,36]:
 for r in range(200):
    pr=[rng.randrange(n) for _ in range(n-2)]; deg=[1]*n
    for z in pr:deg[z]+=1
    edges=[]
    for z in pr:
      v=next(i for i,d in enumerate(deg) if d==1);edges.append((v,z));deg[v]-=1;deg[z]-=1
    ends=[i for i,d in enumerate(deg) if d==1];edges.append(tuple(ends))
    adj=[0]*n
    for u,v in edges:adj[u]|=1<<v;adj[v]|=1<<u
    z=one(adj,edges)
    if z: print(json.dumps({"seed":993,"sample_n":n,"sample_index":r,"witness":z},separators=(',',':')));raise SystemExit
print(json.dumps({"seed":993,"samples_per_order":200,"orders":[24,28,32,36],"result":"no qualifying q-increase or positive-covariance witness"}))
