import random, json, hashlib
from ordinary_tree import prufer_tree, coefficient, delta

def contract_x(poly):
    for k in range(len(poly)+1):
        if delta(poly,k)<0: return k
    raise AssertionError("contract terminal descent was not found")

def inspect(t):
    poly=t.forest_independence_polynomial(); alpha=len(poly)-1; p=alpha-2; x=contract_x(poly)
    gs=[]; fav=0; aggregate=0; leaf_count=0
    for v in t.leaves():
        s=t.support(v); H=t.remove({v,s}); R=t.remove(t.closed_neighborhood({s}))
        hp=H.forest_independence_polynomial(); rp=R.forest_independence_polynomial()
        a=delta(t.remove({v}).forest_independence_polynomial(),p)
        g=delta(hp,p-1)-delta(rp,p-1)
        leaf_count += 1
        if a<0:
            fav += 1; aggregate += g; gs.append(g)
    return dict(n=len(t.vertices),alpha=alpha,p=p,x=x,eligible=x+2<=p,leaf_count=leaf_count,
                favorable_count=fav,aggregate=aggregate,positive_favorable_summands=sum(g>0 for g in gs),
                identity_candidate_pass=(all(g<=0 for g in gs)))

rng=random.Random(20260924); out=[]
for j in range(4):
    seq=[rng.randrange(260) for _ in range(258)]
    t=prufer_tree(seq); row=inspect(t)
    row.update(case=f"uniform-Prufer-260-seed-{20260924+j}",sequence=seq,
               edge_list=[list(sorted((v,u))) for v in sorted(t.vertices) for u in t.adjacency[v] if v<u])
    row['sequence_sha256']=hashlib.sha256(json.dumps(seq,separators=(',',':')).encode()).hexdigest()
    row['edge_list_sha256']=hashlib.sha256(json.dumps(row['edge_list'],separators=(',',':')).encode()).hexdigest()
    out.append(row)
with open('scratchpad/C1-CF-T2/random-probe-replay.json','w') as f: json.dump(out,f,indent=2,sort_keys=True)
print(json.dumps([{k:r[k] for k in ('case','n','alpha','p','x','eligible','leaf_count','favorable_count','aggregate','positive_favorable_summands','identity_candidate_pass','sequence_sha256','edge_list_sha256')} for r in out],indent=2))
