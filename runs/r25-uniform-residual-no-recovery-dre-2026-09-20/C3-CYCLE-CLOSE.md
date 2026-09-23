# Cycle 3 Close (r25 uniform residual no-recovery)

Date: 2026-09-21 (controller: Claude Fable 5.1, xhigh; Ashton's full permission
of 2026-09-20 and his 2026-09-21 instructions to run autonomously and to accept
the Opus 5 seat for F1 this cycle; topology 12 routes / 24 critics / 3
adjudicators / 1 synthesis / Stage 7 gate). Final. The controller's chartered
Cycle 3 review is `control/CONTROLLER-REVIEW-C3.md`.

## Terminal Stage State

- Stage 2: 12 routes allocated (4T/4F/4U), `control/C3-ALLOCATION.md`, the
  Cycle 2 synthesis portfolio adopted without substitution.
- Stage 3 search returns admitted: `12/12` (no pre-seal edits; seat F1 ran on
  Claude Opus 5 by Ashton's ruling after two Sonnet 5 dispatches were
  terminated by an API content classifier; one self-disclosed read-boundary
  exposure (F3) ruled admitted with critic verification, which cleared it).
- Stage 4 critiques admitted: `24/24`, two dispatch waves; `24
  retained_narrowed`, `0 retained`, `0 rejected`; all 24 kept the headline
  unresolved; one quoted temporary-directory literal sealed under a quotation
  record.
- Stage 5 adjudications admitted: `3/3` in isolated sealed capsules; all
  `still_open`, `material_progress: yes`, `orientation_plateau: no`.
- Stage 6 synthesis admitted: `1/1` (`headline_resolved: no`,
  `material_progress: yes`, `plateau: no`, `continue: yes`); one award group.
- Stage 7: `1/1 formally_verified` under the governed lean-proof-workflow
  (`cycles/cycle-3/stage7/LEAN-GATE-CLOSEOUT.md`): C3-LA1
  `E993-R25-CATALAN-GAP-MONOTONE-RATIO`, repairs 0 of 2, close on the first
  attempt.

All seven stages of Cycle 3 are complete.

## Packet Seals

- Stage 2: `22f0bf85472a6da12a230bbf23cbc16b655968c86b646caf9a3ef39692142881` (71 members).
- Stage 3: `cc3dc592cd52bec73234e06591167e42de563f335c3053da4eb9b49a417b0f68`.
- Stage 4 dispatch: `5ce6d62953b267c9911373b75f8eca49b5e3d51eef16433f83b915b3685f7369`;
  Stage 4: `553da6b9504faf4f9d580cfe221a4cb6b4d64f874a68970d9d1041ba80f2bc71`.
- Stage 5: `4a1172145a6dcd7bc4489ec309edb106a71807431d4fc4570c14a64517b6c199`.
- Stage 6 dispatch: `68b2b4a3b43853340b8a7bb414a116170c9518589ebf8f183872e920c55bdbc5`;
  Stage 6: `38ec2c0191be7a5ed0c0832668958b6ca83cd163f0f2810e3255d3854561b9c8`.
- Award capsule C3-LA1: `aa6e41616cd5656958d0e7b90b7f03fd2d6df03bf64e4a12512d738ec57b25ea`.
- Stage 7 packet: recorded in `control/C3-STAGE7-PACKET-MANIFEST.json` at the
  deterministic close.

## Preserved Incidents And Recoveries

- Transport: two Sonnet 5 dispatches of seat F1 were terminated by an API
  content classifier before any write; Ashton accepted an Opus 5 seat for this
  cycle only; every Cycle 4 route seat returns to Sonnet 5 xhigh and an
  F-C3-01 successor is renamed with changed vocabulary
  (`control/C3-STAGE3-AGENTS.json`).
- Packet scope: the controller-verified refutation witnesses
  (`control/C2-REFUTATION-WITNESSES.json`) and the census-convention
  reconciliation were published after the Stage 2 seal, so no route seat
  could read them; the F adjudicator exonerated the F3 and F4 seats on that
  point; both records (and the Cycle 3 errata) become Stage 2 members in
  Cycle 4. `k₀(r)` was used in the allocation without a definition (defined
  in `control/C3-CENSUS-ERRATA.json`).
- Controller sealed-member mutation: an admission summary was appended to the
  sealed Stage 4 dispatch record after the seal; detected by the U adjudicator;
  restored byte-exactly; the addendum preserved unsealed.
- Stage 7: the formalizer's forbidden `lake clean` deleted the shared Mathlib
  build cache through the symlinked binding (source at the pin, untouched);
  rebuilt from source (`logs/incident-log.md`); the seat detached the rebuild
  and paused, against the brief; no statement affected.
- Process hygiene: two eight-hour self-matching `pgrep -f` polling loops from
  the Cycle 1 formalizer seat were found and killed.
- Certification: the recurring defect species named by the synthesis
  (misquoted capsule literals, counts against the wrong population, overstated
  horizons, wall-clock fields inside hashed artifacts, numeric claims without
  a generator) go into the Cycle 4 worker brief with the payload-digest rule.

## Mathematical State

All headlines remain `still_open`: Tier 1 (`E993-R25-UNR-FOREST-WIDE`), Tier 2
(`E993-G1WIDE-NO-SIZE-CAP`), the Tier 3 schemas, FOREST, TREE, TRANSFER,
`E993-BETA-AGG`, Erdős #993. Cycle 3 produced one formal award and material
informal progress:

- **Formally verified.** `E993-R25-CATALAN-GAP-MONOTONE-RATIO`: for
  `Γ(τ,k) = Cat_{k+1} − Σ_{j=1}^{τ} C(τ,j)·Cat_{k−j}` (zero-extended), the ratio
  `Γ(τ,k)/Cat_{k+1}` is strictly increasing in `k ≥ τ`, positivity propagates
  from any base, `Γ(τ,k) > 0` for `k ≥ K(τ)` with `K(1..7) = 0,2,3,4,6,12,70`
  (sufficiency half), and `Γ(τ,k) < 0` for all `τ ≥ 8`, `k ≥ τ`. A theorem
  about Catalan integers; not a graph theorem; never `c(d) = min(d,5)`.
- **Diagnostic band `d = 5`, closed informally for every `r ≤ 260`** (every
  forest of order ≤ 525): composed at the synthesis from the window reduction,
  Corollary F at `d = 5`, Lemma (L)'s top-rank step and complete enumeration at
  `r = 4, 5`; grade `proved_informal`; the residue for `r ≥ 261` rests on
  exactly Lemma (L)'s tail repairs (a fourth singular family located). Here
  `x(F) < r` does the work. Registered `E993-R25-FOURTH-BAND-CLOSE-R-LE-260`.
- **Corollary F** (critic-attributed, adjudicator-verified): `τ = ν = d+1`
  forces `x ≥ r−1` for `d ∈ {2,…,6}`, via the rank-`(r−2)` Catalan-dominance
  bound (`τ ≤ 12`, thresholds `R(3..12) = 2,2,5,6,7,8,10,12,19,44`). Registered.
- **Cover cells.** The 73-cell census is `45 closed / 28 refuted / 0
  undetermined` (seat F1, four independent instruments, an arithmetic
  certificate; a registry status update inside the two REFUTED diagonal claims);
  the `(7,7) r = 8` minimum is `−202`, attained by exactly two non-isomorphic
  order-23 trees, and `−1035` at `r = 9`; the single-hub-worst conjecture is
  refuted at two cells (`+699` vs `−202`; `−252` vs `−1035`). The exact
  cover-cell drift criterion, the drift ceiling (limit only) and
  `sup drift < 1/2` at `τ = 7` are registered informal.
- **Matching branch.** The Certificate Soundness Lemma (unconditional in
  `(m,d,r)`); the bottom-rank theorem `Δ_d(G) ≤ 0` at order `3d` with a matching
  of size `m(d)` (uniform in `d`, conditional on the generalised incidence
  lemmas; registered CONDITIONAL); clamped-dual domination, persistence and the
  bound `m(t+m) > 2(d−1)`; T1's Theorem 1 is false at its stated generality and
  the existence of a nonnegative dual remains bounded evidence; U2's negative
  result is overturned (rank-dependent cutoffs at all five `d`).
- **Tier 1 / general.** `x(G ⊔ H) ≥ max(x(G), x(H))` for all finite graphs;
  the isolated-add upper bound is the `K₁` instance of a REFUTED registry claim
  (instance survives to order 17) and a rank-`(x+1)` no-recovery condition;
  (★) is unmoved; the all-vertex census to order 17 re-certified by critics.
- **Falsification.** Zero recovering forests anywhere (every forest of order
  ≤ 18 at every rank; order ≤ 20 with `τ ≤ 7`; the stratum to order 18; the
  window census to `r = 8` with 192,015 crossing instances all at `x = r−1`);
  the ratio and drift near-miss instruments are retired (obligation (a) of
  F-C3-03 is equivalent to strict Tier 1).

Canonical figures: `control/C1-CENSUS-ERRATA.json` as corrected by
`control/C3-CENSUS-ERRATA.json`; `control/C3-CENSUS-CONVENTION-RECONCILIATION.json`;
`control/C2-REFUTATION-WITNESSES.json`. Registry: fourteen run-local
registrations or updates at this close (`control/register_c3_close.py`);
master registry unchanged (288 claims); lint clean.

## Seating finding (recorded a fourth time)

All three adjudicators and the synthesis record again that the load-bearing
advances came predominantly from the Opus 5 critics; the one Opus 5 route
seat produced the cycle's largest seat-originated result. Not a plateau; a
seating signal. The controller's recommendation and the decision requested
from Ashton are in `control/CONTROLLER-REVIEW-C3.md` §4 and §7.

## Continuation Ruling

`continue: yes` (synthesis) under the armed stop gate: no decisive event, no
plateau; three cycles of the six-cycle ceiling remain. Cycle 4 begins from
the synthesis's Cycle 4 route portfolio (`cycles/cycle-3/stage6/SYNTHESIS.md`
`## Cycle 4 route portfolio`; two allocated routes re-chartered:
`LEMMA-L-TAIL-UNIFORM` and the F band audit) after the packet-scope, brief
and tooling fixes of the controller review, a fresh Stage 2 seal, path report
and claim-status lint, and Ashton's decisions on seating and the Lean binding.

## Resume Point

Ashton's decisions (`control/CONTROLLER-REVIEW-C3.md` §7), then the Cycle 4
Stage 1 gate (`control/C4-STAGE1-GATE.md`), Stage 2 seal and twelve route
dispatches on Sonnet 5 xhigh unless re-seated.
