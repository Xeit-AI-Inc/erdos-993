# Orientation Adjudication

**Orientation U (formal / structural), r31 Cycle 4 Stage 5.** Adjudicator: Claude Opus 5.5, chartered high. Written
2026-09-29 (host clock 00:49 EDT at the start of the write).

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot acknowledgment.** I am operating within VerityOS. This was a restricted boot. I read exactly
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then my dispatch
`control/dispatch/c4-stage5/DISPATCH-ADJ-U.md`. Before reading the dispatch I recomputed its SHA-256 with `shasum -a 256`:
`b4cb41dee69a0915832f00d3ecdb7105a7b43ed5f26f48622c353741cc68bfd1`, which matches the value given at invocation. I loaded no
other VerityOS subsystem: no memory, knowledge, conversations, operations, modules, skills, logs or decisions. The host placed the
project `CLAUDE.md`, the user's auto-memory index and the user's e-mail into my context before the first tool call. I did not open,
cite or act on any of them. The dispatch's restricted boot and single write location take precedence over them.

**Gate lines (ruling 32; the controller's invocation applies ruling 32's `FROZEN_NODES_CLOSED` line to this adjudication):**

- `COND4_formal`: no. Conjunct 4 is not closed. In my merged U-orientation build, conjunct 4 (through N7 and N8) depends on exactly
  7 frozen declarations, all still `sorry`-bodied: N1's B1 and B2, and five sector declarations from N3, N4 and N5.
- `E1_formal`: no. N2 compiles modulo exactly N1's B1 and B2. N1's `cbOpenChokeCount_le` and B3 compile sorry-free. B1 and B2 are
  open in this portfolio.
- `TERMINAL_integration`: conditional. The §2 terminal shape follows sorry-free from N7's conclusion alone; two critics built it
  independently. In my merged build, the U3 stitch's residual `sorry` set is exactly the 7 frozen declarations above.
- `cut_candidate`: none.
- `FROZEN_NODES_CLOSED: N6, N7, N8`. N7 comes in two parts: its companion was closed by U2, and its main declaration by the critics
  C-U2-F and C-U2-T. Every attribution is on the face below.

FROZEN_NODES_CLOSED: N6, N7, N8

## Identity and seal audit

- **Capsule seal:** `control/c4-adjudicator-capsules/U-PACKET-MANIFEST.json`. I recomputed SHA-256 over its canonical JSON without
  `seal_sha256` (sort_keys, separators `(",", ":")`, no trailing newline): **`699b9c0b12a696c0fd0ac84ff58dfd682e47b13a73432eded76977f1d1782157`**.
  This matches the stored value and the dispatch's value. All **22** listed files match on both SHA-256 and byte count (0 bad;
  `scratchpad/c4-adj-U/seal_check.py`).
- **Packet manifests** (`scratchpad/c4-adj-U/manifest_seals.py`):
  - Stage 2 `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`: matches; `file_count` = `len(files)` = 6084.
  - Stage 3 `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e`: matches; 42 members, all match.
  - Stage 4 `6f34313fe49b2a1de2d9739ac165ec90f40db4d35861ef49e8119b2488eda0ee`: matches; 66 members, all match.
- **Returns** (digests equal the capsule and `C4-STAGE3-ADMISSION.json`):
  - U1 `7699954403899c8ee0a6053d6f8e866d5629e5b87f22e2c5e398c869dd48210e`
  - U2 `9fa4815d9a0eb261378c60039737e28e55e08ad14a34c5778bb6efd2702c74cb`
  - U3 `9c8e8e47810e982dd468e0f0674273ca48d435d8650697344085d700d0f5828c`

  Each return carries its route ID (`C4-U-01/02/03`) and mechanism token verbatim, as `control/C4-ALLOCATION.md` requires.
- **Critiques** (digests equal the capsule and `C4-STAGE4-ADMISSION.json`; all six verdicts are `retained_narrowed`):
  - C-U1-F `4513d05a…`, C-U1-T `c20803da…`
  - C-U2-F `d6fb8de9…`, C-U2-T `47c39cc1…`
  - C-U3-F `f3bf43b6…`, C-U3-T `680b5665…`
- **Seat and critic Lean artifacts, recomputed on disk.** Every digest cited in the returns and critiques that I used matches:
  - U1 `Statements.lean` `75388bec…`
  - U2 `2c1ee236…`
  - C-U2-F `5392e82d…`
  - C-U2-T `476c192f…`
  - U3 `Statements.lean` `1c059d5a…`, `U3Interface.lean` `5dc45063…`, `U3Stitch.lean` `2fc9b64d…`, root `LeanProof.lean` `751aae32…`
  - `CritU1F.lean` `459e9f67…`, `CritU1FAudit.lean` `524515b6…`
  - `CritU1T.lean` `2118f35a…`
  - `CritU3F.lean` `7a57cdcc…`, `CritU3T.lean` `c2c9344e…`
  - `n7proof.lean` `f82a32c7…`

  The four carried base files (`Main` `385af1bf…`, `ChokeState` `64a101ef…`, `E1FlowConstruction` `d26e702b…`, `C3LA1` `49b227d3…`)
  are byte-identical to `sources/c4-base` in every project I used.
- **Admission defects.** `FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN` was raised on U1, U2 and U3. Each pair of critics adjudicated it as
  a negation or a citation of a governed award, not a self-label on scratch. I concur, and nothing is struck on this ground. U2's
  `BAD_HEADLINE_FLAG` is a format exception only; its value is `no`.
- **Controller facts** (`control/C4-STAGE5-CONTROLLER-FACTS-U.json`, `fbba210f…`) are read as facts, never as authority. Every U-side
  closure they list is backed by my replays below. They also list closures of N1, N3, N4 and N5 by T-orientation seats and critics.
  Those artifacts are outside my capsule; I did not read or replay them, and nothing here rests on them.

## Route-by-route decisions

**U1 — `C4-U-01`, `E1-UPCOVER-COUNTS-VIA-ADJACENCY-AND-SPEC-DISCHARGE` (owned: N1 dual, N2). Decision: retained, narrowed; verdict
`compiled`, confirmed.**

- **Retained (replayed).** `cbOpenChokeCount_le` and `cb8N_sum_eq_cb8R`, with the helper `cb8N_eq_e1S_natCast`, compile sorry-free on
  the Cycle 4 base (with the disclosed `import LeanProof.C3LA1`). Axioms are `[propext, Classical.choice, Quot.sound]`. My rebuild of
  U1's exact file reproduces the shipped axiom log byte-for-byte (`971854618981b9a280b3cbedcde9bc33f515edde7c2f48cc8292c4acb68fefcc`).
  Clauses (2) and (5) of N2 are discharged inside the frozen statement by `cb8E1Arc_shape`, `cb8E1Arc_zero_of_root_mem` and
  `cb8E1Arc_zero_of_no_open_choke`. Those are ungraded, sorry-free base scratch in `E1FlowConstruction.lean`.
- **Narrowed or struck** (both critics agree unless noted):
  - "transport *definitionally*" is struck. The bridges need `1 ≤ j`.
  - "`ℓ = j − α` holds *exactly*" holds only for `w ≥ 1`.
  - The clause-(3) "iff … exactly `e1_rows_identity`" is struck. It omits `cb8N ≠ 0`, the `ℓ = 0` saturation case (`e1_saturation`),
    and the degenerate sources.
  - "a complete, checkable reduction of every open clause" is narrowed. Clause (4) omitted the `w_A = 0` target case (C-U1-T).
  - Clause (1)'s stated N1 dependency is struck as unnecessary (resolved below).
  - "machine-verified" is narrowed to compiled scratch, ungraded.
  - The B3 sketch's use of N6 is an avoidable cross-node dependency (C-U1-F A5). Nothing compiled uses it.
- **B3 forecast.** "B3 … reduction is exact and short" had no artifact on U1's face. C-U1-T's strike stands as a certification ruling
  on the return. The mathematics is now established, but it is attributed to C-U1-F (below), not to U1.
- **Gate line** `FROZEN_NODES_CLOSED: none` is correct for the return as shipped.

**U2 — `C4-U-02`, `WEIGHT-FORMULA-AND-PER-CLASS-COMPOSITION` (owned: N6, N7). Decision: retained, narrowed; verdict `compiled`, confirmed.**

- **Retained (replayed).** N6 `cb8_activeWeight_leafSet_eq` and the N7 companion `cb8Rho_one_eq_cb8R1_ratio` compile sorry-free on
  the base. Their axioms are the three standard ones. My rebuild of U2's exact file reproduces the shipped `work/axioms.log`
  byte-for-byte (`7c6b671fd8b2e65e30c7d63214fcd02609ae0e47edaef7f03d2f871c91ce19e4`). The sorry warnings are 18 in total: N1–N5,
  N7 main and N8.
- **Narrowed or struck** (both critics agree):
  - The informal N7 clauses (3)–(4) are struck as "complete". The "every other `A`" branch never bounds the E1 load `ρ_q·w(A)` on
    `r`-free targets with `q ≥ 2`, or with `q = 1 ∧ v ∉ A`. That bound needs `cb8Rho_lt_one_topRank` and `q ≤ m`. The branch also
    omits the C2-LA3 bridge `favorableLeaves = leafSet`. C-U2-T adds that the `r ∈ A ∧ v ∉ A` target is not treated explicitly.
  - "no case is assumed vacuous without a cited hypothesis" is struck.
  - "clauses (1)–(2) … kernel-checkable in isolation" was unbacked as shipped. It is now superseded, because N7 main is sorry-free.
  - "`bounded_evidence`" is struck as a grade token.
  - "20 rows" is corrected to **25**.
  - `run2.out.json` carries two plain-text trailer lines, so it is not valid JSON on its own. This is cosmetic.
- **Gate line** `FROZEN_NODES_CLOSED: N6, N7-companion` is correct for the return as shipped.

**U3 — `C4-U-03`, `HALL-TO-FLOW-INTERFACE-AND-TERMINAL-STITCH` (owned: N8, stitching project). Decision: retained, narrowed; verdict
`compiled`, confirmed.**

- **Retained (replayed).** N8 `cb8_conjunct4_of_flowBundle` compiles sorry-free against the frozen text. Its axioms are the three
  standard ones, and the walker finds 0 direct `sorryAx` users in its closure of 9,826 constants.
- **The r30 carries.** Entries 30–31 (`card_sigma_fiber_filter`, `exists_saturatingFlow_of_weightedHall`) are byte-identical to r30
  C1-LA2's Snippets 0030 `e8c6b0d1…` and 0031 `ec521065…`. Both critics bind them to that award's receipt: kernel receipt `dc1371a0…`
  over source `7c279f4b…`, with entry 31 in the terminal's cone.
- **Part A.** `weightedHall_of_ratFlow_bound` and `exists_saturatingFlow_of_ratFlow_bound` equal Cycle 2 U2 `Main.lean` lines
  2593–2669 (`a03e15f3…`), apart from their docstrings. This is the single interface copy ruling 24(3) allows.
- **The stitch.** `cb8_topRank_stitch_scratch_c4u3` is the §2 terminal body under a non-reserved name. Its kernel-enumerated residual
  set, on U3's own file, is exactly 8 frozen declarations:
  - N2 `cb8E1Arc_spec_topRank`;
  - N3 `cb8GSec_nonneg_and_support` and `cb8GSec_out_ge_one`;
  - N4 `cb8GSec_in_le_one` and `cb8GSec_zero_classes`;
  - N5 `cb8GSec_switchImage_inflow`;
  - N6 `cb8_activeWeight_leafSet_eq`;
  - N7 `cb8_flowBundle_of_arcSpecs`.
- **Narrowed or struck:**
  - "residual `sorry` set of exactly the still-open frozen nodes" and "N2–N7" are narrowed to those 8 declarations. The return's
    own line-level trace names the right eight.
  - `TERMINAL_integration: CONFIRMED` is narrowed to conditional.
  - The timing literal "35.47s …" is struck as unbacked by the shipped log.
  - "C2-LA1's terminal" is corrected to C2-LA1's ungraded face companion, entry 580 (`AdjU.cb8_topRank_of_flow`).
  - The attribution of `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR` to r30 C1-LA2 is struck
    (resolved below).
  - "byte-for-byte the hypothesis tuple of the GENERIC lemma" is narrowed to definitional equality after instantiation.
  - The "intact and unchanged since pre-interruption" wording is contradicted by the `U3Stitch.lean` mtime (resolved below).
- **Hygiene.** The reserved name `cb8_topRank_eligible_and_weightedHall` occurs once, in a comment in `U3Stitch.lean` (0
  declarations). Two comments are wrong: N8's in-body comment names the wrong file for Part A, and a comment cites a non-existent
  `print_axioms.sh`.
- **Gate line** `FROZEN_NODES_CLOSED: N8` is correct.

## Cross-route reconciliation

**Paired-critic disagreements, resolved claim by claim.** I never averaged verdicts. Where a replay exists, I weighed it over
self-reports.

1. **Does N2 clause (1) need N1?**
   - C-U1-T compiled clause (1) with B1's fourth conjunct as its only open input (`critU1T_N2_clause1`).
   - C-U1-F compiled clause (1) with **no** N1 input (`crit_cb8E1Arc_spec_clause1`). Its argument: when `α > a`, or when `α > j`,
     `cb8N`'s own guard vanishes, so the value is 0. Otherwise `e1G_nonneg`/`e1H_nonneg` apply, given only `1 ≤ p* − q ≤ 8m+1`, and
     that follows from `cbOpenChokeCount_le`.
   - **Replay:** my walker finds sorry leaves `[]` for C-U1-F's clause (1) (`replays/audit-CritU1F.log`), and
     `[cb8_rFree_deletionClasses]` for C-U1-T's clauses (1) and (3) (`replays/axioms-CritU1T.log`).
   - **Ruling:** both proofs are correct. The dependency is a property of the proof, not of the statement, and C-U1-F's proof is
     strictly stronger. Clause (1) needs no N1 input. U1's "N1's own bound" citation for it is struck as unnecessary, not false.
2. **Status of N2.**
   - C-U1-T: open in clause (4) plus N1.
   - C-U1-F: complete modulo exactly B1 and B2 (`crit_cb8E1Arc_spec_topRank_modN1`, clauses (1)–(5)).
   - **Replay:** leaves exactly `[cb8_rFree_deletionClasses, cb8_rFree_insertionClasses]`. Its elaborated type is `==`
     `cb8E1Arc_spec_topRank` (structural `Expr` equality, `true`).
   - I also transplanted the proof into the frozen body (merged build, below). There the frozen `cb8E1Arc_spec_topRank` itself has
     sorry leaves exactly {B1, B2}.
   - **Ruling:** C-U1-F's result supersedes. N2 is complete modulo B1 and B2 (critic-attributed, C-U1-F).
3. **B3.**
   - C-U1-T struck U1's "exact and short" as a forecast with no artifact.
   - C-U1-F proved B3 outright (`crit_cb8_nonChokeInsert_weight`: leaves `[]`, standard axioms, type `==` the frozen B3).
   - **Ruling:** both stand at their own level. The strike is correct as a certification ruling on U1's face. The theorem is now
     established and attributed to C-U1-F.
4. **N2 clause (4).**
   - C-U1-F: "no error surfaced".
   - C-U1-T: the sketch omits the `w_A = 0` target case.
   - These do not conflict. C-U1-T identifies a gap in U1's prose. C-U1-F's compiled clause (4) covers the case (value 0 through
     `crit_cb8E1G_zero`).
   - **Ruling:** the sketch was incomplete; the mathematics is sound; the compiled proof is critic-attributed.
5. **C3-LA1 entries 33/37 cited as "formally verified" in U2.**
   - C-U2-F narrowed this: a non-terminal entry carries no certificate of its own.
   - C-U2-T accepted it as "governed … at their own scopes".
   - **My check of the base copy:** entry 53, C3-LA1's terminal `cb8_E1_cloneTransport_topRank`, uses entries 37 and 33 inside its
     proof (`C3LA1.lean` lines 792–795).
   - **Ruling:** C-U2-F is right on the label (SOLUTION-CONTRACT §4: no certificate of its own). The entries are, however,
     kernel-checked in the cone of the governed terminal, and so receipt-bound through it. This is the same standard C-U3-T applied
     to r30's entries 30–31. The correct citation is "in the cone of the C3-LA1 award's terminal (entry 53); no certificate of its
     own."
6. **The `γ ∈ {0, 8}` boundary in N7.**
   - C-U2-F: `γ = 0` uses the junk value `cb8CGamma 0 = 0`, consistently.
   - C-U2-T: its proof avoids the junk value (`w = 0` by N6, then `hZero.2`).
   - Both compiled, and both agree that the junk value is load-bearing in **N5**'s text at `γ = 0`, not in N7's.
   - **Ruling:** N7 is sound either way. The N5 flag is forwarded (next-route item 1).
7. **Orbit-quotient key attribution (U3).**
   - C-U3-F struck U3's attribution to r30 C1-LA2 (F-4). C-U3-T did not examine it.
   - **Replay:** I read the record in `sources/authority/CLAIM-IDENTITY.json`. It gives `registration_reason: "r30 Cycle 3 award C3-LA1"`
     and `certificate: runs/lean-2026-09-27-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall/`.
   - **Ruling:** F-4 stands. The carry of entries 30–31 does not touch that key.
8. **The `U3Stitch.lean` mtime.**
   - C-U3-F: it contradicts U3's "intact and unchanged since pre-interruption" (F-6).
   - C-U3-T: the mtimes "fit the narrative".
   - **Replay (`stat`):** `Statements.lean` 08:50:35, `U3Interface.lean` 08:50:32, `U3Stitch.lean` **09:53:22**, root 08:50:41.
     The interruption was about 08:55 and the resumption about 09:50.
   - **Ruling:** F-6 stands. The file was written after resumption, so the return's wording is inaccurate. It is immaterial to the
     mathematics, because the built file is the file the logs describe.
9. **The entry-580 attribution (U3).**
   - C-U3-T corrected "C2-LA1's terminal" to entry 580. C-U3-F did not flag it.
   - **My check:** entry 580 is marked `lemma`. C2-LA1's terminal is entry 582 (`lemma-carried-terminal`), whose body does not use
     entry 580.
   - **Ruling:** C-U3-T's correction stands. Entry 580 is ungraded and must be carried from C2-LA1's governed Snippets or
     re-authored on the award's face.
10. **The residual set (U3).** Both critics sharpen it to the same 8 declarations. C-U3-F calls this "confirmed, sharpened";
    C-U3-T calls it "narrowed". The content is identical, and my replay of both walkers gives the same 8.

**Cross-route composition (adjudicator build; ungraded scratch).** The allocation designed N2 → N7 ← N6 → N8 → terminal as one DAG
across U1, U2 and U3, and the controller facts record that no merged build exists. I built the U-orientation merge.
- **Method.** I started from the frozen text (`sources/c4-base/.../Statements.lean`, `0fc723d7…`) and applied, as diffs:
  - U1's hunks;
  - C-U2-F's file (U2 plus C-U2-F's N7 main);
  - U3's N8 body, plus the `U3Interface` import.

  I then transplanted C-U1-F's helper text verbatim. `crit_cb_tagWitness_root_or_choke` goes before B3, and B3's `sorry` is replaced
  by C-U1-F's proof. The §1–4 and §5 helpers go before N2, and N2's body is replaced by C-U1-F's `exact ⟨…⟩` assembly.
- **Result.** `scratchpad/c4-adj-U/merge/merged.lean` (`ae2a38863f05067ab1e8c249a47ba01149e4b0f080619c80e02021f8592d2356`, 1,321
  lines). `lake build LeanProof` exits 0 (8663 jobs), with **12** `declaration uses sorry` warnings: B1, B2, N3 ×5, N4 ×3, N5 ×2.
- **Fidelity.**
  - All 21 frozen headers (keyword through `:=`) occur byte-identically, exactly once. `cb8GSec`'s full body is byte-identical.
  - There are 0 `native_decide`, `admit` or `set_option` tokens, and the reserved name occurs 0 times (`sigcheck.py`).
  - The structural type hashes of all 21 frozen declarations, and `cb8GSec`'s value hash, are identical between the merged
    environment and the untouched base environment (`hash-merged.txt` = `hash-frozen.txt` = `9d429a8f…`).
- **Kernel audit** (`audit-merged-final.log`, `0d27d0f8…`; my own walker `AdjUWalk.lean`):
  - **Sorry leaves `[]`, standard axioms:** `cbOpenChokeCount_le`, `cb8_nonChokeInsert_weight` (B3), `cb8N_sum_eq_cb8R`, N6, the
    N7 companion, N7 main and N8.
  - **`cb8E1Arc_spec_topRank` (N2):** sorry leaves exactly `[cb8_rFree_deletionClasses, cb8_rFree_insertionClasses]`.
  - **The stitch `cb8_topRank_stitch_scratch_c4u3`** (closure 18,836) has sorry leaves exactly **7**:
    - `cb8_rFree_deletionClasses` and `cb8_rFree_insertionClasses` (N1 B1, B2);
    - `cb8GSec_nonneg_and_support` and `cb8GSec_out_ge_one` (N3);
    - `cb8GSec_in_le_one` and `cb8GSec_zero_classes` (N4);
    - `cb8GSec_switchImage_inflow` (N5).
- **Consequence.** Within the U orientation's evidence, the §2 terminal on the class is kernel-reduced to these 7 frozen statements.
  No U-owned node remains open. Everything still open is either N1's B1/B2, which is dual-owned with T1, or the sector nodes N3–N5,
  which are T2/T3's. This is adjudicator scratch. It carries no grade, and it is not a Stage 7 artifact.

## Established results

All results below are **compiled scratch, ungraded** (SOLUTION-CONTRACT §4). No `formally_verified` label attaches until a governed
Stage 7 award closes. Every one sits on the Cycle 4 base (`sources/c4-base`, ruling 25) and was replayed by me from the controller
cache (CF-C4-S3-1). None uses Newton, Darroch, an asymptotic step, a census or the `θ*` law.

**Exact theorems (frozen text; sorry-free; axioms `propext, Classical.choice, Quot.sound`):**
- **N6 `cb8_activeWeight_leafSet_eq`.**
  - Hypothesis: `0 < m`. It is load-bearing: C-U2-T shows the formula fails at `m = 0`.
  - Scope: every finset `B` of `CB(8,m)`, for every `m ≥ 1`. It is a graph identity with no rank and no (HALL) content.
  - Origin: U2 (Claude Sonnet 5). Independent fidelity instrument: C-U2-F derived the leaves, supports and witnesses from the tree
    and agreed with entries 60/69/70 (`m = 1` exhaustive, 2^20 subsets; sampled at `m = 2, 107, 158, 161, 164`).
- **N7 companion `cb8Rho_one_eq_cb8R1_ratio`.**
  - Hypotheses: `107 ≤ m`, `m % 3 = 2` (C3-LA1 entry 37 needs only `1 ≤ m`).
  - Index of record: `j = p* − 1`, `K = (16m+1)/3 = p* − 1`.
  - Origin: U2.
- **N7 main `cb8_flowBundle_of_arcSpecs`.**
  - Hypotheses: the class, plus the frozen per-arc specs `hE1` (N2's conclusion), `hSec`/`hOut` (N3), `hIn`/`hZero` (N4), `hSw` (N5)
    and `hW` (N6).
  - Conditional by design (ruling 26). It asserts no flow and no (HALL).
  - **Critic-attributed:** two independent proofs, C-U2-F (`5392e82d…`) and C-U2-T (`476c192f…`). Both replayed: axioms standard,
    shipped C-U2-F axiom digest `4f865de1…` reproduced.
  - It consumes C1-LA1's terminal (entry 111: Switch (iv), Residual (v)), C2-LA3's terminal (entry 606), the companion,
    `cbGraph_adj_r_choke` (entry 40) and `cb8Rho_lt_one_topRank` (base scratch, ungoverned) at `q = 1` and at `q = cbOpenChokeCount`.
- **N8 `cb8_conjunct4_of_flowBundle`.**
  - No class hypotheses (ruling 24(7)).
  - Origin: U3. A second, independent proof is critic-attributed to C-U3-T; it does not use Part A, and its type is `rfl`-equal to
    U3's.
- **N1 companion `cbOpenChokeCount_le`** and **N2 companion `cb8N_sum_eq_cb8R`** (with helper `cb8N_eq_e1S_natCast`). Origin: U1.
  No class hypotheses.
- **N1 (B3) `cb8_nonChokeInsert_weight`.** Hypothesis `0 < m`. **Critic-attributed to C-U1-F**, as `crit_cb8_nonChokeInsert_weight`.
  It is transplanted into the frozen body in my merge, with leaves `[]`.

**Conditional reductions (compiled; the open inputs named exactly):**
- **N2 `cb8E1Arc_spec_topRank` ⇐ {B1, B2}.** Critic-attributed to C-U1-F. It uses C3-LA1 entries 30, 31, 33, 41, 44, 49, 50 and 51,
  C2-LA3, `cbOpenChokeCount_le` and U1's bridge. Clauses (2) and (5) come from U1 and base scratch.
- **The §2 terminal body ⇐ N7's conclusion.**
  - C-U3-F `crit_u3f_terminal_of_bundle` (closure 16,508; 0 sorry users).
  - C-U3-T `CritU3T.crit_terminal_of_flowBundle` (cone 16,522; 0 sorry users).
  - Both replayed, both critic-attributed. Each is `AdjU.cb8_topRank_of_flow ∘ N8`, through C1-LA2 entry 78 and C2-LA1 entries 579
    and 580.
- **The §2 terminal ⇐ the 7 frozen declarations** listed under Cross-route reconciliation. This is the adjudicator's merged build.

**Bounded computations (discovery and test only; fence 7).**
- **Replayed byte-identically by me:**
  - C-U2-T's `crit_n6_n7.py`: output `a43ad5ba…`. It reproduces the CB(8,95)/508 fixed point exactly: `p* = 508`, the `ρ_1` of
    record, `θ = 96/604265`, `σ(1..3)`, and the ratio 508/507. At `m = 107` its margin is
    `5777869414876808819/165550964075383936` ≈ 34.90. At rows 107, 158, 161 and 164 it confirms:
    - `ρ_1 = cb8R1` ratio;
    - `ρ_q < 1` for every `q` in `[1, m]`;
    - `θ ≤ 1 − ρ_1`;
    - `ρ_1γ + (8−γ)σ(γ) ≤ γ` for `γ = 0..8`, with slack exactly 0 at `γ = 0` only.
  - C-U1-T's `e1_literal_check.py`: output `d29f98e0…`. It checks N2's clauses on the literal `cbGraph 1` (33,573 independent sets)
    with `F = leafSet` imposed. The only failures are the 8 row failures at `j = 0`, outside the class domain `1 ≤ j`. This shows
    the guard `1 ≤ j` is load-bearing.
- **Seat instruments, replayed by the critics (not by me):**
  - U1 companion identity: 1215/1215.
  - U2's N6: 1,058,596 checks; companion at 25 rows.
- Attained horizons: exhaustive at `m = 1`; sampled at `m = 2, 3, 107, 158, 161, 164`.
- None of this is offered as proof. Every universal claim above rests on the Lean kernel.

**Imported results at their grades (carried, never re-graded):**
- `formally_verified` at their exact scopes: C1-LA1 (entry 111), C1-LA2 (entries 33, 34, 40, 60, 69, 70, 78), C1-LA3, C2-LA1
  (entry 579 in its terminal cone), C2-LA3 (entry 606), and C3-LA1 (terminal entry 53; entries 30–51 in its cone).
- r30 C1-LA2 entries 30–31: receipt-bound.
- Ungraded scratch, which enters the frozen vocabulary itself (ruling 24(1)):
  - `E1FlowConstruction.lean` (Cycle 3 U2): `cb8Rho_lt_one_topRank`, `cb8R_natCast_eq_coeff`, `cbOpenChokeCount_insert_of_not_choke`,
    `cb8E1Arc_shape` and `cb8E1Arc_zero_*`;
  - `ChokeState.lean` (Cycle 2 U2 Part B);
  - Part A;
  - C2-LA1 entry 580.

**Record corrections** (from the reconciliation above):
- U2's companion row count: 20 → 25.
- The orbit-quotient key: r30 C3-LA1, not C1-LA2.
- "C2-LA1's terminal" → entry 580, which is ungraded.
- The U3 timing literal is struck.
- The `U3Stitch.lean` write time is 09:53.
- The C3-LA1 entry 33/37 citation reads "in the terminal's cone; no certificate of its own".
- U1's "definitional" bridges carry `1 ≤ j`.

## Rejected and narrowed mechanisms

- **No mechanism in this portfolio is refuted.** No frozen statement is found false. No template failure is presented, and no cut is
  claimed (orientation U does not search for one).
- **Struck informal steps** are listed under the Route-by-route decisions: U1's clause-(1), (3) and (4) reductions as written; U2's
  "complete" N7 derivation; U3's residual-set summary. Each is superseded by a compiled proof, not left as a gap.
- **The fidelity-first checks hold within the U portfolio (protocol check 3):**
  - **Weight:** re-derived from the tree (C-U2-F), and it agrees.
  - **Relation:** `transportRel` and the other r30 network definitions (Snippets 0014–0021) occur byte-identically, exactly once, in
    the base (C-U3-F, C-U3-T).
  - **Selector:** derived, and bridged to `leafSet` only through C2-LA3.
  - **`x` through `α`:** carried (C2-LA1), not touched here.
  - **`supply − capacity = S`:** asserted by no U return and not tested here. It is owed by F2's end-to-end composed-flow check. My
    orientation does not supply it.
  - **Newton and Darroch:** not used anywhere.
- **Fences hold:**
  - One rank `p*`, the class only.
  - N6, N8, B3 and the companions are generic in `m` and assert no (HALL).
  - No status transfer: (HALL), the primary aggregate, TREE, FOREST, TRANSFER and #993 stay OPEN.
  - The `θ*` law is never used.
  - No refuted mechanism is revived. N7 and N8 are the ruling-26 compositions, not the struck R-9/R-10 reductions.
- **Instrument fragility (a process finding from my own replay).** On my first replay, C-U3-F's `#crit_sorry_users` walker reported
  "closure size 1; 0 users" for the stitch. My project's root `LeanProof.lean` was the base's and did not import `U3Stitch`, so the
  name did not resolve, and the walker failed silently with a false-clean answer. With U3's root in place, the replay reproduces
  C-U3-F's 16,519 and 8 users exactly. The walker has no name-resolution control. C-U3-T's walker uses positive and negative
  controls. Any walker cited at Stage 7 must fail loudly on an unresolved name, or carry a positive control.

## Lean readiness

Ruled per protocol check 6: (a) a complete informal proof at statement granularity with a closed dependency DAG; (b) compiled
fragments covering the named nodes sorry-free; (c) the named open nodes. "Scratch" below always means ungraded (SOLUTION-CONTRACT §4).

**Group U-A — N6, the weight formula. CONTRACT-READY.**
- **Statement:** the frozen `E993Transport.cb8_activeWeight_leafSet_eq` (base `Statements.lean` line 251; type hash 2823501877):
  `∀ m, 0 < m → ∀ B, activeWeight (cbGraph m) (C5LA1.leafSet (cbGraph m)) B = (if cbVertex m 2 ∈ B ∧ cbVertex m 0 ∈ B then 1 else 0) + ∑ i ∈ range m, if cbVertex m (3+17i) ∈ B then chokeGamma m B i else 0`.
- **Readiness:** (a) yes (U2 Steps 1–2, confirmed by both critics); (b) yes (U2 scratch `2c1ee236…`; replayed); (c) none.
- **Fences:** a graph identity for `m ≥ 1`. No rank, no (HALL) and no class claim.
- **Carries:** C1-LA2 entries 33 (`cbVertex_val`), 34 (`eq_cbVertex_iff`), 60 (`mem_leafSet_cbGraph_iff`) and 69/70 (the tag
  witnesses), from the governed runs (ruling 19). `chokeGamma` comes from `ChokeState.lean`, which is frozen vocabulary.
- **New declarations:** none beyond the proof body.

**Group U-B — N7, the companion and main, the per-class composition. CONTRACT-READY as a conditional award (ruling 26).**
- **Statements:**
  - the frozen `cb8Rho_one_eq_cb8R1_ratio` (line 263; hash 681709603);
  - the frozen `cb8_flowBundle_of_arcSpecs` (line 277; hash 1442608358). Its hypotheses are the N2–N6 conclusions byte-for-byte, and
    its conclusion is N8's `hbundle`.
- **Readiness:** (a) yes. The derivations of both critics are complete, and C-U2-F's case list covers the case U2 omitted.
  (b) yes: two independent sorry-free proofs, both replayed. (c) none within the group.
- **Attribution:** the companion to U2; N7 main to the critics C-U2-F and C-U2-T. The panel should pick one proof text and cite the
  other as the second instrument. C-U2-F's is at `scratchpad/c4-crit-U2-F/work/n7proof.lean` `f82a32c7…`.
- **Fences:** the class and `p*` only. It is conditional: it transfers nothing until N2–N5 close.
- **Carries:**
  - C1-LA1 entry 111 (with definitions 82 `cb8CGamma` and 86 `cb8Sigma`);
  - C2-LA3 entry 606;
  - C3-LA1 entries 33 and 37 (in the cone of entry 53);
  - C1-LA2 entry 40.
- **Ungoverned inputs, which must be authored on the award's face:** `cb8Rho_lt_one_topRank` and `cb8R_natCast_eq_coeff`
  (`E1FlowConstruction.lean`).
- **File layout:** the proof needs `import LeanProof.C3LA1`. That is a disclosed divergence of the file, not of any statement
  (elaborated types are unchanged: C-U1-F's `pp.all` dump and my hash check).

**Group U-C — N8, bundle ⇒ conjunct 4. CONTRACT-READY.**
- **Statement:** the frozen `cb8_conjunct4_of_flowBundle` (line 344; hash 50965226).
- **Readiness:** (a) yes; (b) yes: U3, plus C-U3-T's independent proof, both replayed; (c) none.
- **Fences:** no class hypotheses. It asserts no (HALL) by itself.
- **Carries:** r30 C1-LA2 entries 30–31 (Snippets 0030 `e8c6b0d1…`, 0031 `ec521065…`; receipt `dc1371a0…` over source `7c279f4b…`).
- **New declarations:** Part A, `weightedHall_of_ratFlow_bound` and `exists_saturatingFlow_of_ratFlow_bound`, as face text (no
  governed source).
- **Layout:** `import LeanProof.U3Interface`, or the carries placed on the face.
- **Packaging hygiene:** remove the reserved-name comment from `U3Stitch.lean` and fix the two wrong comments.

**Recommended award shape.** Ruling 31 allows at most two awards, chosen across orientations. From U, the strongest single
candidate is the conjunction **U-A ∧ U-B ∧ U-C**: N6, both N7 declarations, and N8. It closes the whole composition tail of the DAG,
so conjunct 4 then follows from the N2–N5 conclusions alone. If the synthesis prefers a smaller unconditional award, U-A alone
(N6) is ready and unconditional. Ruling 31 already names it.

**Not ready:**
- **N2 `cb8E1Arc_spec_topRank`, and therefore the E1 half.** (a) complete modulo B1 and B2. (b) compiled modulo exactly B1 and B2
  (the transplant is in my merge). (c) open: **B1 `cb8_rFree_deletionClasses`** (five conjuncts) and **B2
  `cb8_rFree_insertionClasses`** (three conjuncts). B1 is the smaller lemma. It is the single open input of clauses (1)
  (C-U1-T's proof) and (3), and U1 has written its adjacency case analysis informally.

  If B1 and B2 close on the frozen text, from T1's side or U1's, then N1 and N2 are ready at once, with C-U1-F's proofs after an
  isolated second read. The controller facts report such closures by the T1 critics; I have not seen them.
- **The terminal.** In the U merge its residual is exactly the 7 frozen declarations above. It is not ready.
- **No bounded result qualifies for any group.**

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

**What moved.** At the Cycle 3 close, conjunct 4's formal DAG N1–N8 had no compiled leaf. In this cycle's U portfolio, three frozen
nodes (N6, N7, N8) close sorry-free, along with two companions and N1's B3. N2 is reduced to B1 and B2. The terminal's kernel-level
residual falls from 20 frozen declarations to **7**, none of them U-owned. These are material formal advances on Tier 1, the
formalization of the family theorem. The U-orientation part of each advance was replayed by me.

**Grading notes.**
- Several advances are critic-attributed: N7 main (C-U2-F, C-U2-T), N2 modulo N1 and B3 (C-U1-F), and the conditional terminal
  (C-U3-F, C-U3-T).
- By the stop gate's wording they still count as material progress on Tier 1/2. There is no new `proved_informal` key and no new
  adversarial finding from U. Plateau needs all three to be absent, and material progress is present, so this is not a plateau
  cycle.

**Stop gate.** No decisive event:
- Tier 1 is not `formally_verified`.
- No cut is claimed.
- The ceiling is six cycles; this is Cycle 4.

The checkpoint's forecast, "reachable by Cycle 6 with about one cycle of slack", is supported from the U side. After this cycle the
remaining work is a cross-orientation merge plus B1/B2 and the sector nodes, not new mathematics on the U side.

## Headline assessment

headline_resolved: no
status: still_open

- **Tier 1** (for `m ≥ 107`, `m ≡ 2 (mod 3)`: (E) and (H) at `p*`). It stays **registered at `proved_informal`**, carried from Cycles
  1–3 and unchanged by this cycle.
  - **At my orientation's evidence grade it is `still_open`.** I have not verified a complete informal proof of the full statement
    within this portfolio: the sector nodes N3–N5 and N1's B1/B2 are outside it.
  - Formally, the terminal is kernel-reduced to 7 frozen declarations. It is not proved.
  - No eligible deficient cut has been replayed, so the status is not `refuted`.
- **(L-S)_top.**
  - The template form is `formally_verified` by C1-LA1 (carried).
  - Its literal-network lift is half closed in this portfolio: the per-class composition N7, including the switch-image inequality
    `ρ_1γ + (8−γ)σ(γ) ≤ γ` for every `γ`, compiles sorry-free.
  - The sector per-arc specs N3–N5 are not in this portfolio.
  - At my grade the literal-network (L-S)_top is therefore `still_open`, conditional on N3–N5.
- **(ELIG-top)(a)** (parent descent, and (E) on the literal tree) is `formally_verified` by C1-LA3 and C2-LA1 (carried). My
  orientation does not touch it. The stitch consumes C2-LA1 entry 579, which is sorry-free.
- **Nothing is transferred to (HALL), the primary aggregate or #993.** All stay OPEN.

## Next-route allocation

**The exact remaining obligation for orientation U.** Close the 7 frozen declarations in one merged environment:
- `cb8_rFree_deletionClasses` and `cb8_rFree_insertionClasses` (N1 B1, B2);
- `cb8GSec_nonneg_and_support`, `cb8GSec_out_ge_one`, `cb8GSec_in_le_one`, `cb8GSec_zero_classes` and `cb8GSec_switchImage_inflow`
  (N3/N4/N5, with whatever frozen companions their proofs consume).

Then re-point the stitch at the reserved name inside a governed Stage 7 run. Nothing else stands between the U record and the §2
terminal.

1. **`C5-U-MERGE` — a cross-orientation merged build.**
   - **What.** Start from `scratchpad/c4-adj-U/merge/merged.lean` (`ae2a3886…`). Transplant the B1/B2 proofs and the N3–N5 proofs
     named by the T-side record into the frozen bodies. Rebuild on the base with the controller cache, in the foreground.
   - **Required checks:** byte-compare all 21 headers; type-hash parity against the base; `#print axioms`; a kernel sorry-walk with
     a positive control that must return `[]` for the stitch.
   - **Could close in one cycle:** conjunct 4 and the §2 terminal sorry-free in scratch, the precondition for decisive event (a) at a
     Cycle 5 or 6 Stage 7.
   - **Flag for the N5 panel:** `cb8GSec_switchImage_inflow` at `γ = 0` holds only through `cb8CGamma 0 = 0`.
2. **`C5-U-PACKAGE` — Stage 7 packaging of U-A ∧ U-B ∧ U-C.**
   - **What:**
     - carry the governed Snippets (C1-LA2 entries 33, 34, 40, 60, 69, 70; C1-LA1 entry 111 with 82 and 86; C2-LA3 entry 606;
       C3-LA1 entries 33 and 37; r30 entries 30–31);
     - author on the face the ungoverned `cb8Rho_lt_one_topRank`, `cb8R_natCast_eq_coeff` and Part A;
     - fix the import layout (`C3LA1`, `U3Interface`) so the awarded file differs from the frozen text only in proof bodies;
     - run an isolated second read of the critic-derived N7 main proof text.
   - **Could close:** a governed composition award whose terminals are frozen statements (ruling 31).
3. **`C5-U-E1` — the E1 half, if B1/B2 are not already closed on the T side.**
   - **What:** prove B1, then B2, on the frozen text, by U1's per-vertex adjacency decomposition. That means `cb_val_cases` on each
     `z`, discharged by entries 39–42 and 69/70, then reassembled with `Finset.card` over the three filters. Then run an isolated
     second read of C-U1-F's N2 and B3 proofs.
   - **Could close:** N1 (all four) and N2 sorry-free, and with them a Stage 7 E1 award.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-adj-U/`.

- **Seal scripts:** `seal_check.py` `1a58265c…` (capsule seal and 22 digests) and `manifest_seals.py` `9c9d5a24…` (Stage 2/3/4 seals
  and members).
- **`LeanProject/`**, built as follows:
  - the shell and `LeanProof/*.lean` were copied from `sources/c4-base/LeanProject`, byte-identical;
  - `.lake/packages` is a manual symlink to the pinned shared Mathlib project (v4.32.2, `905b9581…`);
  - `.lake/build` and `.lake/config` were copied from the controller cache `scratchpad/c4-base/LeanProject/.lake/`, after I checked
    that its five `.lean` files equal `sources/c4-base`. I never used `--no-cache`, `lake update` or `lake clean`.
- **The final project state:**
  - `LeanProof/Statements.lean` = `merge/merged.lean`;
  - the root `LeanProof.lean` = U3's (`751aae32…`);
  - `LeanProof/{U3Interface,U3Stitch}.lean` are U3's.
  - The replay copies `CritU1F`, `CritU1FAudit`, `CritU1T`, `CritU1TAx2`, `CritU3F`, `CritU3T` and `AxiomCheckU1` remain in
    `LeanProof/`. They are not buildable against the merged file (duplicate `crit_` names) and are not part of it.
- **Adjudicator Lean files:**
  - `LeanProof/AdjUWalk.lean` `e35fdf04…`: the sorry-leaf walker;
  - `LeanProof/AdjUAudit.lean` `e5579657…`: axioms, sorry leaves and type hashes on the merge;
  - `LeanProof/AdjUHashProbe.lean` `c91d284b…`.
- **Merge inputs and output:** `merge/frozen.lean` (the frozen text), `merge/u1.diff`, `merge/u2f.diff`, `merge/u3.diff`, and
  `merge/merged.lean` `ae2a38863f05067ab1e8c249a47ba01149e4b0f080619c80e02021f8592d2356`.
- **Build and audit logs:**
  - `build-base-adj.log`: the base, exit 0, 20 sorry warnings;
  - `build-merged.log` `2222e176…` and `build-merged-3.log` `9443ad8a…`: exit 0, 12 sorry warnings;
  - `audit-merged-final.log` `0d27d0f8…`;
  - `hash-merged.txt` = `hash-frozen.txt` `9d429a8f…`;
  - `build-frozen-swap.log`;
  - `sigcheck.py` `af5c0c1a…`.
- **Replay logs:**
  - `replays/axioms-u1-replay.log` `97185461…` (= U1's shipped log);
  - `replays/axioms-u2-replay.log` `7c6b671f…` (= U2's shipped log);
  - `replays/axioms-c4-crit-U2-F.log` = `replays/axioms-c4-crit-U2-T.log` `4f865de1…` (= C-U2-F's shipped log);
  - `replays/audit-CritU1F.log` `eb323de0…`;
  - `replays/axioms-CritU1T.log` `af08a873…`. Its first attempt errored on a missing `CritU1FAudit.olean` and was rerun with my own
    walker; both appear in the log.
  - `replays/build-U3-crits.log` `462efeaa…`. It contains the first, false-clean CritU3F run, taken under the wrong root.
  - `replays/build-CritU3F-rootfix.log` `99a9dfa3…` (the correct run);
  - `replays/build-U1-crits.log`, `build-U1-exact.log`, `build-U2-exact.log`, `build-c4-crit-U2-F.log`, `build-c4-crit-U2-T.log`;
  - `replays/AxU2.lean`, `replays/AxU1T.lean`.
- **Python replays, copy-out-first** (`py/`):
  - `crit_n6_n7.py` (C-U2-T's, `50e65ecf…`) produces `crit_n6_n7.out.json` `a43ad5ba…`, byte-identical to the shipped output;
  - `e1_literal_check.py` (C-U1-T's, `9740cb86…`) produces `e1_literal_check.out.json` `d29f98e0…`, byte-identical to the shipped
    output.
- **Replay commands:**
  - `cd <root>/scratchpad/c4-adj-U/LeanProject && lake build LeanProof && lake env lean LeanProof/AdjUAudit.lean`
  - `cd <root>/scratchpad/c4-adj-U/py && python3 -B crit_n6_n7.py && python3 -B e1_literal_check.py`
- **Background jobs:** none. Every build, `lake env lean` and Python run went in the foreground, so nothing was left to kill before
  this write.

**Read-boundary disclosures.**
1. `control/C4-STAGE3-CONTROLLER-FACTS.json` (`f267c0e1…`) is not a capsule member. I read it because the controller's invocation
   directed me to copy the base cache "per" that file. It is a controller fact, not evidence.
2. `control/C4-FROZEN-STATEMENTS.lean` is a Stage 2 member, not a capsule member. I hashed it (`0fc723d7…`), diffed against it and
   printed its header. It is byte-identical to the authorized `sources/c4-base/LeanProject/LeanProof/Statements.lean`, which I then
   used for every check.
3. I made a targeted Python lookup of one key in `sources/authority/CLAIM-IDENTITY.json`, which lies under the authorized `sources/`.
4. I used the controller cache directory `scratchpad/c4-base/LeanProject/` (`ls`, `du`, `cmp` of its five `.lean` files, and a copy
   of `.lake/build` and `.lake/config`).
5. I made non-recursive `ls` listings of the named seat and critic scratch directories (`c4-U1`, `c4-U2`, `c4-U3`, and
   `c4-crit-U{1,2,3}-{F,T}`) and their `LeanProof/` subdirectories. `ls cycles/cycle-4/stage5/adjudicators` showed a sibling directory
   name, `F`. I opened nothing in it. I did not read `scratchpad/c4-U1-replay/` or `scratchpad/c4-U2-replay/`.
6. I used `grep` and `sed` on single named files under `sources/c4-base` (entry markers) and on files in my own scratch.
7. I ran no `find`, `rg`, recursive `grep` or `ls -R` rooted above my grant. There was no network access, no package install and no
   process listing.
