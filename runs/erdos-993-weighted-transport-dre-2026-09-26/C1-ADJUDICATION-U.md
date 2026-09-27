# Orientation Adjudication

Orientation U (formal / structural), Cycle 1, Stage 5, run `erdos-993-math-dre-20260926-r30-weighted-transport`
(r30, Erdős #993: correctly weighted mixed-boundary transport for the remaining ordinary-tree favorable-leaf aggregate).
Portfolio: seat `U1` (`C1-U-01 COMPRESSION-UNCROSSING-ORBIT-REDUCTION`) and seat `U2` (`C1-U-02 LEAN-TRANSPORT-SKELETON`),
with their critiques `C-U1-T`, `C-U1-F`, `C-U2-T` and `C-U2-F`. Date 2026-09-26.

Model disclosure (two-part):

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, as the dispatch requires. The tool display truncated the middle
of `verity.md`. The harness injected the project `CLAUDE.md` and the user auto-memory index into context before my first
action. I did not open either as a file, and nothing in this adjudication relies on them.

## Identity and seal audit

**Capsule seal.** `control/c1-adjudicator-capsules/U-PACKET-MANIFEST.json`: I recomputed SHA-256 over the canonical JSON
without `seal_sha256` (`sort_keys`, separators `(",", ":")`, no trailing newline) and got
`359a5264ebcc8250f6c91b215ad85dbfa4a775157e6e4829eddfec2a5e8d5ab7`. It matches the dispatch.
- All 20 listed members match their SHA-256 and byte counts, with 0 mismatches. The check script is
  `scratchpad/c1-adj-U/seal_check.py`.
- Nested seals, recomputed the same way:
  - Stage 2 packet: `886ece6b…4a92`. Match.
  - Stage 3 packet: `da784de8…92ac`. Match.
  - Stage 4 packet: `94bd9f13…17bf`. Match.
- The capsule's digests for the six portfolio files equal their entries in the Stage 3 and Stage 4 admission records:
  - U1 `2f74c265…a79f`
  - U2 `5a89428f…cde5`
  - C-U1-T `40a7532e…3bb3`
  - C-U1-F `b17625c9…bce8`
  - C-U2-T `8b13db61…7790`
  - C-U2-F `2b1b3958…b367`
- `PATH-CHECK-U.json` reports 0 findings.

**Admission exceptions (Stage 3).** Two cosmetic exceptions were applied to U1: a trailing clause on its headline flag, and
disclosure wording that says "Claude Sonnet 5, xhigh". I accept both. The flag value is unambiguously `no`, and the model
disclosure is complete in substance.

**Seat and critic identity.**
- U1 and U2: chartered Claude Sonnet 5 xhigh, runtime `claude-sonnet-5`. This is consistent with the allocation.
- The four critics: chartered opus/medium, runtime `claude-opus-5-5[1m]`. This is consistent with the allocation.

**Read-boundary record (Stage 3 disclosures file and critic faces).**
- **U1.** One auto-backgrounded exploratory script was stopped by a PID-scoped `TaskStop`. It produced no output. Every U1
  number reproduces from the five inventoried scripts, as both critics and my replay confirm.
- **U2.** No disclosures. Process notes: entries 46+ were not minted, and there are keyword deviations.
- **C-U1-T.** A `grep -rl` rooted at `sources/`, which is inside its grant.
- **C-U1-F.** One pattern-scoped `pgrep -f` process lookup, disclosed on its face. **New finding (process).** The sealed
  C-U1-F critique still contains the literal placeholders `SWEEP_RESULT_PLACEHOLDER` (in A8) and `INVENTORY_PLACEHOLDER` (in
  its artifact inventory). It states that the sweep job had "ended or [was] stopped by literal PID before this write". That
  statement is false:
  - When I first looked, around 14:01, the critique file's mtime read 13:53:17. Given incident R30-I-1 below, that mtime may
    belong to a rewrite or a restore, so I draw no seal timing from it.
  - Its sweep output `scratchpad/c1-crit-U1-F/own/sweep.out` was still growing during my adjudication. At about 14:01 it had
    113 rows and no terminal line (mtime 13:54:24). At 14:08:25 it had 115 rows ending in `SWEEP DONE`.
  - So a C-U1-F background job was still running after the sealed text had asserted that none remained.
  - I did not look for or kill that process, because it is not mine and the PID-only rule applies. As observed from the file,
    the job has since exited on its own.
  - The Stage 4 admission validator admitted a critique that still carried placeholders, with `finding_count: 0`. That is a
    validator gap for the controller.
  - **Controller incident R30-I-1**, received mid-adjudication. The seat rewrote the C-U1-F critique after the Stage 4 seal,
    and the controller restored the sealed bytes in place.
    - I re-ran `seal_check.py` after the notice. The capsule seal matches, and all 20 members match with 0 mismatches,
      including `CRITIQUE.md` at `b17625c9…bce8`.
    - My first check (before reading) had also passed. The text I adjudicated contains both placeholders, so it is the
      sealed version.
  - **The late unsealed file** `cycles/cycle-1/stage4/critics/U1/F/CRITIQUE.late-unsealed-2026-09-26.md` (`996e0a0b…9163`)
    has no standing as a capsule member. I read it only by `diff` against the sealed file. It fills the two placeholders:
    - the sweep result is 115 rows, `n ≤ 81`, all saturating both mixed and deletion-only, with
      `sha256(sweep.out) = f93c80dd…abe10`;
    - the inventory table is filled in.

    The diff shows more than the controller's "changes nothing else":
    - two wording edits (line 403 of the sealed text: the route-verdict row; line 435: the pointer to the canonical-cut
      lemma);
    - an added replay-command block;
    - rewritten process notes ("two background wait loops … exit 144", "`ps -p 71610,74604,74608` shows no survivor").

    None of these changes is mathematical. The late sweep digest equals the digest of my own copy-out of the finished
    `sweep.out`. Nothing in this adjudication gives the late file standing; the sweep is weighed as described in
    Established results (D).
- **C-U2-F.** A transient file in the session scratchpad, deleted. It did not read `c1-U2-replay/`.
- **C-U2-T.** It did not read `c1-U2-replay/`.

**My own read boundary (disclosed).**
- I read the capsule members, the four critics' and two seats' scratch directories named in the dispatch, frozen files
  under `sources/`, and pinned Mathlib source lines (two citations spot-checked).
- I did **not** read `control/controller-facts/CF-REPLAY-c1.json`, which CF-0 cites but the capsule does not list,
  `scratchpad/c1-U2-replay/`, or `scratchpad/c1-U1-replay/`. My own rebuild and replays substitute for those.
- **Disclosures:**
  - (1) I wrote one transient copy of the C-U1-F critique into the session scratchpad
    (`/private/tmp/claude-501/…/scratchpad/u1f.md`), outside `c1-adj-U/`. I deleted it unread and read the critique in
    place instead.
  - (2) To check the output directory before writing, I ran one non-recursive `ls` of
    `cycles/cycle-1/stage5/adjudicators/`, which is above my write grant. It showed the name of one sibling directory
    (`T`). I read no content from it.
  - (3) The harness automatically saved two oversized tool outputs (the U1 return and the C-U1-T critique, both capsule
    members) into its own session tool-results directory. I read them from there.
- No network, no installs, and no `lake update` or `lake clean`. Every `lake` and `lean` call ran after `cd` into my
  pinned scratch project.

**Pins.** The toolchain is `leanprover/lean4:v4.32.2`. The shared Mathlib `git rev-parse HEAD` is
`905b95818eb32af7874a58b427f50c1711a5e96c`, which equals `sources/mathlib-binding/PIN.json`.

## Route-by-route decisions

### U1 — `C1-U-01 COMPRESSION-UNCROSSING-ORBIT-REDUCTION`: **retained, narrowed**

**§4.2–4.7 (supermodularity, maximizer lattice, invariant maximizer, Hall ⇔ quotient Hall): RETAINED at
`proved_informal`, STATED, with its novelty narrowed.** I re-derived every step from the definitions.
- **(i) Coverage.** `c(X) = Σ_A w(A)·[X ∩ R⁻¹(A) ≠ ∅]` is a nonnegative combination of coverage indicators, so `c` is
  submodular. This needs `w ≥ 0` on targets and finiteness.
- **(ii) Supermodularity.** The source part of `φ` is modular, so `φ` is supermodular. Source weights may be arbitrary.
- **(iii) Lattice.** The maximizers are closed under `∪` and `∩`.
- **(iv) Automorphism invariance (§4.5).** Every graph automorphism preserves `F_p`, because `T − v ≅ T − γv`. It maps `W_v`
  to `W_{γv}`, so `w_F` is invariant, and it preserves (D) ∪ (S), which is defined by adjacency. The argument uses neither
  eligibility nor `IsTree`.
- **(v) Invariant maximizer.** `⋂_γ γX₀` is a `Γ`-invariant maximizer.
- **(vi) Equivalence (§4.7).** Hall holds on the original network iff it holds on every union of orbits, iff it holds on the
  orbit quotient. The step U1 left implicit, "quotient neighbourhood = orbits of `N(X)` for invariant `X`", is filled by both
  critics, and I confirm it.
- No ℕ-subtraction and no circularity.

Narrowings, all agreed by both critics and confirmed by me against their quotation of the registered (LIFT) text:
- The (⇐) half is the registered (LIFT) `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT`, translated into Hall form. (LIFT) is
  already registered for an arbitrary finite group acting on a generic finite invariant relation.
- U1's claims that it generalizes (LIFT) "to an ARBITRARY finite group" and that (LIFT) "explicitly disclaims (⇒)" are
  **struck**.
- The genuinely new content is elementary:
  - the written (⇒) summation converse;
  - the automatic admissibility of every `Γ ≤ Aut(G)` for this network;
  - the biconditional packaging.
- Scope widens to every finite simple graph, every `p`, and every `Γ`-invariant `F` of degree-one vertices. `F_p(G)` is
  automatically `Aut(G)`-invariant at every `p`.

**§5 (validated `CB` orbit builder; `CB(1,7)` at `p = 10` saturates): RETAINED at `bounded_computation`.**
- The row `n = 24, α = 15, x = 8, |F| = 8, i_11 = 8673, i_10 = 22197`, supply 29190, capacity 58002, `S = −28812`, flow
  29190 is reproduced by:
  - U1's quotient;
  - C-U1-T's brute force;
  - C-U1-F's brute force and its own quotient;
  - the controller (CF-2);
  - **my own brute force**, which gives 124,593 mixed arcs and 95,403 deletion arcs.
- The phrase "a new, exactly-verified instance of (HALL) holding" is **struck**. The correct statement is: (HALL-COND) holds
  at the single `(CB(1,7), 10)`, and deletion arcs alone already saturate there, so no switch exit is exercised.
- "Smallest eligible `CB`" is true. C-U1-T scanned all `d` with `n ≤ 30`, which closes the gap left by U1's `d ≤ 4` box.
- `validate_orbit.py` validates arcs, not weights. The weight gap is closed by C-U1-F's member-level check (0 mismatches)
  and by my brute-force totals.
- "Copy-out-first replay" is **weakened**: two scripts hard-code `sys.path` into `c1-U1/`. There is no numeric consequence.
- The "20 hits … session transcript" is **struck**. No transcript is inventoried; `c1-U1/` holds only the five scripts.

**§6 (compression): REJECTED as stated.** "Where defined it can only weakly *decrease* the active weight" is **false**. Its
proof infers `w_F` from `|F ∩ B|`, which is exactly the presence/activity conflation that SOLUTION-CONTRACT §3.3 forbids.
The grade "`proved`" is not a grade on the SOLUTION-CONTRACT §4 ladder and is struck, as is "decisive disproof". What
survives is the witness that the literal support move is undefined at `B = {3, 5}` in `CB(1,3)`. That is an instance of the
support-move lemma below (the move is undefined exactly when `v` is active).

**§7 (fixed points cited, not reproduced).** A process gap, noted by both critics. It is closed for `CB(1,7)` by four
independent instruments.

**Route verdict word "`proved`": struck.** The §4 theorem stands at `proved_informal`, STATED.

### U2 — `C1-U-02 LEAN-TRANSPORT-SKELETON`: **retained, narrowed (mathematics retained in full; certification literals corrected)**

**My rebuild** (copy-out-first, `scratchpad/c1-adj-U/LeanProject/`):
- The frozen project files are byte-copied, and U2's working `Main.lean` (`110c2751…2743`) is copied.
- `.lake/packages` is bound by manual `ln -sfn` to the pinned shared project.
- `lake build` gives `Build completed successfully (8657 jobs)`, exit 0 (`lake_build.log`).
- The first 61,296 bytes hash to `8d864da2…a7d9`, so all 45 carried entries are byte-identical.
- `#print axioms` on **all 18** new `E993Transport` declarations (`AdjCheck.lean` → `adjcheck.log`) gives exactly
  `[propext, Classical.choice, Quot.sound]` for every one.
- The appended code (from line 1495) contains no `sorry`, `admit`, `native_decide`, `decide`, `axiom` or `set_option`.
- The build emits one warning in new code, at `Main.lean:1704:46`: the unused simp argument `hpk2` in
  `layerWeight_sub_eq_sum`. U2's "none in the new `E993Transport` code" is therefore **struck**. The warning is harmless.

**Statements, read against SOLUTION-CONTRACT §2** (the compiled text is printed in `adjcheck.log`):
- `activeWeight` filters `F ∩ B` by `¬ Disjoint (B.erase v) (tagWitnesses G v)`, with `tagWitnesses = N(s_v).erase v`. That
  is the literal active weight. It is not `|F ∩ B|` and not `1 + #private`.
- `favorableLeaves G p` is the filter at the single rank `p`, definitionally the filter inside entry 13. The closing `rfl`
  is kernel-accepted.
- `transportRel` is (D) ∪ (S) literally: exactly two neighbours, `u ∉ B`. It is neither wider nor narrower than the
  charter's relation.
- The terminal theorem's binders equal §2's.

**Deviations from the §2 draft**, reconciled across both critics and my replay:
- (a) `noncomputable` on `tagWitnesses`, `activeWeight`, `layerWeight` and `favorableLeaves`, and `open scoped Classical`.
  These are **required**. My compile of C-U2-F's `ContractVerbatim.lean` reproduces four errors on the §2 text verbatim:
  - noncomputable `C5LA1.support` (twice);
  - `DecidablePred (IsFavorableAt G · p)`;
  - `DecidablePred (∃ B ∈ X, transportRel G B A)`.

  This is a finding against the contract text, not the seat.
- (b) `layerWeight_sub_eq_sum` is declared `theorem`, not `lemma`, and takes an explicit `G`. U2 disclosed both.
- (c) `exists_saturatingFlow_of_weightedHall` is also declared `theorem`. U2 did not disclose this; C-U2-F found it and my
  declaration listing confirms it.

C-U2-T's `CriticContract.lean` proves that the verbatim draft definitions (with `noncomputable section` and
`open Classical in`) agree with U2's by `rfl`, `congr` or `Iff.rfl`. It also discharges the contract's exact binder text for
all four propositions. My compile gives exit 0 and output byte-identical to C-U2-T's (`a8625c8d…`).

**Certification literals:**
- **Corrected:** the claim that `110c2751…` is "this exact byte sequence … concatenated". It is that concatenation
  (`bb018442…8279`) minus its final newline.
- **Corrected:** "entries 41–42's block" should read entry 42 only. All cited helper lines fall inside entry 42 (lines
  962–1177).
- **Struck:** the dependency-diagram sentence that "all four of the first group are used directly", because it lists
  `support_unique`.
- **Not award-ready:** the draft `THEOREM-CONTRACT-draft-WID.json`. It has:
  - no `expected_statement` field;
  - a `signature_deviation_from_draft` attributed to the wrong declaration;
  - an `hp_guard` sentence that is false for the terminal theorem (see Cross-route reconciliation);
  - incomplete `definitions` and dependency edges;
  - a misattributed "SOLUTION-CONTRACT ruling 9" (the ruling is Gate ruling 9).
- **Not inventoried:** two files present in `c1-U2/LeanProject/LeanProof/`, `Main.lean.bak1` and `Check.lean`. Neither is
  a library module.
- **Unverified self-reports:** U2's replay digests `1a02b4ff…` and `8d9372bd…`, which live in `c1-U2-replay/`, outside
  every grant. My rebuild substitutes for them.

**Route verdict `compiled`: accurate.** A compiled scratch declaration has no grade until its governed award closes.

## Cross-route reconciliation

Paired-critic disagreements, resolved claim by claim (none are averaged; replays are weighed over self-reports):

1. **Registration form of U1's §4.**
   - C-U1-T proposes `E993-R30-TRANSPORT-HALL-IFF-INVARIANT-QUOTIENT-HALL` as a companion or scope note of (LIFT).
   - C-U1-F proposes the predicate-form `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`, or alternatively a scope note
     on (LIFT).
   - Both agree on the mathematics, the grade, `novelty_claimed: false` for (⇐), and a `CLAIM-DISTINCTIONS` row against
     (LIFT).
   - **Ruling.** The SEMANTIC-CONTRACT §2 (INV) template anticipates exactly this as a separate `E993-R30-…` key, so
     registration is within contract. It uses C-U1-F's predicate-form name (key names are predicates), U1's noun-phrase
     candidate `E993-R30-INVARIANT-DEFICIENT-CUT-REDUCTION` is retired, and it registers only after an isolated second read.
   - The statement text is the general-network form:
     - (i) supermodularity and lattice, and the least and greatest maximizers are invariant under every network
       automorphism;
     - (ii) Hall ⇔ Hall on unions of `Γ`-orbits ⇔ quotient Hall;
     - (iii) every `Γ ≤ Aut(G)` is admissible for the r30 network at any `p`, and `F_p(G)` is `Aut(G)`-invariant.
   - `novelty_claimed` is limited to the (⇒) converse, (iii), and the canonical-cut form.
   - If the synthesis prefers, a scope note on (LIFT) is an acceptable alternative. Both critics accept it.
2. **Stated scope of §4.** C-U1-T says "any finite bipartite relation with invariant weights"; C-U1-F says "every finite
   simple graph, every `p`, every `Γ`-invariant `F`". There is no conflict: the former is the abstract form and the latter
   its specialization. Both enter the ruling above.
3. **The §6 weight lemma.** C-U1-T states it for trees with `n ≥ 3`. C-U1-F states it for finite simple graphs and handles
   the `s_v ∈ F` edge case (then `W_s = ∅`). The two are the same lemma, derived independently. **Ruling:** C-U1-F's
   general form, attributed to both critics:
   - (a) `B' = (B ∖ {v}) ∪ {s_v}` is independent iff `v` is inactive in `B`;
   - (b) if so, `w_F(B') − w_F(B) = #{t ∈ (F ∩ B) ∖ {v} : t inactive in B, s_t ~ s_v} ≥ 0`.

   I re-proved it. My exhaustive check over every `(B, v)` with `v ∈ F ∩ B` on four eligible trees covered 2,493 cases:
   - the order-12 and order-14 witness trees, the order-11 double broom and path-star `(2,3,4)`;
   - 0 failures of (a) or (b);
   - strict increases in 12 cases.

   Both strict-increase witnesses reproduce: `w 5 → 6` (C-U1-T, order 12) and `w 4 → 5` (C-U1-F, order 14).
4. **Shift negatives.** There is no disagreement. My replay reproduces each witness:
   - C-U1-T support shift `8 → 1` on the order-12 tree: `φ −25 → −34`.
   - C-U1-T cross-leaf shift `2 → 8` on the double broom: `φ −30 → −38`.
   - C-U1-F support shift `2 → 1` on path-star `(2,3,4)`: `φ −38 → −44`.
   - C-U1-F's claim that every ordered cross-support tag pair on the double broom admits a singleton `φ`-decrease: 36/36.

   **One critic literal is corrected.** C-U1-T gives the capacity of `N(X)` in its first A2 witness as "total weight 36".
   My replay gives **30**, and only 30 is consistent with its own `φ(X) = 5 − 30 = −25`. The `φ` values stand.
5. **"Instance of (HALL)" wording on `CB(1,7)`.** C-U1-T strikes it as worded. C-U1-F backs it "at `bounded_computation`
   for `(CB(1,7), 10)` only". **Ruling:** struck as worded. (HALL) is the universal key, and a single-row saturation is a
   (HALL-COND) instance at `bounded_computation`.
6. **The `p ≥ 1` guard.** C-U2-T calls the guard "necessary" and the draft `hp_guard` "correct when read" for the general
   form. C-U2-F calls `hp_guard` false for the terminal theorem. **Ruling: both are right at their scopes.**
   - The general-`F` lemma genuinely needs `hp`. At `p = 0` its left side is 0 (`layerWeight_one` and `layerWeight_zero_one`,
     both kernel-checked in my replay), while its ℕ-truncated right side is `Σ_{v∈F} |W_v|`.
   - The terminal theorem does not need `hp`. `F_0(G) = ∅`, because `Δ_0(G − v) = n − 2 ≥ 0` for a leaf. C-U2-F's
     `activeWeightAggregateIdentity_unguarded` is kernel-checked in my replay.
   - The frozen expected statement keeps `hp` as in §2. The unguarded form may ride as a companion.
7. **Keyword deviations.** C-U2-T lists one (`layerWeight_sub_eq_sum`). C-U2-F lists two. My declaration listing shows
   `exists_saturatingFlow_of_weightedHall` at line 287 of the appended block declared `theorem`, so C-U2-F is right.
8. **Contract-verbatim failure.** C-U2-T reports one failure (`favorableLeaves` decidability), because its transcription
   already added `noncomputable section`. C-U2-F reports four. The two agree once C-U2-T's added `noncomputable` is taken
   into account. My compile reproduces C-U2-F's four errors exactly (`ContractVerbatim.log`, byte-identical `98326ac0…`).
9. **Carry plan for the WID award.** Both critics give entries 1–6, 8–13, 18 plus the whole of fragment 42 (its helpers are
   `private`, so the fragment must travel intact). The controller's CF-U-2 says "entries 1–14, 18" plus the entry-42 block.
   **Ruling: the critics' minimal set.** My reference grep of the new code and of fragment 42 finds references only to
   entries 3, 4, 5, 6, 8, 9, 10, 11, 12, 13 and 18 and to `E993Interior.Leaf.*`. Entry 13 needs 3 (which needs 1–2) and 6;
   entries 8 and 9 need 5, which needs 4. Neither `C5LA1.leafDegree` (7) nor `crossingIndex` (14) is referenced. Carrying
   7 and 14 is harmless, and 14 will be needed by the (HALL) award.
10. **Controller erratum R30-E-b** (C-U2-F's finding). The prose `(B ∖ {v}) ∩ W_v = B ∩ N(s_v)` and the test
    "`B ∩ N(s_v) ≠ ∅`" are wrong: for a present leaf they always hold. C-U2-F's `prose_test_always_true` is kernel-checked
    in my replay. I checked every instrument in my portfolio against the correct test, in code rather than prose:
    - U1's `state_weight` (via both critics' member-level checks);
    - U2's Lean `activeWeight`;
    - all four critics' instruments;
    - my own instrument (`(B − {v}) ∩ (N(s_v) − {v})`).

    All use the correct test. No number in the portfolio is struck on this ground.
11. **Cross-orientation facts used (CF-4, controller reading; context, not evidence).** The `CB` root-plus-arm sector is
    deletion-deficient iff `3p < 2dm + 5`. I re-derived this: the sector's positive-weight deletion shadow is exactly
    `R_{p−2}`, because deleting `r` or `v` leaves weight 0. So the sector ratio is `|R_{p−1}|/|R_{p−2}| = 2(dm − p + 2)/(p − 1)`.
    I also confirmed the smallest instance independently. My closed form `I = (1+2x)B^m + x(1+x)(1+2x)^{dm}` (validated by
    brute force on six small `CB`) finds, over `d < 40` and `n ≤ 1600`, exactly three eligible sector-deficient rows:
    - `CB(8,86)`: `n = 1465`, `α = 775`, `x = 458`, `p = 460`, ratio `460/459`;
    - `CB(8,89)` at `p = 476`;
    - `CB(8,92)` at `p = 492`, ratio `492/491`, which reproduces the record.

## Established results

The full list of U results, by type and grade:

**(A) Exact theorems (statement-level, verified by me at full scope).**

- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`: `proved_informal` mathematics, re-derived by me. It is
  **kernel-checked in scratch** (U2), which carries no grade until its award.
  - Hypotheses: `[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`, and `F` a set of degree-one vertices (`hF`,
    general form) or `F = favorableLeaves G p` (terminal form).
  - `p ≥ 1` in the general form. The terminal form holds unguarded (C-U2-F, compiled).
  - No `IsTree`, no eligibility, no group invariance.
  - Proof: the bijection `B ↦ B ∖ {v}`, `{B ∈ I_j : v active in B}` → `taggedFamily(univ ∖ H_v, R_v, j−1)`, then
    `tagged_count_split` and double counting.
- **(FLOW⇒SIGN)** `aggregate_nonpos_of_saturatingFlow`: `proved_informal`, kernel-checked in scratch. It uses (HALL-COND)
  only at `X = I_{p+1}`.
- **(HALL⇒FLOW)** `exists_saturatingFlow_of_weightedHall`: `proved_informal`, kernel-checked in scratch. It is Mathlib's
  `Fintype.all_card_le_filter_rel_iff_exists_injective` (pinned `Mathlib/Combinatorics/Hall/Basic.lean:196`, spot-checked by
  me) applied on the clone expansion.
- **Critic-attributed, kernel-checked in my replay, STATED (needs an isolated second read if it is to be registered other
  than as an award-face companion):**
  - C-U2-T and C-U2-F independently:
    - `transportRel_mem_indepFamily`: every (D)/(S) image of an independent `(p+1)`-set is an independent `p`-set. This
      closes U2's fidelity note 1, so the `indepFamily p` filter in `WeightedHall` drops nothing.
    - `weightedHall_of_saturatingFlow`.
    - `weightedHall_iff_exists_saturatingFlow`: (HALL-COND) ⇔ saturating integral flow, on every finite simple graph, every
      `F` and every `p`.
  - C-U2-T:
    - `aggregate_nonpos_of_weightedHall`;
    - `layerWeight_zero_one`.
  - C-U2-F:
    - `not_isFavorableAt_zero`, `favorableLeaves_zero`, `activeWeightAggregateIdentity_unguarded`;
    - `layerWeight_one`, `prose_test_always_true`, `active_iff_other_neighbour`.
  - Every one of these declarations has axioms `[propext, Classical.choice, Quot.sound]`. My output logs are byte-identical
    to the critics' (`critic_advance_output.txt` `6f8efa27…`, `critic_final.log` `d3004c5a…`).

**(B) Structural theorems (`proved_informal`, STATED, isolated second read pending).**

- U1's Hall ⇔ invariant-quotient Hall, in the narrowed form of Cross-route reconciliation item 1. Hypotheses: finiteness,
  target weights `≥ 0`, and a finite group preserving the relation and both weights (automatic for `Aut(G)` on this
  network). Its (⇐) half is (LIFT)'s content.
- Critic-attributed, both U1 critics independently: the canonical invariant cuts.
  - `X_min = ⋂{maximizers}` and `X_max = ⋃{maximizers}` are maximizers, fixed by every network automorphism.
  - `X_min = ∅` iff `max φ = 0`.
  - Every `B ∈ X_min` has `w_F(B) >` the weight of its private targets, which is `≥ 0`, hence `w_F(B) ≥ 1`.
  - `X_max = {B : N(B) ⊆ N(X_max)}`.

  I verified each step. **Consequence:** if (HALL) fails at `(T, p)`, it fails on an `Aut(T)`-invariant family of
  positive-weight sources. My toy check on U1's `CB(1,1)`, `p = 1`, all-leaf network (non-eligible, a sanity check only):
  0 supermodularity violations over all `1024²` pairs, `max φ = 2`, 256 maximizers, `φ(X_min) = φ(X_max) = 2`,
  `|X_min| = 2`.
- Critic-attributed, both U1 critics independently: the support-move lemma (a)/(b) of Cross-route reconciliation item 3.

**(C) Refuted steps (exact finite witnesses; two instruments each: the critic's and mine).**

- The universal statement "`φ(C(X)) ≥ φ(X)` for all `X`" is refuted for the leaf→support shift and for the cross-support
  leaf shift. The witnesses are singleton families on eligible saturating instances.
- The obstruction is capacity growth: new switch arcs through `s_v` enlarge `N(C X)`. It is not supply loss.
- The twin-leaf shift adds nothing beyond §4.6: twin transposition is an automorphism, so an invariant maximizer is already
  twin-closed.
- Scope: these refute monotonicity lemmas. They say nothing about compressing a maximizer of a hypothetical deficient
  instance.

**(D) Bounded computations (fidelity-checked: `w_F` active tags; (D) ∪ (S); `F` fixed at `p`; `x` through `α`;
`supply − capacity = S` asserted before output).**

| graph | p | n | α | x | \|F\| | supply | capacity | S | mixed / deletion-only flow | instruments |
|---|---|---|---|---|---|---|---|---|---|---|
| `CB(1,7)` | 10 | 24 | 15 | 8 | 8 | 29190 | 58002 | −28812 | 29190 / 29190 | U1 quotient; C-U1-T; C-U1-F (2); controller; **mine** |
| `CB(1,8)` | 11 | 27 | 17 | 9 | 9 | 177576 | 322112 | −144536 | saturate / saturate | C-U1-T; C-U1-F (critic-attributed) |
| `CB(2,5)` | 10 | 28 | 16 | 8 | 11 | 259980 | 396460 | −136480 | saturate / saturate | C-U1-T; C-U1-F (critic-attributed) |
| `K_{1,12}` | 8 | 13 | 12 | 6 | 12 | 1980 | 3960 | −1980 | 1980 / 1980 | mine (fixed point) |
| double broom (order 11) | 6 | 11 | 9 | 4 | 9 | 255 | 516 | −261 | 255 / 255 | mine (fixed point) |
| path-star `(2,3,4)` | 7 | 15 | 11 | 5 | 10 | 1483 | 2701 | −1218 | 1483 / 1483 | mine (fixed point) |
| order-14 witness tree | 6 | 14 | 9 | 4 | 7 | 290 | 627 | −337 | 290 / 290 | C-U1-F; mine |

- Counts are labelled. U1's 57/90 are orbit counts under `S_7` and are named as such.
- **C-U1-F's `CB` quotient sweep** is critic-attributed and comes from one instrument, C-U1-F's `cbq.py`, which is
  cross-validated against brute force on three instances.
  - As sealed, the critique is **unbacked**: the text carries a placeholder and the inventory is empty.
  - The post-seal output file, copied out by me (`sha256 f93c80dd…be10`), reads `SWEEP DONE` with 115 eligible rows:
    - `d = 1, m ≤ 26`;
    - `d = 2, m ≤ 12`;
    - `d = 3, m ≤ 9`;
    - `d = 4, m ≤ 7`, all ranks.
  - Every row saturates, both mixed and deletion-only.
  - I summarized the file; I did not re-execute it. It is weighed as a self-report with output, not as a replay.
  - The unsealed late C-U1-F file (incident R30-I-1) reports the same 115 rows and the same digest. It is cited only as
    unsealed seat material.
- The absence of any switch-load-bearing instance in the small `CB` family is structural (item 11). Every small `CB` sits
  outside `3p < 2dm + 5`.

**(E) Record corrections filed by this adjudication.**

- U1 §6 is false. U1's (LIFT) novelty claims are struck, and U1's "instance of (HALL)" wording is struck.
- U2's warning literal, concatenation literal, entry-41 attribution and draft-contract defects are corrected.
- C-U1-T's `N(X)` weight literal 36 is corrected to 30.
- C-U1-F's A8 is unbacked at seal, and its "no background job remains" is false.
- The SEMANTIC-CONTRACT §1.2/§3 prose erratum R30-E-b is confirmed.
- The contract §2 draft text does not compile verbatim.

**Open bridges.** (HALL) at full scope. No imported informal result was used at a grade above its registration.

## Rejected and narrowed mechanisms

- **U1 §6 "support compression is weight non-increasing"**: REJECTED. It is false, and the truth is the reverse.
- **"`φ`-monotone compression by support shift or cross-leaf shift"**: REFUTED as a universal lemma (exact witnesses).
  This is not a registered mechanism key. It is a route record.
- **"Small `CB` quotient flows test the switch mechanism"**: NARROWED. On every small `CB` the deletion arcs alone
  saturate. The switch relation first becomes load-bearing in the `CB` family at `CB(8,86)`, `p = 460`.
- **U1 §4 as a generalization of (LIFT)**: NARROWED to a companion or outcome-B (INV) key with a limited novelty claim.
- **No refuted key is revived.**
  - U1 proposes no transport mechanism.
  - U2 proves identities and generic network facts.
  - Deletion-only saturation on small `CB` is an instance fact. It is **not** `E993-R23-LITERAL-DELETE-ONLY-HALL`, which has
    a different weight and relation and stays REFUTED at its scope.
  - The support-move lemma is not a transport relation.
- **Fence check.** No closed region is re-proved, no census value enters a proof, and there is no RTree wording. (LIFT) is
  never used to supply feasibility, and `D, C ≥ 0` is not used. The primary aggregate
  `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` is untouched.

## Lean readiness

**Award group 1: (WID), `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`. CONTRACT-READY**, subject to freeze edits that
change no mathematics.
- (a) The informal proof is complete at statement level, and its DAG is closed:
  - leaf facts (fragment 42: `support_spec`, `support_adj`, `leaf_insert_indep`, `H_subset_R`, `tagged_count_split`);
  - `tagWitnesses_subset_R`;
  - `card_active_eq_tagged`, the bijection;
  - `layerWeight_eq_sum_card`, double counting;
  - `layerWeight_sub_eq_sum`;
  - `activeWeightAggregateIdentity`.
- (b) Every node is compiled sorry-free, with the three permitted axioms only. I rebuilt it.
- (c) No open node.

**Terminal theorem (the expected statement, frozen from the compiled text).** It sits in namespace `E993Transport`, under
`variable {V : Type*} [Fintype V] [DecidableEq V]` and `open scoped Classical`:

```lean
theorem activeWeightAggregateIdentity (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
    (hp : 1 ≤ p) :
    (layerWeight G (favorableLeaves G p) (p + 1) : ℤ) - layerWeight G (favorableLeaves G p) p =
      C5LA1.aggregate G p
```

**Companion `lemma`s on the face (no certificate of their own, R29-N-12):**
- `layerWeight_sub_eq_sum`, the general form with `hF : ∀ v ∈ F, C4LA1.IsGraphLeaf G v` and `hp : 1 ≤ p`;
- `card_active_eq_tagged`;
- `layerWeight_eq_sum_card`;
- `tagWitnesses_subset_R`;
- `indepFamily_eq_indepSetsAvoiding`;
- `isGraphLeaf_of_mem_favorableLeaves`.

Optionally, and recommended so that the network definitions freeze once:
- `aggregate_nonpos_of_saturatingFlow` (FLOW⇒SIGN) and `exists_saturatingFlow_of_weightedHall` (HALL⇒FLOW);
- the critic-attributed `transportRel_mem_indepFamily`, `weightedHall_of_saturatingFlow`,
  `weightedHall_iff_exists_saturatingFlow` and `activeWeightAggregateIdentity_unguarded`.

**New declarations (18, U2).** `indepFamily`, `indepFamily_eq_indepSetsAvoiding`, `tagWitnesses`, `activeWeight`,
`layerWeight`, `favorableLeaves`, `isGraphLeaf_of_mem_favorableLeaves`, `transportRel`, `IsSaturatingFlow`,
`WeightedHall`, `tagWitnesses_subset_R`, `card_active_eq_tagged`, `layerWeight_eq_sum_card`, `layerWeight_sub_eq_sum`,
`activeWeightAggregateIdentity`, `aggregate_nonpos_of_saturatingFlow`, `card_sigma_fiber_filter`,
`exists_saturatingFlow_of_weightedHall`. Critic companions are added only if the synthesis carries them, with attribution.

**Carried fragments (byte-identical; digests from the entry markers of the frozen `Main.lean` `8d864da2…a7d9`):**

| entry | declaration | fragment digest |
|---|---|---|
| 1 | `C4LA1.vertexDeletionIndepSetCount` | `7e0a588e243735a611c919ea1080816911a3e27e4523478af0c0f560ce1b3b48` |
| 2 | `C4LA1.vertexDeletionForwardDifference` | `c2da50eb16ee788c439b146577efeedd7dd42811c6943fb437585edcf63b5880` |
| 3 | `C4LA1.IsFavorableAt` | `25d8f7d274f9080468bf6d46acc6db3d4a469c2e399e7faee6cdcee24290a0db` |
| 4 | `C4LA1.IsGraphLeaf` | `65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5` |
| 5 | `C5LA1.support` | `8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4` |
| 6 | `C5LA1.leafSet` | `78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697` |
| 8 | `C5LA1.H` | `55f37d9161901d6006e571cf548c4e56675c9d786a1aba83e7889ad9d443224d` |
| 9 | `C5LA1.R` | `a0407d82ab112a65a0f9d85970e9d6217b66201680cc079a4ba13751e53dc6b8` |
| 10 | `C5LA1.indepSetsAvoiding` | `ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368` |
| 11 | `C5LA1.indepSetCount` | `e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71` |
| 12 | `C5LA1.forwardDifferenceDel` | `60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f` |
| 13 | `C5LA1.aggregate` | `d66e776c5cf49b2a78a2d9713e4a41de2cbaf5de0af7b6d580075064d1daea8b` |
| 18 | `E993Interior.taggedFamily` | `cb43feebd48bdf3a82d95db4c0475a34a83acdd8c55f13ac44433ea26141fa1e` |
| 42 | `E993Interior.highTailAggregateFromShadow` (whole fragment; private `Leaf.*` helpers) | `972d0d900218889995bebd2e0682c1886576df4d7b2b22356924b0d7295baa9d` |

Entries 7 and 14 are harmless extras, and 14 is needed later by (HALL). Entries 15–17 are unused. The alternative is to
re-prove the four helpers publicly in `E993Transport` and drop fragment 42.

**Fences on the WID face.**
- Graph-generic: no tree hypothesis.
- It says nothing about the sign of `S`, since mechanism ≠ aggregate.
- It uses `w_F` active tags, never `|F ∩ B|`. The informal statement must use `(B ∖ {v}) ∩ W_v ≠ ∅`, "another neighbour of
  `s_v`", never `B ∩ N(s_v)` (erratum R30-E-b).
- `F` is fixed at `p`. The `p − 1` guard is `hp`.
- It does not register or imply (HALL).
- Attribution: definitions of record from the first-interior run (Codex), entries 1–18 and 42; the mechanism and the
  active-tag weight correction from Codex (lower-region); the Lean proofs from r30 U2; companions from C-U2-T and C-U2-F.

**Freeze edits required (Stage 7; administrative, no mathematical change).**
- `layerWeight_sub_eq_sum` and `exists_saturatingFlow_of_weightedHall` become `lemma`.
- Remove the unused `hpk2`.
- Freeze the definitions as compiled: `noncomputable`, and the classical decidability. Prefer `open Classical in` on
  `favorableLeaves` and `WeightedHall`, mirroring entry 13.
- Record the explicit `G` of `layerWeight_sub_eq_sum` as the frozen phrasing, or restore the implicit binder. Both compile
  against the contract text (C-U2-T `CriticContract.lean`, my compile).
- Rebuild the contract with an `expected_statement` field, the full definition list (entries 1–4, 6, 11 added;
  `transportRel`, `IsSaturatingFlow`, `WeightedHall` if companions ride), correct dependency edges and a correct `hp` note.
- Mint entries 46+ through the registrar.
- Exclude `Main.lean.bak1` and `Check.lean` from the award capsule.

**Award group 2: the INV reduction (U1 §4, narrowed; C-U1-F predicate key). NOT Lean-ready.**
- (a) The informal proof is complete, and I verified it. Its DAG: coverage-submodularity → `φ`-supermodularity → maximizer
  lattice → least-maximizer invariance and `Aut`-admissibility → Hall ⇔ invariant-family Hall → quotient Hall.
- (b) No compiled fragments.
- (c) Open nodes:
  - a Lean definition of the `Γ`-orbit quotient network (none exists);
  - `Aut`-invariance of `favorableLeaves`, `activeWeight` and `transportRel` under `G ≃g G`;
  - the supermodularity and lattice lemmas over `Finset (Finset V)`.
- **Smallest unproved node:** the quotient-free canonical form, stated so that it needs no quotient definition:

  ```lean
  lemma exists_aut_invariant_deficient_of_not_weightedHall (G : SimpleGraph V) [DecidableRel G.Adj]
      (p : ℕ) (h : ¬ WeightedHall G (favorableLeaves G p) p) :
      ∃ X ⊆ indepFamily G (p + 1),
        (∀ γ : G ≃g G, X.image (fun B => B.map γ.toEmbedding) = X) ∧
        (∀ B ∈ X, 0 < activeWeight G (favorableLeaves G p) B) ∧
        ∑ A ∈ (indepFamily G p).filter (fun A => ∃ B ∈ X, transportRel G B A),
            activeWeight G (favorableLeaves G p) A < ∑ B ∈ X, activeWeight G (favorableLeaves G p) B
  ```

  It depends on the unproved (in Lean) node `favorableLeaves_map_aut : (favorableLeaves G p).map γ.toEmbedding =
  favorableLeaves G p`.
- An isolated second read is needed before registration either way.

**Award group 3: a restricted-scope Hall theorem.** None exists in this portfolio. Every Hall-positive result here is a
bounded computation, and a bounded result never qualifies.

**(HALL) itself is NOT Lean-ready.** There is no informal proof at any scope beyond finite rows. The exact open object is
`WeightedHall T (favorableLeaves T p) p` for every `T` with `T.IsTree` (connected and acyclic) and every eligible `p`
(`C5LA1.crossingIndex T + 2 ≤ p`, `3 * p < 2 * T.indepNum + 1`). By the critic-attributed
`weightedHall_iff_exists_saturatingFlow`, this is the same as `lowerRegionTwoForOneWeightedHall`. The Lean interface is
therefore complete: any future informal proof of (HALL-COND) composes to the flow and the sign with no further glue.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

**Material progress.**
- The run's prerequisite Lean target (WID), with both network companions, is compiled sorry-free and axiom-clean. Its
  mathematics is complete at `proved_informal`, and it is contract-ready for a governed award.
- The Hall/flow equivalence and the layer closure of (REL) are compiled (critic-attributed).
- A structural reduction (INV) is proved informally, with canonical invariant cuts (critic-attributed).

These are new lemmas at `proved_informal` or better. No decisive event occurred: (HALL) is neither formally verified nor
refuted by a cut. The stop gate is recorded but not armed until the Cycle 2 close, and none of its conditions is met by
this orientation.

**Adversarial content in the orientation.**
- The small-`CB` family is shown structurally incapable of testing the switch relation.
- The first switch-load-bearing `CB` instance is located: `CB(8,86)`, `p = 460`, `n = 1465`.

Neither is a cut.

## Headline assessment

headline_resolved: no
status: still_open

Per statement, at this orientation's evidence grade:
- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: still open. No proof at any universal scope, and no replayed
  deficient cut. Every computed row saturates, at `bounded_computation`.
- **(WID)**: proved. The complete informal proof is verified by me at full scope (every finite simple graph, every `F` of
  degree-one vertices, `p ≥ 1`), and it is kernel-checked in scratch. It changes OPEN → VERIFIED only through its own
  governed award.
- **(FLOW⇒SIGN)** and **(HALL⇒FLOW)**: proved (`proved_informal`, companions), kernel-checked in scratch.
- **Outcome-B candidate (INV)**, `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`: proved informally and verified by me.
  It is STATED, and its registration awaits an isolated second read. It closes no part of (HALL) by itself; it is a
  reduction.
- **Other outcome-B templates (NMP, SW, REC, BUD)**: none attempted in orientation U.
- **The primary aggregate**: untouched.

## Next-route allocation

**Exact remaining obligation for orientation U.**
- A proof or refutation of (HALL), meaning `WeightedHall T (F_p T) p` on every finite tree at every eligible `p`.
- In the `CB` family the first unsettled question is the first switch-load-bearing row: `CB(8,86)` at `p = 460`, then
  `CB(8,89)` at `p = 476` and `CB(8,92)` at `p = 492`. There, deletion-only Hall fails on the root-plus-arm sector
  (ratio `460/459`), and the (S) exits must carry the deficit `|R_{p−2}|/(p − 1)`.
- `S_d ≀ S_m` orbit quotients of these rows are out of reach: for `d = 8` there are 54 branch types and `m = 86` branches.
- Structurally, the (INV) lemma and the canonical invariant cut reduce any counterexample search to `Aut(T)`-invariant
  families of positive-weight sources. What is missing is a feasibility argument on those.

**Route U-A: `LEAN-WID-AWARD-AND-INV-FORMALIZATION`.**
- Stage 7 closes the WID award with the freeze edits above, and a U seat formalizes award group 2's quotient-free form:
  - `favorableLeaves_map_aut`, `activeWeight_map_aut`, `transportRel_map_aut`;
  - the supermodularity and maximizer-lattice lemmas;
  - `exists_aut_invariant_deficient_of_not_weightedHall`;
  - optionally, (LIFT) in Lean.
- **One-cycle yield:** (WID) `formally_verified`, plus a kernel-checked (INV) lemma ready for a companion or outcome-B
  award after its second read. Formal status is attainable: every node is elementary finite combinatorics.

**Route U-B: `EQUITABLE-PARTITION-LIFT-AND-CB-SWITCH-SECTOR`.**
- Prove an informal lift for **equitable** partitions. These are coarser than group orbits: each member of a source class
  has the same number of arcs into each target class, and weights are constant on classes. A quotient flow spreads
  uniformly to a fractional saturating flow, and max-flow integrality then gives an integral one. This must be proved on
  the face; it is not (LIFT).
- Apply it to the pair-level (not branch-type) structure of the `CB(8,86)`, `p = 460` root-plus-arm sector and its switch
  exits, where the only switches out of the sector insert a choke `u_i` (branch `i` has exactly one support present) or
  insert `s`.
- Compute an exact quotient flow at `p = 460`, and at `p = 476, 492` on `CB(8,89)` and `CB(8,92)`, with brute-force
  validation of the partition's equitability on small `CB`.
- **One-cycle yield:** either the first exact saturation in which the switch arcs are **load-bearing**
  (`bounded_computation`, plus a proved lift lemma at `proved_informal`), or a quotient deficit. A quotient deficit is
  **not** a cut until it is lifted to an invariant `X` and confirmed by two instruments and a second read. Either outcome
  fixes the scope of a (SW) lemma for the T orientation.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-adj-U/`,
standard library only (`PYTHONDONTWRITEBYTECODE=1`). All jobs ran in the foreground, so no background job was started and
none remains.

| artifact | SHA-256 | role |
|---|---|---|
| `seal_check.py` | `bec78f9ab20552a1455d7534f331a0f6f56f8ad4ade49790a2b1b2dd5c5c6b7d` | capsule seal, 20 member digests, Stage 2/3/4 seals |
| `py/adj_instr.py` | `6bcbbd66fdd70a2a7071245f9fdd45f82e5598898c6fd0071595bc674e1ece97` | own instrument: tree test, brute-force independent sets, `x` through `α`, `F_p` on the original tree, literal `w_F` (`(B−v) ∩ (N(s_v)−v)`), literal (D)∪(S), WID asserted, Dinic |
| `py/adj_replay.py` | `2f1d5071578e367dd2c9e75fb4384c3b9472cf6bc0c622f8773a76f84ad97ff2` | fixed points, `CB(1,7)`, witness trees, support-move lemma check, shift witnesses, `CB(1,1)` supermodularity and least-maximizer toy |
| `py/adj_replay.out` | `57111fa6b1c1621cdd68b9b565450b7b0bb4de1ef792096aeb53693bf242ac2e` | output |
| `py/cb_sector_scan.py` | `60c252c0f43a718405319484b0ac652425ef74a1dc80605784cdc9840f0a3303` | `CB` closed form (brute-force validated), sector-deficiency scan, `d < 40`, `n ≤ 1600` |
| `py/cb_sector_scan.out` | `04adac1c6433b17237be04bfcdc7c355ab3eeb0ceb85ec72866464c2e4845408` | output |
| `LeanProject/LeanProof/Main.lean` | `110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743` | copy of U2's working file |
| `LeanProject/LeanProof/AdjCheck.lean` | `d737dfe3df9ed27d0b6ececc1543b9255a6e909a5057e8a2d7a3773338a17c4f` | `#print axioms` on all 18 plus `#check` of four statements |
| `LeanProject/LeanProof/{CriticAdvance,CriticContract,Critic,ContractVerbatim}.lean` | `85725e39…`, `a6b20f8d…`, `bdc144df…`, `2dc9faae…` | critics' files, copied out |
| `lake_build.log` | `5a5a194f3d3d8e97ebab36406b7c80fa6440a6f2562adbf99144abfb3e3fc7bf` | `Build completed successfully (8657 jobs)`; one new-code warning (`hpk2`) |
| `adjcheck.log` | `c08b0e9eab0631710579ac200e09cf83cd88130b746bdc9124005cae2a31247d` | 18 × `[propext, Classical.choice, Quot.sound]`; statements |
| `CriticAdvance.log` / `CriticContract.log` / `Critic.log` | `6f8efa27…`, `a8625c8d…`, `d3004c5a…` | byte-identical to the critics' logs |
| `ContractVerbatim.log` | `98326ac0870c18649007216a8c54a2e3a44fd2ff6b635bf0d3aa321fea344eb8` | four expected errors on the §2 text verbatim |
| `cuf/sweep_summary.py`, `cuf/sweep_1409.out`, `cuf/sweep.out` | `d3aa44aa…`, `f93c80dd…`, `f93c80dd…` | copy-out of C-U1-F's post-seal sweep (115 rows, `SWEEP DONE`) and its summarizer |

`LeanProject/.lake/packages` is a manual symlink to the shared pinned project; `LeanProject/.lake/build` is local build
output.

Replay:

```
cd <scratch>/py && PYTHONDONTWRITEBYTECODE=1 python3 adj_replay.py && PYTHONDONTWRITEBYTECODE=1 python3 cb_sector_scan.py 1600
cd <scratch>/LeanProject && lake build && lake env lean LeanProof/AdjCheck.lean
```

The second Python script takes about 110 s.
