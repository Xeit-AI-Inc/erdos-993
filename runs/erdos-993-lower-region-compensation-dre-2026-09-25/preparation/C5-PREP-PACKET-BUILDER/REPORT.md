# Draft Cycle 5 intake builder

`build_intake.py` is a **draft staging tool**, not a dispatch command. It has not been run. It reads explicit approved C5 claim snapshots and admitted C4 adjudication/synthesis outputs; it writes only a fresh child directory here. Proposed `control/`, `ledgers/`, and `packets/` paths inside that child directory are canonical-shaped files for controller review and later installation. Existing files are never opened for writing, and all staged files use exclusive creation and read-only modes.

## Proposed invocation after the prerequisites below

```sh
B=/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25
python3 "$B/scratchpad/C5-PREP-PACKET-BUILDER/build_intake.py" \
  --run-root "$B" \
  --output-dir "$B/scratchpad/C5-PREP-PACKET-BUILDER/c5-intake-stage-01" \
  --current-identity control/C5-REGISTERED-CLAIM-IDENTITY.json \
  --current-ledger ledgers/C5-OBLIGATIONS.csv \
  --c4-closeout cycles/cycle-4/CONTROLLER-CLOSEOUT.md \
  --c4-at-dir cycles/cycle-4/C4-AT \
  --c4-af-dir cycles/cycle-4/C4-AF \
  --c4-au-dir cycles/cycle-4/C4-AU \
  --c4-synthesis-dir cycles/cycle-4/C4-SYNTHESIS
```

If the approved current snapshot uses different paths, replace only `--current-identity` and `--current-ledger` with those explicit root-relative paths. The builder checks all identity/ledger claim keys and statuses exactly, with no hard-coded 426/428 count. It requires both the ordinary lower-region aggregate and the `T_m` family key to remain `OPEN` at this intake. A new Cycle 4 refutation identity may therefore be present if separately validated and approved; the builder does not invent or register it.

## Prerequisites and output

* Finish, admit, and freeze `C4-AU`, `C4-SYNTHESIS`, and the Cycle 4 controller closeout. `C4-AT` and `C4-AF` are already admitted as of this draft. Their top-level returns and reports must be self-contained and remain `proposed_worker_only` in their own files; the approved identity/ledger snapshot is the sole current claim authority.
* Supply the approved current identity and obligations ledger after reconciliation with synthesis. The builder compares every claim status across them and refuses a mismatch. The command assumes their proposed C5 paths exist. No current snapshot has been selected by this draft.
* Retain the historical C4 common packet and listed C4 controls/evidence unchanged. The C5 common packet pins selected C4 historical controls, C4 correction audits, signed-map audit, the three C4 adjudication portfolios and C4 synthesis, the unawarded `T_m` central LC/LR candidates and exact bases, independent audit and Lean-readiness audit, the binomial-normalized ratio lead, heterogeneous star direction, and independent direction/matching-slack audit. It uses per-file SHA-256 values and labels source grades in `control/C5-INTAKE-SOURCE-INVENTORY.json`. The C4 common packet is pinned as provenance; its 179 source rows are not blindly copied into the new allowed list.

The staged bundle contains `control/C5-REGISTERED-CLAIM-IDENTITY.json`, `ledgers/C5-OBLIGATIONS.csv`, `control/C5-SEARCH-ALLOCATION.json`, `control/C5-WORKER-TOPOLOGY.json`, `control/C5-INTAKE-BRIEF.md`, `control/C5-INTAKE-SOURCE-INVENTORY.json`, and `packets/C5-COMMON.json`. It creates no worker case packet because source claim IDs and pinned dependencies only exist after prior-stage admission. Use `worker_ops.py` and controller admission/dispatch after controller review and installation.

The allocation source has six T, six F, and six U routes. T6, F6, and U6 are the three shell-focused seats. The topology stages are exactly 18 Luna high searches, 36 independently opposing Luna high critics, three Sol high adjudicators, and one Sol high synthesis, with at most three simultaneous worker seats. The builder copies route text from the existing C5 draft rather than editing mathematical questions.

## Decisions left to the controller

1. Reconcile the final C4 synthesis and any separately audited new refutation identities into the approved snapshot, then choose its exact two paths. This draft makes no mathematical award or status promotion.
2. Review source grades and staged content before installing any staged file. The computer-assisted all-`m` `T_m` argument remains a candidate for C5 challenge, and its Lean readiness report explicitly says no kernel verification exists. The ordinary original-leaf lower-region aggregate remains `OPEN`.
3. Decide whether to add further exact C4 portfolio support files beyond the top-level self-contained outputs. The present builder rejects nested worker-output directories and private transport sources. Any additional source should receive an explicit pin and grade before dispatch.

I checked the script's Python syntax with `ast.parse`; I did not execute the builder, launch workers, run Lean, contact the network, or modify a registry/canonical file.
