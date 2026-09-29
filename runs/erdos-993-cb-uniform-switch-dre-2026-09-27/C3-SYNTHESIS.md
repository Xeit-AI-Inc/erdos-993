# Cycle 3 Neutral Synthesis

Neutral Stage 6 synthesis, Cycle 3, r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`; Erdős #993: a parameter-uniform
switch-using Hall certificate on CB(8,m) at the top sector-deficient rank `p* = (16m+4)/3`, class `m ≥ 107`, `m ≡ 2 (mod 3)`).
Written 2026-09-28, 06:45–07:10 EDT by the clock.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `verity.md` and `identity/startup-protocol.md` (the VerityOS
constitution and startup protocol; absolute paths withheld under the protocol's path rule). Subsystems loaded: those two files only.
I did not follow the task-type map into memory, logs, skills, decisions, operations or conversations. The controller owns conversation
logging for this run, and I wrote no conversation log.

## Identity and seal audit

**Dispatch and capsule (verified before use).**

| Object | Recomputed | Status |
|---|---|---|
| Dispatch `control/dispatch/c3-stage6/DISPATCH-SYNTHESIS.md` (file SHA-256) | `36c464cd0b7d72dc23e65439cf389ec181842e9085e9a5d04b912f632f63929a` | MATCH, checked before reading |
| **Capsule seal** `control/C3-STAGE6-DISPATCH-MANIFEST.json` (canonical JSON without `seal_sha256`; `sort_keys`; `(",", ":")`; no trailing newline) | **`976abb9012d5c7061fb7e57cecec778dfb263eb41605639a0fbb08ebb046a6a7`** | MATCH |
| Capsule manifest file SHA-256 | `347fd72bab5a51ce4be9b6c8dde0d4f3f4ff4e684c5fb544b807e8ff7a635738` | recorded |
| All 12 listed members (SHA-256 and byte count): `SEMANTIC-CONTRACT.md` `7cc0bf43…`, `SOLUTION-CONTRACT.md` `480ba2dd…`, `C3-ALLOCATION.md` `6ef9ce07…`, `C3-STAGE1-GATE.md` `837bdd0d…`, the Stage 5 packet manifest `cb85baea…`, `C3-STAGE6-CONTROLLER-FACTS.json` `ab1954c7…`, `C3-SYNTHESIS-PROTOCOL.md` `fdde0f8c…`, `PATH-CHECK-c3-stage6-dispatch.json` `993c1b97…` (11 files scanned, 0 findings), the F/T/U adjudications (`f6443e3c…`, `e631b50a…`, `11a6a850…`), `sources/SOURCE-DIGESTS.json` `1508f7dd…` | each equals its entry | MATCH ×12 |
| Stage 5 packet seal `control/C3-STAGE5-PACKET-MANIFEST.json` (same canonical rule) | `216d797d5b32d258750ea848cef2d62de67280488a6abc8698d11bf3e6a31a77` | MATCH; its 14 members inside my grant (contracts, allocation, gate, the three adjudications, `sources/…`) also match |

The Stage 5 packet manifest lists raw returns (U1, U3) and critiques; I read none of them. The adjudicators' own seal audits (Stage 2
`f6b0f3fd…`, Stage 3 `c40d4a97…`, Stage 4 packet `a940eb85…`; capsules T `eaca5191…`, F `2f49ae30…`, U `c32606dd…`) are concordant
across the three adjudications. I cite them and did not recompute them.

**Frozen sources read (all under `sources/`; each digest-checked against the frozen digest indexes before use).**
- `c2-results/cycles/cycle-2/CYCLE-CLOSE.md` (`c671dc55…`) and `c2-results/cycles/cycle-2/stage6/SYNTHESIS.md` (`260c8195…`), read for
  the state entering Cycle 3 and the house format.
- C1-LA1 `Main.lean` (`f0578ed7ce7f51f695d410cdbd1265d7071d40f40832635ed12d3dade6c9b78e`) and C1-LA3 `Main.lean`
  (`c0605e12b91375ede9fb72cb9af428a96d9b6a7d678b856b0131f9c7b10f3011`), read by `grep`/`sed` of the entry markers and of entries
  C1-LA3 1, 14, 15, 20 and C1-LA1 11, 32, 33. I read them to freeze C3-LA1's carries and link statement. The C1-LA1 digest confirms the
  controller's R31-N-20 value and the U adjudicator's: U1's header literal is invented.
- The frozen Cycle 2 run-local registry snapshot (`c2-results/control/snapshots/CLAIM-IDENTITY.run-local.c2-close.json`), read by
  `grep` and a JSON lookup. I read it only to confirm the exact spelling and current grade of the keys cited under `## Registrations`.
  Criterion key `proved_informal`; composition key `proved_informal`; R-1 allocation key `formally_verified`; Tier 1 key
  `proved_informal`.

**Controller facts** `control/C3-STAGE6-CONTROLLER-FACTS.json` (CF6-3-1..6), read as facts and never as authority:
- CF6-3-1: six formal awards; conjunct 4 the only formal obligation. Consistent with all three adjudications.
- CF6-3-2: the rulings in force are applied below.
- CF6-3-4: the U1 digest defect; U2's hypotheses restate the spec; the unowned neighbourhood-count bridge. Each is independently
  confirmed by an adjudication (U; U; T), and the first also by my own hash of the frozen C1-LA1 `Main.lean`.
- CF6-3-5: Stage 7 capacity and draft-text rule. Applied in `## Lean awards`.

**Model disclosures on record.**
- Routes: Sonnet 5 high (runtime `claude-sonnet-5`).
- Critics: Opus 5.5 medium (`claude-opus-5-5`).
- Adjudicators: Opus 5.5 high (`claude-opus-5-5`), each two-part, as each adjudication reports on its face.

**My read-boundary disclosures.**
1. The harness injected the project `CLAUDE.md`, the user memory index and the user's e-mail into my context before my first tool
   call. I did not open or use them. The conversation-logging instruction there is superseded by the dispatch's single-file write rule.
2. Two early shell calls used an `echo =====` separator, and zsh `=`-expansion made them exit 1. The effect was cosmetic: every file
   was displayed, and I re-displayed the startup protocol separately. The tool display truncated the middle of `verity.md`, and I
   re-read that section with `sed`.
3. The T adjudication's display exceeded the tool's inline limit. The harness saved the display to its own tool-output cache outside
   the run root, and I paged that copy with the file reader. The copy is the capsule member's content. No other file there was listed
   or opened.
4. Non-recursive `ls` calls, all inside `sources/`:
   - `sources/`;
   - `c1-results/`, `c1-results/runs/` and the three `LeanProject/LeanProof/` directories;
   - `c2-results/` and its `control/`, `cycles/`, `cycles/cycle-2/`, `stage6/`, `stage7/`, `runs/` and `second-reads/` directories;
   - `c2-results/runs/<award>/` (names only);
   - `authority/` (names only).

   No `find`, `rg`, `ls -R` or glob `cat` was run above the grant. Every `grep` named a single file under `sources/`. I ran one
   `mkdir -p` to create `cycles/cycle-3/stage6/` and one non-recursive `ls` of my own scratch.
5. No network, no package installs, no Lean or lake invocation, no child agents. No background job was started, so none was running
   at the final write.

## Reconciliation

Rulings are claim by claim, never by majority vote. Where two adjudicators speak to one object, the stronger evidence (a replayed
build, an exact identity, or a kernel refutation) governs, and the conflict is surfaced. No disagreement is resolved by consulting
a lower tier.

**R-1. Material progress (duty 6b(i)): T yes, F no, U yes-narrow.**
- **What each side says.**
  - T counts seat-authored, sorry-free compiled nodes of the E1 DAG.
  - U counts compiled nodes of the conjunct-4 DAG, mostly critic-attributed or structural, and calls them "material but narrow".
  - F counts grade movement on Tier 1/2. By that standard nothing moved: Tier 1 stays `proved_informal`, Tier 2 was already formal,
    and conjunct 4 is not formal. F also observes that its own seats authored no Lean.
- **All three agree on the facts.** No registered grade moved this cycle. Formal nodes of conjunct 4's DAG were compiled. No cut
  exists.
- **The disagreement is one of standard and portfolio scope, not of fact.** The stop gate asks about material progress on Tier 1/2
  (SOLUTION-CONTRACT §5). Since the Cycle 2 close, Tier 1's only open obligation is formal: conjunct 4 in Lean. A compiled,
  replayed node of that DAG is therefore progress on Tier 1's open obligation, although it moves no grade.
- **Ruling: material progress yes, narrow.** Tier 1's formal obligation advanced, and the E1 numeric core is now contract-ready and
  funded (C3-LA1). No registered grade moved this cycle, and Tier 2 was not touched: it was already formal at template level
  (C1-LA1) and for (ELIG-top)(a) (C2-LA1). F's "no" stands as an accurate report of the F portfolio's own authored contribution.
- **Gate objects that advanced on route or critic work, compiled or stated** (ruling 21; the synthesis standard of protocol duty 6b(i),
  which counts critic work that the T adjudicator's seat-only standard excluded):
  - **`E1_formal`: advanced.**
    - Seat, compiled and replayed:
      - T1: `boolean_double_count`, `ternary_double_count`, `in_balance`;
      - T2: `cb8R1_eq_coeffQ` (R-4), `cb8Rho_le_one`/`cb8Rho_lt_one` (node (d)), `likelihood_ratio`, `cb8_typePath_ii1` (TP-g);
      - U2: the literal `ℚ` arc function `cb8E1Val`/`cb8E1Arc` with clauses (2) and (5), and `cb8Rho_lt_one_topRank`.
    - Critic, compiled and replayed:
      - TP-h/(ii-2) twice (C-T2-F, C-T2-U);
      - `critic_cb8_E1_typePath_totals_nonneg`;
      - `rows_identity`, `g_zero`, `column_inflow_clone`;
      - the node-(a) repair twice;
      - `hZeroChoke` twice;
      - `cb8G_add_cb8H`, `cb8_out_algebra`;
      - the ρ₁ link in C1-LA1's syntax, twice.
    - Stated: E-1 (C-F3-T, C-F3-U); the literal-function fidelity claim (C-U2-T, C-U2-F).
  - **`COND4_formal`: advanced, critic-attributed only.** All three adjudicators report `not_advanced` for their portfolios. T applied
    its seat-only standard and U struck U1's "reduction". I surface the difference: it is a difference of standard. Under the
    protocol's route-or-critic standard, the sector half of the conjunct-4 DAG gained these compiled nodes over the carried
    `cbGraph m`:
    - `sector_transportRel_classify` (C-T3-F);
    - `sector_switch_classify_full` with the generic label-uniqueness lemmas `erase_label_unique`, `erase_ne_switch`,
      `switch_label_unique` (C-T3-U). These make target distinctness a generic graph fact;
    - `cb8_switch_transportRel` (C-U1-T CA-3).

    It also gained stated nodes: the In-sum identity (C-T3-F, C-T3-U), A2 (C-U1-F) and the literal sector-bridge paragraph (C-F2-T).
    No seat moved it: U1's contribution is an interface equivalent to conjunct 4 (R-9), and T3 built no Lean. The controller may weigh
    this in seating.
  - **`TERMINAL_integration`: advanced** (U3 seat).
    - The six governed awards co-elaborate in one pinned project: 606 carried declarations, receipt-bound, three ruled keyword
      edits, 0 digest mismatches, rebuilt by the U adjudicator.
    - Entry 608 is compiled.
    - Critic interfaces on the merge: C-U3-T CA-1..3; C-U3-F (B)–(E).
    - Entry 607 contributes nothing (R-10).
  - `cut_candidate: none` on every return, critique and adjudication.

**R-2. The node-(a) clone-fiber count (T; F via CF3-F-1).**
- **The refutation.** T1's `clone_fiber_card` is REFUTED as a Lean statement. It is refuted by three kernel-checked declarations across the two critics
  (two in C-T1-F, one in C-T1-U; the T adjudicator replayed both critics) with witness `(a,b,k,α) = (1,0,0,1)`: the truncated ℕ subtraction in `N a b k α` returns `C(a,α) ≠ 0` on an empty fiber.
- **Consequence at class rows.** With T1's `N`, the totals fail at `q ∈ [64,107]` (m = 107) and analogous ranges at 110, 125, 140. With
  the zero-extended `N` they hold everywhere (T adjudicator's replay).
- **The corrected count.** The guarded form `α ≤ k` is compiled independently by both critics (`clone_fiber_card_of_le`,
  `clone_fiber_card_guarded`).
- **Ruling.** The refuted object is a false formal statement, not a mathematical claim of record. No registered result depends on it.
  The corrected count is a node of the E1 graph lift (T-C), not of C3-LA1.
- **Vocabulary.** Every successor uses zero-extended objects: T2's `Nterm`/`Sterm`/`Tterm`, or C3-LA1's guarded `e1S`/`e1T`.

**R-3. The `cb8R1` coefficient bridge and `ρ_q < 1` (F's G-F-B versus T2 and U2).**
- **F's reading.** F rules the bridge "ready, informal proof complete" and calls its general-`q` analogue "the only formal gap between
  condition (i) and the adapter hypothesis". F could not see T or U.
- **What T and U hold, compiled.** T2 (seat) compiled `cb8R1_eq_coeffQ` for every `m, k` with no hypotheses, and `cb8Rho_lt_one` for
  `107 ≤ m`, `m % 3 = 2`, `1 ≤ q ≤ m`, from carried C1-LA3 entries 20 and 14. U2 (seat) compiled the same inequality as
  `cb8Rho_lt_one_topRank`.
- **Ruling.** Resolved as compiled in seat scratch, twice. F's "open" is a capsule-scope limitation, not a finding. F's `1 ≤ m`
  hypothesis and T2's hypothesis-free form are both true: at `m = 0` both sides truncate `8m − 7` identically.
- **U2's duplicate** is deduplicated in favour of T2's statement inside C3-LA1.

**R-4. The ρ₁ link to C1-LA1's index form (T; duty 6b(iii)).**
- **T2's statement.** `cb8Rho1_eq_cb8R1_ratio` is value-equal but syntactically unlinked: it uses indices `(16m+4)/3 − 1, −2`.
  C1-LA1's residual (entry 32, read by me) uses `cb8R1 m ((16m+1)/3)` and `cb8R1 m ((16m+1)/3 − 1)`.
- **The link in C1-LA1's syntax** is compiled by both T2 critics (`critF_cb8Rho1_eq_c1la1_ratio`/`critF_cb8R1_residual_pos`;
  `critic_cb8R1_rho1_lt_one_LA1form`/`critic_cb8_residual_capacity_pos`).
- **My instrument** confirms the link as an exact value identity at eight class rows. It also confirms
  `ρ_1(107) = 5150844596024699/5173467627355748`, equal to the value the T adjudicator and both T2 critics recomputed. That value is
  confirmed but not "of record" (T ruling upheld). The fixed point of record, `ρ_1(95) = 1354839571516225/1361543988640524`,
  reproduces exactly.
- **Ruling.** Contract-ready. It enters C3-LA1's terminal as its first conjunct, stated at C3-LA1's own `q = 1` instance vocabulary so
  that Cycle 4's switch-image capacity sum composes syntactically with C1-LA1's Residual.

**R-5. X-8 exactness and the degenerate columns (T's T-A with open nodes O1–O3; F's E-1).**
- **They are the same content.** F's per-target load is `inflow = ρ·(α+1)`. T's is per clone, `inflow/(α+1) = ρ`. Both reduce, by the
  two absorption identities `(α+1)S_{α+1} = (a−α)T_α` and `(j−α)S_α = 2(b−(j−1−α))T_α`, to `(G_{α+1} + H_α)/T_α = ρ`, the in-balance.
  I checked this by hand.
- **The degenerate cases T calls open (O2, O3)** close in three lines, written on C3-LA1's face below:
  - if `ℓ := j−1−α = b`, every lower `S_i`, `T_i` vanishes, so `G_α = H_α = 0`;
  - `α = a` uses `H_a = ρT_a`;
  - `j ≤ a` gives `G_j = S_j`, `H_j = 0` because all mass lies at indices `≤ j`.
- **Instruments.** T's `adj_t.py` (four rows), F's `adj_x8.py` (every `a, b ≤ 18` and nine rows) and my `syn_c3la1.py` (the frozen
  statement under Lean conventions; eight rows, every `q` and `α`; 2,197 generic triples) agree, with 0 failures.
- **Ruling.** T-A and G-F-A merge into one award (C3-LA1). T's per-clone normalization and F's guard discipline are both adopted.
- **Nonnegativity routes are all Newton/Darroch-free and all acceptable:**
  - T2 and critics: TP-g/TP-h from carried entry 15;
  - F: termwise single-row binomial log-concavity;
  - C-U2-F: single crossing;
  - the elementary monotone-ratio form on C3-LA1's face.

**R-6. The sector image classification and the smallest sector lemma (T's T-B/T-D versus U's U-S).**
- **Two different smallest lemmas.** T names the smallest unproved sector lemma as the image-in-layer lemma: a `u_i`-switch image of an
  independent sector `B` with `β_i = 1` is independent and has card `|B| − 1`. U names the Out bridge with target distinctness.
- **Resolution.** They are consistent once CF3-F-1 and T's replay are combined: target distinctness is now compiled generically (C-T3-U
  label uniqueness). The Out bridge's remaining prerequisite is therefore the image-in-layer lemma (its index set), after which the
  Out bridge itself is a `Finset.sum_image`.
- **Ruling.** Smallest unproved sector lemma: the image-in-layer lemma. Next: the Out-bridge sum.

**R-7. The In side and the switch-image side (T3 critics, U's A2, F's bridge paragraph).**
- **Three facets of the literal sector bridge, stated independently in three orientations.**
  - The In-sum `Σ_B g_sec(B,A) = Σ_i cb8In(state_i(A))` on in-sector targets (C-T3-F: 48/48 targets at 107, 125, 128, 140; C-T3-U:
    27 targets at nine rows plus exhaustive `m = 1, 2`).
  - A2: a weight-`γ` one-choke image has exactly `8 − γ` sector preimages `(A ∖ {u_i}) ∪ {r, b_ij}` (C-U1-F; re-derived by the U
    adjudicator; exhaustive on four small trees).
  - C-F2-T's proof paragraph for the whole bridge (read and found complete by the F adjudicator).
- **Where the zero classes agree:**
  - the `u = s` switch from sector sources lands on targets containing `s` (U);
  - the `(1,0)` switch carries 0;
  - non-sector `u = r` two-for-one arcs do land on in-sector targets (T3's `C(z,2)`). They carry 0 because `g_sec` is sector-sourced
    and E1 is deletion-only. T3's "category mismatch" reason is struck (T).
- **Ruling.** Concordant. Every piece is STATED and owes one isolated second read (SR-C3-2).

**R-8. Weight facts: five copies of one fact (U; F3; the Cycle 2 record).**
- **The copies.**
  - Entry 608 `cb8_activeWeight_leafSet_zero_iff` (U3 seat, compiled).
  - `hZeroChoke` (C-U2-T for every `F ⊆ leafSet`; C-U2-F at `favorableLeaves … p`; compiled).
  - F3's zero-weight classification (bounded).
  - Cycle 2's `critic_switch_image_activeWeight` (scratch).
  - C-U3-F's exact formula `w(B) = [v, r ∈ B] + Σ_i [u_i ∈ B]·#{j : c_ij ∈ B}` (STATED; 0/160,000 mismatches; the U adjudicator's
    instrument agrees).
- **Ruling.** The exact formula subsumes the others and is the object of record for the Cycle 4 composition (Group U-W, companion
  status). One copy is carried, not five.

**R-9. The rational-flow interface: five copies, all equivalent to conjunct 4 (U).**
- **The copies.** Cycle 2 U2 (`weightedHall_of_ratFlow_bound`, Out-`≥`); U1 (`weightedHall_of_ratFlow`, Out-`=`, weaker); C-U1-T CA-2
  (`cb8_topRank_of_ratFlow`, derived selector, `hE` discharged); C-U3-T CA-2 (`leafSet` twin); C-U3-F (C)/(D).
- **Equivalence.** Every copy is equivalent to conjunct 4 by compiled iff lemmas (C-U1-T, C-U1-F, C-U3-T CA-1, C-U3-F (B), and the U
  adjudicator's `adjU_terminal_iff_conjunct4`).
- **Ruling.**
  - Interface only, never a reduction.
  - The award form is Out-`≥`, In-`≤`, `0 ≤ g`, support in `transportRel`, layer sums, and tag set via C2-LA3.
  - One copy is carried, at the cycle in which the flow closes (Group U-I).
  - U1's `COND4_formal: advanced` is struck, as are "conditional on `g` alone" and "the rational-to-integral step closed by this file".

**R-10. The trivial reductions and the reserved name (duty 6b(ii)).**
- **U1's single hypothesis is logically equivalent to conjunct 4.** Both U1 critics compiled the iff, and the U adjudicator replayed
  both.
- **U3's entry 607 is `rfl`-identical to the carried C2-LA1 face companion.** The name is `cb8_topRank_eligible_and_weightedHall`, and
  the companion is `AdjU.cb8_topRank_of_flow`, C2-LA1 entry 547 and merged entry 580. Both U3 critics kernel-confirmed the identity, and
  the U adjudicator re-ran the `rfl`.
- **Ruling (binding on the Cycle 3 close and every later stage).**
  - No award, key, scope note or gate line rests on either reduction.
  - Entry 607 is dropped, not renamed, from any project that a Stage 7 award freezes. The carried companion already serves.
  - U3's proposed key 1 is not registered.
  - Under R31-N-22, the name `cb8_topRank_eligible_and_weightedHall` may appear only on the unconditional Tier 1 terminal, whose
    hypotheses are exactly `107 ≤ m` and `m % 3 = 2`.
  - Every Stage 7 fidelity reviewer greps the frozen project for that name before `close`.

**R-11. The invented digest in U1's file header (duty 6b(v)).**
- **The defect.** U1's `Main.lean` line 12 gives the C1-LA1 digest as `f0578ed7ce7f51f6cf3a03e1…a3b4`. The true digest, which I hashed
  from the frozen source, is `f0578ed7ce7f51f695d410cdbd1265d7071d40f40832635ed12d3dade6c9b78e`. The first 16 hex characters are real;
  the tail is invented.
- **What stands.** No proof depends on it. U1's declarations were rebuilt from source by both critics and the U adjudicator, and U1's
  113 carries were byte-compared against the frozen fragments.
- **Ruling: a certification defect, handled as follows.**
  1. The literal is struck. U1's `Main.lean` is never carried as a file. Any U1 declaration re-authored at a Stage 7 gets a fresh
     header whose every digest is computed by tool in that session.
  2. U1's self-reported certification literals (digests, counts, build claims) carry weight only where replayed. The replays on record
     are: `4a3f435d…` reproduced; carries 113/113; build 8657 jobs.
  3. The controller files a ledger row: a certification defect, no key, attributed to seat `C3-U-01` (Sonnet 5), found by C-U1-T and
     C-U1-F, recorded as R31-N-20.
  4. The Cycle 4 gate adds a binding rule. Every digest literal in any file, return or critique must be tool-computed in-session. Every
     critic re-hashes each digest literal it cites. A fabricated literal strikes the carrying document's certification claims, though
     not its replayed mathematics.

  No mathematical result is lost. The Fable 5.1 checkpoint may weigh the defect.

**R-12. The neighbourhood-count bridge (CF3-T-1 / R31-N-21; duty 6b(iv)).**
- **What each side sees.**
  - T identifies it with T1's critics' item 4 and T-C's smallest lemma: for `r`-free independent `B` with choke set `Q`, the number of
    `c_ij ∉ B`, `i ∈ Q`, equals `a − α`, and each insertion is independent.
  - U lists (B1)–(B3) (deletion-class count, insertion-class count, invariance of `q`, `w`) as "the literal-to-quotient bridge; no route
    owns it".
  - F names "the literal-to-clone bridge" as the E1-side smallest unproved lemma.
- **Ruling.** All three name one object: the literal per-set count lemmas on `cbGraph m`. It is the smallest unproved lemma of the E1
  half and is owned by Cycle 4 route T1.
- **Structural observation.** U2's literal arc function is defined from per-set statistics. Its row and column sums therefore need only
  these counts plus C3-LA1's clone algebra, not a full bijection onto the clone product.

**R-13. Smaller concordant or single-source items.**
- **(a) C1-LA3 `hj : 5 ≤ j` is load-bearing** (C-F1-U; F adjudicator). Block descent at index `p*−2−j` fails at `j = 0, 1, 2` and holds
  from `j = 3` at `m = 107, 125, 140`. C-F1-T's "loose but correct" is narrowed. This is not a fidelity break.
- **(b) Ruling-16 invisibility** (F2 diagnostic; C-F1-U A5). Both indices give negative differences at every class row, so favorability
  evidence must cite its index textually. This is carried to the Cycle 4 gate.
- **(c) Instrument fidelity failures** (ruling 18). F2 half-asserted (WID), and F3 stipulated `F = leafSet` on ineligible instances.
  Each was caught by its critics and re-established from independent sides. No reported number changes.
- **(d) Entry 21 carried as `theorem`** (T2; also U1/U2 per U). This deviates from ruling 19 procedurally. C3-LA1 avoids it by
  carrying the dependency-closed subset of entries 1–20 (R31-N-16).
- **(e) The `j = 0` corner.** The literal Out identity fails exactly where `j = p − q = 0` (C-U2-T, C-U2-F; F3's Test C). On the class,
  `j ≥ (13m+4)/3 ≥ 465`. It is a domain boundary, not a template failure and not a cut. Every formal statement carries `j ≥ 1`.
- **(f) The controller's Stage 3 disclosure index for T2** ("saw a sibling U3 build process") is unsupported by the return. The return is
  the authority, and the index gets a record note.
- **(g) C1-LA2's `SOURCE/`** holds the first-interior `crossingIndex` fragment twice with identical content: 218 files, 217 distinct
  carries (F). This is a count note only.

**Cross-route composition, stated at arc level (F adjudicator's reconciliation item 2; STATED).**
- **Inputs.** Take:
  - the X-8 per-target E1 load, exactly `ρ_q·w_F(A)` on `r`-free `q ≥ 1` targets and 0 elsewhere (E-1);
  - the literal sector bridge (R-7);
  - C1-LA1's Switch and Residual.
- **Conclusion.** Every target's combined load is at most its weight:
  - in-sector targets: `≤ 1`;
  - switch images: `ρ_1γ + (8−γ)σ(γ) ≤ γ`;
  - one-choke non-images and `q ≥ 2` targets: `ρ_q w ≤ w`;
  - every other target: 0.
- **Status.** This is the registered composition key's content restated per target. It adds no status. It removes the "E1 per-target
  load carried, not verified at arc level" caveat of both F2 critics once SR-C3-1 and SR-C3-2 concord.

## Exact established results

Every item first stated at Stage 3, 4 or 5, or by me, is **STATED** and needs an isolated second read before registration. Compiled
scratch has no grade until its governed award closes. Imported results keep their grades and are cited, not re-proved.

| # | Statement (exact hypotheses) | Grade | Attribution |
|---|---|---|---|
| Y-1 | **Clone-level E1 transport (X-8 exactness).** For `a, b, j ∈ ℕ`, `1 ≤ j ≤ a+b+1`, with zero-extended `S_α = C(a,α)C(b,j−α)2^{j−α}` (`α ≤ j`), `T_α = C(a,α)C(b,j−1−α)2^{j−1−α}` (`α+1 ≤ j`), `ρ = ΣS/ΣT`, `G_α = ρTc(α) − Sc(α)`, `H_α = S_α − G_α`. Then, for `α ≤ a`: `G_α, H_α ≥ 0`; `G_{α+1} + H_α = ρT_α` (`α < a`); `H_a = ρT_a`; `G_0 = 0`; if `j ≤ a` then `G_j = S_j`, `H_j = 0`; and whenever `T_α > 0`, the guarded per-clone inflow `(a−α)G_{α+1}/((α+1)S_{α+1}) + 2(b−(j−1−α))H_α/((j−α)S_α) = ρ`, including both degenerate cases. `1 ≤ j` is load-bearing (fails at `j = 0`). | `proved_informal`: X-8/X-9 on record via SR-C2-2. The exact domain, boundary closures and degenerate columns are STATED (E-1), with the proof paragraph on C3-LA1's face. Compiled pieces are scratch. | C-F3-T, C-F3-U (E-1); T1 (double counts, in-balance); C-T1-U (rows, columns, `g_zero`); T adjudicator (T-A); F adjudicator (G-F-A); r31 C2 T3 and critics (X-8); r30 (criterion, CD-2) |
| Y-2 | **Class instantiation.** For `107 ≤ m`, `m % 3 = 2`, `1 ≤ q ≤ m`, `a = 8q−1`, `b = 8(m−q)+1`, `j = p*−q`: `1 ≤ j ≤ a+b+1`; `ρ = [y^j]/[y^{j−1}]` of `(1+y)^a(1+2y)^b` (coefficient bridge); `ρ < 1` (condition (i), C1-LA3 entry 20, formal). | Compiled scratch (T2 seat: `cb8R1_eq_coeffQ`, `cb8Rho_lt_one`; U2 seat: `cb8Rho_lt_one_topRank`); mathematics formal (entry 20) plus a Cauchy product | T2; U2; C1-LA3 |
| Y-3 | **ρ₁ in C1-LA1's syntax.** For the class: `ρ_1 = cb8R1 m ((16m+1)/3) / cb8R1 m ((16m+1)/3 − 1)`; hence `0 < 1 − ρ_1` and, with C1-LA1, `θ ≤ 1 − ρ_1` in the E1 vocabulary. | Compiled scratch (critics); value-confirmed at eight rows (mine) | C-T2-F; C-T2-U; T2 (value form) |
| Y-4 | **(ii-1) TP-g and (ii-2) TP-h**, and the class-instance nonnegativity of both E1 type-path totals. | Compiled scratch; X-9 `proved_informal` on record | T2 (TP-g); C-T2-F, C-T2-U (TP-h, independently); C-T2-U (totals) |
| Y-5 | **Guarded clone-fiber count** (`α ≤ k`). T1's unguarded `clone_fiber_card` is REFUTED as a Lean statement. | Compiled scratch; refutation kernel-checked | C-T1-F, C-T1-U; T1 (refuted statement) |
| Y-6 | **Literal E1 arc function** `cb8E1Arc` on `cbGraph m`: faithful to X-8, clauses (2) (deletion support) and (5) (zero on `r ∈ B`, no open choke) compiled. **Fidelity claim:** at `p*` with `F = favorableLeaves (cbGraph m) p*`, clauses (1) nonnegativity, (3) rows, (4) columns hold on the class, with guards `j ≥ 1`, `x/0 = 0`. | Clauses (2), (5) compiled scratch; the fidelity claim STATED | U2; C-U2-T, C-U2-F (derivations, instruments) |
| Y-7 | **Sector image classification on `cbGraph m`:** sector-source arcs are exactly leg deletions, `r`/`v` deletions, the `s`-switch, and `u_i`-switches iff `β_i = 1`; generic label uniqueness gives target distinctness; the (S) arc `B → insert u_i (B ∖ N(u_i))` holds under the stated hypotheses. | Compiled scratch (Lemma DF `proved_informal` on record, SR-C2-3) | C-T3-F; C-T3-U; C-U1-T (CA-3) |
| Y-8 | **In-sum identity; A2; the literal sector-bridge paragraph; the per-target composition at arc level** (R-7 and the composition paragraph). | `proved_informal` STATED | C-T3-F, C-T3-U; C-U1-F; C-F2-T; F adjudicator |
| Y-9 | **CB active-tag weight.** Entry 608: for `0 < m` and any `B`, `activeWeight (cbGraph m) leafSet B = 0 ↔ ¬(v ∈ B ∧ r ∈ B) ∧ ∀ i < m, u_i ∈ B → ∀ j < 8, c_ij ∉ B`. `hZeroChoke` ×2. The exact formula (R-8). | 608 and `hZeroChoke` compiled scratch; exact formula STATED | U3; C-U2-T; C-U2-F; C-U3-F |
| Y-10 | **Rational-flow interface to the terminal** (Out-`≥`, In-`≤`, derived selector or `leafSet`), and its equivalence with conjunct 4. | Compiled scratch; interface only | C-U1-T; C-U3-T; C-U3-F; U adjudicator |
| Y-11 | **Merged six-award project**: C1-LA1..3 and C2-LA1..3 co-elaborate (606 carried declarations, receipt-bound). | Compiled integration (no grade of its own) | U3; C-U3-T, C-U3-F (audits) |
| Y-12 | **Lemma HX.** For the class, `K = p*−1`, `X = Sec ∪ P_1`: `Σ_{N(X)} w_F − Σ_X w_F ≥ 8m(r_1(K−1) − r_1(K)) − R_{K−1}/K ≥ 2.51·R_{K−1}/K > 0`, explicit `M_0 = 107`, no E1 input. | `proved_informal` STATED; exact at 332 class rows to 1100 (bounded) | C-F2-T; F adjudicator (check) |
| Y-13 | **θ_Hall floor.** Any sector allocation with Out = 1, In ≤ 1, per-image switch load ≤ `θγ`, positive arcs only on in-sector targets and switch images, has `θ ≥ θ_Hall := (R_K − R_{K−1})/Σ_γ γN_γ`, `N_γ = m·C(8,γ)·2^{K−1−γ}·C(8m−8, K−1−γ)`. The governed `θ(m)` lies at `1.1879–1.1892·θ_Hall` at every class row to 1100. | `proved_informal` STATED, conditional on the bridge; ratio `bounded_computation` | C-F2-U; F adjudicator |
| Y-14 | **X-8 domain boundary.** `α = β = 0 ⟺ j = 0 ⟺ p = q`, where `ρ_q` is undefined and condition (i) is false; on the class `p* − q ≥ (13m+4)/3 ≥ 465`. | proved (one line) | F3; C-F3-T, C-F3-U |
| Y-15 | **`cb8R1` as a coefficient.** `cb8R1 m k = [y^k](1+y)^7(1+2y)^{8m−7}` (Cauchy product). | `proved_informal`; compiled (T2, `cb8R1_eq_coeffQ`) | C-F3-U (convolution); T2 |
| B-1 | Bounded rows (from the adjudications' ledgers, with attained horizons; B-1 items used for corroboration only): (i) F2's nine-row battery (retitled `R31-C3-F2-CB8-NINE-ROW-INPUT-AND-TEMPLATE-CONSISTENCY`); (ii) (WID) from independent sides at nine or ten rows (both F2 critics); (iii) the literal sector bridge, exhaustive at `CB(8,2)`, `CB(8,3)` and sampled at `p*` for 125/128/140; (iv) clone-level E1 transport at 107, 110, 125, 140 (T adj.) and nine rows (F adj.; C-U2-F at four); (v) HX, θ_Hall, `Λ` at 332 class rows to 1100; (vi) the exact weight formula on every independent set of four small trees; (vii) my check of C3-LA1's frozen statement under Lean conventions at `m ∈ {107,110,125,128,131,134,140,143}` (every `q`, every `α`; 0 failures) and 2,197 generic triples `a, b ≤ 12` (0 failures), with the `j = 0` control failing as expected. | `bounded_computation` | as named; this synthesis (vii) |

**Scope notes the controller should add (per key touched), each after its named second read.**
- **Criterion key `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`:**
  - the exact domain `j ≥ 1` and the `j = 0` boundary (Y-14);
  - the degenerate columns and the `β = 0` boundary (Y-1);
  - the fidelity of the literal Lean arc function (Y-6);
  - on C3-LA1's close, a formal clause at clone level on the restricted scope (`d = 8`, the class, `p*`).
- **Composition key `E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107`:**
  - the In-sum identity, A2 and the bridge paragraph (Y-8);
  - the corrected zero-class reason for `u = r` arcs;
  - the `u = s` and `(1,0)` zero classes;
  - the exact weight formula as the target case-split input (Y-9);
  - the per-target composition at arc level.
- **Tier 1 key `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL`:**
  - the formal status map: conjunct 4 is the only open formal node, and the five rational-flow interfaces are equivalent to it, not
    reductions (R-9);
  - the reserved terminal name (R-10);
  - optionally, Lemma HX as an E1-free necessary-condition check at `X = Sec ∪ P_1` (Y-12).
- **R-1 allocation key `E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107`
  (optional):**
  - the θ_Hall floor, conditional on the bridge;
  - the bounded ratio `1.1879–1.1892` to `m = 1100`;
  - the ρ₁ link in the key's own syntax (Y-3).

**Corrections to predecessor records** (records only; sealed files are never edited).
1. **T1.**
   - `clone_fiber_card` is false as stated. Its "honest remaining obligation" item 1 and the "casts … nothing subtracted before known
     nonnegative" literal are struck.
   - The corroboration script models the zero-extended `N`, not the Lean `N`.
2. **T2.**
   - "No shortcut through carried content" is struck.
   - `cb8Rho1_eq_cb8R1_ratio` "exact phrasing as C1-LA1" is narrowed to value-equal.
   - "ρ₁(107) of record" is narrowed to confirmed, not of record.
   - "Fresh/control rows 107, 110, 113" is narrowed to controls.
   - Part D ran on the 18,125-instance grid only.
   - "Axiom copy discarded" is inaccurate.
   - "Carried inputs still-open" is struck.
   - `E1_formal: not_advanced` is overruled.
   - Entry 21 was kept as `theorem`.
3. **T3.**
   - `compiled` is replaced by `bounded_evidence`.
   - "Verified on two independent sides" is struck.
   - "Two-line `omega`" is struck.
   - "`State8` bound for free" is struck.
   - DAG acyclicity as `bounded_computation` is struck.
   - The category-mismatch reason is struck.
   - 41 checks is corrected to 42.
4. **F1.**
   - "126 carries" is corrected to 217 distinct carries (218 files).
   - The R31-N-15 "outside read scope" claim is struck. The records sit in `sources/` at C2-LA1 `FIDELITY-REVIEW.md` line 27 and
     `EVIDENCE/INFORMAL-AUDIT.md` lines 115–117, and at C2-LA3 `FIDELITY-REVIEW.md` line 27 and `FORMALIZER-REPORT.md` line 83.
   - The C1-LA1 `hm` literal is struck.
   - The ℕ-subtraction list is narrowed.
   - The C1-LA3 `hj` description is narrowed: `hj` is load-bearing.
5. **F2.**
   - The record title is changed.
   - The (WID) "three independent sides" wording is struck.
   - Mutant liveness is struck.
   - The digit literals are corrected: `Δ_v` has 408 digits, and the "S" digits are supply digits.
   - The `S < 0` wording is struck.
   - "Per-target ⇒ Hall" and "X = images" are struck.
6. **F3.**
   - The inverted flag `out_identity_holds_for_al_ge_1` is corrected. The record reads "4,480 checks, 105 failures, all at `α = j = 0`".
   - The "REFUTED: `β = 0 ⟹ H_α = 0`" label is corrected to "holds for `j ≥ 1`; undefined at `j = 0`".
   - "`q = m ⟹ β = 0`" stays REFUTED, and "vertex `s`" is corrected to "the arm slot".
   - The vacuous `α = 0` counter is struck.
   - "`unfold`-level" and "entries 29–30" are struck.
   - Test D is scoped to `q = m`.
   - The literal readings of Tests F/G and Witness 1 are struck.
   - `ROUTE-STATE.md` is a Stage 2 member.
7. **U1.**
   - The novelty of `weightedHall_of_ratFlow` and of `cb8ChokeState_le` is struck.
   - "Conjunct 4 reduced to one hypothesis" and "conditional on `g` alone" are struck.
   - "Literal" on `cb8_switch_preimage_count` is struck.
   - The invented digest literal is struck (R-11).
   - "C1-LA2 already carries byte-identical definitions" is corrected to code-identical modulo classical scoping.
8. **U2.**
   - The `formally_verified` labels on scratch are struck.
   - "Four named hypotheses isolating what T1/T2 supply" is struck: three restate the spec.
   - The `hOut`/`hIn` attributions are struck.
   - The counts are corrected to 8 axiom lines and 6 warnings.
   - The full process listing is recorded as a process breach.
9. **U3.**
   - Entry 607 as a contribution is struck.
   - "Reduced to the E1 hypothesis alone" is struck.
   - Key 1 is not registered.
   - "Six name-collisions" is corrected to three.
   - The line numbers are corrected: 607 begins at 13202.
   - "SEMANTIC-CONTRACT §5" is corrected to §2.
   - The replay-isolation claim is narrowed.
10. **Controller-side.** The Stage 3 disclosure-index entry for T2 is unsupported. The C1-LA2 `SOURCE/` duplicate is a count note.
11. **The Cycle 2 record (scope refinement, not an error).** X-8's arc values are defined exactly on `j ≥ 1`. Its loads hold on every
    realized target type, degenerate classes included.

## Refuted or narrowed mechanisms

- **REFUTED (a formal statement; never carried):** T1's `clone_fiber_card` with truncated `N`. It is refuted by three kernel-checked
  declarations across two critics, with witness `(1,0,0,1)`. The lesson is binding on every Cycle 4 statement: every ℕ subtraction inside a count or a coefficient index is
  guarded (`if α ≤ k then … else 0`) or proved safe on the face.
- **Refuted list unchanged otherwise:**
  - (G′) (ruling 20);
  - `E993-TREE-REAL-ROOTED`;
  - the SOLUTION-CONTRACT §3.6 list.

  No retained item revives any of them. No retained step uses Newton or Darroch; every positivity step uses single-row binomial
  log-concavity, explicit ratios, or carried entry 15 (an induction over linear factors). No `m`-independent per-choke certificate, no
  compression, no CHAR, no forest real-rootedness. The θ\* law is never a hypothesis. No census is used as proof.
- **Narrowed or struck certifications** (detail under Corrections):
  - T3's `compiled`;
  - F2's "end-to-end composed flow" (retitled; no literal arc was touched);
  - F3's literal-network readings;
  - U1's reduction and novelty claims;
  - U2's grades;
  - U3's entry 607.
- **Shape and interface failures (never cuts):**
  - the literal E1 Out identity at `j = 0` (off-class; every formal statement carries `j ≥ 1`);
  - U1's equality-form Out interface (rejected for Out-`≥`: it would force per-source rescaling of C1-LA1's Out-`≥ 1` certificate);
  - T3's "two-line" no-other-switch argument. The compiled proof needs a leg-partner lemma, a `cbEdge` case split and independence.
- **Template failures at class rows:** none. F3's corner is a domain boundary.
- **Cuts:** none. No instrument evaluated an `X ⊆ I_{p*+1}` against its literal neighbourhood capacity at an eligible class row and
  found a deficit.
  - The only failing configurations in the whole cycle are off-class and off-domain: F3's `j = 0` corner, and the F adjudicator's
    `CB(8,2)`, `p = 4, 5` construction check under a stipulated `F` (where the selector of record makes every weight 0 and neither rank
    is eligible).
  - Neither is Outcome C.

## Headline verdicts

- **Tier 1** (for every `m ≥ 107`, `m ≡ 2 (mod 3)`: (E) and (H) at `p*`):
  - **Status.** Still open as a formally verified statement. The registered grade stays `proved_informal` (Darroch/Newton-free,
    SR-C2-5), unchanged, and is NOT decisive. Not refuted: no cut. No cutoff `M_0` is used anywhere, so no omitted range exists.
  - **Formally.** (E) is `formally_verified` (C2-LA1), and favorability is `formally_verified` (C2-LA3). Conjunct 4, the saturating
    flow on `cbGraph m` at `p*`, is the only open node.
  - **Smallest unproved lemma toward the formal terminal:** the literal up-cover count on `cbGraph m`. For `r`-free independent `B`
    with open-choke set `Q`, `|Q| = q ≥ 1`, and a marked active tag, the Boolean up-covers number exactly `a − α` and the ternary
    up-covers exactly `2(b − ℓ')`, and each insertion is independent in the layer (R31-N-21, R-12). On the sector side the smallest is
    the image-in-layer lemma (R-6).
- **(L-S)_top:**
  - **Template feasibility** is `formally_verified` (C1-LA1; unchanged).
  - **Composition to the literal network** stays `proved_informal` (SR-C2-3; Lemma DF). This cycle added the In-sum, A2 and the bridge
    paragraph (STATED) and compiled the classification (scratch).
  - **Still open** as a formally verified literal-network statement. The template is within a factor 1.19 of the whole-family floor
    θ_Hall at every class row to 1100 (bounded; no optimality claim).
- **(ELIG-top)(a):** `formally_verified` at full class scope (C2-LA1; unchanged; confirmed by F1's audit and C-F1-T's kernel
  rebuild).
- **Other lemmas:**
  - Y-1 (new content STATED), Y-8, Y-9 (formula), Y-12 and Y-13 are proved informally, STATED.
  - Y-2..Y-5, Y-7, Y-9 (608, `hZeroChoke`), Y-10 and Y-11 are compiled scratch.
  - Y-14 is proved.
  - T1's `clone_fiber_card` is REFUTED as a formal statement.
  - Template failures: none.
- **(HALL) at full scope** (`E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`): **OPEN**, unchanged. Nothing here transfers status to it.
- **Primary aggregate** (`E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`): **OPEN; unchanged by construction.**
  - The r31 family theorem, even when formal, implies `S(T_m, p*) ≤ 0` on its own rows only (FLOW ⇒ SIGN). It transfers no status to
    any aggregate key.
  - TREE, FOREST, TRANSFER, governed beta and Erdős #993 stay OPEN.

## Lean awards

**Carry rules.**
- Carries are byte-identical from the frozen award runs under `sources/c1-results/runs/` and `sources/c2-results/runs/`. Each is keyed by
  (origin award, entry, digest) and bound to the origin's `FORMALIZATION-STATE.json` and kernel receipt (ruling 19).
- An origin terminal is carried only with the single edit `theorem → lemma` and a recorded reversibility check (R31-N-15).
  Dependency-closed subsets are valid (R31-N-16).
- All seat, critic and adjudicator scratch is DRAFT text, re-authored under attribution with the origin named on each declaration
  (CF6-3-5).
- No file header may carry a digest literal that was not computed by tool in the Stage 7 session (R-11).
- Pinned toolchain Lean v4.32.2, Mathlib `905b9581…`, bound by manual symlink. Axioms are exactly `propext`, `Classical.choice`,
  `Quot.sound`. No `sorry`, `admit`, `native_decide`, or `decide` over an enumeration.
- Companions carry no certificate of their own.
- The reserved name `cb8_topRank_eligible_and_weightedHall` must not occur in any frozen project (R-10).

### C3-LA1 — the E1 clone-level transport at the class and its ρ-links. **FUNDED (bounded attempt).**

**Why funded.** Every open node is Lean engineering over proved mathematics:
- X-8/X-9 (SR-C2-2 concordant);
- condition (i) formal (C1-LA3 entry 20);
- the degenerate cases, proved in the paragraph below.

Most nodes already compile in scratch. The award makes the E1 numeric core carriable into Cycle 4's graph lift, which is the only way
scratch becomes a byte-identical carry under ruling 19. The award is not progress on (L-S)_top or (ELIG-top)(a), and not a new identity.
It formalizes, at clone level, a node of the registered criterion key on the r31 scope.

**Definitions (new; frozen text).**
```lean
namespace E993Transport
open Polynomial

/-- Zero-extended source clone count `C(a,α)·C(b,j−α)·2^(j−α)`, `0` unless `α ≤ j`. -/
def e1S (a b j α : ℕ) : ℚ :=
  if α ≤ j then ((a.choose α * b.choose (j - α) * 2 ^ (j - α) : ℕ) : ℚ) else 0

/-- Zero-extended target clone count `C(a,α)·C(b,j−1−α)·2^(j−1−α)`, `0` unless `α + 1 ≤ j`. -/
def e1T (a b j α : ℕ) : ℚ :=
  if α + 1 ≤ j then ((a.choose α * b.choose (j - 1 - α) * 2 ^ (j - 1 - α) : ℕ) : ℚ) else 0

/-- `ρ = r(j) / r(j − 1)`, as a ratio of clone totals. -/
def e1Rho (a b j : ℕ) : ℚ :=
  (∑ α ∈ Finset.range (a + 1), e1S a b j α) / ∑ α ∈ Finset.range (a + 1), e1T a b j α

/-- Boolean transport mass of type `α`: `ρ·Tc(α) − Sc(α)` (strict prefix sums). -/
def e1G (a b j α : ℕ) : ℚ :=
  e1Rho a b j * (∑ i ∈ Finset.range α, e1T a b j i) - ∑ i ∈ Finset.range α, e1S a b j i

/-- Ternary transport mass of type `α`: `S_α − G_α` (so the row identity is definitional). -/
def e1H (a b j α : ℕ) : ℚ := e1S a b j α - e1G a b j α
end E993Transport
```

**Terminal (frozen; in `namespace E993Transport` with `open Polynomial`, after the definitions).**
```lean
theorem cb8_E1_cloneTransport_topRank (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
    e1Rho (8 * 1 - 1) (8 * (m - 1) + 1) ((16 * m + 4) / 3 - 1) =
        (cb8R1 m ((16 * m + 1) / 3) : ℚ) / (cb8R1 m ((16 * m + 1) / 3 - 1) : ℚ) ∧
    ∀ q : ℕ, 1 ≤ q → q ≤ m →
      e1Rho (8 * q - 1) (8 * (m - q) + 1) ((16 * m + 4) / 3 - q) =
          ((((1 + X) ^ (8 * q - 1) * (1 + 2 * X) ^ (8 * (m - q) + 1) : ℤ[X]).coeff
              ((16 * m + 4) / 3 - q) : ℤ) : ℚ) /
            ((((1 + X) ^ (8 * q - 1) * (1 + 2 * X) ^ (8 * (m - q) + 1) : ℤ[X]).coeff
              ((16 * m + 4) / 3 - q - 1) : ℤ) : ℚ) ∧
      e1Rho (8 * q - 1) (8 * (m - q) + 1) ((16 * m + 4) / 3 - q) < 1 ∧
      ∀ a b j : ℕ, a = 8 * q - 1 → b = 8 * (m - q) + 1 → j = (16 * m + 4) / 3 - q →
        (∀ α ≤ a, 0 ≤ e1G a b j α ∧ 0 ≤ e1H a b j α) ∧
        (∀ α < a, e1G a b j (α + 1) + e1H a b j α = e1Rho a b j * e1T a b j α) ∧
        e1H a b j a = e1Rho a b j * e1T a b j a ∧
        e1G a b j 0 = 0 ∧
        (j ≤ a → e1G a b j j = e1S a b j j ∧ e1H a b j j = 0) ∧
        (∀ α ≤ a, 0 < e1T a b j α →
          (if α < a then ((a - α : ℕ) : ℚ) * e1G a b j (α + 1) /
              (((α + 1 : ℕ) : ℚ) * e1S a b j (α + 1)) else 0) +
          (if j - 1 - α < b then ((2 * (b - (j - 1 - α)) : ℕ) : ℚ) * e1H a b j α /
              (((j - α : ℕ) : ℚ) * e1S a b j α) else 0) = e1Rho a b j)
```
The statement is checked under Lean conventions (ℕ truncation, `x/0 = 0`) by `scratchpad/c3-S/syn_c3la1.py` at eight class rows, every
`q` and every `α`, with 0 failures (B-1 (vii)). This is a statement-shape check, not evidence of grade.

**Hypotheses.** Exactly `107 ≤ m` and `m % 3 = 2`. They are load-bearing through:
- entry 20, for `ρ < 1`;
- the domain `1 ≤ j = p* − q` (since `q ≤ m < p*`) and `j ≤ a + b + 1`, for `ΣT > 0`;
- `(16m+4)/3 − 1 = (16m+1)/3` in the first conjunct.

**Face companion (ungraded; frozen text, re-authored).**
```lean
theorem e1_cloneTransport (a b j : ℕ) (hj : 1 ≤ j) (hjab : j ≤ a + b + 1) :
    (∀ α ≤ a, 0 ≤ e1G a b j α ∧ 0 ≤ e1H a b j α) ∧
    (∀ α < a, e1G a b j (α + 1) + e1H a b j α = e1Rho a b j * e1T a b j α) ∧
    e1H a b j a = e1Rho a b j * e1T a b j a ∧
    e1G a b j 0 = 0 ∧
    (j ≤ a → e1G a b j j = e1S a b j j ∧ e1H a b j j = 0) ∧
    (∀ α ≤ a, 0 < e1T a b j α →
      (if α < a then ((a - α : ℕ) : ℚ) * e1G a b j (α + 1) /
          (((α + 1 : ℕ) : ℚ) * e1S a b j (α + 1)) else 0) +
      (if j - 1 - α < b then ((2 * (b - (j - 1 - α)) : ℕ) : ℚ) * e1H a b j α /
          (((j - α : ℕ) : ℚ) * e1S a b j α) else 0) = e1Rho a b j)
```
The per-`(a, b, j)` conjuncts are the terminal's text verbatim. Checked with 0 failures on all 2,197 triples with `a, b ≤ 12` and `1 ≤ j ≤ a+b+1`.
Further companions: the generic coefficient bridge
`e1Rho a b j = (coeff j)/(coeff (j−1))` of `(1+X)^a(1+2X)^b` for `1 ≤ j`, and the two absorption identities.

**Informal DAG** (closed; the proof paragraph goes on the face).
1. **Coefficient bridge.** `Σ_α e1S = [y^j](1+y)^a(1+2y)^b` and `Σ_α e1T = [y^{j−1}](…)`, by `coeff_mul` over the antidiagonal with
   `C(a,α) = 0` for `α > a` (T2's `coeff_one_add_two_mul_X_pow`, `rr_eq_coeff`, `cb8R1_eq_coeffQ` as drafts).
2. **Domain.** `ΣT > 0` from entry 14 at index `j − 1 ≤ a + b`.
3. **`ρ < 1`.** The strict entry 20 through the bridge.
4. **The `q = 1` link.** The finite-sum reindexing `range 8` with guard ⇄ `range (min 7 k + 1)` of C1-LA1 entry 11, at `k = (16m+1)/3`
   and `k − 1`, and `8·(m−1)+1 = 8m−7` (`omega`, `1 ≤ m`).
5. **In-balance and top.** Telescoping of the prefix sums (T1's `in_balance`), with `H_a = ΣS − ρ(ΣT − T_a) = ρT_a`.
6. **`G_0 = 0`, and `j ≤ a ⇒ G_j = S_j, H_j = 0`.** All mass lies at indices `≤ j`, so `Tc(j) = ΣT` and `Sc(j+1) = ΣS`.
7. **Absorption.** `(α+1)S_{α+1} = (a−α)T_α` (`Nat.succ_mul_choose_eq`), and for `α + 1 ≤ j`, `(j−α)S_α = 2(b−(j−1−α))T_α` (the same
   identity on the `b`-row).
8. **Columns.** For `T_α > 0`:
   - if `α < a`, then `S_{α+1} > 0` and the Boolean term equals `G_{α+1}/T_α`;
   - with `ℓ := j−1−α ≤ b`: if `ℓ < b`, then `S_α > 0` and the ternary term equals `H_α/T_α`;
   - if `ℓ = b`, every `i < α` has `j−i > b+1`, so `S_i = T_i = 0`, `Sc(α) = Tc(α) = 0`, and `G_α = 0 = H_α`.

   In every case the sum is `(G_{α+1} + H_α)/T_α = ρ` by step 5. At `α = a` it is `H_a/T_a = ρ`. The `ℓ = b` sub-case at `α = a`
   forces `j = a+b+1`, where `ΣS = 0 = ρ`.
9. **Nonnegativity** (elementary monotone ratios; no Newton or Darroch).
   - `ΣT·G_α = Σ_{i<α≤k}(S_kT_i − S_iT_k) ≥ 0`, since `S_i/T_i = 2(b−j+1+i)/(j−i)` is nondecreasing. The comparison is termwise after
     the absorption identity, and `T_i = 0` forces `S_i = 0` below `j`.
   - `ΣT·H_α = S_0(ΣT − Tc(α)) + Σ_{i<α≤k}(U_iT_k − T_iU_k) ≥ 0` with `U_i := S_{i+1}`, since `U_i/T_i = (a−i)/(i+1)` is nonincreasing.
   - Alternatively, TP-g/TP-h from carried entry 15 (the compiled scratch route).

**Carried fragments** (origin award, entry, digest; byte-identical).
- **C1-LA3** `Main.lean` `c0605e12b91375ede9fb72cb9af428a96d9b6a7d678b856b0131f9c7b10f3011`: the dependency-closed subset of entries
  1–20, with entry 21, the origin terminal, NOT carried. Load-bearing:
  - 1 `polyCoeffZ` `046f659b7d033efef4613b69f6f6192013a62df02806d99ad4013ef00d9a5f9f`;
  - 5 `polyCoeffZ_natCast` `4c3bf9dcf2a367fb88d5a49b18837f0e18768a66d4d5774b7e5a28979ac1c940`;
  - 14 `twoBinomCoeff_pos` `768f4ab5ed5dd35057de158c05a06727d928906d103861fe4dcd70a6e039a9ac`;
  - 15 `twoBinomCoeffZ_strongLC` `61e8794fec4ff00b103505614f6cce53efdcf341ae98866fdc89686abaf57dc0`;
  - 17 `twoBinom_coeff_strictAnti_of_gap` `b39cd78768d02c83194f21b48717af69a8354afb36719755c5979769c3d6589c`;
  - 18 `cb8_gap_E1_conditionI` `c905770686d71203599336a24e247a5da6369676badeab131842c644d3687df5`;
  - 20 `cb8_E1_conditionI_topRank` `8da112b4d0a8c184e9ea9d8c749c1342d53211159d575679999b3d73c7db6a3a`.

  If the formalizer's closure needs entry 21, it is carried as `lemma` with the R31-N-15 reversibility record.
- **C1-LA1** `Main.lean` `f0578ed7ce7f51f695d410cdbd1265d7071d40f40832635ed12d3dade6c9b78e`: entry 11 `cb8R1`
  `2efd2823db1ce7d8069b38dd96b9bc3bc2899c6d22733a8066e5ba0fa5e74e9c`, a self-contained definition and a dependency-closed singleton.
- **Layout.** Both layers number entries from 1. Carry them as two unmodified modules, or merge with re-keyed markers (the C2-LA1
  precedent). The digests above must match after either choice.

**New declarations (re-authored; origin named on each).**
- The five definitions above (this synthesis; from T2's zero-extended `Nterm`/`Sterm`/`Tterm` and F's guard form).
- T1: `boolean_double_count`, `ternary_double_count` (re-proved over the guarded objects; they use only `α < j`), `in_balance`.
- T2: `coeff_one_add_two_mul_X_pow`, `cb8R1_eq_coeffQ`, `rr_eq_coeff`, `cb8Rho_lt_one`, `likelihood_ratio`, `cb8_typePath_ii1`.
- C-T2-F or C-T2-U: TP-h and the class nonnegativity.
- C-T1-U: `rows_identity`, `g_zero`, `column_inflow_clone`.
- C-T2-F and C-T2-U: the C1-LA1-syntax ρ₁ link.
- New: the degenerate columns, the `β = 0` boundary, the companion `e1_cloneTransport`, and the terminal.

**Options.** Record any `maxHeartbeats` or `maxRecDepth` setting on the face, with a measured finite bound if the workflow refuses `0`.

**Fences.**
- Clone level only. NOT a statement about `cbGraph m`.
- NOT the E1 flow on the literal network, NOT conjunct 4, NOT (HALL) at any scope, NOT `S(T_m, p*) ≤ 0`.
- NOT progress on (L-S)_top or (ELIG-top)(a).
- Not a new identity: a new key would be an alias (SR-C2-2 finding 5).
- One rank `p*`; `d = 8`; the class only. No θ\* law. No Newton or Darroch.

**Attribution** (on the face, verbatim to the fidelity reviewer).
- T1 (Sonnet 5, seat `C3-T-01`): double counts, in-balance.
- T2 (seat `C3-T-02`): coefficient bridge, node (d), TP-g, zero-extended vocabulary.
- C-T1-F, C-T1-U (Opus 5.5 critics): node-(a) repair; rows, columns, `g_zero`.
- C-T2-F, C-T2-U: TP-h, nonnegativity, ρ₁ link.
- C-F3-T, C-F3-U: E-1 exact domain, boundary closures, per-target load.
- U2 (seat `C3-U-02`): the duplicate `ρ_q < 1`.
- The T adjudicator: T-A draft, degenerate-case instrument.
- The F adjudicator: G-F-A/G-F-B guard discipline.
- This synthesis: statement freeze, merged form, degenerate-case paragraph.
- r31 C2 T3 and critics (X-8/X-9).
- r30 (criterion key, CD-2, network; named seats as registered).
- Codex GPT-6's lower-region run (mechanism, weight, relation, (HALL)).
- Codex's heterogeneous-closure run (coefficient mechanisms, as C1-LA3's face cites them).
- The C1-LA1 and C1-LA3 formalizers.

**Excluded conclusions.**
- The E1 flow on `cbGraph m`, the graph lift, conjunct 4, (HALL), favorability.
- Any rank other than `p*`, `m < 107`, `m ≢ 2 (mod 3)`, `d ≠ 8`.
- Any optimality of the template.

**Repairs carried into the award.**
- T1's truncated `N` is replaced by guarded objects.
- T2's "of record" label is narrowed.
- Entry 21 is not carried.
- U2's `cb8Rho_lt_one_topRank` is deduplicated.

**Second read.** SR-C3-1 (below), concurrent with Stage 7. It is a precondition of registration, not of the attempt.

**If blocked.** Record the exact blocked node. The expected smallest is the nonnegativity step 9 at the zero-extension boundary. Register
nothing.

**Registration on close.** A formal scope-note clause on the criterion key, at the restricted scope stated on the note. Ledger row
R31-C3-LA1. No key.

### No award attempted (named groups, each with its smallest unproved lemma)

- **T-C / U-E1: the E1 flow on `cbGraph m` (`cb8E1Arc_spec_topRank`, unconditional).**
  - Informal proof complete: SR-C2-2 D1–D6, plus Y-6 STATED.
  - DAG not closed formally. **Smallest unproved lemma:** the literal up-cover counts (B1)–(B3) on `cbGraph m` (R-12, R31-N-21).
  - Also open: U's (E) expansion in U2's `cb8N`/`cb8R` vocabulary. T2's `rr_eq_coeff` is plausibly this identity in T2's vocabulary,
    in which case only a vocabulary bridge remains; Cycle 4 U1 checks. Then (A), (N), the `j ≥ 1` guard and the ℕ/ℤ cast seam of `j`.
  - The guarded fiber count (Y-5) is a companion here.
  - Routed to Cycle 4 T1 and U1.
- **T-D / U-S: the literal sector flow `g_sec`.**
  - Informal proof complete: Lemma DF, plus Y-8 STATED, pending SR-C3-2.
  - DAG open at: the `g_sec` definition, images in the layer, the leg count, the Out-bridge sum, the In-sum, the switch-image inflow and
    the zero classes. **Smallest unproved lemma:** the image-in-layer lemma (R-6).
  - The classification and label uniqueness (Y-7) are companions here. They are not funded standalone, since they prove no flow
    property (T ruling upheld).
  - Routed to Cycle 4 T2, T3.
- **U-W (weight formula) and U-I (interface).** Companions of the conjunct-4 award, not standalone.
  - U-W's exact formula is not yet compiled. Its open node is a `Finset.card` partition over carried C1-LA2 entries 60, 69, 70 and
    `eq_cbVertex_iff`.
  - U-I is compiled, and exactly one Out-`≥` copy is carried at the terminal cycle.
  - Routed to Cycle 4 U2 and U3.
- **U-T: the Tier 1 terminal.** Ready the moment U-E1 and U-S close: `g := cb8E1Arc + g_sec` through U-I, under the reserved name with
  no hypothesis beyond the class. Not attempted.
- **G-F-C (Lemma HX), G-F-D (θ_Hall floor).** Not funded. They are necessary-condition inequalities off the conjunct-4 DAG, recorded
  at `proved_informal` after SR-C3-4.
- **F1's audit, F2's battery, all bounded results.** Never.

**Stage 7 plan.**
- One governed panel for C3-LA1 (formalizer, informal auditor, fidelity reviewer; Opus 5.5 high).
- The fidelity reviewer applies F's checklist before `close`:
  - guarded ℕ subtraction;
  - `j ≥ 1`;
  - ρ reached through the explicit coefficient bridge to entry 20, never restated as a hypothesis;
  - no reserved name;
  - every header digest tool-computed;
  - `expected_statement` equality with the frozen text above.
- SR-C3-1 runs concurrently.

## Progress and stop-gate ruling

- **Decisive event: none.**
  - (a) Tier 1 is not `formally_verified`: conjunct 4 is open in Lean.
  - (b) No eligible deficient cut exists or was proposed on any instrument (`cut_candidate: none` cycle-wide).
- **Material progress: yes (narrow; R-1).** Tier 1's single formal obligation advanced:
  - the E1 numeric core is compiled in pieces and funded as C3-LA1;
  - the literal E1 arc function and its structural clauses are compiled;
  - the first literal sector nodes (classification, label uniqueness, the switch arc) are compiled;
  - the six awards co-elaborate in one project.

  No registered grade moved. Tier 2 was already formal.
- **Plateau: no.** The plateau test (gate ruling 22 with duty 5: no advance on any of `COND4_formal`, `E1_formal`,
  `TERMINAL_integration`, and no new registration above `bounded_computation`) fails on its first clause for all three gate objects:
  - `E1_formal`: seats and critics;
  - `COND4_formal`: critics only;
  - `TERMINAL_integration`: seat U3.

  On its second clause, C3-LA1 is funded, and scope notes at `proved_informal` wait on their second reads. The SOLUTION-CONTRACT §5
  form also fails:
  - new STATED `proved_informal` lemmas: Y-1 new content, Y-8, Y-9 formula, Y-12, Y-13;
  - new adversarial findings: the kernel-refuted `clone_fiber_card`, the `j = 0` shape constraint, the reserved-name freeze hazard,
    three alias findings, the invented digest, the load-bearing `hj`, the ruling-16 invisibility, and two instrument-fidelity
    failures.

  The armed stop gate does not end the run.
- **Ceiling.** Cycle 3 of 6. The Claude Fable 5.1 (high) checkpoint analysis follows this cycle's close, and this ruling feeds it.
- **Routing observation for the checkpoint (not a ruling).** As in Cycle 2, most substantive formal advances came from critics
  (Opus 5.5 medium). The seats produced two alias results, one kernel-refuted statement and one invented digest literal, alongside
  genuine seat nodes (T1, T2, U2, U3's merge).

headline_resolved: no
material_progress: yes
plateau: no
continue: yes

**Cycle-level gate lines (ruling 21):** `COND4_formal: advanced` (critic-attributed only); `E1_formal: advanced`;
`TERMINAL_integration: advanced`; `cut_candidate: none`.

## Next-cycle portfolio

**The object of every route** (duty 6b(iv)). The literal rational flow `g = cb8E1Arc + g_sec` on `cbGraph m` at `p*`:
- nonnegative, supported on `transportRel`;
- Out-`≥` against `activeWeight (cbGraph m) (favorableLeaves (cbGraph m) p*)` at every source of `I_{p*+1}`;
- In-`≤` at every target of `I_{p*}`.

Equivalently, `WeightedHall (cbGraph m) (leafSet (cbGraph m)) p*` in C-U3-F's form, with `leafSet` transported from the selector by
C2-LA3. Each route states which piece of that flow it closes. Nothing is outside the charter.

**Work environment and freeze rules.**
- Work happens in U3's merged project, with entry 607 dropped, carrying C3-LA1 if it closes, or its frozen text as a named hypothesis
  if it does not.
- The Cycle 4 gate freezes one `g_sec` definition text before Stage 2, so that T2, T3, U2 and U3 share it. Its content: on a sector
  source `B` (`r, v ∈ B`), the value `cb8Pb m (state_i B).1` on each `b`-leg deletion at choke `i`, and `cb8Pc m (state_i B).1` on each
  `c`-leg deletion (C1-LA1's signatures). It takes `cb8Sigma m γ` on the `u_i`-switch image when `state_i B = (1, γ)` with `γ ≥ 1`, and 0 elsewhere. It is
  read through Cycle 2 U2's `chokeState`; no fourth copy.

**Rows and hygiene.**
- Recommended fresh rows: `m = 137, 146`, with `m = 152` as the larger row. No prior gate named them as fresh or control rows, and
  this synthesis's instruments did not touch them. Values at them exist only inside whole-range sweeps: the Cycle 2 F adjudicator's
  107–500 and the Cycle 3 F adjudicator's 107–1100 for HX/θ_Hall. Fresh-row tests of the E1 and sector objects are therefore new.
- Controls: `107, 110, 125, 128, 131, 134, 140, 143`, with values on record.
- Instrument hygiene is ruling 18, plus the Cycle 4 additions:
  - index cited textually (R-13 (b));
  - every ℕ subtraction guarded;
  - every digest literal tool-computed (R-11).

**Orientation T (prove).**
1. **T1 — `E1-GRAPH-LIFT-UPCOVER-COUNTS`** (owner of R31-N-21).
   - **Object.** On `cbGraph m` over the carried C1-LA2 labels, for `r`-free independent `B` with open-choke set `Q`, `|Q| = q ≥ 1`,
     rank `|B| = p*+1` or `p*`, and a marked active tag:
     - (B1) deletion-class counts: `α` Boolean, `j − α` ternary, `q` choke;
     - (B2) insertion-class counts: `a − α` Boolean and `2(b − ℓ')` ternary up-covers, each insertion independent and in the layer;
     - (B3) invariance of `q` and `w` under non-choke insertion;
     - the rank and weight map `w(B) = α + 1` via the exact weight formula.
   - **Could close.** The neighbourhood-count bridge sorry-free: the literal half of the E1 graph lift, and the smallest unproved lemma
     of Tier 1's formal obligation.
2. **T2 — `SECTOR-GSEC-IMAGES-AND-OUT-BRIDGE`.**
   - **Object.** The frozen `g_sec`, plus:
     - the image-in-layer lemma (smallest): a `u_i`-switch image of an independent sector `B` with `β_i = 1` is independent with card
       `|B| − 1`, and leg deletions are in the layer;
     - the leg count `Σ_i(β_i + γ_i) = |B| − 2`;
     - the Out bridge `Σ_A g_sec(B, A) = Σ_i cb8Out m (state_i B)` by `Finset.sum_image` over the compiled label uniqueness;
     - then Out `≥ 1` from C1-LA1. No normalization is needed under Out-`≥`.
   - **Could close.** The sector Out half sorry-free.
3. **T3 — `SECTOR-IN-BRIDGE-AND-SWITCH-IMAGE-INFLOW`.**
   - **Object.**
     - the In-sum `Σ_B g_sec(B, A) = Σ_i cb8In m (state_i A)` on in-sector targets, then `≤ 1` by C1-LA1;
     - A2 in Lean: exactly `8 − γ` sector preimages of a weight-`γ` one-choke image, inflow `(8−γ)σ(γ)`;
     - every zero class: `u = s` switch, `(1,0)` switch, non-sector sources, multi-choke and weight-zero targets.

     SR-C3-2's result is consumed if available; otherwise the In-sum is a named hypothesis.
   - **Could close.** The sector In half sorry-free, so that `g_sec`'s full spec is compiled.

**Orientation F (falsify).**
1. **F1 — `CYCLE4-SPEC-AND-FREEZE-FIDELITY-SIGNOFF`.**
   - **Object.** A signed audit of C3-LA1 as closed and of every Cycle 4 candidate statement: the E1 spec, the `g_sec` spec, the
     composition statement, and the terminal skeleton. It uses F's checklist, the F1-critic instruments, and the R-10/R-11 greps
     (reserved name, digest literals).
   - **Could close.** A signed audit before each Cycle 4 freeze. This is the one F1 obligation still open.
2. **F2 — `COMPOSED-FLOW-PER-TARGET-ADVERSARY`.**
   - **Object.** The actual composed flow: X-8 values plus the UNSCALED C1-LA1 allocation in the Out-`≥` form.
     - At one fresh row, through a PROVED orbit quotient (r30's formal orbit-quotient equivalence), exhaustively over the literal
       small `CB(8, m′)` at every rank where the derived selector is nonempty.
     - Every target class and every source row sum is checked, with (WID) from independent sides.
     - Hall sums at structured `X` mixing `Sec` with `q ≥ 2` classes (the family C-F2-T left untested).
   - **Could close.** The first genuine bounded end-to-end confirmation of the composition, or an exact failure or cut.
3. **F3 — `LITERAL-LEAN-FUNCTION-SEMANTICS-ADVERSARY`.**
   - **Object.** Execute U2's `cb8E1Arc` and the frozen `g_sec` with Lean conventions (ℕ truncation, `x/0 = 0`, guards). Run on the
     literal small `CB(d, m′)` and at class rows through the quotient.
   - **Attacks:** the `j ≥ 1` guard, the ℕ/ℤ cast seam of `j`, the zero classes, weight-zero rows, E1 on sector rows, and double
     counting on doubly-fed images.
   - **Could close.** Vetted E1 and `g_sec` spec shapes ready to freeze, or a counterexample shape.

**Orientation U (formal / structural).**
1. **U1 — `E1-SPEC-DISCHARGE-ON-CBGRAPH`** (U-A).
   - **Object.** In the merged project, prove:
     - (E), binding U2's `cb8N`/`cb8R` to T2's or C3-LA1's coefficient bridge;
     - (A) and (N) from C3-LA1;
     - the `j ≥ 1` and cast lemmas.

     Then assemble the unconditional `cb8E1Arc_spec_topRank` (U2's five clauses, `hfav` replaced by C2-LA3), consuming T1's counts as
     named hypotheses where they are not compiled.
   - **Could close.** The E1 half of the literal flow sorry-free modulo only (B1)–(B3), or outright.
2. **U2 — `CONJUNCT4-PER-CLASS-CAPACITY-COMPOSITION`** (U-C).
   - **Object.** The exact weight formula (U-W). One Out-`≥` interface (U-I). The theorem "E1 spec ∧ `g_sec` spec ⇒ conjunct 4", with
     the per-class capacity sums:
     - in-sector targets: `≤ 1`;
     - switch images: `ρ_1γ + (8−γ)σ(γ) ≤ γ`, from C1-LA1 Switch/Residual and C3-LA1's ρ₁ link;
     - one-choke non-images and `q ≥ 2` targets: `ρ_q w ≤ w`;
     - weight-zero targets and `r`-containing non-sector targets: 0.
   - **Could close.** Conjunct 4 conditional on exactly the two named specs, both in their frozen final shapes.
3. **U3 — `CB8-TERMINAL-FREEZE-READINESS`.**
   - **Object.** The Stage-7-ready merged project for the terminal award:
     - carry C1-LA1..3, C2-LA1..3 and C3-LA1 (if closed), receipt-bound, with the ruled keyword edits;
     - drop 607;
     - re-author cleanly, with attribution and tool-computed headers, the compiled Cycle 3 scratch the terminal needs: the choke-state
       layer, the sector classification and label uniqueness, `cb8_switch_transportRel`, `cb8E1Arc`, 608 and `hZeroChoke`;
     - state the reserved-name terminal skeleton with its residual `sorry` set equal exactly to the named specs of T1/T2/T3/U1.
   - **Could close.** A build-clean project whose only open nodes are the named specs. Cycle 4's Stage 7 then becomes a stitching award.
     If every piece closes, the unconditional terminal is decisive event (a).

## Registrations

These are for the controller at the Cycle 3 close, or on the named award's close. Items first stated at Stages 3, 4 or 5 or by me are
STATED and need the named isolated second read, funded and seated by the controller, before registration. **No new `E993-R31-` key is
proposed.** Existing key names are quoted verbatim, and their spelling was confirmed in the frozen Cycle 2 snapshot.

| # | Registration / scope update | Grade on its face | Attribution on its face | Precondition |
|---|---|---|---|---|
| G-1 | Criterion key `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`: a formal scope-note clause, "the clone-level E1 transport at `(8, m, p*)` on `m ≥ 107`, `m ≡ 2 (mod 3)`, with `ρ_q < 1` and the ρ₁ link to C1-LA1's residual syntax" (C3-LA1). The key's own grade is unchanged. | `formally_verified` (the clause, restricted scope) | as C3-LA1's attribution list | C3-LA1 closes; SR-C3-1 concordant |
| G-2 | Same key, informal scope note: the exact domain `j ≥ 1` and the `j = 0` boundary (Y-14); the degenerate columns and the `β = 0` boundary (Y-1); the fidelity of the literal Lean arc function `cb8E1Arc` at `p*` (Y-6). | `proved_informal` | C-F3-T; C-F3-U; F3; C-U2-T; C-U2-F; U2; this synthesis (degenerate paragraph) | SR-C3-1 (Y-1, Y-14); SR-C3-3 (Y-6) |
| G-3 | Composition key `E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107`: scope note with the In-sum identity, A2, the literal bridge paragraph, the zero classes (with the corrected `u = r` reason), the exact weight formula as the target case-split input, and the per-target composition at arc level. | `proved_informal` | C-T3-F; C-T3-U; C-U1-F; C-F2-T; C-U3-F; F and U adjudicators | SR-C3-2 (bridge items); SR-C3-3 (weight formula) |
| G-4 | Tier 1 key `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL`: scope note with the formal status map (conjunct 4 the only open formal node; the five rational-flow interfaces equivalent to it, not reductions; U3's 607 an alias of C2-LA1's face companion) and the reserved name (R31-N-22). Optionally, Lemma HX as an E1-free necessary-condition check. Grade unchanged. | `proved_informal` (unchanged); HX `proved_informal` if added | U adjudicator; C-U1-T; C-U1-F; C-U3-T; C-U3-F; C-F2-T (HX) | the status map cites only compiled, replayed iff lemmas, labelled on the note as ungraded scratch (SR-C3-3 re-reads the iff statements); SR-C3-4 for HX |
| G-5 | (Optional) R-1 allocation key `E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107`: the θ_Hall floor (conditional on the bridge) and the bounded ratio `1.1879–1.1892` at every class row to 1100. | `proved_informal` (floor); `bounded_computation` (ratio) | C-F2-U; F adjudicator | SR-C3-4 |
| G-6 | U3's proposed key 2 (the `leafSet` zero-weight iff): **not registered as a key.** Its content enters G-3 in the exact-weight form (one fact, one record). U3's key 1: **rejected** (alias; R-10). | — | U3; C-U3-F | — |
| G-7 | Ledger rows (no keys): R31-C3-LA1 (on close); the REFUTED formal statement `clone_fiber_card` (witness `(1,0,0,1)`; T1; refuted by C-T1-F, C-T1-U); the certification defect in U1's header (R-11; R31-N-20); the reserved-name freeze hazard; the retitled bounded row `R31-C3-F2-CB8-NINE-ROW-INPUT-AND-TEMPLATE-CONSISTENCY`; the load-bearing `hj` note on C1-LA3; the record corrections (1–11 above); the bounded records B-1. | as stated | as stated | the award closes (for R31-C3-LA1) |

**Isolated second reads to fund, in order** (the controller seats them; each reads the sealed record only).
1. **SR-C3-1 — E1 clone-level exactness** (Y-1, Y-14), run concurrently with C3-LA1's Stage 7.
   - Scope: E-1 (C-F3-T (R1)–(R4), C-F3-U A1), including the exact domain, the degenerate columns, the `β = 0` boundary and the
     per-target load; this synthesis's degenerate-case and monotone-ratio paragraph; the critic TP-h and nonnegativity proofs.
   - It gates G-1 and part of G-2.
2. **SR-C3-2 — the literal sector bridge** (Y-8): C-F2-T's paragraph, the In-sum (C-T3-F, C-T3-U), A2 (C-U1-F), the zero classes and
   the arc-level composition. It should finish before Cycle 4's Stage 3, so that T3 can consume it.
3. **SR-C3-3 — the literal E1 function and the weight formula**: Y-6 (C-U2-T, C-U2-F: guards, `x/0 = 0`, `j ≥ 1`), the exact weight
   formula (C-U3-F) and 608's semantics. Before Cycle 4's Stage 7.
4. **SR-C3-4 (optional; deferrable) — Lemma HX and the θ_Hall floor** (Y-12, Y-13).

**Alias checks.** G-1..G-5 touch existing keys only. No new identity is proposed, so no lexical or mathematical alias check against the
frozen master-510 is required beyond confirming that the ledger rows use no key names.

## Continuation ruling

`continue` is yes.
- No decisive event occurred.
- The cycle made narrow material progress on Tier 1's only open obligation, advancing all three gate objects: `E1_formal` by seats and
  critics, `COND4_formal` by critics only, `TERMINAL_integration` by seat U3.
- It is not a plateau cycle, so the armed stop gate (ruling 22) does not end the run.

**Order of the Cycle 3 close.**
1. Stage 7 funds C3-LA1 (one governed panel) with SR-C3-1 concurrent.
2. The controller files the registrations above as their preconditions clear.
3. The Claude Fable 5.1 (high) checkpoint analysis reads the sealed record and advises the Cycle 4 gate.

**What the Cycle 4 gate should carry.**
- R-10: the reserved name.
- R-11: tool-computed digests.
- The textual-index rule.
- The guarded-subtraction rule.
- The frozen `g_sec` definition text.
- The fresh rows `137, 146` and `152`.

Cycle 4 then runs the nine routes above.

**The critical path to decisive event (a).** T1 + U1 (E1 half) ∥ T2 + T3 (sector half) → U2 (composition) → U3 (freeze-ready
project) → a Cycle 4 or Cycle 5 Stage 7 terminal award under the reserved name. This is within the six-cycle ceiling if the two
smallest lemmas close in Cycle 4: the up-cover counts and the image-in-layer lemma.

## Artifact inventory

Scratch root: `scratchpad/c3-S/` (under the run root). Python 3 standard library only (`fractions`, `math.comb`, `json`, `hashlib`,
`sys`), exact integers and Fractions, `python3 -B`, foreground.

| Path | SHA-256 | Role |
|---|---|---|
| `scratchpad/c3-S/verify.py` | `a682eb76730d57403117f3694768d347e86efafe3a887695a8137e44c163e88b` | dispatch-capsule seal and member digest check |
| `scratchpad/c3-S/syn_c3la1.py` | `f554a2352de60d6c8b4bc6d8a8634b9b60d7e13601dbcfb8ce8a0ed2acbf2b3f` | semantic check of C3-LA1's frozen terminal and companion under Lean conventions (ℕ truncation, `x/0 = 0`). Checks: generic triples `a, b ≤ 12`; the `j = 0` control; at each class row every `q ∈ [1, m]` and `α ∈ [0, a]`; the ℤ[X] bridge by independent convolution; `ρ_q < 1`; the domain; the `q = 1` link in C1-LA1's `cb8R1` syntax; `argmax_q ρ_q` |
| `scratchpad/c3-S/syn_c3la1.out.json` | `1393045129ada0cfca147a7fdc1cf9be91f261574698e197c76ec462cfd9c8c0` (payload `96066dfe64024167e2989449f3ab61e4248cb2b34c59c9e4ed3df52a7e41eab1`) | output at `m = 107, 110, 125, 128, 131, 134, 140, 143`: 0 failures; the `q = 1` link true at every row; `argmax_q ρ_q = 1`; exact `ρ_1` at every row (107: `5150844596024699/5173467627355748`); 2,197 generic triples with 0 failures; the `j = 0` control 5 failures (expected); about 48 s |
| `scratchpad/c3-S/syn_c3la1_107.out.json` | `ebeac49fa73a6cd58bdc0095c0809957c6811d5aaa0d8540c1c4f5fdf31a7119` | first run (`m = 107` only), made before a one-line edit that added the exact `ρ_1` field. Superseded; the results are identical |
| `scratchpad/c3-S/syn_fixedpoint95.out.txt` | `cd5f05ac018730ce62fb437a3cf17077eac1a0c9e680ad7e3a3c1101007730b5` | `ρ_1(95)` fixed point of record reproduced exactly (`p* = 508`) |
| `cycles/cycle-3/stage6/SYNTHESIS.md` | (this file) | the deliverable |

**Replay.** From `scratchpad/c3-S/`, run `python3 -B verify.py` and
`python3 -B syn_c3la1.py 107 110 125 128 131 134 140 143`. No Lean was run by this synthesis. Every Lean fact above is cited from the
adjudicators' replays.

**Background jobs.** None started and none running at the final write. I reread this file before close.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5
