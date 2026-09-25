from pathlib import Path
import json, hashlib, shutil, importlib.util
B=Path(__file__).resolve().parents[1]
s=importlib.util.spec_from_file_location('ops',B/'scripts/controller_ops_v4.py');O=importlib.util.module_from_spec(s);s.loader.exec_module(O)
O.W.verify(B,'manifests/C2-SYNTHESIS.json')
run=B/'runs/lean-2026-09-24-c2-primary'
assert not run.exists()
(run/'SOURCE').mkdir(parents=True)
source_map={
 'CANDIDATE-PROOF.md':'cycles/cycle-2/C2-SYNTHESIS/CANDIDATE-PROOF.md',
 'SYNTHESIS-REPORT.md':'cycles/cycle-2/C2-SYNTHESIS/REPORT.md',
 'SEMANTIC-CONTRACT.md':'SEMANTIC-CONTRACT.md',
 'SOLUTION-CONTRACT.md':'SOLUTION-CONTRACT.md',
 'r26-Main.lean':'sources/public/proofs/lean/r26-c1-la1-top-rank-residual-sign/source/LeanProof/Main.lean',
 'r25-Main.lean':'proposals/cycle2/latest-code/packages/r25-c6-forest-delta2-pos-order-9/source/LeanProof/Main.lean',
 'r25-CONTRACT.yaml':'proposals/cycle2/latest-code/packages/r25-c6-forest-delta2-pos-order-9/THEOREM-CONTRACT.yaml',
 'r25-VERIFICATION.md':'proposals/cycle2/latest-code/packages/r25-c6-forest-delta2-pos-order-9/VERIFICATION-REPORT.md',
}
for dest,src in source_map.items():shutil.copyfile(B/src,run/'SOURCE'/dest)
cs=json.loads((B/'control/C2-REGISTERED-CLAIM-IDENTITY.json').read_text())['claims']
claim=next(c for c in cs if c['claim_key']=='E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE')
statement='''theorem firstInteriorAggregate {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
    (hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2) :
    C5LA1.aggregate G (G.indepNum - 2) ≤ 0'''
defs=[]
def add(i,name,desc,deps=[]):defs.append({'id':i,'description':desc,'lean_name':name,'dependencies':deps})
add('def-alpha','SimpleGraph.indepNum','Maximum cardinality of an independent vertex set in the finite graph.')
add('def-leaf','C4LA1.IsGraphLeaf','An original vertex has exactly one adjacent vertex, not an isolate.')
add('def-support','C5LA1.support','Unique original neighbor of a leaf; arbitrary off the leaf set.',['def-leaf'])
add('def-count','C5LA1.indepSetCount','Natural count of independent k-subsets of the original carrier avoiding deletion set D, including zero counts above capacity.')
add('def-delta','C5LA1.forwardDifferenceDel','Integer difference i_(k+1)(G-D)-i_k(G-D). The intended integer coefficients are zero outside feasible ranks.',['def-count'])
add('def-crossing','C5LA1.crossingIndex','Least natural index with strict negative full-graph forward difference, defined by Nat.find; terminal zero extension proves existence.',['def-delta','def-alpha'])
add('def-H','C5LA1.H','Deletion set {v,s_v} using the original leaf support.',['def-support'])
add('def-R','C5LA1.R','Original closed neighborhood of s_v as a deletion set.',['def-support'])
add('def-favorable','C4LA1.IsFavorableAt','Strict negativity of the vertex-deleted difference at the original rank p; its independent-set count is the original-carrier avoiding-{v} representation.',['def-delta'])
add('def-aggregate','C5LA1.aggregate','Integer sum over every favorable original leaf vertex, retaining shared-support multiplicity, of forwardDifferenceDel(H,p-1)-forwardDifferenceDel(R,p-1).',['def-leaf','def-H','def-R','def-delta','def-favorable'])
domains=[{'id':'domain-V','description':'Arbitrary finite vertex type, with Fintype and classical-compatible decidable equality instances. No order restriction.','lean_type':'Type*','dependencies':[]},{'id':'domain-G','description':'Arbitrary simple graph on V; decidable adjacency is available for finite counting and does not restrict the mathematical class.','lean_type':'SimpleGraph V','dependencies':['domain-V']}]
hyps=[{'id':'hyp-tree','statement':'G is connected and acyclic, exactly an ordinary finite tree.','dependencies':['domain-G']},{'id':'hyp-interior','statement':'With integer p=alpha(G)-2, x(G)+2<=p. The exact Lean Nat premise is equivalent: it forces alpha>=4 and p>=2, so both subtractions in the aggregate agree with integer ranks. Alpha>=7 is a conclusion to prove, not an added premise.','dependencies':['def-alpha','def-crossing']}]
concl={'id':'conclusion','statement':claim['statement'],'dependencies':['hyp-tree','hyp-interior','def-aggregate']}
nodes=[{'id':x['id'],'kind':kind} for xs,kind in [(defs,'definition'),(domains,'domain'),(hyps,'hypothesis'),([concl],'conclusion')] for x in xs]
edges=[{'from':dep,'to':x['id']} for x in defs+domains+hyps+[concl] for dep in x['dependencies']]
materials=[{'id':'source-'+str(i+1),'path':'SOURCE/'+name,'sha256':hashlib.sha256((run/'SOURCE'/name).read_bytes()).hexdigest(),'role':('theorem_intent' if name in ['SEMANTIC-CONTRACT.md','SOLUTION-CONTRACT.md'] else 'proof_or_definition_source')} for i,name in enumerate(source_map)]
contract={'schema_version':'theorem-contract/v1','contract_id':'e993-first-interior-aggregate-c2-primary-v1','theorem':{'title':'First-interior ordinary favorable-leaf aggregate','informal_statement':claim['statement']},'formulation_status':{'status':'open','evidence':['SOURCE/CANDIDATE-PROOF.md: complete informal candidate selected by C2 synthesis; no formal award yet.']},'definitions':defs,'domains':domains,'quantifiers':[{'binder':'V','kind':'forall','domain_id':'domain-V'},{'binder':'G','kind':'forall','domain_id':'domain-G'}],'hypotheses':hyps,'conclusion':concl,'dependency_graph':{'nodes':nodes,'edges':edges},'permitted_axioms':['Classical.choice','Quot.sound','propext'],'constructivity':{'required':False,'policy':'classical_allowed','rationale':'Finite graph maxima, chosen leaf supports and decidable finite-set counting may use classical choice; no axioms beyond the three listed are permitted.'},'success_criteria':{'contract_valid':True,'informal_audit_required':True,'kernel_verification_required':True,'fidelity_audit_required':True,'sorry_free':True,'approved_axioms_only':True},'lean_binding':{'project_relpath':'LeanProject','source_relpath':'LeanProject/LeanProof/Main.lean','declaration_name':'E993Interior.firstInteriorAggregate','expected_declaration_kind':'theorem','expected_statement':statement,'expected_statement_sha256':hashlib.sha256(statement.encode()).hexdigest()},'source_materials':materials}
(run/'THEOREM-CONTRACT.yaml').write_text(json.dumps(contract,indent=2,ensure_ascii=False)+'\n')
claimhash=hashlib.sha256(' '.join(claim['statement'].split()).encode()).hexdigest()
profile={'run_id':run.name,'artifact_producer_id':'interior-c2-formalization-team','informal_reviewer_id':'interior-c2-informal-reviewer','fidelity_reviewer_id':'interior-c2-fidelity-reviewer','informal_attestation_id':'interior-c2-primary-informal-v1','claim_sha256':claimhash,'producer_model':'gpt-6-sol','reasoning_effort':'high','repair_limit':2,'scope':'Only exact primary awarded by this run; auxiliary awards require separately bound verification.'}
(run/'SOURCE/REVIEWER-PROFILE.json').write_text(json.dumps(profile,indent=2)+'\n')
files=[str(p.relative_to(B)) for p in run.rglob('*') if p.is_file()]
O.gates('C2-LEAN-INTAKE');O.W.seal(B,files+['scripts/prepare_c2_lean_intake.py','receipts/C2-LEAN-INTAKE-lint.json','receipts/C2-LEAN-INTAKE-paths.json'],'manifests/C2-LEAN-INTAKE.json')
print(json.dumps({'run':str(run),'claim_sha256':claimhash,'sources':len(source_map),'status':'draft_contract_pending_independent_audit_and_validation'}))
