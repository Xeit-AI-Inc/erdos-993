"""Recheck sealed source, packet, and transport member bytes for this seat."""
import hashlib, json
from pathlib import Path

B=Path(__file__).resolve().parents[2]
checks={
    'common':'manifests/C3-COMMON-DISPATCH.json',
    'packet':'packets/C3-CU-T3.json',
    'transport_shared':'manifests/C3-TRANSPORT-CLARIFICATION.json',
    'transport_critique':'manifests/C3-CRITIQUE-TRANSPORT.json',
}
out={}
for name, manifest_path in checks.items():
    data=json.loads((B/manifest_path).read_text())
    members=data.get('members',data.get('allowed_source_files',[]))
    bad=[]
    for member in members:
        p=B/member['path']
        actual=hashlib.sha256(p.read_bytes()).hexdigest() if p.is_file() else 'MISSING'
        if actual!=member['sha256']:
            bad.append({'path':member['path'],'expected':member['sha256'],'actual':actual})
    out[name]={'manifest':manifest_path,'member_count':len(members),'mismatches':bad}
assert all(not x['mismatches'] for x in out.values()),out
Path(__file__).with_name('manifest_audit.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:{'member_count':v['member_count'],'mismatches':len(v['mismatches'])} for k,v in out.items()},indent=2))
