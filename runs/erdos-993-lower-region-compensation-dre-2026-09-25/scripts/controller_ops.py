#!/usr/bin/env python3
"""Controller-only admission; no autonomous dispatch or mathematical awards."""
from pathlib import Path
import sys,json,subprocess,shutil,importlib.util,re
B=next((parent for parent in Path(__file__).resolve().parents
        if (parent/'control/STAGE1-PREPARATION-BRIEF.md').is_file()),None)
if B is None:raise RuntimeError('Cannot locate Stage 1 run root')
spec=importlib.util.spec_from_file_location('worker_ops',Path(__file__).with_name('worker_ops.py'))
W=importlib.util.module_from_spec(spec);spec.loader.exec_module(W)

LABEL_CYCLE=re.compile(r'^C([1-6])-[A-Za-z0-9][A-Za-z0-9_-]*\Z')

def authority_paths(label,cycle=None):
    """Select cycle authority inputs; never substitute C1 files for a later cycle."""
    match=LABEL_CYCLE.match(label)
    if match is None:raise ValueError(f'Invalid C1..C6 gate label: {label!r}')
    inferred=int(match.group(1))
    if cycle is None:
        cycle=inferred
    elif type(cycle) is not int or not 1<=cycle<=6:
        raise ValueError(f'Invalid cycle: {cycle!r}')
    elif inferred!=cycle:
        raise ValueError(f'Gate label/cycle mismatch: {label!r}, C{cycle}')
    if cycle==1:
        identity=B/'control/REGISTERED-CLAIM-IDENTITY.json'
        ledger=B/'OBLIGATIONS.csv'
    else:
        identity=B/'control'/f'C{cycle}-REGISTERED-CLAIM-IDENTITY.json'
        ledger=B/'ledgers'/f'C{cycle}-OBLIGATIONS.csv'
    for path in (identity,ledger):
        if not path.is_file() or path.is_symlink():
            raise FileNotFoundError(f'Missing regular cycle C{cycle} authority snapshot: {path}')
    return identity,ledger

def gates(label,cycle=None):
    identity,ledger=authority_paths(label,cycle)
    checks=[('lint',[sys.executable,str(B/'governance/lint_claim_status.py'),'--identity',str(identity),'--ledger',str(ledger),'--json']),('paths',[sys.executable,str(B/'governance/check_external_paths.py'),'--run-root',str(B),'--allowlist-file',str(B/'control/EXTERNAL-PATH-ALLOWLIST.txt'),'--prune','scratchpad','--prune','control-proposals','--prune','governance','--json'])]
    for suffix,cmd in checks:
        p=subprocess.run(cmd,text=True,capture_output=True)
        target=B/'receipts'/f'{label}-{suffix}.json'
        with target.open('x')as f:f.write(p.stdout)
        if p.returncode:raise RuntimeError(p.stdout+p.stderr)

def inventory():
    data={'schema':'e993.worker-ops.inventory.v1','workers':{}}
    for p in sorted((B/'cycles').glob('cycle-*/C*/RETURN.json')):
        worker=p.parent.name
        cycle,_,_,_=W.worker_spec(worker)
        if p.parent.parent.name!=f'cycle-{cycle}':raise RuntimeError(f'Worker/cycle directory mismatch: {p}')
        # A copied return is provisional until the controller has sealed its admission.
        if not (B/'manifests'/f'{worker}.json').is_file():continue
        files=[{'path':str(x.relative_to(B)),'sha256':W.digest(x)}for x in sorted(p.parent.rglob('*'))if x.is_file() and '__pycache__'not in x.parts]
        data['workers'][worker]={'return_path':str(p.relative_to(B)),'files':files}
    return data

def admit(worker):
    cycle,stage,_,deps=W.worker_spec(worker)
    authority_paths(worker+"-ADMISSION",cycle=cycle)
    for dep in deps:W.verify(B,f'manifests/{dep}.json')
    src=B/'scratchpad'/worker;dst=B/'cycles'/f'cycle-{cycle}'/worker
    if dst.exists() or dst.is_symlink():raise RuntimeError('Admission destination exists')
    if not src.is_dir() or src.is_symlink():raise RuntimeError('Missing regular scratch directory')
    if not(src/'RETURN.json').is_file():raise RuntimeError('No return')
    label=worker+'-ADMISSION'
    receipt_paths=[B/'receipts'/f'{label}-{suffix}.json' for suffix in ('lint','paths')]
    manifest_path=B/'manifests'/f'{worker}.json'
    if any(path.exists() or path.is_symlink() for path in (*receipt_paths,manifest_path)):
        raise RuntimeError('Admission receipt or manifest already exists')
    # Worker must be finished, as separately confirmed by controller's collaboration status.
    for p in src.rglob('*'):
        if p.is_symlink():raise RuntimeError('Symlink output forbidden')
    try:
        shutil.copytree(src,dst,ignore=shutil.ignore_patterns('__pycache__','.lake','.git'))
        rel=str((dst/'RETURN.json').relative_to(B))
        inv=inventory();expected=W.dependencies(B,inv['workers'],worker)[0]if stage!='search'else None
        data=W.validate_return(B,rel,worker,expected)
        files=[str(p.relative_to(B))for p in sorted(dst.rglob('*'))if p.is_file()]
        referenced={rel,data['report_path']}
        for claim in data['claims']:referenced.update(claim['evidence_paths'])
        if not referenced.issubset(files):raise RuntimeError('Return names sources outside admitted worker output')
        # Controller separately checks worker completion; this snapshot only catches a live producer.
        ps=subprocess.run(['ps','-axo','pid=,ppid=,command='],capture_output=True,text=True,check=True).stdout
        suspicious=[line for line in ps.splitlines() if str(src)in line and 'controller_ops.py'not in line]
        if suspicious:raise RuntimeError('Possible active producer jobs: '+repr(suspicious))
        gates(label,cycle=cycle)
        W.seal(B,files+[str(path.relative_to(B)) for path in receipt_paths],str(manifest_path.relative_to(B)))
    except BaseException:
        # The admitted directory is controller-created. A rejected result must not remain visible as a source.
        for path in (*receipt_paths,manifest_path):
            if path.exists() or path.is_symlink():path.unlink()
        if dst.is_dir() and not dst.is_symlink():shutil.rmtree(dst)
        raise
    print(json.dumps({'admitted':worker,'claims':len(data['claims']),'files':len(files)}))

def case(worker,label):
    cycle,stage,ori,deps=W.worker_spec(worker)
    authority_paths(label,cycle=cycle)
    inv=inventory()
    for dep in deps:W.verify(B,f'manifests/{dep}.json')
    required,files,ids=W.dependencies(B,inv['workers'],worker)
    inventory_path=B/'control'/f'{label}-INVENTORY.json'
    packet_path=B/'packets'/f'{worker}.json'
    scratch_path=B/'scratchpad'/worker
    receipt_paths=[B/'receipts'/f'{label}-{suffix}.json' for suffix in ('lint','paths')]
    manifest_path=B/'manifests'/f'{label}-DISPATCH.json'
    created_files=(inventory_path,packet_path,*receipt_paths,manifest_path)
    if any(path.exists() or path.is_symlink() for path in (*created_files,scratch_path)):
        raise RuntimeError('Dispatch output already exists')
    try:
        W.fresh_json(B,str(inventory_path.relative_to(B)),inv)
        W.fresh_json(B,str(packet_path.relative_to(B)),{'schema':'e993.worker-ops.case.v1','worker_id':worker,'cycle':cycle,'stage':stage,'orientation':ori,'model':W.model_for_stage(stage),'reasoning_effort':'high','source_worker_ids':ids,'allowed_source_files':files,'required_covered_claim_ids':required,'status_authority':'proposed_worker_only','scratch_absolute':str(scratch_path)})
        scratch_path.mkdir(exist_ok=False)
        gates(label,cycle=cycle)
        W.seal(B,[str(path.relative_to(B)) for path in (*receipt_paths,packet_path,inventory_path)],str(manifest_path.relative_to(B)))
    except BaseException:
        for path in created_files:
            if path.exists() or path.is_symlink():path.unlink()
        if scratch_path.is_dir() and not scratch_path.is_symlink():scratch_path.rmdir()
        raise
    print(worker,stage,len(required),'claims')

if __name__=='__main__':
    if len(sys.argv)==3 and sys.argv[1]=='admit':admit(sys.argv[2])
    elif len(sys.argv)==4 and sys.argv[1]=='case':case(sys.argv[2],sys.argv[3])
    elif len(sys.argv)==2 and sys.argv[1]=='verify':
        count=0
        for p in sorted((B/'manifests').glob('*.json')):
            if W.load_json(p).get('schema')=='e993.worker-ops.seal.v1':
                W.verify(B,str(p.relative_to(B)));count+=1
        print(f'{count} worker-ops seals verified')
    else:raise SystemExit('Usage: controller_ops.py admit WORKER | case WORKER LABEL | verify')
