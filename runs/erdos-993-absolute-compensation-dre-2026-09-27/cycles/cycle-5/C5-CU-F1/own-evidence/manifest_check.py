from hashlib import sha256
import json
from pathlib import Path

ROOT = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
MANIFESTS = (
    'manifests/C5-COMMON-DISPATCH.json',
    'manifests/C5-F1-DISPATCH.json',
)
rows = []
for manifest_path in MANIFESTS:
    manifest = json.loads((ROOT / manifest_path).read_text())
    mismatches = []
    for member in manifest['members']:
        path = ROOT / member['path']
        if not path.is_file():
            mismatches.append({'path': member['path'], 'error': 'missing'})
            continue
        actual = sha256(path.read_bytes()).hexdigest()
        if actual != member['sha256']:
            mismatches.append({'path': member['path'], 'actual': actual, 'expected': member['sha256']})
    rows.append({'manifest': manifest_path, 'members': len(manifest['members']), 'mismatches': mismatches})

result = {'schema': 'C5-F1-manifest-check.v1', 'manifests': rows}
Path(__file__).with_suffix('.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result, indent=2))
