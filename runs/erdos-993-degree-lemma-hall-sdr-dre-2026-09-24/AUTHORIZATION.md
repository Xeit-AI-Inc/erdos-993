# Authorization — r28: the Hall/SDR route to a second, structural proof of the forest degree lemma

Run root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-degree-lemma-hall-sdr-dre-2026-09-24`
Run id (canonical, used in every seal and every governed Lean `init`):
`erdos-993-math-dre-20260924-r28-degree-lemma-hall-sdr`
Controller: Claude Fable 5.1 (xhigh), the DRE controller of r24 Cycles 5–6, r25, the r25 addendum, r26 and r27.
Authorized by: Ashton, 2026-09-24 ("If item 2 should be next, then you have full permission to apply our standard
DRE + Lean flow with the limit on six cycles, as before."), accepting the controller's recommendation 2 of the r27
close (carried verbatim in `control/R28-CHARTER-PROMPT.md`).

## Objective

Prove or refute the **leaf/slot dominance condition** (HS) named by r27 critic `C-T2-U` (Finding 6, Step C;
carried as OPEN through the r27 synthesis and second read SR-JOIN): for every finite tree `T` and every natural
`k`, with `c_v(k)` the number of independent `k`-sets containing `v`, `L` the leaves and `Br` the branch
vertices (`deg ≥ 3`), there is an injective assignment giving each branch vertex `v` exactly `deg(v) − 2`
distinct leaves `ℓ` with `c_ℓ(k) ≥ c_v(k)`. By Hall's theorem on the threshold bipartite graph this is the
**threshold form**: for every `t ≥ 1`, `Σ_{v∈Br : c_v(k) ≥ t} (deg v − 2) ≤ #{ℓ ∈ L : c_ℓ(k) ≥ t}`. Summing over
`t` (layer-cake) gives `Σ_{Br}(deg v − 2)·c_v(k) ≤ Σ_L c_ℓ(k)`, which is (DL) for trees by the r27 leaf/branch
reformulation (`E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`); the forest case follows by the r27
separated-union convolution (`E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION`). So (HS) is a STRICTLY STRONGER
statement than (DL) — a majorization of the branch-slot profile by the leaf profile — and a proof of it is a
second, structural proof of (DL) whose mechanism (a matching between branch slots and leaves) is closer to the
program's matching/cover technology than r27's injection. The pointwise form (`c_v ≤ c_ℓ` for every branch `v`
and leaf `ℓ`) is already REFUTED (`C-T2-U` Step D: order 5, `k = 3`), so any proof must use the matching.

If (HS) is proved: formalize it (Tier 1), the layer-cake reduction (HS ⇒ DL for trees), and the forest
composition, as governed Lean awards — the second formal proof of (DL) of record, independent of r27's
injection. If (HS) is refuted: register the counterexample with exact counts, determine the weakest
matching-type strengthening of (DL) that survives (weighted/fractional forms; restricted `k`-ranges;
`c`-threshold relaxations), and record the refutation as the run's result. Either outcome closes the item.

Out of scope: the aggregate `S(T,p)` at any rank (Codex's first-interior run owns `p = α − 2`); every
no-recovery statement; the asymptotic development; any re-proof of r27's awards (they are inputs of record,
not targets).

## Topology and model policy

Per cycle: 6 routes (T1–T2, F1–F2, U1–U2), 12 cross-orientation critics (two per route), 3 isolated
adjudicators, 1 neutral synthesis, governed Stage 7 when the synthesis names an award group; isolated second
reads before any STATED item is registered. Routes Claude Sonnet 5 xhigh; critics Claude Opus 5 medium;
adjudicators, synthesis, Stage 7 formalizer, informal auditor, fidelity reviewer and second readers Claude
Opus 5 high. (Opus 5.5 is not selectable through this session's agent transport.) The narrower seating
(6/12/3/1 rather than r27's 9/18/3/1) is the controller's recommendation accepted by Ashton: the target is one
named statement with one named mechanism.

## Cycles and stop rule

Up to six cycles. The run ENDS EARLY on (a) (HS) formally verified at the contract statement with the
reduction to (DL) checked formally, or (b) an in-scope counterexample to (HS) (a finite tree with exact
`c_v(k)` values violating the threshold form) confirmed by two independent instruments and an isolated
second read. Controller checkpoint after Cycle 3; final analysis at the close (`control/CONTROLLER-REVIEW-R28.md`).

## Standing rules (r27 lessons added)

- Run autonomously; report at gates; no permission asks mid-run.
- Sealed members are never edited after their seal; agents/dispatch records are sealed after their stage.
- No network and no package installs in any seat; Python standard library only; exact integers.
- Never `lake clean`, `lake update` or `elan`; the shared Mathlib packages tree is write-protected; a scratch
  Lean project binds the shared packages by MANUAL SYMLINK (`.lake/packages` → the shared packages directory);
  the governed `bind-shared-packages` tool is for `runs/` roots only.
- Kill by literal PID only; never a pattern kill; never a full process listing.
- Seat dispatch wrappers carry only the pointer to the sealed dispatch file.
- Interrupted agents are resumed by `SendMessage`, never re-spawned; a review round 2 resumes the same reviewer.
- **Residue check** (r27 lesson): every cloned control file is grepped for the predecessor's award ids,
  namespaces, source paths and date literals before its seal (`r28_tool.py residue-check`); the report is a
  Stage 2 member.
- **Publication count** (r27 lesson): the "prior objects" count is read from the master registry at
  publication time, never from the run-local snapshot (a sibling Codex run is active).
- A capsule that freezes sibling award runs declares their lifecycle drift expected at seal time.
- Frozen sources under `sources/` are read-only copies with digests in `control/SOURCE-DIGESTS.json`; the
  originals (the r25/r27 roots, the master ledger) are not written to.

## Publication at the close

As r24–r27: additive and scoped registration in the master registry/ledger and the public repo mirror
(formal awards as such; informal results with grade and attribution; the refutation, if that is the result,
with its exact witness). Under the standing r25 authorization for scoped terminal-close publication; reported
at the gate.
