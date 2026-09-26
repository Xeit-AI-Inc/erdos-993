"""One explicit fresh Sol-high preparation/review seat. No admissions or awards."""
from pathlib import Path
import sys,json,hashlib,subprocess
B=Path(__file__).resolve().parents[1]
brief=B/sys.argv[1]
d=json.loads(brief.read_text());wid=d['worker_id']
assert d['model']=='gpt-6-sol' and d['reasoning_effort']=='high'
scratch=B/'scratchpad'/wid
assert scratch.is_dir() and not (scratch/'RESULTS.json').exists()
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
for row in d['allowed_source_files']:assert sha(B/row['path'])==row['sha256']
prompt=f'''Fresh isolated Sol high seat {wid}. Read the exact brief {brief} first and verify its source hashes. Read ONLY its listed source files and your own scratch. Your writable scratch is {scratch}. Follow its concrete bounded task, with independent mathematical reasoning and explicit limitations. No other agents, raw transport logs, unrelated tasks, directory browsing, source edits, registry changes, self-awards, model or CLI configuration changes. Write REPORT.md and RESULTS.json plus any requested evidence solely in your scratch. Every statement remains a proposal to the controller. Finish your foreground processes and exit after producing the bounded result.'''
log=B/'control-proposals/transport'/wid;log.mkdir(parents=True,exist_ok=False)
(log/'PROMPT.txt').write_text(prompt)
args=['/Applications/ChatGPT.app/Contents/Resources/codex','exec','--ephemeral','--skip-git-repo-check','--sandbox','workspace-write','-m','gpt-6-sol','-c','model_reasoning_effort="high"','-c','approval_policy="never"','--json','-C',str(scratch),'-']
with (log/'stdout.jsonl').open('w') as out,(log/'stderr.txt').open('w') as err:
    p=subprocess.run(args,input=prompt,text=True,stdout=out,stderr=err)
receipt={'worker_id':wid,'transport':'fresh ephemeral codex exec','requested_model':'gpt-6-sol','reasoning_effort':'high','exit_code':p.returncode,'return_exists':(scratch/'RESULTS.json').is_file(),'brief_sha256':sha(brief),'prompt_sha256':sha(log/'PROMPT.txt'),'stdout_sha256':sha(log/'stdout.jsonl'),'status_authority':'controller transport observation only'}
with (B/'receipts'/f'{wid}-TRANSPORT.json').open('x') as f:json.dump(receipt,f,indent=2)
for row in d['allowed_source_files']:assert sha(B/row['path'])==row['sha256'],'Source mutated'
print(json.dumps(receipt),flush=True)
sys.exit(p.returncode or (0 if receipt['return_exists'] else 1))
