# Cycle 2 Close (r25 uniform residual no-recovery)

Date: 2026-09-21 (controller: Claude Fable 5.1, xhigh; Ashton's full permission
of 2026-09-20 and his 2026-09-21 instruction to run autonomously; topology
12 routes / 24 critics / 3 adjudicators / 1 synthesis / Stage 7 gate). Final.

## Terminal Stage State

- Stage 2: 12 routes allocated (4T/4F/4U), `control/C2-ALLOCATION.md`, from the
  admitted Cycle 1 synthesis portfolio with one controller substitution.
- Stage 3 search returns admitted: `12/12` (no pre-seal edits; one seat, T2,
  twice stopped to await a notification for a detached sweep and was resumed by
  the controller; no live job at its final write).
- Stage 4 critiques admitted: `24/24`, two dispatch waves; `23 retained_narrowed`,
  `1 rejected` (C-T2-F, on the closure half of T2), `0 retained`; all 24 kept
  the headline unresolved.
- Stage 5 adjudications admitted: `3/3` in isolated sealed capsules; all
  `still_open`, `material_progress: yes`, `orientation_plateau: no`; the T2
  paired split resolved `retained_narrowed` on a stated severability rule.
- Stage 6 synthesis admitted: `1/1` (`headline_resolved: no`,
  `material_progress: yes`, `plateau: no`, `continue: yes`); `no award attempted`.
- Stage 7: `no award attempted` (`cycles/cycle-2/stage7/LEAN-GATE-CLOSEOUT.md`);
  no governed Lean run opened; the Cycle 3 Stage 7 target is named.

All seven stages of Cycle 2 are complete.

## Packet Seals

- Stage 2: `116a3be251dc0d603ed775aa4b7d695b34fe47521f2eaa5427efece9affbe6a3` (66 members).
- Stage 3: `c24bc815bf12c260497462407272e3683eedeffeeda99f8b50d38f84af60f76a`.
- Stage 4 dispatch: `1e03f9c4138c14ecde7267055c769f4023e176f9b361122d1d2ff2d1c789b802`;
  Stage 4: `e121251ba5cbc0aad0749a9cb37d618b751ff52c9c21882643baad30ae301fac`.
- Stage 5: `9db079d7ebad5a37fd456883a64a2b58764e82e7fdf22145f533a1ec6db46872`.
- Stage 6 dispatch: `a5e97398e1e1c0b3401df88b746732f621482bb8cbde38f3c3708a3610e61875`;
  Stage 6: `236ec05291dd1122cfa5dc891c1207e537ef14a0992e8c268ba8df3144900b76`.
- Stage 7 packet: recorded in `control/C2-STAGE7-PACKET-MANIFEST.json` at the
  deterministic close (no award runs).

## Preserved Incidents And Recoveries

- Capsule scope: the route allocation was not a member of the Stage 4 dispatch
  packet or the twelve critic capsules (the cloned builder sealed the critic
  seating table under a colliding name); critics read it on explicit controller
  instruction; `control/C2-STAGE4-CAPSULE-SCOPE-INCIDENT.md` authorizes the
  reads retroactively; the Stage 5 builder was patched so the allocation and
  the record are adjudicator-capsule members; the Cycle 3 builder adds the
  allocation explicitly. No sealed member edited.
- Clone residue: the critic common brief (sealed) carried a Cycle 1 hygiene
  paragraph citing a Cycle 2 edit record that does not exist; four critiques
  repeated it as certification; struck by the adjudicators; addendum in the
  incident record; removed from the Cycle 3 brief.
- Controller allocation erratum: item 12's "eleven exceptional cover cells at
  `r ≤ 12`" was `K(6)−1 = 11` floor-failing cells at `τ = 6`, a different object
  from the seven open `(6,6)` cover cells; the seat refused it correctly; the
  Cycle 3 allocation quotes only canonical figures.
- Validator: the cloned Stage 3 validator's allocation regex did not tolerate
  an annotation after the mechanism cell; patched before any seal.
- Seat process discipline: T2 detached its sweep and twice stopped to await a
  harness notification that cannot arrive for detached shells; the controller
  waited for the process and resumed the seat. Cycle 3 briefs require seats to
  poll their own long jobs in the foreground.
- No path-hygiene edits were needed this cycle; the Stage 4 quotation-record
  mechanism was not needed.

## Mathematical State

All headlines remain `still_open`: Tier 1 (`E993-R25-UNR-FOREST-WIDE`), Tier 2
(`E993-G1WIDE-NO-SIZE-CAP`), the Tier 3 schemas, the diagnostic band, FOREST,
TREE, TRANSFER, `E993-BETA-AGG`, Erdős #993. Cycle 2 produced material progress
without a formal award:

- **Cover branch (settled at the threshold level).** `c(d) = min(d,5)` for
  forests (guard `k < r`) is a theorem (informal, adjudicator-verified); the
  diagonal `c(d) = d` is refuted at every `d ≥ 6` by explicit forests (`(6,6)`
  trees at `r = 9, 10`, orders 24 and 26; `(7,7)` for `r = 8..33`, orders 23 to
  73, plus a two-component forest of order 29; `d·K_{1,3}` for `d ≥ 8`), each
  source controller-verified on a witness; `c(6) = 5` exactly; `c(7) ∈ {5,6}`
  with bounded evidence for 6; `5 ≤ c(d) ≤ 7` for `d ≥ 8`. The Cycle 1
  conjectures `min(d,7)` and `min(d,6)` are dead. Corrected census of the 73
  cells: 8 exhaustively closed, 28 refuted, 37 undetermined. The Tier-3c window
  widens at every `d ≥ 6`; the registered `d = 6` window's lower end moves to 6.
  Registered: `E993-R25-COVER-DIAGONAL-D6-SIGN` (REFUTED, order 24),
  `E993-R25-COVER-DIAGONAL-D7-SIGN` (REFUTED, order 23),
  `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST` (VERIFIED, proved_informal).
- **Matching branch.** `Q_{m,d}(t)` is coefficientwise nonnegative iff
  `3d ≤ 2m+2`, for all `m ≥ 1`, `0 ≤ d ≤ 2m`, with leading coefficient
  `m!·3^{m−1}(2m−3d+3)` (critic-attributed proof, adjudicator-verified;
  registered `E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF`, VERIFIED,
  proved_informal). This is the unconstrained relaxation of certificate
  feasibility: the greedy dual has negative multipliers for `d ≥ 7`; the
  clamped dual meets the requirement everywhere scanned and reduces it, where
  the clamp binds, to `m(t+m) ≥ 2(d−1)`. The schema
  `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN` stays OPEN pending a dual-sign lemma
  and the small-rank band `[d, 2d−2]` (its even-`d` bottom rank is closed by the
  Cycle 1 perfect-matching award). The four generalized incidence lemmas
  compile for arbitrary `(m,d)` in a draft project.
- **Diagnostic band `d = 5`.** Reduced (critic-attributed Lemma (L),
  adjudicator-verified with two repairs): on the `ν = τ = 6` class of order
  `2r+5`, `Δ_r ≤ Δ_{r−1}` by a Hall-only argument (exact `r ≤ 260`, analytic
  tail unrepaired), so the band closes iff no crossing forest in the class has
  `x ≤ k₀(r) − 2` (`r − k₀(r) = Θ(√r)`); every crossing forest observed in the
  class has `x = r−1`. No acyclicity-only bound can close the band (the fenced
  comparator is a positive member of the class). This is the first place in the
  run where `x(F) < r` does positive work.
- **Tier 2.** Every ordinary G1 counterexample has residual excess `d' ≥ 5`
  (`d' = 2, 4` formally verified; `d' = 3` conditional on the critic-attributed
  `(4,3)` certificate); at `d' = 5` the residual has `ν ≥ 6` with `ν = τ = 6`
  the unique unresolved profile; the structural triple of the necessary region
  is realizable, empty below order 19 and first inhabited there (785 tuples);
  no recovery anywhere (over 265,000 exact ten-guard tuples across instruments;
  two exhaustive censuses disagree on the tuple count, 224,403 vs 265,749 —
  an open convention item for the Cycle 3 gate). The guard translation is
  compiled; the ambient coupling has no deductive power; guard 8 never binds.
- **Tier 1.** The leaf crossing-shift bound `x(F−v) ≤ x(F)` holds exhaustively
  to order 17; the all-vertex form is refuted by `K_{1,3}`; the all-vertex
  forest form of the registered OPEN `E993-THEOREM-B` (`x(H−w) ≥ x(H) − 1`)
  implies the leaf bound and holds exhaustively to order 17 — the Cycle 3
  crossing-conditioned lead.
- **Falsification.** Zero recovering forests anywhere (star-forest stratum at
  `τ = ν = d+1` to order 2,444; padded Kadrawi–Levit family to order 1,308;
  double-spiders to order 431 with ratio 0.9897); five families drive
  `i_{r+1}/i_r` toward 1 from below without recovery — the ratio is the wrong
  instrument (Cycle 3 replaces it).

Canonical figures: `control/C1-CENSUS-ERRATA.json` and the Cycle 2 corrections
recorded in the Stage 5 adjudications and the synthesis. Registry: four
run-local registrations at this close (above); master registry unchanged
(288 claims); lint clean.

## Seating finding (for the controller's Cycle 3 review)

All three adjudicators and the synthesis record that the load-bearing advances
of Cycle 2 came predominantly from the Opus 5 critics: eleven of eighteen T
results, all four U routes' decisive steps, and every F conclusion that
survived did so on critic instruments. Progress is real (not a plateau), but
the pattern held in both cycles. The synthesis asks the controller to act
before Cycle 3 dispatch (raise route model/effort, or re-charter the critic
stage with derivation and a second reader). The topology is Ashton's; the
controller raises it in the Cycle 2 report.

## Continuation Ruling

`continue: yes` (synthesis) under the armed stop gate: no decisive event, no
plateau. Cycle 3 begins from `control/C3-ALLOCATION.md` (twelve routes drawn
from the synthesis portfolio) and `control/C3-WORKER-COMMON-BRIEF.md` after a
fresh Stage 2 seal, path report and claim-status lint. The controller review is
due at the Cycle 3 close.

## Resume Point

Cycle 3 Stage 1 gate: `control/C3-STAGE1-GATE.md`, then Stage 2 seal and twelve
route dispatches.
