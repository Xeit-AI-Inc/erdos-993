#!/usr/bin/env python3
import hashlib, json
from pathlib import Path
B=Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
manifest=json.loads((B/'manifests/C6-COMMON-DISPATCH.json').read_text())
fail=[]
for row in manifest['members']:
 p=B/row['path']
 if not p.is_file(): fail.append((row['path'],'missing'))
 elif hashlib.sha256(p.read_bytes()).hexdigest()!=row['sha256']: fail.append((row['path'],'hash mismatch'))
packet_path=B/'packets/C6-CU-F1.json'; packet=json.loads(packet_path.read_text())
for row in packet['allowed_source_files']:
 p=B/row['path']
 if not p.is_file(): fail.append((row['path'],'missing'))
 elif hashlib.sha256(p.read_bytes()).hexdigest()!=row['sha256']: fail.append((row['path'],'hash mismatch'))
if fail: raise SystemExit(json.dumps(fail))
print(f"common_manifest_members={len(manifest['members'])}")
print(f"packet_allowed_files={len(packet['allowed_source_files'])}")
print(f"packet_sha256={hashlib.sha256(packet_path.read_bytes()).hexdigest()}")
print('all authorized bytes match')
