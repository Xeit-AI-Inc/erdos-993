# Cycle 1 Close (r25 uniform residual no-recovery)

Date: 2026-09-20 / 2026-09-21 (controller: Claude Fable 5.1, xhigh; Ashton's
full permission of 2026-09-20, `AUTHORIZATION.md`; topology 12 routes /
24 critics / 3 adjudicators / 1 synthesis / Stage 7 gate). Final.

## Terminal Stage State

- Stage 2: 12 routes allocated (4T/4F/4U), `control/C1-ALLOCATION.md`;
  Stage 1 gate with the controller's structural reading.
- Stage 3 search returns admitted: `12/12` (verdicts: 4 conditional,
  4 bounded computation, 3 still_open, 1 conditional-map; pre-seal
  path-hygiene edit of four replay commands, digest-recorded).
- Stage 4 critiques admitted: `24/24`, dispatched in two waves under the
  transport's 20-agent cap; `24 retained_narrowed`, `0 retained`,
  `0 rejected`; all 24 kept the headline unresolved.
- Stage 5 adjudications admitted: `3/3` in isolated sealed capsules; all
  `still_open`, `material_progress: yes`, `orientation_plateau: no`.
- Stage 6 synthesis admitted: `1/1` (`headline_resolved: no`,
  `material_progress: yes`, `plateau: no`, `continue: yes`); two award
  groups named.
- Stage 7 Lean awards: `2/2 formally_verified` — C1-LA1
  `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN` (fixed-band `d = 5`, named
  as such) and C1-LA2 `E993-R25-PERFECT-MATCHING-EVEN-EXCESS-SIGN` (uniform
  over even excess); `0 blocked`, `0 weakened`
  (`cycles/cycle-1/stage7/LEAN-GATE-CLOSEOUT.md`).

All seven stages of Cycle 1 are complete.

## Packet Seals

- Stage 2: `e4fb88edc91ffde1e02347c6a2ef30536d5908be38e07656b042ad6431da2215` (50 members).
- Stage 3: `43325fa61f84903894cbef2f11e902c537ce9c7bb02a88eac965fa8de2e9ff11`.
- Stage 4 dispatch: `ab05b53b7cc8c48b19761ec6aaa7c4d8a607e5bb50f21937849d62be64d49a1c`;
  Stage 4: `f17925af87f586332059c1fd8f0fcb4105e9b065a18257a45bd5efff4acf1a83`.
- Stage 5: `555872339d4c7ac638e99dd232ae3d1e9e2deab0125e9c45ab44dfca369f0cbe`.
- Stage 6 dispatch: `eb7a6b04251b409bf6279e271bfc61dd2174c9e6c09040048fe05cf4f8609708`;
  Stage 6: `5a6ee227a1bbfac5d730aa2cc291aeff8ca1bc990674a4358c571762d0422da9`.
- Stage 7 award capsules: C1-LA1
  `be4b00b46abf55a5e2239d5372ed9adf91f4847107e58f280789216fd4810af4`, C1-LA2
  `c9c57e52d812166a1eb905874f38963b1972815800dcb17469b0f0dfd35aecd7`;
  Stage 7 packet: recorded in `control/C1-STAGE7-PACKET-MANIFEST.json` at the
  deterministic close.

## Preserved Incidents And Recoveries

- Stage 3 path hygiene: ten `/tmp` replay literals and one interpreter shim
  in four returns were substituted pre-seal by a chartered utility editor
  with a byte-level edit record (`control/C1-STAGE3-PATH-HYGIENE-EDIT-RECORD.json`,
  `…-INCIDENT.md`); controller debt (the brief named no in-root target).
- Stage 4: four critiques quote the replaced literals while auditing the
  edit record; excluded from the literal scan and sealed as members with
  `control/C1-STAGE4-PATH-LITERAL-QUOTATION-RECORD.json`. The cloned Stage 4
  validator still carried r24's critic headings and was patched before any
  seal; the Stage 6 validator's portfolio heading likewise.
- Controller retraction: the Stage 3 acceptance of a Cycle 1 return's
  "Catalan dominance fails at τ = 7" was retracted after six independent
  critic recomputations and the controller's own; the ceiling is τ ≤ 7
  (fails for τ ≥ 8); root cause an unindexed sum in the Stage 1 gate
  (`SOLUTION-CONTRACT-ADDENDUM-1.md` §A2).
- `RUN-STATE.json` is a sealed Stage 2 member; living run state moved to
  `RUN-STATE.live.json`.
- Kadrawi–Levit fixtures were undefined in the run root; imported at
  `sources/fixtures/` (new files) after a critic reported the scope conflict.
- Stage 7 (C1-LA2): one withheld fidelity attestation (non-canonical review
  input; contract statement prefix) repaired by controller tools with the
  superseded files preserved; one blocked governed close (short run id)
  repaired by `rebind-run-id`. Lean source unchanged throughout.
- A six-day orphaned Lean process from the closed 2026-09-13 run was found
  by the pre-seal process check and terminated on Ashton's instruction
  (`logs/incident-log.md`, 2026-09-20).

## Mathematical State

Tier 1 (`E993-R25-UNR-FOREST-WIDE`), Tier 2 (`E993-G1WIDE-NO-SIZE-CAP`), the
Tier 3 uniform schemas, the diagnostic band, `E993-TGT-FOREST`, and
`E993-BETA-AGG` remain `still_open`. Cycle 1 produced material progress
without resolving any headline:

- Matching branch: `m(d) = ⌈3d/2⌉ − 1` is exactly the certificate-feasibility
  threshold (verified `d ≤ 16`); `r`-uniform rational certificates are proofs
  at `d ≤ 6` and at `(2,2), (4,3), (5,4), (7,5), (8,6)` (critic-attributed);
  the `(m,d)`-uniform closed form is open (Cycle 2 T-C2-01 / U-C2-03);
  sharpness is bare-only (every witness has `x = r+1`, including the
  non-comparator forest `4K₂ ∪ P₄ ∪ K₁`).
- Cover branch: Catalan dominance holds for `τ ≤ 7` (`K(1..7) = 0,2,3,4,6,12,70`)
  and fails for every `τ ≥ 8` (proved); `c(d) = min(d,5)` is a theorem for
  forests (guard `k < r`); `c(d) = min(d,7)` is a conjecture with exactly 73
  finite open cells at `k = r−1` (`(τ,d)`: 7 at `(6,6)`, 65 at `(7,7)`, 1 at
  `(7,8)`); `c(8) ≤ 7` by the actual forest `8·K_{1,3}`; the `τ ≤ 5` cover
  statement is false for graphs (13-vertex witness), so acyclicity is
  load-bearing at the small-rank cells.
- Window: stated over the bare matching branch; the `d = 5` window is
  exactly `ν = τ = 6` (unconditional); it widens with slope `3/2` for `d ≥ 8`.
- Diagnostic band `d = 5`: every crossing forest of order `2r+5` has
  `ν = τ = 6` and `x = r−1` (`r = 5..10`); crossing is common (a majority of
  window forests by `r = 10`); no recovering forest at order `≤ 21` or in the
  window at order `≤ 25`; the crossing hypothesis did no positive work in any
  Cycle 1 argument.
- G1 ambient side: the Δ-level coupling system has zero deductive power;
  Tier 2 is realizability only; the necessary region forces `d' ≥ 5`.
- Stage 7: award group A (`E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN`,
  fixed-band `d = 5`: seven disjoint edges in a graph of order `2r+5` force
  `Δ_r ≤ 0`) and award group B (`E993-R25-PERFECT-MATCHING-EVEN-EXCESS-SIGN`:
  a perfect matching on `2m` vertices with `2m ≤ 3r+1` forces `Δ_r ≤ 0`) are
  both `formally_verified`. With C3's cover side (`c(5) = 5`, informal, five
  census-closed cells) the `d = 5` dichotomy is sharpened from C3's gapless
  five-versus-at-most-four to the one-value window `ν = τ = 6`, over the
  actual guard `x(F) < r` untouched.

Canonical census figures: `control/C1-CENSUS-ERRATA.json`. Registry: five
run-local OPEN registrations at Stage 1 plus the Cycle 1 close registrations
in `control/CLAIM-IDENTITY.run-local.json`; master registry unchanged.

## Continuation Ruling

The synthesis rules `continue: yes` under the armed stop gate (no decisive
event; no plateau). Cycle 2 begins from `control/C2-ALLOCATION.md` (twelve
routes drawn from the synthesis portfolio with one controller substitution)
and `control/C2-WORKER-COMMON-BRIEF.md`, after a fresh Stage 2 seal, path
report and claim-status lint. Controller review is scheduled at the Cycle 3
close.

## Resume Point

Cycle 2 Stage 1 gate: `control/C2-STAGE1-GATE.md` (to be written at this
close), then Stage 2 seal and twelve Sonnet 5 xhigh routes.
