# Authorization — r27: audit and formalize the finite forest degree/extension inequality

Run root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-forest-degree-extension-dre-2026-09-24`
Run id (canonical, used in every seal and every governed Lean `init`):
`erdos-993-math-dre-20260924-r27-forest-degree-extension`
Controller: Claude Fable 5.1 (xhigh), the DRE controller of r24 Cycles 5–6, r25, the r25 addendum and r26.
Authorized by: Ashton, 2026-09-24 ("Go ahead a run this new experiment attached. You can follow our DRE + Lean
format and up to 6 cycles."; the attached review-and-recommendation carried verbatim in
`control/R27-CHARTER-PROMPT.md`).

## Objective (from the charter)

Audit and formalize the finite forest degree/extension inequality of Fang–Lu–Nevo–Yao–Zheng
(arXiv:2609.20961v1, §8): for every finite forest `F` of order `n` and every natural `k`,
`(k+1)·i_{k+1}(F) ≥ (n − 3k)·i_k(F)` (signed), whose key ingredient is the degree lemma
`Σ_{J independent, |J|=k} Σ_{v∈J} deg_F(v) ≤ 2k·i_k(F)`; derive the linear descent-order bound
`Δ_k(F) < 0 ⇒ n ≤ 4k`, the rank-5 consequence `n ≥ 21 ⇒ Δ_5(F) ≥ 0`, the restriction
`x(F) < r ⇒ n ≤ 4r − 4` (hence `d ≤ 2r − 4` for `n = 2r + d`); reconstruct the r25 isolated-vertex-addition
(`K₁`-addition) claim and its order-≤21 evidence and determine the strongest valid composition once the
rank-5 residue (orders 22–25) is removed — without promoting a composition that depends on informal or
finite-computation evidence to the formal grade. Everything at exact ordinary-forest definitions with
explicit source attribution; the external source is audited and ported or re-proved locally, never
imported as an accepted theorem, and the project's toolchain is never upgraded. Out of scope: the asymptotic
`N₀`, the CLT/analytic development, any no-recovery claim (the contrapositive has sign `Δ_k ≥ 0`).

## Topology and model policy (r26 policy carried forward under "our DRE + Lean format")

Per cycle: 9 routes (T1–T3, F1–F3, U1–U3), 18 cross-orientation critics, 3 isolated adjudicators, 1 neutral
synthesis, governed Stage 7 when the synthesis names an award group. Routes Claude Sonnet 5 xhigh; critics
Claude Opus 5 medium; adjudicators, synthesis, Stage 7 formalizer, informal auditor and fidelity reviewer
Claude Opus 5 high. (Opus 5.5 is not selectable through this session's agent transport; every Opus seat is
Opus 5.)

## Cycles and stop rule

Up to six cycles. The run ENDS EARLY on the charter's success event: the universal finite inequality
formally verified at exact ordinary-forest definitions, its linear bound checked, and the rank-5 residue
closed out dependency by dependency — or on an in-scope counterexample to the inequality (a finite forest,
with its exact counts, violating `(k+1)i_{k+1} ≥ (n−3k)i_k`). Controller checkpoint after Cycle 3 if the run
reaches it; final analysis at the close (`control/CONTROLLER-REVIEW-R27.md`).

## Standing rules (unchanged; r26 lessons added)

- Run autonomously; report at gates; no permission asks mid-run.
- Sealed members are never edited after their seal; agents/dispatch records are sealed after their stage.
- No network and no package installs in any seat; Python standard library only; exact integers.
- Never `lake clean`, `lake update` or `elan`; the shared Mathlib packages tree is write-protected by
  design; a scratch Lean project binds the shared packages by MANUAL SYMLINK (`.lake/packages` → the shared
  packages directory; nothing copied) — the governed `bind-shared-packages` tool is for `runs/` roots only
  (r26 erratum R26-E-a). The external project's toolchain (Lean 4.29.1) is never installed; its source is
  read, audited and, where useful, transcribed into a project pinned at the run's toolchain.
- Kill by literal PID only; never a pattern kill; never a full process listing (r26 incident R26-I-1).
- Seat dispatch wrappers carry only the pointer to the sealed dispatch file (r26 note R26-N-13).
- Interrupted agents are resumed by `SendMessage`, never re-spawned.
- Frozen sources under `sources/` are read-only copies with digests in `control/SOURCE-DIGESTS.json`; the
  originals (the r25/r26 roots, the master ledger, the research packet, the external project copy) are not
  written to.

## Publication at the close

As at the r24/r25/r26 closes: master registry and ledger updated additively and scoped; public repository
mirror (`Xeit-AI-Inc/erdos-993`) with the Lean packages, experiment page, verification record and mirrored
records; formally verified awards published as such; informal results with grade and attribution on their
face; no status transfer to any headline. External attribution on every face: Fang, Lu, Nevo, Yao, Zheng
(2026) for the degree lemma and the coefficient inequality; the public Lean project
`junwei-lu/Erdos_993_Tree_Independent_Set_Unimodality` at `b2a1d3ede8aef259b1de6e319e7fd6cb56481ac1`
for any transcribed proof structure (its license, if any, is recorded in `control/SOURCE-DIGESTS.json`; the
audit copy carries none, so no external Lean text is published by this run — only the run's own source).
