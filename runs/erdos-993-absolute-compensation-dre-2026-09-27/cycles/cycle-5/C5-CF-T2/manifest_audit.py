import hashlib,json
from pathlib import Path
B=Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
d=json.loads((B/'manifests/C5-COMMON-DISPATCH.json').read_text())
fail=[]
for m in d['members']:
 p=B/m['path']; got=hashlib.sha256(p.read_bytes()).hexdigest()
 if got!=m['sha256']: fail.append((m['path'],m['sha256'],got))
packet=B/'packets/C5-CF-T2.json'
print(json.dumps({'members_checked':len(d['members']),'member_mismatches':fail,'packet_sha256':hashlib.sha256(packet.read_bytes()).hexdigest(),'packet_in_common_manifest':any(m['path']=='packets/C5-CF-T2.json' for m in d['members'])},indent=2))
assert not fail
