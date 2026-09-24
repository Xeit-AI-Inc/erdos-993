# Cycle 1 Stage 1 Gate — r26 (controller record, 2026-09-23)

Controller: Claude Fable 5.1. This gate freezes the target and records the controller's Stage 1
findings. Rulings are numbered and binding on every seat of Cycle 1.

## Current-state check (charter: "first update your understanding")

- Public repository `Xeit-AI-Inc/erdos-993`: `main` = `origin/main` = `6e772d9` (fetched
  2026-09-23; the r25 addendum publication is the head; no later commit). `CLAIM-IDENTITY.json` there
  has 363 identities, identical to the master registry.
- Master registry `experiments/erdos-993-master-ledger-2026-09-04/CLAIM-IDENTITY.json`: 363
  identities, `last_updated` 2026-09-23 (the addendum close). Master `LEDGER.md`: the r24 section
  (line 780 on) is the statement of record for `(RC)`: "`(RC)` … is proved on the flat residual
  subclass … and on the whole `T_m` family … but is otherwise exactly as open as after r24 Cycle 4";
  "Registry: no new claim". No later run (r25, its addendum) touched the aggregate. `(RC)` has NOT
  been closed by anyone; there is no registry key for it (Ruling 1).
- The r24 award `C5-LA1` (`C5LA1.topRankResidualIdentity`) is `formally_verified` with kernel
  receipt, informal audit and fidelity review in `sources/r24/c5-la1/` (copied from
  `runs/lean-2026-09-17-c5-top-rank-residual-identity/`; digests in `control/SOURCE-DIGESTS.json`);
  the expected statement's SHA-256 `4713d55cf0cdbb1763946e8ddf35d337e396c63b78104b0fd1bd8935acaaa2b6`
  is the contract's.

## Rulings

1. **Target frozen.** `(RC)` is the statement of `SEMANTIC-CONTRACT.md` §3 with the four C5-LA1
   hypotheses verbatim; the Lean target is `SOLUTION-CONTRACT.md` §2. Run-local candidate key
   `E993-R26-TOP-RANK-RESIDUAL-SIGN`, status OPEN at Stage 2, row `R26-RC` in `OBLIGATIONS.csv`.
   The charter's paraphrase (`p = α−1 ≥ x(T)+2`, `a = α(T[D])`, `M = i_a(T[D])`) is adopted only
   where it coincides with the frozen definitions; `a := α − ℓ` and `M := i_α(G)` are the
   definitions of record, and `a = α(T[D])`, `M = i_a(T[D])` are statements to prove (§3 of the
   semantic contract).
2. **The candidate is under attack.** No seat cites the packet's proof, review or order-≤12 check as
   evidence. Every step is re-derived (T), attacked (F) or compiled (U) in-run.
3. **Controller pre-run replay, disclosed and withheld.** Before Stage 2 the controller read the C6
   critique `C-T1-U`, the C6 T adjudication and the adjudicator scratch (`scan.py`, `adj_engine.py`)
   and ran its own replay of the "1,420 trees" count on orders 7–16 (`control/controller-prerun/`;
   NOT a Stage 2 member, so F2's replay is independent). The controller's finding is recorded there
   and will be released to the Stage 5 adjudicators as a controller fact; it is not evidence for any
   seat. Whatever F2 finds is adjudicated against the original artifacts, not against the
   controller's replay.
4. **Two census figures, reconciled not averaged.** The master ledger says "the eligible top-rank
   residual class censused to order 17, 16,424 trees"; the C6 synthesis TD-6 says "16,134
   exhaustively enumerated members (orders 4–17, three instruments)". A seat quoting either names its
   source; F1's own count to order 17 is the run's figure of record once admitted.
5. **`hyp-eligible` stays.** Even if a proof uses `hyp-eligible` only through `α ≥ 3` (to exclude
   `P_3`), the statement of record keeps the C5-LA1 hypothesis verbatim (composition with (RI)
   requires it; r24 controller ruling). A route may state the sharper informational form
   "`S ≤ 0` for every residual tree with `α ≥ 3`" as a separate candidate.
6. **Provenance gap is a finding.** If no original artifact computes the 1,420 count, F2 records
   "provenance gap" and the predicate that reproduces the number, if any; the correction record
   (Tier 2) is drafted by F2, checked by its critics, ruled on by the F adjudicator, and registered
   only after the synthesis names it and (being first STATED at a review stage if the adjudicator
   changes it) an isolated second read confirms it.
7. **Lean work in seats is scratch.** U1–U3 compile fragments in scratch projects bound to the shared
   Mathlib by symlink; nothing a seat compiles is an award. The governed workflow (init with the
   canonical run id, bind, contract, informal audit, kernel, fidelity review, close) runs at Stage 7
   under the controller after the synthesis names the award group.
8. **Seal discipline (r25 addendum A1-E-d).** Agents records and dispatch records are sealed after
   the stage completes; no sealed member is edited; the controller notes file
   (`control/CONTROLLER-NOTES.json`) is living and never a packet member until the close.
9. **Path hygiene.** Seats write only under their assigned return path and scratch directory; every
   replay command targets `<run root>/scratchpad/c1-<seat>-replay`; no `/tmp`, no session
   scratchpad, no wall-clock in hashed outputs.
10. **Early stop.** If Cycle 1's synthesis funds the (RC) award and Stage 7 closes it
    `formally_verified`, the run ends at the Cycle 1 close (`AUTHORIZATION.md`); the controller's
    final analysis and publication follow.
