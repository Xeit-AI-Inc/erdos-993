#!/usr/bin/env python3
"""Controller-only admission; no autonomous dispatch or mathematical awards."""
from pathlib import Path
import sys,json,subprocess,shutil,hashlib,importlib.util,re
B=next((parent for parent in Path(__file__).resolve().parents
        if (parent/'scripts/worker_ops.py').is_file()),None)
if B is None:raise RuntimeError('Cannot locate run root with scripts/worker_ops.py')
spec=importlib.util.spec_from_file_location('worker_ops',B/'scripts/worker_ops.py')
W=importlib.util.module_from_spec(spec);spec.loader.exec_module(W)

LABEL_CYCLE=re.compile(r'^C([1-6])(?:-|$)')

def authority_paths(label,cycle=None):
    """Select cycle authority inputs; never substitute C1 files for a later cycle."""
    match=LABEL_CYCLE.match(label)
    inferred=int(match.group(1)) if match else None
    if cycle is None:
        if inferred is None:raise ValueError(f'Cannot infer C1..C6 from gate label: {label!r}')
        cycle=inferred
    elif type(cycle) is not int or not 1<=cycle<=6:
        raise ValueError(f'Invalid cycle: {cycle!r}')
    elif inferred is not None and inferred!=cycle:
        raise ValueError(f'Gate label/cycle mismatch: {label!r}, C{cycle}')
    if cycle==1:
        return B/'control/REGISTERED-CLAIM-IDENTITY.json',B/'OBLIGATIONS.csv'
    identity=B/'control'/f'C{cycle}-REGISTERED-CLAIM-IDENTITY.json'
    ledger=B/'ledgers'/f'C{cycle}-OBLIGATIONS.csv'
    for path in (identity,ledger):
        if not path.is_file() or path.is_symlink():
            raise FileNotFoundError(f'Missing regular cycle C{cycle} authority snapshot: {path}')
    return identity,ledger

def gates(label,cycle=None):
    identity,ledger=authority_paths(label,cycle)
    checks=[('lint',[sys.executable,str(B/'governance/skills/mathematical-solver-dre-controller/scripts/lint_claim_status.py'),'--identity',str(identity),'--ledger',str(ledger),'--json']),('paths',[sys.executable,str(B/'governance/skills/mathematical-solver-dre-controller/scripts/check_external_paths.py'),'--run-root',str(B),'--allowlist-file',str(B/'control/EXTERNAL-PATH-ALLOWLIST.txt'),'--prune','scratchpad','--prune','control-proposals','--prune','governance','--json'])]
    for suffix,cmd in checks:
        p=subprocess.run(cmd,text=True,capture_output=True)
        target=B/'receipts'/f'{label}-{suffix}.json'
        with target.open('x')as f:f.write(p.stdout)
        if p.returncode:raise RuntimeError(p.stdout+p.stderr)

def inventory():
    data={'schema':'e993.worker-ops.inventory.v1','workers':{}}
    for p in sorted((B/'cycles').glob('cycle-*/C*/RETURN.json')):
        worker=p.parent.name
        if (p.parent/'RETURN-NORMALIZED.json').is_file():p=p.parent/'RETURN-NORMALIZED.json'
        files=[{'path':str(x.relative_to(B)),'sha256':W.digest(x)}for x in sorted(p.parent.rglob('*'))if x.is_file() and '__pycache__'not in x.parts]
        data['workers'][worker]={'return_path':str(p.relative_to(B)),'files':files}
    return data

def admit(worker):
    cycle,stage,_,_=W.worker_spec(worker)
    authority_paths(worker+"-ADMISSION",cycle=cycle)
    src=B/'scratchpad'/worker;dst=B/'cycles'/f'cycle-{cycle}'/worker
    if dst.exists():raise RuntimeError('Admission destination exists')
    if not(src/'RETURN.json').is_file():raise RuntimeError('No return')
    # Worker must be finished, as separately confirmed by controller's collaboration status.
    for p in src.rglob('*'):
        if p.is_symlink():raise RuntimeError('Symlink output forbidden')
    shutil.copytree(src,dst,ignore=shutil.ignore_patterns('__pycache__','.lake','.git'))
    rel=str((dst/'RETURN.json').relative_to(B))
    inv=inventory();expected=W.dependencies(B,inv['workers'],worker)[0]if stage!='search'else None
    W.validate_return(B,rel,worker,expected)
    files=[str(p.relative_to(B))for p in sorted(dst.rglob('*'))if p.is_file()]
    # Record process snapshot before seal; controller separately examines it, helper never kills jobs.
    ps=subprocess.run(['ps','-axo','pid=,ppid=,command='],capture_output=True,text=True,check=True).stdout
    suspicious=[line for line in ps.splitlines() if str(src)in line and 'controller_ops.py'not in line]
    if suspicious:raise RuntimeError('Possible active producer jobs: '+repr(suspicious))
    gates(worker+"-ADMISSION",cycle=cycle)
    W.seal(B,files+[f'receipts/{worker}-ADMISSION-lint.json',f'receipts/{worker}-ADMISSION-paths.json'],f'manifests/{worker}.json')
    print(json.dumps({'admitted':worker,'claims':len(json.loads((dst/'RETURN.json').read_text())['claims']),'files':len(files)}))

def case(worker,label):
    cycle,stage,ori,deps=W.worker_spec(worker)
    authority_paths(label,cycle=cycle)
    inv=inventory()
    for dep in deps:W.verify(B,f'manifests/{dep}.json')
    required,files,ids=W.dependencies(B,inv['workers'],worker)
    W.fresh_json(B,f'control/{label}-INVENTORY.json',inv)
    W.fresh_json(B,f'packets/{worker}.json',{'schema':'e993.worker-ops.case.v1','worker_id':worker,'cycle':cycle,'stage':stage,'orientation':ori,'model':'gpt-6-sol','reasoning_effort':'high','source_worker_ids':ids,'allowed_source_files':files,'required_covered_claim_ids':required,'status_authority':'proposed_worker_only','scratch_absolute':str(B/'scratchpad'/worker)})
    (B/'scratchpad'/worker).mkdir(exist_ok=False)
    gates(label,cycle=cycle)
    W.seal(B,[f'packets/{worker}.json',f'control/{label}-INVENTORY.json',f'receipts/{label}-lint.json',f'receipts/{label}-paths.json'],f'manifests/{label}-DISPATCH.json')
    print(worker,stage,len(required),'claims')

if __name__=='__main__':
    if sys.argv[1]=='admit':admit(sys.argv[2])
    elif sys.argv[1]=='case':case(sys.argv[2],sys.argv[3])
    elif sys.argv[1]=='verify':
        for p in sorted((B/'manifests').glob('*.json')):W.verify(B,str(p.relative_to(B)))
        print('All existing seals verified')
