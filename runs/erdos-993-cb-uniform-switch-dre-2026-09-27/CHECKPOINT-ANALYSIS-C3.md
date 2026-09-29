# Checkpoint Analysis — Cycle 3

Independent end-of-Cycle-3 checkpoint analysis for r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`; Erdős #993: a
parameter-uniform switch-using Hall certificate on CB(8,m) at `p* = (16m+4)/3`, class `m ≥ 107`, `m ≡ 2 (mod 3)`). Written
2026-09-28, 07:55–08:40 EDT by the clock. Analyst: Claude Fable 5.1, chartered high (AUTHORIZATION.md §3; SOLUTION-CONTRACT §5).
This analysis is an input to the Cycle 4 gate. It registers, seals, rules and edits nothing.

chartered fable/high; transport-resolved model fable (explicit parameter); runtime-reported model id: claude-fable-5-1

**Boot.** I am operating within VerityOS. I booted by reading exactly `verity.md` and `identity/startup-protocol.md` of the VerityOS
root (absolute paths withheld under the brief's path rule). Subsystems loaded: those two files only. I did not follow the task-type
map into memory, logs, skills, decisions, operations or conversations. The brief's single-output-file rule supersedes the repository's
conversation-logging instruction for this seat; I wrote no conversation log.

## Identity and seal audit

**Verified before reading anything else.**

| Object | Recomputed | Result |
|---|---|---|
| Brief `control/CHECKPOINT-ANALYSIS-C3-BRIEF.md` (file SHA-256) | `49cdeb0707cf118e0ee7793c6f7504bb87d913978cb63b056a5331f1489961ca` | MATCH (the value given at dispatch) |
| **Capsule seal** `control/CHECKPOINT-C3-PACKET-MANIFEST.json` (SHA-256 of compact key-sorted JSON minus `seal_sha256`, no trailing newline) | **`f48b3637112e68915bae8f39974be75ee9d41a55dc83333a3fc1a4d45a39a1d2`** | MATCH |
| Members: 231 listed (`file_count` 231; run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`; stage `cycle-3-checkpoint`; schema `verityos.math-dre.packet-manifest.v1`) | every byte count and SHA-256 recomputed | **231/231 MATCH**, 0 missing, 10,300,070 bytes (`scratchpad/c3-checkpoint/member-verify.txt`) |

**Independent re-verification of the record's own identity claims** (my instruments, standard library only).

- The seven award `Main.lean` digests equal the closeouts' values: C1-LA1 `f0578ed7…`, C1-LA2 `a906ec17…`, C1-LA3 `c0605e12…`,
  C2-LA1 `986b5257…`, C2-LA2 `e75c66b2…`, C2-LA3 `7dab4388…`, C3-LA1 `1388fa52…` (7/7).
- C3-LA1 `VERIFICATION-REPORT.md` hashes to `b3f358ab5e35996694ea52e1aeac2367b7cf6ffeb669212a96f25fc8a12deede`, the value in
  `RUN-STATE.c3-checkpoint.json`. Its kernel receipt verdict is `verified`; axioms exactly `propext`, `Classical.choice`, `Quot.sound`.
- The C3-LA1 terminal statement in `Main.lean` is **byte-equal** (1,344 bytes) to the frozen text in
  `cycles/cycle-3/stage6/SYNTHESIS.md` (`## Lean awards`, C3-LA1); hypotheses exactly `hm : 107 ≤ m`, `hmod : m % 3 = 2`; 53 entry
  markers; exactly one `theorem` (`scratchpad/c3-checkpoint/c3la1-terminal-compare.txt`).
- All sixteen second-read files (SR-1..6, SR-C2-1..6, SR-C3-1..4) hash to the values recorded in the three `*-SECOND-READ-AGENTS.json`
  records (16/16; `scratchpad/c3-checkpoint/second-read-hash-crosscheck.txt`).
- Hygiene scan of the seven frozen `Main.lean` files: 0 executable `sorry`/`admit`, 0 `native_decide`, 0 `decide`, 0 `axiom`
  declarations, 0 occurrences of the reserved name `cb8_topRank_eligible_and_weightedHall`, exactly one `theorem` per file. The two
  `sorry` tokens in C2-LA1 (lines 2298 and 2347) sit inside docstrings reading "sorry-free". Every `EVIDENCE/axioms.txt` ends with
  the terminal's axiom line `[propext, Classical.choice, Quot.sound]`; the C2-LA1/LA2/LA3 logs carry linter warnings before it.
  Options census: C2-LA1 uses `set_option maxHeartbeats 0` ×21, `maxHeartbeats 4000000` ×3, `maxHeartbeats 1000000` ×2,
  `maxRecDepth 20000` ×1 and `exponentiation.threshold 2000` ×409; C2-LA3 uses `maxHeartbeats 4000000` ×8 (scoped `in`); the other
  five use none (the `pp.all` hits are inside comments). C2-LA1's formalizer report records its options; its fidelity review does not
  mention them (see Risk register R-7).
- Registry snapshot at the Cycle 3 close: 497 claims (VERIFIED 315, REFUTED 98, OPEN 58, CONDITIONAL 26); six `E993-R31-` keys with
  the grades the closes state (`scratchpad/c3-checkpoint/registry-r31-audit.txt`); ledger 44 rows; lint 0 findings and 2 accepted
  warnings (`UNREGISTERED_REFUTATION` on two ledger-only refutations that were never registered claims — correct).
- The invented digest (R31-N-20, synthesis R-11) verified from the frozen U1 source under `sources/c3-stage7-sources/`: line 12 of U1's
  `Main.lean` reads `f0578ed7ce7f51f6cf3a03e1e0c9f1e6d5b0d9a2b0a7c1e6a1b0c9d5e7f2a3b4` and calls itself "truncated in this header;
  full digest recorded in RETURN.md"; the true digest of the frozen C1-LA1 `Main.lean` is
  `f0578ed7ce7f51f695d410cdbd1265d7071d40f40832635ed12d3dade6c9b78e`, and U1's `RETURN.md` (line 34) carries only the 16-hex prefix.
  Only the first 16 hex characters are real. The defect is exactly as ruled.
- Concurrent master: `sources/concurrent/master-510-2026-09-28/` holds 510 = 491 + 19 keys, all `E993-PATH-STAR-*` or
  `E993-FINITE-BLOCK-*`; no `E993-R31-` key; no lexical token overlap with any r31 key beyond stop-words; no new statement mentions
  `CB(8` or `16m+4` (`scratchpad/c3-checkpoint/master510-screen.txt`). R31-N-19's "0 hits" is reproduced.
- Model disclosures: all nine Cycle 3 returns carry the two-part line with runtime `claude-sonnet-5`; every critic, adjudicator,
  synthesis, Stage 7 seat and second read reports `claude-opus-5-5`. Chartered efforts are recorded on every dispatch; the effort
  actually applied is the session's (AUTHORIZATION §3), and **the numeric session effort is recorded nowhere in the capsule** (see
  Process quality, gap 8).

**Read-boundary disclosures (this analyst).**
1. Capsule members read: the three contracts and `AUTHORIZATION.md`; all three `CYCLE-CLOSE.md`, `*-CLOSE-REGISTRATION-LOG.txt`,
   `*-STAGE1-GATE.md`, `C3-ALLOCATION.md`, the lint file, the five snapshots (registry, distinctions, obligations, controller notes,
   run state); the three syntheses (Cycle 3 in full; Cycles 1–2 by targeted `grep` of flags and named findings); all three Cycle 3
   adjudications; the three Stage 7 closeouts; the four Cycle 3 second reads in full; the C3-LA1 run (verification report, fidelity
   review, kernel receipt, formalizer report by `grep`); the seven `Main.lean` files (by hash, `grep` and short `sed`/`awk` excerpts —
   the terminal statements and definition markers); the six `C3-STAGE*-AGENTS.json`, the three `*-SECOND-READ-AGENTS.json`, the
   `C3-STAGE3-READ-BOUNDARY-DISCLOSURES.json`; the nine Cycle 3 returns and the C-U2-F, C-T3-U critiques by `grep` only (disclosure
   lines, gate lines, spec clauses, named lemmas); the fidelity reviews and formalizer reports of C1-LA2, C2-LA1, C2-LA3 by `grep`
   for options; the `EVIDENCE/axioms.txt` of every award. I did not read the Cycle 1–2 returns, critiques or adjudications, nor
   the Cycle 1–2 second reads beyond hashing them.
2. Frozen `sources/` reads (permitted "for reference"): `sources/authority/CLAIM-IDENTITY.json` and
   `sources/concurrent/master-510-2026-09-28/CLAIM-IDENTITY.json` (key lists and statements, by script); the first 20 lines and a
   digest `grep` of `sources/c3-stage7-sources/U1/LeanProject/LeanProof/Main.lean`; a `grep` of named declarations and about fifteen
   lines (`chokeState`, `sector_out_ge_one`) of `sources/c2-stage7-sources/U2/LeanProject/LeanProof/Main.lean`. Names-only listings:
   `sources/`, `sources/concurrent/`, `sources/c3-stage7-sources/`, `sources/c3-stage7-sources/U1/`, one `find` for `Main.lean`
   under that U1 directory, and `runs/lean-2026-09-28-c3-la1-cb8-e1-clone-transport/`.
3. The harness injected the project `CLAUDE.md`, the user auto-memory index (which mentions this run) and the user's e-mail into my
   context before my first tool call. I did not open or use them; nothing here rests on them.
4. Two oversized tool displays (the manifest listing; the Cycle 3 synthesis) were saved by the harness to its own cache outside the
   run root. I did not open the cached copies; I re-read both files from the run root with the file reader. One shell line with an
   `echo =====` separator was rejected by zsh (cosmetic; the preceding file was displayed and the rest re-run).
5. No `lake`/`lean`, no network, no installs, no child agents, no background jobs (none started, none running at the final write).
   Python `python3 -B`, standard library, exact integers, foreground only. Scratch only under `scratchpad/c3-checkpoint/`; one
   `mkdir -p` for it. This file is my only output. No sealed member was edited.

## Grade against the contracts

### Where Tier 1 (E) ∧ (H) stands, node by node

Grades follow SOLUTION-CONTRACT §4 (a composition's grade is its weakest input's; compiled scratch has no grade). "Formal" means a
closed governed award with a kernel receipt.

| Node (SOLUTION-CONTRACT §2 terminal on `cbGraph m`, class `m ≥ 107`, `m ≡ 2 (mod 3)`) | Grade | Source of record |
|---|---|---|
| Conjunct 1: `(cbGraph m).IsTree` | formally_verified | C1-LA2 (`cbGraph_isTree`); C2-LA1 |
| Conjunct 2: `crossingIndex + 2 ≤ p*` (with (ELIG-top)(a) as `i_{p*−1} < i_{p*−2}` of the literal tree) | formally_verified | C2-LA1 (degree-50 `S_5` certificate kernel-checked; block descent C1-LA3 with load-bearing `hj : 5 ≤ j`); eligibility key `formally_verified` (SR-C2-4/5) |
| Conjunct 3: `3p* < 2·indepNum + 1` | formally_verified | C1-LA2 (`cb_lowWindow`, `indepNum = 9m+1`); C2-LA1 |
| `F_{p*}` derived `= leafSet` (every leaf favorable), Darroch/Newton-free | formally_verified at graph level | C2-LA3 over C2-LA2; r30 favorability key stays `proved_informal` at its general scope with the r31 formal clause — no status transfer |
| (L-S)_top at template level (Out over every `K`-assignment, In at `K−1`, Switch, Residual `θ ≤ 1 − ρ_1`) | formally_verified | C1-LA1 (R-1 key) |
| E1 condition (i), `ρ_q < 1` at `p*` for every `q ∈ [1,m]` | formally_verified (as conjunct 2 of C3-LA1's terminal; restricted scope) | C3-LA1; before it an ungraded companion in C1-LA3 (entry 20) |
| E1 clone-level transport (X-8 exactness: rows, columns incl. degenerate classes, nonnegativity, `ρ_1` in C1-LA1 syntax) | formally_verified (clone level only) | C3-LA1; SR-C3-1 |
| Literal E1 arc function `cb8E1Arc` on `cbGraph m`: clauses (1) signs, (3) rows, (4) columns | proved_informal (SR-C3-3); clauses (2), (5) and `hZeroChoke` compiled scratch | U2, C-U2-T, C-U2-F; SR-C3-3 |
| Literal up-cover counts (B1)–(B3) on `cbGraph m` (the E1 graph lift) | proved_informal (r30 clone correspondence, re-derived SR-C3-3); **no compiled fragment** | R31-N-21; synthesis R-12 |
| Sector `g_sec` on literal pairs; Out sum `= Σ_i Out(state_i B)`; images in the layer | proved_informal (Lemma DF, SR-C2-3; SR-C3-2); compiled scratch: label uniqueness, classification (C-T3-U, C-T3-F), `sector_out_ge_one` over `chokeState` (Cycle 2 U2 scratch — present at line 2934 of the frozen file, my check) | SR-C3-2 |
| In-sum on in-sector targets; A2 (`8 − γ` preimages, weight `γ`); zero classes | proved_informal | SR-C3-2 (C-T3-F, C-T3-U, C-U1-F, C-F2-T) |
| Exact active-tag weight formula on `leafSet` | proved_informal; 608 and `hZeroChoke` compiled scratch | SR-C3-3 (C-U3-F, U3, C-U2-T/F) |
| Per-target capacity composition (in-sector `≤ 1`; images `ρ_1γ + (8−γ)σ(γ) ≤ γ`; `q ≥ 2` targets `ρ_q w ≤ w`; weight 0 → 0) | proved_informal | composition key + SR-C3-2 clause (6); F adjudicator item 2 |
| Rational-flow interface (Out-`≥`, In-`≤`) ⇒ terminal | compiled scratch (critic; replayed); interface only, equivalent to conjunct 4 | C-U1-T CA-2, C-U3-T CA-2, U adjudicator |
| **Conjunct 4**: `∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) p*) p* f` | **OPEN formally**; proved_informal through the composition | Tier 1 key scope note [r31 C3; SR-C3-3] |
| **Tier 1 = (E) ∧ (H)** | **proved_informal**, Darroch/Newton-free — **not decisive** | Tier 1 key (SR-C2-5); unchanged at the Cycle 3 close |
| Lemma HX (criterion-free Hall surplus at `X = Sec ∪ P_1`); θ_Hall floor | proved_informal notes (necessary conditions, off the DAG) | SR-C3-4 |
| Refuted this run | (G′) two-binomial ascent (ruling 20); T1's `clone_fiber_card` as a Lean statement (kernel, witness `(1,0,0,1)`); leg-type/leg-count sector templates infeasible (R-6 key, proved_informal) | C2, C3 records |

Reading of the table: the formal frontier has moved from "conjuncts 2 and 4 open" (Cycle 1 close) to "conjunct 4 open, with its
clone-level numeric core formal" (Cycle 3 close). Nothing formal yet touches a literal arc of `cbGraph m`. Every node below conjunct
4 has a complete informal proof confirmed by an isolated second read; the remaining work is Lean engineering with one genuinely
combinatorial node (the up-cover counts).

### Is "material progress: yes (narrow)" right under SOLUTION-CONTRACT §5?

Yes. §5 defines a plateau cycle as one with **no** material progress on Tier 1/2, **no** new `proved_informal` lemma **and** no new
adversarial finding. Cycle 3 fails all three clauses:

- New `proved_informal` lemmas, each confirmed by an isolated read and registered as notes: the generic clone-transport domain and
  degenerate classes (SR-C3-1); the literal sector bridge items — `g_sec` as a pair function, exact pre-scaling Out/In identities,
  A2 at `γ = 8` and for non-image targets, the split zero classes (SR-C3-2); the exact weight formula and the literal E1 function's
  fidelity (SR-C3-3); Lemma HX and the θ_Hall floor (SR-C3-4).
- New adversarial findings: a kernel-refuted formal statement; the `j = 0` shape constraint; the invented digest; the reserved-name
  freeze hazard; the load-bearing `hj`; the ruling-16 numerical invisibility; two instrument-fidelity failures.
- Material progress on Tier 1's only open obligation: one governed award (C3-LA1).

My qualification is on the word "narrow", which I would make sharper than the synthesis did. The gate line `COND4_formal: advanced`
rests on critic scratch alone (three sector classification lemmas and one switch-arc clause); the one governed award is clone-level
algebra that does not mention `cbGraph m`; no registered grade moved; and the F adjudicator's `material_progress: no` for its own
portfolio is accurate. Measured in governed awards against the leaf nodes of the conjunct-4 DAG (next section), Cycle 3 closed about
one of eight. It is the weakest of the three cycles by formal yield (one award against three and three). This is not a plateau, but it
is a productivity signal, not a mathematical one, and Cycle 4's design should respond to it.

### Registry faithfulness (Cycle 2 close as carried, Cycle 3 registrations as applied)

- **Cycle 2 close.** Eligibility key `computer_assisted → formally_verified` through C2-LA1 with SR-C2-4/SR-C2-5: faithful; the
  supersession of the R31-N-8 grade is written on the face. Tier 1 key `computer_assisted → proved_informal` (SR-C2-5): faithful under
  the weakest-input rule once the fixed certificate became formal and the Darroch/Newton dependency was discharged (C2-LA2, C2-LA3,
  SR-C2-1); its weakest inputs are now the composition key and the r30 criterion key, both `proved_informal`.
- **Cycle 3 close** (`control/C3-CLOSE-REGISTRATION-LOG.txt`): no new key and no grade change — faithful. C3-LA1 enters as a
  `formally_verified` **clause** on the r30 criterion key at the restricted scope (`d = 8`, the class, `p*`, clone level) with the
  key's grade unchanged at `proved_informal`; the note says explicitly that condition (i) is formal only as conjunct (2) of the terminal
  and that no grade on any condition-(i) note of any key changes. That is the right treatment (a new key would alias, SR-C2-2
  finding 5), and no status crosses a fence. I confirmed the tags on the four host keys: criterion key `[r31 C3; C3-LA1; SR-C3-1]`,
  `[r31 C3; SR-C3-1]`, `[r31 C3; SR-C3-3]`; composition key `[r31 C3; SR-C3-2]`, `[r31 C3; SR-C3-3]`; Tier 1 key `[r31 C3; SR-C3-3]`,
  `[r31 C3; SR-C3-4]`; R-1 key `[r31 C3; SR-C3-4]`. The G-5 note states that the R-1 key's formal grade does not cover it. U3's alias
  key was rejected (G-6). The ledger rows named in the synthesis's G-7 are all present (44 rows).
- **The superseded sentence.** The Tier 1 key's scope still contains the Cycle 2 sentence "the graph-level link for the private leaves
  is not formally verified" (SR-C2-5, predating C2-LA3's close). The `[r31 C3; SR-C3-3]` note supersedes it in place ("for the formal
  record only"). Under the never-edit-sealed-records rule this is the correct form; it is not a fence breach; but a reader who stops
  at the earlier sentence is misled. The terminal reconciliation should place the superseding note first, or the public face should
  carry only the current status map.
- **Fences.** (HALL) at full scope, the primary aggregate, TREE, FOREST, TRANSFER stay OPEN with only superseding notes on (HALL);
  `E993-TREE-REAL-ROOTED` stays REFUTED; no `E993-R31-` key claims any rank other than `p*` or any `m` outside the class; the two
  Cycle 1 keys whose names say `TOP-RANK` (R-1, R-6) carry the explicit-rank aliases ruling 11 required — acceptable, but the
  ambiguity ruling 11 named survives in two key names and should be noted at the terminal reconciliation.
- **A small standing irritant.** `ρ_1(107) = 5150844596024699/5173467627355748` has now been recomputed identically by T2, both T2
  critics, the T adjudicator, the synthesis and SR-C3-3, and each time a seat calling it "of record" was narrowed because
  SEMANTIC-CONTRACT §5 records `ρ_1` only at `m = 95`. A controller fact promoting it to a fixed point of record would end the
  relitigation.

## Conjunct 4: the path to decisive event (a)

**The target, exactly.** `∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) ((16m+4)/3)) ((16m+4)/3) f` for
`107 ≤ m`, `m % 3 = 2` — the hypothesis `hH` of C1-LA2's terminal `cb8_topRank_of_descent_and_flow` (entry 78), whose other
hypothesis `hE` C2-LA1 has discharged. With C2-LA3 the tag set may be taken as `leafSet (cbGraph m)`. The U adjudicator's reconciled
award form: a nonnegative rational `g = cb8E1Arc + g_sec`, zero off `transportRel`, layer row sums `≥ w_F` and layer column sums
`≤ w_F`, then the compiled Out-`≥` interface (C-U1-T CA-2) and r30's `exists_saturatingFlow_of_weightedHall`.

**Formal inputs already in hand** (all receipt-bound, carriable byte-identically under ruling 19): the definitions of record (C1-LA2
entries 1–21: `indepFamily`, `tagWitnesses`, `activeWeight`, `favorableLeaves`, `transportRel`, `IsSaturatingFlow`, `WeightedHall`,
`crossingIndex`), the CB layer (`cbEdge`, `cbGraph`, `cbVertex`, neighbourhood lemmas, `leafSet` image and card, witness sets
`W_v = {r}`, `W_{c_ij} = {u_i}`), C1-LA1's allocation and its five conclusions, C1-LA3's coefficient lemmas, C2-LA1's terminal,
C2-LA3's `favorableLeaves = leafSet`, C3-LA1's clone transport with `ρ_1` in C1-LA1's residual syntax and `ρ_q < 1` at every `q`.

**The smallest DAG from those inputs to the terminal** (my own, reconciled with synthesis R-6/R-12 and the U adjudicator's groups),
with a Lean-difficulty rating and what already compiles:

| # | Node | Difficulty | What exists |
|---|---|---|---|
| N1 | **Up-cover counts on `cbGraph m`** (B1–B3): for `r`-free independent `B` with `q ≥ 1` open chokes and weight `α+1`, the deletion classes are `α` Boolean / `j − α` ternary / `q` choke; the insertions into an `r`-free `A ∈ I_{p*}` are `a − α` Boolean (absent private leaves at open chokes) and `2(b − ℓ′)` ternary (empty legs and the empty arm), each independent and in the layer; non-choke insertion preserves `q` and raises `w` by exactly `[z active]` | **Hard–medium** (the one combinatorial node: a case analysis over `cbEdge`'s label arithmetic, an explicit bijection from empty legs to insertions, and the weight increment through `activeWeight`'s filter) | nothing compiled; the guarded abstract fiber count (`clone_fiber_card_of_le`) and C-U2-F's `crit_counts.py` (0 failures) |
| N2 | E1 spec discharge: (E) `Σ_α cb8N = cb8R`, (A) and (N) transported from C3-LA1 into U2's `cb8G/cb8H` vocabulary, the `j ≥ 1` guard and the ℕ/ℤ cast seam, then the unconditional `cb8E1Arc_spec_topRank` with `hfav := C2-LA3` | Medium (mostly definitional transport `e1G = cb8G`, `e1Rho = cb8Rho`; `omega`) | U2's definitions, clauses (2), (5); `cb8G_add_cb8H`, `cb8_out_algebra`, `hZeroChoke` (critics); C3-LA1 for the algebra |
| N3 | Sector Out half: `g_sec` by set difference; images in `indepFamily p*` (the image-in-layer lemma, the synthesis's smallest sector node); leg count `Σ_i(β_i+γ_i) = |B| − 2`; Out bridge `Σ_A g_sec(B,A) = Σ_i cb8Out(state_i B)` by `Finset.sum_image`; then `≥ 1` | Medium–easy | label uniqueness and `sector_switch_classify_full` (C-T3-U), `sector_transportRel_classify` (C-T3-F), `cb8_switch_transportRel` (C-U1-T); `chokeState`, `chokeBeta_add_chokeGamma_le`, `sector_out_ge_one` (Cycle 2 U2 scratch; present, my check) |
| N4 | Sector In half: complete preimage census of an in-sector target (`2·#empty legs` sector deletions plus the `C(z,2)` switch-at-`r` arcs from non-sector sources carrying 0) and the zero classes; In sum `= Σ_i cb8In(state_i A) ≤ 1` | Medium (the "no other preimage" case split; the T adjudicator estimated the analogous switch clause at 50–60 lines) | SR-C3-2's proof (1)–(3), (5); instruments |
| N5 | A2 in Lean: the sector preimages of a target containing `v` and exactly one choke are the `8 − γ` sets `(A ∖ {u_i}) ∪ {r, b_ij}`, weight `γ`; multi-choke and no-`v` one-choke targets have none | Medium ((S)-arc inversion; independence iff `c_ij ∉ A`) | SR-C3-2 (4); C-U1-F's proof; `cb8_switch_preimage_count` is only the `Fin 8` complement |
| N6 | Exact weight formula `w(B) = [v, r ∈ B] + Σ_i [u_i ∈ B]·#{j : c_ij ∈ B}` on `leafSet` | Medium–easy (a `Finset.card` partition over carried entries 60, 69, 70, `eq_cbVertex_iff`) | 608 and both `hZeroChoke` versions compiled |
| N7 | Per-class composition: "E1 spec ∧ `g_sec` spec ⇒ Out-`≥`/In-`≤` bundle": target case split by N6 (in-sector; one-choke with `v`; other `r`-free `q ≥ 1`; weight 0); arithmetic from C1-LA1 (ii)–(v), C3-LA1 conjuncts 1 and 3; `q ≤ m` | Medium (a large but mechanical case split; the `ρ_1` link is already in C1-LA1's syntax — the interface C3-LA1 was designed to give) | nothing compiled beyond the interfaces |
| N8 | Interface and terminal: the bundle ⇒ `WeightedHall` ⇒ `∃ f` ⇒ the §2 body under the reserved name with hypotheses exactly `hm`, `hres` | Easy | C-U1-T CA-2 (replayed by the U adjudicator), r30 entries 30–31, C2-LA1 terminal |

Dependencies: N1 → N2; N3, N4, N5 mutually independent; N6 → N7; {N2, N3, N4, N5, N7} → N8. Critical paths: N1 → N2 → N7 → N8 and
N4 → N7 → N8. The E1 half (N1, N2) is the harder half and the less-owned one: N1 has no compiled fragment after three cycles, and the
seat that would own it under the synthesis plan (T1, Sonnet 5) produced the kernel-refuted `clone_fiber_card` in Cycle 3.

**Is decisive event (a) reachable by Cycle 6?** Yes, realistically but without slack beyond one cycle. The evidence for the pace: seven
governed awards closed in three cycles, and every award so far was preceded by compiled scratch covering its nodes — Stage 7 has
never had to invent mathematics or Lean from nothing. The rate limiter is therefore scratch production for N1–N7, and in Cycles 2–3
that production came predominantly from critics (the synthesis's own routing observation, both cycles). A schedule that fits the
ceiling: Cycle 4 closes N3 + N6 (and N5 if it compiles) as one or two governed awards and gets N1 compiled in scratch; Cycle 5 closes
N1 + N2 (the E1 flow on `cbGraph m`) and N4 (+ N5), compiles N7; Cycle 6 stitches N7 + N8 as the terminal award. If N1 also compiles
in Cycle 4, the terminal can land in Cycle 5. If N1 has not compiled by the Cycle 4 close, the run should expect to end at the
ceiling with Tier 1 `proved_informal` and a formal record of everything except the graph lift and the composition.

**Against the synthesis's Cycle 4 portfolio — what I would change.**
1. **Dual-own N1.** The synthesis gives the up-cover counts to T1 and has U1 "consume T1's counts as named hypotheses". Make U1 prove
   B1–B3 as well, by a different decomposition (U1: through the per-vertex adjacency lemmas of C1-LA2; T1: through the clone
   correspondence). N1 is the critical path and the node with the worst seat history; two independent attempts plus two critics each
   is the cheapest insurance the topology allows.
2. **Freeze more than `g_sec` at the gate.** Freeze, as tool-digested texts before Stage 2, the Lean statement of every leaf: B1–B3,
   the unconditional `cb8E1Arc_spec_topRank` (with `hfav` replaced by C2-LA3), the `g_sec` Out/In/A2/zero-class specs, and N7's
   composition statement. Sonnet seats have done well when handed an exact statement to engineer (C1-LA1's allocation, T2's coefficient
   bridge, U3's merge) and badly when asked to find the statement (T1 C3, U1 C3, T3 C3, F2 C3). Freezing the leaves also lets Stage 7
   fund whichever leaf closes without a second freeze debate.
3. **Rule now on the composition award's legitimacy.** N7 ("E1 spec ∧ `g_sec` spec ⇒ conjunct 4") is a legitimate intermediate award
   under §2 ("the sector-certificate composition lemma … over the carried network definitions"); it is not the trivial reduction
   struck in R-9/R-10 because its hypotheses are per-arc specs, strictly weaker and checkable, not the existence of a flow. The Cycle
   4 gate should say so explicitly, so the U2 seat and its critics do not relitigate it.
4. **Fresh rows.** The synthesis recommends `137, 146, 152` as untouched. They are not: SR-C3-1 ran 137, 143, 146, 152 (every `q`,
   every `α`) and SR-C3-3 ran 137, 146, 152 at the literal E1 function; SR-C3-2 ran 149, 155, 200 at the sector bridge. For genuinely
   fresh E1/sector rows use `158` and `164`, and add **`m = 161`** as a structural probe: the ledger row SR-4-R2 records it as the
   first class row with `x < p* − 2` (eligibility slack changes there) — an adversary should look where the structure first moves.
5. **Plan Stage 7 for two awards in Cycle 4,** with the panel briefs pre-generated for both halves, so that a late second closure is
   not lost to capacity (Cycle 3 ran one award; Cycles 1–2 ran three).
6. **Make F2's owed check mandatory.** The per-target evaluation of the actual composed flow at a class row through the proved orbit
   quotient, plus Hall sums at structured `X` mixing `Sec` with `q ≥ 2` sources, has been "owed" since Cycle 1 and is the one
   adversarial item whose failure would matter. It should be F2's sole object with a pass/fail deliverable.

## Process quality

### Recurring failure modes, Cycles 1–3 (with the record)

| Mode | Instances |
|---|---|
| Wrong favorability index (`Δ_{p*−1}` for `Δ_{p*}`) | C2: T2 (rejected), F1, F3 and one critic (R31-N-11/12); root cause: `Δ_p` used but undefined in SEMANTIC-CONTRACT (fixed by C3 gate ruling 16); the error is numerically invisible at class rows (C-F1-U A5, F2 diagnostic) |
| Retyped closed forms / row lists | R31-E-d (allocation swapped `G`'s factors); R31-E-c (brief identity off by 2); C2 allocation named 110/113 where the gate named 116/119; R31-E-a/E-b (cloned tool templates); R31-E-e/E-f (brief templates) — eight lettered errata in three cycles, all controller-side text or tooling, none touching a registered result |
| Invented or unverified certification literals | C3 U1 header digest (R31-N-20; verified above); C3 T2's hard-coded `ρ_1(107)` labelled "of record"; U3's replay generator hard-coded its own output path so "reproduced bit-for-bit in a replay directory" was not backed |
| Trivial reductions dressed as progress | C3 U1 (hypothesis ⇔ conjunct 4, kernel-proved both ways by critics); C3 U3 entry 607 (`rfl`-identical to C2-LA1's companion, under the reserved name); C3 U2 ("four named hypotheses", three of which restate the conclusion) |
| "Compiled"/"formally_verified" claims without the object | C1 U2 labelled compiled scratch `formally_verified`; C3 U2 the same; C3 T3 returned `compiled` having built no Lean (struck to `bounded_evidence`) |
| "Independent sides" that were one model twice | C1 F1/T3 tautological checks; C3 F2 "(WID) from three independent sides" (all aggregate-side); C3 F3 `F = leafSet` stipulated on ineligible instances; C3 T3 "verified on two independent sides" (same functions); C3 F2 mutant self-test testing hand constants |
| False formal statements hidden by `sorry` | C3 T1 `clone_fiber_card` (truncated ℕ subtraction; refuted three times in the kernel) |
| Process-listing and boundary breaches | full `ps aux`/`pgrep -fl`: C1 U2, U1, F2; C2 T3; C3 T1, U2, U3, F3; the C3 U adjudicator — nine instances; out-of-grant reads of `skills/optimization-loop/skill.md` by C2 T2, C2 U3, C3 F1, C3 U3 (the repository's task-type map was visible before the dispatch's restricted-boot clause) |
| Controller stage discipline | R31-N-18 (close packet sealed before the results freeze; resealed); R31-E-g (gate text misstated the plateau rule); R31-E-h (a mid-attempt relay reopened the C3-LA1 formalizer after its first return; reviewers relaunched) |

### Controls that worked

- **Cross-orientation paired critics.** Every seat error above was caught by at least one critic and most by both, independently:
  the index lapse (four critics), the false `clone_fiber_card` (kernel refutations from both), the invented digest (both), the two
  alias terminals (both pairs, with `rfl` witnesses), T3's `compiled`, F2's retitle, F3's inverted flag and vacuous counter. The
  critics also produced most of the compiled Lean in Cycles 2–3. This is the run's load-bearing control.
- **Adjudicator replays.** Kernel rebuilds of every seat and critic file, byte comparisons of carries, and own instruments; the U
  adjudicator's `rfl` and iff replays settled the R-9/R-10 rulings on evidence, not testimony.
- **Isolated second reads.** Each found and repaired something the synthesis had missed: SR-1 (90 not 45 per-state checks), SR-6
  (Farkas certificates certify F-3, not F-2; `θ_budget` has an exact form), SR-C3-1 (step 9's zero case; the "Hypotheses" paragraph;
  the condition-(i) grade wording; run-qualified tags), SR-C3-2 (one fact one record; the switch-at-`r` split), SR-C3-3 (target-side
  clause (5); the stale sentence; the freeze-hygiene finding on 607), SR-C3-4 (`γ = 1..7`, not `1..8`; the enclosure `[1.1879, 1.1892]`).
- **The governed Stage 7 panel.** Fidelity warnings W-1/W-2 on C3-LA1 aligned the registration wording with SR-C3-1; reviewers were
  stopped before writing when their inputs went stale (R31-E-h handled correctly).
- **Seal, path-check and residue-check discipline; the reserved-name rule (R31-N-22); the weakest-input grade rule (R31-N-8, ruling
  10); ruling 19's byte-identical carries with the keyword-rekey record (R31-N-15/16).** No sealed member was edited anywhere in
  three cycles; every correction is a record.

### Controls that did not work, or do not yet exist

1. **Rule 7 of the worker brief ((WID) from independent sides) is stated but not enforced.** Four seats in two cycles skipped or
   half-asserted it; each time the fix came from critics after the fact. Enforcement should be structural: a seat that reports a
   number at a row must name in a fixed field the two instruments and the two sides, and admission (not critique) rejects a return
   whose field is empty. Critics should be told to **reject**, not narrow, a favorability or (WID) claim without a textual index.
2. **Contract-glossary gaps surface a cycle late.** `Δ_p` was used undefined for two cycles. Add a Stage 2 pre-seal check: every
   symbol in the worker brief and allocation has a definition in a contract file (a mechanical list; five minutes).
3. **Digest literals are not checked at admission.** Add to the residue check: every 64-hex literal (and every `…`-truncated prefix
   claiming a source) in a return, critique or Lean header must match a digest in the frozen `SOURCE-DIGESTS.json` trees or the
   run's manifests; otherwise the return is admitted with a flagged defect. The synthesis's R-11 rule ("compute, never type") needs
   this mechanical half.
4. **`compiled` verdicts need an artifact.** Admission should require, for any verdict containing "compiled", the path and digest of
   a build or `#print axioms` log inside the seat's inventoried scratch. T3's `compiled` in Cycle 3 would have failed admission.
5. **Grade labels on scratch.** Two U2 seats in two cycles wrote `formally_verified` on scratch. Put SOLUTION-CONTRACT §4's sentence
   ("a compiled scratch declaration has no grade until its governed award closes") verbatim in the worker brief's verdict section,
   with the allowed verdict vocabulary listed.
6. **Boot-order leak.** Four seats read a VerityOS skill file because the repository's task-type map was in view before the dispatch's
   restricted-boot clause. The pointer prompt should carry the restricted-boot clause as its first line, ahead of any file name.
7. **Process listings.** Nine breaches with no consequence beyond disclosure. Provide a controller-owned `pid-check` helper in every
   capsule and make its use the only permitted process query; a full listing then becomes a rule violation with a struck disclosure
   claim, not a footnote.
8. **The effort actually applied is unrecorded.** AUTHORIZATION §3 discloses that seats inherit the session's effort, but no record
   states what that effort was at any dispatch. Add the numeric session effort to every dispatch record and to RUN-STATE. Without it
   "chartered high" on adjudicators, the synthesis and Stage 7 cannot be audited even in principle.
9. **Controller retyping.** Eight lettered errata are all retyping or template-cloning. Generate allocations, briefs and gate rulings
   from one machine-readable gate file (rows, closed forms, rulings) and run a "closed-form copy check" (every formula in a brief is a
   substring of a contract) beside the residue check before launch.
10. **Stage 7 options census.** C2-LA1's `maxHeartbeats 0` ×21 and `maxRecDepth 20000` are recorded in its formalizer report but not
    in its fidelity review. Make the synthesis's C3-LA1 "Options" rule standing: every `set_option` on the face, counted, with a
    measured finite bound where the workflow refuses `0`, and checked by the fidelity reviewer.
11. **Seat charters versus observed yield.** In Cycles 2 and 3 the decisive compiled Lean came from Opus 5.5 critics at medium effort,
    while Sonnet 5 routes produced the run's alias results, its refuted statement and its invented digest alongside genuine nodes.
    Within Ashton's charter (models fixed), the fix is object design: give routes exact frozen statements to engineer (recommendation
    2 above) and reserve discovery for critics. Whether Opus may be seated on the two critical-path U routes for Cycles 4–6 is a
    question for Ashton (below), not a change the controller can make.

## Risk register

| # | Risk | Evidence | Likelihood | Check that settles it |
|---|---|---|---|---|
| R-1 | **A hidden dependency in a carried r30 fragment.** C1-LA2's r30 entries 14–21 are code-identical to r30's, not byte-identical (the recorded classical-scoping repair); r30 entries 30–31 (Hall ⇒ flow) are "certified only by the fresh kernel check" in the r31 environment (C-U1-T, U adjudicator); ledger row R31-C1-CARRY-SOURCE-CAUTION | Low (every fragment is re-kernel-checked inside each award; the difference is provenance, not proof) | At the terminal award, list every carried r30 entry with byte- vs code-identity and the receipt it is bound to; the fidelity reviewer confirms each |
| R-2 | **Fidelity gap between the frozen definitions and SEMANTIC-CONTRACT §1** (weight, relation `(D) ∪ (S)` with `|N(u) ∩ B| = 2`, selector, first descent). r31 has never re-read `transportRel`, `activeWeight`, `IsSaturatingFlow` bodies against the contract text as an explicit item; it relies on r30's fidelity reviews | Low–medium (SR-C3-3 derived the E1 branches from `activeWeight`'s filter; SR-C3-2 read the C1-LA2 fragments; both concordant with the contract) | Cycle 4 F1's signed audit includes a clause-by-clause reading of those four definitions against §1, filed as a record |
| R-3 | **Concurrent master collision.** 19 keys added since 491, all path-star/finite-block | Very low (my screen: no `E993-R31-` key, no token overlap, no `CB(8`/`16m+4` in any new statement) | Re-freeze the master at the terminal close and re-run the screen over key names, aliases and statements |
| R-4 | **A registered note resting on scratch nobody in the registration chain ran.** The Tier 1 status-map note cites "compiled iff lemmas" kernel-checked only in critic/adjudicator scratch; SR-C3-3 was forbidden Lean and read the compile logs; F-7 narrowed the claim (Out-`≥` forms compiled forward only); F-9 read Cycle 2 U2's `weightedHall_of_ratFlow_bound` only as reproduced | Low (the note labels them ungraded scratch and changes no grade; I confirmed the Cycle 2 declaration exists at line 2598 of the frozen file) | When N8 is carried, the terminal award compiles exactly one interface copy under receipt, and the note is superseded by the award's clause |
| R-5 | **The E1 graph lift (N1) does not compile by Cycle 5.** No fragment after three cycles; single Sonnet owner in the plan | Medium — the main schedule risk | Dual ownership in Cycle 4 (above); if N1 is not compiled at the Cycle 4 close, the Cycle 5 gate names the terminal as unreachable and the run plans its ceiling close |
| R-6 | **A per-target failure of the actual composed flow at a class row** (the one adversarial check never run; F adjudicator: "still owed") | Low (the composition is `proved_informal` with concordant reads; sampled loads at 107/149/155/200 are `≤ 0.998γ`), but this is the only place a cut could still hide | F2's mandatory Cycle 4 object through the proved orbit quotient at 158/161/164, every target class, plus mixed-`X` Hall sums |
| R-7 | **Elaboration budgets.** C2-LA1 uses unbounded `maxHeartbeats 0` ×21 and `maxRecDepth 20000`, not surfaced in its fidelity review | Very low for soundness (the kernel check is unaffected; this is elaboration cost), low for reproducibility | Record an options census on every award face (Process quality 10); replay C2-LA1's build once with the bound measured |
| R-8 | **Effort provenance.** Chartered "high" seats ran at an unrecorded session effort | Medium for the audit trail; nil for kernel-checked results | Record the session effort from the Cycle 4 gate onward; disclose the gap in the terminal review |
| R-9 | **Reserved-name drift.** C-U3-F's (B)–(D) reference entry 607 by the reserved name; U3's merge (the recommended carry base) contains 607 | Low (SR-C3-3 F-8 named the fix: drop 607 and re-point to `AdjU.cb8_topRank_of_flow`) | The Cycle 4 U3 freeze-readiness project greps 0 occurrences before any Stage 7 |
| R-10 | **The superseded Tier 1 sentence** read in isolation at publication | Low | Terminal reconciliation places the status map first on the public face |
| R-11 | **Gate text vs contract.** Sealed gate rulings 15 and 22 state the wrong plateau rule (R31-E-g) | Nil for outcomes (no cycle was a plateau under either reading) | The Cycle 4 gate restates §5 verbatim |

Nothing in the sealed record threatens a registered grade. The risks that matter are schedule (R-5) and the one unrun adversarial
check (R-6).

## Recommendation

**Continue.** Reasons: (i) no decisive event and no plateau under §5; (ii) the mathematics is complete informally at every node and
confirmed by isolated reads, so the remaining work is engineering with one combinatorial node; (iii) seven governed awards in three
cycles show the Stage 7 pipeline closes whatever has compiled scratch; (iv) the ceiling allows decisive event (a) with one cycle of
slack if Cycle 4 is designed around the critical path. "Narrow" is not applicable: the Tier 1 target is already as narrow as the
charter allows (one rank, one residue class, one `d`), and no cutoff `M_0` has been needed anywhere. "Stop" is not warranted: the
run is not stalled, only slower in formal yield than Cycles 1–2.

**The three highest-value Cycle 4 actions.**

1. **Freeze the leaves and dual-own the critical node.** At the Cycle 4 gate, freeze tool-digested Lean statement texts for B1–B3,
   the unconditional E1 spec, the `g_sec` Out/In/A2/zero-class specs and the composition theorem (not only `g_sec`); assign B1–B3 to
   both T1 and U1 with different decompositions; rule explicitly that the composition award (N7) is a legitimate §2 intermediate
   award, distinct from the struck reductions.
2. **Close the sector half and the weight formula as governed awards in Cycle 4** (N3 + N6, N5 if it compiles), carrying the Cycle
   2 U2 `chokeState`/`sector_out_ge_one` scratch and the C-T3-U uniqueness lemmas as re-authored drafts; pre-generate Stage 7 briefs
   for two awards. This converts the run's largest pool of compiled-but-ungraded scratch into carriable receipts and leaves Cycles 5–6
   for the E1 flow, the composition and the terminal.
3. **Run the owed adversary.** F2 evaluates the actual composed flow per target at fresh rows `158`, `164` and the structural row
   `161` (first class row with `x < p* − 2`) through the proved orbit quotient, with (WID) from independent sides and Hall sums at
   structured `X` mixing `Sec` with `q ≥ 2` sources; a pass removes the last place a cut could hide, a failure is decisive event (b).

Alongside, adopt the process changes 1–10 above in the Cycle 4 worker brief and gate (index cited textually; two named instruments
per number; digest literals checked at admission; `compiled` needs a log; §4 grade sentence verbatim; restricted-boot clause first;
`pid-check` helper; session effort recorded; brief generation from the gate file; options census at Stage 7).

**What the controller should ask Ashton at the terminal close** (or earlier where marked).
- (Now, if possible.) Whether Claude Opus 5.5 may be seated on the two critical-path U routes (the E1 spec discharge and the
  composition) for Cycles 4–6, given that the decisive compiled Lean of Cycles 2–3 came from Opus critics; the charter fixes Sonnet 5
  for routes and only Ashton can vary it.
- Whether a seventh cycle is acceptable if, at the Cycle 6 checkpoint, only the terminal stitching (N8 over closed N2–N7) remains.
- If the terminal does not close by the ceiling: the publication scope — whether the r31 formal awards (seven now; more by then) and
  the `proved_informal` Tier 1 are published additively as the run's result, with the terminal named as open.
- Confirmation that a closed terminal award lifts the existing Tier 1 key's grade to `formally_verified` (the key already exists in
  the `E993-R31-` namespace) rather than registering a second key.
- Whether to record the numeric session effort retroactively for Cycles 1–3 from the host's logs, so that the "chartered high"
  disclosures can be audited.

## Artifact inventory

Scratch root `scratchpad/c3-checkpoint/` (all Python standard library, `python3 -B`, exact integers, foreground; every command's
script text was inline and is not preserved beyond these outputs):

| Path (run-root relative) | SHA-256 | Role |
|---|---|---|
| `scratchpad/c3-checkpoint/member-verify.txt` | see below | seal recomputation and the 231-member byte/SHA-256 check (0 missing, 0 mismatch, 10,300,070 bytes) |
| `scratchpad/c3-checkpoint/registry-r31-audit.txt` | see below | the six `E993-R31-` keys and seven touched keys at the Cycle 3 close: grades, tags, the superseded sentence |
| `scratchpad/c3-checkpoint/master510-screen.txt` | see below | concurrent master-510 versus master-491 and the r31 keys: 19 new keys, 0 collisions |
| `scratchpad/c3-checkpoint/second-read-hash-crosscheck.txt` | see below | 16/16 second-read files match their agents records; the seven award `Main.lean` digests; C3-LA1 report digest |
| `scratchpad/c3-checkpoint/c3la1-terminal-compare.txt` | see below | byte-equality of C3-LA1's terminal with the frozen synthesis text; marker and declaration counts |
| `control/CHECKPOINT-ANALYSIS-C3.md` | this file | the deliverable |

SHA-256 values of the scratch files are appended in the final block below (computed by tool after the files were closed).

Commands not preserved as files: the seven-file hygiene scan (`grep -c` for `sorry`, `admit`, `native_decide`, `decide`, `axiom`,
`set_option`, the reserved name; `set_option` census), the `shasum -a 256` of the brief and of C1-LA1's `Main.lean`, the `grep`
extractions of return disclosure lines and gate lines, the U1 header excerpt, and the Cycle 2 U2 scratch `grep`. Each is
reproducible from the named capsule members with the standard tools.

No `lake`/`lean` was run. No background job was started. I reread this file before close.

chartered fable/high; transport-resolved model fable (explicit parameter); runtime-reported model id: claude-fable-5-1

### Scratch digests (tool-computed)

| File | SHA-256 |
|---|---|
| `scratchpad/c3-checkpoint/member-verify.txt` | `4ec9f60c63d644b781cb27f1b6b473d929e1298ae5103c9d4a2f2184db5dfdb6` |
| `scratchpad/c3-checkpoint/registry-r31-audit.txt` | `26a10518d515cb3df7f14c83f40a9eeb4138b1535d475740e6498bdaf88c7a4e` |
| `scratchpad/c3-checkpoint/master510-screen.txt` | `033ba0e4ce58b8f407aec3e8c1577e8241ceebe334a4b4e8e79263f2209be30a` |
| `scratchpad/c3-checkpoint/second-read-hash-crosscheck.txt` | `890db85bf77f255af7c5b9ca3ba0f43a9fb5f28a14079e4799bd852141b8c1c1` |
| `scratchpad/c3-checkpoint/c3la1-terminal-compare.txt` | `2a33641474cac21630975a9115019a2fb12f9652b0cfa2e287007c4474d200fe` |
