"""Controller incremental hash-verified mirror; stop on immutable remote drift.

Run only while controller manifest creation is stopped. Scratch is never copied.
"""
from pathlib import Path
import json,base64,subprocess,hashlib
B=Path(__file__).resolve().parents[1]
files=set()
for p in (B/'manifests').glob('*.json'):
    d=json.loads(p.read_text());files.add(str(p.relative_to(B)))
    for row in d.get('members',[]):files.add(row['path'])
files.update(['RUN-STATE.json','control/SOURCE-PINS.initial.json','control/STANDING-SOURCE-PINS.json'])
rows=[]
for rel in sorted(files):
    p=B/rel
    if not p.is_file() or p.is_symlink():raise RuntimeError(rel)
    rows.append({'path':rel,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()})
ssh=['ssh','-o','ControlPath=/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/g1.sock','-o','BatchMode=yes','mini-away','python3 -']
prefix="from pathlib import Path\nimport json,base64,hashlib\nE=Path('/Users/ashtonsperry/VerityOS/experiments/erdos-993-lower-region-compensation-dre-2026-09-25')\n"
inspect=prefix+'rows=json.loads('+repr(json.dumps(rows))+')\n'+'''missing=[]
for row in rows:
 p=E/row['path']
 if not p.exists():missing.append(row['path']);continue
 if p.is_symlink() or not p.is_file():raise RuntimeError('Not regular '+row['path'])
 actual=hashlib.sha256(p.read_bytes()).hexdigest()
 if actual!=row['sha256']:
  if row['path']=='RUN-STATE.json':missing.append(row['path'])
  else:raise RuntimeError('Immutable remote drift '+row['path'])
print(json.dumps(missing))
'''
result=subprocess.run(ssh,input=inspect,text=True,capture_output=True,check=True)
missing=json.loads(result.stdout);lookup={r['path']:r['sha256'] for r in rows};items=[]
for rel in missing:
    raw=(B/rel).read_bytes()
    if hashlib.sha256(raw).hexdigest()!=lookup[rel]:raise RuntimeError('Local drift '+rel)
    items.append({'path':rel,'sha256':lookup[rel],'data':base64.b64encode(raw).decode()})
write=prefix+'items=json.loads('+repr(json.dumps(items))+')\n'+'''for row in items:
 p=E/row['path'];raw=base64.b64decode(row['data'])
 if p.exists() and row['path']!='RUN-STATE.json' and p.read_bytes()!=raw:raise RuntimeError('Concurrent remote drift '+row['path'])
 p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(raw)
 assert hashlib.sha256(p.read_bytes()).hexdigest()==row['sha256']
print(json.dumps({'copied':len(items),'copied_bytes':sum(len(base64.b64decode(r['data'])) for r in items),'verified':True}))
'''
result=subprocess.run(ssh,input=write,text=True,capture_output=True,check=True)
print(json.dumps({'total_verified':len(rows),'transfer':json.loads(result.stdout)}))
