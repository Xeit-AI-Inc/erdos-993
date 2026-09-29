# Cycle 3 Stage 1 Gate — r31 (controller record, 2026-09-28)

Controller: Claude Opus 5.5. Rulings are numbered and binding on every seat of this and later cycles unless a later gate amends them.
The Cycle 1 rulings 1–8 and the Cycle 2 rulings 9–15 (`control/C1-STAGE1-GATE.md`, `control/C2-STAGE1-GATE.md`) carry, amended here.

## Current-state check (refreshed at the Cycle 2 close, by the clock)

- **Cycle 2 close** (`cycles/cycle-2/CYCLE-CLOSE.md`): three more governed awards — C2-LA1 (eligibility at `p*` on the literal
  `cbGraph m`: tree, parent descent at index `p*−2`, `crossingIndex + 2 ≤ p*`, low window; the degree-50 certificate kernel-checked),
  C2-LA2 (Darroch/Newton-free closed-form favorability, both leaf classes), C2-LA3 (graph-level favorability, if closed — see the close).
  Registry: the eligibility key `formally_verified`; the Tier 1 key `proved_informal` (NOT decisive); no new keys.
- **What stands between the run and decisive event (a):** conjunct 4 of the SOLUTION-CONTRACT §2 terminal — the saturating flow on the
  literal `cbGraph m` at `p*` — in Lean. Its informal proof is complete (the composition key; the explicit criterion flow; the sector
  arc table). Its formal DAG is open at: the literal sector flow `g_sec` and its Out/In arc-sum bridges (smallest: the Out bridge with
  target distinctness), and the E1 flow over `cbGraph m` (smallest: the in-balance double count on the clone product; the `cb8R1` bridge).
- **Master:** the live master holds 510 identities (+16 path-star / finite-block keys from the concurrent Astra/Codex run, cycle 4);
  frozen at `sources/concurrent/master-510-2026-09-28/`; every r31 key is clear against it (R31-N-19). Alias-check against it.

## Rulings (Cycle 3; numbered from 16)

16. **The favorability index (clarification of `SEMANTIC-CONTRACT.md` line 14; the object is unchanged).** `Δ_p(G) := i_{p+1}(G) − i_p(G)`,
    and leaf `w` is favorable at rank `p` iff `Δ_p(T − w) < 0`, i.e. `i_{p+1}(T − w) < i_p(T − w)`. Evidence at `i_p − i_{p−1}` is
    favorability at `p − 1` and is struck (Cycle 2: T2, F1, F3 and one critic made this error).
17. **Fresh rows.** `m = 125, 128`, with `m = 140` as the larger row; controls `107, 110, 113, 116, 119, 122` (values on record).
18. **Instrument hygiene** (from the Cycle 2 F adjudication; binding): the selector as `i_{p+1}(T−t) < i_p(T−t)`; (WID) asserted
    against `Σ_F[q_t(p) − q_t(p−1)]` from an INDEPENDENT side, never as the definition of `S`; `x` scanned through `α`; the contract's
    `G = (1+2x)^8 + x(1+x)^8`, never a docstring's or an allocation's retyping.
19. **Carries.** Byte-identical from frozen governed runs (`sources/c1-results/runs/`, `sources/c2-results/runs/`), keyed by (origin
    award, entry, digest), bound to the origin's kernel receipt. An origin terminal is carried with the single keyword edit
    `theorem` → `lemma` and a recorded reversibility check (R31-N-15). A dependency-closed subset of a layer is a valid carry (R31-N-16).
20. **Refuted mechanism.** T2's two-binomial ascent tool (G′) is REFUTED (smallest counterexample `(a,b,k) = (2,0,1)`); never an input.
21. **Gate lines** (replace ruling 14): `COND4_formal: advanced|not_advanced|blocked`; `E1_formal: advanced|not_advanced|blocked`;
    `TERMINAL_integration: advanced|not_advanced|blocked`; `cut_candidate: none|<one-line description>`.
22. **Stop gate** (armed since the Cycle 2 close): a plateau cycle ends the run; a decisive event ends it at once. **The Claude Fable
    5.1 (high) checkpoint analysis follows the Cycle 3 close** (Ashton's charter).
