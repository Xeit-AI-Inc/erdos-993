from pathlib import Path
import hashlib,json
B=Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
checks=[]
for mf in ['manifests/C3-COMMON-DISPATCH.json','manifests/C3-TRANSPORT-CLARIFICATION.json','manifests/C3-CRITIQUE-TRANSPORT.json']:
 d=json.loads((B/mf).read_text())
 for x in d['members']:
  p=B/x['path']
  got=hashlib.sha256(p.read_bytes()).hexdigest()
  checks.append({'manifest':mf,'path':x['path'],'expected':x['sha256'],'actual':got,'match':got==x['sha256']})
packet=json.loads((B/'packets/C3-CF-U2.json').read_text())
for x in packet['allowed_source_files']:
 p=B/x['path'];got=hashlib.sha256(p.read_bytes()).hexdigest()
 checks.append({'manifest':'packets/C3-CF-U2.json','path':x['path'],'expected':x['sha256'],'actual':got,'match':got==x['sha256']})
out={'checked':len(checks),'mismatches':[x for x in checks if not x['match']],'all_match':all(x['match'] for x in checks),'common_count':sum(x['manifest'].endswith('C3-COMMON-DISPATCH.json') for x in checks),'transport_counts':{n:sum(x['manifest'].endswith(n) for x in checks) for n in ['C3-TRANSPORT-CLARIFICATION.json','C3-CRITIQUE-TRANSPORT.json']},'packet_allowed_count':len(packet['allowed_source_files'])}
Path('manifest_audit.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
