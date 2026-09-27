# Cycle 4 Stage 1 Gate — r30 (controller record, 2026-09-27)

Controller: Claude Fable 5.1. Rulings are numbered and binding on every seat of Cycle 4. The Cycle 1 rulings
(`control/C1-STAGE1-GATE.md`, 1–12), the Cycle 2 rulings (`control/C2-STAGE1-GATE.md`, 13–20) and the Cycle 3 rulings
(`control/C3-STAGE1-GATE.md`, 21–28) remain in force verbatim; this gate records the state change at the Cycle 3 close, the
controller checkpoint's decision, and adds the Cycle 4 rulings.

## Current-state check

- Master registry unchanged at 434 identities, list format, byte-identical to the public mirror at
  `0411905ff601d07f2e79b03a07c31d708dc04efd`. Nothing is published before the terminal close. The run-local registry
  (`control/CLAIM-IDENTITY.run-local.json`) carries 448 claims: the master's 434 plus the Cycle 1 keys (WID; Hall ⇒ S ≤ 0; INV;
  NM), the Cycle 2 keys (C2-LA1; the second-eigenvalue theorem; the `CBstar` sector deficit; the `G_k` family; the equitable lift)
  and the Cycle 3 keys (C3-LA1; GK-SIGN; E1; E4+G1; the five-row deletion-Hall key). Lint at the Cycle 3 close: master 0 findings, 0
  warnings (`control/CLAIM-STATUS-LINT-c3-close.json`); run-local with ledger and distinctions 1 inherited alias-pattern finding on
  the r21 row `R21-C1-T6` (not a regression; `control/CLAIM-STATUS-LINT-c3-close.run-local.json`).
- Key statuses entering Cycle 4: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` OPEN (ten scope notes across Cycles 2–3);
  `formally_verified`: `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`, `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`,
  `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY`,
  `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR`; `proved_informal`: (INV), (NM),
  `E993-R30-TERNARY-COVER-SECOND-EIGENVALUE`, `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`,
  `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`, `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT`,
  `E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE`, `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`,
  `E993-R30-SELF-WITNESSED-STAR-FOREST-SECTOR-POSITIVE-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM`; `computer_assisted`:
  `E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK`; the primary aggregate OPEN; the ten refuted mechanism
  keys REFUTED.
- **Universal-claim counterexample gate for (HALL), Cycle 4:** the Cycle 3 record adds no deficient cut at any eligible row. Six
  switch-necessary rows are on record (five CB first ranks; `G(8^82, 7^2)/448`); at none is the sector, or any computed family,
  deficient under (D) ∪ (S). The gate's Cycle 3 question ("is any tree of order 20–1464 switch-necessary?") is answered yes at
  order 1427 (not a proved minimum). The open question for Cycle 4: does any eligible row of any tree have a deficient family under
  (D) ∪ (S)? — F1's object.
- **Controller checkpoint (ruling 28) filed:** `control/CONTROLLER-CHECKPOINT-C3.md`. Decision (§4.5): continue into Cycle 4 with a
  PRE-ARMED plateau test at its close (ruling 30 below).

## Rulings (Cycle 4; numbered from 29)

29. **Cycle 1–3 records are sources at their recorded grades** (`cycles/cycle-{1,2,3}/CYCLE-CLOSE.md`, the sealed syntheses, the four
    award directories, the seventeen second reads). Items the reads STRUCK (Cycle 3 close §6) are never cited as evidence; the three
    Stage 6 key names of Cycle 3 are aliases, never the names of record. E1 is cited as a SUFFICIENT criterion (`CB(1,7)/10` fails
    it and saturates); the open lemma at the three `CB(8,·)` first ranks is (O2) as narrowed by SR-C3-4, not the synthesis's R1.
30. **Pre-armed plateau test (checkpoint §4.5).** Cycle 4 is ruled a plateau, and the run proceeds to its terminal close after this
    cycle, unless the Cycle 4 synthesis admits at least one of: (a) a parameter-uniform restricted-scope (HALL) theorem on an
    infinite eligible family at `proved_informal` or better; (b) full (HALL) with switch arcs load-bearing at one eligible
    switch-necessary row; (c) a (CUT) candidate surviving two instruments; (d) a Lean award beyond Cycle 4 U1's seeds together with
    one of (a)–(c). The synthesis rules on (a)–(d) explicitly by letter. This is a controller pre-commitment, not a change to
    SOLUTION-CONTRACT §5; the six-cycle ceiling stands.
31. **Central-obligation line.** Every route return carries, in its summary, the line `central obligation attempted: yes | no` naming
    the allocation's stated object, and every `S` assertion names its two instruments (the return is inadmissible at Stage 3 without
    both; lesson of Cycle 3's F1 and U2).
32. **Lean text of record.** C1-LA1's `Main.lean` (`86b59c6c…`), C2-LA1's (`a9cf3b81…`) and C3-LA1's (`22e3f81c…`; receipt
    `9c7d8434…`) are the definitions and theorems of record; a Cycle 4 award seeds byte-identically through the registrar with each
    origin's receipt binding, keyed by (origin award, entry, digest) since entry numbers collide across awards.
33. **Key names are predicates.** A proposed key name that is false when read without its hypotheses is renamed before
    registration (three Cycle 3 cases); the synthesis checks each proposed name against its statement's hypotheses and states the
    check.
34. **Seal discipline (lesson R30-I-3).** No seal follows a check through a pipe; the checker runs alone and its exit code is tested
    before any manifest is written. A manifest written in breach is renamed `superseded-<seal8>` and cited nowhere.
35. **Alias fields.** An aliases element may not contain `:` or `[`; a registration block's ALIASES line carries names only (lesson
    R30-E-f; two keys repaired at the Cycle 3 close).
36. **Contract erratum R30-E-g.** `SEMANTIC-CONTRACT.md` §1.1's "smallest eligible trees have order 13" is false (eligible trees at
    orders 11 and 12, all in the closed band `n ≤ 2p + 2`); the sealed file is not edited; no seat cites the sentence; any order
    census a seat reports derives its own count.
37. **Registration and seal timing** (rulings 18, 19, 26) stand: the run-local registry is frozen from the Cycle 4 Stage 2 seal to the
    Cycle 4 second-reads packet seal; no stage seals before every seat's completion notification; the Stage 3 disclosures record is
    written from the returns' own disclosure sections BEFORE the Stage 4 dispatch.
