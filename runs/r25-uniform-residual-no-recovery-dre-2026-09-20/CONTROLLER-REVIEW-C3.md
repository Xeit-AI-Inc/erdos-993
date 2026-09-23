# Controller Review at the Cycle 3 Close (r25 uniform residual no-recovery)

Reviewer: Claude Fable 5.1 (xhigh), the run's DRE controller, as chartered by
Ashton ("Fable 5.1 xhigh runs a special check at the end of Cycles 3 and 6").
Date: 2026-09-21. Scope: the whole run through the Cycle 3 close — the
mathematics, the process, the seating, the tooling, and what Cycle 4 should
do. Authority: `AUTHORIZATION.md`; `control/CHARTER-PROMPT.md`. Status of
this document: final at the Cycle 3 close (the Stage 7 outcome line below is
filled at the Lean-gate close).

## 1. Verdict in one paragraph

Three cycles in, the run has not moved the headline (Tier 1
`E993-R25-UNR-FOREST-WIDE`, Tier 2 `E993-G1WIDE-NO-SIZE-CAP`) and no
recovering forest exists anywhere in its evidence (every census, every
family, every rank: zero). What it has produced is real and of three kinds
the charter names: two fixed-band theorems formally verified in Cycle 1
(the `d = 5` seven-matching sign and the perfect-matching even-excess sign);
a structural reduction of the diagnostic band in Cycle 3 — closed informally
for every `r ≤ 260` by composing the window reduction, Corollary F and Lemma
(L)'s top-rank step, with the residue for `r ≥ 261` resting on exactly Lemma
(L)'s tail repairs — and a set of exact refutations that have cleared the
field (the diagonal `c(d) = d` at every `d ≥ 6`, the single-hub conjecture at
two cells, the near-miss ratio and drift instruments, the Schur-convexity
conjecture, the zero-clamp "theorem" at its stated generality). The cover
branch is settled at the threshold level (`c(d) = min(d,5)`, `c(6) = 5`,
the 73-cell census now 45 closed / 28 refuted / 0 undetermined), and the
matching branch has its soundness lemma and its first uniform-in-`d` sign
theorem (at the bottom rank, conditional on the generalised incidence
lemmas). The stop gate is not tripped: no decisive event, no plateau. The
run should continue to Cycle 4 under the synthesis portfolio, with three
changes I recommend below (seating, packet scope, Lean tooling) and one
strategic choice for Ashton.

Stage 7 outcome (Cycle 3): `E993-R25-CATALAN-GAP-MONOTONE-RATIO` is
`formally_verified` (kernel receipt, independent informal audit `passed`,
independent fidelity review `match`; repairs 0 of 2; close on the first
attempt) — a theorem about Catalan integers with explicit thresholds, the
run's third formal award and its first uniform-in-a-parameter one, with the
caveat that it certifies the sufficiency half of `K(1..7)` only and is never
to be packaged as `c(d) = min(d,5)`.

## 2. Mathematical state (what is established, at what grade)

- Formally verified (governed workflow, kernel + informal audit + fidelity):
  `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN` (fixed-band `d = 5`),
  `E993-R25-PERFECT-MATCHING-EVEN-EXCESS-SIGN` (even excess); Cycle 3 award
  `E993-R25-CATALAN-GAP-MONOTONE-RATIO` (Catalan integers; see the outcome
  line above).
- Proved informally, adjudicator-verified: `c(d) = min(d,5)` for forests;
  `Q_{m,d}` positivity iff `3d ≤ 2m+2`; Corollary F (`τ = ν = d+1 ⟹ x ≥ r−1`,
  `d ≤ 6`); the rank-`(r−2)` Catalan-dominance bound (`τ ≤ 12`); the
  Certificate Soundness Lemma; clamped-dual domination and persistence; the
  exact cover-cell drift criterion and the drift ceiling (limit only); the
  `τ = 7` drift supremum below `1/2`; the disjoint-union first-descent lower
  bound for all graphs; drift padding invariance; the band close to
  `r ≤ 260` (weakest link `proved_informal`).
- Refuted with exhibited witnesses: the diagonal at `d = 6, 7` (and
  `d·K_{1,3}` for `d ≥ 8`); the single-hub-worst conjecture at `(7,7,8)` and
  `(7,7,9)`; the isolated-add upper bound as a general-graph statement;
  Theorem 1 of T1 outside `3d ≤ 2m+2`; the "drift is a near-miss statistic"
  reading; the `4/9 (mod 1)` reformulation; the Schur-convexity conjecture.
- Open, with the residue named exactly: Lemma (L)'s tail (three repairs plus
  a fourth singular family), which alone separates the diagnostic band from
  an unconditional close; the all-index dual positivity lemma; the primal
  generalised incidence lemmas; the `indepCount` closed forms at ranks 4–6
  (which block `c(d) = min(d,5)` in Lean); Tier 2 at `d' ≥ 6`; Tier 1 itself,
  whose only live lead is the all-vertex form (★) of Theorem B, unmoved in
  two cycles.

Where `x(F) < r` does work: only in the band close (Corollary F converts the
crossing hypothesis to `x = r−1`; the concavity step converts `Δ_{r−1} < 0`
to `Δ_r ≤ 0`). Everywhere else the results are bare, and that is the
structural fact of the run: the matching and cover machinery is
crossing-blind, and the headline needs the crossing hypothesis to do work at
every excess, not at `d = 5`.

## 3. Is the run on the charter's track?

The charter asked for a uniform residual no-recovery argument: a forest
theorem, a G1 residual theorem under the full ordinary guards, or a rigorous
reduction to a smaller obstruction, with the `2r+5` band as diagnostic. After
three cycles the honest reading is:

- The diagnostic band is nearly closed (informally, horizoned). Closing it
  unconditionally would be the first result of the "structural reduction"
  kind at full strength, and it is one lemma away (Lemma (L)'s tail). That
  is the cheapest real result available and should be Cycle 4's first
  target.
- The uniform-in-`d` programme (Tier 3 schemas) has produced the threshold
  functions (`m(d)`, `c(d)`) and their windows, but no uniform theorem with
  the crossing hypothesis inside it. The bottom-rank matching theorem is the
  closest thing to a uniform advance and is blocked on a formal step the
  U routes have twice failed to land (the generalised incidence lemmas).
- Tier 2 (`d' ≥ 5`, then `≥ 6`) has not moved since Cycle 2; the
  composition machinery (guard translation, `Gamma`, the shared base) exists
  in pieces across three seats' scratch and one award project, and the
  controller has only now made the pieces mutually readable.
- Tier 1's lead (★) resists elementary induction for a reason both a route
  and two critics pinned down (the deletion identity is a sum; no single
  branch carries the induction). Nothing in three cycles suggests a proof
  route; I would not allocate more than one seat to it in Cycle 4.

## 4. Seating finding (recorded four times; Ashton's decision)

Every adjudication and both syntheses since Cycle 2 record the same pattern:
the load-bearing advances come predominantly from the Opus 5 critics, not
the Sonnet 5 route seats. In Cycle 3 the pattern held in all three
orientations — Corollary F, the bottom-rank theorem, the `r = 8` census, the
`Bd(r)` reconstruction, the crossover duals, the cap-form bridge, the `τ = 7`
supremum, the disjoint-union lemma — all critic-derived. The one Opus 5
route seat (F1, seated by Ashton's ruling after a classifier refusal)
produced the cycle's largest seat-originated result (the census decision, the
criterion, the ceiling). This is not a plateau; it is a seating signal.

Recommendation: seat Claude Opus 5 (high) on the four U routes and on any F
route chartered as an audit or a proof (the Cycle 4 band audit), keeping
Sonnet 5 xhigh on the search-and-construct T and F routes where breadth
matters more than depth; keep 24 Opus critics. If cost is the constraint,
the better trade is fewer route seats at Opus than twelve at Sonnet. The
topology is Ashton's to change.

## 5. Process and tooling: incidents and fixes

1. Classifier refusal (Cycle 3): two Sonnet 5 dispatches of F1 were
   terminated by an API content classifier on the route's vocabulary; Opus 5
   was not refused. Rule adopted: an F-C3-01 successor is renamed with its
   vocabulary changed before a Sonnet dispatch.
2. Shared Lean cache destruction (Cycle 3 Stage 7): the formalizer ran a
   forbidden `lake clean`, which deleted the shared Mathlib build cache
   through the symlinked binding; the checkout stayed at the pin; a full
   rebuild (hours of compute) restored it; the theorem was untouched.
   Skill-level fix required: a binding that a seat-level `lake clean` cannot
   reach (read-only bind, a lake wrapper refusing `clean`/`update` inside
   governed runs, or both). Logged in `logs/incident-log.md`.
3. Detached jobs awaited by notification (Cycle 2 T2; Cycle 3 formalizer):
   seats still detach long jobs and pause. The brief rule is explicit and was
   violated twice; the Stage 7 template gets a pre-write checklist item and
   the controller polls by PID.
4. Stale self-matching `pgrep -f` loops from the Cycle 1 formalizer ran for
   eight hours; killed. Rule: poll a PID, never a pattern the polling shell's
   own command line contains.
5. Sealed-member mutation by the controller (Cycle 3): an admission summary
   was appended to the sealed Stage 4 dispatch record; detected by the U
   adjudicator as post-seal drift; restored byte-exactly and the addendum
   preserved unsealed. Rule reinforced: after any seal, status goes to the
   controller notes or an unsealed addendum.
6. Packet scope: the controller-verified refutation witnesses were published
   after the Stage 2 seal, so no Cycle 3 route seat could read them (two
   seats were wrongly faulted by critics for it); `k₀(r)` was used in the
   allocation without a definition; the Galvin-cores clause cited a source
   not vendored under the run root. Fix for Cycle 4: the witness record, the
   Cycle 3 errata (with `k₀` defined), and the compiled-fragments pointer are
   Stage 2 members; no allocation clause cites an unvendored source.
7. Certification-defect species recurring across returns (misquoted capsule
   literals, counts against the wrong population, overstated horizons,
   wall-clock fields inside hashed artifacts, numeric claims without a
   generator): named in the synthesis; the Cycle 4 worker brief carries the
   list and the payload-digest rule.
8. Transport audit trail: one critic observed the controller's own CLI model
   flag on the host and inferred it was its own; the per-agent model is set
   at request time and is not visible to seats, and the controller cannot
   independently confirm a completed subagent's API model. This is a
   verification gap in the seating record, stated honestly; the only
   positive evidence that the model parameter is honoured is the transport's
   own error text on the Sonnet refusals.

## 6. Recommendations for Cycle 4 (in priority order)

1. Target Lemma (L)'s tail as the cycle's primary result (U route, Opus 5),
   with the Cycle 3 band composition as the statement to close; a positive
   outcome is the run's first unconditional structural reduction and a
   Stage 7 candidate if the window reduction's cover half can be carried.
2. Formalize Corollary F (the leading award candidate) only after its
   finite-census half is replaced by the Hall-tightened budget argument the
   synthesis names; otherwise it stays informal.
3. Land the generalised incidence lemmas (U route) so the bottom-rank
   matching theorem becomes unconditional; it is the one uniform-in-`d`
   statement in hand.
4. Compose the Tier 2 fragments (guard translation, `Gamma`, the shared
   base with the cap-form bridge folded in) into one Lean statement over the
   ten guards; the pointer record gives the read standing.
5. Keep one T seat on (★) at most; spend F seats on audits of the band's
   inputs, not on further null searches (a null census closes nothing).
6. Apply the packet-scope, brief and tooling fixes of §5 before the Stage 2
   seal.

## 7. Decisions requested from Ashton

1. Seating: adopt the Opus 5 seating on U (and audit-type F) routes, or keep
   the chartered topology.
2. External sources: whether an F route may vendor the Galvin construction
   (an external paper) under `sources/`, or whether that clause is struck.
3. Emphasis: Cycle 4 on the band and Tier 2 composition (recommended) versus
   a renewed Tier 1 push.
4. Tooling: authorize the skill-level change to the shared Lean binding
   before any further governed run.
