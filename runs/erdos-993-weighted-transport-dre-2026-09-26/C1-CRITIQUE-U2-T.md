# Critique

Critic `C-U2-T` (orientation T, prove) on the seat `U2` return, route `C1-U-02 LEAN-TRANSPORT-SKELETON`, r30 Cycle 1 Stage 4.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The tool display truncated the middle of `verity.md`, and I read
the startup protocol through Step 7A. No other VerityOS file was read. The harness injected the project `CLAUDE.md` and the user
auto-memory index into context before my first action; I did not open either, and nothing from them is used as evidence.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Capsule seal.** `control/c1-critic-capsules/U2-PACKET-MANIFEST.json`: stored `f44928c61a090f0062874c9cd805c6232e42747305c45232df67a10b188c4542`.
  I recomputed it as SHA-256 over compact key-sorted JSON without `seal_sha256`, with no trailing newline. The value is identical.
  All 14 member files match their listed SHA-256 digests and byte counts (0 bad). One of them is the return,
  `cycles/cycle-1/stage3/returns/U2/RETURN.md`, at `5a89428f…41d5cde5`, 31247 bytes.
- **Stage 4 dispatch seal.** `control/C1-STAGE4-DISPATCH-MANIFEST.json`: `f62b5c6a639104c155f2acebb4b40b5f6379134f490c90edc1601a0b764ac2cc`. It recomputes identically.
- **Stage 3 seal.** `control/C1-STAGE3-PACKET-MANIFEST.json`: `da784de8567703935e95ea3e452acc151fdbc15a7e20ffd86634ecb87e4f92ac`. It recomputes identically.
  Its U2 return digest `5a89428f…` equals the capsule's. I did not hash the manifest's other members (sibling returns, dispatches)
  because they are outside my read grant.
- **Stage 2 seal.** `control/C1-STAGE2-PACKET-MANIFEST.json`: `886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92`. It recomputes identically.
- **Source digests the return relies on.** I checked every `control/SOURCE-DIGESTS.json` entry under
  `sources/first-interior/c2-primary-v2/` and `sources/mathlib-binding/`: 70 files, 0 mismatches. This covers the frozen
  `Main.lean` at `8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9`.
- **Pin.** `sources/mathlib-binding/PIN.json` gives toolchain `v4.32.2` and Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`.
  `git rev-parse HEAD` in the shared `.lake/packages/mathlib` returns the same revision. U2's `lakefile.toml`,
  `lake-manifest.json`, `lean-toolchain` and `LeanProof.lean` are byte-identical (`cmp`) to the frozen first-interior project.
- **Shipped artifacts (digests recomputed).**
  - `scratchpad/c1-U2/LeanProject/LeanProof/Main.lean` is `110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743`, 1901 lines, as claimed.
  - `THEOREM-CONTRACT-draft-WID.json` is `3d47a0e6…b7778f44`, as claimed.
  - Drafts `part1..5` are `e32e4cbc…`, `74827559…`, `ad6e083e…`, `f2b7b90d…`, `4595857c…`.
  - The return does not inventory two files that are present: `LeanProof/Main.lean.bak1` (`2299ab1f…`, 1558 lines, an intermediate
    backup) and `LeanProof/Check.lean` (`a8c96d08…`, seven `#print axioms` lines). Neither is a `.lean` module of the library, so
    neither affects the build. Both should be named in the award workflow's file list or removed from any award capsule.
- **Carried prefix.** The first 61296 bytes of U2's `Main.lean` are byte-identical to the frozen `Main.lean` (`8d864da2…`), so all
  45 entries carry byte-identically.
  - The appended tail equals the concatenation of `part1..5` **minus the final newline**. The exact concatenation hashes to
    `bb018442662aee3485302b6d26ba61d4d5f87ec9031ea354c042f14016718279` (1902 lines). That is the digest U2 disclosed for its replay
    rebuild, so the two digests reconcile: they differ by one trailing newline.
  - The return's literal "this exact byte sequence: the frozen 45-entry source, then the five … files … concatenated" is therefore
    off by that one byte. It is corrected here; the discrepancy is harmless.
- **Read-boundary disclosures filed at Stage 3.** U2 filed none. The controller's record repeats U2's process note: new
  declarations were not minted through the registrar, and the `theorem`/`lemma` keyword differs.
- **Claim identity.**
  - (WID) is `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (run-local, OPEN).
  - (HALL) is `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN). It is untouched and keeps its master name.
  - The primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` is untouched.
  - The return's lexical and mathematical alias check of (WID) against (DCB) and (TSB) is correct: (WID) is an unconditional
    equality of layer sums on any finite simple graph; (DCB) is an extension-accounting identity with correction terms; (TSB) is a
    bipartite inequality.
  - The companions (FLOW⇒SIGN) and (HALL⇒FLOW) carry no keys (ruling R29-N-12), and the return does not mint any.
  - The return mints no `E993-R30-…` candidate.

## Independent re-derivation

**(1) Mathematics of (WID), re-derived by hand from SEMANTIC-CONTRACT §1.1–1.2.**
Fix a degree-one vertex `v` with support `s`, write `W_v = N(s) ∖ {v}`, and take `j ≥ 1`.

- Suppose `B ∈ I_j` has `v ∈ B` and `(B ∖ {v}) ∩ W_v ≠ ∅`. Independence and `v ~ s` force `s ∉ B`. So `A = B ∖ {v}` is an
  independent `(j−1)`-set avoiding `H_v = {v, s}`.
- `A` meets `R_v = N[s]`: on sets avoiding `{v, s}`, meeting `R_v` is the same as meeting `W_v`.
- Conversely, take `A ⊆ V ∖ H_v` independent of size `j − 1` and meeting `R_v`. Then `A ∪ {v}` is independent, because the only
  neighbour of `v` is `s ∉ A`. It has size `j` because `v ∉ A`, and `v` is active in it.
- So `#{B ∈ I_j : v active in B} = |taggedFamily(V ∖ H_v, R_v, j − 1)| = i_{j−1}(H_v) − i_{j−1}(R_v) = q_v(j−1)`. The middle
  equality is the carried `tagged_count_split` with `H_v ⊆ R_v`.
- Double counting the pairs (tag, source) gives `Σ_{B∈I_j} w_F(B) = Σ_{v∈F} q_v(j − 1)`. Taking the difference at `j = p+1` and
  `j = p` gives `Σ_{v∈F} [q_v(p) − q_v(p−1)]`, which is the carried summand `forwardDifferenceDel(H_v, p−1) − forwardDifferenceDel(R_v, p−1)`.
- The only ℕ guard is `p ≥ 1`, so that `(p−1)+1 = p`.
- At `p = 0`: `I_1` has weight 0 (a singleton has no witness) and `I_0` has weight 0. The ℕ-truncated right side is
  `Σ_{v∈F} (|R_v| − 2) = Σ_{v∈F} |W_v|`, so the identity fails at `p = 0` exactly by `Σ_F |W_v|`. The guard is necessary, and
  the draft contract's `hp_guard` sentence is correct when read as "false at `p = 0` whenever some tag has `|W_v| ≥ 1`".

The statement is correct at full scope. In my judgment the mathematics of (WID) is complete at `proved_informal`. It becomes
`formally_verified` only through its governed award (SOLUTION-CONTRACT §3.9, §4).

**(2) Own instrument.** `scratchpad/c1-crit-U2-T/py/wid_check.py` (standard library, exact integers) is written from the contract.
It does not use U2's scripts; U2 shipped no numeric generator.

- Graph handling: it enumerates independent sets directly, tests the tree property (acyclicity and connectivity), computes `α`,
  and computes `x` through rank `α` with the terminal zero-extension difference.
- Tags and weights: `F_p` comes from `Δ_p(T − v) < 0` on the original tree. The weight is the literal active-tag `w_F`, never `|F ∩ B|`.
- Relation: literal (D) ∪ (S). It asserts that every arc lands in `I_p`.
- Flow: exact integer Dinic max-flow, for the mixed relation and separately for deletion only.
- It asserts `supply − capacity = S` both with integer `p − 1` and with Lean's ℕ-truncated `p − 1`.

Fixed points (all eligible; `bounded_computation`, which checks the instrument and proves nothing):

| instance | n | α | x | p | \|F\| | supply | capacity | S | arcs | max-flow (mixed / deletion-only) |
|---|---|---|---|---|---|---|---|---|---|---|
| `K_{1,12}` | 13 | 12 | 6 | 8 | 12 | 1980 | 3960 | −1980 | 1980 | 1980 / 1980 |
| path-star (2,3,4) | 15 | 11 | 5 | 7 | 10 | 1483 | 2701 | −1218 | 2025 | 1483 / 1483 |
| path-star (2,2,4,3) | 18 | 13 | 6 | 8 | 12 | 8033 | 13467 | −5434 | 11691 | 8033 / 8033 |
| double broom, order 11 (R30-E-a) | 11 | 9 | 4 | 6 | 9 | 255 | 516 | −261 | 277 | 255 / 255 |

The `i_k` and `Δ_k` rows are stored in `py/wid_results.json`. All the common-brief fixed points reproduce.

The general form of (WID) was checked on 1370 random `(G, F, p ≥ 1)` instances: arbitrary simple graphs of order 3–11 (non-trees
included) with random subsets of the degree-one vertices as `F`. There were 0 failures. At `p = 0` the identity failed on 193
instances, and on every instance the defect was exactly `Σ_F |W_v|`, as derived in (1).

**(3) Lean rebuild, copy-out-first.**

- Project: `scratchpad/c1-crit-U2-T/LeanProject/`. The four seed files come from `sources/first-interior/c2-primary-v2/LeanProject/`
  and `Main.lean` is U2's `110c2751…`. `.lake/packages` is bound by manual `ln -sfn` to the pinned shared project.
- Command: `cd` into the project, then `lake build` (no `lake update`, no `lake clean`).
- Result: `Build completed successfully (8657 jobs)`, exit 0; `LeanProof.Main` built in 31 s. The log is `build.log` (`f3bad0a3…`).
- `#print axioms` on **all 18** new declarations (the brief asks for all 18; U2's table covers 7) gives
  `[propext, Classical.choice, Quot.sound]` for every one (`critic_advance_output.txt`).
- The new code (lines 1495–1901) contains no `sorry`, `admit`, `native_decide`, `decide`, `axiom` or `set_option`.

**(4) Reading each statement against SOLUTION-CONTRACT §2.** I transcribed the contract's definitions **verbatim** into
`LeanProof/CriticContract.lean`, namespace `ContractDraft`. I added only `noncomputable section`, plus `open Classical in` before
`favorableLeaves` (see finding F1). Then I proved agreement with U2's definitions:

- `indepFamily`, `activeWeight` and `layerWeight` agree by `unfold; congr`. The only possible difference is the choice of
  decidability instance.
- `tagWitnesses` and `favorableLeaves` agree by `rfl`, and `transportRel` by `Iff.rfl`.

I also restated the contract's exact binder text for all four propositions and discharged each with U2's declaration:
`layerWeight_sub_eq_sum` with the contract's implicit `{G}`, `activeWeightAggregateIdentity`, `aggregate_nonpos_of_saturatingFlow`,
and `exists_saturatingFlow_of_weightedHall`. The file compiles with exit 0 and no errors or warnings.

On the brief's specific questions:

- **`activeWeight`** filters `F ∩ B` by `¬ Disjoint (B.erase v) (tagWitnesses G v)`. That is exactly `(B ∖ {v}) ∩ W_v ≠ ∅` with
  `W_v = N(s_v).erase v`. It is not `|F ∩ B|` and not `1 + #private`.
- **`favorableLeaves`** is `leafSet.filter (IsFavorableAt G v p)` at the single argument `p`. It is definitionally the filter
  inside `C5LA1.aggregate` (the `rfl` in `activeWeightAggregateIdentity` goes through). `F` is fixed at the original rank.
- **`transportRel`** case (S) is `u ∉ B ∧ |N(u) ∩ B| = 2 ∧ A = insert u (B ∖ N(u))`. `u ∉ B` rules out a collision between `u`
  and `B ∖ N(u)`, and the relation is neither wider nor narrower than the charter's. Case (D) is a single deletion.
- **`WeightedHall`**'s target set is `(indepFamily G p).filter (∃ B ∈ X, transportRel G B A)`. That is exactly `N(X)` restricted
  to `I_p`. The restriction is harmless, since every (REL) image of a source already lies in `I_p` (critic lemma CA-1).
- **`card_active_eq_tagged`** uses `Finset.card_nbij'` with inverse `A ↦ insert v A`.
  - The inverse lands in `indepFamily G j` by `leaf_insert_indep` and `card_insert_of_notMem`. `hj : 1 ≤ j` is used exactly
    there, through `omega` for `(j−1)+1 = j`.
  - The forward map uses `support_adj` and independence to exclude `s_v`, and `tagWitnesses_subset_R` to move the witness into `R_v`.
  - `support_unique` is used only transitively, inside `leaf_insert_indep`.
- **`exists_saturatingFlow_of_weightedHall`**.
  - Clone sets: `Σ B, Fin (wSrc B)` and `Σ A, Fin (wTgt A)`, where `wSrc`/`wTgt` are zero off the layers.
  - Reduction: a clone set `A` sits inside the full fibre over `X = A.image (·.1)`. The Hall neighbourhood of `A` is **equal** to
    the full target fibre over `N(X)`, via `hset2`, which uses `r` depending only on the bases.
  - So the chain `#A ≤ Σ_X w ≤ Σ_{N(X)} w = #N_r(A)` uses `WeightedHall` at `X` with `X ⊆ I_{p+1}`, exactly as stated.
  - The flow `f(B, A) = #{clones x of B : (φ x).1 = A}` is integral and supported on arcs (`hfrel`). Saturation holds by the
    fibre sum over `I_p`. Capacity holds by injectivity into the fibre of `A`.
- **`aggregate_nonpos_of_saturatingFlow`** discards the support clause and uses only saturation, capacity and
  `activeWeightAggregateIdentity`. This is (HALL-COND) at `X = I_{p+1}` only, as SEMANTIC-CONTRACT §1.2 says.
- **Pinned Mathlib citations.** I spot-checked all 13 file:line citations against the pinned sources. Every one names the
  declaration claimed.

## Attacks and findings

- **F1: undisclosed deviation, material only to the Stage 7 freeze.** The contract's draft `favorableLeaves` **does not
  elaborate verbatim**. My verbatim transcription fails with `failed to synthesize DecidablePred fun v => C4LA1.IsFavorableAt G v p`.
  - U2's file compiles only because every `E993Transport` block opens `open scoped Classical`, and because `tagWitnesses`,
    `activeWeight`, `layerWeight` and `favorableLeaves` are marked `noncomputable`.
  - The return describes its deviations as "implicit/explicit argument style as the only deviations", and the disclosure file
    records only the keyword swap. Neither mentions the classical scope or the `noncomputable` markers.
  - Neither changes meaning. `rfl` against entry 13's `open Classical in` filter goes through, and my `ContractDraft` versions
    agree definitionally. But Stage 7's `expected_statement` and definition texts must include them, preferably as
    `open Classical in` on `favorableLeaves`, mirroring entry 13.
- **F2: the keyword swap is not the only deviation.** `layerWeight_sub_eq_sum` also takes `(G : SimpleGraph V)` **explicit**,
  where the contract has `{G : SimpleGraph V}` implicit. My `example` with the contract's implicit binder is discharged by
  U2's theorem, so this is phrasing only.
  - The draft contract's `terminal_theorem.signature_deviation_from_draft` attributes the implicit/explicit deviation to
    `activeWeightAggregateIdentity`. That is wrong: the terminal theorem's binders match the draft exactly, and the deviation
    belongs to the companion `layerWeight_sub_eq_sum`.
- **F3: the draft contract is not award-ready (deliverable (e)).**
  - (i) It has **no `expected_statement` field**. The phrase occurs only inside the `status` string.
  - (ii) Its definition list omits `C4LA1.IsGraphLeaf` (entry 4, in the `hF` hypothesis), `C4LA1.IsFavorableAt` (entry 3) with
    its dependencies `vertexDeletionIndepSetCount`/`vertexDeletionForwardDifference` (entries 1–2), `C5LA1.leafSet` (entry 6) and
    `C5LA1.indepSetCount` (entry 11).
  - (iii) `def-favorableLeaves` lists `dependencies: []`, and `def-aggregate` omits `leafSet` and `IsFavorableAt`.
  - (iv) It cites "SOLUTION-CONTRACT.md ruling 9". Ruling 9 is in `control/C1-STAGE1-GATE.md`.
  - (v) The `p − 1` guard text is present and correct (`hp_guard`).
- **F4: the carry plan is corrected.** Every carried helper the new code uses (`support_adj`, `H_subset_R`, `leaf_insert_indep`,
  `tagged_count_split`, all `private`) lives in **entry 42** (`E993Interior.Leaf`, lines 962–1177). The line ranges the return
  itself cites (981–1084) all fall inside entry 42.
  - Entry 41 (`E993Interior.Core`, `taggedShadowBound`) is **not needed**. Entry 42 takes the shadow bound as a hypothesis
    `hShadow` and references nothing from entry 41, entries 15–17, `leafDegree` or `crossingIndex` (grep count 0).
  - Because `private` is file-scoped, the whole entry-42 fragment must travel with the new code in the same file.
  - The minimal carry for the WID award is **entries 1–6, 8–13, 18 and 42**. Entries 7, 14 and 15–17 are harmless but unused.
  - The return's phrase "entries 41–42's block" should read "entry 42".
- **F5: the dependency diagram is internally inconsistent.** It says "all four of the first group are used directly", but the
  group it lists includes `support_unique`, which the new code never names. The earlier summary sentence lists the correct four:
  `support_adj`, `leaf_insert_indep`, `H_subset_R`, `tagged_count_split`.
- **F6: fidelity note 1 is closed by the critic.** U2 did not prove that (S) preserves independence or that `|A| = p`. As the
  return says, nothing in WID or the two companions depends on it, because the flow and Hall definitions quantify over
  `indepFamily` layers. I proved it (CA-1 below). It belongs in the eventual (HALL) contract.
- **Hypothesis and quantifier attacks.**
  - No `IsTree`, eligibility or group-invariance hypothesis enters any compiled declaration. All of them are graph-generic, as
    the contract requires.
  - `hF : ∀ v ∈ F, IsGraphLeaf G v` is necessary: `W_v` and `R_v` are meaningless off leaves.
  - No hypothesis encodes a conclusion. `WeightedHall` is the genuine all-`X` condition, and `IsSaturatingFlow` is the genuine
    network definition.
  - Every ℕ subtraction is guarded: `p − 1` by `hp`, `j − 1` by `hj`.
  - No step assumes `S ≤ 0`.
  - The direction of every inequality is as stated.
  - Competition for target capacity from sources outside `X` is irrelevant here: (HALL⇒FLOW) is the finite Hall theorem, and
    the kernel checks it.

## Mechanism-equivalence and fence check

- (WID) is an identity of layer sums, not a transport mechanism. It is none of the ten refuted keys and not the C6-F4
  own-support rule.
- (FLOW⇒SIGN) and (HALL⇒FLOW) are generic network facts. They do not revive deletion-only Hall: the relation is the literal
  (D) ∪ (S), and the weight is the active-tag weight.
- Nothing re-proves a closed region or a settled family. No census value, RTree wording, controller prior, (LIFT), (DCB) or
  (TSB) is used.
- The route does not assert `S ≤ 0` for any tree, so mechanism ≠ aggregate is respected. (HALL) is correctly not stated,
  since stating it would need `sorry`.

## Certification audit

- "compile with **zero `sorry`** … only the three permitted axioms" for the 7 tabled declarations: **backed**, and extended by me
  to all 18.
- "`lake build` … 8657/8657 jobs … 0 errors": **backed** by my rebuild.
- **Struck:** "warnings only (all pre-existing, in the carried entries — **none in the new `E993Transport` code**)". My build log
  shows one new-code warning at `Main.lean:1704:46`, an unused simp argument `hpk2` in `layerWeight_sub_eq_sum`. The warning is
  cosmetic. It also contradicts the return's fidelity note 6 on how `p + 1 − 1 = p` is discharged: the `hpk2` rewrite is never
  used.
- **Corrected:** "this exact byte sequence: the frozen 45-entry source, then the five … files concatenated". The working copy is
  that sequence without its final newline (F-audit above).
- **Corrected:** "entries 41–42's private lemmas" should read entry 42 (F4).
- **Corrected:** the draft contract's `signature_deviation_from_draft` and `statement_matches_contract_draft: true` (F2); its
  dependency lists (F3).
- "byte-copied in full … identical to the source": **backed** for the first 61296 bytes.
- "No `native_decide`, no `decide` …": **backed** by my own search of the new code.
- The model disclosure ("Chartered sonnet/xhigh", runtime `claude-sonnet-5`) is consistent with `C1-ALLOCATION.md`.
- The route verdict `compiled` and `headline_resolved: no` are accurate.
- No certification literal claims more than a compiled scratch declaration: the return grades nothing, as §4 requires.

## Verdict

verdict: retained_narrowed
headline_resolved: no

**What is retained.** The compiled Lean skeleton is retained at full mathematical scope: the 10 transport definitions, the
(WID) bijection, double counting, (WID) in general and in `F_p` form, (FLOW⇒SIGN) and (HALL⇒FLOW).

**What is narrowed or corrected.**
- Deliverable (e), the draft contract, is not award-ready (F3).
- The carry plan is corrected to entries 1–6, 8–13, 18 and the whole of entry 42 (F4).
- The deviation disclosure is extended to cover `open scoped Classical`, the `noncomputable` markers and the explicit `G` (F1, F2).
- One warning literal is struck.

**Grades.** In my judgment the mathematics of (WID) is complete (`proved_informal`, re-derived independently above). It becomes
`formally_verified` only when its governed award closes. The companions register `proved_informal` at most (R29-N-12).

**Critic-derived advance (attributed to C-U2-T; compiled scratch, no grade, STATED at a review stage, needs an isolated second
read).** Four new declarations are in `scratchpad/c1-crit-U2-T/LeanProject/LeanProof/CriticAdvance.lean`. They compile against
U2's `Main.lean`, and `#print axioms` gives `[propext, Classical.choice, Quot.sound]` for each:

- **CA-1 `transportRel_mem_indepFamily`:** `B ∈ I_{p+1}` and `transportRel G B A` imply `A ∈ I_p`, for both (D) and (S).
  This closes U2 fidelity note 1.
- **CA-2 `weightedHall_of_saturatingFlow`:** a saturating flow implies (HALL-COND) for every `X`. This is the converse U2
  lists as open (remaining obligation 3).
- **CA-3 `weightedHall_iff_exists_saturatingFlow`:** (HALL-COND) holds if and only if a saturating integral flow exists, on
  every finite simple graph, every `F` and every `p`.
- **CA-4 `aggregate_nonpos_of_weightedHall`:** at `F = F_p` and `p ≥ 1`, (HALL-COND) implies `S(G, p) ≤ 0`.

A fifth declaration, `layerWeight_zero_one` (both `I_1` and `I_0` have weight 0), makes the `p = 0` failure of (WID) formal on
its left side.

These companions let (HALL) be targeted in Lean in either form, as a flow or as (HALL-COND). With CA-1 the `indepFamily p`
filter in `WeightedHall` becomes redundant for sources in the layer.

## Remaining obligation

1. **Stage 7 (WID award).** Freeze an `expected_statement` for `E993Transport.activeWeightAggregateIdentity`: the
   namespace-relative text from `theorem` to before ` :=`, with the binders as compiled.
   - Freeze the definition texts including `noncomputable` and the classical decidability (`open Classical in` on `favorableLeaves`).
   - Mint entries 46+ through the registrar.
   - Change `layerWeight_sub_eq_sum` to `lemma`, and either restore the contract's implicit `{G}` or record the explicit binder
     as the frozen phrasing.
   - Carry entries 1–6, 8–13, 18 and the whole of entry 42.
   - Complete the definition list with entries 1–4, 6 and 11.
   - Drop or record `Main.lean.bak1` and `Check.lean`.
2. **Companions.** CA-1 through CA-4 are candidate companions for the WID or (HALL) award. They need an isolated second read.
3. **The open object is unchanged.** It is (HALL): `WeightedHall T (favorableLeaves T p) p` for every finite tree `T` and every
   eligible `p`. Equivalently, by CA-3, a saturating flow. No Lean statement of it exists yet. Its informal proof or refutation
   belongs to the other routes.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-crit-U2-T/`.

| artifact | SHA-256 |
|---|---|
| `seal.py` (seal and capsule-digest check) | `519dd81ded4e6898329038c83a9fa595a0a8bc820fb8acb027089ed5247994ab` |
| `py/wid_check.py` (own instrument) | `0477886c72afa80c909967f8c2b63b14f75f7aca38977d93f5392e7fd590fef3` |
| `py/wid_results.json` | `47e2284dbb8de491f18d1818de5240007ab4cae72f4ec6b3a76423f24f28a492` |
| `LeanProject/LeanProof/Main.lean` (copy of U2's) | `110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743` |
| `LeanProject/LeanProof/CriticContract.lean` | `a6b20f8dc0b545677e439401cf36559dd2d46c4253f74c594c6c77af6599ce82` |
| `LeanProject/LeanProof/CriticAdvance.lean` | `85725e398df69ed33a255e7d5fda30d8768c6fab6d5d71ee3aa280673656506a` |
| `build.log` | `f3bad0a31510977b4e4e58306803ef918acc81709045d20792e5fabb38189f55` |
| `critic_advance_output.txt` (all `#print axioms`) | `6f8efa27bae4da6c1515627152ef28c1f174db58fc779b6c626d6a625fc0ffa4` |
| `critic_contract_output.txt` | `a8625c8d3a771f50820fa4ed55b66396503d9744fcb2006815cf173b68289ddb` |

**Replay.**
- `python3 seal.py <manifests>` recomputes the seals.
- `python3 py/wid_check.py py/wid_results.json` runs the instrument in about 1 s.
- For Lean: `cd LeanProject && lake build && lake env lean LeanProof/CriticContract.lean && lake env lean LeanProof/CriticAdvance.lean`.

**Read-boundary notes.**
- I read only the capsule members, the frozen `sources/first-interior/c2-primary-v2/` project, `sources/mathlib-binding/PIN.json`,
  pinned Mathlib source lines (API meaning), and `scratchpad/c1-U2/`.
- I did not read `scratchpad/c1-U2-replay/`. It sits outside the literal `c1-U2/` grant, so I substituted my own rebuild.
- I ran no search above my grant, used no network and installed nothing.

**Process.** The one background job, `lake build` with PID 68662, exited 0 before this write. No job is running.
