from pathlib import Path
from hashlib import sha256
import json
ROOT=Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
def manifest(rel):
    d=json.loads((ROOT/rel).read_text()); rows=[]
    for m in d['members']:
        p=ROOT/m['path']; h=sha256(p.read_bytes()).hexdigest()
        rows.append({'path':m['path'],'expected':m['sha256'],'actual':h,'match':h==m['sha256']})
    return {'manifest':rel,'members_checked':len(rows),'all_match':all(x['match'] for x in rows),'members':rows}
checks=[manifest(x) for x in ['manifests/C3-COMMON-DISPATCH.json','manifests/C3-TRANSPORT-CLARIFICATION.json','manifests/C3-CRITIQUE-TRANSPORT.json','manifests/C3-CT-U2-DISPATCH.json']]
packet=json.loads((ROOT/'packets/C3-CT-U2.json').read_text())
allowed=[]
for m in packet['allowed_source_files']:
    h=sha256((ROOT/m['path']).read_bytes()).hexdigest(); allowed.append({'path':m['path'],'expected':m['sha256'],'actual':h,'match':h==m['sha256']})
out={'manifests':checks,'packet_path':'packets/C3-CT-U2.json','packet_sha256':sha256((ROOT/'packets/C3-CT-U2.json').read_bytes()).hexdigest(),'allowed_source_files':allowed,'all_ok':all(c['all_match'] for c in checks) and all(x['match'] for x in allowed)}
Path('integrity_audit.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'manifest_member_counts':[c['members_checked'] for c in checks],'all_manifest_hashes_match':all(c['all_match'] for c in checks),'packet_sha256':out['packet_sha256'],'allowed_files_checked':len(allowed),'all_allowed_hashes_match':all(x['match'] for x in allowed)},indent=2))
