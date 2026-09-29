# Orientation Adjudication

Isolated Stage 5 adjudicator, orientation U (formal / structural), Cycle 3 of r31 (Erdős #993; a parameter-uniform switch-using Hall
certificate on CB(8,m) at the top sector-deficient rank `p* = (16m+4)/3`). Portfolio: returns U1 (`C3-U-01`,
`FORMAL-CB-SECTOR-FLOW-LITERAL-BRIDGES`), U2 (`C3-U-02`, `FORMAL-CB-E1-DELETION-FLOW-CONSTRUCTION`), U3 (`C3-U-03`,
`FORMAL-CB8-TERMINAL-INTEGRATION`) and the six critiques C-U1-T, C-U1-F, C-U2-T, C-U2-F, C-U3-T, C-U3-F.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (the first 150 lines of the protocol: the boot sequence and steps 1–7).
I read no other VerityOS file. The host put the project `CLAUDE.md`, the user auto-memory index and the user's e-mail into my
context before my first action; I did not open them and did not act on them beyond the boot the dispatch authorizes. I created no
conversation log: the dispatch confines my writes to this file and `scratchpad/c3-adj-U/`.

## Identity and seal audit

- **Dispatch** `control/dispatch/c3-stage5/DISPATCH-ADJ-U.md`: SHA-256 recomputed
  `3c7584b1e5c470a47e090f8384cedef6e1ac8502682030ef335d5f0b49a0df67`. **Match.**
- **Capsule seal** `control/c3-adjudicator-capsules/U-PACKET-MANIFEST.json`, recomputed over the canonical JSON without
  `seal_sha256` (sort_keys, separators `(",",":")`, no trailing newline):
  **`c32606dda733f320787f7f6d710fbe5e1704f35c0a420f48ad27f7f5dfb96cfa`**. **Match.** All 24 listed files match their recorded
  bytes and SHA-256 (the three returns, six critiques, contracts, protocol, allocation, Stage 1 gate, the Stage 2/3/4 manifests, both
  admission reports, both read-boundary-disclosure indexes, `PATH-CHECK-U.json` (0 findings), `C3-STAGE5-CONTROLLER-FACTS-U.json`,
  `sources/SOURCE-DIGESTS.json`).
- **Stage manifests (self-seals recomputed):** Stage 2 `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3` (5049
  files), Stage 3 `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d` (41 files; binds U1/U2/U3 `RETURN.md` at the
  capsule's digests and `DISPATCH-U1/2/3.md`), Stage 4 packet `a940eb85c4b829c017b154ce6d72acc2346b66d3cb7c1aad3438500798e87d4e` (67
  files; binds all six U critiques at the capsule's digests). The critics' cited "Stage 4 dispatch manifest" seal `cc9683b5…c05` is a
  different (dispatch) manifest, not in my capsule; not re-audited.
- **Admission:** Stage 3 `admit` (9/9; format-only exceptions for U2's two flags and U3's headline flag, which I accept: each return
  states `headline_resolved: no` once, unambiguously). Stage 4 `admit` (18/18; every U critique `retained_narrowed`, `headline_resolved:
  no`).
- **Controller facts** `C3-STAGE5-CONTROLLER-FACTS-U.json` read as facts, never authority. CF3-U-3 (ruling R31-N-22: the name
  `cb8_topRank_eligible_and_weightedHall` is reserved for the UNCONDITIONAL Tier 1 theorem) bears directly on U3 (below). CF3-U-1/2 are
  cross-orientation STATED items; I did not read the T/F portfolios and rely on none of them as evidence.
- **Scratch digests reproduced on my copy-outs:** U1 `Main.lean` `4a3f435d…71a2`; U2 `Main.lean` `7fbf0531…9df`,
  `E1FlowConstruction.lean` `54e011f2…7c84`, `u2_rho1_fixedpoint.py` result digest `cc9a82ec…bcfa5`; U3 merged `Main.lean`
  `88ccaaa4db42ee8fc87b4b30b0b18e78f46c63530eab24339bd59ade9b186a25`; critic files C-U1-T `Critic.lean` `396315cc…af6f`,
  `Merge.lean` `14e39b7a…41b3`; C-U1-F `CriticF.lean` `ede05a53…7840`; C-U2-T `CriticU2T.lean` `17a8d4c5…c913`; C-U2-F
  `CriticU2F.lean` `41bdeac6…96c6`; C-U3-T `CriticU3T.lean` `c9783d27…03d3`; C-U3-F `Critic.lean` `59423e3c…80b9`. All equal the
  values the returns and critiques state.
- **Precedent checked in `sources/`** (a Stage 2 member, `sources/c2-stage7-sources/U2/LeanProject/LeanProof/Main.lean`,
  `a03e15f3…1d2c`, manifest match, 0 `sorry`): `weightedHall_of_ratFlow_bound` (line 2598), `exists_saturatingFlow_of_ratFlow_bound`
  (2659), `chokeBeta_add_chokeGamma_le` (2697), `chokeState` (2729), `sector_out_ge_one` (2934). This is the Cycle 2 U2 scratch both U1
  critics cite; it exists as they say.

**Read-boundary and process disclosures (this adjudicator).**
1. One unfiltered `pgrep -fl "lake|lean"` (run to check for stray jobs before I launched any) printed a sibling adjudicator's command
   line (a `scratchpad/c3-adj-T/…` path and the names of four Lean files it was compiling). I opened nothing there and used nothing from
   it; every later process check was by literal PID (`kill -0`).
2. Non-recursive `ls` of my granted scratch directories (`scratchpad/c3-U1..3/`, `scratchpad/c3-crit-U*-*/` and their `LeanProject/`
   subdirectories) to locate the inventoried files for copy-out. No `find`, `grep -r`, `rg` or `ls -R` rooted anywhere; every `grep` named
   single files inside my scratch or the one `sources/` file above.
3. I did not read `scratchpad/c3-U1-replay/`, `c3-U2-replay/`, `c3-U3-replay/` (outside the inventoried seat directories), any T/F return,
   critique or adjudication, prior syntheses, other experiment roots, or any network resource. No package install; no `lake update` or
   `lake clean`; `.lake/packages` bound by manual symlink to the pinned shared project; every `lake`/`lean` call ran after `cd` into a
   pinned copy.
4. My own first instrument run reported spurious (P) failures from an instrument-scope error of mine (I counted as "no preimage
   expected" targets that legitimately receive the `u = s` switch from sector sources); corrected before use, both runs kept.
5. Before the final write, one non-recursive `ls` of `cycles/cycle-3/stage5/adjudicators/` (to create my output directory) displayed the
   names of the sibling directories `F` and `T`. I opened neither.

## Route-by-route decisions

### U1 — `C3-U-01` `FORMAL-CB-SECTOR-FLOW-LITERAL-BRIDGES` (Sonnet 5)

**Replays.** My copy-out rebuild: `lake build LeanProof` succeeds (8657 jobs, 2 `unusedVariables` warnings, `hm`, `hmod`). Through
the critics' files compiled in my copy, `#print axioms` on all five U1 declarations and on the carried
`exists_saturatingFlow_of_weightedHall` gives `[propext, Classical.choice, Quot.sound]`; no `sorry`/`admit`/`native_decide`/`axiom`.

**Claim-by-claim resolution of the paired critics.**
1. *`weightedHall_of_ratFlow` (generic rational flow ⇒ `WeightedHall`).* Both critics: correct, but a special case of Cycle 2 U2's
   `weightedHall_of_ratFlow_bound` (Out-`≥`, layer sums, support without layer membership), which the allocation named as the object to
   wire in ("U2 Part A"). I confirmed the precedent in `sources/` and replayed C-U1-F's `critic_U1_ratFlow_is_special_case_of_U2` and
   C-U1-T's `ratHall_ge` / `weightedHall_of_ratFlow'` (both kernel-clean). **Ruling: retained as correct compiled scratch; novelty
   struck; "the rational-to-integral step is CLOSED, generically, by this file" struck.** The equality-form Out is the weaker shape; any
   award carries the Out-`≥` form.
2. *"Conjunct 4 reduced to exactly one hypothesis" (COND4 gate line).* Both critics proved in Lean that U1's hypothesis bundle is
   logically equivalent to conjunct 4 (C-U1-T `ratFlow_iff_saturatingFlow`, generic; C-U1-F `critic_cb8_ratFlow_iff_conjunct4`, at
   `cbGraph m`); I replayed both. **Ruling: `COND4_formal: not_advanced` for U1.** The rational form is a useful interface, not a
   reduction of difficulty.
3. *`cb8_topRank_eligible_and_weightedHall_of_ratFlow` "conditional on `g` alone".* Both critics: the theorem also takes `hE`. **Struck**
   as worded ("conditional on `hE` and `g`").
4. *TERMINAL gate line — the paired critics disagree.* C-U1-T: `advanced`, but only through its own CA-2 (`Merge.lean`,
   `cb8_topRank_of_ratFlow`, `hE` discharged from C2-LA1, Out-`≥`); C-U1-F: `not_advanced`. The terminal-from-conjunct-4 step without
   `hE` was already in the governed C2-LA1 award (face companion `AdjU.cb8_topRank_of_flow`, entry 547 of C2-LA1 / 580 of U3's merge;
   see U3). **Ruling: U1's own contribution does not advance TERMINAL_integration (C-U1-F upheld on the return); C-U1-T's CA-2 is a
   genuine critic-attributed interface advance** — the §2 body from a nonnegative rational `g` with Out-`≥`/In-`≤` at the derived
   selector and no `hE` — replayed by me: C-U1-T's `Merge.lean` (`14e39b7a…41b3`, C2-LA1 prefix + r30 entries 30–31 + the theorem) compiles with `lake env lean`, exit 0, 0 errors (inherited warnings only), `#print axioms cb8_topRank_of_ratFlow` = `[propext, Classical.choice, Quot.sound]` (`u1/merge.log`).
5. *`cb8ChokeState_le`.* Both critics: alias of Cycle 2 U2's `chokeBeta_add_chokeGamma_le` (identical filters). Confirmed by reading the
   precedent. **Novelty struck; retained as a correct re-derivation.**
6. *`cb8_switch_preimage_count` "literal 8 − γ preimage count".* Both critics: a `Fin 8` complement identity, no graph content.
   **"Literal" struck.** The literal statement is C-U1-F's STATED A2 (below).
7. *Fabricated certification literal.* Both critics: `Main.lean` line 12 gives the C1-LA1 digest as `f0578ed7ce7f51f6cf3a03e1…a3b4`;
   the true digest is `f0578ed7ce7f51f695d410cdbd1265d7071d40f40832635ed12d3dade6c9b78e` (I re-verified the frozen source). **Struck**
   (a false certification literal in a comment; no proof depends on it; must not survive into any carried file).
8. *Carries and ruling 19.* Both critics: 113/113 entries byte-identical; the origin terminals kept as `theorem` (no `theorem → lemma`
   edit). C-U1-T additionally strikes "C1-LA2 already carries byte-identical definitions" of the r30 entries 14–21 (they are
   code-identical modulo `open scoped Classical` vs `open Classical in` scoping — r30 C1-LA1 "freeze repair 3"); C-U1-F did not test
   this. No disagreement; **C-U1-T's narrowing upheld** (it concerns receipt binding of carried r30 entries 30–31, which in this
   environment are certified only by the fresh kernel check).
9. *Process.* `/tmp` staging writes disclosed; nothing depends on them (the critic's rebuild reproduces `4a3f435d…`).

**Verdict: `retained_narrowed`** (both critics concur). Gate lines as adjudicated: `COND4_formal: not_advanced`; `E1_formal:
not_advanced`; `TERMINAL_integration: not_advanced` (U1's own product); `cut_candidate: none`.

**Critic-derived results on U1's face (critic-attributed; compiled scratch, no grade):** C-U1-T CA-1 (`ratHall_ge`,
`ratFlow_iff_saturatingFlow`), CA-2 (`cb8_topRank_of_ratFlow`), CA-3 (`cb8_switch_transportRel`: with `r, b_ij ∈ B`, no other support
of choke `i` in `B`, `u_i ∉ B`, the (S) arc `B → insert u_i (B \ N(u_i))` holds, `N(u_i) ∩ B = {r, b_ij}`); C-U1-F A1 (the converse
and the iff at `cbGraph m`), **A2 STATED** (literal switch preimage count; see Established results).

### U2 — `C3-U-02` `FORMAL-CB-E1-DELETION-FLOW-CONSTRUCTION` (Sonnet 5)

**Replays.** My copy-out rebuild: `Build completed successfully (8658 jobs)`, **8** `#print axioms` lines, all
`[propext, Classical.choice, Quot.sound]`, **6** warnings (3 unused binders `hm`, `hres`, `hfav`; 3 unused `if_true` simp arguments),
no `sorry`/`admit`/`native_decide`. U2's replay `ρ_1(CB(8,95)) = 1354839571516225/1361543988640524` reproduced (result digest
`cc9a82ec…bcfa5`). C-U2-F's `crit_rows.py` (two independent `r_q` instruments) replayed by me at `m = 107, 125, 128, 140`: 0 negative
`G`/`H`, 0 Out failures, 0 In failures, 0 expansion mismatches, `ρ_q < 1` at every `q`, `j_min = 465, 543, 556, 608` (digest
`225ea9f6…cf08`). C-U2-F's `crit_counts.py` ((B1)–(B3) literal counts) replayed: 0 failures, inner digest `854437d4…a6ce`, equal to the
critic's.

**Claim-by-claim resolution.**
1. *The literal arc function `cb8E1Val`/`cb8E1Arc`.* Both critics: literally SR-C2-2's X-8 (Boolean branch `g_α/N(α,j)`, ternary
   branch `w·h_α/((j−α)N(α,j))`, zero on chokes, `w = 0`, `q = 0`, `r ∈ B`), with `ℓ = j − α`. I read the definition and agree.
   **Retained** (compiled scratch).
2. *Structural clauses.* `cb8E1Arc_shape` (clause 2), `cb8E1Arc_zero_of_root_mem` and `cb8E1Arc_zero_of_no_open_choke` (clause 5),
   `cbOpenChokeCount_insert_of_not_choke`, `cb8N_nonneg`, `exists_erase_of_sdiff_card_one`: both critics correct and non-circular.
   **Retained.**
3. *"The full spec is formal modulo four named hypotheses … isolating precisely what T1/T2 must still supply".* Both critics: `hIn` is
   clause (4) verbatim, `hOut` is clause (3) at `q ≥ 1`; C-U2-F adds that `hVal_nonneg` is clause (1) on its only nonzero branch, while
   C-U2-T says `hVal_nonneg` reduces with no graph content to a pure coefficient statement. These are compatible: both are true
   (`hVal_nonneg` is clause (1) restated AND it is graph-free once unfolded). **Ruling: narrowed — the conditional spec is an assembly;
   the E1 content (Out, In, signs) is assumed, not reduced.**
4. *Attributions of `hOut`/`hIn`.* Both critics: Out needs no double count (telescoping `G_α + H_α = N(α,j)` plus the deletion-class
   count and, at `ℓ = 0`, the expansion); In needs the two binomial fiber identities, the insertion counts and the in-balance, not the
   `ρ_q` bridge. Agreement. **Return's attributions struck.**
5. *`hZeroChoke`.* Both critics discharged it outright and independently (C-U2-T `cb_activeWeight_eq_zero_of_no_open_choke` for every
   `F ⊆ leafSet`, and `cb8_hZeroChoke`; C-U2-F `cb8_activeWeight_eq_zero_of_no_open_choke` at `favorableLeaves … p` for every `p`). Both
   replayed by me, kernel-clean. **Critic-attributed; `hfav` not needed.** The duplicate should be deduplicated at synthesis (either
   version; C-U2-T's is the more general tag-set statement).
6. *`cb8Rho_lt_one_topRank`.* Both critics: correct; a short ratio corollary of formally verified C1-LA3 entry 20 plus `twoBinomCoeff_pos`
   — not "genuine new formal content". **Narrowed.** Useful only at the capacity step, which also needs `cbOpenChokeCount_le` (`q ≤ m`,
   not provided).
7. *The `j = 0` corner.* Both critics, independently (C-U2-T R3, C-U2-F instrument 1 + `diag_outfail.py`): the literal Lean function's
   Out identity fails exactly at sources with `j = p − q = 0` (`r_q(j−1) = 0`, Lean's `x/0 = 0`). At `p*`, `j ≥ p* − m = (13m+4)/3 ≥ 465`,
   so the class is untouched. **Upheld as an adversarial finding on the formal statement shape**: any formal `hOut`/`hIn` must carry
   `q ≤ m < p*` (hence `j ≥ 1`, `r_q(j−1) > 0`) explicitly. Not a cut.
8. *Grades.* U2 labelled compiled declarations `formally_verified`. Both critics: struck (SOLUTION-CONTRACT §4). **Struck** — compiled
   scratch, no grade. Counts corrected: 8 `#print axioms` (not 9), 6 warnings (not 4). The unused `hfav` is substantive (the discharge of
   Out/In will need `F = leafSet`, C-U2-T A3).
9. *E1 mathematics.* C-U2-T grades the unconditional `cb8E1Arc_spec_topRank` `proved_informal` STATED; C-U2-F says the mathematics is
   already `proved_informal` on record via SR-C2-2 and gives an independent single-crossing proof of the signs. Not a real disagreement:
   the E1 criterion flow is registered `proved_informal`; what is new is the claim that THIS literal Lean function (with its `x/0 = 0`
   conventions and guards) satisfies clauses (1), (3), (4) at `p*`. **Ruling:** that claim is STATED at Stage 4 by two independent critics
   with concordant derivations and concordant instruments (and my replays); it needs the isolated second read before registration.
10. *Process.* U2's full `ps aux` listing (disclosed; unused) breaches the worker brief's "never a full process listing" — recorded, not
    struck against the mathematics. Replay outputs placed outside the seat directory (`c3-U2-replay/`): unaudited by both critics and by
    me; the rebuild supersedes them.

**Verdict: `retained_narrowed`** (both critics concur). Gate lines: `COND4_formal: not_advanced`; `E1_formal: advanced` (narrow: the
literal `ℚ` arc function with clauses (2), (5), and — critic-attributed — `hZeroChoke`); `TERMINAL_integration: not_advanced`;
`cut_candidate: none`.

### U3 — `C3-U-03` `FORMAL-CB8-TERMINAL-INTEGRATION` (Sonnet 5)

**Replays.** My copy-out rebuild of U3's merged project (`Main.lean` `88ccaaa4…6a25`): `Build completed successfully (8657 jobs)`, 0 errors, 8 warnings (all in carried content, as U3 and both critics report). `#print axioms` on entries 607 and 608 gives `[propext, Classical.choice, Quot.sound]`, which backs U3's shipped `axioms.log` (`114832d1…9dea`). C-U3-T's `CriticU3T.lean` (with `#print axioms` appended, `AdjU3T.lean`) and C-U3-F's `Critic.lean` both compile, exit 0, every critic declaration axiom-clean, including both critics' `rfl` alias witnesses.

**Claim-by-claim resolution.**
1. *The merged project.* Both critics independently audited 799 fragment occurrences / 606 distinct names / 3 keyword-only collisions /
   0 digest mismatches / 3 ruled `theorem → lemma` edits on origin terminals, and reproduced `88ccaaa4…6a25` by a repointed generator
   replay. My copy-out is byte-identical and builds (8657 jobs, 0 errors). **Retained: genuine integration** — the six governed awards co-elaborate in
   one pinned project with receipt-bound carries. This is the one U3 component that stands for `TERMINAL_integration`.
2. *Entry 607 `cb8_topRank_eligible_and_weightedHall` (terminal with `hH`).* Both critics: kernel-confirmed alias of carried C2-LA1 face
   companion `AdjU.cb8_topRank_of_flow` (merged entry 580), via `example : @cb8_topRank_eligible_and_weightedHall =
   @AdjU.cb8_topRank_of_flow := rfl`. I re-ran that `rfl` in my copy: compiles (exit 0, `AdjU3.lean`), and `#check` prints identical types for the two declarations (`u3/lean.log`). **Struck as a contribution**; "down from two (`hE ∧ hH`)" and
   "not previously stated or carried anywhere in the registry" struck; the mathematical alias check (a) struck (wrong comparison object).
3. *Reserved name.* Both critics, and controller ruling R31-N-22 (CF3-U-3): the name is reserved for the UNCONDITIONAL Tier 1 terminal.
   **Ruling: entry 607 must not be frozen under that name; drop it (the carried `AdjU.cb8_topRank_of_flow` already serves) or rename.**
4. *"Conjunct 4 reduced to the E1 hypothesis alone" (the allocated object).* Both critics: `hH` IS conjunct 4; no reduction to E1 was
   done. My `adjU_terminal_iff_conjunct4` (terminal ⇔ conjunct 4 on the class, from the carried face companion) compiles (exit 0, axiom-clean).
   **Struck; the allocated object is not met.**
5. *Entry 608 `cb8_activeWeight_leafSet_zero_iff`.* Both critics: correct, new at the grain of the frozen sources, `hm : 0 < m` needed;
   semantic checks 0/60,000 (C-U3-T) and 0/160,000 (C-U3-F) mismatches. My own instrument checks the stronger exact weight formula on
   every independent set of CB(2,1), CB(2,2), CB(3,2), CB(8,1): 0 failures. **Retained** (compiled scratch). Fidelity caveat (both
   critics): stated at `C5LA1.leafSet`; its use at `favorableLeaves … p*` goes through C2-LA3 (C-U3-F's (E) does this).
6. *TERMINAL gate line — the paired critics agree on `advanced` but differ on why.* C-U3-T: the merge (F-5) is genuine; C-U3-F: advanced
   only through its critic-derived (C)/(D) and entry 608. **Ruling: `TERMINAL_integration: advanced`, narrowed to (i) the merged
   six-award project (U3) and (ii) entry 608 (U3), plus the critic-attributed interfaces (C-U3-T CA-1/CA-2/CA-3; C-U3-F (B)–(E)). Entry
   607 contributes nothing.**
7. *Proposed keys.* Key 1 (`…-TERMINAL-CONDITIONAL-ON-CONJUNCT-4-ALONE`): an alias of the C2-LA1 face companion and a one-line corollary of
   C2-LA1's conjuncts 1–3; **do not register.** Key 2 (`…-ACTIVEWEIGHT-LEAFSET-ZERO-IFF-…`): may proceed at its exact scope (`leafSet`,
   arbitrary `B`, `0 < m`) after an isolated second read; I recommend it be registered in the stronger exact-weight form if that is
   formalized first (below), to avoid two keys for one fact.
8. *Replay isolation.* C-U3-F F6: U3's generators hard-code `OUT = …/scratchpad/c3-U3`, so "reproduced bit-for-bit in `c3-U3-replay`" is
   not backed by the shipped scripts as written; both critics reproduced the digest with repointed paths. **Narrowed** (the digest
   stands; the independence claim of that replay is unverified). Minor literals struck: "six name-collisions" (three); "lines
   ≈13230–13380" (entry 607 begins at 13202); "SEMANTIC-CONTRACT §5" in 608's comment (the weight-zero clause is §2).
9. *Process.* Disclosed pre-dispatch read of `skills/optimization-loop/skill.md`, one host-scratchpad write deleted before use, one
   `ps aux | grep`. Recorded; nothing depends on them.

**Verdict: `retained_narrowed`** (both critics concur). Gate lines: `COND4_formal: not_advanced`; `E1_formal: not_advanced`;
`TERMINAL_integration: advanced` (narrowed as above); `cut_candidate: none`.

## Cross-route reconciliation

- **One interface, five copies.** The "rational flow ⇒ Hall ⇒ integral saturating flow ⇒ terminal" composition now exists as: Cycle 2 U2
  `weightedHall_of_ratFlow_bound`/`exists_saturatingFlow_of_ratFlow_bound` (Out-`≥`; scratch, precedent); U1 `weightedHall_of_ratFlow`
  (Out-`=`, weaker); C-U1-T `ratHall_ge` + CA-2 `cb8_topRank_of_ratFlow` (Out-`≥`, derived selector, `hE` discharged, on a C2-LA1-prefix
  file); C-U3-T CA-2 `critU3T_cb8_topRank_of_ratFlow_leafSet` (Out-`≥`, tag set `leafSet`, on U3's merge); C-U3-F (C)
  `terminal_of_leafSet_weightedHall` (HALL-COND at `leafSet` ⇒ terminal). All are logically equivalent to conjunct 4 on the class
  (C-U1-T, C-U1-F, C-U3-T CA-1, C-U3-F (B), my `adjU_terminal_iff_conjunct4`). **Reconciled form for any award:** Out-`≥`, In-`≤`,
  `0 ≤ g`, support `¬transportRel ⇒ g = 0`, sums over the layers, tag set either `favorableLeaves (cbGraph m) p*` or (via C2-LA3)
  `leafSet`, built on U3's merged project so that `hE` is discharged by C2-LA1. Exactly one copy should be carried; the others are
  duplicates.
- **Zero-weight facts, three copies.** U3 entry 608 (`leafSet`, arbitrary `B`, iff); C-U2-T / C-U2-F `…_eq_zero_of_no_open_choke` (`r ∉ B`,
  `q = 0` ⇒ weight 0); C-U3-F (E) (608 at the selector of record). They are consistent (608's right side holds when `r ∉ B` and no choke
  is present). One exact weight formula (below) subsumes all three.
- **U1 vs U3 hypotheses** (both U1 critics asked the adjudicator to confirm): U3's `hH` is literally conjunct 4; U1's `g`-bundle is
  equivalent to conjunct 4 (critic iff, replayed). They are interderivable in two lines; neither is a reduction.
- **U2 vs the sector.** U2's spec covers only `r ∉ B` sources. Sector sources (`r, v ∈ B`) are U1/T3's `g_sec`; sources with `r ∈ B, v ∉ B`
  have weight 0 (from 608/exact formula) and need no outflow; the E1 guard gives them 0 (C-U2-F finding 7). The E1 loads on switch
  images are U2's clause (4) at `q = 1` (`ρ_1·γ`); the doubly-fed capacity sum `ρ_1 γ + (8 − γ)σ(γ) ≤ γ` needs A2 plus C1-LA1's
  Switch/Residual — no route owns it yet.
- **Nothing in the U portfolio conflicts with the contracts' fidelity items**: weight, relation, selector are the carried definitions of
  record (entries 14–21, code-identical to r30 modulo the recorded classical-scoping repair); `favorableLeaves` is derived; `x` enters
  only through carried C2-LA1; no Darroch/Newton step appears anywhere in the portfolio; no `θ*` law is used.

## Established results

Grades per SOLUTION-CONTRACT §4. "Compiled" = kernel-checked scratch, sorry-free, axioms `[propext, Classical.choice, Quot.sound]`,
**no grade** until a governed award closes. Every item was replayed by me unless marked otherwise.

**Exact theorems (compiled scratch; hypotheses and scope exact):**
1. *(U3, entry 608)* `cb8_activeWeight_leafSet_zero_iff (m) (hm : 0 < m) (B)`: `activeWeight (cbGraph m) (leafSet (cbGraph m)) B = 0 ↔
   ¬(v ∈ B ∧ r ∈ B) ∧ ∀ i < m, u_i ∈ B → ∀ j < 8, c_ij ∉ B`. Any `m > 0`, arbitrary `B`; rank-free.
2. *(U2)* `cb8E1Val`, `cb8E1Arc` (definitions, faithful to X-8); `cb8E1Arc_shape`, `cb8E1Arc_zero_of_root_mem`,
   `cb8E1Arc_zero_of_no_open_choke`, `cbOpenChokeCount_insert_of_not_choke`, `cb8N_nonneg`; `cb8Rho_lt_one_topRank` (`107 ≤ m`,
   `m % 3 = 2`, `1 ≤ q ≤ m`: `ρ_q < 1` at `p*`; corollary of formally verified C1-LA3 entry 20).
3. *(critic-attributed, C-U2-T and C-U2-F independently)* `hZeroChoke`: `r ∉ B`, `cbOpenChokeCount m B = 0` ⇒ `activeWeight … B = 0`
   (C-U2-T: every `F ⊆ leafSet`, `0 < m`; C-U2-F: `favorableLeaves (cbGraph m) p`, any `p`, `0 < m`); `cb8E1Arc_spec_topRank_of_three_nodes`
   / `…_of_named_nodes_critic` (the five-clause spec from `hVal_nonneg`, `hOut`, `hIn`); *(C-U2-T)* `cb8G_add_cb8H`
   (`G_α + H_α = N(α,j)`) and `cb8_out_algebra` (the Out identity's algebraic core when `S ≠ 0`, `j − α = ℓ ≥ 1`).
4. *(critic-attributed, C-U1-T)* `ratHall_ge` (generic, Out-`≥`); `ratFlow_iff_saturatingFlow` (generic); `cb8_switch_transportRel` (the
   first literal clause of the sector Switch bridge). *(C-U1-F)* `critic_ratFlow_of_saturatingFlow`, `critic_cb8_ratFlow_iff_conjunct4`,
   `critic_U1_ratFlow_is_special_case_of_U2`.
5. *(critic-attributed, C-U1-T CA-2)* `cb8_topRank_of_ratFlow (m) (hm : 107 ≤ m) (hmod : m % 3 = 2) (g) (hnn) (hsupp) (hout : w(B) ≤
   Σ_{A∈I_{p*}} g B A) (hin : Σ_{B∈I_{p*+1}} g B A ≤ w(A))` ⇒ the §2 four-conjunct body, `w = activeWeight (cbGraph m) (favorableLeaves
   (cbGraph m) p*)`. replayed by me: C-U1-T's `Merge.lean` (`14e39b7a…41b3`, C2-LA1 prefix + r30 entries 30–31 + the theorem) compiles with `lake env lean`, exit 0, 0 errors (inherited warnings only), `#print axioms cb8_topRank_of_ratFlow` = `[propext, Classical.choice, Quot.sound]` (`u1/merge.log`). *(C-U3-T)* CA-1 conjunct 4 ⇔ `WeightedHall (cbGraph m) (leafSet (cbGraph m)) p*`; CA-2 the same
   rational interface at `leafSet`; CA-3 weight-zero targets receive 0 in any saturating flow. *(C-U3-F)* (B) terminal ⇔ conjunct 4;
   (C) `WeightedHall … leafSet … p*` ⇒ terminal; (D) integral flow at `leafSet` ⇒ terminal; (E) 608 at `favorableLeaves … p*`.
   All replayed by me on U3's merged project, exit 0, axiom-clean (`u3/lean.log`, `u3/lean_u3t.log`).
6. *(U1)* `weightedHall_of_ratFlow`, `cb8_conjunct4_of_ratFlow`, `cb8_topRank_eligible_and_weightedHall_of_ratFlow`, `cb8ChokeState_le`,
   `cb8_switch_preimage_count` — correct; each is a special case, alias or abstract fact (Route decisions, U1).
7. *(U3, merged project)* the six governed awards C1-LA1..3, C2-LA1..3 compile together (606 carried declarations, receipt-bound).

**Informal results (STATED at Stage 4; each needs the isolated second read before registration):**
- **A2 (C-U1-F) — literal sector-switch preimage count.** For `T = CB(8,m)`, any rank `p`, `F = leafSet`, `A ∈ I_p` with `u_i, v ∈ A`,
  `r, s ∉ A`, no other choke: the sector sources `B ∈ I_{p+1}` (`r, v ∈ B`) with `transportRel B A` are exactly
  `B_j = (A ∖ {u_i}) ∪ {r, b_ij}` for the `8 − γ` legs with `c_ij ∉ A`; `activeWeight(A) = γ`; an `r`-free `A` with two or more chokes
  has no sector preimage. **I re-derived the proof** (deletion impossible since `u_i ∈ A`, `u_i ∉ B`; an (S) step must insert `u_i`;
  `|N(u_i) ∩ B| = 2` with `r ∈ B` forces one support `b_ij`; independence of `B` iff `c_ij ∉ A`; `v`'s witness `r ∉ A`; `c_kl` active iff
  `u_k ∈ A`) and agree. Note for the formalizer: sector sources also have (S) arcs at `u = s` (both `r, v ∈ N(s) ∩ B`) into targets
  containing `s`; they are outside A2's target class and must be given zero flow (the allocation's "`u = s` switch" zero class). Evidence:
  C-U1-F's exhaustive check (CB(8,1), CB(3,2), CB(3,3), CB(4,2): 0 failures) replayed by me; my own instrument (`adj_literal.py`, all
  relation arcs (D) ∪ (S) counted from every sector source, every rank, CB(2,1), CB(2,2), CB(3,2), CB(8,1)): 0 failures on 762 one-choke
  images and 1,762 zero-class targets. Bounded evidence only; the proof is the informal argument.
- **Exact weight formula (C-U3-F, item 3).** `activeWeight (cbGraph m) (leafSet) B = [v ∈ B ∧ r ∈ B] + Σ_{i<m} [u_i ∈ B]·#{j<8 : c_ij ∈ B}`
  for arbitrary `B`, `0 < m`. Immediate from the carried witness facts `W_v = {r}`, `W_{c_ij} = {u_i}` and distinct tags; I agree.
  Evidence: C-U3-F 0/160,000; my instrument 0 failures on every independent set of four small trees. It subsumes 608, both `hZeroChoke`
  versions, "sector members have weight 1" and "switch images have weight γ".
- **E1 at the literal Lean function (C-U2-T, C-U2-F).** `cb8E1Arc` at `p*` with `F = favorableLeaves (cbGraph m) p*` satisfies clauses
  (1), (3), (4) on the class, via (E) `Σ_{α≤a} cb8N a b α k = cb8R a b k`, telescoping, the two binomial fiber identities, the literal
  (B1)–(B3) counts and the (ii-1)/(ii-2) signs (or C-U2-F's single-crossing argument). Two independent critic derivations agree; my
  replays at four class rows (two fresh) and of the literal counts agree. The underlying criterion key is `proved_informal` on record;
  the new content is fidelity of THIS function (guards, `x/0 = 0`, `j ≥ 1`).

**Bounded computations (attained horizons; `bounded_computation`, never proof):** class-row quotient checks of the E1 values at `m ∈ {107,
125, 128, 140}` (my replay) and `m ∈ {95, 107, …, 140}` (critics); literal E1 and (WID) on small `CB(d,m)` at every rank (critics:
45 pairs; my (T) check: every rank of four trees, 0 failures); §5 fixed points reproduced (`CB(8,95)`: `n = 1618`, `α = 856`, `x = 506`;
`CB(8,107)`: `n = 1822`, `α = 964`, `x = 570`; `ρ_1(95)` exact).

**Imported results at their grades (not re-proved, not upgraded):** C1-LA1 (template), C1-LA2 (CB layer; terminal reduction), C1-LA3
(block descent, condition (i) at `p*`), C2-LA1 (tree, **(ELIG-top)(a)** as `i_{p*−1} < i_{p*−2}` of the literal `cbGraph m`, conjunct 2,
low window — its terminal `cb8_topRank_parentDescent_and_conjuncts_1_2_3` read in the merged file, entry 582), C2-LA2, C2-LA3
(`favorableLeaves (cbGraph m) p* = leafSet`): `formally_verified` at their exact scopes. r30 entries 30–31 (Hall ⇒ flow):
`formally_verified` at origin; in the r31 environment re-kernel-checked (classical-scoping difference, C-U1-T). The E1 criterion key
and Tier 1 key: `proved_informal`.

## Rejected and narrowed mechanisms

- **Struck:** U1's "rational-to-integral step CLOSED by this file" (novelty); "conjunct 4 reduced to one hypothesis" (the hypothesis is
  conjunct 4); "conditional on `g` alone"; "literal" on `cb8_switch_preimage_count`; `cb8ChokeState_le` as new; the fabricated C1-LA1
  digest literal in U1's `Main.lean` header; "C1-LA2 already carries byte-identical definitions" (code-identical modulo scoping).
- **Struck:** U2's `formally_verified` grades on compiled scratch; "four named hypotheses isolating what T1/T2 must supply" (three
  restate the conclusion's clauses); `hOut` = T1 node (b); `hIn` = in-balance + `ρ_q` bridge; "genuine new formal content" for
  `cb8Rho_lt_one_topRank`; the counts 9/4 (true: 8/6).
- **Struck:** U3 entry 607 as a contribution (alias of C2-LA1 entry 547 / merged 580); "reduced to the E1 hypothesis alone"; proposed
  key 1; "six name-collisions"; the replay-isolation claim as worded.
- **Template/shape failures (not cuts):** the literal E1 Out identity fails at `j = p − q = 0` (outside the class; any formal statement
  must carry `j ≥ 1`); the equality-form Out interface (U1) forces a per-source rescaling of the C1-LA1 certificate (Out `≥ 1`) and is
  rejected in favour of Out-`≥`.
- **No refuted mechanism revived** (not (G′), not compression, not CHAR, not the `m`-independent per-choke certificate, not forest
  real-rootedness); no Darroch/Newton; no census as proof; no status transfer.
- **Governance hazard (standing ruling):** no declaration named `cb8_topRank_eligible_and_weightedHall` with a hypothesis may exist in any
  project that a Stage 7 award freezes (R31-N-22).

## Lean readiness

Criteria: (a) complete informal proof at statement granularity with a closed DAG; (b) compiled fragments covering the named nodes
sorry-free; (c) named open nodes.

**Group U-W — CB weight classification (READY, contract-ready as a companion node; recommend bundling, not a standalone award).**
- Exact statement (recommended form): `theorem cb_activeWeight_leafSet_eq (m : ℕ) (hm : 0 < m) (B : Finset (Fin (17*m+3))) :
  activeWeight (cbGraph m) (C5LA1.leafSet (cbGraph m)) B = (if cbVertex m 2 ∈ B ∧ cbVertex m 0 ∈ B then 1 else 0) +
  ∑ i ∈ Finset.range m, if cbVertex m (3+17*i) ∈ B then ((Finset.range 8).filter (fun j => cbVertex m (3+17*i+2+2*j) ∈ B)).card
  else 0`, with corollaries 608 and `hZeroChoke`.
- (a) complete (one paragraph from the carried witness facts). (b) 608 and both `hZeroChoke` versions compiled; the exact-formula form is
  NOT yet compiled. (c) open node: the exact formula itself (smallest unproved lemma of the group; a `Finset.card` partition over the
  carried `mem_leafSet_cbGraph_iff`, entries 69–70 and `eq_cbVertex_iff`).
- Carried: C1-LA2 entries 60, 69, 70 (via U3's merge, receipt-bound). New: the formula and its corollaries. Fences: tag set `leafSet`
  (transport to the selector only via C2-LA3); rank-free; `0 < m`; no claim about any flow. Attribution: U3 (608), C-U2-T and C-U2-F
  (`hZeroChoke`), C-U3-F (formula).
- Funding view: a weight classification is not a registered identity, but on its own it is not progress on (L-S)_top either; carry it as
  a companion node of the conjunct-4 award.

**Group U-I — rational-flow interface to the terminal (READY as a statement; not fundable as progress on its own).**
- Exact statement: C-U1-T CA-2 `cb8_topRank_of_ratFlow` as printed under Established results, item 5 (derived selector, Out-`≥`, In-`≤`,
  support `¬transportRel ⇒ 0`, layer sums), or its `leafSet` twin (C-U3-T CA-2). Name must NOT be the reserved terminal name.
- (a) complete. (b) compiled (C-U1-T on a C2-LA1-prefix file replayed by me: C-U1-T's `Merge.lean` (`14e39b7a…41b3`, C2-LA1 prefix + r30 entries 30–31 + the theorem) compiles with `lake env lean`, exit 0, 0 errors (inherited warnings only), `#print axioms cb8_topRank_of_ratFlow` = `[propext, Classical.choice, Quot.sound]` (`u1/merge.log`); C-U3-T on U3's merge All replayed by me on U3's merged project, exit 0, axiom-clean (`u3/lean.log`, `u3/lean_u3t.log`).). (c) none.
- Carried: C2-LA1 (terminal, receipt-bound), C1-LA2 entry 78, r30 C1-LA2 entries 30–31 (byte-identical from `Snippets/`); new:
  `ratHall_ge` and the composition. Fences: equivalent to conjunct 4 (critic iff lemmas), so it is an interface, not progress on
  (L-S)_top or (ELIG-top)(a) (SOLUTION-CONTRACT §2). **Ruling:** carry it as the composition companion of the terminal award in the cycle
  where the flow closes; do not fund it alone.

**Group U-E1 — the E1 flow over `cbGraph m` (NOT READY).**
- Target statement: `cb8E1Arc_spec_topRank m hm hres` = U2's five-clause conclusion with no hypothesis beyond the class (as printed in
  `E1FlowConstruction.lean`, lines 263–286, with `hfav` replaced by C2-LA3).
- (a) complete informally (SR-C2-2 D1–D6 on record; two concordant Stage 4 re-derivations; STATED at the literal-function grain).
  (b) compiled: definitions, clause (2), clause (5), the `q = 0` halves of (1)/(3), `hZeroChoke` (critic), `cb8G_add_cb8H`,
  `cb8_out_algebra` (critic). (c) open nodes, in dependency order: **(E) expansion `Σ_{α ≤ a} cb8N a b α k = cb8R a b k` (smallest
  unproved lemma; pure coefficient identity, the binomial theorem on `(1+X)^a(1+2X)^b`)**; (A) `H_j = 0` and the two fiber identities
  and `G_{α+1} + H_α = ρ·N(α,j−1)`; (N) signs `G_α, H_α ≥ 0` (graph-free after C-U2-T's reduction); (B1) deletion-class count, (B2)
  insertion-class count, (B3) invariance of `q`, `w` under non-choke insertion (the literal-to-quotient bridge; no route owns it); the
  `j ≥ 1` guard (`q ≤ m < p*`) and the ℕ/ℤ cast seam of `j` (C-U2-T A6).
- Fences: one rank `p*`, class only; `F` the derived selector; no Darroch/Newton (signs use binomial log-concavity via carried C1-LA3
  `twoBinomCoeffZ_strongLC` or the single-crossing argument).

**Group U-S — the literal sector flow `g_sec` and its bridges (NOT READY).**
- Target: `g_sec : Finset V → Finset V → ℚ` on literal pairs from C1-LA1's `cb8Pb`, `cb8Pc`, `cb8Sigma`, read through Cycle 2 U2's
  `chokeState : Fin m → State8` (do not create a fourth copy); Out bridge `Σ_A g_sec(B,A) = Σ_i cb8Out (state_i B)` with target
  distinctness across `(i, j, kind)` (then Cycle 2 U2's `sector_out_ge_one` finishes Out); In bridge with every zero class (`u = s`
  switch, `(1,0)` switch, non-sector `r`-sources); the literal preimage count A2; the doubly-fed capacity `ρ_1 γ + (8 − γ)σ(γ) ≤ γ` from
  C1-LA1's Switch/Residual.
- (a) complete informally at the orientation's grain only for A2 (STATED) and the capacity arithmetic; the arc table is on record in
  other orientations (not in my portfolio). (b) compiled: CA-3 `cb8_switch_transportRel` (critic), the choke-state layer (Cycle 2 U2
  scratch). (c) open: **the Out bridge with target distinctness (smallest unproved lemma of this group)**, the In bridge, A2 in Lean,
  the doubly-fed capacity sum.

**Group U-T — the Tier 1 terminal (NOT READY).** Conjunct 4 is open formally; everything else is formally verified (C2-LA1, C2-LA3 via
the merge). Ready the moment U-E1 and U-S close: `g := cb8E1Arc … + g_sec`, discharged through Group U-I, then the terminal under the
reserved name with no hypothesis beyond `107 ≤ m`, `m % 3 = 2`. **No award group in orientation U is contract-ready as a Tier 1/Tier 2
award this cycle.** A bounded result never qualifies, and none is offered.

**Carry hygiene for any Stage 7 adoption:** carry from U3's merged project (receipt-bound, three ruled keyword edits); drop entry 607;
apply `theorem → lemma` to every carried origin terminal (U1's and U2's files do not); never carry U1's header comment; carry the
Out-`≥` interface once.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

- **Tier 1 / Tier 2 at the formal level.** Tier 1 is `proved_informal` on record (Cycle 2 close) and formally conditional on conjunct 4
  alone (already so at C2-LA1). This cycle the U orientation moved the conjunct-4 DAG by compiled nodes, not by closing a lemma: the
  literal `ℚ` E1 arc function (faithful to X-8) with clauses (2) and (5); the formal `hZeroChoke` (critic-attributed, twice); the
  zero-weight classification (608); the first literal sector Switch arc clause (CA-3, critic); the rational interface to the terminal with
  `hE` discharged (critic); and the first co-elaboration of all six governed awards in one project. None closes (L-S)_top's literal
  bridge or the E1 Out/In/sign content; I grade the progress **material but narrow**, and I note that most of it is critic-attributed or
  structural.
- **New `proved_informal` candidates (STATED):** A2 (literal switch preimage count) and the exact weight formula — both new at the
  literal-network grain, both re-derived by me; plus the E1 literal-function fidelity claim.
- **New adversarial findings:** the `j = 0` Out failure of the literal Lean function (shape constraint for the formal statement); the
  reserved-name freeze hazard; three alias findings (U1 ↔ Cycle 2 U2 Part A and chokeBeta; U3 607 ↔ C2-LA1 entry 547).
- **Stop gate.** No decisive event: Tier 1 is not `formally_verified` (conjunct 4 open) and no cut exists (`cut_candidate: none` on every
  U return and critique). The plateau test (no material progress, no new `proved_informal` lemma, no new adversarial finding) is not met
  for this orientation.

## Headline assessment

headline_resolved: no
status: still_open

- **Tier 1** (`m ≥ 107`, `m ≡ 2 (mod 3)`, (E) ∧ (H) at `p*`): `still_open` at this orientation's evidence grade. I have verified no
  complete informal proof of the full statement from my portfolio (the sector arc table and the (L-S)_top literal bridge are outside it);
  the registry's `proved_informal` grade (Cycle 2 close) stands unchanged and is neither upgraded nor challenged here. Formally: (E) is
  `formally_verified` (C2-LA1); (H) is open in Lean (conjunct 4).
- **(ELIG-top)(a)**: `formally_verified` at full class scope, as a conjunct of the carried C2-LA1 terminal (`i_{p*−1}(cbGraph m) <
  i_{p*−2}(cbGraph m)`, every `m ≥ 107`, `m % 3 = 2`); read in the merged file and replayed (my `AdjU3.lean` extracts it as `.2.1` of `cb8_topRank_parentDescent_and_conjuncts_1_2_3` and compiles; axioms `[propext, Classical.choice, Quot.sound]`). Nothing in this cycle's U
  portfolio adds to it.
- **(L-S)_top**: template-level `formally_verified` (C1-LA1); its literal-network composition (Out/In bridges, doubly-fed capacity) is not
  formalized; in the U portfolio only A2 (STATED) and CA-3 (compiled) touch it. `still_open` formally.
- **Refutation**: none. No eligible deficient cut was proposed, replayed or implied.

## Next-route allocation

**Exact remaining obligation (orientation U):** a Lean term, on the class, of `∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves
(cbGraph m) p*) p* f` — equivalently (Group U-I) a nonnegative rational `g = cb8E1Arc … + g_sec` supported on `transportRel` with Out-`≥`
at every source of `I_{p*+1}` and In-`≤` at every target of `I_{p*}` against the literal active-tag weight. Its smallest open nodes are
(E) (expansion identity) on the E1 side and the sector Out bridge with target distinctness on the sector side.

1. **U-A `E1-SPEC-DISCHARGE-FORMAL`** (one seat; Lean). Prove (E), (A), (N), (B1)–(B3) and the `j ≥ 1`/cast lemmas in U3's merged project on
   top of U2's `E1FlowConstruction.lean` and the critics' `hZeroChoke`/`cb8_out_algebra`; close the unconditional `cb8E1Arc_spec_topRank`.
   *Could close in one cycle:* the E1 half of conjunct 4, sorry-free (the nodes are coefficient identities and literal counts; no new
   mathematics).
2. **U-B `SECTOR-G-SEC-LITERAL-OUT-IN`** (one seat; Lean). Define `g_sec` through Cycle 2 U2's `chokeState`; prove the Out bridge with target
   distinctness (then `sector_out_ge_one`), the In bridge with all zero classes (including the `u = s` switch), A2 in Lean, and the
   doubly-fed capacity from C1-LA1's Switch/Residual plus `cb8Rho_lt_one_topRank` and `q ≤ m`. *Could close:* the sector half, or at least
   the Out bridge and A2 (the smallest nodes).
3. **U-C `CONJUNCT4-ASSEMBLY-AND-FREEZE-HYGIENE`** (one seat; Lean + registry). In U3's merged project: drop entry 607, prove the exact
   weight formula (Group U-W), carry one Out-`≥` interface (Group U-I), and state the composition "`E1 spec ∧ g_sec spec` ⇒ conjunct 4"
   with the per-class capacity sums (switch images, one-choke non-images, `q ≥ 2`, weight zero, in-sector) so that U-A and U-B plug in.
   *Could close:* conjunct 4 conditional on exactly the two named specs, both stated in their final shapes — and, if U-A and U-B close in
   the same cycle, the unconditional terminal under the reserved name (decisive event (a)).

Second reads needed before registration: A2; the exact weight formula; the E1 literal-function fidelity claim; U3's key 2.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-adj-U/` (stdlib Python
only; Lean via the pinned shared Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`, v4.32.2, `.lake/packages` symlinked by hand).

| Path (relative to `scratchpad/c3-adj-U/`) | SHA-256 | Role |
|---|---|---|
| `u1/LeanProject/` (`lakefile.toml`, `lake-manifest.json`, `lean-toolchain`, `LeanProof.lean` copied from `scratchpad/c3-U1/LeanProject/`) | — | U1 rebuild project |
| `u1/LeanProject/LeanProof/Main.lean` | `4a3f435d92017b5d1eb00da168be233f215fec6bb706629fd846ff57ac4671a2` | U1 file, unmodified copy |
| `u1/LeanProject/LeanProof/CritU1T.lean` | `396315cc96343da6ed4e159bff25120ce5aad38dbea4642287e154c2b08faf6f` | C-U1-T `Critic.lean`, copy |
| `u1/LeanProject/LeanProof/MergeU1T.lean` | `14e39b7a96073470d86fd948af414c819cf1851ae95a5ffa488e221af0b141b3` | C-U1-T `Merge.lean` (CA-2), copy |
| `u1/LeanProject/LeanProof/CritU1F.lean` | `ede05a5378b397ff69f1fe41e3a3440d4c3988db02eb14a7c70b72003a657840` | C-U1-F `CriticF.lean`, copy |
| `u1/build.log` / `u1/lean.log` / `u1/merge.log` | `b8e21cb6…b0cd` / `efe329c9…508b` / `41c5f6c9…a563` | U1 build (8657 jobs, 2 warnings); critic files' axioms; CA-2 compile (exit 0) |
| `u2/LeanProject/LeanProof/{Main,E1FlowConstruction}.lean` | `7fbf0531…e9ac9df`, `54e011f2…cce27c84` (full digests as in U2's return) | U2 files, unmodified copies |
| `u2/LeanProject/LeanProof/CritU2T.lean` / `CritU2F.lean` | `17a8d4c577311c72f3f394784fcba5fe65804c04dfcee3cd363d885841abc913` / `41bdeac67d4670136d43e28e2ee79f3a206288cae9139e1a0088f56ce46c96c6` | critic files, copies |
| `u2/build.log` / `u2/lean.log` | `38d9c546…ff9a` / `a1e2946e…b9fe` | U2 build (8658 jobs, 8 axiom lines, 6 warnings); critic files' axioms |
| `u3/LeanProject/LeanProof/Main.lean` | `88ccaaa4db42ee8fc87b4b30b0b18e78f46c63530eab24339bd59ade9b186a25` | U3 merged file, unmodified copy |
| `u3/LeanProject/LeanProof/CritU3T.lean` / `CritU3F.lean` | `c9783d27e57f93ecc9d7e220a2bf5ec8edea9b691bca97dde99550b5732a03d3` / `59423e3c8347af4b16f19aa5b0f9e6af4caa37b1059cec81ea928b7c8db480b9` | critic files, copies |
| `u3/LeanProject/LeanProof/AdjU3.lean` | `997dfefb796385e59e1281ed75414c28b04eb3945d42146b83465a9622f45bf1` | **adjudicator's own**: `rfl` alias test (607 = C2-LA1 entry 547/580), (ELIG-top)(a) extraction, `adjU_terminal_iff_conjunct4`, `#print axioms` probes |
| `u3/LeanProject/LeanProof/AdjU3T.lean` | `d0c8a9d9ab1361534f8fa65413a7e2532fbeea96cdca228ce258f06c5daf5637` | C-U3-T critic file + appended `#print axioms` |
| `u3/build.log` / `u3/lean.log` / `u3/lean_u3t.log` | `492fd1fc…40ab` / `43881c60…eadb` / `948cb1d1…f9ba` | merged build (8657 jobs, 8 carried warnings); `AdjU3`, `CritU3T`, `CritU3F` runs; `AdjU3T` axioms |
| `py/adj_literal.py` / `py/adj_literal.out.json` | `280a2bc0c37e051d168f8b230ef5daa88ae550e14ad7fe929a2ba241d4fab3ba` / `9f45b867aa29ed2d57ecbab810d55457d7a6ef102c98f88ee5c2a491afd4c61f` (inner `b76e7ca2…841e`) | **adjudicator's own instrument**: exact weight formula, A2 with all (D) ∪ (S) arcs, (WID) from independent sides, every rank of CB(2,1), CB(2,2), CB(3,2), CB(8,1): 0 failures (the first, mis-scoped run's inner digest was `e28a36c2…fd72`; superseded) |
| `py/preimage_check.py`, `py/fixedpoint_x.py` → `py/py1.log` | log `61fd5ebb…b6b3` | C-U1-F instruments replayed: A2 0 failures on 4 trees; §5 fixed points `x = 506, 570` |
| `py/crit_rows.py` → `py/rows.log` | log `04f168bb…19de` (inner `225ea9f6…cf08`) | C-U2-F class-row instrument at `m = 107, 125, 128, 140`: 0 failures |
| `py/crit_counts.py` (+ `py/crit_e1_literal.py`) → `py/counts.log` | `facf032d14b58d41832d6612a9e2f47f4a7c39fc53b1fcb3e5e02dce5ac489c9` (inner `854437d4…a6ce`) | C-U2-F (B1)–(B3) literal counts: 0 failures; digest equals the critic's |
| `py/u2_rho1_fixedpoint.py` → `py/rho1.log` | `5e658768cd0722d832a48430c678860db25916a8c61bcffb74255a2222191d14` (inner `cc9a82ec…bcfa5`) | U2 generator replay; the output digest equals U2's stated output-file digest, which both critics had left unaudited — **now backed** |
| `py/literal_e1.py`, `py/classrow_quotient.py`, `py/zw_U3F.py` | copies | copied, not run (covered by the replays above) |
| `ADJUDICATION.draft.md` | — | working draft of this file |

Replay: `cd u1/LeanProject && lake build LeanProof && lake env lean LeanProof/CritU1T.lean && lake env lean LeanProof/CritU1F.lean && lake env lean LeanProof/MergeU1T.lean`; same pattern in `u2/LeanProject` (`CritU2T`, `CritU2F`) and `u3/LeanProject` (`AdjU3`, `CritU3F`, `AdjU3T`); `cd py && python3 -B adj_literal.py && python3 -B preimage_check.py && python3 -B fixedpoint_x.py && python3 -B crit_rows.py 107 125 128 140 && python3 -B crit_counts.py && python3 -B u2_rho1_fixedpoint.py`. Imports: Python standard library only (`hashlib`, `json`, `sys`, `fractions`, `math`, `collections`, `itertools`).

**Background jobs.** Five were started (PIDs 13852, 13905, 13906, 13908, 14143: the three Lean projects, the CA-2 compile and the Python replays). All ran to completion and `kill -0` confirmed every one gone before this write. Nothing was killed.
