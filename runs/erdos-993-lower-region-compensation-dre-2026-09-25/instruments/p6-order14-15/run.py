"""Bounded root-controller instrument. No theorem or status award."""
from pathlib import Path
import sys, json, hashlib, time
P=Path(__file__).resolve().parent
B=P.parents[1]
sys.path.insert(0,str(B/'inputs'))
import ordinary_tree_checked as O
import forest24 as F

def graph(code):
    edges=[]; cursor=0
    def parse(s, at, parent=None):
        nonlocal cursor
        assert s[at]=='('
        u=cursor;cursor+=1;at+=1
        if parent is not None:edges.append((parent,u))
        while s[at]!=')':_,at=parse(s,at,u)
        return u,at+1
    if code.startswith('U:'):
        s=code[2:];_,end=parse(s,0);assert end==len(s)
    else:
        a,b=code[2:].split('|');u,end=parse(a,0);assert end==len(a)
        _,end=parse(b,0,u);assert end==len(b)
    return O.Graph.from_edges(range(cursor),edges)

def main():
    t=time.monotonic();R=F.rooted(7);results=[]
    for n in (14,15):
        codes=set();rows=[];replay_count=0
        def take(packed,code):
            nonlocal replay_count
            assert code not in codes;codes.add(code)
            T=graph(code);assert len(T.vertices)==n
            poly=T.forest_independence_polynomial()
            assert [O.coefficient(poly,j) for j in range(9)]==F.coeffs(packed)
            a=len(poly)-1;x=O.first_strict_descent(poly);p=6
            if x+2<=p and 3*p<2*a+1:
                row=O.aggregate_row(T,p)
                row['centroid_code']=code;rows.append(row)
                # Independent subset enumeration for every eligible witness.
                # Count T and every distinct original-support deletion by masks.
                adj=[sum(1<<w for w in T.adjacency[v]) for v in range(n)]
                allmask=(1<<n)-1
                needed={allmask}
                for v in T.leaves():
                    s=T.support(v)
                    needed.update((allmask^(1<<v),allmask&~((1<<v)|(1<<s)),allmask&~((1<<s)|adj[s])))
                counts={mask:[0]*(n+1) for mask in needed}
                independent=[True]*(1<<n)
                for mask in range(1<<n):
                    if mask:
                        bit=mask&-mask;v=bit.bit_length()-1;rest=mask^bit
                        independent[mask]=independent[rest] and not(adj[v]&rest)
                    if independent[mask]:
                        k=mask.bit_count()
                        for universe,c in counts.items():
                            if not(mask&~universe):c[k]+=1
                assert O.trim(counts[allmask])==poly
                total=0;selected=[]
                for v in T.leaves():
                    s=T.support(v)
                    if O.delta(counts[allmask^(1<<v)],p)<0:
                        selected.append(v)
                        H=counts[allmask&~((1<<v)|(1<<s))]
                        Q=counts[allmask&~((1<<s)|adj[s])]
                        total+=O.delta(H,p-1)-O.delta(Q,p-1)
                assert selected==row['favorable_leaves'] and total==row['aggregate']
                replay_count+=1
            return False
        F.visit_trees(n,R,take,codes_all=True)
        assert len(codes)==F.TREE_COUNTS[n]
        results.append({'order':n,'tree_classes':len(codes),'eligible_rows':len(rows),'positive_aggregates':sum(r['aggregate']>0 for r in rows),'nonnegative_aggregates':sum(r['aggregate']>=0 for r in rows),'max_aggregate':max((r['aggregate'] for r in rows),default=None),'subset_replayed_rows':replay_count,'rows':rows})
        print(json.dumps({k:v for k,v in results[-1].items() if k!='rows'}),flush=True)
    data={'scope':'all unlabeled ordinary trees of orders 14 and 15 at p=6 satisfying x+2<=p and 3p<2alpha+1','evidence_grade':'bounded_computation','formal_award':False,'results':results}
    raw=(json.dumps(data,sort_keys=True,indent=2)+'\n').encode()
    with (P/'RESULTS.json').open('xb') as f:f.write(raw)
    receipt={'elapsed_seconds':time.monotonic()-t,'result_sha256':hashlib.sha256(raw).hexdigest(),'source_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'status_authority':'controller finite computation only'}
    with (P/'EXECUTION.json').open('x') as f:json.dump(receipt,f,indent=2)
    print(json.dumps(receipt),flush=True)

if __name__=='__main__':main()
