import hashlib
import json
from pathlib import Path

B = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
results = {}
for rel in ('manifests/C3-COMMON-DISPATCH.json', 'manifests/C3-TRANSPORT-CLARIFICATION.json'):
    manifest = json.loads((B / rel).read_text())
    checks = []
    for member in manifest['members']:
        actual = hashlib.sha256((B / member['path']).read_bytes()).hexdigest()
        checks.append({'path': member['path'], 'expected': member['sha256'], 'actual': actual, 'match': actual == member['sha256']})
    results[rel] = {'member_count': len(checks), 'mismatch_count': sum(not c['match'] for c in checks), 'checks': checks}
Path('manifest_audit.json').write_text(json.dumps(results, indent=2) + '\n')
assert all(v['mismatch_count'] == 0 for v in results.values())
print({k: (v['member_count'], v['mismatch_count']) for k, v in results.items()})
