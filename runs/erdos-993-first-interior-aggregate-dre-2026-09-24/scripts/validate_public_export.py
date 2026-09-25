"""Read-only checks of source identity, admitted archive, current mirrors and public links."""
from pathlib import Path
import csv,hashlib,json,re,subprocess,urllib.parse
V=Path('/Users/ashtonsperry/VerityOS');E=V/'experiments/erdos-993-first-interior-aggregate-dre-2026-09-24';M=V/'experiments/erdos-993-master-ledger-2026-09-04';P=Path('/Users/ashtonsperry/Projects/XeitAI/erdos-993');A=P/'runs'/E.name
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
fail=[];members={};manifests=0
for m in(E/'manifests').glob('*.json'):
 manifests+=1
 if not(A/'manifests'/m.name).is_file() or sha(m)!=sha(A/'manifests'/m.name):fail.append('Manifest mismatch '+m.name)
 for row in json.loads(m.read_text())['members']:
  rel=row['path'];members[rel]=row['sha256']
  if not(A/rel).is_file() or sha(A/rel)!=row['sha256']:fail.append('Archive hash mismatch '+rel)
parsed={'json':0,'csv':0}
for p in A.rglob('*'):
 if p.is_symlink():fail.append('Symlink '+str(p))
 if not p.is_file():continue
 if any(x in p.relative_to(A).parts for x in ['.lake','.git','__pycache__','scratchpad']):fail.append('Forbidden archive path '+str(p))
 if p.suffix=='.json':
  try:json.loads(p.read_text());parsed['json']+=1
  except Exception as ex:fail.append('JSON '+str(p)+': '+str(ex))
 if p.suffix=='.csv':
  try:
   with p.open(newline='')as f:rows=list(csv.reader(f,strict=True))
   assert len({len(row)for row in rows})<=1
   parsed['csv']+=1
  except Exception as ex:fail.append('CSV '+str(p)+': '+str(ex))
source=P/'proofs/lean/first-interior-aggregate/source'
for p in source.rglob('*'):
 if p.is_file():
  q=E/'runs/lean-2026-09-24-c2-primary-v2/LeanProject'/p.relative_to(source)
  if not q.is_file() or sha(p)!=sha(q):fail.append('Source/config mismatch '+str(p))
for src,dst in [(M/'CLAIM-IDENTITY.json',P/'CLAIM-IDENTITY.json'),(M/'LEDGER.md',P/'LEDGER.md'),(M/'LEDGER.md',P/'docs/master-proof-ledger-2026-09-04.md')]:
 if sha(src)!=sha(dst):fail.append('Master mirror mismatch '+str(dst))
newdocs=['experiments/first-interior-aggregate.md','evidence/verification-2026-09-24-first-interior.md','proofs/lean/first-interior-aggregate/README.md','runs/'+E.name+'/REPORT.md','runs/'+E.name+'/README.md']
changed=['README.md','STATUS.md','docs/results.md','docs/roadmap.md','experiments/README.md']
links=0;preexisting=[]
pat=re.compile(r'\[[^\]\n]*\]\(([^\)\n]+)\)')
def targets(text):
 return [v.strip().strip('<>')for v in pat.findall(text)]
for rel in newdocs+changed:
 p=P/rel;t=p.read_text();old=''
 if rel in changed:
  r=subprocess.run(['git','-C',str(P),'show','HEAD:'+rel],capture_output=True,text=True,check=True);old=r.stdout
 for target in targets(t):
  if urllib.parse.urlparse(target).scheme or target.startswith(('#','/')):continue
  links+=1;dest=urllib.parse.unquote(target.split('#')[0])
  if dest and not(p.parent/dest).exists():
   record=rel+' -> '+target
   if target in targets(old):preexisting.append(record)
   else:fail.append('New broken link '+record)
diff=subprocess.run(['git','-C',str(P),'diff','--check'],capture_output=True,text=True)
if diff.returncode:fail.append(diff.stdout+diff.stderr)
record={'status':'passed'if not fail else 'failed','manifest_count':manifests,'unique_sealed_members':len(members),'parsed':parsed,'checked_public_relative_links':links,'preexisting_broken_links':preexisting,'source_sha256':sha(source/'LeanProof/Main.lean'),'registry_sha256':sha(P/'CLAIM-IDENTITY.json'),'failures':fail}
print(json.dumps(record,indent=2))
if not fail:
 with(E/'receipts/PUBLIC-VALIDATION.json').open('x')as f:json.dump(record,f,indent=2);f.write('\n')
assert not fail,'Public validation failed'
