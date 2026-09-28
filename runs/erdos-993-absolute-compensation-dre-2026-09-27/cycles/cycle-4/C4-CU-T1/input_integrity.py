#!/usr/bin/env python3
"""Verify common dispatch members and packet-authorized producer inputs."""
import hashlib, json
from pathlib import Path
B=Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')

def verify(path, expected):
    actual=hashlib.sha256((B/path).read_bytes()).hexdigest()
    return {'path':path,'expected_sha256':expected,'actual_sha256':actual,'match':actual==expected}

common=json.loads((B/'manifests/C4-COMMON-DISPATCH.json').read_text())
packet=json.loads((B/'packets/C4-CU-T1.json').read_text())
case=json.loads((B/'manifests/C4-CU-T1-DISPATCH.json').read_text())
checks=[verify(row['path'],row['sha256']) for row in common['members']]
checks += [verify(row['path'],row['sha256']) for row in case['members']]
checks += [verify(row['path'],row['sha256']) for row in packet['allowed_source_files']]
result={'common_member_count':len(common['members']),'worker_dispatch_member_count':len(case['members']),
        'packet_source_count':len(packet['allowed_source_files']),'checks':len(checks),
        'mismatches':[r for r in checks if not r['match']]}
print(json.dumps(result,indent=2))
