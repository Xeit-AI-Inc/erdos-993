from pathlib import Path
import subprocess,json
code="from pathlib import Path\nimport json,hashlib\np=Path('/Users/ashtonsperry/VerityOS/experiments/erdos-993-lower-region-compensation-dre-2026-09-25/runs/lean-2026-09-25-c2-order-bands/THEOREM-CONTRACT.yaml')\nd=json.loads(p.read_text())\nprint(json.dumps({'contract_id':d['contract_id'],'declaration':d['lean_binding']['declaration_name'],'sha256':hashlib.sha256(p.read_bytes()).hexdigest()}))\n"
r=subprocess.run(['ssh','-o','ControlPath=/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/g1.sock','-o','BatchMode=yes','mini-away','python3 -'],input=code,text=True,capture_output=True)
print(r.stdout);print(r.stderr);raise SystemExit(r.returncode)
