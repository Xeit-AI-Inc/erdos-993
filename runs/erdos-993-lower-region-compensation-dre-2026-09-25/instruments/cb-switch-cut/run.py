"""Bounded literal CB(8,92) replay and one conservative switch-cut test."""
from pathlib import Path
import json,sys,hashlib
from math import comb
B=Path(__file__).resolve().parents[2];sys.path.insert(0,str(B/'inputs'));import ordinary_tree_checked as O
A,M=O.add_poly,O.mul_poly

def pw(a,m):
 out=[1]
 for _ in range(m):out=M(out,a)
 return out

def scale(a,s):return [s*x for x in a]
def sub(a,b):return O.trim([O.coefficient(a,j)-O.coefficient(b,j) for j in range(max(len(a),len(b)))])
def cb(d,m):
 edges=[(0,1),(1,2)];n=3
 for _ in range(m):
  c=n;n+=1;edges.append((0,c))
  for __ in range(d):edges.extend([(c,n),(n,n+1)]);n+=2
 return O.Graph.from_edges(range(n),edges),edges

def calculate(d,m,p):
 T,edges=cb(d,m);D=[comb(d,j)*2**j for j in range(d+1)];L=[comb(d,j) for j in range(d+1)];branch=A(D,[0]+L)
 bm,bprev=pw(branch,m),pw(branch,m-1);Dm=pw(D,m)
 P=A(M([1,2],bm),M([0,1,1],Dm));assert P==T.forest_independence_polynomial()
 armH=A(bm,[0]+Dm);armR=bm
 otherRoot=A(M([1,2],bprev),M([0,1,1],pw(D,m-1)))
 leafR=M(pw([1,2],d-1),otherRoot)
 leafQ=M([0,1,2],M(pw([1,1],d-1),bprev));leafH=A(leafR,leafQ)
 rows=[]
 for v,H,R,multiplicity in [(2,armH,armR,1),(5,leafH,leafR,d*m)]:
  s=T.support(v)
  assert H==T.remove([v,s]).forest_independence_polynomial()
  assert R==T.remove(T.closed_neighborhood([s])).forest_independence_polynomial()
  deleted=A(H,[0]+R);assert deleted==T.remove([v]).forest_independence_polynomial()
  rows.append({'leaf':v,'support':s,'multiplicity':multiplicity,'H':H,'R':R,'deleted_leaf':deleted,'selector_difference':O.delta(deleted,p),'g':O.delta(H,p-1)-O.delta(R,p-1)})
 x=O.first_strict_descent(P);a=len(P)-1
 S=sum(r['multiplicity']*r['g'] for r in rows if r['selector_difference']<0)
 # Root+arm leaf upper cut, with zero branches having exactly one occupied support.
 # Any positive-weight neighbor from this cut still contains root+arm leaf.
 # Its other states have no one-support branch, or exactly one such branch.
 oneSupport=scale(M([0,1],pw([1,1],d-1)),d)
 noOne=sub(D,oneSupport);power=pw(noOne,m)
 envelope=A(power,scale(M(oneSupport,pw(noOne,m-1)),m))
 supply=O.coefficient(power,p-1);neighbor_upper_bound=O.coefficient(envelope,p-2)
 return {'d':d,'m':m,'p':p,'order':len(T.vertices),'edges':edges,'P':P,'alpha':a,'x':x,'eligible':x+2<=p and 3*p<2*a+1,'orbits':rows,'aggregate':S,'favorable_count':sum(r['multiplicity'] for r in rows if r['selector_difference']<0),'test_cut':{'definition':'h,v present; no choke selected; every branch has support count unequal to one','upper_weight':supply,'neighbor_weight_upper_bound':neighbor_upper_bound,'lower_bound_on_deficit':supply-neighbor_upper_bound,'certificate_of_failure':supply>neighbor_upper_bound,'note':'Nonpositive lower bound on deficit is inconclusive; this is a superset capacity, not an exact neighbor count or full max flow.'}}
if __name__=='__main__':
 result=calculate(8,92,492)
 result.update(evidence_grade='bounded_exact_graph_replay_and_inconclusive_cut_test',formal_award=False)
 with Path(__file__).with_name('RESULTS.json').open('x') as f:json.dump(result,f,sort_keys=True);f.write('\n')
 print(json.dumps({k:v for k,v in result.items() if k not in ('edges','P','orbits','test_cut')}))
 print(json.dumps({'cut_deficit_lower_bound_positive':result['test_cut']['certificate_of_failure']}))
