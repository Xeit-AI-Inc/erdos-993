from pathlib import Path
import copy,hashlib,importlib.util,json,sys
sys.dont_write_bytecode=True
v=Path('/Users/ashtonsperry/VerityOS')
r=v/'experiments/erdos-993-first-interior-aggregate-dre-2026-09-24'
l=r/'runs/lean-2026-09-24-c2-primary-v2'
def read(p):return json.loads(p.read_text())
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def canonical(x):return (json.dumps(x,sort_keys=True,separators=(',',':'),ensure_ascii=True)+'\n').encode()
def load(name,path):
 spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);sys.modules[name]=m;spec.loader.exec_module(m);return m
sys.path.insert(0,str(v/'skills/lean-proof-workflow/scripts'))
wf=load('interior_c2_fidelity_workflow',v/'skills/lean-proof-workflow/scripts/run_workflow.py')
kv=load('interior_c2_fidelity_kernel',v/'skills/lean-kernel-verification/scripts/verify_lean_kernel.py')
fa=load('interior_c2_fidelity_audit',v/'skills/formalization-fidelity-audit/scripts/audit_fidelity.py')
receipts={}
for name in ['reviewer-assignment','informal-audit','theorem-contract','formalization','dependency-authority','kernel-verification']:
 q=read(l/wf.RECEIPT_RULES[name]['path'])
 wf.validate_json_schema(q,read(wf.RECEIPT_SCHEMAS[name]))
 errors=wf._validate_component_receipt(name,q,l)
 if errors:raise RuntimeError(name+': '+str(errors))
 receipts[name]=q
errors=wf._validate_common_lineage(l,receipts)
if errors:raise RuntimeError('Pre-fidelity lineage errors: '+str(errors))
k=receipts['kernel-verification'];c=read(l/'THEOREM-CONTRACT.yaml');a=receipts['reviewer-assignment']
if k['verdict']['code']!='verified' or not k['verdict']['verified']:raise RuntimeError('No passing kernel gate')
source=l/c['lean_binding']['source_relpath'];expected=c['lean_binding']['expected_statement'];name=c['lean_binding']['declaration_name']
text=source.read_text()
if text.count(expected+' :=')!=1:raise RuntimeError('Exact lexical terminal statement not unique')
axioms_path=Path(k['artifacts']['axioms_log'])
if sha(axioms_path)!=k['artifacts']['axioms_log_sha256']:raise RuntimeError('Axiom evidence changed')
axioms=kv.parse_axioms(axioms_path.read_text())
if axioms is None or not set(axioms)<=set(c['permitted_axioms']):raise RuntimeError('Axiom parsing/policy failed')
dependency=receipts['dependency-authority'];formal=receipts['formalization']
if k['project']['package_identities']!=dependency['package_identities']:raise RuntimeError('Dependency identities disagree')
deps=[];provenance=[]
for ident in sorted(k['project']['package_identities'],key=lambda x:x['name']):
 if ident['revision']!=ident['git_head']:raise RuntimeError('Package HEAD differs from pin')
 for p,h in ident['marker_sha256'].items():
  if sha(Path(p))!=h:raise RuntimeError('Package marker changed')
 h=hashlib.sha256(canonical(ident)).hexdigest()
 deps.append({'name':ident['name'],'version':ident['revision'],'content_hash':h})
 provenance.append({'dependency':ident['name'],'hashed_identity':ident,'content_hash':h,'convention':'SHA256 of the canonical identity object (including commit and file-marker hashes), not a hash of the full package tree.'})
tc=formal['toolchain']
for tool in ['lean','lake']:
 if sha(Path(tc[tool+'_path']))!=tc[tool+'_sha256']:raise RuntimeError('Installed binary changed')
tool_identity={key:tc[key] for key in ['pin','lean_sha256','lake_sha256']}
tool_hash=hashlib.sha256(canonical(tool_identity)).hexdigest()
deps.append({'name':'lean-toolchain','version':tc['pin'],'content_hash':tool_hash})
provenance.append({'dependency':'lean-toolchain','hashed_identity':tool_identity,'content_hash':tool_hash,'convention':'SHA256 of canonical pin and actual Lean/Lake binary SHA256 values.'})
deps.sort(key=lambda x:x['name'])
domains={x['id']:x for x in c['domains']}
projection={
 'contract_id':c['contract_id'],'contract_sha256':sha(l/'THEOREM-CONTRACT.yaml'),'theorem_name':name,
 'definitions':[{'name':x['id'],'canonical':x['description']} for x in c['definitions']],
 'domains':[{'variable':x['binder'],'lean_type':domains[x['domain_id']]['lean_type'],'forbidden_narrowings':[]} for x in c['quantifiers']],
 'quantifiers':[{'variable':x['binder'],'kind':'exists' if x['kind']=='exists_unique' else x['kind'],'domain':domains[x['domain_id']]['lean_type']} for x in c['quantifiers']],
 'hypotheses':[{'id':x['id'],'canonical':x['statement']} for x in c['hypotheses']],
 'conclusion':{'canonical':c['conclusion']['statement'],'clauses':[c['conclusion']['statement']]},
 'lean_statement':expected,'dependencies':deps,'permitted_axioms':sorted(c['permitted_axioms']),
 'constructivity_requirement':'constructive' if c['constructivity']['required'] else 'classical_allowed'}
binding={
 'declaration_name':name,'declaration_source_path':c['lean_binding']['source_relpath'],
 'declaration_source_sha256':sha(source),'definitions':copy.deepcopy(projection['definitions']),
 'domains':[{'variable':x['variable'],'lean_type':x['lean_type']} for x in projection['domains']],
 'quantifiers':copy.deepcopy(projection['quantifiers']),'hypotheses':copy.deepcopy(projection['hypotheses']),
 'conclusion':copy.deepcopy(projection['conclusion']),'lean_statement':expected,
 'dependencies':copy.deepcopy(deps),'declared_axioms':axioms}
payload={'schema_version':'formalization-fidelity-audit-input.v1','run_id':l.name,
 'artifact_producer_id':a['artifact_producer_id'],'theorem_contract':projection,'lean_binding':binding,
 'kernel_evidence':{'receipt_sha256':sha(l/'RECEIPTS/kernel-verification.json'),'verdict':k['verdict']['code'],'reported_axioms':axioms,'dependencies':copy.deepcopy(deps)},
 'audit_policy':{'require_independent_review':True},'independent_review':None}
fa.validate_input(payload)
fingerprints=fa.projection_fingerprints(payload)
with (l/'EVIDENCE/fidelity-audit-input.json').open('xb') as f:f.write(canonical(payload))
metadata={'controller_projection_only':True,'independent_verdict_pending':True,'no_semantic_verdict_from_text_equality':True,
 'projection_convention':'Contract projection follows canonical workflow schema. Binding facet descriptions are controller assertions checked against frozen definition/proof source and require fresh independent semantic attestation. Flat schema fields do not replace branch-scoped quantifiers in the actual declaration.',
 'dependency_provenance':provenance,'fingerprints':fingerprints,'input_sha256':sha(l/'EVIDENCE/fidelity-audit-input.json'),
 'source_sha256':sha(source),'contract_sha256':sha(l/'THEOREM-CONTRACT.yaml'),'kernel_receipt_sha256':sha(l/'RECEIPTS/kernel-verification.json')}
with (l/'EVIDENCE/FIDELITY-PROJECTION-PROVENANCE.json').open('xb') as f:f.write(canonical(metadata))
print(json.dumps({'prepared':True,'independent_review_pending':True,'fingerprints':fingerprints,'dependencies':len(deps),'axioms':axioms},sort_keys=True))
