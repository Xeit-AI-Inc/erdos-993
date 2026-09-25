"""Remote controller registration; payload is supplied as a data-only prefix."""
from pathlib import Path
import json, hashlib, csv, subprocess, os, base64

V = Path('/Users/ashtonsperry/VerityOS')
M = V / 'experiments/erdos-993-master-ledger-2026-09-04'
N = V / 'experiments/erdos-993-first-interior-aggregate-dre-2026-09-24'
reg = M / 'CLAIM-IDENTITY.json'
ledger = M / 'LEDGER.md'
before = reg.read_bytes()
oldledger = ledger.read_bytes()
assert hashlib.sha256(before).hexdigest() == payload['expected'], 'Concurrent registry change'
j = json.loads(before)
old = j['claims'][:]
keys = {c['claim_key'] for c in old}
assert all(c['claim_key'] not in keys and c['status'] == 'OPEN' for c in payload['claims'])
assert (N / 'control/C2-SCOPE-AUDIT.md').is_file()
j['claims'].extend(payload['claims'])
after = (json.dumps(j, indent=2, ensure_ascii=False) + '\n').encode()
for name, data in [('C2-REGISTRY-BEFORE.json', before), ('C2-MASTER-LEDGER-BEFORE.md', oldledger), ('C2-REGISTERED-CLAIM-IDENTITY.json', after)]:
    p = N / 'control' / name
    assert not p.exists()
    p.write_bytes(data)
(N / 'ledgers').mkdir(exist_ok=True)
ll = N / 'ledgers/C2-OBLIGATIONS.csv'
with ll.open('x', newline='') as f:
    w = csv.writer(f)
    w.writerow(['claim_id', 'status', 'scope', 'statement_source'])
    for c in j['claims']:
        w.writerow([c['claim_key'], c['status'], c.get('scope', ''), 'control/C2-REGISTERED-CLAIM-IDENTITY.json#' + c['claim_key']])
result = subprocess.run(['python3', str(V / 'skills/mathematical-solver-dre-controller/scripts/lint_claim_status.py'), '--identity', str(N / 'control/C2-REGISTERED-CLAIM-IDENTITY.json'), '--ledger', str(ll), '--json'], capture_output=True, text=True)
(N / 'receipts/C2-REGISTRATION-lint.json').write_text(result.stdout)
assert result.returncode == 0, result.stdout + result.stderr
assert reg.read_bytes() == before and ledger.read_bytes() == oldledger, 'Concurrent master change'
addition = '\n\n## First-interior experiment: Cycle 2 scope preparation\n\nThe ongoing first-interior DRE has registered three auxiliary claims as OPEN after independent scope review: ' + ', '.join('`' + c['claim_key'] + '`' for c in payload['claims']) + '. No mathematical award is made. The primary `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` and its all-rank and governed-RTree parents remain OPEN; all prior claim objects and statuses are preserved. Cycle 1 synthesis is still in progress. Evidence: `../erdos-993-first-interior-aggregate-dre-2026-09-24/control/C2-SCOPE-AUDIT.md`.\n'
newledger = oldledger + addition.encode()
pending_reg = M / '.interior-c2-claim-identity.pending'
pending_ledger = M / '.interior-c2-ledger.pending'
assert not pending_reg.exists() and not pending_ledger.exists()
pending_reg.write_bytes(after)
pending_ledger.write_bytes(newledger)
os.replace(pending_reg, reg)
os.replace(pending_ledger, ledger)
assert json.loads(reg.read_bytes())['claims'][:len(old)] == old
receipt = {'before_claims': len(old), 'after_claims': len(j['claims']), 'before_sha256': hashlib.sha256(before).hexdigest(), 'after_sha256': hashlib.sha256(after).hexdigest(), 'added_open_keys': [c['claim_key'] for c in payload['claims']], 'preserved_prior_entries': True, 'no_mathematical_award': True}
(N / 'control/C2-REGISTRATION-RECEIPT.json').write_text(json.dumps(receipt, indent=2) + '\n')
(N / 'control/C2-MASTER-LEDGER-AFTER.md').write_bytes(newledger)
paths = ['control/C2-REGISTRY-BEFORE.json', 'control/C2-MASTER-LEDGER-BEFORE.md', 'control/C2-REGISTERED-CLAIM-IDENTITY.json', 'ledgers/C2-OBLIGATIONS.csv', 'receipts/C2-REGISTRATION-lint.json', 'control/C2-REGISTRATION-RECEIPT.json', 'control/C2-MASTER-LEDGER-AFTER.md']
print(json.dumps({'receipt': receipt, 'files': {p: base64.b64encode((N / p).read_bytes()).decode() for p in paths}}))
