"""Run an explicit presealed same-stage batch, at most three fresh CLI workers.
No implicit retries, no case generation, admission, status awards or cycle advance.
"""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor,wait,FIRST_COMPLETED
import subprocess,sys,json
import worker_ops as W
B=Path(__file__).resolve().parents[1]
ids=sys.argv[1:]
if not ids or len(set(ids))!=len(ids):raise SystemExit('Need distinct explicit worker ids')
specs=[W.worker_spec(w) for w in ids]
assert len({(s[0],s[1]) for s in specs})==1,'Mixed cycle/stage batch forbidden'
for w in ids:
 W.verify(B,f'manifests/{w}-CASE-DISPATCH.json')
 assert not (B/'receipts'/f'{w}-TRANSPORT.json').exists(),'Existing transport; no implicit rerun'
 assert not (B/'scratchpad'/w/'RETURN.json').exists(),'Existing return'
def run(w):
 p=subprocess.run([sys.executable,str(B/'scripts/run_cli_worker.py'),w],capture_output=True,text=True)
 return {'worker':w,'exit_code':p.returncode,'stdout':p.stdout.strip(),'stderr':p.stderr[-3000:]}
failed=False;it=iter(ids)
with ThreadPoolExecutor(max_workers=3) as pool:
 pending={pool.submit(run,w):w for w in [next(it,None) for _ in range(min(3,len(ids)))] if w}
 while pending:
  done,_=wait(pending,return_when=FIRST_COMPLETED)
  for f in done:
   w=pending.pop(f)
   try:r=f.result()
   except Exception as e:r={'worker':w,'exit_code':1,'error':repr(e)}
   print(json.dumps(r),flush=True)
   if r['exit_code']:failed=True
  if not failed:
   for _ in range(3-len(pending)):
    w=next(it,None)
    if w is not None:pending[pool.submit(run,w)]=w
if failed:raise SystemExit('Queue stopped new launches after failure; inspect completed receipts')
