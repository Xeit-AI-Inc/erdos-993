# Controller Review at the Cycle 6 Close (r25 uniform residual no-recovery) — the terminal review

Reviewer: Claude Fable 5.1 (xhigh), the run's DRE controller, as chartered by Ashton
("Fable 5.1 xhigh runs a special check at the end of Cycles 3 and 6"). Date:
2026-09-22. Scope: the whole run through its terminal close — the mathematics, the
process, the seating, the tooling, and what a successor run should do. Authority:
`AUTHORIZATION.md`; `control/CHARTER-PROMPT.md`. Status: final; written after the Stage 7
close (`c63afc5b…`) and the terminal manifest (`6bc912ae…`), as the charter places it
(the review follows the cycle); it is sealed, with the publication records, by the
post-terminal addendum manifest `C6-POST-TERMINAL-MANIFEST.json`. Every figure below is taken from sealed records named in
`cycles/cycle-6/CYCLE-CLOSE.md` and the six cycle-close records; nothing here is new
mathematics.

## 1. Verdict in one paragraph

Six cycles, six seals per cycle, twelve governed Lean awards, 360 run-local claims, and
the headline did not move: Tier 1 `E993-R25-UNR-FOREST-WIDE`, Tier 2
`E993-G1WIDE-NO-SIZE-CAP` and every Tier 3 schema end the run OPEN, and no recovering
forest exists anywhere in the evidence — every census, every family, every rank, every
instrument, zero. The synthesis's ruling on the charter's four outcomes is the right one
and I adopt it verbatim: **the experiment achieved another fixed-band result, together
with refutations that fence the method; it did not achieve a uniform advance in the
charter's sense, and it did not achieve a proved structural reduction of the remaining
class.** The fixed-band result is the diagnostic band `d = 5` closed informally for every
`r` on derived inputs with three of its eight inputs now formally verified (the matching
half, the carry step, the five-cell finite part) and its grade still `proved_informal` at
its weakest link — a count of formal inputs is not a grade. The refutations are the
run's most durable product: the cover diagonal at `d ≥ 6` with nine explicit witnesses;
Corollary F's extension to `d = 12`, which made `d ≤ 11` a proved sharp ceiling; the
single-hub conjecture at three exhaustive cells; the false `D_unimodal_peak` contract
caught before any formalizer saw it; and the mechanism refutations of every cycle. What
the run did NOT do is the thing it was chartered to do — turn the G1 matching/cover
method into a uniform-in-`d` no-recovery argument. The honest reading is that the method
produces theorems band by band and rank by rank, that its one uniform-in-`d` theorem is at
the bottom rank alone, and that the obstruction is now located exactly (the matching
band's Region II, 1,146,505 open steps at `d ≤ 400`, margin binding at the band top and
decaying like `0.3/d`; the cover branch's `d ≥ 6` diagonal, refuted). **Closing G1 alone
does not solve Erdős #993**, and no claim in this run bears on Erdős #993 itself.

## 2. Mathematical state (what is established, at what grade)

**Formally verified — twelve governed awards, thirteen registry claims at
`formally_verified`, each at its exact scope and no wider:**

| Cycle | Award | Scope class |
|---|---|---|
| 1 | `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN` | fixed-band `d = 5` matching |
| 1 | `E993-R25-PERFECT-MATCHING-EVEN-EXCESS-SIGN` | even excess, perfect matching |
| 3 | `E993-R25-CATALAN-GAP-MONOTONE-RATIO` | Catalan integers, uniform in `τ` with thresholds `K(1..7)` |
| 4 | `E993-R25-MATCHING-BOTTOM-RANK-UNIFORM-SIGN` | uniform in `d ≥ 3`, rank `r = d` ONLY |
| 4 | `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` | forests, uniform in `k`: `Δ_k < 0 ⟹ |V| ≤ (k+1)²` |
| 5 | `E993-R25-MATCHING-DUAL-SCALAR-CORE` | scalar arithmetic core of the dual positivity |
| 6 | `E993-R25-FOREST-DELTA2-POS-ORDER-9` | forests, uniform in the order: `Δ₂ > 0` for order `≥ 9` |
| 6 | `E993-R25-BAND-CARRY-STEP-HALL` | fixed-band `d = 5` carry step, graph-general given `ν = τ = 6` |
| 6 | `E993-R25-MATCHING-ALL-INDEX-COEFFICIENTWISE-NONNEG` | uniform in `d, m, j` (clause (a) only) |
| 6 | `E993-R25-D-ROW-STEP-SIGN-LAW`, `E993-R25-BD-INTERIOR-PEAK-CATALAN-BOUND` | fixed-band arithmetic |
| 6 | `E993-R25-CARD5-JOINT-BUDGET-CELLS`, `E993-R25-CARD5-COVER-CATALAN-BOUND` | fixed-cell (four new cells, top rank only); parameterized card-5 bound |
| 6 | (scope) `E993-R25-FOREST-ORDER-BOUND-SHARPENED` argmin step | integer binomials |

None is a uniform-in-`d` no-recovery statement. The Cycle 6 awards are, by the
synthesis's and the adjudicators' attribution, critic-derived in whole or in their
load-bearing step in four of six groups.

**Informal, at `proved_informal` with attribution on the face (selected):** the `d = 5`
band for every `r` (eight inputs, three formal); `c(d) = min(d,5)` for forests (false for
graphs); Corollary F at `d = 2..11`, sharp; the matching branch at `r = d` (formal) and
`r ≥ K(d)`; Hunter's inequality in-run; the `x ≤ 4` closure of the `K₁`-addition target
(unconditional); the `k = 5` order ceiling 25 (second-read-certified composition); the
`Δ₃` forest threshold at order 12; Region I domination and the `d = 3` top-cell theorem;
thin trees `τ ≤ 9` (unconditional) and `τ ≤ 11` (conditional); the `(7,7,15)` full census
complete; the pendant cap at 40 over all 1,082 classes; Theorem D on triangle-free graphs.

**Exact residues at the close (the successor's inheritance):** Tier 1 — `d ≥ 6` plus the
cell `(3,4)`; `x = 5` at orders 22–25 with `≥ 3` branch vertices; `τ = 12` order 26 at
`h ∈ {6,7,8}`. Tier 2 — every `d' ≥ 6` plus `(3,6)`; nothing bounds `d'` above. Tier 3a —
Region II of the band. Tier 3b — the schema itself, untouched all run; the `d ≥ 6`
diagonal refuted. Tier 3c — both window endpoints unmoved.

**Grade honesty at the close:** two compositions (S1: the `τ ≤ 5` branch at every excess;
S2: the band's input ledger) and two registration candidates (Lemma H's uniqueness half;
the `τ ≤ 5` `Γ`-residue count with `s*(τ)`) are STATED and NOT registered, because gate
ruling 8 requires an isolated second read the terminal cycle did not afford. A successor
run commissions those reads before registering anything.

## 3. Was the run on the charter's track?

Yes in process, no in outcome. Every cycle met its gates; every stage was sealed; every
advance carries its grade and attribution; nothing was weakened to obtain a close; the
stop gate never found a decisive event or a plateau (material progress in every cycle,
which is exactly why six cycles were run). The charter's target — a uniform residual
no-recovery argument — was not reached, and the run's own evidence says why: the
matching branch's certificate margin degrades toward the band top in a way no lossy
argument survives, and the cover branch's threshold `c(d) = min(d,5)` caps at 5 while the
window `[min(d,5)+1, ⌈3d/2⌉−2]` widens with `d`. That structural reading (the widening
`ν`-window) was already in the run's setup memory; six cycles confirmed it rather than
escaped it. The honest recommendation for a successor is not "one more cycle of the same
method" but the two levers the synthesis names: an argument, not a search, at the band
top of the matching branch; and a `d`-uniform mechanism for the cover branch above
`τ = 5`, which nothing in this run supplies.

## 4. Seating finding (recorded a seventh time; a decision for Ashton)

In every one of the six cycles the advances that moved a grade came from the critic and
adjudicator stages, not from the route seats: eleven of twelve Cycle 6 routes carry
critic-attributed advances; the Cycle 6 flagship's DAG was completed by its critics; the
carry step was proved in Lean by both F3 critics after the seat stopped at three
`sorry`s; the general-`j` positivity was proved by both U1 critics after the seat declared
an obstruction that did not exist; the uniform `Δ₂` lemma was compiled by both U4 critics
after the seat concluded a 76-class base was necessary. Ashton's standing ruling seats
routes on Sonnet 5 and critics on Opus 5. The finding is consistent with two readings —
the critic charter ("attempt the step the return leaves open") is where the work is
placed, or the seat model is the limiting factor — and the record cannot separate them,
because the charter never seated Opus on routes after Cycle 3. A successor run should
decide this by design: either seat routes and critics on the same model for one cycle, or
charter routes with the critics' "attempt the open step" duty explicitly. Left as is, the
DRE topology functions, but at roughly three seats' cost per advance.

## 5. Process and tooling: incidents and fixes

- **Transport:** all twelve wave-1 critics terminated by the API's weekly limit (HTTP
  429) and resumed on their own transcripts after the reset; no critique lost; the
  Cycle 5 HTTP 529 overload handled the same way. Rule kept: never re-spawn while the
  controller session lives; check the remaining budget before a 24-critic stage.
- **Governed Lean workflow:** two bounded repairs (textual/registrational), one byte-exact
  state restoration, and one skill bug (`begin-repair` child naming) fixed in
  `lean-proof-workflow` v1.3 with a regression test and a decision record. The shared
  Mathlib tree stayed write-protected and intact through 14 concurrent builds.
- **Seat hygiene species, counted:** above-grant `find`/`ls` (five seats, three before
  the brief was read); transient `/tmp` redirects (two formalizers); a shared-scratch
  collision between concurrent formalizers; harness auto-backgrounding of long calls
  (several seats; none a detach). Every instance disclosed by the seat itself and ruled
  on by its critics. The dispatch message should carry the search prohibition verbatim,
  since the brief reaches a seat only after its orientation commands.
- **Controller errata (C6-E-a…i):** clone residue, echoed counts, stale citations, stale
  command text, a date literal, a packet-composition gap (the Stage 2 manifest absent
  from critic capsules — inherited across all six cycles). The species list is stable
  and each has a mechanical pre-dispatch check; a successor controller runs them.
- **Second reads:** the gate-ruling-8 discipline (an isolated reader for every
  adjudicator- or synthesis-stated composition) caught nothing false this cycle and
  upgraded one result (the `(7,7,15)` census from "residue named" to complete). It costs
  one Opus seat per composition and is worth it.
- **Publication readiness:** the registry is honest about which results are formal
  (`formally_verified` only from the governed workflow, thirteen claims) and which are
  informal (grade and attribution on every face); the vendored Galvin paper is excluded
  from every packet; no claim bears on Erdős #993.

## 6. Recommendations for a successor run (in priority order)

1. Commission the four outstanding second reads (S1, S2, Lemma H's uniqueness half, the
   `τ ≤ 5` residue count with `s*(τ)`) before registering anything new.
2. Fund the `Bd` tail's top-level statement from C-U2-F's integer-rank frame only (nodes
   8-lift, 9, 10, `g_c` as `Nat.find`); it is one focused Lean cycle, not a mathematics
   problem, and it would give the band a fourth formal input.
3. Attack Region II of the matching band with an argument at the band top (the exact
   requirement `jQ ≥ ρ_j jP + (ρ_j − 1)E_j` with its free slack), not with a horizon sweep.
4. Decide the seating question by design (§4).
5. Keep every process rule of `control/C6-STAGE1-GATE.md` §3 and add: the dispatch message
   carries the search prohibition; the critic capsule carries the Stage 2 manifest; the
   formalizer brief never asks for edits to `FORMALIZATION-STATE.json`; a pre-seal date
   and count check runs on every controller-authored member.

## 7. Decisions requested from Ashton

None are blocking: publication is pre-authorized and scoped, and the run is complete.
Two are open for a successor: (a) the seating design of §4; (b) whether to fund a short
Lean-only successor for the `Bd` tail (§6.2) or to let the band rest at three formal
inputs.
