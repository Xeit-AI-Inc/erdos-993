"""Apply the controller's final, already-reviewed decision with live guards.

Invoked only through the scoped remote helper after final adjudication/review.
This file contains no mathematical decision defaults.
"""
R = V / 'experiments/erdos-993-lower-region-compensation-dre-2026-09-25'
M = V / 'experiments/erdos-993-master-ledger-2026-09-04'
decision = json.loads((R / 'control/FINAL-DECISIONS.json').read_text())
assert decision['controller_decision'] == 'approved_for_registration'
assert decision['completed_cycles'] == list(range(1, 7))
assert (R / 'cycles/cycle-6/C6-SYNTHESIS/RETURN.json').is_file()
assert (R / decision['independent_identity_review']).is_file()
registry_path = M / 'CLAIM-IDENTITY.json'
ledger_path = M / 'LEDGER.md'
project_path = V / 'projects/erdos-993.md'
raw = registry_path.read_bytes()
old_ledger = ledger_path.read_bytes()
old_project = project_path.read_bytes()
assert hashlib.sha256(raw).hexdigest() == decision['expected_registry_sha256'], 'Concurrent registry change'
assert hashlib.sha256(old_project).hexdigest() == decision['expected_project_sha256'], 'Concurrent project change'
d = json.loads(raw)
old_claims = json.loads(raw)['claims']
assert len(old_claims) == decision['expected_claim_count']
lookup = {c['claim_key']: c for c in d['claims']}
changed = set()
for change in decision['claim_updates']:
    key = change['claim_key']
    assert key not in changed
    claim = lookup[key]
    assert claim['status'] == change['expected_status']
    for field, value in change['set_fields'].items():
        assert field not in {'claim_key', 'statement', 'scope'}, 'Existing identity may not be widened'
        claim[field] = value
    claim.setdefault('terminal_history', []).append({
        'run': R.name, 'cycle': 6, 'date': decision['date'], 'event': change['event']})
    changed.add(key)
for claim in decision['new_claims']:
    assert claim['claim_key'] not in lookup
    assert claim['formal_award'] is False
    lookup[claim['claim_key']] = claim
    d['claims'].append(claim)
for before, after in zip(old_claims, d['claims']):
    assert before['statement'] == after['statement'] and before['scope'] == after['scope']
    if before['claim_key'] not in changed:
        assert before == after, 'Unrelated claim object changed'
assert len(d['claims']) == len(old_claims) + len(decision['new_claims'])
d['last_updated'] = decision['date']
d['update_note'] = d.get('update_note', '') + '; ' + decision['update_note']
d['research_coordination'] = decision['research_coordination']
d['lower_region_compensation_publication'] = decision['publication_metadata']
out = (json.dumps(d, indent=2, ensure_ascii=False) + '\n').encode()
identity = R / 'control/FINAL-REGISTERED-CLAIM-IDENTITY.json'
ledger = R / 'ledgers/FINAL-OBLIGATIONS.csv'
assert not identity.exists() and not ledger.exists()
identity.write_bytes(out)
with ledger.open('x', newline='') as f:
    w = csv.DictWriter(f, fieldnames=['claim_id', 'status', 'registered_statement', 'registered_scope', 'evidence_grade'])
    w.writeheader()
    for c in d['claims']:
        w.writerow({'claim_id': c['claim_key'], 'status': c['status'], 'registered_statement': c['statement'],
                    'registered_scope': c['scope'], 'evidence_grade': c.get('evidence_grade', 'see_certificate')})
terminal = R / 'TERMINAL-LEDGER.csv'
assert not terminal.exists()
terminal.write_bytes(ledger.read_bytes())
check = subprocess.run([sys.executable, str(V / 'skills/mathematical-solver-dre-controller/scripts/lint_claim_status.py'),
                        '--identity', str(identity), '--ledger', str(ledger), '--json'], capture_output=True, text=True)
lint_path = R / 'receipts/FINAL-REGISTRATION-LINT.json'
assert not lint_path.exists()
lint_path.write_text(check.stdout)
assert check.returncode == 0, check.stdout + check.stderr
counts = {s: sum(c['status'] == s for c in d['claims']) for s in ['VERIFIED', 'REFUTED', 'CONDITIONAL', 'OPEN']}
assert counts == decision['expected_final_counts']
text = old_ledger.decode()
start = text.index('**Current orientation,')
end = text.index('\n\n', start)
text = text[:start] + decision['ledger_orientation'] + text[end:]
text += '\n\n## Lower-region six-cycle terminal close, ' + decision['date'] + '\n\n' + decision['ledger_closeout'] + '\n'
project_update = (R / 'control/FINAL-PROJECT-UPDATE.md').read_bytes()
for rel, content in [('inputs/FINAL-MASTER-BEFORE.json', raw), ('inputs/FINAL-LEDGER-BEFORE.md', old_ledger),
                     ('inputs/FINAL-PROJECT-BEFORE.md', old_project)]:
    target = R / rel
    assert not target.exists()
    target.write_bytes(content)
assert registry_path.read_bytes() == raw and ledger_path.read_bytes() == old_ledger and project_path.read_bytes() == old_project
registry_path.write_bytes(out)
ledger_path.write_text(text)
project_path.write_bytes(project_update)
(R / 'control/FINAL-MASTER-LEDGER.md').write_text(text)
receipt = {'date': decision['date'], 'previous_count': len(old_claims), 'current_count': len(d['claims']),
           'counts': counts, 'before_sha256': hashlib.sha256(raw).hexdigest(), 'after_sha256': hashlib.sha256(out).hexdigest(),
           'unchanged_prior_claim_objects': len(old_claims) - len(changed), 'updated_keys': sorted(changed),
           'new_keys': [c['claim_key'] for c in decision['new_claims']], 'new_formal_awards_at_close': 0,
           'master_ledger_sha256': hashlib.sha256(text.encode()).hexdigest(),
           'project_sha256': hashlib.sha256(project_update).hexdigest(),
           'initial_obligations_preserved': True}
(R / 'receipts/FINAL-REGISTRATION.json').write_text(json.dumps(receipt, indent=2) + '\n')
print(json.dumps(receipt))
