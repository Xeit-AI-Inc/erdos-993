import json
from functools import lru_cache
from pathlib import Path

D=json.loads(Path('EVIDENCE.json').read_text())

def poly(adj, mask):
    @lru_cache(None)
    def P(m):
        if not m: return (1,)
        bit=m&-m; v=bit.bit_length()-1
        without=P(m^bit)
        with_v=P((m^bit) & ~adj[v])
        out=[0]*max(len(without),len(with_v)+1)
        for j,x in enumerate(without): out[j]+=x
        for j,x in enumerate(with_v): out[j+1]+=x
        while len(out)>1 and out[-1]==0: out.pop()
        return tuple(out)
    return list(P(mask))

def padded(poly,n): return poly+[0]*(n+2-len(poly))
def ds(c): return [c[j+1]-c[j] for j in range(len(c)-1)]
def firstneg(v): return next(j for j,x in enumerate(v) if x<0)

checked=0
for n,summary in D['summary'].items():
  n=int(n)
  for row in summary['eligible_rows_data']:
    edges=[tuple(e) for e in row['edges']]
    adj=[0]*n; parent=list(range(n)); degree=[0]*n
    def find(x):
      while parent[x]!=x: parent[x]=parent[parent[x]]; x=parent[x]
      return x
    acyclic=True
    for u,v in edges:
      degree[u]+=1; degree[v]+=1; adj[u]|=1<<v; adj[v]|=1<<u
      ru,rv=find(u),find(v)
      if ru==rv: acyclic=False
      else: parent[ru]=rv
    assert len(edges)==n-1 and acyclic and len({find(v) for v in range(n)})==1
    leaves=[v for v,d in enumerate(degree) if d==1]
    assert leaves==row['leaves']
    allmask=(1<<n)-1
    iv=padded(poly(adj,allmask),n)
    assert iv==row['i'], (n, row['p'], 'T polynomial')
    delta=ds(iv); x=firstneg(delta)
    assert x==row['x'] and delta==row['Delta']
    a=max(j for j,val in enumerate(iv) if val)
    p=row['p']; assert p>=x+2 and 3*p<2*a+1 and a==row['alpha']
    F=[]; tests=[]; terms=[]; Q=U=E=C=0
    for v in leaves:
      Tv=allmask^(1<<v); itv=padded(poly(adj,Tv),n)
      dsel=ds(itv)[p]
      tests.append({'leaf':v,'delta':dsel,'selected':dsel<0})
      if dsel>=0: continue
      F.append(v); s=next(w for w in range(n) if adj[v]>>w&1)
      Hmask=allmask^((1<<v)|(1<<s)); Rmask=Hmask & ~adj[s]
      ih=padded(poly(adj,Hmask),n); ir=padded(poly(adj,Rmask),n)
      k=p-1
      term=(ih[k+1]-ih[k])-(ir[k+1]-ir[k])
      terms.append((v,s,term))
      q=ih[k]-ir[k]; uval=ih[k+1]-ir[k+1]
      Q+=q; U+=uval
      # Literal subsets independently compute actual addability and multiply-marked upper sets.
      W=adj[s] & ~(1<<v); E_v=0; C_v=0
      for m in range(1<<n):
        if m&~Hmask or m.bit_count()!=k: continue
        if any((m>>z)&1 and (adj[z]&m) for z in range(n)): continue
        if not (m&W): continue
        add=0; candidates=Hmask & ~m
        while candidates:
          b=candidates&-candidates; candidates-=b; z=b.bit_length()-1
          if not (adj[z]&m): add+=1
        E_v+=add
      for m in range(1<<n):
        if m&~Hmask or m.bit_count()!=k+1: continue
        if any((m>>z)&1 and (adj[z]&m) for z in range(n)): continue
        if (m&W).bit_count()>=2: C_v+=1
      E+=E_v; C+=C_v
    S=sum(t for _,_,t in terms)
    assert F==row['F'] and tests==[{'leaf':q['leaf'],'delta':q['Delta_p_T_minus_v'],'selected':q['selected']} for q in row['leaf_selector_tests']]
    assert terms==[(z['leaf'],z['support'],z['S_term']) for z in row['summands']]
    assert S==row['S'] and S<0
    if (Q,U,E,C)!=(row['Q'],row['U'],row['E'],row['C']): print('MISMATCH',n,p,(Q,U,E,C),(row['Q'],row['U'],row['E'],row['C'])); raise AssertionError
    assert E==(p-1)*U+C
    assert E<=(x+1)*Q
    checked+=1
assert checked==37 and D['eligible_rows_total']==37 and D['proper_selector_rows_total']==0
print(json.dumps({'independent_forest_recurrence_rows_checked':checked,'tree_tests':'n-1 edges, connected, acyclic','all_row_polynomials_leaf_selectors_summands_and_auxiliary_counts_match':True,'all_S_negative':True,'all_E_le_(x+1)Q':True,'proper_selector_rows':0},indent=2))
