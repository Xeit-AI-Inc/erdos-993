"""Execute original canonical source registration only after a successful sealed integration check."""
from pathlib import Path
import hashlib,importlib.util,json,os,subprocess,sys
sys.dont_write_bytecode=True
V=Path('/Users/ashtonsperry/VerityOS')
L=V/'experiments/erdos-993-first-interior-aggregate-dre-2026-09-24/runs/lean-2026-09-24-c2-primary-v2'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
plan=json.loads((L/'STAGING/INTEGRATION-PLAN.json').read_text())
check=json.loads((L/'EVIDENCE/INTEGRATION-CHECK.json').read_text())
assert check['exit_code']==0
assert check['plan_sha256']==sha(L/'STAGING/INTEGRATION-PLAN.json')
assert check['source_sha256']==sha(L/check['source'])
assert check['log_sha256']==sha(L/check['log'])
helper=V/'skills/lean-formalization/scripts/prepare_lean_formalization.py'
assert sha(helper)=='f19e8a58d6d25fe8a8eae1a87d243575946c4e1ab55c7d244860877f6fad0982'
spec=importlib.util.spec_from_file_location('original_interior_registration',helper);m=importlib.util.module_from_spec(spec);sys.modules[spec.name]=m;spec.loader.exec_module(m)
previous=-1
for row in plan['entries']:
 p=L/row['source'];assert p.resolve().is_relative_to(L.resolve()) and not p.is_symlink()
 assert sha(p)==row['sha256']
 assert m.validate_source(row['kind'],row['name'],p)==p.read_bytes()
 order={'definition':0,'lemma':1,'theorem':2}[row['kind']];assert order>=previous;previous=order
assert sum(row['kind']=='theorem' for row in plan['entries'])==1
assert plan['entries'][-1]['name']=='E993Interior.firstInteriorAggregate'
log=L/'EVIDENCE/CANONICAL-REGISTRATION.log'
with log.open('x')as f:
 for row in plan['entries']:
  command=[sys.executable,str(helper),'register','--run-root',str(L),'--kind',row['kind'],'--name',row['name'],'--source-file',str(L/row['source'])]
  result=subprocess.run(command,text=True,capture_output=True,cwd=V)
  f.write(json.dumps({'name':row['name'],'exit_code':result.returncode})+'\n'+result.stdout+result.stderr);f.flush()
  if result.returncode:raise RuntimeError('Canonical registration failed for '+row['name']+'; preserve log and inspect')
  print('Registered',row['name'],flush=True)
result=subprocess.run([sys.executable,str(helper),'validate-receipt','--run-root',str(L)],text=True,capture_output=True,cwd=V)
(L/'EVIDENCE/CANONICAL-REGISTRATION-VALIDATION.log').write_text(result.stdout+result.stderr)
assert result.returncode==0
print('Canonical registration complete; kernel verification remains pending.')
