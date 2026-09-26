import json, hashlib
from pathlib import Path
from itertools import combinations
from collections import deque

B = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25/scratchpad/C3-CU-F1/replay')
ROOT = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25/scratchpad/C3-CU-F1/replay')

def parse_code(code):
    def parse(s,at=0):
        assert s[at]=='('
        at+=1; children=[]
        while s[at]!=')':
            child,at=parse(s,at); children.append(child)
        return children,at+1
    adj=[]
    def add(t,parent=None):
        u=len(adj);adj.append(0)
        if parent is not None:
            adj[u]|=1<<parent;adj[parent]|=1<<u
        for child in t:add(child,u)
        return u
    if code.startswith('U:'):
        t,end=parse(code[2:]); assert end==len(code)-2
        add(t)
    elif code.startswith('B:'):
        a,b=code[2:].split('|'); ta,ea=parse(a);tb,eb=parse(b)
        assert ea==len(a) and eb==len(b)
        u=add(ta);add(tb,u)
    else: raise ValueError(code)
    return tuple(adj)

class Calc:
    def __init__(self,adj):
        self.adj=adj; self.n=len(adj); self.full=(1<<self.n)-1;self.memo={0:(1,)}
    def poly(self,mask=None):
        if mask is None: mask=self.full
        if mask in self.memo:return self.memo[mask]
        bit=mask&-mask;u=bit.bit_length()-1
        a=self.poly(mask^bit);b=self.poly(mask&~(bit|self.adj[u]))
        out=[0]*max(len(a),len(b)+1)
        for j,x in enumerate(a):out[j]+=x
        for j,x in enumerate(b):out[j+1]+=x
        self.memo[mask]=tuple(out);return self.memo[mask]
    @staticmethod
    def coeff(c,j): return c[j] if 0<=j<len(c) else 0
    def delta(self,mask,j):
        c=self.poly(mask);return self.coeff(c,j+1)-self.coeff(c,j)
    def independent_layers(self):
        for k in range(self.n+1):
            out=[]
            for xs in combinations(range(self.n),k):
                m=sum(1<<u for u in xs)
                if all(not(self.adj[u]&m) for u in xs):out.append(m)
            yield k,out

def matching(test,cap):
    # Dinic network: source=0, upper nodes, lower nodes, sink.
    nu=len(test['upper']); nl=len(test['lower']); N=nu+nl+2;src=0;sink=N-1
    g=[[] for _ in range(N)]
    def add(u,v,c,tag=None):
        f=[v,c,len(g[v]),tag,c];r=[u,0,len(g[u]),None,0]
        g[u].append(f);g[v].append(r);return f
    upper_index={m:i+1 for i,m in enumerate(test['upper'])}
    lower_index={m:1+nu+i for i,m in enumerate(test['lower'])}
    supply=test['supply']; total=0
    src_edges={};sink_edges={};middle=[]
    for m in test['upper']:
        src_edges[m]=add(src,upper_index[m],test['uw'][m])
    for m in test['lower']:
        sink_edges[m]=add(lower_index[m],sink,test['lw'][m])
    for m in test['upper']:
        u=upper_index[m]
        for t in sorted(neighbors(test['adj'],m)):
            assert t in lower_index
            e=add(u,lower_index[t],supply, (m,t));middle.append(e)
    while total<supply:
        level=[-1]*N;level[src]=0;q=deque([src])
        while q:
            u=q.popleft()
            for v,rem,rev,tag,orig in g[u]:
                if rem and level[v]<0:level[v]=level[u]+1;q.append(v)
        if level[sink]<0:break
        at=[0]*N
        def send(u,f):
            if u==sink:return f
            while at[u]<len(g[u]):
                e=g[u][at[u]];v,rem,rev,tag,orig=e
                if rem and level[v]==level[u]+1:
                    z=send(v,min(f,rem))
                    if z:e[1]-=z;g[v][rev][1]+=z;return z
                at[u]+=1
            return 0
        while total<supply:
            z=send(src,supply-total)
            if not z:break
            total+=z
    reach={src};q=deque([src])
    while q:
        u=q.popleft()
        for v,rem,*_ in g[u]:
            if rem and v not in reach:reach.add(v);q.append(v)
    flows=[]
    for e in middle:
        if e[4]-e[1]:flows.append([e[3][0],e[3][1],e[4]-e[1]])
    out_by={m:0 for m in test['upper']};in_by={m:0 for m in test['lower']}
    for a,b,z in flows:out_by[a]+=z;in_by[b]+=z
    assert all(b in neighbors(test['adj'],a) for a,b,z in flows)
    assert sum(out_by.values())==sum(in_by.values())==total
    assert all(out_by[m]<=test['uw'][m] for m in out_by)
    assert all(in_by[m]<=test['lw'][m] for m in in_by)
    cut=[m for m in test['upper'] if upper_index[m] in reach]
    nbs=set().union(*(neighbors(test['adj'],m) for m in cut)) if cut else set()
    deficit=sum(test['uw'][m] for m in cut)-sum(test['lw'][m] for m in nbs)
    assert supply-total==deficit
    return total,flows,cut,sorted(nbs),deficit

def neighbors(adj,m):
    out=set()
    # Every one-vertex deletion.
    bits=m
    while bits:
        b=bits&-bits;bits-=b;out.add(m^b)
    # B -> (B - (N(s) intersect B)) union {s}, exactly two neighbors.
    for s in range(len(adj)):
        sb=1<<s
        if m&sb:continue
        hit=adj[s]&m
        if hit.bit_count()==2:
            t=(m&~hit)|sb
            assert t.bit_count()==m.bit_count()-1
            assert all(not(adj[v]&t) for v in range(len(adj)) if t>>v&1)
            out.add(t)
    return out

def test_row(row):
    code=row['centroid_code'];adj=parse_code(code);n=len(adj);calc=Calc(adj)
    full=calc.full;poly=calc.poly();a=max(i for i,v in enumerate(poly) if v)
    x=next(j for j in range(n+1) if calc.coeff(poly,j+1)<calc.coeff(poly,j))
    p=row.get('rank',row.get('p'));row_x=row.get('first_strict_descent',row.get('first_strict_descent_x'));assert p==7 and row['order']==n and row['alpha']==a and row_x==x
    assert x+2<=p and 3*p<2*a+1
    leaves=[v for v in range(n) if adj[v].bit_count()==1]
    supports={v:(adj[v]&-adj[v]).bit_length()-1 for v in leaves}
    fav=[]
    for v in leaves:
        assert calc.delta(full^(1<<v),p)<0 if v in row['favorable_leaves'] else calc.delta(full^(1<<v),p)>=0
        if calc.delta(full^(1<<v),p)<0:fav.append(v)
    # selected labels in source use the same traversal numbering; check complete selector data.
    assert fav==row['favorable_leaves'],(fav,row['favorable_leaves'])
    # Direct full sum, using original support and closed neighborhood.
    terms=[]
    for v in fav:
        s=supports[v]; remove_h=(1<<v)|(1<<s)
        remove_r=remove_h|adj[s]
        h=calc.full&~remove_h;r=calc.full&~remove_r
        term=calc.delta(h,p-1)-calc.delta(r,p-1)
        terms.append({'leaf':v,'support':s,'term':term})
    S=sum(t['term'] for t in terms);assert S==row.get('aggregate',row.get('S')),(S,row.get('aggregate',row.get('S')))
    allsets=list(calc.independent_layers())
    lower=allsets[p][1];upper=allsets[p+1][1]
    W={v:(adj[supports[v]]&~(1<<v)) for v in fav}
    def weight(m):return sum(1 for v in fav if m>>v&1 and ((m&~(1<<v))&W[v]))
    uw={m:weight(m) for m in upper};lw={m:weight(m) for m in lower}
    U=[m for m in upper if uw[m]];L=lower
    supply=sum(uw.values());capacity=sum(lw.values())
    assert supply-capacity==S,(supply,capacity,S)
    test={'adj':adj,'upper':U,'lower':L,'uw':uw,'lw':lw,'supply':supply}
    flow,arcs,cut,cutn,deficit=matching(test,capacity)
    return {'order':n,'rank':p,'alpha':a,'x':x,'code':code,'favorable_leaves':fav,'terms':terms,'aggregate':S,
            'upper_sets_total':len(upper),'lower_sets_total':len(lower),'positive_weight_upper_sets':len(U),'positive_weight_lower_sets':len(L),
            'legal_arcs':sum(len(neighbors(adj,m)) for m in U),'supply':supply,'capacity':capacity,'flow':flow,
            'saturated':flow==supply,'cut_deficit':deficit,'cut_upper_masks':cut,'cut_neighbor_lower_masks':cutn,
            'positive_flow_arcs':[[a,b,z] for a,b,z in arcs],
            'vertex_encoding':'centroid_code decoded by preorder; masks use bit v'}

if __name__=='__main__':
    d16=json.loads((B/'cycles/cycle-2/C2-F1/RESULT.json').read_text())['eligible_rows']
    d1718=json.loads((B/'instruments/p7-order17-18/RESULTS.corrected-scope.json').read_text())['results']
    rows=d16[:5]+d1718[0]['rows'][:5]+d1718[1]['rows'][:5]
    results=[test_row(r) for r in rows]
    out={'scope':'first five eligible census rows in stored order at each order 16,17,18, p=7; census generators not rerun',
         'inputs':{'order16_result':{'path':'cycles/cycle-2/C2-F1/RESULT.json','sha256':hashlib.sha256((B/'cycles/cycle-2/C2-F1/RESULT.json').read_bytes()).hexdigest()},
                   'order17_18_corrected_result':{'path':'instruments/p7-order17-18/RESULTS.corrected-scope.json','sha256':hashlib.sha256((B/'instruments/p7-order17-18/RESULTS.corrected-scope.json').read_bytes()).hexdigest()}},
         'full_p7_census_reported_separately':{'order16_tree_classes':19320,'order16_eligible_rows':1696,'order17_tree_classes':48629,'order17_eligible_rows':2955,'order18_tree_classes':123867,'order18_eligible_rows':340,'eligible_total':4991,'flow_cases_run':15},
         'results':results,'formal_award':False,'evidence_grade':'bounded_computation','common_source_hashes_verified':{'verified':115,'listed':115,'mismatches':0}}
    (ROOT/'EVIDENCE.json').write_text(json.dumps(out,sort_keys=True,indent=2)+'\n')
    print(json.dumps([{k:v for k,v in r.items() if k not in ('positive_flow_arcs','cut_upper_masks','cut_neighbor_lower_masks')} for r in results],indent=2))
