R=V/'experiments/erdos-993-lower-region-compensation-dre-2026-09-25'
M=V/'experiments/erdos-993-master-ledger-2026-09-04'
decision=json.loads((R/'control/C5-FINAL-DECISIONS.json').read_text())
p=M/'CLAIM-IDENTITY.json';raw=p.read_bytes()
assert hashlib.sha256(raw).hexdigest()==decision['expected_registry_sha256'],'Concurrent registry change'
assert (R/'cycles/cycle-5/CONTROLLER-CLOSEOUT.md').is_file()
assert (R/'cycles/cycle-5/C5-SYNTHESIS/RETURN.json').is_file()
d=json.loads(raw);prior=json.loads(raw)['claims'];lookup={c['claim_key']:c for c in d['claims']}
assert len(prior)==428
for change in decision['promotions']:
 c=lookup[change['claim_key']];assert c['status']=='OPEN'
 for k in ['status','evidence_grade','formal_award','certificate']:c[k]=change[k]
 c.setdefault('terminal_history',[]).append({'run':R.name,'cycle':5,'date':'2026-09-26','event':change['event']})
new=json.loads((R/'control-proposals/C6-NEW-CLAIMS-DRAFT.json').read_text())
assert len(new)==3 and not ({c['claim_key'] for c in new}&set(lookup))
d['claims'].extend(new);d['last_updated']='2026-09-26'
d['update_note']=d.get('update_note','')+'; Cycle5 complete18/36/3/1; exact controller decisions reconciled; three heterogeneous candidate scopes registered OPEN before Cycle6; no new formal award.'
changed={c['claim_key'] for c in decision['promotions']}
for old,c in zip(prior,d['claims'][:len(prior)]):
 assert old['statement']==c['statement'] and old['scope']==c['scope']
 if c['claim_key'] not in changed:assert old==c
out=(json.dumps(d,indent=2,ensure_ascii=False)+'\n').encode()
ident=R/'control/C6-REGISTERED-CLAIM-IDENTITY.json';ledger=R/'ledgers/C6-OBLIGATIONS.csv'
assert not ident.exists() and not ledger.exists()
ident.write_bytes(out)
with ledger.open('x',newline='') as f:
 w=csv.DictWriter(f,fieldnames=['claim_id','status','registered_statement','registered_scope','evidence_grade']);w.writeheader()
 for c in d['claims']:w.writerow({'claim_id':c['claim_key'],'status':c['status'],'registered_statement':c['statement'],'registered_scope':c['scope'],'evidence_grade':c.get('evidence_grade','see_certificate')})
q=subprocess.run([sys.executable,str(V/'skills/mathematical-solver-dre-controller/scripts/lint_claim_status.py'),'--identity',str(ident),'--ledger',str(ledger),'--json'],capture_output=True,text=True)
(R/'receipts/C5-FINAL-REGISTRATION-LINT.json').write_text(q.stdout);assert q.returncode==0,q.stdout+q.stderr
lp=M/'LEDGER.md';oldtext=lp.read_text();start=oldtext.index('**Current orientation,');end=oldtext.index('\n\n',start)
counts={s:sum(c['status']==s for c in d['claims']) for s in ['VERIFIED','REFUTED','CONDITIONAL','OPEN']}
para='**Current orientation, 2026-09-26.** The registry has'+str(len(d['claims']))+' identities ('+', '.join(str(v)+' '+k for k,v in counts.items())+'), at mixed evidence grades. Lower-region Cycles1 through5 are complete, each18 searches/36 critics/3 adjudicators/1 synthesis. '+decision['orientation']+' Full ordinary lower-region aggregate, weighted two-for-one Hall, governed beta aggregate and Erdos993 remain OPEN. Code r29, four existing lower-region formal keys, census M(6)=22 and K1 closure x<=6 are preserved at their exact grades. Three heterogeneous scopes are registered OPEN for Cycle6. Cycle6 and final documentation/publication remain pending. Historical sections retain dated scopes and counts.'
updated=oldtext[:start]+para+oldtext[end:]
updated+='\n\n## Lower-region Cycle5 closeout, 2026-09-26\n\n'+decision['ledger_paragraph']+' See experiments/'+R.name+'/cycles/cycle-5/CONTROLLER-CLOSEOUT.md and control/C5-FINAL-DECISIONS.json. All earlier statement/scope fields and unrelated claims are unchanged. Three heterogeneous identities are OPEN at intake. No new Lean award.\n'
for rel,content in [('inputs/C5-FINAL-MASTER-BEFORE.json',raw),('inputs/C5-FINAL-LEDGER-BEFORE.md',oldtext.encode())]:
 target=R/rel;assert not target.exists();target.write_bytes(content)
assert p.read_bytes()==raw and lp.read_text()==oldtext,'Concurrent master change'
p.write_bytes(out);lp.write_text(updated)
receipt={'previous_count':len(prior),'current_count':len(d['claims']),'counts':counts,'before_sha256':hashlib.sha256(raw).hexdigest(),'after_sha256':hashlib.sha256(out).hexdigest(),'unchanged_prior_claim_objects':len(prior)-len(changed),'promoted_keys':sorted(changed),'new_open_keys':[c['claim_key'] for c in new],'formal_awards':[]}
(R/'receipts/C5-FINAL-REGISTRATION.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt))
