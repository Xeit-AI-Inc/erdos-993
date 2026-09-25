# Cycle 1 Stage 1 Gate — r28 (controller record, 2026-09-24)

Controller: Claude Fable 5.1. Rulings are numbered and binding on every seat of Cycle 1.

## Current-state check

- Master registry 392 identities (235 V / 89 R / 26 C / 42 O) after the r27 publication; public `main`
  `8f15733`. A sibling Codex run (`erdos-993-first-interior-aggregate-dre-2026-09-24`) is ACTIVE on the
  interior aggregate and registered `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` (OPEN); it is out of scope.
- No registered key states (HS); the nearest are `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`
  (the reformulation, informal), `E993-R27-FOREST-DEGREE-LEMMA` (formal (DL)), and the r26 fibre bound
  (a different matching-type inequality, on shells) — the alias check is a Stage 3/6 duty.
- The controller's pre-run threshold-form instrument finds no failure to order 18 (`control/controller-prerun/`).

## Rulings

1. **Targets frozen.** (HS), (LC), (FC), the SDR/threshold equivalence, the census record and the
   conditional refutation record as in `SOLUTION-CONTRACT.md` §1; Lean statements §2. Run-local keys
   `E993-R28-…`, all OPEN at Stage 2 (ledger rows `R28-*`).
2. **(DL) is an input, not a target.** Every seat may cite `E993-R27-FOREST-DEGREE-LEMMA` by key; no seat
   re-proves it; no registration touches its face except a scope note at the close.
3. **(PW) stays refuted.** Any argument comparing a branch vertex with an arbitrary leaf pointwise is wrong
   by construction (`C-T2-U` Step D witness, order 5, `k = 3`).
4. **Toolchain pinned.** Lean 4.32.2 / Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`; never `elan`, `lake
   update`, `lake clean`; scratch projects bind by manual symlink.
5. **Definitions of record.** `Erdos993G1.indepCount/coeff/delta` byte-identical from the r25 award source;
   `Erdos993G1.indepDegreeSum` and `forest_degree_lemma` byte-identical from the r27 C1-LA1 source where a
   composition needs them; `occ`, `slotsAtLeast`, `leavesAtLeast` run-local per `SOLUTION-CONTRACT.md` §2 (U1
   drafts; U2 uses the same text; the synthesis reconciles).
6. **Census grades.** A horizon is a `bounded_computation` record, never a grade for (HS); the controller's
   order-18 replay is a prior.
7. **Controller's own reading, disclosed.** The controller checked the leaf-support inequality
   `c_ℓ(k) ≥ c_s(k)` (subset argument) and the layer-cake reduction before dispatch (`CONTROLLER-NOTES` R28-N-2);
   recorded as prior, not evidence.
8. **Seal discipline, path hygiene, PID-only kills, wrapper rule, residue check** — `AUTHORIZATION.md`.
9. **Early stop.** Stop gate §5 (a) or (b) at any cycle's Stage 6/7 ends the run.
10. **Codex fence.** No seat reads `experiments/erdos-993-first-interior-aggregate-dre-2026-09-24`; no r28
    registration names its target beyond `SOLUTION-CONTRACT.md` §3.1.
