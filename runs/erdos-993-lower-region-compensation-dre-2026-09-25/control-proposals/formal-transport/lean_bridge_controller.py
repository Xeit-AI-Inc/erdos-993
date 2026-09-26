"""Controller-owned exact Lean service; no arbitrary shell, file writes, or remote execution API."""
from pathlib import Path
import sys,json,re,subprocess,hashlib,time
B=Path(__file__).resolve().parents[2];w='C2-LA1-PRODUCER';S=B/'scratchpad'/w;Q=S/'bridge-requests';A=S/'bridge-replies';L=B/'control-proposals/formal-bridge';L.mkdir(exist_ok=False)
R='/Users/ashtonsperry/VerityOS/experiments/erdos-993-lower-region-compensation-dre-2026-09-25/runs/lean-2026-09-25-c2-order-bands'
SH='/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages/mathlib'
HEAD="from pathlib import Path\nimport json,subprocess,os,hashlib\nR=Path("+repr(R)+")\nSH=Path("+repr(SH)+")\n"
SSH=['ssh','-o','ControlPath=/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/g1.sock','-o','BatchMode=yes','mini-away','python3 -']
def serve(d):
 ident,op,arg=d['id'],d['op'],d['argument'];assert re.fullmatch(r'[a-zA-Z0-9_-]+',ident)
 assert isinstance(arg,str) and not Path(arg).is_absolute() and '..' not in Path(arg).parts
 code=HEAD
 if op=='read_mathlib':
  assert arg.startswith('Mathlib/') and arg.endswith('.lean')
  code+='p=SH/'+repr(arg)+'\nassert p.is_file() and p.resolve().is_relative_to(SH.resolve())\nprint(json.dumps({"path":'+repr(arg)+',"text":p.read_text(),"sha256":hashlib.sha256(p.read_bytes()).hexdigest()}))\n'
 elif op=='search_mathlib':
  assert arg.startswith('Mathlib') and len(d['text'])<=200
  code+='p=SH/'+repr(arg)+'\nassert p.exists() and p.resolve().is_relative_to(SH.resolve())\nneedle='+repr(d['text'])+'\nrows=[]\nfor f in ([p] if p.is_file() else p.rglob("*.lean")):\n for n,line in enumerate(f.read_text().splitlines(),1):\n  if needle in line:\n   rows.append({"path":str(f.relative_to(SH)),"line":n,"text":line})\n   if len(rows)>=80:break\n if len(rows)>=80:break\nprint(json.dumps({"matches":rows,"limit":80}))\n'
 elif op=='compile':
  p=S/arg;assert p.is_file() and p.resolve().is_relative_to(S.resolve()) and p.suffix=='.lean'
  raw=p.read_text();assert len(raw)<800000
  banned=r'\b(sorry|admit|axiom|native_decide|unsafe|run_cmd|run_elab|initialize)\b|#eval|IO\.|System\.|extern'
  assert not re.search(banned,raw),'Forbidden draft token; no compilation performed'
  imports=re.findall(r'^import\s+(.+)$',raw,re.M)
  assert imports and all(all(x=='Mathlib' or x.startswith('Mathlib.') or x=='LeanProof.FirstInteriorMain' for x in line.split()) for line in imports)
  (L/(ident+'.lean')).write_text(raw)
  code+='raw='+repr(raw)+'\np=R/"LeanProject/LeanProof/OrderBandDraft.lean"\np.write_text(raw)\narchive=R/"EVIDENCE/producer-drafts";archive.mkdir(exist_ok=True)\na=archive/'+repr(ident+'.lean')+'\nassert not a.exists();a.write_text(raw)\nbin=Path("/Users/ashtonsperry/.elan/toolchains/leanprover--lean4---v4.32.2/bin")\nassert (bin/"lake").exists()\nenv=dict(os.environ);env["PATH"]=str(bin)+":"+env.get("PATH","")\np=subprocess.run([str(bin/"lake"),"env","lean","LeanProof/OrderBandDraft.lean"],cwd=R/"LeanProject",env=env,text=True,capture_output=True,timeout=300)\nprint(json.dumps({"exit_code":p.returncode,"stdout":p.stdout,"stderr":p.stderr,"source_sha256":hashlib.sha256(raw.encode()).hexdigest()}))\n'
 else:raise ValueError('Unrecognized constrained operation')
 r=subprocess.run(SSH,input=code,text=True,capture_output=True,timeout=330)
 assert r.returncode==0,r.stderr
 return json.loads(r.stdout)
while not (S/'BRIDGE-STOP').exists():
 if Q.exists():
  for q in sorted(Q.glob('*.json')):
   a=A/q.name
   if a.exists():continue
   try:
    d=json.loads(q.read_text());assert d['id']+'.json'==q.name;result={'id':d['id'],'ok':True,'result':serve(d)}
   except Exception as e:result={'id':q.stem,'ok':False,'error':str(e)}
   A.mkdir(exist_ok=True);p=A/(q.stem+'.pending');p.write_text(json.dumps(result));p.rename(a)
   (L/(q.stem+'.json')).write_text(json.dumps({'request':json.loads(q.read_text()),'reply':result},indent=2)+'\n')
   print(json.dumps({'handled':q.stem,'ok':result['ok']}),flush=True)
 time.sleep(1)
print('Controller service stopped',flush=True)
