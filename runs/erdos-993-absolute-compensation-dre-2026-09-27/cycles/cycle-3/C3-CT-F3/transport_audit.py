import hashlib
import json
from pathlib import Path

B = Path('../..').resolve()
manifest_paths = (
    'manifests/C3-COMMON-DISPATCH.json',
    'manifests/C3-TRANSPORT-CLARIFICATION.json',
    'manifests/C3-CRITIQUE-TRANSPORT.json',
)
packet_path = 'packets/C3-CT-F3.json'
checks = []
for manifest_path in manifest_paths:
    manifest = json.loads((B / manifest_path).read_text())
    for member in manifest['members']:
        actual = hashlib.sha256((B / member['path']).read_bytes()).hexdigest()
        checks.append({
            'source': manifest_path,
            'path': member['path'],
            'expected': member['sha256'],
            'actual': actual,
            'match': actual == member['sha256'],
        })
packet = json.loads((B / packet_path).read_text())
for member in packet['allowed_source_files']:
    actual = hashlib.sha256((B / member['path']).read_bytes()).hexdigest()
    checks.append({
        'source': packet_path,
        'path': member['path'],
        'expected': member['sha256'],
        'actual': actual,
        'match': actual == member['sha256'],
    })
summary = {
    'manifest_member_checks': len(checks),
    'unique_paths': len({row['path'] for row in checks}),
    'mismatch_count': sum(not row['match'] for row in checks),
    'manifests': manifest_paths,
    'packet': packet_path,
    'checks': checks,
}
Path('transport_audit.json').write_text(json.dumps(summary, indent=2) + '\n')
print({k: summary[k] for k in ('manifest_member_checks', 'unique_paths', 'mismatch_count')})
assert summary['mismatch_count'] == 0
