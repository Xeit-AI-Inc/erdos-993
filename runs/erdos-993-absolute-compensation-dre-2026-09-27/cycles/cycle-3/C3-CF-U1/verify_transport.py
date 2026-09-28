#!/usr/bin/env python3
"""Verify common, case, and clarification transport pins for this critique."""
import hashlib, json
from pathlib import Path
B=Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
def check_manifest(rel):
    doc=json.loads((B/rel).read_text()); failures=[]
    for item in doc['members']:
        actual=hashlib.sha256((B/item['path']).read_bytes()).hexdigest()
        if actual!=item['sha256']:
            failures.append({'path':item['path'],'expected':item['sha256'],'actual':actual})
    return {'manifest':rel,'members_checked':len(doc['members']),'failures':failures}
checks=[check_manifest('manifests/C3-COMMON-DISPATCH.json'),
        check_manifest('manifests/C3-TRANSPORT-CLARIFICATION.json'),
        check_manifest('manifests/C3-CRITIQUE-TRANSPORT.json')]
packet=json.loads((B/'packets/C3-CF-U1.json').read_text()); bad=[]
for item in packet['allowed_source_files']:
    actual=hashlib.sha256((B/item['path']).read_bytes()).hexdigest()
    if actual!=item['sha256']:
        bad.append({'path':item['path'],'expected':item['sha256'],'actual':actual})
checks.append({'packet_case_file_hashes_checked':len(packet['allowed_source_files']),'failures':bad})
result={'checks':checks,'all_verified':all(not x.get('failures') for x in checks)}
Path('transport_evidence.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
