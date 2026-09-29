# Cycle 2 Stage 1 Gate — r31 (controller record, 2026-09-28)

Controller: Claude Opus 5.5. Rulings are numbered and binding on every seat of this and later cycles unless a later gate amends them.
Cycle 1's rulings 1–8 (`control/C1-STAGE1-GATE.md`, a Stage 2 member) carry, amended as stated here.

## Current-state check (refreshed 2026-09-28 ~00:40–01:15 EDT, by the clock)

- **Master registry:** the live master holds **494** identities: the 491 frozen at the charter plus three path-star keys added at 00:03 by
  the concurrent Astra/Codex run `erdos-993-absolute-compensation-dre-2026-09-27` (RUNNING; the priority-2 line; not this run's object).
  Frozen for alias checks as `sources/concurrent/master-494-2026-09-28/`. Every r31 key is clear against it.
- **Run-local registry:** 497 (491 + six r31 keys registered at the Cycle 1 close); ledger 22 rows; lint clean.
- **Cycle 1 record:** `sources/c1-results/` (the synthesis, the close, the adjudications, the six second reads, the Stage 7 closeout and
  the three formally verified award runs), digest file `sources/c1-results/SOURCE-DIGESTS.json`.
- **Target keys entering Cycle 2:** Tier 1 registered `computer_assisted` on the class (not decisive); (L-S)_top template
  `formally_verified`; the composition `proved_informal`; eligibility `computer_assisted`; the block-descent node `formally_verified`;
  (HALL) at full scope OPEN.

## Rulings (Cycle 2; numbered from 9)

9. **Fresh rows.** Ruling 2's fresh rows become `m = 116, 119` (with `m = 137` as the larger row); `m = 107, 110, 113` are control rows
   whose values are on record (SR-3, SR-5).
10. **Grades.** A fixed polynomial positivity certificate is `computer_assisted`; a conjunction takes its weakest input's grade
    (R31-N-8, confirmed by SR-5). A route that removes a fixed certificate from a chain says so explicitly and names what replaces it.
11. **Names.** "TOP-RANK" is ambiguous in the registry (it means `α − 1` in R26/R29 keys): new keys name the rank `16M-PLUS-4-OVER-3`
    explicitly. The criterion key is the HOMOGENEOUS mark-clone key `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`;
    never "E1-R". Avoid the phrase "coefficient descent". Working labels (S1..S9, Lemma A/B, R-n, Row 5, the `θ*` law) never appear in a
    proposed key or registration text.
12. **Carries.** Lean seats carry byte-identically from the frozen award runs under `sources/c1-results/runs/` (C1-LA1: the allocation
    definitions; C1-LA2: the CB layer, itself carrying r30 C6-LA2 entries 1–21, 0035, 0123, 0124; C1-LA3: the two-binomial tools) or from
    `sources/r30/lean/`, keyed by (origin award, entry, digest), and verify each against its origin's `FORMALIZATION-STATE.json` and
    kernel receipt. Never r30 C1-LA2 entries 0014–0021; never a seat's own re-typed copy.
13. **No re-proving the closed.** C1-LA1, C1-LA2, C1-LA3 and the six second-read verdicts are inputs. A route that finds a defect in one
    reports it exactly (statement, instance, instrument) — that is a finding, not a licence to re-derive around it.
14. **Gate lines.** Every return and critique includes, under its verdict, exactly: `ELIG_formal: advanced|not_advanced|blocked`;
    `HALL_formal: advanced|not_advanced|blocked`; `FAV_darroch_free: advanced|not_advanced|obstruction_found`;
    `cut_candidate: none|<one-line description>`. Summaries for the controller, never evidence. (Replaces ruling 6.)
15. **Stop gate armed** from this cycle's close (SOLUTION-CONTRACT §5): a plateau cycle (no advance on any of the three gate objects
    above, no new registration above `bounded_computation`) ends the run early; a decisive event ends it at once.
