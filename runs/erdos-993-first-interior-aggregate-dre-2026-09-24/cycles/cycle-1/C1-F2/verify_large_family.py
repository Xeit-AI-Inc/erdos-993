#!/usr/bin/env python3
"""Factorized exact evaluator for the root-plus-stars family; integer polynomials only."""
from __future__ import annotations
import json
from pathlib import Path
BASE=Path(__file__).resolve().parent

def add(a,b):
 r=[0]*max(len(a),len(b))
 for i,x in enumerate(a):r[i]+=x
 for i,x in enumerate(b):r[i]+=x
 return trim(r)
def mul(a,b):
 r=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):r[i+j]+=x*y
 return trim(r)
def power(a,n):
 r=[1]
 for _ in range(n):r=mul(r,a)
 return r
def trim(a):
 while len(a)>1 and a[-1]==0:a.pop()
 return a
def c(a,k):return a[k] if 0<=k<len(a) else 0
def d(a,k):return c(a,k+1)-c(a,k)
Q=[1,4,3,1]; Q1=[1,3,1]; A=[1,1]
def row(m):
 p=3*m
 Qm=power(Q,m); A3m=power(A,3*m); A3mp1=mul(A3m,A)
 full=add(mul([1,2],Qm),mul([0,1],A3mp1))
 deleted_mark=add(mul(A,Qm),mul([0,1],A3m))
 deleted_branch=add(mul(mul([1,2],Q1),power(Q,m-1)),mul([0,1],A3m))
 H_mark=add(Qm,mul([0,1],A3m)); R_mark=Qm
 H_branch=mul(power(A,2),add(mul([1,2],power(Q,m-1)),mul([0,1],power(A,3*(m-1)+1))))
 R_branch=mul([1,2],power(Q,m-1))
 alpha=len(full)-1
 x=next(k for k in range(len(full)+1) if d(full,k)<0)
 markfav=d(deleted_mark,p)<0; branchfav=d(deleted_branch,p)<0
 gm=d(H_mark,p-1)-d(R_mark,p-1)
 gb=d(H_branch,p-1)-d(R_branch,p-1)
 S=(gm if markfav else 0)+(3*m*gb if branchfav else 0)
 return {'m':m,'order':4*m+3,'edges_rule':'(0,1),(1,2), and for i=0..m-1: (0,3+4i), (3+4i,4+4i),(3+4i,5+4i),(3+4i,6+4i)',
         'alpha':alpha,'p':p,'x':x,'eligible':x+2<=p,'coefficient_sequence':full,
         'marked_leaf_selector_delta':d(deleted_mark,p),'branch_leaf_selector_delta':d(deleted_branch,p),
         'marked_favorable':markfav,'branch_favorable':branchfav,'marked_g':gm,'branch_leaf_g':gb,
         'favorable_count':(int(markfav)+3*m*int(branchfav)),'complete_sum':S}
if __name__=='__main__':
 rows=[row(m) for m in range(1,61)]
 (BASE/'factorized-family-sweep.json').write_text(json.dumps(rows,indent=2)+'\n')
 for m in (22,60):
  r=row(m); (BASE/f'factorized-t{m}.json').write_text(json.dumps(r,indent=2)+'\n')
  print(json.dumps({k:r[k] for k in ('m','order','alpha','p','x','eligible','marked_leaf_selector_delta','branch_leaf_selector_delta','favorable_count','marked_g','branch_leaf_g','complete_sum')}))
