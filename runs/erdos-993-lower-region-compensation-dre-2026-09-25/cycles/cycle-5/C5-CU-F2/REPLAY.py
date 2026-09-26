#!/usr/bin/env python3
"""Exact finite audit of hub-attached heterogeneous star trees, arities 2..4."""
from functools import lru_cache
from itertools import combinations_with_replacement
import json

# Graphs are bit-mask induced subgraphs. Exact independent-set polynomial recurrence.
def make_tree(profile):
    # vertices 0-1-2, and for each listed r, a center adjacent to 0 and r tips
    adj=[]
    def vertex():
        adj.append(0); return len(adj)-1
    def edge(u,v):
        adj[u] |= 1<<v; adj[v] |= 1<<u
    vertex(); vertex(); vertex(); edge(0,1); edge(1,2)
    tips=[]
    for r in profile:
        c=vertex(); edge(0,c)
        grp=[]
        for _ in range(r):
            t=vertex(); edge(c,t); grp.append(t)
        tips += grp
    return adj, [2]+tips

def poly_for(adj):
    full=(1<<len(adj))-1
    @lru_cache(None)
    def P(mask):
        if not mask: return (1,)
        # branching on maximum induced degree
        vs=[v for v in range(len(adj)) if (mask>>v)&1]
        v=max(vs,key=lambda w:(adj[w]&mask).bit_count())
        rem=mask & ~(1<<v)
        p0=P(rem)
        p1=P(rem & ~adj[v])
        out=[0]*(max(len(p0),len(p1)+1))
        for i,x in enumerate(p0): out[i]+=x
        for i,x in enumerate(p1): out[i+1]+=x
        while len(out)>1 and out[-1]==0: out.pop()
        return tuple(out)
    return P,full

def delta(poly,j):
    def coeff(k): return poly[k] if 0<=k<len(poly) else 0
    return coeff(j+1)-coeff(j)

def first_descent(poly):
    # integer zero extension; first negative difference through alpha
    alpha=len(poly)-1
    for j in range(alpha+1):
        if delta(poly,j)<0: return j
    return None

allrows=[]
for m in range(1,6):
  for prof in combinations_with_replacement((2,3,4),m):
    adj,leaves=make_tree(prof); P,full=poly_for(adj); f=P(full)
    a=len(f)-1; x=first_descent(f)
    # full exact selector data for every admissible rank
    leaf_polys={v:P(full & ~(1<<v)) for v in leaves}
    ranks=[]
    if x is not None:
      for p in range(x+2,a+1):
        if 3*p >= 2*a+1: continue
        favorable=[v for v in leaves if delta(leaf_polys[v],p)<0]
        summands=[]
        for v in favorable:
          s=(adj[v]&-adj[v]).bit_length()-1  # overwritten: support of leaf
          # its unique neighbor is its original support
          s=(adj[v]).bit_length()-1
          H=full & ~(1<<v) & ~(1<<s)
          Nclosed=(1<<s)|adj[s]
          R=full & ~Nclosed
          hpoly=P(H); rpoly=P(R)
          term=delta(hpoly,p-1)-delta(rpoly,p-1)
          summands.append({'leaf':v,'support':s,'delta_p_T_minus_leaf':delta(leaf_polys[v],p),
                           'delta_H_p_minus_1':delta(hpoly,p-1),'delta_R_p_minus_1':delta(rpoly,p-1),'term':term})
        S=sum(z['term'] for z in summands)
        ranks.append({'p':p,'F':favorable,'summands':summands,'S':S,
                      'proper_selector':bool(favorable) and len(favorable)<len(leaves)})
    allrows.append({'profile':list(prof),'n':len(adj),'alpha':a,'x':x,'i':list(f),'eligible_rows':ranks})

proper=[(r,q) for r in allrows for q in r['eligible_rows'] if q['proper_selector']]
pos=[(r,q) for r in allrows for q in r['eligible_rows'] if q['S']>0]
# Standalone coefficient-factor audit: all B_r=(1+z)^r+z and A_r=(1+z)^r.
# Report whether the heterogeneous products/sums have LC coefficient sequences.
def add(a,b):
 o=[0]*max(len(a),len(b))
 for i,x in enumerate(a):o[i]+=x
 for i,x in enumerate(b):o[i]+=x
 return o
def mul(a,b):
 o=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):o[i+j]+=x*y
 return o
def lc_fail(c): return [(i,c[i]**2-c[i-1]*c[i+1]) for i in range(1,len(c)-1) if c[i]**2<c[i-1]*c[i+1]]
factor_rows=[]
formula_checks=0
for m in range(1,6):
 for prof in combinations_with_replacement((2,3,4),m):
  A=[1]; B=[1]
  for r in prof:
   Ar=[__import__('math').comb(r,j) for j in range(r+1)]
   Br=add(Ar,[0,1])
   A=mul(A,Ar); B=mul(B,Br)
  # Exact independence polynomial of this tree family, via decomposition at 0.
  # P = z(1+z) prod A_r + (1+2z) prod B_r.
  tree=add([0,1,1], [1,2]) # not used; construct shifts explicitly
  term1=[0]+mul([1,1],A)
  term2=mul([1,2],B)
  Pcoef=add(term1,term2)
  adj,_leaves=make_tree(prof); P,full=poly_for(adj)
  assert tuple(P(full)) == tuple(Pcoef), (prof, P(full), Pcoef)
  formula_checks += 1
  failures=lc_fail(Pcoef)
  if failures:
   factor_rows.append({'profile':list(prof),'P':Pcoef,'first_lc_failure':failures[0]})
   break
 if factor_rows: break

out={'graph_recipe':'Path 0-1-2; m star centers adjacent to 0, each center has r_i pendant leaves; profile is nondecreasing tuple, 1<=m<=5, r_i in {2,3,4}.',
     'generation_boundary':{'profiles':'all multisets of arities 2,3,4 of lengths 1 through 5','profile_count':len(allrows),'exact_ranks':'all integer p with x+2<=p<=alpha and 3p<2alpha+1'},
     'rows':allrows,
     'summary':{'proper_selector_witness_count':len(proper),'positive_full_S_witness_count':len(pos),
       'first_proper_selector':({'profile':proper[0][0]['profile'],'n':proper[0][0]['n'],'alpha':proper[0][0]['alpha'],'x':proper[0][0]['x'],'i':proper[0][0]['i'],'row':proper[0][1]} if proper else None),
       'first_positive_full_S':({'profile':pos[0][0]['profile'],'n':pos[0][0]['n'],'alpha':pos[0][0]['alpha'],'x':pos[0][0]['x'],'i':pos[0][0]['i'],'row':pos[0][1]} if pos else None)},
     'heterogeneous_factor_lc_audit':{'method':'Exact convolution of A_r=(1+z)^r and B_r=(1+z)^r+z, then P=z(1+z)prod(A_r)+(1+2z)prod(B_r). Search same finite profile boundary for a strict coefficient LC failure in P.', 'recurrence_crosschecks':formula_checks,'first_failure':factor_rows[0] if factor_rows else None,'result':'No failure on this bounded profile set.' if not factor_rows else 'Finite counterexample to LC of the whole-tree independence polynomial; this alone is not a counterexample to S.'}}
print(json.dumps(out,indent=2,sort_keys=True))
