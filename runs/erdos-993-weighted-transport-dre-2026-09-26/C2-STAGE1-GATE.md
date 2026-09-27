# Cycle 2 Stage 1 Gate — r30 (controller record, 2026-09-26)

Controller: Claude Fable 5.1. Rulings are numbered and binding on every seat of Cycle 2. The Cycle 1 rulings
(`control/C1-STAGE1-GATE.md`, 1–12) remain in force verbatim; this gate records the state change at the Cycle 1 close and adds the
Cycle 2 rulings.

## Current-state check

- Master registry unchanged at 434 identities, list format, byte-identical to the public mirror at
  `0411905ff601d07f2e79b03a07c31d708dc04efd`. Nothing is published before the terminal close. The run-local registry
  (`control/CLAIM-IDENTITY.run-local.json`) carries 438 claims: the master's 434 plus (WID) and the three Cycle 1 keys. Lint at the
  Cycle 1 close: 0 findings, 0 warnings (`control/CLAIM-STATUS-LINT-c1-close.json`).
- Key statuses entering Cycle 2: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` OPEN (scope note SR-14);
  `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` VERIFIED `formally_verified` (C1-LA1);
  `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` VERIFIED `formally_verified` (C1-LA2);
  `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` VERIFIED `proved_informal`;
  `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` VERIFIED `proved_informal`;
  `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` OPEN (scope note SR-16); the ten refuted mechanism keys of
  `SOLUTION-CONTRACT.md` §3.2 REFUTED, including `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION` (scope note SR-15:
  the literal inequality already fails at order 11; the registered order-14 witness never asserted minimality).
- **Universal-claim counterexample gate for (HALL), Cycle 2:** the Cycle 1 record adds no deficient cut. Every eligible free-tree row
  to order 19 (195,683) saturates with deletion arcs alone; the three sector-deficient `CB` rows with `n ≤ 1600` have whole-sector
  switch exits thousands of times their deficit; the non-tree separating example `P_3 ⊔ K_{6,3,3,3}` is outside the tree scope of
  (HALL). No counterexample is known. A prior, never evidence.
- **Known gaps the portfolio targets:** switch arcs have never been load-bearing on any computed tree row; the fixed selector
  `F_p(T)` has never bound (always the whole leaf set); deletion-only Hall fails first somewhere in orders 20–1465 (shape unknown
  outside `CB`); sector Hall on `CB(8, 92)` at `p = 492` rests on the cited spectral node (n1); the (INV) and (NM) keys have no
  Lean certificate.
- Transport preflight carried from Cycle 1 (same session): alias `opus` → `claude-opus-5-5[1m]`; alias `sonnet` →
  `claude-sonnet-5`.

## Rulings (Cycle 2; numbered from 13)

13. **Cycle 1 record is a source at its recorded grades.** `cycles/cycle-1/CYCLE-CLOSE.md`, the sealed synthesis, the two award
    directories and the five second reads are Stage 2 members. Nothing in them is re-proved as a contribution; a repeated census of
    already-saturating rows is not evidence. Every Cycle 2 claim is graded on its own evidence.
14. **Lean text of record.** The eight `E993Transport` definitions are frozen at C1-LA1's `Main.lean`
    (`runs/lean-2026-09-26-c1-la1-active-tag-weight-identity/LeanProject/LeanProof/Main.lean`). U1 seeds its scratch project from
    that file byte-identically (manual symlink of `.lake/packages`; `cd` before any `lake`/`lean`). A Cycle 2 award that needs
    C1-LA2's theorem carries C1-LA1's definitions and re-proves or re-carries the theorem against them (R30-N-8).
15. **Deletion-only statements** name on their face why they are not `E993-R23-LITERAL-DELETE-ONLY-HALL` (weight, relation, sector
    object). A deletion-only deficit is NOT a (CUT); only a deficit of the mixed relation (D) ∪ (S) is. A (CUT) candidate needs two
    independent instruments and then an isolated second read before any status moves; the route flag stays `headline_resolved: no`.
16. **Quotients.** An orbit or equitable quotient deficit is admissible as a deficit ONLY with the lift/converse stated and proved
    on the face (INV for orbit quotients; U2's equitable lift must be proved before it is used by any seat); the original invariant
    cut must be EXHIBITED (`X`, `N(X)`, both sums).
17. **Non-falsifiable checks are struck** (C-T2-F/U finding): a quantity computed as the balancing term and then "confirmed" is
    not a check. Every instrument asserts `supply − capacity = S(T, p)` from independently computed sides.
18. **Registration timing (lesson R30-I-2).** The run-local registry is frozen from the Stage 2 seal until the second-reads packet
    of the cycle is sealed; cycle-close registrations run only after that seal. Capsules carry the Stage 2 snapshot of the registry
    (`control/snapshots/`).
19. **Seal timing (lesson R30-I-1).** No stage seals until every seat's completion notification has arrived; the admission validator
    rejects placeholder tokens (`*_PLACEHOLDER`) in any return.
20. **Stop gate ARMED** (`SOLUTION-CONTRACT.md` §5) from the Cycle 1 close. The Cycle 2 synthesis must rule on it explicitly.
