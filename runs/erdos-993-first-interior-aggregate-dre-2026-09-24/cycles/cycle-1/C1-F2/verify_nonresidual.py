#!/usr/bin/env python3
"""Independent subset-enumeration verification for the n=10 exact row."""
import json
from pathlib import Path
BASE=Path(__file__).resolve().parent
r=json.loads((BASE/'nonresidual-example.json').read_text())
V=set(range(r['n'])); E=[tuple(e) for e in r['edges']]
N={v:set() for v in V}
for u,v in E:N[u].add(v);N[v].add(u)
def poly(keep):
  keep=sorted(keep); out=[0]*(len(keep)+1)
  for mask in range(1<<len(keep)):
    chosen={keep[i] for i in range(len(keep)) if mask>>i&1}
    if all(not(N[v]&chosen) for v in chosen):out[len(chosen)]+=1
  while len(out)>1 and out[-1]==0:out.pop()
  return out
def c(P,k):return P[k] if 0<=k<len(P) else 0
def d(P,k):return c(P,k+1)-c(P,k)
P=poly(V); alpha=len(P)-1; p=alpha-2
x=next(k for k in range(len(P)+1) if d(P,k)<0)
sel=[]; terms=[]
for v in sorted(v for v in V if len(N[v])==1):
  pv=poly(V-{v})
  if d(pv,p)<0:
    s=next(iter(N[v])); H=poly(V-{v,s}); R=poly(V-({s}|N[s]))
    a=d(H,p-1); b=d(R,p-1)
    terms.append({'leaf':v,'support':s,'Delta_p_T_minus_v':d(pv,p),'Delta_p_minus_1_H':a,'Delta_p_minus_1_R':b,'g':a-b})
    sel.append(v)
max_sets=[]
for mask in range(1<<len(V)):
  chosen={v for v in V if mask>>v&1}
  if len(chosen)==alpha and all(not(N[v]&chosen) for v in chosen):max_sets.append(sorted(chosen))
out={'vertices':sorted(V),'edges':[list(e) for e in E],'poly':P,'alpha':alpha,'x':x,'p':p,'eligibility_x_plus_2_le_p':x+2<=p,'leaves':sorted(v for v in V if len(N[v])==1),'selector':sel,'terms':terms,'S':sum(t['g'] for t in terms),'maximum_independent_sets':max_sets,'leaf_9_omitted_by_maximum_set':any(9 not in s for s in max_sets)}
(BASE/'nonresidual-verification.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:out[k] for k in ('poly','alpha','x','p','eligibility_x_plus_2_le_p','leaves','selector','terms','S','maximum_independent_sets','leaf_9_omitted_by_maximum_set')},indent=2))
assert alpha==r['alpha'] and x==r['x'] and p==r['p'] and sel==r['selector'] and out['S']==r['S']
