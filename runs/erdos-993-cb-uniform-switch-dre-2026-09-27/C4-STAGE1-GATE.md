# Cycle 4 Stage 1 Gate — r31 (controller record, 2026-09-28)

Controller: Claude Opus 5.5. Rulings are numbered and binding on every seat of this and later cycles unless a later gate amends them.
The Cycle 1–3 rulings 1–22 (`control/C1-STAGE1-GATE.md`, `control/C2-STAGE1-GATE.md`, `control/C3-STAGE1-GATE.md`) carry, amended here.
Session effort read from the host at this gate: `high` (checkpoint gap 8; every seat inherits it; Cycles 1–3 unrecorded, disclosed).

## Current-state check (refreshed at the Cycle 3 close, by the clock)

- **Cycle 3 close** (`cycles/cycle-3/CYCLE-CLOSE.md`, packet `afddb3e1…`): C3-LA1 `formally_verified` — the clone-level E1 transport at
  `p*` for every `q` (`E993Transport.cb8_E1_cloneTransport_topRank`). Seven governed awards in all. No new key, no grade change; Tier 1
  `proved_informal` (NOT decisive). T1's Lean statement `clone_fiber_card` REFUTED (truncated ℕ subtraction).
- **Checkpoint** (`control/CHECKPOINT-ANALYSIS-C3.md`, Claude Fable 5.1 high): CONTINUE. Conjunct 4 is the only open formal node; its
  smallest DAG is N1–N8 (up-cover counts → E1 spec; sector Out, In, A2; weight formula → per-class composition → Hall ⇒ flow). The E1
  graph lift (N1) is the critical path and has no compiled fragment. Reachable by Cycle 6 with about one cycle of slack.
- **Master:** 510 identities, frozen at `sources/concurrent/master-510-2026-09-28/`; every r31 key clear (checkpoint R-3 re-screen).

## Rulings (Cycle 4; numbered from 23)

23. **Frozen leaf statements.** `control/C4-FROZEN-STATEMENTS.lean` (SHA-256 `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1`;
    byte-identical to `sources/c4-base/LeanProject/LeanProof/Statements.lean`) with its companion `control/C4-FROZEN-STATEMENTS.md`
    (`6aa6dfe5971a187be2be41cc1e350db4beff187ca5b648cdb9aec2edc5eca54b`) freezes the Lean text of every conjunct-4 leaf, N1–N8: 20
    theorems and the definition `cb8GSec`, all elaborating (bodies `sorry`) on the Cycle 4 base (ruling 25). Drafted by a
    controller-staff seat (Claude Opus 5.5, chartered high; R31-N-23), checked by an exact Python transcription under Lean conventions
    (CB(8,1) exhaustive, CB(8,2) and rows 107, 158 sampled, 0 failures; five mutants caught), and adopted by the controller with the
    rulings of 24. **A route engineers a proof of the frozen text, byte for byte.** A proof of a different statement is a new statement:
    it is graded on its own face, it does not discharge the frozen node, and the route says so. A route that finds a frozen statement
    false or mis-stated reports it with a kernel-checked or exact counterexample (that is a decisive finding for the gate, not a failure
    of the route). Stage 7 funds awards whose terminals are frozen statements or their conjunctions.
24. **Rulings on the drafter's open questions** (`control/C4-FROZEN-STATEMENTS.md` §Open questions):
    (1) the E1 layer is carried in its rekeyed form (`cb8G` → `cb8E1G`, one definition and one use; forced by C2-LA1 entry 133);
    (2) C3-LA1 is in the base (ruling 25); (3) N8's proof may carry r30 entries 30–31 (`sources/r30/lean/*/…/Snippets/`) and re-author
    Cycle 2 U2's Part A (`weightedHall_of_ratFlow_bound`) as draft text; one interface copy only; (4) N2 keeps U2's clause text byte-exact;
    its `m − cbOpenChokeCount m A` and `(16m+4)/3 − cbOpenChokeCount m A` are safe through the frozen companion `cbOpenChokeCount_le`,
    which every proof of N2 cites; (5) the tag-set split stands: graph lemmas at `C5LA1.leafSet (cbGraph m)` with `0 < m`, class
    statements at `favorableLeaves (cbGraph m) p*`, bridged by C2-LA3; (6) N3–N5 are pinned at `p*` (fence 1); (7) N8 carries no class
    hypotheses — it is a conditional true for every `m` and asserts no (HALL) by itself; (8) `cb8GSec` as drafted is the single frozen
    `g_sec`; (9) N7's hypothesis set stands (class-level conclusions of N2–N6); (10) the four companions (`cbOpenChokeCount_le`,
    `cb8N_sum_eq_cb8R`, `cb8GSec_nonneg_and_support`, `cb8Rho_one_eq_cb8R1_ratio`) are frozen; (11) the near-duplicate conjuncts stay;
    (12) the in-sector preimage census and arc-label uniqueness are proof internals, not frozen nodes; (13) noted (effort, above).
25. **The Cycle 4 base** (`sources/c4-base/`, digests in its `SOURCE-DIGESTS.json`): U3's merged `Main.lean` with the entry-607 block
    deleted (`385af1bf…`; C1-LA1..3, C2-LA1..3 byte-identical); `ChokeState.lean` (Cycle 2 U2 Part B, byte-identical); the rekeyed
    `E1FlowConstruction.lean`; `C3LA1.lean` — the 33 non-carried entries of C3-LA1, byte-identical with their entry markers (the other
    20 are already in `Main.lean`); `Statements.lean` (= ruling 23). `lake build LeanProof` exits 0 with 0 errors; C3-LA1's terminal
    depends on `propext`, `Classical.choice`, `Quot.sound` only; the reserved name occurs 0 times. Lean-building seats copy this base
    (never `.lake/build` from another seat) and bind packages by symlink. Scratch declarations are ungraded; at Stage 7 carries come
    from the governed runs (ruling 19), not from the base's copies.
26. **The composition award is legitimate.** N7 (`cb8_flowBundle_of_arcSpecs`) takes per-arc specs of two named functions (the N2–N6
    conclusions) as hypotheses, not the existence of a flow or conjunct 4; it is a SOLUTION-CONTRACT §2 intermediate award (the
    sector-certificate composition over the carried network definitions), distinct from the struck reductions of R-9/R-10. N8 likewise.
27. **Rows.** Fresh rows `m = 158, 164`; structural row `m = 161` (the first class row with `x < p* − 2`; ledger row SR-4-R2).
    Controls: `107, 110, 125, 128, 131, 134, 137, 140, 143, 146, 152` (values on record). Rows 137/146/152 are controls, not fresh
    (SR-C3-1/-3 touched them).
28. **Stop gate (SOLUTION-CONTRACT §5, verbatim — supersedes the paraphrases of rulings 15 and 22, R31-E-g):** "Plateau (evaluated from
    the Cycle 2 close): a cycle with no material progress on Tier 1/2, no new `proved_informal` lemma and no new adversarial finding;
    two consecutive plateau cycles end the run after the serendipity review." Decisive events (a) and (b) as §5 states them; ceiling six
    cycles; the Cycle 6 checkpoint (Claude Fable 5.1 high) feeds the terminal review.
29. **Admission controls** (checkpoint Process quality 1–7; tool `control/r31_tool_c4.py`): a return without a `## Instrument sides`
    section is rejected at admission; unmatched digest literals, `compiled` verdicts without a build/axiom log, and `formally_verified`
    tokens in a route return are recorded as admission defects and forwarded to both critics; critics REJECT (not narrow) a numeric
    claim at a row whose difference index is not written textually; full process listings are a rule violation. Dispatches open with
    the restricted-boot clause.
30. **Dual ownership of N1** (checkpoint recommendation 1): T1 proves the N1 statements through the clone correspondence; U1 proves the
    same frozen statements through C1-LA2's per-vertex adjacency lemmas. Neither consumes the other's proof.
31. **Stage 7 plan.** The synthesis may fund up to TWO awards whose terminals are frozen statements (or their conjunctions) with
    compiled, sorry-free scratch at the Stage 3–5 record; the sector half (N3 with N4/N5 if compiled) and the weight formula (N6) are
    the expected candidates; N1 + N2 if compiled. Panel briefs are generated for every funded award before Stage 7 opens.
32. **Gate lines** (ruling 21 carries): `COND4_formal`, `E1_formal`, `TERMINAL_integration`, `cut_candidate`; add
    `FROZEN_NODES_CLOSED: <comma-separated N-labels compiled sorry-free in this return, or none>`.
