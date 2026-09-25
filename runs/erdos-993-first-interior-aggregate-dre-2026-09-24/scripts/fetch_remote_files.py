"""Read authoritative remote run artifacts into local mirror; never alter sealed bytes."""
from pathlib import Path
import json,sys,subprocess,base64,hashlib
B=Path(__file__).resolve().parents[1]
workspace=B.parent.parent
rels=sys.argv[1:]
assert rels
for r in rels:
 p=Path(r);assert not p.is_absolute() and '..' not in p.parts
code='''from pathlib import Path
import json,base64,hashlib
base=Path('/Users/ashtonsperry/VerityOS/experiments/erdos-993-first-interior-aggregate-dre-2026-09-24')
rels=RELS
out=[]
for rel in rels:
 p=base/rel
 assert p.resolve().is_relative_to(base.resolve())
 assert p.is_file() and not p.is_symlink()
 data=p.read_bytes()
 out.append({'path':rel,'sha256':hashlib.sha256(data).hexdigest(),'base64':base64.b64encode(data).decode()})
print(json.dumps(out))
'''.replace('RELS',repr(rels))
r=subprocess.run([sys.executable,str(workspace/'work/g1-dre-preparation/remote.py')],input=code,text=True,capture_output=True)
if r.returncode:raise RuntimeError(r.stderr+r.stdout)
items=json.loads(r.stdout)
sealed={x['path']:x['sha256'] for p in (B/'manifests').glob('*.json') for x in json.loads(p.read_text()).get('members',[])}
for item in items:
 data=base64.b64decode(item['base64']);assert hashlib.sha256(data).hexdigest()==item['sha256']
 if item['path'] in sealed:assert sealed[item['path']]==item['sha256'],'Remote artifact would change a sealed file'
 p=B/item['path'];assert not p.is_symlink();p.parent.mkdir(parents=True,exist_ok=True)
 if not p.exists() or p.read_bytes()!=data:p.write_bytes(data)
 print(item['path'],item['sha256'])
