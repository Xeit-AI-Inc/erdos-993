# Terminal Evaluation: run `erdos-993-math-dre-20260914-r24-direct-favorable-leaf-aggregate`

Author: Claude (Fable 5.1), controller for Cycles 5–6 by Ashton's handover
authorization of 2026-09-17 (Cycles 1–4: Codex). Date: 2026-09-18. This is
the controller's own independent check and evaluation of the whole run,
required by Ashton's terminal-cycle instruction, written after the admitted
Cycle 6 synthesis and before the terminal close. It is a controller
document, not a stage output: it asserts nothing the sealed record does not
support, and where I checked something myself I say so.

## 1. What I verified myself

- **Seal chain.** Every packet seal from the Cycle 4 terminal manifest
  (`510982c0…`) through Cycle 6 Stage 6 (`d1fd8755…`) recomputes under the
  declared algorithm on my own instrument; every member digest verifies
  except the three controller-caused post-seal drifts of §5, each of which
  I reconstructed byte-exactly and preserved.
- **The run's one new formally verified theorem (`C5-LA1`).** I re-derived
  every reported digest, read all fourteen Lean definitions against the r23
  semantic contract lines 30–48 before assigning reviewers, checked the
  kernel receipt binds the exact source (`0933211d…`) with axioms exactly
  `[propext, Classical.choice, Quot.sound]`, and checked the informal
  double-counting argument by hand before dispatch (both bijections; the
  tree hypothesis is not used by the argument, consistent with the later
  kernel-checked scratch probe). Route `U-C6-01` and its two critics then
  re-verified the package independently (rebuild on unchanged source, axiom
  probe, 31 fragment digests, both preserved rejected closes).
- **The terminal cycle's headline numbers, against the frozen evaluator
  directly** (`control/controller-terminal-check/CHECK-OUTPUT.txt`): T22 and
  T60 control rows exact; `S(T_m, α−1) = −9m² − 6m + 1` at m = 22 and 60
  (`−4487`, `−32759`), coinciding with C-T1-U's independent `2 − ℓ²`; the
  `T_m` band empty exactly at `m ≤ 21` and `m ∈ {23,25,27,29}` and non-empty
  at every `m ≥ 30` of either parity; width 2 at `m = 38`; in-band rows
  negative for odd `m ∈ {31,…,39}`; and the index convention (band indexed
  in `q`, rank `p = q+2`) that resolves the only F/U conflict — `q = 32` is
  in band for T22, `p = 34` is not.
- **T3's mis-shipped evidence**: all seven cited digests match the files
  recovered from the session scratch root; preserved without packet
  standing.

## 2. Mathematical state at the terminal close

Unchanged on every headline face, and honestly so: the literal
interior-window aggregate `S(T,p) ≤ 0` on `x(T)+2 ≤ p < α(T)` is
`still_open`; `(RC)` (its top-rank residual case) is exactly as open as
Cycle 4 left it; literal-to-governed transport is `not_established` (never
attempted in this run); governed `E993-BETA-AGG` is `still_open`; Erdős #993
is unresolved. No positive complete eligible aggregate exists anywhere in
the run's evidence: orders ≤ 16 exhaustive, the eligible residual class to
order 17, every designed family, and ~4.9M stratum rows all negative; every
positive object found is a positive summand inside a negative aggregate, a
zero summand, or an ineligible row.

What the run established, by grade:

- **Formally verified (Lean 4.32.2 / Mathlib `905b9581…`, governed
  workflow, independent audits):** the top-rank selector collapse (`C4-LA1`,
  Cycle 4) and the top-rank residual identity composed with it (`C5-LA1`,
  Cycle 5): on the residual class, `S(G, α−1) = ℓ·M − Σ_{B∈I_{α−1}} (|B∩L| −
  Σ_{s∈B} λ(s))`. Equality only. Also, from Cycle 3, the abstract
  `SAFE-EXT-CAP` and the U6 adjacent-row minor.
- **Exact informal theorems at literal ordinary-tree scope, new in Cycle 6
  (route-attributed):** the flat residual sign law `S(T,α−1) = −ℓ(ℓ−2) −
  k₂(ℓ−4) ≤ −16` on the flat subclass (T1, sharpened by critics); the
  universal failure of the reduced upper guard for every leaf-deleting
  reduction on the residual class (T2, narrowed to its true scope).
- **Exact theorems new in Cycle 6, critic-attributed (Stage 4 products,
  replayed by the adjudicators, not independently re-proved):** the
  non-strict per-support sign `g_s(p) ≤ 0` on the `K₂`-core and exceptional
  `P₃` strata via `x(T) ≥ ⌈(α−3)/2⌉` (C-U2-T); the `T_m` top-rank closed form
  `−9m² − 6m + 1 < 0` for all `m` (C-U3-F, C-T1-U); the whole-class
  three-family expansion of `S(T, α−1)` (C-T1-U); the exact reduction
  `S(T_m, q+2) = w_{q+1} − w_q` localizing band domination to three named
  lemmas (C-U3-T); support deletion preserves `α` on the residual class
  (C-T2-F).
- **Refuted or retired this cycle:** T3's payment lemma as new (it is r23's
  registered left-totality with an inert hypothesis); the broom falsifier as
  new (it is the star family); F3's "infeasible" census debts (reproduced in
  seconds); the Cycle 5 band parity statement; a dozen certification literals
  (listed in the synthesis's TD-29…TD-31).

The obligation did not shrink in status, but it moved into a sharper form.
Three fronts are now concrete objects rather than a diffuse gap: the eligible
top-rank residual class with non-empty deep interior (~98% of the class and
rising, with an exact three-family expansion whose family-(I) weights flip
in a regime realized from order 9); condition-(A) decorated cores of core
order ≥ 4, starting at a single named shape (the decorated `P₄`); and the
`T_m` band, reduced to the monotonicity of one explicit polynomial's
coefficients. One region was never searched by any F route in either cycle
— the *lower* interior window, where the record's only positive mechanism
values live (T22 at `p = 34`, T60 at `p = 90`); the F adjudicator rightly
calls it the most valuable unexecuted falsification task.

## 3. My assessment

**Of the mathematics.** The `T_m` result deserves weight beyond its "family-
only" grade: it shows `(RC)` holding on the run's hardest literal witnesses
with a clean quadratic margin, and two critics reached it by different
routes. Together with the flat-subclass law (also quadratic in `ℓ`) it
suggests the top-rank residual inequality has a structural proof whose
first step is understanding the family-(I) sign flip in the three-family
expansion — that expansion, not another census, is where I would resume.
The `K₂`/`P₃` stratum theorem is the cycle's strongest single new statement
and is one independent re-proof away from being a sound Lean target. The
tightness datum (`g_v = 0` on ~10% of rows at every order) rules out any
strict-inequality proof strategy for the mechanism value itself.

**Of the run's process.** The architecture worked as designed: isolation by
sealed capsules held (every critic and adjudicator verified its capsule at
open, and the drifts were caught by seats, not by me); every computation
any seat reported was reproduced by at least one independent instrument,
usually two; the governed Lean workflow rejected two closes for exactly the
right reasons before passing one; and the record ends with a 35-item debt
register rather than a claim. The Stage 4 critic tier was the run's most
productive mathematical tier in the terminal cycle — most of the new exact
results were written there — which says the route seats were strongest at
computation and weakest at proof and at certification language.

**Of my own conduct, plainly.** I edited three sealed packet members after
sealing (`RUN-STATE.json`, `AUTHORIZATION.md`, a drift record), each caught
by a seat and each reconstructed byte-exactly; I shipped a capsule clause
(`sel_star`) no seat could satisfy in scope and a prompt token
(`REL_ORDER_LIMIT`) with no definition in scope; I left clone artifacts in
two protocols (a stale capsule path; Cycle 5 residue in the synthesis
protocol); and my Stage 7 brief inherited F7's short run id, which blocked
the first close. None of these touched the mathematics, all are documented,
and the rule adopted mid-cycle — no sealed member is ever edited; living
state goes to unsealed files — should be a standing controller rule.

## 4. Recommendations for Ashton

1. **Stop here, as authorized.** The stop gate did not fire (no decisive
   event, no plateau), and the run ends on the cycle boundary. The synthesis
   is right that a further near-`α` null census would be a plateau, not work.
2. **If the problem is resumed under a new authorization, resume from three
   objects, in this order:** the lower-interior-window falsification search
   (TD-14, cheap, never done); the signing of the three-family expansion on
   the residual class (TD-6, the crux); and an independent re-proof, then
   formalization, of the `K₂`/`P₃` stratum sign theorem (TD-12/B2).
3. **Publishing.** The two formally verified theorems and their receipts are
   publication-grade as auxiliaries; the critic-attributed theorems should be
   published with attribution and the "informal, not independently re-proved"
   grade; the nine record corrections must replace the Cycle 5 literals
   wherever they appear. I have not edited the master ledger, any
   manuscript, or the public repository — that needs your separate
   authorization, as Codex's handover required.
4. **Registry.** No new claim needs registration: everything established is
   an auxiliary under `E993-BETA-AGG`, and the four REFUTED claims stay
   REFUTED. The run ledger (`OBLIGATIONS.csv`) carries this cycle's rows.

## 5. Controller process debt (for the decisions inbox, not promoted here)

Three post-seal edits of sealed members; two unsatisfiable or undefined
requirements shipped to seats; clone artifacts in cloned protocols; a
brief-inherited short run id; scratch paths given relative rather than
absolute (one seat wrote outside the run root); two critics' late
background jobs rewrote critiques after the Stage 4 seal (finish-first was
instructed, a process check ran clean before sealing, and both were
reconstructed). Proposed standing rules: seal only files that will never
change again; state scratch paths absolutely; require seats to kill
background jobs before their final write and re-check processes immediately
before every seal; grep cloned protocols for the previous cycle's names
before dispatch.
