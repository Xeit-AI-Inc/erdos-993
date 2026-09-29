import hashlib,json
from pathlib import Path
B=Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
common=json.loads((B/'manifests/C6-COMMON-DISPATCH.json').read_text())['members']
packet=json.loads((B/'packets/C6-CT-U2.json').read_text())['allowed_source_files']
checked=[]
for group,items in [('common_dispatch',common),('packet_allowed_sources',packet)]:
  for item in items:
    got=hashlib.sha256((B/item['path']).read_bytes()).hexdigest()
    if got != item['sha256']:
      raise SystemExit(f"MISMATCH {group} {item['path']} expected={item['sha256']} actual={got}")
    checked.append((group,item['path']))
out={'common_members_checked':len(common),'packet_allowed_sources_checked':len(packet),'total_checks':len(checked),'mismatches':0,'result':'PASS'}
Path('hash-audit.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
