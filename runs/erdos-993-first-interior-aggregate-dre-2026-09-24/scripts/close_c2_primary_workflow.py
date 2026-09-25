"""Import a completed independent attestation verbatim, then run original fidelity and close gates."""
from pathlib import Path
import hashlib,importlib.util,json,subprocess,sys
sys.dont_write_bytecode=True
V=Path('/Users/ashtonsperry/VerityOS');L=V/'experiments/erdos-993-first-interior-aggregate-dre-2026-09-24/runs/lean-2026-09-24-c2-primary-v2'
def read(p):return json.loads(p.read_text())
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
assignment=read(L/'RECEIPTS/reviewer-assignment.json');fp=read(L/'EVIDENCE/FIDELITY-FINGERPRINTS.json')
review=L/'REVIEW-SUBMISSIONS/fidelity';att=read(review/'ATTESTATION.json')
assert att['reviewer_id']==assignment['fidelity_reviewer']['reviewer_id']=='interior-c2-fidelity-reviewer'
assert att['reviewer_kind']==assignment['fidelity_reviewer']['reviewer_kind']
assert att['attestation_id']=='interior-c2-primary-fidelity-v2'
assert att['reviewer_id']!=assignment['artifact_producer_id']
for key,value in fp.items():assert att[key]==value
assert att['verdict']=='match'
assert not[x for x in att['findings'] if x['severity']=='error']
snapshot=read(L/'EVIDENCE/fidelity-input-before-attestation.json');current=read(L/'EVIDENCE/fidelity-audit-input.json');assert current==snapshot and current['independent_review'] is None
assert sha(L/current['lean_binding']['declaration_source_path'])==current['lean_binding']['declaration_source_sha256']
assert sha(L/'THEOREM-CONTRACT.yaml')==current['theorem_contract']['contract_sha256']
current['independent_review']=att
p=L/'EVIDENCE/fidelity-audit-input.json';p.write_text(json.dumps(current,sort_keys=True,separators=(',',':'),ensure_ascii=True)+'\n')
record={'operation':'verbatim_independent_attestation_import','attestation_sha256':sha(review/'ATTESTATION.json'),'review_report_sha256':sha(review/'REPORT.md'),'before_input_sha256':sha(L/'EVIDENCE/fidelity-input-before-attestation.json'),'after_input_sha256':sha(p),'producer_id':assignment['artifact_producer_id'],'reviewer_id':att['reviewer_id'],'controller_read_review':True,'contract_or_source_changed':False}
(L/'EVIDENCE/FIDELITY-ATTESTATION-IMPORT.json').write_text(json.dumps(record,indent=2)+'\n')
for helper,args,log in [
 ('skills/formalization-fidelity-audit/scripts/audit_fidelity.py',['audit','--run-root',str(L),'--input','EVIDENCE/fidelity-audit-input.json'],'FIDELITY-INVOCATION.log'),
 ('skills/lean-proof-workflow/scripts/run_workflow.py',['close','--run-root',str(L)],'WORKFLOW-CLOSE-INVOCATION.log')]:
 with (L/'EVIDENCE'/log).open('x')as f:r=subprocess.run([sys.executable,str(V/helper)]+args,cwd=V,stdout=f,stderr=subprocess.STDOUT,text=True)
 if r.returncode:raise RuntimeError(helper+' failed; inspect '+log)
 print(helper,'exit',r.returncode,flush=True)
print(json.dumps(read(L/'VERIFICATION-REPORT.json'),indent=2))
