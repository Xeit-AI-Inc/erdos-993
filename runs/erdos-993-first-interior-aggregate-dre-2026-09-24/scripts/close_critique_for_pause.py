"""Controller checkpoint at the user-requested C2 critique boundary. Run once."""
from pathlib import Path
import importlib.util, json
B=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('ops',B/'scripts/controller_ops_v4.py')
O=importlib.util.module_from_spec(spec);spec.loader.exec_module(O)
searches=[f'C2-{o}{j}' for o in 'TFU' for j in range(1,4)]
critics=[f'C2-C{c}-{o}{j}' for o in 'TFU' for j in range(1,4) for c in 'TFU' if c!=o]
adjud=['C2-AT','C2-AF']
for w in searches+critics+adjud:
 O.W.verify(B,f'manifests/{w}.json')
 ret=json.loads((B/'cycles/cycle-2'/w/'RETURN.json').read_text())
 assert ret['worker_id']==w and ret['status_authority']=='proposed_worker_only'
for w in ['C2-AU','C2-SYNTHESIS']:
 assert not (B/'cycles/cycle-2'/w).exists(),f'Unexpected next-stage completion: {w}'
O.gates('C2-ALL-CRITIQUES')
files=[str(p.relative_to(B)) for w in critics for p in sorted((B/'cycles/cycle-2'/w).rglob('*')) if p.is_file()]
O.W.seal(B,files+['receipts/C2-ALL-CRITIQUES-lint.json','receipts/C2-ALL-CRITIQUES-paths.json'],'manifests/C2-ALL-CRITIQUES.json')
state=json.loads((B/'control/RUN-STATE.json').read_text())
state.update(status='paused_by_user',cycle=2,completed_cycles=1,search_seats_dispatched=9,search_seats_complete=9,critics_dispatched=18,critics_complete=18,adjudicators_dispatched=2,adjudicators_complete=2,syntheses_dispatched=0,syntheses_complete=0,primary_status='OPEN',pause_requested=True,resume_requires='Explicit user instruction after desktop app reboot',next_stage='C2-AU neutral adjudication, then C2-SYNTHESIS; only after explicit resume')
(B/'control/RUN-STATE.json').write_text(json.dumps(state,indent=2)+'\n')
checkpoint={'schema':'e993.user-pause-checkpoint.v1','status':'paused_by_user','cycle':2,'boundary':'All 18 critiques complete, admitted and sealed; already running adjudications C2-AT and C2-AF also complete','completed_searches':searches,'completed_critiques':critics,'completed_adjudications':adjud,'pending':['C2-AU','C2-SYNTHESIS','exact governed Lean gate if synthesis selects closed candidate','remaining authorized cycles if needed','Astra high C3 checkpoint if C3 reached','Astra high final review'],'primary_status':'OPEN','formal_gate_started':False,'resume_requires_explicit_user':True,'registry_snapshot':'control/C2-REGISTERED-CLAIM-IDENTITY.json','registry_claim_count':395,'registry_last_verified_sha256':'785dd4b12504a0f5a2aa66b84266cb313da80c0b28a27b2d96318a78ad3c8fdb','public_head_last_verified':'8f1573372c9135b970300a3ec0aa38a95ecc55ce','models':{'search':'gpt-6-luna high','critique_adjudication_synthesis_and_lean_roles':'gpt-6-sol high','checkpoint_and_final_controller':'gpt-6-astra high'},'max_cycles':6,'concurrency_total_including_root':4}
O.W.fresh_json(B,'control/C2-PAUSED-AT-CRITIQUE-CLOSE.json',checkpoint)
text='''# Resume checkpoint — user-requested pause

**PAUSED. Do not resume work until the user explicitly asks.** The user is rebooting the desktop app. This is the end of the Cycle 2 critique stage, not the end of Cycle 2 or the experiment.

## Completed and pending
- Cycle 1: complete, 9 searches / 18 critiques / 3 adjudications / 1 synthesis; primary remained OPEN.
- Cycle 2: all 9 Luna-high searches and all 18 Sol-high critiques complete, admitted and sealed. Neutral Sol-high adjudications C2-AT and C2-AF, which were already running, are also complete and sealed.
- C2-AU and C2-SYNTHESIS have not been dispatched. No new Lean gate has begun. All new mathematics is proposed/informal; the primary and three auxiliaries remain OPEN in the canonical registry.
- No Cycle 3 work, final award or new publication has occurred. Maximum six cycles, with Astra-high independent controller review at C3 close and final Astra-high review at C6 or earlier verified decisive resolution.

## Exact target and current mathematical progress
Primary: E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE. For every finite ordinary connected acyclic simple graph T, integer p=alpha(T)-2, strict first-negative-difference index x(T), assume x(T)+2<=p. With every original leaf tag v, original support s, H_v=T-{v,s}, R_v=T-N_T[s], and F_p={v original leaf: Delta_p(T-v)<0}, prove the COMPLETE sum of Delta_(p-1)(H_v)-Delta_(p-1)(R_v) over F_p is <=0. No residual hypothesis; no support-image replacement; coefficients are zero-extended and differences are integers.

Several searches and critiques give a complete informal proof, reconciled self-contained in cycles/cycle-2/C2-AT/REPORT.md and C2-AF/REPORT.md:
1. For finite bipartite H, W subset vertices, q_j counts independent j-sets meeting W. Count tag-preserving deletions/extensions to show k*q_(k+1)<=2*(alpha(H)-k)*q_k for 1<=k<=alpha(H).
2. For a leaf deletion, R=H-W and alpha(H)<=alpha(T)-1. Therefore each original-leaf term is <=0 when 3p>=2alpha(T)+1; handle p=1 separately and zero ranks above alpha(H).
3. Eligibility implies alpha(T)>=7. Standalone proof uses exact tree pair/triple counts, then one-/two-vertex covers at orders 7/8. An alternative uses Code r27 n<=4x to reduce to those orders. No finite census substitutes for the general argument.
4. At p=alpha-2, alpha>=7 gives the high-tail guard, so every leaf term is <=0 and the exact favorable subset sum follows.
This is only the first-interior slice. All-rank ordinary aggregate, governed RTree beta aggregate, transport and Erdős #993 remain open.

Known reporting corrections are preserved in critiques: F2's boundary K1,6 has i1=7, not 6; U2's cited order-7 nonresidual example is order 10 with alpha7. C2-U3's final chat truncated its complete sum; its sealed report/JSON correctly give -365305950 for T300/order1203. Use sealed evidence, not final-chat numerical summaries. Root observations and future-deficit/Lean assembly notes in control/ are excluded from current worker mathematical authority.

## Resume sequence — only after explicit user resume
1. Read control/RUN-STATE.json, control/C2-PAUSED-AT-CRITIQUE-CLOSE.json, both contracts, WORKER-PROTOCOL.md and packets/C2-REVIEW-PROTOCOL-v2.md. Verify all seals using scripts/controller_ops_v4.py verify. The current authority is the versioned 395-claim C2 snapshot and ledgers/C2-OBLIGATIONS.csv; do not rewrite the frozen C1 371-claim files.
2. Use controller_ops_v4.py case C2-AU C2-AU to prepare the U-origin adjudication case. Spawn a fresh gpt-6-sol/high agent with fork_turns none; only its three U origins/six critiques and pinned common authority via packets/C2-T1-v2.json. Exact return coverage and full self-contained proof are required.
3. After completed status, admit C2-AU. Prepare and dispatch C2-SYNTHESIS to a fresh Sol-high agent. Synthesis sees ONLY the three sealed adjudications and semantic/solution/protocol control documents, never raw searches/critiques/common historical mathematics/controller notes.
4. If synthesis closes a candidate, run the governed proof-integrity audit + theorem-contract + Lean formalization + kernel + independent fidelity gates. Distinct Sol-high producer, informal auditor and fidelity auditor; canonical receipts come from tools. Exact contract unchanged; no stronger hypothesis to ease compilation. Otherwise next DRE cycle under the same primary.
5. Preserve external ledger changes. Registry last read: 395 claims, SHA 785dd4b12504a0f5a2aa66b84266cb313da80c0b28a27b2d96318a78ad3c8fdb; public HEAD 8f1573372c9135b970300a3ec0aa38a95ecc55ce. Root added three OPEN auxiliary identities with lint passing, but has not published this experiment to GitHub. Prior authorization to update the master ledger/repository persists for terminal work.

## Paths, tools and connectivity
Local run root: /Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-first-interior-aggregate-dre-2026-09-24
Remote run root: /Users/ashtonsperry/VerityOS/experiments/erdos-993-first-interior-aggregate-dre-2026-09-24
Remote VerityOS: /Users/ashtonsperry/VerityOS
Remote public repo: /Users/ashtonsperry/Projects/XeitAI/erdos-993
Remote master: /Users/ashtonsperry/VerityOS/experiments/erdos-993-master-ledger-2026-09-04
SSH alias: mini-away. Control socket: /Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/g1.sock. A foreground master session was needed; auto-backgrounded masters disappeared after shell cleanup. After reboot, establish `ssh -M -N -o BatchMode=yes -o ConnectTimeout=20 -o ServerAliveInterval=30 -o ServerAliveCountMax=3 -o ControlPersist=no -S <socket> mini-away` in a persistent exec session, then use work/g1-dre-preparation/remote.py. That helper prepends R pointing to an OLD experiment: always define the current run explicitly and NEVER write its default R.

scripts/sync_admitted.py copies only sealed files/manifests plus living state, verifies matching existing remote bytes, and does not publish Git. Local Git is blocked by the Xcode license; remote Git works. Do not accept changed host keys or bypass authentication. No tool permissions were needed.

Lean shared read-only project: /Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project; toolchain leanprover/lean4:v4.32.2; Mathlib 905b95818eb32af7874a58b427f50c1711a5e96c. Never lake clean/update or copy shared packages. Read governance/skills/lean-proof-workflow/skill.md and component skills. Run copied-package audit before the wave; tool-generated bind/verify receipts mandatory. Existing r25/r27 packages share duplicate G1 definitions and must be deliberately assembled with semantic equality checks; r26 C4/C5 definitions provide the exact original-tag aggregate but its old theorem is top-rank/residual and cannot prove this target.

All DRE workers are finished at this pause boundary. Await the user's explicit resume.
'''
with (B/'RESUME-CHECKPOINT.md').open('x') as f:f.write(text)
O.W.seal(B,['RESUME-CHECKPOINT.md','control/C2-PAUSED-AT-CRITIQUE-CLOSE.json','control/USER-PAUSE-REQUEST.md','scripts/close_critique_for_pause.py'],'manifests/C2-USER-PAUSE-CHECKPOINT.json')
print(json.dumps({'status':'paused_by_user','cycle':2,'searches':9,'critiques':18,'adjudications':2,'primary':'OPEN'}))
