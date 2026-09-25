from pathlib import Path
import sys,subprocess,json,re,hashlib
v=Path('/Users/ashtonsperry/VerityOS')
exp=v/'experiments/erdos-993-first-interior-aggregate-dre-2026-09-24'
run=exp/'runs/lean-2026-09-24-c2-primary-v2'
shared=Path('/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project')
def command(args):
 r=subprocess.run([str(x) for x in args],cwd=v,text=True,capture_output=True)
 print(r.stdout)
 if r.returncode:raise RuntimeError(r.stderr+r.stdout)
 return r
workflow=v/'skills/lean-proof-workflow/scripts/run_workflow.py'
audit=run/'REVIEW-SUBMISSIONS/informal-supplement/INFORMAL-AUDIT-CLARIFIED.md'
assert audit.is_file()
command([sys.executable,v/'skills/lean-proof-workflow/scripts/audit_copied_packages.py','--experiments-root',exp,'--json'])
command([sys.executable,workflow,'register-audit','--run-root',run,'--audit',audit,'--artifact-producer-id','interior-c2-formalization-team','--reviewer-id','interior-c2-informal-reviewer','--attestation-id','interior-c2-primary-informal-v2'])
command([sys.executable,v/'skills/theorem-contract/scripts/validate_theorem_contract.py','--workspace-root',run,'--contract','THEOREM-CONTRACT.yaml','--receipt','RECEIPTS/theorem-contract.json','--rendered','EVIDENCE/THEOREM-CONTRACT.md'])
command([sys.executable,v/'skills/lean-formalization/scripts/prepare_lean_formalization.py','init','--run-root',run,'--run-id',run.name,'--toolchain','leanprover/lean4:v4.32.2','--mathlib-revision','905b95818eb32af7874a58b427f50c1711a5e96c'])
command([sys.executable,workflow,'bind-shared-packages','--run-root',run,'--shared-project',shared])
command([sys.executable,workflow,'verify-shared-binding','--run-root',run])
regex=r'-- VERITYOS ENTRY (\d+) BEGIN (\w+) (\S+) ([0-9a-f]+)\n(.*?)-- VERITYOS ENTRY \1 END'
def entries(name,cap):
 data=(run/'SOURCE'/name).read_text();out=[]
 for m in re.finditer(regex,data,re.S):
  idx,kind,decl,old_hash,body=m.groups()
  if int(idx)<=cap:out.append({'origin':name,'entry':int(idx),'kind':kind,'name':decl,'original_fragment_sha256':old_hash,'body':body})
 assert len(out)==cap
 return out
r26=entries('r26-Main.lean',14);r25=entries('r25-Main.lean',25)
tag='''namespace E993Interior

noncomputable def taggedFamily {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U W : Finset V) (k : ℕ) :
    Finset (Finset V) := by
  classical
  exact (U.powersetCard k).filter fun A =>
    G.IsIndepSet (A : Set V) ∧ ¬ Disjoint A W

end E993Interior
'''
ordered=r26+r25[:3]+[{'origin':'controller_representation_of_audited_tagged_family','entry':1,'kind':'definition','name':'E993Interior.taggedFamily','body':tag}]+r25[3:]
staging=run/'STAGING';staging.mkdir(exist_ok=False)
base='import Mathlib\n\n'+''.join(x['body']+'\n' for x in ordered)
(staging/'BASE.lean').write_text(base)
for x in ordered:x['body_sha256']=hashlib.sha256(x['body'].encode()).hexdigest()
(staging/'BASE-ENTRY-MAP.json').write_text(json.dumps(ordered,indent=2,ensure_ascii=False)+'\n')
for name in ['core','guard','leaf']:(staging/name).mkdir()
print(json.dumps({'formal_run':str(run),'base_sha256':hashlib.sha256(base.encode()).hexdigest(),'base_entries':len(ordered),'status':'audited_contract_and_shared_project_ready_for_draft_formalization'}))
