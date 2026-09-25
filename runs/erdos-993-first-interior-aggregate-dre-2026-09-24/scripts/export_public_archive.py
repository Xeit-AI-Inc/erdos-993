"""Publish only admitted sealed run objects and a byte-identical proof source package."""
from pathlib import Path
import hashlib,json,shutil,subprocess
V=Path('/Users/ashtonsperry/VerityOS');E=V/'experiments/erdos-993-first-interior-aggregate-dre-2026-09-24';M=V/'experiments/erdos-993-master-ledger-2026-09-04';P=Path('/Users/ashtonsperry/Projects/XeitAI/erdos-993')
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
files={}
for manifest in sorted((E/'manifests').glob('*.json')):
 for row in json.loads(manifest.read_text())['members']:
  rel=row['path'];assert not Path(rel).is_absolute() and '..'not in Path(rel).parts
  assert not any(x in Path(rel).parts for x in ['.lake','.git','__pycache__','scratchpad'])
  assert sha(E/rel)==row['sha256'],rel
  if rel in files:assert files[rel]==row['sha256']
  files[rel]=row['sha256']
 files[str(manifest.relative_to(E))]=sha(manifest)
archive=P/'runs'/E.name;archive.mkdir(parents=True,exist_ok=True)
for rel,digest in files.items():
 dst=archive/rel;dst.parent.mkdir(parents=True,exist_ok=True)
 if dst.exists():assert sha(dst)==digest,'Existing public archive drift: '+rel
 else:shutil.copyfile(E/rel,dst)
 assert sha(dst)==digest
proof=P/'proofs/lean/first-interior-aggregate';proof.mkdir(parents=True,exist_ok=True)
shutil.copytree(E/'delivery/first-interior-aggregate/source',proof/'source',dirs_exist_ok=True)
for src,dst in [('EXPERIMENT.md',P/'experiments/first-interior-aggregate.md'),('PROOF-README.md',proof/'README.md'),('VERIFICATION.md',P/'evidence/verification-2026-09-24-first-interior.md')]:
 if dst.exists():assert dst.read_bytes()==(E/'delivery/public-docs'/src).read_bytes(),'Existing documentation mismatch: '+str(dst)
 else:shutil.copyfile(E/'delivery/public-docs'/src,dst)
for src,dst in [(M/'CLAIM-IDENTITY.json',P/'CLAIM-IDENTITY.json'),(M/'LEDGER.md',P/'LEDGER.md'),(M/'LEDGER.md',P/'docs/master-proof-ledger-2026-09-04.md')]:
 shutil.copyfile(src,dst);assert sha(src)==sha(dst)
cmd=['python3',str(V/'skills/mathematical-solver-dre-controller/scripts/lint_claim_status.py'),'--identity',str(M/'CLAIM-IDENTITY.json'),'--ledger',str(E/'TERMINAL-LEDGER.csv'),'--ledger',str(E/'ledgers/TERMINAL-OBLIGATIONS.csv'),'--predecessor',str(E/'OBLIGATIONS.csv'),'--predecessor',str(E/'ledgers/C2-OBLIGATIONS.csv'),'--json']
lint=subprocess.run(cmd,text=True,capture_output=True);assert lint.returncode==0,lint.stdout+lint.stderr
with(E/'receipts/INSTALLED-MASTER-TERMINAL-LINT.json').open('x')as f:f.write(lint.stdout)
receipt={'status':'exported_pending_publication_validation','archive_files':len(files),'archive_bytes':sum((archive/x).stat().st_size for x in files),'all_sealed_bytes_preserved':True,'source_sha256':sha(proof/'source/LeanProof/Main.lean'),'public_registry_sha256':sha(P/'CLAIM-IDENTITY.json'),'master_ledger_sha256':sha(M/'LEDGER.md'),'export_excludes':['unadmitted scratchpad','.lake caches','.git','__pycache__'],'historical_provenance_paths_preserved':True}
with(E/'receipts/PUBLIC-EXPORT.json').open('x')as f:json.dump(receipt,f,indent=2);f.write('\n')
print(json.dumps(receipt,indent=2));print(lint.stdout)
