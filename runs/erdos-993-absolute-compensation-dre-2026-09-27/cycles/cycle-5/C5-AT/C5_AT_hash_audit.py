"""Check the exact common and packet input bytes from scratch or admitted seat."""
import hashlib
import json
from pathlib import Path

here = Path(__file__).resolve().parent
roots = [p for p in here.parents if (p / 'control/WORKER-PROTOCOL.md').exists()]
assert len(roots) == 1
root = roots[0]
common = json.loads((root / 'manifests/C5-COMMON-DISPATCH.json').read_text())
packet = json.loads((root / 'packets/C5-AT.json').read_text())
result = {}
for name, rows in [('common', common['members']), ('packet', packet['allowed_source_files'])]:
    failures = []
    for row in rows:
        member = root / row['path']
        actual = hashlib.sha256(member.read_bytes()).hexdigest() if member.exists() else 'MISSING'
        if actual != row['sha256']:
            failures.append({'path': row['path'], 'actual': actual, 'expected': row['sha256']})
    result[name] = {'count': len(rows), 'failures': failures}
print(json.dumps(result, indent=2))
assert not any(v['failures'] for v in result.values())
