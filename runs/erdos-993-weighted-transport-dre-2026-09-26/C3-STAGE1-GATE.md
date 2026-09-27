# Cycle 3 Stage 1 Gate — r30 (controller record, 2026-09-26)

Controller: Claude Fable 5.1. Rulings are numbered and binding on every seat of Cycle 3. The Cycle 1 rulings
(`control/C1-STAGE1-GATE.md`, 1–12) and the Cycle 2 rulings (`control/C2-STAGE1-GATE.md`, 13–20) remain in force verbatim; this
gate records the state change at the Cycle 2 close and adds the Cycle 3 rulings.

## Current-state check

- Master registry unchanged at 434 identities, list format, byte-identical to the public mirror at
  `0411905ff601d07f2e79b03a07c31d708dc04efd`. Nothing is published before the terminal close. The run-local registry
  (`control/CLAIM-IDENTITY.run-local.json`) carries 443 claims: the master's 434 plus (WID), the Cycle 1 keys (Hall ⇒ S ≤ 0; INV; NM)
  and the Cycle 2 keys (C2-LA1; the second-eigenvalue theorem; the `CBstar` sector deficit; the `G_k` family; the equitable lift).
  Lint at the Cycle 2 close: 0 findings, 0 warnings (`control/CLAIM-STATUS-LINT-c2-close.json`).
- Key statuses entering Cycle 3: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` OPEN (five Cycle 2 scope notes);
  `formally_verified`: `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`, `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`,
  `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY`; `proved_informal`: (INV), (NM),
  `E993-R30-TERNARY-COVER-SECOND-EIGENVALUE`, `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`,
  `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`, `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT`;
  the primary aggregate OPEN; the ten refuted mechanism keys REFUTED.
- **Universal-claim counterexample gate for (HALL), Cycle 3:** the Cycle 2 record adds no deficient cut at any eligible row. The
  one deficit found (SR-C2-2's refutation of the synthesis's (R-ii) wording, `CB(3,2)` at `p = 5`) is at a NON-eligible rank and
  refutes a reduction's wording, not (HALL). Sector Hall holds at every eligible rank of the three sector-deficient CB rows; every
  computed full row saturates with deletion arcs alone. No counterexample is known. A prior, never evidence.
- **Known gaps the portfolio targets:** the coupled families at the three `CB(8,·)` rows (sector + positive-weight V + positive-weight
  S/O) — Hall on the choke forest `T′` is the smallest unproved lemma; whether any tree of order 20–1464 is switch-necessary;
  sector Hall at `CB(8,108)/577` and `CB(7,144)/673`; the `T(m,2)` premises; (INV)'s quotient clause and (NM) have no Lean.
- Transport preflight carried from Cycle 1 (same session): alias `opus` → `claude-opus-5-5[1m]`; alias `sonnet` → `claude-sonnet-5`.

## Rulings (Cycle 3; numbered from 21)

21. **Cycle 1 and Cycle 2 records are sources at their recorded grades** (`cycles/cycle-{1,2}/CYCLE-CLOSE.md`, the sealed syntheses,
    the three award directories, the ten second reads). Nothing in them is re-proved as a contribution. Items the reads STRUCK
    (Cycle 2 close §6) are never cited as evidence. The synthesis's (R-ii) is used only in its repaired form.
22. **Lean text of record.** C1-LA1's `Main.lean` (`86b59c6c…`) remains the definitions of record; C2-LA1's `Main.lean` (`a9cf3b81…`,
    receipt-bound) is the text of record for `famMap`, `phi`, `canonMin` and the invariant-family theorem. A Cycle 3 award seeds from
    C1-LA1 byte-identically and may carry C2-LA1's new declarations byte-identically through the registrar with its receipt binding.
23. **Certified statements are cited at their exact scope.** C2-LA1 is existential (an invariant positive deficient family exists);
    "the witness is `X_min`" is proof content. Companions on any award's face are `proved_informal`. No seat writes
    `formally_verified` for anything without a governed `VERIFICATION-REPORT.json` saying so.
24. **Non-falsifiable checks are struck (ruling 17, restated with the Cycle 2 cases):** `S` defined as the difference (U2), both sides
    from the same polynomials (T1), no assertion at all (T2 §7). `F_p` derived on every row.
25. **Quotients and certificates.** An orbit or equitable quotient deficit is admissible as a deficit only with the registered lift
    (INV / the equitable lift) applied at its stated hypotheses (ℕ weights constant on classes; two-sided local regularity) and the
    original class-union cut exhibited (`X`, `N(X)`, both sums; two instruments). A rational saturating flow certificate or an LP-dual
    potential (U2's route) must come with its verification lemma proved on the face.
26. **Registration timing and seal timing** (rulings 18, 19) stand: the run-local registry is frozen from the Cycle 3 Stage 2 seal to
    the Cycle 3 second-reads packet seal; no stage seals before every seat's completion notification; the validator rejects
    placeholder tokens; the Stage 3 read-boundary disclosures record is written BEFORE the Stage 4 dispatch (lesson R30-N-18).
27. **Record-text discipline (lesson R30-E-d).** Registration text is lifted only from fenced ```text blocks; blockquote markers are
    stripped at line starts only; every lifted statement is diffed against its source before the registry is written.
28. **Stop gate ARMED; controller checkpoint after this cycle's close.** The Cycle 3 synthesis rules on the gate explicitly; the
    controller then files the mid-run review (r25 pattern) before Cycle 4 is dispatched.
