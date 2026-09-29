"""Transport-only frozen-source runner. Does not certify mathematical results.
Interface: python runner.py source.py fresh-run-directory --max-m 99
Census source must accept --min-m N --max-m N --output ABS_JSON and use stdlib only.
Use only under the frozen final C6 prefix protocol; transport evidence is not a mathematical award.
"""
from pathlib import Path
import argparse,hashlib,json,os,platform,signal,subprocess,sys,time

def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def stop_child(p):
 if p.poll() is not None:return p.returncode
 try:os.killpg(p.pid,signal.SIGTERM)
 except ProcessLookupError:pass
 try:return p.wait(timeout=5)
 except subprocess.TimeoutExpired:
  try:os.killpg(p.pid,signal.SIGKILL)
  except ProcessLookupError:pass
  return p.wait()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('source',type=Path);ap.add_argument('run_dir',type=Path);ap.add_argument('--min-m',type=int,default=1);ap.add_argument('--max-m',type=int,default=99);ap.add_argument('--timeout',type=int,default=1800);a=ap.parse_args()
 assert 1<=a.min_m<=a.max_m<=99 and 1<=a.timeout<=1800
 src=a.source.resolve();assert src.is_file() and src.suffix=='.py'
 d=a.run_dir.resolve();d.mkdir(exist_ok=False)
 frozen=d/'frozen-census-source.py';frozen.write_bytes(src.read_bytes());frozen.chmod(0o444)
 result=d/'RESULT.json';cmd=[sys.executable,str(frozen),'--min-m',str(a.min_m),'--max-m',str(a.max_m),'--output',str(result)]
 receipt={'kind':'instrument transport only, no mathematical award','source_original':str(src),'source_frozen':str(frozen),'source_sha256_before':sha(frozen),'source_original_sha256_before':sha(src),'runner_sha256':sha(Path(__file__).resolve()),'argv':cmd,'min_m':a.min_m,'max_m':a.max_m,'timeout_seconds':a.timeout,'python_executable':sys.executable,'python_version':sys.version,'platform':platform.platform(),'started_at_utc':time.strftime('%Y-%m-%dT%H:%M:%SZ',time.gmtime())}
 (d/'START.json').write_text(json.dumps(receipt,indent=2)+'\n')
 started=time.monotonic();timed_out=False
 with (d/'stdout.txt').open('x')as out,(d/'stderr.txt').open('x')as err:
  p=subprocess.Popen(cmd,cwd=d,stdout=out,stderr=err,start_new_session=True,env={**os.environ,'PYTHONDONTWRITEBYTECODE':'1'})
  try:
   try:code=p.wait(timeout=a.timeout)
   except subprocess.TimeoutExpired:
    timed_out=True;code=stop_child(p)
  except BaseException:
   stop_child(p)
   raise
 receipt.update(elapsed_seconds=time.monotonic()-started,exit_code=code,timed_out=timed_out,source_sha256_after=sha(frozen),result_present=result.is_file())
 receipt['source_original_sha256_after']=sha(src) if src.is_file() else None
 receipt['source_unchanged']=(receipt['source_sha256_before']==receipt['source_sha256_after']==receipt['source_original_sha256_before']==receipt['source_original_sha256_after'])
 if result.is_file():receipt['result_sha256']=sha(result)
 (d/'TRANSPORT-RECEIPT.json').write_text(json.dumps(receipt,indent=2)+'\n')
 print(json.dumps(receipt))
 # Exit zero is transport success only. Result schema and exact coverage need separate review.
 return 0 if code==0 and not timed_out and receipt['source_unchanged'] and result.is_file() else 2
if __name__=='__main__':sys.exit(main())
