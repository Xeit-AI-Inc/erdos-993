# Cycle 1 Stage 1 Gate — r27 (controller record, 2026-09-24)

Controller: Claude Fable 5.1. Rulings are numbered and binding on every seat of Cycle 1.

## Current-state check (charter: "first refresh the ledger again")

- Public `main` = `origin/main` = `0b4bbdbfccbf960d270a2ac73d05c99ef32c20d6` (fetched 2026-09-24); master
  ledger SHA-256 `739ed7ce…` and registry `47697cba…` match the charter's figures; 370 identities
  (214 V / 89 R / 26 C / 41 O). No task has imported the FLNYZ §8 result: no registry key mentions the degree
  lemma, the extension inequality or the linear bound; `E993-R25-RANK5-CEILING-SHARPENED-TO-25` is still the
  rank-5 ceiling of record with its residue orders 22–25 (Ruling 1).
- The formal forest order bound of record is `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` (`(k+1)²`, award
  `Erdos993G1.ForestOrderBound.forest_descent_order_bound`, frozen with receipts under
  `sources/r25/c4-forest-descent-order-bound/`); its Lean source carries the G1 definitions of record
  (`indepCount`, `coeff`, `delta`) that this run reuses byte-identically.
- The external paper §8 was fetched by the controller (seats have no network) and frozen
  (`sources/external/paper/`); the external Lean finite slice is frozen from the packet's audit copy.

## Rulings

1. **Targets frozen.** (DL), (EX), (LB), (R5), (XR), (K1) and the two records as in `SOLUTION-CONTRACT.md`
   §1; Lean statements §2. Run-local keys `E993-R27-…`, all OPEN at Stage 2 (ledger rows `R27-*`).
2. **External results are inputs under audit.** No seat cites the paper or the external Lean as evidence of
   a theorem; every step is derived in-run (T), attacked (F) or compiled in-run (U).
3. **No external Lean text enters any project.** The audit copy of `junwei-lu/Erdos_993_Tree_Independent_Set_Unimodality`
   carries no LICENSE file; until a license is established, its text is read for audit and proof structure
   only, never copied, transcribed line-by-line, or published. The formal award, if any, is written in-run
   on the G1 definitions; the paper's mathematics is attributed on every face. (If Ashton or a successor
   establishes a permissive license, a byte-identical port becomes an option for a successor run; not this
   one.)
4. **Toolchain is pinned.** Lean 4.32.2 / Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`; the external
   project's 4.29.1 is never installed; `elan` never runs.
5. **Definitions of record.** `Erdos993G1.indepCount/coeff/delta` byte-identical from the r25 award source
   (entries 1–3); `indepDegreeSum` and `firstDescent` are run-local definitions fixed by the contract (U1
   drafts; U3 uses the same text; the synthesis reconciles).
6. **Grades of compositions.** (K1) at `x ≤ 5` inherits the census's grade; no formal grade for any
   composition that uses the order-≤21 census or an informal r25 claim (fence §3.4).
7. **Controller's own reading, disclosed.** The controller checked (EX) ⇐ (DL) + double count, and (LB),
   (R5), (XR) as contrapositives, before dispatch (`control/CONTROLLER-NOTES.json` R27-N-2); recorded as
   prior, not evidence.
8. **Seal discipline, path hygiene, PID-only kills, wrapper rule** — as r26 (AUTHORIZATION.md standing rules).
9. **Early stop.** If Cycle 1's synthesis funds the (DL)/(EX)/(LB) awards and Stage 7 closes them
   `formally_verified` with the residue closeout recorded, the run ends at the Cycle 1 close.
10. **Census horizon of record.** The r25 order-≤21 forest census (8,355,831 classes) is cited as r25's
    bounded computation (replayed by both r25 Cycle 4 critics); F3 attempts an in-run replay to a stated
    horizon; whatever horizon it attains is this run's figure, never a filter bound.
