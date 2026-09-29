"""Check the sealed C5 common-dispatch and packet source byte hashes."""
import hashlib, json, pathlib
B=pathlib.Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
manifest=json.loads((B/'manifests/C5-COMMON-DISPATCH.json').read_text())
packet=json.loads((B/'packets/C5-CF-T1.json').read_text())
def check(items):
    mismatches=[]
    for item in items:
        actual=hashlib.sha256((B/item['path']).read_bytes()).hexdigest()
        if actual!=item['sha256']:
            mismatches.append({'path':item['path'],'expected':item['sha256'],'actual':actual})
    return {'checked':len(items),'mismatches':mismatches}
print(json.dumps({'common_dispatch':check(manifest['members']),
                  'packet_allowed_sources':check(packet['allowed_source_files'])},indent=2))
