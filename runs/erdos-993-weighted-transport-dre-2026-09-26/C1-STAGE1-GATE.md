# Cycle 1 Stage 1 Gate — r30 (controller record, 2026-09-26)

Controller: Claude Fable 5.1. Rulings are numbered and binding on every seat of Cycle 1.

## Current-state check

- Master registry 434 identities (262 V / 96 R / 26 C / 50 O), list format, byte-identical to the public mirror at
  `0411905ff601d07f2e79b03a07c31d708dc04efd` (HEAD of public `main`; nothing after the handoff commit; working tree clean).
  The charter's reference state matches the live state. The lower-region run is COMPLETE (six cycles; `RUN-STATE.json`
  `completed`; terminal ledger 434 rows) and is frozen under `sources/lower-region/`; r29 is complete and frozen under
  `sources/r29/`. Neither is reopened.
- Key statuses entering the run: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` OPEN (`open_successor_proposal`; Cycle 3 intake
  of the lower-region run); `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` OPEN; `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT`
  VERIFIED `proved_informal`; `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY` VERIFIED `proved_informal`; the four order-band /
  first-shell keys VERIFIED `formally_verified`; `E993-ORDINARY-TM-LOWER-REGION-AGGREGATE` VERIFIED `computer_assisted`; the two
  path-star cutoff keys VERIFIED `exact_factor_computer_assisted_analytic_proof`; the three spider/orbit keys VERIFIED
  `proved_informal`; r29's five keys as registered; the ten refuted mechanism keys of `SOLUTION-CONTRACT.md` §3.2 REFUTED.
- No registered key states (WID); the nearest are the incidence-deficit identity (extension accounting, not a weight/layer
  identity) and the tagged-shadow bound (an inequality). Alias check lexical and mathematical: no collision; registered
  run-local as `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (OPEN; 435 run-local claims).
- **Universal-claim counterexample gate (controller, Stage 1) for (HALL):** the claim-identity file (434), the lower-region
  terminal records and the C6 route evidence were searched for a deficient cut of THIS relation with THIS weight: none is
  registered or reported. The refuted keys nearest to (HALL) refute DIFFERENT mechanisms (deletion-only Hall; the literal
  Delete/Retag relations; unit-capacity own-support matching; per-leaf injectivity; occupancy domination). The two corrected
  heterogeneous flows (C6-F5 root correction; AF-verified) and the three `T_m` quotient flows (C6-T5) SATURATE. The C6-U5
  deletion-only sector shortfall (`|R_490|/491`) is not a cut of the mixed relation (switch exits exist). The controller's
  pre-run instrument (`control/controller-prerun/wt_check.py`; report `wt_report.json`) finds: the weight identity holds on
  all 4,016 (tree, p, F) checks to order 10; every one of the 515 eligible (tree, p) rows on trees to order 14 — and, in the two
  follow-on runs, all 1,043 rows to order 15 and all 3,806 rows to order 16 — has a saturating flow, with the DELETION arcs
  alone; `K_{1,12}` at `p = 8`, the two path-star trees and the `T_m` rows reproduce
  the recorded values; on `CB(8, 92)` at `p = 492` the recipe gives `n = 1567`, `α = 829`, `x = 490`, 737 favorable leaves, `S < 0`,
  the sector ratio `492/491` and shortfall `|R_490|/491` exactly, and the switch-free source family `X'` (no branch with
  exactly one support) is NOT deficient (its positive-weight deletion shadow is about 17.8 times its size). No counterexample
  is known. A prior, never evidence. Recorded in `control/CONTROLLER-NOTES.json` (R30-N-2).
- Transport preflight (2026-09-26): alias `opus` → `claude-opus-5-5[1m]`; alias `sonnet` → `claude-sonnet-5`; file reads working.

## Rulings

1. **Targets frozen.** (HALL) Tier 1 at its registry statement; (WID) Tier 1′ run-local; outcome-B lemmas and (CUT) as in
   `SOLUTION-CONTRACT.md` §1; Lean drafts §2; the primary aggregate is context and changes only by its own certificate.
2. **Weight and relation fidelity are binding on every number.** `w_F` is the active-tag weight; the relation is (D) ∪ (S)
   literally; `F` fixed at the original rank `p`; every instrument asserts `supply − capacity = S(T, p)` and nonempty
   eligibility before any other output (SEMANTIC-CONTRACT §1.2; SOLUTION-CONTRACT §3.3). A seat whose instrument counts
   `|F ∩ B|` is struck with every number it produced.
3. **Mechanism ≠ aggregate; finite ≠ universal; ordinary ≠ governed** (SOLUTION-CONTRACT §3.1). A deficient cut refutes (HALL)
   at `(T, p, X)` only; a saturating flow at any horizon proves nothing universal; no RTree wording.
4. **Refuted mechanisms stay refuted** (§3.2). A route proposing a mechanism states on its face why it is not one of the ten
   listed keys or the own-support unit-capacity rule.
5. **Closed regions are not re-proved** (§3.6): the high tail, the order bands `n ≤ 2p + 2`, the `T_m`/spider/path-star family
   theorems. A route may USE them with attribution; the unresolved domain is `2p + 3 ≤ n ≤ 4p − 8`, `p ≥ 6` (plus the finite
   `p = 6, 7` composition at its census-dependent grade, never in a proof).
6. **Imported informal results at exact grades** (§3.5): (LIFT) never supplies quotient feasibility; its converse (original
   saturating flow ⇒ quotient saturating flow; quotient deficit ⇒ original deficient cut exists, and an invariant one) may be
   used once stated and proved on the face; (DCB) never supplies the budget; `T_m` flows are `bounded_computation`.
7. **Census discipline** (§3.4): bounded computation discovers structure; horizons are attained, never filtered; a census with
   zero eligible rows is evidence of nothing; no seat replaces the proof task with a huge census or repeated `T_m` checks. The
   controller's pre-run instrument is a PRIOR.
8. **Toolchain pinned.** Lean 4.32.2 / Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`; never `elan`, `lake update`, `lake clean`;
   `cd` into the pinned project before ANY `lake`/`lean`; scratch projects bind by manual symlink.
9. **Definitions of record.** Entries 1–18 of the first-interior source byte-identically (`C4LA1.*`, `C5LA1.*`,
   `Erdos993G1.*`, `E993Interior.taggedFamily`); the transport definitions are NEW in namespace `E993Transport` and are frozen
   only at Stage 7 (the §2 drafts bind their MEANING now; U2 may propose equivalent Lean phrasings with the equivalence proved).
10. **Seal discipline, path hygiene, PID-only kills, wrapper rule, residue check, two-part model disclosure, living-file rule,
    digest-record rule, companion rule** — `AUTHORIZATION.md`.
11. **Stop gate.** `SOLUTION-CONTRACT.md` §5: recorded now, armed from the Cycle 2 close; decisive events halt at any cycle.
12. **Fenced roots.** No seat reads the live lower-region root, the first-interior root, the r24–r29 roots, the master-ledger
    directory or the public repository working tree — their relevant files are frozen copies under `sources/` with digests.
