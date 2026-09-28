from pathlib import Path
import hashlib,json
B=Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
checks=[]
for mf in ('manifests/C3-COMMON-DISPATCH.json','manifests/C3-TRANSPORT-CLARIFICATION.json','manifests/C3-CRITIQUE-TRANSPORT.json'):
 d=json.loads((B/mf).read_text())
 for member in d['members']:
  p=B/member['path']; got=hashlib.sha256(p.read_bytes()).hexdigest()
  checks.append({'manifest':mf,'path':member['path'],'expected':member['sha256'],'actual':got,'match':got==member['sha256']})
pkt=json.loads((B/'packets/C3-CF-T3.json').read_text())
for member in pkt['allowed_source_files']:
 p=B/member['path'];got=hashlib.sha256(p.read_bytes()).hexdigest()
 checks.append({'manifest':'packets/C3-CF-T3.json','path':member['path'],'expected':member['sha256'],'actual':got,'match':got==member['sha256']})
out={'scope':'Read-only SHA-256 verification of authorized common, transport, critique-transport, and packet members.','members_checked':len(checks),'all_match':all(x['match'] for x in checks),'checks':checks}
Path('manifest_audit.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'members_checked':len(checks),'all_match':out['all_match']}))
if not out['all_match']: raise SystemExit(1)
