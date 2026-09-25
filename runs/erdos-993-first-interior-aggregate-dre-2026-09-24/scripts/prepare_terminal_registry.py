"""Prepare a one-claim registry overlay and terminal tables; never install the master."""
from pathlib import Path
import collections,copy,csv,hashlib,json,sys
V=Path('/Users/ashtonsperry/VerityOS');E=V/'experiments/erdos-993-first-interior-aggregate-dre-2026-09-24';L=E/'runs/lean-2026-09-24-c2-primary-v2';M=V/'experiments/erdos-993-master-ledger-2026-09-04'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def read(p):return json.loads(p.read_text())
def write(p,data):
 with p.open('x')as f:f.write(json.dumps(data,indent=2,ensure_ascii=False)+'\n')
closed=read(L/'VERIFICATION-REPORT.json');assert closed['status']=='formally_verified' and closed['failures']==[]
registry=M/'CLAIM-IDENTITY.json';before=read(registry)
assert sha(registry)=='785dd4b12504a0f5a2aa66b84266cb313da80c0b28a27b2d96318a78ad3c8fdb','Concurrent master update: rebase proposal before preparing'
assert len(before['claims'])==395
(E/'control/MASTER-BEFORE-PRIMARY-CLOSE.json').write_bytes(registry.read_bytes())
(E/'control/MASTER-LEDGER-BEFORE-PRIMARY-CLOSE.md').write_bytes((M/'LEDGER.md').read_bytes())
after=copy.deepcopy(before);key='E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE';claim=next(c for c in after['claims']if c['claim_key']==key)
assert claim['status']=='OPEN'
formal={'run':E.name,'cycle':2,'lean_run':str(L.relative_to(E)),'declaration':'E993Interior.firstInteriorAggregate','closed_at':closed['generated_at'],'contract_sha256':sha(L/'THEOREM-CONTRACT.yaml'),'source_sha256':sha(L/'LeanProject/LeanProof/Main.lean'),'kernel_receipt_sha256':sha(L/'RECEIPTS/kernel-verification.json'),'fidelity_receipt_sha256':sha(L/'RECEIPTS/fidelity-audit.json'),'workflow_report_sha256':sha(L/'VERIFICATION-REPORT.json'),'informal_audit_receipt_sha256':sha(L/'RECEIPTS/informal-audit.json'),'toolchain':'leanprover/lean4:v4.32.2','mathlib_revision':'905b95818eb32af7874a58b427f50c1711a5e96c','axioms':['Classical.choice','Quot.sound','propext'],'separate_auxiliary_awards':0}
claim.update(status='VERIFIED',evidence_grade='formally_verified',formal_award=True,novelty_claimed=False,formal_evidence=formal,certificate='Exact first-interior ordinary-tree aggregate formally verified by the governed DRE+Lean workflow in '+E.name+'/'+str(L.relative_to(E))+'. Independent informal audit passed; pinned project and single-file kernel checks, axiom policy and source immutability passed; independent statement-fidelity review matched; canonical workflow closed formally_verified. No residual or alpha>=7 premise added. No award of other ranks, the all-rank aggregate, governed RTree transport, TREE, FOREST, TRANSFER or Erdos 993.')
claim.setdefault('terminal_history',[]).append({'run':E.name,'cycle':2,'date':'2026-09-24','event':'OPEN -> VERIFIED at formally_verified; exact primary statement and scope unchanged; decisive target resolution'})
after['last_updated']='2026-09-24';after['update_note']=before['update_note']+' First-interior aggregate close: one existing exact key promoted OPEN -> VERIFIED at formally_verified after Cycle 2; other 394 claim objects unchanged; three C2 auxiliary keys remain OPEN as separately governed claims.'
after['first_interior_verification']=formal
old={c['claim_key']:c for c in before['claims']};new={c['claim_key']:c for c in after['claims']};assert old.keys()==new.keys();changed=[k for k in old if old[k]!=new[k]];assert changed==[key]
for field in ['statement','scope','aliases','alias_patterns','relations']:assert old[key].get(field)==new[key].get(field)
counts=dict(collections.Counter(c['status']for c in after['claims']));assert counts=={'VERIFIED':236,'REFUTED':89,'CONDITIONAL':26,'OPEN':44},counts
candidate=E/'control/TERMINAL-CANDIDATE-CLAIM-IDENTITY.json';write(candidate,after)
for rel in ['TERMINAL-LEDGER.csv','ledgers/TERMINAL-OBLIGATIONS.csv']:
 with(E/rel).open('x',newline='')as f:
  w=csv.DictWriter(f,fieldnames=['claim_id','status','scope','statement_source']);w.writeheader()
  for c in after['claims']:w.writerow({'claim_id':c['claim_key'],'status':c['status'],'scope':c['scope'],'statement_source':'control/TERMINAL-CANDIDATE-CLAIM-IDENTITY.json#'+c['claim_key']})
occ=read(E/'reports/C2-RECONCILIATION-PREVIEW/RECONCILIATION.json')['occurrences'];assert len(occ)==53
fields=['occurrence_id','cycle','claim_id','original_proposed_status','original_statement','original_scope','classification','registered_exact_key','terminal_registry_status','terminal_overlay','evidence_grade','source_return','json_pointer','scope_note']
with(E/'TERMINAL-CLAIM-OCCURRENCES.csv').open('x',newline='')as f:
 w=csv.DictWriter(f,fieldnames=fields);w.writeheader()
 for x in occ:
  k=x['registered_exact_key'];row={z:x.get(z,'')for z in fields};row['terminal_registry_status']=new[k]['status']if k else 'NO_EXACT_KEY';row['terminal_overlay']='exact_primary_governed_award'if k==key else 'source_grade_preserved_no_new_award';row['evidence_grade']='formally_verified_primary_overlay_with_historical_source_status_preserved'if k==key else x['evidence_grade_preview'];w.writerow(row)
record={'status':'candidate_only_master_not_installed','before_sha256':sha(registry),'candidate_sha256':sha(candidate),'changed_claim_keys':changed,'preserved_other_claim_objects':394,'identity_fields_unchanged':True,'counts':counts,'source_occurrences':53,'source_occurrences_awarded_by_exact_primary_overlay':sum(x['registered_exact_key']==key for x in occ),'separate_auxiliary_awards':0,'historical_OBLIGATIONS_csv_preserved':True,'formal_evidence':formal}
write(E/'control/TERMINAL-REGISTRY-PROPOSAL.json',record)
print(json.dumps(record,indent=2))
