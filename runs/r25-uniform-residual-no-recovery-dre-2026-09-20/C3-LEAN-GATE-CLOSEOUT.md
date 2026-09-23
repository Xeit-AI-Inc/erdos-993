# Cycle 3 Lean Gate Closeout (r25)

Date: 2026-09-21 (controller: Claude Fable 5.1). Final.

## Terminal Award State

Stage 7 attempted exactly the one award group named by the admitted Cycle 3
synthesis (`cycles/cycle-3/stage6/SYNTHESIS.md`, SHA-256 `3678ec24389eff522dda25489cfa04d691024de322d87cb289ed4660abb88ccf`,
Stage 6 packet seal `38ec2c0191be7a5ed0c0832668958b6ca83cd163f0f2810e3255d3854561b9c8`):
award group 1, `E993-R25-CATALAN-GAP-MONOTONE-RATIO`. Every conclusion the
synthesis excluded stays excluded; nothing was weakened to obtain a close.

### C3-LA1: `E993-R25-CATALAN-GAP-MONOTONE-RATIO` (award group 1)

Status: `formally_verified`

- Award capsule: `control/c3-stage7-capsules/C3-LA1-PACKET-MANIFEST.json`,
  seal `aa6e41616cd5656958d0e7b90b7f03fd2d6df03bf64e4a12512d738ec57b25ea`
  (originating seat U3; obligation (1) of U-C3-03).
- Run: `runs/lean-2026-09-21-c3-catalan-gap-monotone-ratio` (canonical run id
  `lean-2026-09-21-c3-catalan-gap-monotone-ratio`; used from `init`, no rebind
  needed).
- Declaration: `Erdos993G1.U3.catalanGap_monotone_ratio_award` (`theorem`), the
  explicit conjunction of four parts: (1) for all `τ, k : ℕ` with `1 ≤ τ ≤ k`,
  `Gamma τ k · Cat_(k+2) < Gamma τ (k+1) · Cat_(k+1)`; (2) positivity
  propagates from any base `K ≥ τ`; (3) `0 < Gamma τ k` for all `k ≥ K(τ)` with
  `K(1..7) = 0, 2, 3, 4, 6, 12, 70`; (4) `Gamma τ k < 0` for all `τ ≥ 8`,
  `k ≥ τ`. Here `Gamma τ k = Cat_(k+1) − Σ_(j=1)^τ C(τ,j)·Cat_(k−j)` with
  `Cat_(k−j) := 0` for `j > k` (integer zero-extension, declared as a convention
  of record), `catalan` being Mathlib's.
- Exact scope: a theorem about Catalan integers, uniform in `τ` with explicit
  thresholds; NOT a graph theorem, NOT fixed-band, NOT uniform in `d` (`d` is
  absent); it must never be packaged, quoted or registered as
  `c(d) = min(d,5)`; no transfer to forests, covers, matchings, `Δ_k`, `i_k`,
  `x(F)`, Tier 1, Tier 2, Tier 3, the diagnostic band, FOREST, TREE, TRANSFER,
  `E993-BETA-AGG` or Erdős #993. The `K(1..7)` clauses certify the SUFFICIENCY
  half only: the six minimality witnesses (`gamma_min_2..7`, e.g.
  `Gamma 2 1 = 0` a plateau, `Gamma 7 69 = −799363812466329793611557404284949737`)
  are kernel-registered lemmas but are NOT conjuncts of the terminal theorem —
  the award is never to be cited for minimality. Alias (controller-verified by
  reading both sources): `gamma_pos_4` unfolds to frozen ENTRY 149
  `Erdos993G1.ThirdWide.catalan_gap_pos`; the project imports only Mathlib.
- The seven synthesis conditions: all met (rename to
  `catalan_strict_logConvex`; convention of record; minimality witnesses added;
  entry-149 alias recorded; denominator-free form; literals corrected with a
  digested generator `EVIDENCE/generate_gamma_witnesses.py`; nothing from
  obligation (3) carried).
- Theorem-contract SHA-256: `c812154b5c773bed711f2423f0fe2f212a9c1ff697d681c0fc88d6ea470d23ac`
  (receipt `fe9a17ee3c249e70b0442604cc6f9aecfe47509f79a76acfa2b96c48f769ef74`, `valid_for_formalization`; contract id
  `c3-la1-catalan-gap-monotone-ratio-v1`; `expected_statement` is the exact
  namespace-relative source text; `declaration_name` fully qualified).
- Informal proof SHA-256: `5dca79e4b81568c23949ca70b33d546d4d185b0a627dc0d2e6413974e47fbace`.
- Lean source SHA-256: `f1243faf4e0d92753a5c90ed056a5885ed44a9c5f10568eac31f9423baff9031` (38 registered declarations: the
  `Gamma` definition, the Catalan lemmas, the seven bases and positivities, the
  six minimality witnesses, the ceiling chain, one terminal theorem).
- Kernel receipt SHA-256: `94fad1925969581122583225151151f52435020c176a4564b38b145ed6be328c` (`verified`; build, single-file
  check, axiom policy, source immutability, sandbox and shared-binding checks
  passed; `#print axioms` on all 38 declarations: exactly `propext`,
  `Classical.choice`, `Quot.sound`; no `sorry`, `admit`, `native_decide`).
- Independent informal proof-integrity audit (Claude Opus 5, high; reviewer
  `c3-la1-fable-informal-20260921`): `passed`; audit `8f501ea13f20f3dace3a05e61b5e25ae1541cd4df2d50355fe7f53216450d22a`, receipt
  `be259a740129aeb3db25e84dcb0c8337338351a9ccac7f23297d47b73d6d3a5c`. Ledger of 38 rows / 54 claims, zero defects; the
  auditor's own evaluator confirmed `K(1..7)` as the least permanent thresholds,
  monotonicity on `1 ≤ τ ≤ k ≤ 200` (and to `τ ≤ 40`), exactly 25 violations on
  the record's window `0 ≤ k < τ ≤ 12`, the ceiling on 2,601 pairs, all six
  minimality values and the §A2 criterion. Three prose imprecisions recorded,
  none load-bearing.
- Independent statement-fidelity review (Claude Opus 5, high; reviewer
  `c3-la1-fable-fidelity-20260921`): `passed`, verdict `match`, 17 deterministic
  checks passed, 14 notes, no warnings or errors; contract projection
  `d461cdab8ef2fab92427aea7f9b1f00b2794ea2a0a2b4c59f492e128f3ac851c`, binding
  projection `9624c29dee4af87c131fd25f167abec1ecd1427516365510ba0de7ad23c9926e`,
  fidelity input `5d9c15798cc6be6795de36e9a21240256a0b6008586470f69a74f86d8d1d7927` (controller-generated by the canonical
  projection; the reviewer re-ran the dry run and found the live input
  byte-identical), fidelity receipt `22ac149c6fb07f9c0382482905bd3d3fb19d4ffed7065ace95828ce02308de55`.
- Reviewer assignment receipt `53590fd9dd868136fa48b922d1edf27c636d6b5fb0f5354184a780c4941ddeda`; formalization receipt
  `ccc4ddc769cd4dc646247dafcd38f15faecd968605502d989eb50535ba46ec58`.
- Canonical verification report SHA-256: `6ac1427b730b079f6eb283265702675afe90a21199d3e17859cefb8e11b2039b`
  (`formally_verified`; claim boundary: Lean kernel validity plus independent
  statement fidelity, nothing broader). Repair attempts used: 0 of 2. Close
  passed on the first attempt.
- Lean pin `leanprover/lean4:v4.32.2`; Mathlib
  `905b95818eb32af7874a58b427f50c1711a5e96c`; shared packages symlinked, not
  copied; `verify-shared-binding` ok before and after the incident below.

## Incident (operational; no statement affected)

The formalizer ran a forbidden `lake clean` after registering all 38
declarations; through the symlinked binding it deleted the shared Mathlib
build cache (the source checkout stayed at the pin, working tree clean). The
seat launched a source-only rebuild (`lake build`; no network, no `lake
update`, no `elan`, no package copy) — as a detached process, and paused
awaiting a notification, against the brief. The controller verified the pin,
polled the rebuild by PID (about 40 minutes; 8,265 oleans), re-ran
`verify-shared-binding`, resumed the seat by message, and kernel verification
was then produced on the rebuilt cache. The seat also wrote a fidelity input
despite the brief (superseded under `EVIDENCE/superseded-fidelity-input-1/` by
the controller's canonical regeneration). Recorded in `logs/incident-log.md`,
`control/C3-CONTROLLER-NOTES.json` and `control/C3-STAGE7-AGENTS.json`;
skill-level fix recommended in `control/CONTROLLER-REVIEW-C3.md`.

## Not awarded (synthesis rulings, unchanged)

Corollary F (the leading Cycle 4 candidate; blocked on its finite-census
half); the bottom-rank matching theorem (DAG open at the generalised
incidence lemmas; registered CONDITIONAL); F1's criterion and ceiling
(registered informal; not Lean-material). The 73-cell partition is a registry
status update, not an award.

## Registry

`E993-R25-CATALAN-GAP-MONOTONE-RATIO` registered run-locally as VERIFIED
(`formally_verified`) with the scope and the minimality caveat above; master
registry unchanged.
