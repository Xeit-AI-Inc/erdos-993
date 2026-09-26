#!/usr/bin/env python3
"""Exact unlabeled-forest census for Delta_6 and K1 first-descent closure.

Adapted from r27 scratchpad/c1-sr-SR-EXX/sr_exx_census.py (remote source
erdos-993-forest-degree-extension-dre-2026-09-24); see PROTOCOL.md.
"""
import argparse
from collections import Counter, defaultdict
import hashlib
import json
import math
from pathlib import Path
import time

BITS = 32
BASE = 1 << BITS
DIGITS = 9
MASK = (1 << (BITS * DIGITS)) - 1
ONE = 1
X = BASE
TREE_COUNTS = [0,1,1,1,2,3,6,11,23,47,106,235,551,1301,3159,7741,
               19320,48629,123867,317955,823065,2144505,5623756,
               14828074,39299897]
FOREST_COUNTS = [1,1,2,3,6,10,20,37,76,153,329,710,1601,3658,8599,
                 20514,49905,122963,307199,775529,1977878,5086638,
                 13184156,34402932,90328674]
ROOTED_COUNTS = [0,1,1,2,4,9,20,48,115,286,719,1842,4766]


def coeffs(p):
    return [(p >> (BITS*j)) & (BASE-1) for j in range(DIGITS)]


def rooted(maxsize):
    # One entry PER rooted-tree class even when (out,in) polynomials coincide.
    R = {1: [(ONE, X, '()')]}
    for m in range(2, maxsize+1):
        items = [(s, f+g, f, code) for s in range(m-1,0,-1)
                 for f,g,code in R[s]]
        out = []
        path = []
        def dfs(start, left, fprod, gprod):
            if left == 0:
                code = '(' + ''.join(sorted(path)) + ')'
                out.append((fprod, (gprod << BITS) & MASK, code))
                return
            for i in range(start, len(items)):
                s, fg, f, code = items[i]
                if s > left:
                    continue
                path.append(code)
                dfs(i, left-s, (fprod*fg)&MASK, (gprod*f)&MASK)
                path.pop()
        dfs(0,m-1,ONE,ONE)
        assert len(out) == ROOTED_COUNTS[m], (m,len(out))
        R[m] = out
    return R


def visit_trees(n, R, callback, target=None, codes_all=False):
    """Visit every free-tree class once; callback(p, witness_code_or_None).

    A target polynomial requests a centroid code only when it matches.  The
    callback may return True to stop (used by witness recovery).
    """
    cap = (n+1)//2-1
    items = [(s, f+g, f, code) for s in range(min(cap,n-1),0,-1)
             for f,g,code in R[s]]
    first_fit=[next((i for i,item in enumerate(items) if item[0]<=r),len(items))
               for r in range(n)]
    path = []
    def dfs(start, left, fprod, gprod):
        if left == 0:
            p = (fprod + ((gprod << BITS)&MASK)) & MASK
            code = ('U:'+'(' + ''.join(sorted(path)) + ')') if (codes_all or p == target) else None
            return callback(p,code)
        for i in range(max(start,first_fit[left]),len(items)):
            s,fg,f,code = items[i]
            path.append(code)
            if dfs(i,left-s,(fprod*fg)&MASK,(gprod*f)&MASK):
                return True
            path.pop()
        return False
    if n == 1:
        if callback(ONE+X, 'U:()' if (codes_all or target == ONE+X) else None):
            return
    elif cap >= 1 and dfs(0,n-1,ONE,ONE):
        return
    if n % 2 == 0:
        half = R[n//2]
        for a,(fa,ga,ca) in enumerate(half):
            for fb,gb,cb in half[a:]:
                p = ((fa*fb)&MASK)+((ga*fb)&MASK)+((fa*gb)&MASK)
                p &= MASK
                code = 'B:'+ '|'.join(sorted((ca,cb))) if (codes_all or p == target) else None
                if callback(p,code):
                    return


def forest_x(c):
    # Strict first descent. Equal adjacent coefficients are plateaus, not hits.
    for j in range(7):
        if c[j+1] < c[j]:
            return j
    return None


def plus_x(c):
    # Delta_j(G+K1)=i_(j+1)(G)-i_(j-1)(G), with i_-1=0.
    for j in range(8):
        if c[j+1] < (c[j-1] if j else 0):
            return j
    return None


def independent_poly_from_code(code):
    """Independent replay by vertex-subset counting for small fixture codes."""
    def parse(s, at):
        assert s[at] == '('
        at += 1
        children=[]
        while s[at] != ')':
            child,at=parse(s,at)
            children.append(child)
        return children,at+1
    comps=[]
    for part in code:
        if part.startswith('U:'):
            t,end=parse(part[2:],0)
            assert end == len(part)-2
            comps.append((t,None))
        else:
            a,b=part[2:].split('|')
            ta,ea=parse(a,0);tb,eb=parse(b,0)
            assert ea==len(a) and eb==len(b)
            comps.append((ta,tb))
    adj=[]
    def add(t,parent=None):
        u=len(adj);adj.append(0)
        if parent is not None:
            adj[u]|=1<<parent;adj[parent]|=1<<u
        for c in t:add(c,u)
        return u
    for ta,tb in comps:
        u=add(ta)
        if tb is not None:add(tb,u)
    n=len(adj)
    if n > 24:
        raise ValueError('replay order exceeds 24')
    # Exact vertex-deletion DP, separate from the packed rooted products.
    memo={0:(1,)}
    def rec(mask):
        if mask in memo:return memo[mask]
        bit=mask&-mask;u=bit.bit_length()-1
        a=rec(mask^bit);b=rec(mask&~(bit|adj[u]))
        out=[0]*max(len(a),len(b)+1)
        for j,v in enumerate(a):out[j]+=v
        for j,v in enumerate(b):out[j+1]+=v
        memo[mask]=tuple(out)
        return memo[mask]
    return list(rec((1<<n)-1))


def recover_tree(n,p,R):
    found=[]
    def take(q,code):
        if q==p:
            found.append(code)
            return True
        return False
    visit_trees(n,R,take,target=p)
    assert len(found)==1 and found[0]
    return found[0]


def recover_small(n,p,items):
    path=[];found=[]
    first_fit=[next((i for i,item in enumerate(items) if item[0]<=r),len(items))
               for r in range(n+1)]
    def dfs(start,used,q):
        if used==n:
            if q==p:
                found.extend(path)
                return True
            return False
        for i in range(max(start,first_fit[n-used]),len(items)):
            s,r,code=items[i]
            path.append(code)
            if dfs(i,used+s,(q*r)&MASK):return True
            path.pop()
        return False
    assert dfs(0,0,ONE)
    return found


def recover_recipe(recipe,R,items):
    if recipe[0]=='small':
        return recover_small(recipe[1],recipe[2],items)
    _,n,p,rest,q=recipe
    return [recover_tree(n,p,R)]+recover_small(rest,q,items)


def census(maxn):
    assert 0 <= maxn <= 24
    # Every intermediate product is an independence polynomial of a forest
    # on at most 24 vertices; each coefficient is at most 2^24 < 2^32.
    assert (1 << maxn) < BASE
    t0=time.monotonic()
    cap=max(1,maxn//2)
    R=rooted(cap)
    smallcap=cap
    smallitems=[]
    tree_counts={}
    tree_polys={}
    for n in range(1,smallcap+1):
        counter=Counter(); entries=[]
        def add(p,code):
            counter[p]+=1;entries.append((n,p,code));return False
        visit_trees(n,R,add,codes_all=True)
        tree_polys[n]=counter
        tree_counts[n]=sum(counter.values())
        assert tree_counts[n]==TREE_COUNTS[n],(n,tree_counts[n])
        smallitems.extend(entries)
    smallitems.sort(key=lambda e:-e[0])
    small_first_fit=[next((i for i,item in enumerate(smallitems) if item[0]<=r),
                          len(smallitems)) for r in range(maxn+1)]
    small=[Counter() for _ in range(min(maxn,smallcap-1)+1)]
    by_order=defaultdict(lambda: {'classes':0,'x':Counter(),'delta_neg':Counter(),
                                  'closure':Counter(),'closure_fail':0})
    delta_best={}
    worst_by_x={}
    def consider(n,p,mult,recipe):
        c=coeffs(p)
        assert c[0]==1 and c[1]==n
        row=by_order[n];row['classes']+=mult
        x=forest_x(c)
        row['x'][str(x) if x is not None else '>6']+=mult
        for j in range(7):
            if c[j+1]<c[j]:
                row['delta_neg'][str(j)]+=mult
                prev=delta_best.get(j)
                if prev is None or n>prev[0] or (n==prev[0] and p<prev[1]):
                    delta_best[j]=(n,p,recipe)
        if x is not None:
            xp=plus_x(c)
            margin=(xp-x) if xp is not None else None
            row['closure'][f'{x}->{xp if xp is not None else ">7"}']+=mult
            if xp is None or xp>x+1:row['closure_fail']+=mult
            prev=worst_by_x.get(x)
            rank=(xp if xp is not None else 99)-x
            if prev is None or rank>prev[0] or (rank==prev[0] and
                    (n>prev[1] or (n==prev[1] and p<prev[2]))):
                worst_by_x[x]=(rank,n,p,recipe)
    def small_dfs(start,used,p):
        if used<=maxn:
            consider(used,p,1,('small',used,p))
            if used<len(small):small[used][p]+=1
        for i in range(max(start,small_first_fit[maxn-used]),len(smallitems)):
            s,q,_=smallitems[i]
            small_dfs(i,used+s,(p*q)&MASK)
    small_dfs(0,0,ONE)
    for n in range(smallcap+1,maxn+1):
        counter=Counter();visited=[0]
        def flush():
            for order in range(n,maxn+1):
                rest=small[order-n]
                for p,a in counter.items():
                    for q,b in rest.items():
                        consider(order,(p*q)&MASK,a*b,('large',n,p,order-n,q))
            counter.clear()
        def collect(p,unused):
            counter[p]+=1;visited[0]+=1
            if len(counter)>=250000:flush()
            return False
        visit_trees(n,R,collect)
        flush()
        tree_counts[n]=visited[0]
        assert tree_counts[n]==TREE_COUNTS[n],(n,tree_counts[n])
    def flatten(z):
        return {str(n):{'classes':v['classes'],'x':dict(sorted(v['x'].items())),
                        'delta_neg':dict(sorted(v['delta_neg'].items())),
                        'closure':dict(sorted(v['closure'].items())),
                        'closure_fail':v['closure_fail']}
                for n,v in sorted(z.items())}
    rows=flatten(by_order)
    for n in range(maxn+1):
        assert rows[str(n)]['classes']==FOREST_COUNTS[n],n
    # Euler transform: coefficient of product (1-z^s)^(-t_s).
    euler=[0]*(maxn+1);euler[0]=1
    for s in range(1,maxn+1):
        t=tree_counts[s]
        nxt=euler[:]
        for n in range(maxn+1):
            if euler[n]==0:continue
            for k in range(1,(maxn-n)//s+1):
                nxt[n+k*s]+=euler[n]*math.comb(t+k-1,k)
        euler=nxt
    assert all(rows[str(n)]['classes']==euler[n] for n in range(maxn+1))
    M={str(j):max((n for n in range(maxn+1)
                      if rows[str(n)]['delta_neg'].get(str(j),0)),default=None)
       for j in range(7)}
    if maxn>=20:assert {k:M[k] for k in map(str,range(6))}=={
        '0':0,'1':4,'2':8,'3':11,'4':15,'5':18}
    def witness(n,p,recipe):
        codes=recover_recipe(recipe,R,smallitems)
        full=independent_poly_from_code(codes)
        assert (full[:DIGITS]+[0]*max(0,DIGITS-len(full)))==coeffs(p),(n,codes)
        assert sum(c.count('(') for c in codes)==n
        return {'order':n,'components':codes,'coefficients_0_8':coeffs(p),
                'recipe':recipe}
    delta_witnesses={str(j):witness(n,p,recipe)
                     for j,(n,p,recipe) in sorted(delta_best.items())}
    worst_witnesses={str(x):dict(witness(n,p,recipe),margin=rank)
                     for x,(rank,n,p,recipe) in sorted(worst_by_x.items())}
    report={'schema':'forest24-census-v1','max_order':maxn,'rooted_tree_class_counts':
            {str(n):len(R[n]) for n in R},'free_tree_class_counts':
            {str(n):tree_counts[n] for n in sorted(tree_counts)},
            'forest_class_counts_euler':{str(n):euler[n] for n in range(maxn+1)},
            'rows':rows,'M_over_range':M,'delta_extremal_witnesses':delta_witnesses,
            'worst_closure_witnesses_by_x':worst_witnesses,
            'total_closure_failures':sum(r['closure_fail'] for r in rows.values()),
            'total_forest_classes':sum(r['classes'] for r in rows.values())}
    runtime=time.monotonic()-t0
    return report,{'elapsed_seconds':round(runtime,3),'max_order':maxn}


def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--max-order',type=int,required=True)
    ap.add_argument('--out',type=Path,required=True)
    args=ap.parse_args()
    report,receipt=census(args.max_order)
    data=(json.dumps(report,sort_keys=True,separators=(',',':'))+'\n').encode()
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_bytes(data)
    receipt['report_sha256']=hashlib.sha256(data).hexdigest()
    receipt['source_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    args.out.with_suffix('.execution.json').write_text(
        json.dumps(receipt,sort_keys=True,indent=2)+'\n')
    print(json.dumps(receipt,sort_keys=True))

if __name__=='__main__':main()
