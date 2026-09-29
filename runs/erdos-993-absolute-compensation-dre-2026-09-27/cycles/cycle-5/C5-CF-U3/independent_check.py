#!/usr/bin/env python3
"""Independent exact replay of the C5-U3 recurrence control."""
from math import comb
from pathlib import Path
import hashlib, json

BROOT = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
SCRATCH = Path(__file__).resolve().parent

def poly_add(*ps):
    n=max(map(len,ps))
    return [sum(p[i] if i<len(p) else 0 for p in ps) for i in range(n)]

def poly_scale(c,p): return [c*x for x in p]
def poly_mul(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): out[i+j]+=x*y
    return out

def lp(n): return [comb(n,i) for i in range(n+1)]
def plus_z(p): return poly_add(p,[0,1])
def coeff(p,k): return p[k] if 0<=k<len(p) else 0

def check_hashes():
    manifest=json.loads((BROOT/'manifests/C5-COMMON-DISPATCH.json').read_text())
    packet=json.loads((BROOT/'packets/C5-CF-U3.json').read_text())
    rows=[]
    for member in manifest['members']:
        path=BROOT/member['path']
        got=hashlib.sha256(path.read_bytes()).hexdigest()
        rows.append({'path':member['path'],'expected':member['sha256'],'actual':got,'ok':got==member['sha256']})
    case=[]
    for member in packet['allowed_source_files']:
        path=BROOT/member['path']
        got=hashlib.sha256(path.read_bytes()).hexdigest()
        case.append({'path':member['path'],'expected':member['sha256'],'actual':got,'ok':got==member['sha256']})
    assert all(x['ok'] for x in rows+case)
    return {'common_member_count':len(rows),'common_all_match':all(x['ok'] for x in rows),
            'packet_source_count':len(case),'packet_all_match':all(x['ok'] for x in case)}

def main():
    m,N,r,k=150,300,2,4
    L_N=lp(N); E=[0]+L_N
    G=[1,2]; B2=plus_z(lp(2)); B1=plus_z(lp(1))
    Q=[1]
    for _ in range(m): Q=poly_mul(Q,B2)
    C=poly_mul(G,Q)
    # With homogeneous arity 2, each of the N original tip tags has
    # the same deletion polynomial G*B_1*B_2^(m-1).
    H=[1]
    for _ in range(m-1): H=poly_mul(H,B2)
    Utag=poly_mul(poly_mul(G,B1),H)
    W=poly_add(poly_scale(N,Utag),poly_scale(N,E))
    Qnew=poly_mul(Q,B2); Cnew=poly_mul(G,Qnew)
    Hnew=Q
    Utagnew=poly_mul(poly_mul(G,B1),Hnew)
    Enew=[0]+lp(N+r)
    Wnew=poly_add(poly_scale(N+r,Utagnew),poly_scale(N+r,Enew))
    correction=poly_add(poly_scale(r,poly_mul(lp(r),E)),poly_scale(-N,[0]+E))
    rhs=poly_add(poly_mul(B2,W),poly_scale(r,poly_mul(B1,C)),correction)
    assert rhs==Wnew
    # Closed-form boundary/interior coefficient checks in the corrected term.
    c=lambda rank: r*comb(N+r,rank-1)-N*(comb(N,rank-2) if rank>=2 else 0)
    corr_checks={str(s):str(c(s)) for s in (1,2,k,(N+r+2)//2)}
    signed=c(k)
    assert signed==-4364800 and 2*k<=N+r+2 and k>=1
    minor_at=lambda rank: coeff(Wnew,rank)*coeff(Cnew,rank)-coeff(Wnew,rank+1)*coeff(Cnew,rank-1)
    minor=minor_at(k)
    assert minor==185586251584170562390
    out={
      'hash_audit':check_hashes(),
      'profile_old':{'r2':m,'r3':0,'r4':0,'N':N},
      'appended_r':r,'profile_new_N':N+r,'rank_k':k,
      'guard_1_le_k':k>=1,'guard_2k_le_Nnew_plus2':2*k<=N+r+2,
      'correction_coefficient_by_closed_form':corr_checks,
      'correction_k_formula':'2*binom(302,3)-300*binom(300,2)',
      'correction_k_parts':[str(r*comb(N+r,k-1)),str(N*comb(N,k-2))],
      'correction_k':str(signed),
      'polynomial_recurrence_exact':True,
      'full_weighted_minor_at_guard_and_interior':{str(s):str(minor_at(s)) for s in (1,k,(N+r+2)//2)},
      'classification':'coefficientwise-correction positivity fails; full guarded minor remains positive'
    }
    (SCRATCH/'independent_check.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps(out,indent=2))

if __name__=='__main__': main()
