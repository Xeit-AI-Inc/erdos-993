# Critique

Critic `C-U2-F` (orientation F, falsify) on seat `U2`, route `C1-U-02 LEAN-TRANSPORT-SKELETON` (orientation U), r30 Cycle 1 Stage 4.

Boot: I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and no other VerityOS file. Then I read the dispatch
`control/dispatch/c1-stage4/DISPATCH-C-U2-F.md`, the critic protocol, and only the capsule members, the frozen `sources/`
files named below, and U2's inventoried artifacts under `scratchpad/c1-U2/`.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

Read-boundary disclosures (critic's own):
- (a) I wrote a transient diff copy (`concat.lean`, the frozen `Main.lean` plus U2's five draft parts concatenated) into the
  session scratchpad `/private/tmp/claude-501/.../scratchpad/`, outside `scratchpad/c1-crit-U2-F/`. I deleted it. The name-only
  listing that confirmed the deletion showed nine file names I did not create there (e.g. `cb_orbit.py`, `wt16.pid`). I read none of them.
- (b) I did not read `scratchpad/c1-U2-replay/`. It is a sibling of the granted `scratchpad/c1-U2/`, not under it. That leaves U2's
  replay-output digests unverified (see Certification audit). My own copy-out-first rebuild replaces that replay.
- (c) No `find`/`rg`/`ls -R` above the grant, no network, no installs, no `lake update`/`lake clean`. Every `lake`/`lean` call ran
  after `cd` into my pinned scratch project. All jobs ran in the foreground, so no background job was started and none needed killing.

## Identity and seal audit

- **Capsule seal** (`control/c1-critic-capsules/U2-PACKET-MANIFEST.json`): recomputed canonically (manifest minus `seal_sha256`,
  `sort_keys`, separators `(",", ":")`, no trailing newline) = `f44928c61a090f0062874c9cd805c6232e42747305c45232df67a10b188c4542`.
  It matches the dispatch. All 14 members match on SHA-256 and byte count.
- **Stage 4 dispatch seal** `f62b5c6a639104c155f2acebb4b40b5f6379134f490c90edc1601a0b764ac2cc`: recomputed, match.
- **Stage 3 seal** `da784de8567703935e95ea3e452acc151fdbc15a7e20ffd86634ecb87e4f92ac`: recomputed, match.
- **Stage 2 seal** `886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92`: recomputed, match.
- **Return** `cycles/cycle-1/stage3/returns/U2/RETURN.md`: `5a89428f…cde5`, 31247 bytes, matches the capsule.
- **Frozen sources the return lists**: I checked 51 `SOURCE-DIGESTS.json` rows (all of `sources/first-interior/c2-primary-v2/LeanProject/**`,
  including the 45 `Snippets/` fragments, plus `sources/mathlib-binding/PIN.json`) against the files on disk. All 51 match.
  `Main.lean` = `8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9`.
- **U2's scratch artifacts** (my digests): working `LeanProject/LeanProof/Main.lean` `110c2751…2743` (matches the return);
  `THEOREM-CONTRACT-draft-WID.json` `3d47a0e6…8f44` (matches the return). The draft parts 1–5 are
  `e32e4cbc…`, `74827559…`, `ad6e083e…`, `f2b7b90d…` and `4595857c…`.
- **Carried prefix**: the first 1494 lines / `wc -c` bytes of U2's working `Main.lean` hash to `8d864da2…a7d9`. The 45 carried
  entries are **byte-identical** to the frozen source.
- **Mathlib pin**: `git rev-parse HEAD` of the shared package = `905b95818eb32af7874a58b427f50c1711a5e96c`, which equals `PIN.json`.
  Toolchain `leanprover/lean4:v4.32.2`. `lakefile.toml`, `lake-manifest.json`, `lean-toolchain` and `LeanProof.lean` were copied
  byte-identically; the digests match the frozen ones.
- **Claim identity**: keys touched are `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (WID, OPEN run-local) and
  `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (HALL, OPEN; only named, never stated in Lean). The primary aggregate
  `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` is untouched. U2 mints no new `E993-R30-…` candidate. Its lexical and
  mathematical alias check of WID against DCB and TSB is correct: WID is an equality on every finite simple graph, has no
  bipartite or `h ≥ α` hypothesis and no `C`/`D` terms. Grades: U2 claims none and correctly states that a compiled scratch
  declaration has no grade.
- Seat model: the return discloses "chartered sonnet/xhigh … `claude-sonnet-5`", which agrees with `C1-ALLOCATION.md` (routes Claude Sonnet 5 xhigh).

## Independent re-derivation

**Instrument 1: Lean rebuild, copy-out-first** (`scratchpad/c1-crit-U2-F/LeanProject/`)
- Setup: frozen project files, then `Main.lean` = frozen `Main.lean` followed by U2's `drafts/e993transport_part{1..5}.lean`, in
  order (`bb018442…8279`). `.lake/packages` is a manual symlink to the shared pinned project.
- Build: `lake build` gives `Build completed successfully (8657 jobs)`, 0 errors (`build1.log`).
- Axioms: I ran `#print axioms` on **all 18** new `E993Transport` declarations (`Check.lean` → `check1.log`), not just the seven
  in the return. Every one reports exactly `[propext, Classical.choice, Quot.sound]`.
- Forbidden tactics and axioms: a grep of the appended code (lines > 1494) finds no `sorry`, `admit`, `native_decide`, `axiom`
  or `decide`.
- Printed statements: `#check`/`#print` on the terminal theorem, the three companions and the four network definitions give the
  statements quoted in the Attacks section.

**Instrument 2: my own Python evaluator** (`py/wid_instrument.py`, standard library, exact integers)
- It is built from SEMANTIC-CONTRACT §1.2, not from U2 (which ships no numerics) and not from the controller prerun (not read).
- It checks the tree property (acyclic and connected), computes `x` through rank `α`, and checks eligibility.
- `F_p` comes from `Δ_p(T − v)` on the original tree at rank `p`. The weight `w_F` is literal: a tag `v ∈ F ∩ B` is active iff
  `(B ∖ {v}) ∩ W_v ≠ ∅`. The relation is (D) ∪ (S), literal.
- `supply − capacity = S` is asserted on every instance, and exact max-flow is run with Dinic.
- Output `py/wid_output.txt` (`77bb71c7…b310`). Grade: `bounded_computation`.

| instance | n | α | x | p | \|F\| | supply | capacity | S | flow | arcs |
|---|---|---|---|---|---|---|---|---|---|---|
| `K_{1,12}` | 13 | 12 | 6 | 8 | 12 | 1980 | 3960 | −1980 | 1980 (sat.) | 1980 |
| path-star `(2,3,4)` | 15 | 11 | 5 | 7 | 10 | 1483 | 2701 | −1218 | 1483 (sat.) | 2025 |
| path-star `(2,2,4,3)` | 18 | 13 | 6 | 8 | 12 | 8033 | 13467 | −5434 | 8033 (sat.) | 11691 |

All three fixed points reproduce exactly, including the arc counts. In my count every (REL)-image of a positive-weight source
has positive weight, so "arcs" means positive-to-positive arcs here.

Further checks in the same run:
- **(WID), general form**: asserted on 5,842 `(G, F, p)` instances with `p ≥ 1`. `G` ranges over random simple graphs (not
  trees) with `n ≤ 11` and forced pendant vertices; `F` is an arbitrary subset of the degree-one vertices. No failure.
- **Trees**: asserted on 2,273 random-tree `(T, p)` rows (all `p ∈ [1, α]`, `F = F_p(T)`). No failure.
- **Mathematics**: I re-derived WID by hand. Fix a leaf `v ∈ F` and `j ≥ 1`. The map `B ↦ B ∖ {v}` sends
  `{B ∈ I_j : v ∈ B, (B ∖ {v}) ∩ W_v ≠ ∅}` bijectively onto `{A ∈ I_{j−1}(H_v) : A ∩ W_v ≠ ∅}`, because `s_v ∉ B` and
  `N(v) = {s_v}`. The second set is `taggedFamily (univ ∖ H_v) R_v (j−1)`, since `A ∩ R_v = A ∩ W_v` when `A` avoids `v` and
  `s_v`. By `tagged_count_split`, its size is `q_v(j−1)`. Double counting gives `Σ_{I_j} w_F = Σ_{v∈F} q_v(j−1)`, and
  differencing at `j = p+1, p` gives WID.
- **Grade**: I judge the WID mathematics complete (`proved_informal` at statement level). It is also kernel-checked in scratch;
  that has no grade until the Stage 7 award.
- **(FLOW⇒SIGN) and (HALL⇒FLOW)**: re-derived. The first is the supply and capacity sums plus WID. The second is Hall's theorem
  on the clone expansion: a clone set `A` over source set `X` has `|A| ≤ Σ_X w`, and its neighbourhood is exactly the clone set
  of `N(X)`, of size `Σ_{N(X)} w`. U2's proof has exactly this shape.

## Attacks and findings

**Findings that affect the mathematics: none.** Each attack below was tried and failed against the compiled text.

1. **`activeWeight` fidelity.** `#print` gives `{v ∈ F ∩ B | ¬Disjoint (B.erase v) (tagWitnesses G v)}.card`, with
   `tagWitnesses G v = (G.neighborFinset (support G v)).erase v`. This is exactly `(B ∖ {v}) ∩ W_v ≠ ∅`, i.e. "another neighbour
   of `s_v` lies in `B`". My compiled lemma `active_iff_other_neighbour` makes this explicit:
   `¬Disjoint (B.erase v) (tagWitnesses G v) ↔ ∃ w ∈ B, w ≠ v ∧ G.Adj (support G v) w`. The weight is not `|F ∩ B|` and not
   `1 + #private leaves present`.

2. **`transportRel` fidelity.** `#print`:
   `(∃ q ∈ B, A = B.erase q) ∨ ∃ u ∉ B, (G.neighborFinset u ∩ B).card = 2 ∧ A = insert u (B \ G.neighborFinset u)`.
   - This is (D) ∪ (S) literally: exactly two neighbours, `u` new, no "two arbitrary deletions".
   - `insert u` never collides with an element of `B \ N(u)` because `u ∉ B`.
   - **Critic-derived (closes U2 fidelity note 1):** compiled lemma `E993TransportCritic.transportRel_mem_indepFamily`.
     If `B ∈ indepFamily G (p+1)` and `transportRel G B A`, then `A ∈ indepFamily G p`.
   - This matters for `WeightedHall`, whose `N(X)` is filtered through `indepFamily G p`. If an image could leave the layer, the
     Lean `N(X)` would silently drop it and the Lean condition would be stronger than the charter's. The lemma proves the filter
     drops nothing, so the Lean `N(X)` is exactly the charter's `N(X)`. The same holds for the support clause of
     `IsSaturatingFlow`.

3. **`favorableLeaves` / fixed rank.**
   - `(C5LA1.leafSet G).filter fun v => C4LA1.IsFavorableAt G v p` uses entry 3 at the single argument `p`: the original rank
     and the original graph, since `vertexDeletionIndepSetCount` counts subsets of `univ.erase v` in `G`.
   - `activeWeightAggregateIdentity` fixes `F := favorableLeaves G p` at both layers `p+1` and `p`, so there is no re-selection.
   - The closing `rfl` against `C5LA1.aggregate` is sound. Both filters are the same classical filter of entry 13's form, and the
     kernel accepted it.

4. **`card_active_eq_tagged` (read in full).**
   - It uses `E993Interior.Leaf.support_adj` and `.leaf_insert_indep` directly. `support_unique` is used only transitively,
     inside `leaf_insert_indep`.
   - The inverse `A ↦ insert v A` lands in `indepFamily G j`. Cardinality comes from `card_insert_of_notMem` plus `hAcard` and
     `omega`; this is the one place `hj : 1 ≤ j` is used, for `(j−1)+1 = j`. Independence comes from `leaf_insert_indep`, and
     activity from `R_v ∖ {s_v} ⊆ W_v` once `w ≠ v`.
   - The forward direction does not need `hj`. The return's account is accurate.

5. **`exists_saturatingFlow_of_weightedHall` (read in full).**
   - Clones: `α = Σ B, Fin (wSrc B)` and `β = Σ A, Fin (wTgt A)`, with weights zeroed off-layer.
   - Hall: `Fintype.all_card_le_filter_rel_iff_exists_injective` (verified at `Mathlib/Combinatorics/Hall/Basic.lean:196`). It
     is fed the hypothesis `h X hXsub`, with `X := A.image Sigma.fst`. That is exactly `WeightedHall` at a subfamily of
     `indepFamily G (p+1)`, and the proof uses no other instance of the hypothesis.
   - The flow is `#{x | x.1 = B ∧ (f x).1 = A}`. It is integral; it is supported on arcs because `f` respects `r`; saturation
     follows by fibrewise counting; capacity holds because `f` is injective.
   - No circularity: the theorem assumes `WeightedHall`, and nothing about trees or `S` enters.

6. **`aggregate_nonpos_of_saturatingFlow`.** It uses only `activeWeightAggregateIdentity` and the saturation and capacity
   clauses. The support clause is discarded (`obtain ⟨-, hsat, hcap⟩`). Confirmed.

7. **ℕ-subtraction.**
   - `p − 1` is guarded by `hp : 1 ≤ p` in the general form, and `j − 1` by `hj`.
   - **Critic-derived:** in the *terminal* theorem the guard is not needed. I compiled
     `E993TransportCritic.activeWeightAggregateIdentity_unguarded`, which is the same statement without `hp`. At `p = 0`:
     - `F_0(G) = ∅` on every graph (`favorableLeaves_zero`), because a leaf has a neighbour `u ≠ v`, so
       `i_1(G − v) ≥ 1 ≥ i_0(G − v)`.
     - Hence both sides are 0.
   - The general-`F` form does need the guard. My instrument finds its `p = 0` right side (`= Σ_{v∈F} |W_v|` under ℕ truncation)
     nonzero on 1,034 of 1,407 random graphs, while the left side is 0 (compiled `layerWeight_one`: `layerWeight G F 1 = 0`).

8. **Keyword and signature deviations. The attack brief asked me to confirm that the disclosed swap is the *only* deviation; it is not.**
   Differences between U2's text and the SOLUTION-CONTRACT §2 drafts:
   - (i) `layerWeight_sub_eq_sum`: `theorem` for `lemma` — disclosed.
   - (ii) `exists_saturatingFlow_of_weightedHall` is also declared `theorem`, where the contract has `lemma` — **undisclosed**.
   - (iii) `layerWeight_sub_eq_sum` takes `(G …)` explicitly where the contract has `{G …}`. This is disclosed only
     generically, as "implicit/explicit argument style".
   - (iv) `noncomputable` has been added to `tagWitnesses`, `activeWeight`, `layerWeight` and `favorableLeaves`, and
     `open scoped Classical` has been added to the section.

   Deviation (iv) is **required**. My probe `LeanProof/ContractVerbatim.lean` (`contract_verbatim.log`) compiles the §2
   definitions verbatim and fails with four errors:
   - `tagWitnesses` and `activeWeight` fail with "depends on noncomputable `C5LA1.support`".
   - `favorableLeaves` fails with "failed to synthesize `DecidablePred fun v => C4LA1.IsFavorableAt G v p`".
   - `WeightedHall` fails with "failed to synthesize `DecidablePred fun A => ∃ B ∈ X, transportRel G B A`".

   **This is a finding against the contract text, not against the seat.** Stage 7 must freeze `expected_statement` from compiled
   text, not from §2 verbatim. The terminal `activeWeightAggregateIdentity` matches the §2 signature exactly (explicit `G`, `p`, `hp`).

9. **Contract prose erratum (critic-derived, falsification; affects every future reader, not U2's Lean).**
   - SEMANTIC-CONTRACT §1.2 asserts: "`s_v ∉ B`, so `(B ∖ {v}) ∩ W_v = B ∩ N(s_v)`". That is **false**. `v ∈ N(s_v)`, so
     `B ∩ N(s_v)` always contains `v`. The correct identity is `(B ∖ {v}) ∩ W_v = (B ∩ N(s_v)) ∖ {v}`.
   - Consequently the §3 convention "'Active tag' means `v ∈ F ∩ B` with `B ∩ N_T(s_v) ≠ ∅`", read literally, and the same
     parenthetical in the critic protocol's duty 2, make **every present tag active**. That collapses `w_F` to `|F ∩ B|`, which
     is the struck C6-F5/C6-U5 weight.
   - Lean proof: `E993TransportCritic.prose_test_always_true`. For a leaf `v ∈ B`, `¬Disjoint B (N(support v))`.
   - Numerical proof: under the literal-prose weight, my instrument gives supply−capacity **−1406** on path-star `(2,3,4)` and
     **−6717** on `(2,2,4,3)`. These are exactly the struck C6-F5 values quoted in `C1-ALLOCATION.md` item 4. It is `−1980` on
     `K_{1,12}`, where the two weights coincide.
   - The common brief's wording ("whose support has another neighbour in `B`") and the Lean `activeWeight` are correct.
   - I recommend recording this as a controller erratum candidate. Stage 7's informal statement must use `(B ∖ {v}) ∩ W_v` or
     "another neighbour", never `B ∩ N(s_v)`.

10. **The draft contract `THEOREM-CONTRACT-draft-WID.json`.** It is defective as a Stage 7 input:
    - (a) It has **no `expected_statement` field**, so the brief's check cannot be run.
    - (b) `terminal_theorem.signature_deviation_from_draft` says "G and p are explicit arguments here (the draft used
      `{G : SimpleGraph V}` implicit)". That is false for the terminal theorem, whose draft already has explicit `G` and `p`.
      The explicit/implicit deviation belongs to the companion `layerWeight_sub_eq_sum`.
    - (c) `hp_guard` says "without it … the identity is false at p = 0". That is false for the terminal theorem (attack 7) and
      true only for the general-`F` form.
    - (d) The `definitions` list omits `C5LA1.leafSet`, `C4LA1.IsFavorableAt`, `C4LA1.IsGraphLeaf`,
      `C4LA1.vertexDeletionIndepSetCount/ForwardDifference`, `C5LA1.indepSetCount`, `transportRel`, `IsSaturatingFlow` and
      `WeightedHall`.
    - (e) Several `dependencies: []` are wrong: `favorableLeaves` → entries 3 and 6; `forwardDifferenceDel` → 11 → 10;
      `support` → 4.

11. **Carry plan.**
    - The return places the helper lemmas at "entries 41–42's block, lines 981–984, 991–1002, 1004–1023, 1045–1084". Every one of
      those lines lies inside **entry 42** (lines 962–1177). Entry 41 is not needed.
    - `support_adj` also needs `support_spec` (line 967), which is in the same fragment.
    - The members are `private`, which is module-scoped in Lean 4, so the whole of fragment 42 must travel. It also brings the
      public `E993Interior.highTailAggregateFromShadow` into the award source.
    - I checked fragment 42's external references. They are only `C4LA1.IsGraphLeaf`, `C5LA1.{support, H, R, indepSetCount,
      indepSetsAvoiding, forwardDifferenceDel, aggregate}` and `E993Interior.taggedFamily`, so it is self-contained over entries
      1–14 and 18.
    - Exact carry for the WID award: entries 1–6, 8–13 and 18 (7 and 14 are harmless extras; 15–17 are unused), plus fragment 42
      whole.
    - Alternative: re-prove the four helpers publicly in `E993Transport` and drop fragment 42.

12. **Attempting the open step (critic-derived advance).**
    - U2 leaves open the converse companion, flow ⇒ (HALL-COND). I compiled
      `E993TransportCritic.weightedHall_of_saturatingFlow` and `weightedHall_iff_exists_saturatingFlow`: for every finite simple
      graph, every tag set `F` and every `p`, `WeightedHall G F p ↔ ∃ f, IsSaturatingFlow G F p f`.
    - Axioms `[propext, Classical.choice, Quot.sound]`; `critic_final.log`.
    - The proof: a flow row is supported on `N(X)` by the support clause, then `Σ_X w = Σ_X Σ_{N(X)} f ≤ Σ_{N(X)} Σ_{I_{p+1}} f
      ≤ Σ_{N(X)} w`.
    - This makes (HALL) and (HALL-COND) interchangeable at kernel level. Any future deficient cut is then a formal refutation of
      flow existence, and any flow is a formal proof of Hall.
    - (HALL) itself is not attempted by me or by U2. My three saturating fixed-point flows are `bounded_computation` and prove nothing universal.

## Mechanism-equivalence and fence check

- U2 proposes no transport mechanism. WID is an identity on every finite simple graph, and FLOW⇒SIGN and HALL⇒FLOW are generic
  network facts. None is one of the ten refuted keys or the C6-F4 own-support rule under new notation.
- It is not deletion-only Hall: `transportRel` carries the (S) arcs and the weight is active-tag. It is not the literal
  Delete/Retag relation, and no capacity rule is proposed.
- No closed region is re-proved. No census value, RTree wording, (LIFT) or `D, C ≥ 0` appears anywhere. The controller prior is
  not used.
- The FLOW⇒SIGN companion is exactly the §1.2 consequence at `X = I_{p+1}` and no more. The mechanism ≠ aggregate fence holds:
  nothing states `S ≤ 0` unconditionally.
- My critic lemmas are companions or erratum demonstrations, not new keys:
  - `weightedHall_iff_exists_saturatingFlow` is the (HALL⇒FLOW) companion plus its converse. It is a companion `lemma`
    (R29-N-12), with no certificate of its own.
  - `activeWeightAggregateIdentity_unguarded` is the same key, (WID), at a trivially stronger statement. It is an alias, not a new key.
  - `transportRel_mem_indepFamily` is a fidelity lemma for the eventual (HALL) contract.

## Certification audit

Backed by my replay:
- The 45 carried entries are byte-identical.
- Zero `sorry`/`admit`/`native_decide`/`axiom` in the new code.
- "18 new declarations total": counted, 10 + 2 + 4 + 1 + 1.
- All seven `#print axioms` rows in the return; all 18 are clean.
- "Build completed successfully (8657 jobs)".
- The pinned Mathlib revision.
- All 13 cited Mathlib `file:line` locations, spot-checked; each names the stated declaration. `Finset.card_bij'` is cited but unused.
- The seal `886ece6b…` and the nine source digests.

Struck or corrected:
- **S1**: the claim that `110c2751…` is "this exact byte sequence: the frozen 45-entry source, then the five …partN.lean files
  … concatenated in order 1–5" is struck as stated. That concatenation is `bb018442…8279` (1902 lines). `110c2751…` is the same
  bytes minus the final newline. The return's later Replays note discloses this; the first sentence is wrong.
- **S2**: "warnings only (all pre-existing, in the carried entries — none in the new `E993Transport` code)" is struck. The rebuild
  emits `LeanProof/Main.lean:1704:46: This simp argument is unused: hpk2` inside `layerWeight_sub_eq_sum`. It is a linter
  warning and harmless.
- **S3**: the fidelity-notes implication that the `theorem`/`lemma` swap on `layerWeight_sub_eq_sum` is the only keyword
  deviation is corrected. `exists_saturatingFlow_of_weightedHall` also deviates.
- **S4**: the draft-contract literals `statement_matches_contract_draft`, `signature_deviation_from_draft` and `hp_guard`, and the
  dependency lists, are corrected (attack 10).
- **S5**: "entries 41–42's block" is corrected to entry 42 only (attack 11).
- **Unverified (not struck)**: the replay-output digests `1a02b4ff…` (`verify_output.txt`) and `8d9372bd…`
  (`full_replay_output.txt`). They live in `scratchpad/c1-U2-replay/`, outside my grant, and stand only as self-reports. My own
  rebuild covers the same claims.

## Verdict

verdict: retained_narrowed
headline_resolved: no

**What is retained:**
- The compiled, sorry-free, axiom-clean scratch declarations `layerWeight_sub_eq_sum` (WID, general form),
  `activeWeightAggregateIdentity` (WID at `F_p`), `aggregate_nonpos_of_saturatingFlow` (FLOW⇒SIGN) and
  `exists_saturatingFlow_of_weightedHall` (HALL⇒FLOW).
- Each is re-verified by an independent rebuild and read against SOLUTION-CONTRACT §2. The definitions match the charter's
  meaning; the §2 draft text itself does not compile verbatim.
- I judge the WID mathematics complete (`proved_informal`, statement level). Its kernel check awaits the governed Stage 7 award.

**Narrowed:**
- Certification literals S1–S5 are struck or corrected.
- `THEOREM-CONTRACT-draft-WID.json` is not an admissible Stage 7 input as shipped (attack 10).

**Critic-derived, compiled scratch, no grade:**
- The Hall/flow equivalence.
- Layer closure of (REL).
- The unguarded terminal WID.
- The SEMANTIC-CONTRACT prose erratum (`B ∩ N(s_v) ≠ ∅` always holds for a present leaf), with Lean and numeric demonstration.

## Remaining obligation

1. **Stage 7 (WID award).** Freeze `expected_statement` from the compiled text of `activeWeightAggregateIdentity`, which matches
   §2's signature. Then:
   - carry entries 1–6, 8–13 and 18 plus fragment 42 whole, or re-prove its four helpers publicly;
   - mint entries 46+ through the registrar;
   - rename `layerWeight_sub_eq_sum` and `exists_saturatingFlow_of_weightedHall` to `lemma`, and remove the unused `hpk2`;
   - rebuild the draft contract with complete definitions and dependencies and a correct `hp` note.
2. **Controller erratum.** Correct SEMANTIC-CONTRACT §1.2's "`(B ∖ {v}) ∩ W_v = B ∩ N(s_v)`" and the §3 / protocol duty-2 phrase
   "`B ∩ N(s_v) ≠ ∅`" to "`(B ∩ N(s_v)) ∖ {v} ≠ ∅`" (another neighbour of `s_v` in `B`).
3. **Optional companions.** Consider carrying the critic companions (`weightedHall_iff_exists_saturatingFlow`,
   `transportRel_mem_indepFamily`) on the WID award's face, or keep them for the (HALL) award.
4. **(HALL) remains OPEN and wholly untouched.** No Lean statement, no proof, no cut. The exact open object is `WeightedHall T
   (favorableLeaves T p) p` for every tree `T` and eligible `p`, which by the equivalence is the same as the existence of a
   saturating flow.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-crit-U2-F/` (SHA-256):
- `seals.py` `9bf73f07f3d99b7b33b5c95f42825011d19438d03075fb99567480341c8593d2`: capsule, Stage 2/3/4 seals, member digests.
- `LeanProject/` (frozen project files byte-copied; `.lake/packages` is a manual symlink to the shared pinned project):
  - `LeanProof/Main.lean` `bb018442662aee3485302b6d26ba61d4d5f87ec9031ea354c042f14016718279`: frozen source plus U2 parts 1–5.
  - `LeanProof/Check.lean` `4ee95ea6afe84bcb4e2735c70411b438d9b5b626a2a70e62ea685eb789a7efda`: `#print axioms` on all 18, plus statement prints.
  - `LeanProof/Critic.lean` `bdc144dfe55d3c4f60f48b8f6c4a63eb70373230358cfdfa539c1eb3885e787f`: nine critic declarations, no sorry, axioms clean.
  - `LeanProof/ContractVerbatim.lean` `2dc9faaef500863446aff3894930d25b089f00e8af53a0e853742b21eae104b9`: §2 verbatim probe (fails, by design).
- Logs:
  - `build1.log` `01ef8c9f0bfc055d613f4b9c4ea548ec4a96848d48c5a2040b9bc6567f639a3a`
  - `check1.log` `0ce7fa13a9efebd062d31ef0eba4397482107c4c15331e5754487c8f18443dae`
  - `critic_final.log` `d3004c5a2625223d8096d2e1c9aa3cd3cebbf1d3d307eb312a94b8c9744f0c57`
  - `contract_verbatim.log` `98326ac0870c18649007216a8c54a2e3a44fd2ff6b635bf0d3aa321fea344eb8`
- Python:
  - `py/wid_instrument.py` `09ffb8e67b354f6202d03bb7bcdf41bceeee8d46fc2873fa21d9aaaf1e1eb7a4`: own evaluator (standard library).
  - `py/wid_output.txt` `77bb71c75e041c6c091f86f079cfe5ce82034905c4efd7140a07fc4e928cb310`: fixed points, WID checks, p = 0 check, prose-weight values.

Replay:
```
cd <run root>/scratchpad/c1-crit-U2-F && python3 seals.py && python3 py/wid_instrument.py
cd LeanProject && lake build && lake env lean LeanProof/Check.lean && lake env lean LeanProof/Critic.lean
```

No background jobs were started; none remain.
