"""Controller launcher for one fresh ephemeral worker; no admission or awards."""
from pathlib import Path
import json,subprocess,sys,hashlib
import worker_ops as W
B=Path(__file__).resolve().parents[1]
attempt=sys.argv[2] if len(sys.argv)>2 else 'RESUME-A1'
wid=sys.argv[1];cycle,stage,ori,_=W.worker_spec(wid)
case=W.load_json(B/'packets'/f'{wid}.json');assert case['worker_id']==wid
scratch=B/'scratchpad'/wid
if (scratch/'RETURN.json').exists():raise RuntimeError('Existing return; no implicit resume or rerun')
logs=B/'control-proposals/transport'/(wid+'-'+attempt);logs.mkdir(parents=True,exist_ok=False)
model=W.model_for_stage(stage)
role={'search':'Independently investigate your exact allocated route; broad concrete mathematics with explicit gaps, not a generic survey.', 'critique':'Independently audit every case-listed route claim from your assigned opposing orientation. Test proof gaps, exact scope, arithmetic, standing controls, realizability and usefulness. Dispositions retained/retained_narrowed/rejected; proposed status only.', 'adjudication':'Neutrally adjudicate the six source routes and twelve critics in your case. Dispose of EVERY source claim. Resolve disputes by evidence, not votes. Carry complete exact statements, proof sketches, scopes, dependencies and limitations into self-contained top-level outputs; synthesis cannot reopen sources.', 'synthesis':'Neutral synthesis. Read ONLY the THREE adjudicator outputs listed in your case plus permitted common control inputs. Never read raw routes, critics, inventories or controller research notes. Dispose of every source claim; propose exact scoped conclusions and next steps without self-awards.'}[stage]
prompt=f'''Fresh isolated DRE seat {wid}, stage {stage}, orientation {ori}. Root B={B}. Your absolute writable scratch root is {scratch}.
Read B/packets/{wid}.json and B/packets/C{cycle}-COMMON.json first. Verify their listed source hashes; read common read_first files and WORKER-PROTOCOL.md. Read only listed common sources and exact case-listed worker files; no directory browsing, other workers, controller notes, raw histories, memory, or unlisted research files. Hash verification may read listed common members without treating other file contents as new premises.
{role}
'''
prompt+='For Python computation on this host, use /Library/Frameworks/Python.framework/Versions/3.11/bin/python3; the default python shim may invoke an Xcode license prompt. A failed shim invocation is a transport limitation, not a mathematical counterexample. Common source pins are authorized reference material: inspect the exact source-map paths relevant to your task before claiming a graph, theorem or relation is unavailable. Explicitly distinguish a mathematical defect from a review you did not perform.\n'
if stage=='critique' and wid in ('C6-CF-T6','C6-CU-T6'):
    prompt+='Your case also contains explicitly root-origin spider appendices added only after the producer finished. Independently audit the elementary coefficient proof, exact graph/selector bridge, and alternative injection, keeping root provenance separate from producer findings. Include a disposition for each candidate identity C6-ROOT-SPIDER-EXACT-MODE and C6-ROOT-SPIDER-LOWER-REGION-AGGREGATE as derived claims in claims; covered_claim_ids must still equal the original case-required list. Do not award by authority or census; identify any gaps, endpoints, errors, and literature scope. Preserve every original producer claim and its disposition. The appendix index explains the proposed exact scopes.\n'
if stage=='search':prompt+=f'Read your {ori}{wid[-1]} lens in the common allocation document. Public primary mathematical literature and modest exact foreground computation permitted with exact scopes. No universal conclusion from a census.\n'
if stage=='critique':prompt+=f'Read B/control/C{cycle}-CRITIC-BRIEF.md as additional allowed control. Execute source replay only from copies in your own scratch; never rewrite sealed evidence.\n'
prompt+=f'''Write REPORT.md, RETURN.json and evidence ONLY directly under your assigned scratch root. In RETURN.json use logical FINAL paths cycles/cycle-{cycle}/{wid}/... (controller later copies), exact protocol schema and proposed_worker_only authority; stage={stage}, orientation={ori}. Every review must cover exactly required_covered_claim_ids and give each a disposition. All evidence must belong to your final worker directory. Top-level files only for adjudication. No extra agents, Lean builds, background jobs, model changes, registry edits, or authoritative awards. Finish all processes before final. Record limitations honestly. Do not use this task to alter the CLI, app, settings, tools, or transport. Perform the substantive bounded assigned mathematical work and finish the required files.'''
(logs/'PROMPT.txt').write_text(prompt)
cmd=['/Applications/ChatGPT.app/Contents/Resources/codex-cli/CodexCLI.app/Contents/MacOS/codex','exec','--ephemeral','--skip-git-repo-check','--sandbox','workspace-write','-m',model,'-c','model_reasoning_effort="high"','-c','approval_policy="never"','--json','-C',str(scratch),'-']
(logs/'COMMAND.json').write_text(json.dumps(cmd,indent=2)+'\n')
with (logs/'stdout.jsonl').open('w') as out,(logs/'stderr.txt').open('w') as err:
 result=subprocess.run(cmd,input=prompt,text=True,stdout=out,stderr=err)
receipt={'worker_id':wid,'transport':'fresh ephemeral codex exec','requested_model':model,'reasoning_effort':'high','exit_code':result.returncode,'return_exists':(scratch/'RETURN.json').is_file(),'prompt_sha256':hashlib.sha256(prompt.encode()).hexdigest(),'stdout_sha256':hashlib.sha256((logs/'stdout.jsonl').read_bytes()).hexdigest(),'status_authority':'controller transport observation only'}
(B/'receipts'/f'{wid}-{attempt}-TRANSPORT.json').write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps(receipt),flush=True)
if result.returncode:raise SystemExit(result.returncode)
