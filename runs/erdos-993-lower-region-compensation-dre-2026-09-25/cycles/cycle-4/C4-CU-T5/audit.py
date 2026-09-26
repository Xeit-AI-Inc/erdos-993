#!/usr/bin/env python3
"""Independent exact audit of the C4-T5 two-orbit family replay."""
import json
from pathlib import Path


def add(a, b):
    n=max(len(a),len(b)); c=[0]*n
    for j,x in enumerate(a): c[j]+=x
    for j,x in enumerate(b): c[j]+=x
    return trim(c)

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return trim(c)

def trim(a):
    while len(a)>1 and a[-1]==0: a.pop()
    return a

def power(a,n):
    r=[1]
    for _ in range(n): r=mul(r,a)
    return r

def delta(a,j):
    return (a[j+1] if j+1<len(a) else 0)-(a[j] if j<len(a) else 0)

def poly_T(m):
    # Component product / root split derived from the stated edge recipe.
    L=[1,1]; B=[1,4,3,1]
    no_root=mul([1,2],power(B,m))
    root_in=mul([0,1],power(L,3*m+1))
    return add(no_root,root_in)

def poly_arm_deleted(m):
    L=[1,1]; B=[1,4,3,1]
    return add(mul([1,1],power(B,m)),mul([0,1],power(L,3*m)))

def poly_claw_deleted(m):
    L=[1,1]; B=[1,4,3,1]
    local=[1,3,1] # center with two remaining leaves
    r_excl=mul(mul([1,2],local),power(B,m-1))
    r_incl=mul([0,1],power(L,3*m))
    return add(r_excl,r_incl)

def q_arm(m):
    return [0]+power([1,1],3*m)

def q_claw(m):
    B=[1,4,3,1]
    local=[0,2,5,2] # z(2+z)(1+2z)
    return add(mul(local,power(B,m-1)),q_arm(m))

def explicit_subset_poly(n, edges, deleted=()):
    # Literal subsets on the actual labeled graph, used only for m<=3.
    gone=set(deleted); active=[v for v in range(n) if v not in gone]
    e=[(u,v) for u,v in edges if u not in gone and v not in gone]
    out=[0]*(len(active)+1)
    for mask in range(1<<len(active)):
        chosen=[active[i] for i in range(len(active)) if mask>>i&1]
        s=set(chosen)
        if all(not (u in s and v in s) for u,v in e): out[len(chosen)]+=1
    return trim(out)

def graph(m):
    # vertices: a=0,b=1,r=2, then each star center followed by 3 leaves
    edges=[(0,1),(1,2)]
    centers=[]; leaves=[]
    for j in range(m):
        c=3+4*j; ls=[c+1,c+2,c+3]
        centers.append(c); leaves.extend(ls); edges.append((2,c)); edges.extend((c,x) for x in ls)
    return 4*m+3, edges, centers, leaves

def independently_eval_all():
    src=json.loads(Path('source-replay-evidence.json').read_text())
    assert src['m_count']==80 and src['eligible_row_count']==1749
    assert src['positive_full_s_count']==0
    assert src['generation_boundary'].startswith('all m=1,...,80')
    rows=[]; eligible=0; positive=0; flags=set(); mismatches=[]; selector_mismatches=0; sum_mismatches=0; all_exact_rows=[]; max_m_direct=3
    for m in range(1,81):
        P=poly_T(m); a=len(P)-1
        x=next(j for j in range(a+1) if delta(P,j)<0)
        da=poly_arm_deleted(m); dc=poly_claw_deleted(m)
        qa=q_arm(m); qc=q_claw(m)
        own=[]
        for p in range(x+2,a+1):
            if 3*p>=2*a+1: continue
            eligible+=1
            fa=delta(da,p)<0; fc=delta(dc,p)<0; k=p-1
            ta=delta(qa,k); tc=delta(qc,k); S=(ta if fa else 0)+3*m*(tc if fc else 0)
            flags.add((fa,fc)); positive += S>0
            own.append((p,fa,fc,delta(da,p),delta(dc,p),ta,tc,S))
            all_exact_rows.append({'m':m,'p':p,'x':x,'alpha':a,'arm_favorable':fa,'claw_favorable':fc,'arm_deletion_delta':delta(da,p),'claw_deletion_delta':delta(dc,p),'k':k,'arm_term':ta,'single_claw_term':tc,'complete_selected_sum':S})
        srcrow=src['rows'][m-1]
        assert srcrow['m']==m and srcrow['alpha']==a and srcrow['x']==x
        # Compare each exact rank record field, rather than trusting its aggregate.
        source_rows=srcrow['eligible_rows']
        assert len(source_rows)==len(own)
        for got,want in zip(source_rows,own):
            p,fa,fc,ad,cd,ta,tc,S=want
            selector_mismatches += (got['arm_favorable'],got['claw_favorable']) != (fa,fc)
            sum_mismatches += got['S'] != S
            
            if (got['p'],got['arm_favorable'],got['claw_favorable'],got['arm_delta'],got['claw_delta'],got['term_arm'],got['term_claw'],got['S'])!=(p,fa,fc,ad,cd,ta,tc,S): mismatches.append({'m':m,'p':p,'source_claw_delta':got['claw_delta'],'correct_claw_delta':cd,'source_claw_favorable':got['claw_favorable'],'correct_claw_favorable':fc,'source_S':got['S'],'correct_S':S})
        rows.append({'m':m,'order':4*m+3,'alpha':a,'x':x,'eligible_ranks':len(own),'all_s_negative':all(z[-1]<0 for z in own)})
    # Literal subset cross-checks reconstruct all original leaves and their tags.
    subset_checks=[]
    for m in range(1,max_m_direct+1):
        n,edges,centers,leaves=graph(m)
        P=explicit_subset_poly(n,edges)
        assert P==poly_T(m)
        # arm leaf is vertex a=0, support b=1; claw leaf 1st star has support center
        checks=[('arm',0,[1]),('claw',leaves[0],[centers[0]])]
        for kind,v,sups in checks:
            assert len(sups)==1
            assert explicit_subset_poly(n,edges,[v])==(poly_arm_deleted(m) if kind=='arm' else poly_claw_deleted(m))
            H=explicit_subset_poly(n,edges,[v,sups[0]])
            # closed neighborhood of support in original tree, including v
            neigh={sups[0]}
            for u,w in edges:
                if u==sups[0]: neigh.add(w)
                if w==sups[0]: neigh.add(u)
            R=explicit_subset_poly(n,edges,[u for u in neigh if u!=v] + [v])
            q=add(H,[-x for x in R])
            trim(q)
            assert q==(q_arm(m) if kind=='arm' else q_claw(m))
        # Verify full original degree-one vertex population and two orbit sizes.
        deg=[0]*n
        for u,v in edges: deg[u]+=1; deg[v]+=1
        assert [v for v,d in enumerate(deg) if d==1]==[0]+leaves
        assert len(leaves)==3*m and all(deg[c]==4 for c in centers)
        subset_checks.append({'m':m,'order':n,'literal_full_and_deletions_and_marked_differences':'passed','original_leaves':1+3*m,'arm_orbit_size':1,'claw_orbit_size':3*m})
    assert eligible==1749 and positive==0 and flags=={(True,True)}
    result={
      'audit_method':'Separate component/root split polynomial construction and literal independent-subset enumeration on m=1..3 graphs.',
      'source_replay_copy':'source-replay.py',
      'generation_boundary':'m=1..80; every eligible p checked using terminal zero-extended first descent and strict inequalities.',
      'verified_rows':eligible,'selector_patterns':[{'arm':a,'claw':c} for a,c in sorted(flags)],'nonnegative_full_sums':positive,
      'source_replay_claw_difference_mismatches':len(mismatches),'source_replay_selector_mismatches':selector_mismatches,'source_replay_full_sum_mismatches':sum_mismatches,'source_replay_first_mismatches':mismatches[:8],
      'corrected_formula_all_eligible_sums_negative':positive==0,
      'literal_graph_cross_checks':subset_checks,'eligible_rows':all_exact_rows,
      'sample_m3':next(r for r in rows if r['m']==3),
      'limitations':['The all-m derivative identity is algebraically correct but gives no uniform coefficient sign bound here.','Finite checks do not prove the selectors or sign for m>80 or outside this family.']
    }
    Path('audit-evidence.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))

if __name__=='__main__': independently_eval_all()
