import sys, json, itertools, hashlib, random
from collections import Counter
B='/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25'
sys.path.insert(0,B+'/inputs')
import ordinary_tree_checked as otc

def counts_for(tree, k, fav):
    Q=E=C=U=0
    per=[]
    for v in fav:
        s=tree.support(v); H=tree.remove({v,s}); W=frozenset(tree.adjacency[s]-{v})
        marked=[A for A in H.independent_sets(k) if A&W]
        upper=[A for A in H.independent_sets(k+1) if A&W]
        q=len(marked); u=len(upper); c=sum(len(A&W)>=2 for A in upper)
        e=0
        for A in marked:
            e += sum(not (H.adjacency[z]&A) for z in H.vertices-A)
        Q+=q; U+=u; C+=c; E+=e
        per.append({'leaf':v,'support':s,'W':sorted(W),'q':q,'u':u,'c':c,'e':e})
    return Q,E,C,U,per

def adjlist(tree):
    return [[v,w] for v in sorted(tree.vertices) for w in sorted(tree.adjacency[v]) if v<w]

records=[]; eligible=0; proper=0; proper_pairs=0; nonempty_pairs=0; empty_pairs=0; degree_profiles=Counter(); rung_violations=Counter(); maxflat=None; maxcur=None; minS=None; witnesses=[]
work=[]
for n in range(2,8):
  work.extend((n,idx,seq,tree) for _,idx,tree in otc.all_labeled_trees(n,n) for seq in [()])
rng=random.Random(9930425)
for n in range(8,17):
  for idx in range(400):
    seq=tuple(rng.randrange(n) for _ in range(n-2)); work.append((n,idx,seq,otc.prufer_tree(seq)))
  # Degree-profile targeted brooms: path spine with bundled leaf groups.
  for spine in range(2,n):
    excess=n-spine
    if excess<1: continue
    edges=[(i,i+1) for i in range(spine-1)]
    for j in range(excess): edges.append((spine-1,spine+j))
    work.append((n,10000+spine,(),otc.Graph.from_edges(range(n),edges)))
# Adversarial arm grafts: paths with one/two pendant leaves moved across spine vertices.
for n in range(8,17):
  for split in range(1,n-3):
    edges=[(i,i+1) for i in range(n-4)]
    edges += [(split,n-3),(split,n-2),(n-3,n-1)]
    work.append((n,20000+split,(),otc.Graph.from_edges(range(n),edges)))
# Rooted spiders with all integer partitions of n-1 as arm lengths; an exact degree-profile/graft family.
def parts(total, maximum=None):
  if maximum is None: maximum=total
  if total==0: yield (); return
  for first in range(min(total,maximum),1-1,-1):
    for rest in parts(total-first,first): yield (first,)+rest
for n in range(8,21):
  for pi,arms in enumerate(parts(n-1)):
    edges=[]; cur=1
    for length in arms:
      prev=0
      for _ in range(length):
        edges.append((prev,cur)); prev=cur; cur+=1
    work.append((n,30000+pi,arms,otc.Graph.from_edges(range(n),edges)))
for n,idx,seq,tree in work:
    poly=tree.forest_independence_polynomial(); a=len(poly)-1; x=otc.first_strict_descent(poly)
    if x is None: continue
    for p in range(x+2, (2*a)//3+1): # 3p < 2a+1 iff p <= floor(2a/3)
      if not (3*p < 2*a+1): continue
      eligible+=1; F=otc.favorable_leaves(tree,p)
      if not F: empty_pairs+=1; continue
      nonempty_pairs+=1
      if len(F)<len(tree.leaves()): proper_pairs+=1
      proper += len(F)<len(tree.leaves())
      profile=tuple(sorted(Counter(len(tree.adjacency[v]) for v in tree.vertices).items()))
      degree_profiles[str(profile)]+=1
      k=p-1; Q,E,C,U,per=counts_for(tree,k,F); S=otc.aggregate_row(tree,p)['aggregate']
      gaps={'flat':(x+1)*Q-E,'current':k*Q-E,'target':k*Q-(E-C)}
      row={'n':n,'prufer_index':idx,'prufer':list(seq),'edges':adjlist(tree),'degrees':[len(tree.adjacency[v]) for v in sorted(tree.vertices)],'alpha':a,'x':x,'p':p,'k':k,'leaves':tree.leaves(),'F':F,'Q':Q,'E':E,'C':C,'U':U,'S':S,'gaps':gaps,'per_tag':per}
      for rung,gap in gaps.items():
        if gap<0:
          rung_violations[rung]+=1
          if rung=='flat' and (maxflat is None or -gap>maxflat[0]): maxflat=(-gap,row)
          if rung=='current' and (maxcur is None or -gap>maxcur[0]): maxcur=(-gap,row)
      if minS is None or S<minS[0]: minS=(S,row)
      if any(g<0 for g in gaps.values()): witnesses.append(row)
print(json.dumps({'generation':'all labeled Prüfer trees n=2..7; 400 seeded Prüfer trees per n=8..16 (seed 9930425); brooms and arm-graft profiles n=8..16; all spider arm-length partitions for orders 8..20','trees':len(work),'eligible_tree_rank_pairs':eligible,'with_nonempty_F':nonempty_pairs,'empty_F':empty_pairs,'proper_selector_pairs':proper_pairs,'proper_selector_pairs':proper,'rung_violation_counts':rung_violations,'largest_flat_failure':maxflat[1] if maxflat else None,'largest_current_failure':maxcur[1] if maxcur else None,'minimum_S':minS[1] if minS else None,'any_budget_counterexamples':witnesses[:10], 'eligible_degree_profile_counts':degree_profiles},sort_keys=True,indent=2))
