import hashlib
import json
import pathlib
import re

ROOT = pathlib.Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25')
OUT = pathlib.Path(__file__).resolve().parent
FILES = {
    'G1': 'inputs/C3-formal-intake/G1FirstWideMain.lean',
    'C2': 'runs/lean-2026-09-25-c2-order-bands-repair-1/LeanProject/LeanProof/Main.lean',
    'Interior': 'inputs/C3-formal-intake/FirstInteriorMain.lean',
    'R25': 'inputs/C3-formal-intake/R25Card5Main.lean',
}
SELECT = {
    'G1': set(range(1, 133)),
    'C2': set(range(1, 9)) | {13, 14, 15} | set(range(17, 26)) | {28} | set(range(32, 37)) | set(range(38, 42)),
    'Interior': {1, 2, 3, 6, 7, 13, 14},
    'R25': {16, 17, 18, 19, 22, 40, 41, 42, 43, 45, 46, 47, 48},
}
PAT = re.compile(rb'^-- VERITYOS ENTRY (\d+) BEGIN (\w+) (\S+) ([0-9a-f]{64})\n', re.M)

def sha(b):
    return hashlib.sha256(b).hexdigest()

sources = {}
for key, rel in FILES.items():
    data = (ROOT / rel).read_bytes()
    entries = []
    for m in PAT.finditer(data):
        end = re.search(rb'^-- VERITYOS ENTRY ' + m[1] + rb' END(?:\n|$)', data[m.end():], re.M)
        assert end is not None
        frag_end = m.end() + end.start()
        block_end = m.end() + end.end()
        frag = data[m.end():frag_end]
        marker_hash = m[4].decode()
        assert sha(frag) == marker_hash
        entries.append({
            'entry': int(m[1]), 'kind': m[2].decode(), 'name': m[3].decode(),
            'marker_sha256': marker_hash, 'fragment_sha256': sha(frag),
            'fragment_byte_start': m.end(), 'fragment_byte_end_exclusive': frag_end,
            'block_byte_start': m.start(), 'block_byte_end_exclusive': block_end,
            '_fragment': frag, '_block': data[m.start():block_end],
        })
    sources[key] = {'path': rel, 'sha256': sha(data), 'data': data, 'entries': entries}

def locate(key, n):
    return next(e for e in sources[key]['entries'] if e['entry'] == n)

manual = {
    'C2': {
        2: ['C2:1'], 3: ['C2:2'], 4: ['C2:2'], 6: ['C2:5'], 7: ['C2:6'],
        13: ['C2:8'], 14: [], 15: ['C2:8'],
        17: ['C2:13', 'C2:8'], 18: ['C2:17'], 19: ['C2:8'],
        20: ['C2:14', 'C2:8'], 21: ['C2:14'], 22: ['C2:21'], 23: ['C2:21'],
        25: ['C2:13', 'C2:15', 'C2:18', 'C2:19', 'C2:20', 'C2:23', 'C2:22', 'C2:24'],
        28: ['C2:25'], 32: ['C2:1', 'C2:2'], 33: ['C2:32'], 34: ['C2:32'],
        35: ['C2:3', 'C2:4', 'C2:33'], 36: ['C2:3', 'C2:33'],
        38: ['C2:36'], 39: ['C2:5', 'C2:6', 'C2:8'], 40: ['C2:8'],
        41: ['C2:35', 'C2:39', 'C2:40'],
    },
    'Interior': {
        2: ['Interior:1'], 3: ['Interior:2'], 6: ['C2:1'], 7: ['Interior:6'],
        13: ['Interior:3', 'Interior:6', 'C2:3', 'C2:4', 'C2:7'],
        14: ['C2:5', 'C2:6', 'C2:7'],
    },
    'R25': {
        16: ['G1:14', 'G1:82', 'G1:83'], 17: ['R25:16', 'G1:17'],
        18: ['R25:17', 'G1:25'], 19: ['R25:18'],
        41: ['R25:40', 'G1:86'], 42: ['R25:40', 'G1:87'],
        43: ['R25:41'], 45: ['R25:42'], 47: ['R25:43', 'R25:45', 'R25:46'],
        48: ['R25:47', 'G1:82', 'G1:83', 'G1:84'],
    },
}

# The entire G1 prefix is retained to preserve its original namespace and
# variable scaffolding. Its source-order predecessors are conservative
# prerequisites; the lexical references below aid later minimization.
g1_names = [(e['entry'], e['name']) for e in sources['G1']['entries'] if e['entry'] <= 132]
def g1_refs(e):
    body = e['_fragment'].decode()
    found = []
    for n, fullname in g1_names:
        if n >= e['entry']:
            break
        leaf = fullname.split('.')[-1]
        if re.search(r'(?<![\w.])' + re.escape(fullname) + r'(?!\w)', body) or re.search(r'(?<![\w.])' + re.escape(leaf) + r'(?!\w)', body):
            found.append(f'G1:{n}')
    return found

manifest = {
    'authority': 'proposed_worker_only',
    'hash_convention': 'fragment bytes start immediately after BEGIN marker newline and end immediately before END marker line; offsets are zero based, end exclusive',
    'integration_order': ['G1', 'C2', 'Interior', 'R25'],
    'selection': {k: sorted(v) for k, v in SELECT.items()},
    'sources': {k: {'path': v['path'], 'sha256': v['sha256']} for k, v in sources.items()},
    'declarations': [],
}
for key in manifest['integration_order']:
    for e in sources[key]['entries']:
        if e['entry'] not in SELECT[key]:
            continue
        row = {k: v for k, v in e.items() if not k.startswith('_')}
        row['source'] = key
        row['source_path'] = sources[key]['path']
        row['id'] = f"{key}:{e['entry']}"
        if key == 'G1':
            row['dependencies'] = {'conservative_source_order': f"G1:1..{e['entry']-1}" if e['entry'] > 1 else 'none', 'detected_name_references': g1_refs(e)}
        else:
            row['dependencies'] = {'declared_direct': manual.get(key, {}).get(e['entry'], []), 'Mathlib': True}
        manifest['declarations'].append(row)

# Hash-anchored duplicate evidence. Only byte-identical C2/Interior fragments
# are treated as interchangeable; G1/R25 same names are omitted, not merged.
by_name = {key: {e['name']: e for e in src['entries']} for key, src in sources.items()}
manifest['omitted_duplicates'] = []
def normalized_declaration(e):
    body = e['_fragment'].decode()
    leaf = e['name'].split('.')[-1]
    m = re.search(r'\b(?:def|lemma|theorem)\s+(?:[A-Za-z0-9_.]+\.)?' + re.escape(leaf) + r'\b', body)
    if not m:
        return None
    statement = body[m.start():]
    if e['kind'] == 'definition':
        statement = statement.split('\n\n', 1)[0]
    else:
        statement = statement.split(':= by', 1)[0]
        statement = statement.split(':=\n', 1)[0]
    statement = re.sub(r'\b((?:def|lemma|theorem))\s+(?:[A-Za-z0-9_.]+\.)?' + re.escape(leaf) + r'\b', r'\1 ' + leaf, statement, count=1)
    return re.sub(r'\s+', ' ', statement).strip()

for key, canonical in [('Interior', 'C2'), ('Interior', 'G1'), ('R25', 'G1')]:
    for name in sorted(by_name[key].keys() & by_name[canonical].keys()):
        a, b = by_name[key][name], by_name[canonical][name]
        manifest['omitted_duplicates'].append({
            'name': name, 'omitted': f"{key}:{a['entry']}", 'retained': f"{canonical}:{b['entry']}",
            'omission_scope': 'not selected from source at all' if a['entry'] not in SELECT[key] else 'selected alternate canonical declaration',
            'omitted_fragment_sha256': a['fragment_sha256'], 'retained_fragment_sha256': b['fragment_sha256'],
            'byte_identical': a['_fragment'] == b['_fragment'],
            'normalized_declaration_equal': normalized_declaration(a) == normalized_declaration(b),
            'omitted_normalized_declaration_sha256': sha(normalized_declaration(a).encode()) if normalized_declaration(a) else None,
            'retained_normalized_declaration_sha256': sha(normalized_declaration(b).encode()) if normalized_declaration(b) else None,
            'reason': 'exact fragment identity' if a['_fragment'] == b['_fragment'] else 'same fully qualified name; use retained original declaration, do not redefine',
        })

(OUT / 'MANIFEST.json').write_text(json.dumps(manifest, indent=2) + '\n')

g1 = sources['G1']['data'][:locate('G1', 132)['block_byte_end_exclusive']]
assert g1.startswith(b'import Mathlib\n')
(OUT / 'G1-PREFIX-132.lean.fragment').write_bytes(g1)
for key in ('C2', 'Interior', 'R25'):
    pieces = [e['_block'] for e in sources[key]['entries'] if e['entry'] in SELECT[key]]
    (OUT / f'{key.upper()}-SELECTED.lean.fragment').write_bytes(b'\n'.join(pieces))

# Draft single file for producer review. No new theorem or dummy declaration.
flat = g1 + b'\n' + (OUT / 'C2-SELECTED.lean.fragment').read_bytes() + b'\n' + (OUT / 'INTERIOR-SELECTED.lean.fragment').read_bytes() + b'\n' + (OUT / 'R25-SELECTED.lean.fragment').read_bytes() + b'\nend Erdos993G1.ThirdWide\n'
(OUT / 'FLAT-PREFIX-PROPOSAL.lean.fragment').write_bytes(flat)
print('declarations', len(manifest['declarations']))
for key in manifest['integration_order']:
    print(key, len(SELECT[key]), sources[key]['sha256'])
print('flat_sha256', sha(flat))
