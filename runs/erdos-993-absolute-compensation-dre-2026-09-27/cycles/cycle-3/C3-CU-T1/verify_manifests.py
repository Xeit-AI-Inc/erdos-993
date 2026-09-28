"""Recheck dispatch and packet hashes; root is the experiment run directory."""
import hashlib, json, pathlib, sys
root = pathlib.Path(sys.argv[1] if len(sys.argv) > 1 else '/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
result = {}
for rel in ('manifests/C3-COMMON-DISPATCH.json', 'manifests/C3-TRANSPORT-CLARIFICATION.json', 'manifests/C3-CRITIQUE-TRANSPORT.json'):
    manifest = json.loads((root / rel).read_text())
    bad = []
    for item in manifest['members']:
        p = root / item['path']
        actual = hashlib.sha256(p.read_bytes()).hexdigest() if p.is_file() else 'MISSING'
        if actual != item['sha256']:
            bad.append({'path': item['path'], 'actual': actual, 'expected': item['sha256']})
    result[rel] = {'members_checked': len(manifest['members']), 'mismatches': bad}
packet = json.loads((root / 'packets/C3-CU-T1.json').read_text())
bad = []
for item in packet['allowed_source_files']:
    p = root / item['path']
    actual = hashlib.sha256(p.read_bytes()).hexdigest() if p.is_file() else 'MISSING'
    if actual != item['sha256']:
        bad.append({'path': item['path'], 'actual': actual, 'expected': item['sha256']})
result['packets/C3-CU-T1.json'] = {'members_checked': len(packet['allowed_source_files']), 'mismatches': bad}
assert all(not x['mismatches'] for x in result.values())
pathlib.Path(__file__).with_name('manifest_verification.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result, indent=2))
