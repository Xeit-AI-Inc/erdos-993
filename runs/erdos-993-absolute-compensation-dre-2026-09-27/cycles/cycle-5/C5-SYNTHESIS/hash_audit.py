"""Check the bytes authorized by the common seal and this synthesis packet."""
import hashlib
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]


def check(items):
    mismatches = []
    for item in items:
        path = ROOT / item['path']
        actual = hashlib.sha256(path.read_bytes()).hexdigest() if path.is_file() else None
        if actual != item['sha256']:
            mismatches.append({'path': item['path'], 'actual': actual, 'sealed': item['sha256']})
    return {'members': len(items), 'mismatches': mismatches}


def main():
    common = json.loads((ROOT / 'manifests/C5-COMMON-DISPATCH.json').read_text())['members']
    packet = json.loads((ROOT / 'packets/C5-SYNTHESIS.json').read_text())['allowed_source_files']
    print(json.dumps({'common': check(common), 'packet': check(packet)}, indent=2))


if __name__ == '__main__':
    main()
