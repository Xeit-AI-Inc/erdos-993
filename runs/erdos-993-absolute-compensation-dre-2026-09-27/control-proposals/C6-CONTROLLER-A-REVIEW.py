from pathlib import Path
import json,hashlib,math
B=Path(__file__).resolve().parents[1];D=B/'cycles/cycle-6/C6-T2';r=json.loads((D/'run-full/RESULT.json').read_text());t=json.loads((D/'run-full/TRANSPORT-RECEIPT.json').read_text());expected=json.loads((B/'sources/cycle6/C6-SURPLUS-PREFIX-EXPECTED-COUNTS.json').read_text())
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert t['exit_code']==0 and not t['timed_out'] and t['source_unchanged'];assert t['elapsed_seconds']<1800 and t['elapsed_seconds']<3600
assert sha(D/'prefix_A.py')==sha(D/'run-full/frozen-census-source.py')==t['source_sha256_before']==t['source_sha256_after']==t['source_original_sha256_after'];assert sha(D/'run-full/RESULT.json')==t['result_sha256'];assert sha(D/'C6-PREFIX-RUNNER.py')==sha(B/'sources/cycle6/C6-PREFIX-RUNNER.py')==t['runner_sha256']
assert r['totals']=={'profiles':171699,'represented_tip_rank_tests':56245000}and not r['failures'];assert [x['m']for x in r['rows']]==list(range(1,100))
def mul(a,b):
 return [sum(a[j]*b[k-j]for j in range(max(0,k-len(b)+1),min(k,len(a)-1)+1))for k in range(len(a)+len(b)-1)]
def factor(n):return [math.comb(n,k)+int(k==1)for k in range(n+1)]
def evaluate(counts,mark,k):
 Q=[1];U=[1,2];removed=False;N=sum(a*b for a,b in zip(counts,[2,3,4]));m=sum(counts);h=1+sum(a*b for a,b in zip(counts,[2,4,7]))
 for typ,amount in zip([2,3,4],counts):
  for j in range(amount):
   Q=mul(Q,factor(typ))
   if typ==mark and not removed:U=mul(U,factor(typ-1));removed=True
   else:U=mul(U,factor(typ))
 assert removed
 C=mul([1,2],Q);get=lambda p,i:p[i]if 0<=i<len(p)else 0
 E=lambda i:math.comb(N,i-1)if 1<=i<=N+1 else 0
 vals={'U_k':get(U,k),'U_kp1':get(U,k+1),'C_k':get(C,k),'C_km1':get(C,k-1),'E_k':E(k),'E_kp1':E(k+1)}
 em=E(k)*get(C,k)-E(k+1)*get(C,k-1)
 vals.update(margin=(h+1)*get(U,k)*get(C,k)+(k+1)*(h-k+1)*em,full_minor=(get(U,k)+E(k))*get(C,k)-(get(U,k+1)+E(k+1))*get(C,k-1),E_minor=em,N=N,h=h,m=m)
 return vals
for row,e in zip(r['rows'],expected['layers']):
 for key in ['m','profiles','represented_tip_rank_tests']:assert row[key]==e[key]
 assert row==json.loads((D/'run-full/RESULT-checkpoints'/('m-%02d.json'%row['m'])).read_text());assert not row['failures']
 w=row['minimum_signed_surplus'];v=evaluate(w['counts'],w['r'],w['k'])
 for key in ['U_k','U_kp1','C_k','C_km1','E_k','E_kp1','margin','N','h']:assert int(w[key])==v[key],(row['m'],key)
 assert v['m']==row['m'] and 1<=w['k']<=(v['N']+2)//2 and v['margin']>0
controls=[evaluate([0,22,0],3,27),evaluate([38,0,1],4,77),evaluate([1,0,0],2,1)]
assert controls[0]['E_minor']==-518620474811633289768751398606375936 and controls[0]['full_minor']==777419068009671422357461955841645743808
assert controls[1]['full_minor']==-49239834336 and 2*77>controls[1]['N']+2
assert controls[2]['margin']==98 and controls[2]['full_minor']==19
out={'status':'controller bounded evidence review passed; no universal or formal award','source_sha256':sha(D/'prefix_A.py'),'result_sha256':sha(D/'run-full/RESULT.json'),'verified_checkpoint_rows':99,'witnesses_independently_recomputed':99,'totals':r['totals'],'minimum_reported':min(int(x['minimum_signed_surplus']['margin'])for x in r['rows']),'controls':controls,'transport_seconds':t['elapsed_seconds'],'full_census_rerun':False,'protocol_deviations':['The frozen census source does not execute the three controls on each invocation or embed controls in aggregate RESULT.json. Producer provides a separate control_replay.py and controls.json. Controller independently recomputes controls and witnesses here; retain this distinction for final review rather than claiming exact original protocol compliance.','Product arrays are reconstructed for each profile rather than incrementally reused; this affects efficiency only and the run stayed within the cap.']}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
