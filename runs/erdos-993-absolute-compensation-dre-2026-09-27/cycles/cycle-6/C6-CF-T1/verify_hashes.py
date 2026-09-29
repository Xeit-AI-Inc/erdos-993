import hashlib, json
from pathlib import Path
B=Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
manifest=json.loads((B/'manifests/C6-COMMON-DISPATCH.json').read_text())
packet_path=B/'packets/C6-CF-T1.json'
packet=json.loads(packet_path.read_text())
def digest(path): return hashlib.sha256(path.read_bytes()).hexdigest() if path.is_file() else 'MISSING'
mismatches=[]
for row in manifest['members']:
    actual=digest(B/row['path'])
    if actual != row['sha256']:
        mismatches.append({'path':row['path'],'expected':row['sha256'],'actual':actual})
packet_rows=[]
for row in packet['allowed_source_files']:
    actual=digest(B/row['path'])
    packet_rows.append({'path':row['path'],'expected':row['sha256'],'actual':actual,'match':actual==row['sha256']})
assert not mismatches
assert all(x['match'] for x in packet_rows)
print(json.dumps({'manifest':'manifests/C6-COMMON-DISPATCH.json','common_member_count':len(manifest['members']),'common_mismatches':mismatches,'packet':'packets/C6-CF-T1.json','packet_sha256':digest(packet_path),'packet_source_hashes':packet_rows},sort_keys=True))
