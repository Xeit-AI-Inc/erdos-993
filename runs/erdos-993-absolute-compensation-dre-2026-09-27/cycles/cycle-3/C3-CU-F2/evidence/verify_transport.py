#!/usr/bin/env python3
"""Verify sealed dispatch, transport, and packet bytes for C3-CU-F2."""
import hashlib, json
from pathlib import Path
ROOT=Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
manifest_paths=('manifests/C3-COMMON-DISPATCH.json',
 'manifests/C3-TRANSPORT-CLARIFICATION.json',
 'manifests/C3-CRITIQUE-TRANSPORT.json')
summary=[]
for rel in manifest_paths:
    manifest=json.loads((ROOT/rel).read_text())
    checked=[]
    for member in manifest['members']:
        actual=hashlib.sha256((ROOT/member['path']).read_bytes()).hexdigest()
        checked.append({'path':member['path'],'matches':actual==member['sha256']})
    summary.append({'manifest':rel,'members':len(checked),'all_match':all(x['matches'] for x in checked)})
packet=json.loads((ROOT/'packets/C3-CU-F2.json').read_text())
checked=[]
for member in packet['allowed_source_files']:
    actual=hashlib.sha256((ROOT/member['path']).read_bytes()).hexdigest()
    checked.append({'path':member['path'],'matches':actual==member['sha256']})
summary.append({'manifest':'packets/C3-CU-F2.json','members':len(checked),'all_match':all(x['matches'] for x in checked)})
assert all(x['all_match'] for x in summary), summary
print(json.dumps(summary,indent=2))
