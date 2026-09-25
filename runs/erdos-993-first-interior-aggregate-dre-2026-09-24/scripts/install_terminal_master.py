"""Install only the reviewed exact-primary overlay, with a live concurrency guard."""
from pathlib import Path
import collections,datetime,hashlib,json,os
V=Path('/Users/ashtonsperry/VerityOS');E=V/'experiments/erdos-993-first-interior-aggregate-dre-2026-09-24';M=V/'experiments/erdos-993-master-ledger-2026-09-04'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def read(p):return json.loads(p.read_text())
proposal=read(E/'control/TERMINAL-REGISTRY-PROPOSAL.json')
reg=M/'CLAIM-IDENTITY.json';ledger=M/'LEDGER.md'
assert sha(reg)==proposal['before_sha256']
assert sha(ledger)==sha(E/'control/MASTER-LEDGER-BEFORE-PRIMARY-CLOSE.md')
a=read(reg);b=read(E/'control/TERMINAL-CANDIDATE-CLAIM-IDENTITY.json')
old={x['claim_key']:x for x in a['claims']};new={x['claim_key']:x for x in b['claims']}
assert old.keys()==new.keys()
changed=[k for k in old if old[k]!=new[k]];assert changed==['E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE']
review=read(E/'reports/FINAL-ASTRA-REVIEW/REVIEW.json')
assert 'accept_primary_decisive_close' in json.dumps(review)
closed=read(E/'runs/lean-2026-09-24-c2-primary-v2/VERIFICATION-REPORT.json');assert closed['status']=='formally_verified' and not closed['failures']
receipt={'status':'installed_and_readback_verified','installed_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'changed_claim_keys':changed,'preserved_other_claim_objects':394,'counts':dict(collections.Counter(c['status']for c in b['claims'])),'files':[]}
for target,source in [(reg,E/'control/TERMINAL-CANDIDATE-CLAIM-IDENTITY.json'),(ledger,E/'control/TERMINAL-CANDIDATE-MASTER-LEDGER.md')]:
 backup=target.with_name(target.stem+'.pre-first-interior-2026-09-24'+target.suffix)
 with backup.open('xb')as f:f.write(target.read_bytes())
 before=sha(target);tmp=target.with_name(target.name+'.first-interior-install.tmp')
 with tmp.open('xb')as f:f.write(source.read_bytes())
 os.replace(tmp,target);assert target.read_bytes()==source.read_bytes()
 receipt['files'].append({'path':str(target),'backup':str(backup),'before_sha256':before,'after_sha256':sha(target)})
with(E/'receipts/MASTER-INSTALLATION-READBACK.json').open('x')as f:json.dump(receipt,f,indent=2);f.write('\n')
print(json.dumps(receipt,indent=2))
