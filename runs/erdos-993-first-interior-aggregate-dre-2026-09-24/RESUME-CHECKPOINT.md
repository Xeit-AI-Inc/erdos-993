# Resume checkpoint — user-requested pause

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
