"""Guarded publication of the completed run, executed by controller only."""
import shutil, re, urllib.parse
E=V/'experiments/erdos-993-lower-region-compensation-dre-2026-09-25'
P=Path('/Users/ashtonsperry/Projects/XeitAI/erdos-993')
M=V/'experiments/erdos-993-master-ledger-2026-09-04'
baseline=json.loads((E/'publication/BASELINE.json').read_text())
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=P,text=True).strip()==baseline['public_head']
assert not subprocess.check_output(['git','status','--porcelain'],cwd=P,text=True).strip(), 'Public worktree changed'
for row in baseline['files']:
 assert hashlib.sha256((P/row['path']).read_bytes()).hexdigest()==row['sha256'], row['path']
state=json.loads((E/'RUN-STATE.json').read_text());assert state['completed_cycles']==list(range(1,7)) and state['stage']=='completed'
reg=(E/'control/FINAL-REGISTERED-CLAIM-IDENTITY.json').read_bytes()
assert reg==(M/'CLAIM-IDENTITY.json').read_bytes()
assert (E/'control/FINAL-MASTER-LEDGER.md').read_bytes()==(M/'LEDGER.md').read_bytes()
files=set(['RUN-STATE.json','control/SOURCE-PINS.initial.json','control/STANDING-SOURCE-PINS.json'])
for seal in (E/'manifests').glob('*.json'):
 d=json.loads(seal.read_text());files.add(str(seal.relative_to(E)))
 for row in d['members']:
  rel=row['path'];path=E/rel
  assert path.is_file() and not path.is_symlink()
  assert hashlib.sha256(path.read_bytes()).hexdigest()==row['sha256'],rel
  files.add(rel)
omit='preparation/C3-PREP-NEXT-SHELL-AUDIT/__pycache__/verify_lift.cpython-311.pyc'
assert omit in files
omissions={'schema':'e993.publication-omissions.v1','omissions':[{'path':omit,'sha256':hashlib.sha256((E/omit).read_bytes()).hexdigest(),'reason':'Generated Python bytecode in one historical seal; canonical bytes and seal preserved, deliberately not distributed as research source.'}]}
archive=P/'runs'/E.name
assert not archive.exists()
for pkg in ['lower-region-order-bands','lower-region-first-shell']:assert not (P/'proofs/lean'/pkg).exists()
assert not (P/'docs/experiments/lower-region-compensation-dre-2026-09-25.md').exists()
for rel in sorted(files-{omit}):
 assert not any(part in ['scratchpad','transport','.lake','.git','__pycache__'] for part in Path(rel).parts),rel
 src=E/rel;dst=archive/rel;dst.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(src,dst)
(archive/'PUBLICATION-OMISSIONS.json').write_text(json.dumps(omissions,indent=2)+'\n')
members=[{'path':str(p.relative_to(archive)),'sha256':hashlib.sha256(p.read_bytes()).hexdigest()} for p in sorted(archive.rglob('*')) if p.is_file()]
manifest={'schema':'e993.publication-manifest.v1','run':E.name,'date':'2026-09-26','historical_snapshots_immutable':True,'members':members}
(archive/'PUBLICATION-MANIFEST.json').write_text(json.dumps(manifest,indent=2)+'\n')
for pkg in ['lower-region-order-bands','lower-region-first-shell']:
 shutil.copytree(E/'publication/proofs/lean'/pkg,P/'proofs/lean'/pkg)
changed=[]
for src in sorted((E/'publication/current-docs').rglob('*')):
 if not src.is_file():continue
 rel=src.relative_to(E/'publication/current-docs')
 assert rel.as_posix() in {'README.md','STATUS.md','docs/problem-and-status.md','docs/results.md','docs/roadmap.md','docs/research-notepad-2026-09-25.md','docs/assessment-2026-09-25.md','docs/experiments/lower-region-compensation-dre-2026-09-25.md'}
 raw=src.read_bytes();assert b'FINAL_COUNTS_PENDING' not in raw and b'FINAL C6 DISPOSITIONS' not in raw
 dst=P/rel;dst.parent.mkdir(parents=True,exist_ok=True);dst.write_bytes(raw);changed.append(str(rel))
(P/'CLAIM-IDENTITY.json').write_bytes(reg)
for rel in ['LEDGER.md','docs/master-proof-ledger-2026-09-04.md']:(P/rel).write_bytes((M/'LEDGER.md').read_bytes())
verify=subprocess.run([sys.executable,str(archive/'scripts/verify_public_archive.py'),str(archive)],capture_output=True,text=True)
assert verify.returncode==0,verify.stdout+verify.stderr
receipt={'run':E.name,'source_head':baseline['public_head'],'archive_validation':json.loads(verify.stdout),'publication_manifest_sha256':hashlib.sha256((archive/'PUBLICATION-MANIFEST.json').read_bytes()).hexdigest(),'registry_sha256':hashlib.sha256(reg).hexdigest(),'current_docs':changed,'proof_packages':['lower-region-order-bands','lower-region-first-shell'],'commit_status':'not_yet_committed'}
(E/'receipts/FINAL-PUBLICATION-COPY.json').write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps(receipt))
