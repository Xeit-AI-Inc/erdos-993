"""Verify every neutral and case-specific byte authorized for C3-AF."""
import hashlib
import json
from pathlib import Path

here = Path(__file__).resolve()
root = next(p for p in here.parents if (p / 'SOLUTION-CONTRACT.md').is_file())
seals = {
    'common': root / 'manifests/C3-COMMON-DISPATCH.json',
    'transport': root / 'manifests/C3-TRANSPORT-CLARIFICATION.json',
    'critique_transport': root / 'manifests/C3-CRITIQUE-TRANSPORT.json',
    'packet': root / 'packets/C3-AF.json',
}
out = {}
for name, seal in seals.items():
    data = json.loads(seal.read_text())
    members = data['allowed_source_files'] if name == 'packet' else data['members']
    bad = []
    for item in members:
        target = root / item['path']
        actual = hashlib.sha256(target.read_bytes()).hexdigest() if target.is_file() else None
        if actual != item['sha256']:
            bad.append({'path': item['path'], 'expected': item['sha256'], 'actual': actual})
    out[name] = {'members': len(members), 'mismatches': bad}
assert all(not v['mismatches'] for v in out.values())
Path(__file__).with_name('AF_transport_audit.json').write_text(json.dumps(out, indent=2) + '\n')
print(json.dumps(out))
