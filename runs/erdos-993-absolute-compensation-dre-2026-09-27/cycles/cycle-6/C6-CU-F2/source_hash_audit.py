#!/usr/bin/env python3
"""Verify dispatch-authorized source bytes against their SHA-256 manifests."""
from pathlib import Path
import hashlib, json
B=Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')

def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
common=json.loads((B/'manifests/C6-COMMON-DISPATCH.json').read_text())
packet=json.loads((B/'packets/C6-CU-F2.json').read_text())
checks=[]
for entry in common['members']:
 p=B/entry['path']
 actual=sha(p) if p.is_file() else None
 checks.append({'path':entry['path'],'expected':entry['sha256'],'actual':actual,'ok':actual==entry['sha256']})
packet_checks=[]
for entry in packet['allowed_source_files']:
 p=B/entry['path']; actual=sha(p) if p.is_file() else None
 packet_checks.append({'path':entry['path'],'expected':entry['sha256'],'actual':actual,'ok':actual==entry['sha256']})
out={'common_manifest_sha256':sha(B/'manifests/C6-COMMON-DISPATCH.json'),
     'common_member_count':len(checks),'common_mismatches':[x for x in checks if not x['ok']],
     'packet_source_count':len(packet_checks),'packet_mismatches':[x for x in packet_checks if not x['ok']],
     'grade':'byte integrity checks only'}
assert not out['common_mismatches'] and not out['packet_mismatches']
Path('source_hash_audit.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
