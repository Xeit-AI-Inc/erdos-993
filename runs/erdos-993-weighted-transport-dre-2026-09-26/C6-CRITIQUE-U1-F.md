# Critique

**Critic:** `C-U1-F`, Cycle 6 Stage 4, r30. This is a cross-orientation critic of orientation F (falsify) on seat `U1` (route `C6-U-01 LEAN-GK-AND-SPIDER-FAMILY-AWARDS`, orientation U).

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: `claude-opus-5-5[1m]`.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The tool display cut about 5 KB out of the middle of `verity.md`; the file itself was read. The host put the project `CLAUDE.md` and the user auto-memory index into my context at session start. I did not act on either, and I opened no other VerityOS file outside the run root. I did not create a conversation log, because a sealed Stage 4 critic writes only its critique and its scratch.

**Dispatch.** `control/dispatch/c6-stage4/DISPATCH-C-U1-F.md` has SHA-256 `9a6cab5d639b75dead4db331990bddd094bac75e4a5a441dfa00a3b640785412`. I checked it with `shasum -a 256` before reading it, and it matches.

## Identity and seal audit

I recomputed every inner seal as the SHA-256 of the compact, key-sorted JSON without `seal_sha256` and with no trailing newline, using `scratchpad/c6-crit-U1-F/seals.py` (output in `seals-output.txt`):

| Manifest | Recorded = recomputed |
|---|---|
| capsule `control/c6-critic-capsules/U1-PACKET-MANIFEST.json` | `355e287d06398d1a40cfa07f55c871edda4e1f2b80d62ae0a4ab2221b4a09032`: **match** |
| Stage 4 dispatch `control/C6-STAGE4-DISPATCH-MANIFEST.json` | `74be1845f4005d6846c10eacdebf5049b6d7d971a53b445c1dcab3b3637ddf50`: **match** |
| Stage 3 `control/C6-STAGE3-PACKET-MANIFEST.json` | `32452609815aa05c6ea550d4c6a67edeee1c8422ab87dbbb310bb86d877e49dd`: **match** |
| Stage 2 `control/C6-STAGE2-PACKET-MANIFEST.json` | `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611`: **match** |

All 14 capsule members match their recorded byte counts and SHA-256 values, including the return itself (`b3db2244…`). I also replayed U1's `verify_seal.py` copy-out-first (digest `ba5e5dfa…`, identical): MATCH.

**Digests the return lists, recomputed:**

- **U1's own files.** All seven Lean and project files in the return's table match, byte for byte, both in `scratchpad/c6-U1/` and in my copy: `Carried.lean 86b59c6c…`, `CrossingIndex.lean 3fb2dbd6…`, `CarriedC4LA1.lean a0381495…`, `HookChain.lean 91c85fa2…`, `Spider.lean 18396be5…`, `SpiderDraft.lean 8ae4f2f6…`, `LeanProof.lean a259e82d…`. The project seed also matches: `lakefile.toml 45d0ca58…`, `lake-manifest.json 52a4d73c…`, `lean-toolchain 2bdc48ad…`.
- **Frozen template and pin.** The Cycle 5 U1 template's frozen copy `sources/c5-stage7-sources/U1/LeanProject/LeanProof/Main.lean` is `05c24dda…`, which matches the return and the Stage 2 manifest; `gkGraph_isTree` is at line 3222 as cited. `PIN.json` (`af78b3d8…`) gives Mathlib `905b9581…`, which equals the shared project's manifest.
- **Carries: what I checked, and how.**
  - **`Carried.lean` against C1-LA1.** Its whole-file digest `86b59c6c…` equals the prefix that gate ruling 47 records for C1-LA1's `Main.lean`. Each of its 36 entries hashes to the digest in its own `BEGIN` line, which is 36 of 36 self-consistent (`entry_digests.py`). Entries 1–13 and 22 are byte-identical to the authorized first-interior fragments `0001–0006, 0008–0013, 0018, 0042` under `sources/first-interior/c2-primary-v2/…/Snippets/`.
  - **`CrossingIndex.lean`.** It contains the authorized fragment `0014-…crossingIndex` (`378868ab…`, 1281 bytes) verbatim, wrapped only by the import preamble, the header comments and an `END` marker.
  - **`CarriedC4LA1.lean`.** The bodies of entries 0073, 0074 and 0075 hash to `d30c9ae0…`, `28327989…` and `72ae49fe…`, the digests printed in their own headers.
  - **What I did not check.** The C1-LA1 `Main.lean`, the C4-LA1 fragments and `control/C5-STAGE7-FORMALIZER-BRIEF-LA1.md` are not members of my capsule, so I did not compare against those origins. "Byte-identical to C4-LA1 entries 73–75" therefore stands on internal self-consistency plus the ruling-47 prefix `66db6c73…` named in the file header. I report it as consistent, not as independently origin-verified.

**Registry keys touched.** None is re-graded by this return or by this critique:

- `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (HALL): OPEN at full scope, untouched.
- `E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-SATURATES-BY-VERTEX-DELETIONS-FROM-RANK-K-PLUS-2`: `proved_informal`, unchanged. This is the object being formalized.
- `E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK`: `formally_verified` per the controller fact in the attack-brief preamble. Obligation (a) is correctly discharged.
- `E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET`: the origin award of the carried per-tag lemma.
- `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`: the origin of `Carried.lean`.
- `E993-PAIR-SPIDER-CLOSED-FORM`: cited by the return. Its registry grade is not in my capsule, so I checked only its formula, by literal count (below).
- The refuted `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`: see the fence check.

The return proposes no new key, and neither do I. My Lean declarations below are companion nodes for the spider key's future award, not predicates offered for registration. Their names avoid the working labels listed in ruling 48.

## Independent re-derivation

**Instrument 1: Python, standard library, exact integers.** The scripts are `py/spider_check.py` and `py/spider_flow.py`; outputs are saved beside them.

- **Graph and tree test.** I built `S(1,2,3^k)` by transcribing the return's `spiderEdge` labels literally: `0` is the root, `1` the pendant leaf, `0–2–3` the path of length 2, and `0–a_i–b_i–c_i` with `a_i = 4+3i`. Each instance passes an edge-count check (`n − 1` edges) and a union-find acyclicity-and-connectivity test.
- **Counts, α and the closed form.** I enumerated independent sets literally, by backtracking. For `k = 0..6` the counts equal the closed form `(1+y)(1+2y)(1+3y+y²)^k + y(1+y)(1+2y)^k` and give `α = 2k+2`.
- **Crossing index.** I computed `x` through rank `α` with zero extension. From the closed form (checked equal to the literal counts only for `k ≤ 6`), `x = k+1` for every `k = 0..60`. This is `bounded_computation`. The return's descent identity `Δ_{k+1} = (e_{k+2} − e_k) − k·2^{k−1}` holds with zero mismatches for `k = 1..60`, and `Δ_{k+1} < 0` throughout.
- **Eligible rows.** For `k = 5` the only eligible rank is `p = 8 = k+3`; for `k = 6` it is `p = 9 = k+3`. Nothing is eligible for `k ≤ 4`.
- **Fidelity.** For `k = 1..5` and every `1 ≤ p ≤ α − 1` I did the following:
  - I derived `F_p` from `Δ_p(T − v) < 0` on the original tree at rank `p`.
  - I computed `w_F` from active tags literally: `v ∈ F ∩ B` with `(B ∖ {v}) ∩ W_v ≠ ∅` and `W_v = N(s_v) ∖ {v}`.
  - I asserted `supply − capacity = S`, with `S` computed separately from `q_v(j) = i_j(H_v) − i_j(R_v)` on the deleted vertex sets. It held on every row.
  - The eligible row `k = 5, p = 8` is: `n = 19`, `α = 12`, `x = 6`, `|F| = 7` (every leaf), supply 3125, capacity 6100, `S = −2975`.
- **Per-tag deletion injections, by matching.** For every leaf tag, I built the bipartite graph from the tag-active `(p+1)`-sets to the tag-active `p`-sets, joined by single deletions that keep the tag active, and ran Kuhn augmenting paths.
  - For `k = 1..5`, every `p ≥ k+2`, and every leaf tag (`1`, `3`, every tip `c_i`), the matching saturates the left side.
  - At `p = k+1` it fails for leaf `1` and for every tip, for each `k = 1..5`, so the threshold `p ≥ k+2` is sharp on this range.
  - Cherry leaf `3` has zero active sources at every `p ≥ k+2`. This is also proved by hand below.
- **Replay of the E-1 construction (my implementation, not U1's).** I did the class split, then iterated the hook product over the factor chain partitions `I({v}) = {∅<{v}}`, `I(u–w) = {∅<{u}}, {{w}}`, `I(a–b–c) = {∅<{a}<{a,c}}, {{b}}, {{c}}`, then took the chain predecessor. I asserted that the iterated products are partitions into saturated inclusion chains.
  - The classes are: leaf `1` split by the first root present among `2, a_0, …, a_{k−1}`; tip `c_i` (one class, `a_i ∈ B`); and cherry leaf `3` (vacuous).
  - For `k = 1..5` and every `p ≥ k+2`, the resulting per-tag maps are total and injective. Each is a single deletion that keeps the tag active.
  - This is `bounded_computation`. It shows that the informal construction a Lean N5-general plus N6 must formalize is executable and correct on the finite range. It is not evidence for any universal step.

**Instrument 2: Lean, my own pinned copy.** I copied the project out, bound `.lake/packages` to the shared project by manual symlink, and worked only after `cd` into the project. I never ran `lake update` or `lake clean`.

- **Cold build.** `lake build LeanProof` gave `Build completed successfully (8661 jobs)`. The only warnings are linter warnings: HookChain `h3` unused, `hi` unused in `hookPred_isSome_of_rank_ge`, and a Carried "Try this".
- **Draft target.** `lake build LeanProof.SpiderDraft` succeeds with exactly five `declaration uses 'sorry'` warnings.
- **Forbidden-tactic scan.** A `grep` for `sorry|admit|native_decide|decide|axiom|implemented_by|unsafe` over `Spider`, `HookChain`, `CarriedC4LA1`, `CrossingIndex` and `Carried` finds only a docstring use of the word "sorry-free".
- **`#print axioms`** (`probe-output.txt`):
  - `[propext, Classical.choice, Quot.sound]` or a subset, for `spiderOneTwoThrees_isTree`, `spiderGraph_connected`, `spiderChildEdge_injective`, `spiderChildEdge_range`, `spiderGraph_card_nonroot`, `spiderGraph_adj_parent`, `hookChainIndex_rank_injective`, `hookPred_chain_and_rank`, `hookPred_isSome_of_rank_ge`, `hookPred_injOn_rank`, `mem_indepFamily_iff`, `erase_mem_indepFamily` and `saturatingFlow_of_perTag_deletionInjections`.
  - `sorryAx` for all five drafts. The return checked two of them; I checked all five.
- **The spider of record, from the Lean adjacency.** A probe `#eval` over the decidable-adjacency instance prints, for `k = 2`, the edges `(0,1) (0,2) (0,4) (0,7) (2,3) (4,5) (5,6) (7,8) (8,9)`. It also counts the independent sets for `k = 0..6` literally. All seven rows equal the pair-spider closed form and my Python rows. For example, `k = 6` gives `1, 22, 210, 1161, 4162, 10228, 17735, 21997, 19586, 12456, 5571, 1701, 337, 39, 2`. This is a probe, not a proof step, and it is `bounded_computation`.
- **Statement audit** against SOLUTION-CONTRACT §2 and the carried entries:
  - `spiderOneTwoThrees_isTree (k : ℕ)` has no hypothesis beyond `k`. It is proved by `isTree_iff_connected_and_card` from connectivity plus an explicit child-to-parent bijection between non-root vertices and edges. That bijection is the edge-count half of "acyclic and connected".
  - `hookPred_injOn_rank` is exactly the stated two-factor totality-and-injectivity on `[0,h] × [0,L]` at rank `r+1` under `h + L + 1 ≤ 2(r+1)`.
  - The carried transport definitions (entries 14–21) are literally the contract's `indepFamily`, `tagWitnesses`, `activeWeight`, `favorableLeaves`, `transportRel` and `IsSaturatingFlow`. `activeWeight` counts `v ∈ F ∩ B` whose witness lies in `B.erase v`. `transportRel` is (D) ∪ (S), with `|N(u) ∩ B| = 2` and `u ∉ B`.
  - The three carried C4-LA1 entries are generic, with `{V} [Fintype V] [DecidableEq V]` and any `G`. None mentions `gkGraph`, and they depend only on `Carried.lean`.

## Attacks and findings

**F1. The grades are overstated.** The table grades N1, the carried E-2/N4 lemma and the two-factor N5 as "**theorem**". A scratch compile is `compiled` and nothing higher (R29-N-12; SOLUTION-CONTRACT §4: "a compiled scratch declaration has no grade until its governed award closes").

- The carried `saturatingFlow_of_perTag_deletionInjections` is a companion lemma inside the C4-LA1 award. It carries no certificate of its own (§3.9).
- **Correction:** N1 is `compiled`; the two-factor N5 is `compiled`; E-2/N4 is `compiled` (a carried companion of a `formally_verified` award, with no certificate of its own). The route verdict `compiled` is right.

**F2. The return's dependency graph misstates N2's dependence. Critic-derived; refuted by construction.**

- **The claim.** The return says the N5 iteration is "the single blocking step for N2's degree argument". It says "the missing Lean bridge [for N2] is a generating-function argument".
- **Neither is needed.** `α(S(1,2,3^k)) = 2k+2` follows elementarily:
  - *Lower bound:* the explicit independent set `{1, 3} ∪ {a_i, c_i : i < k}`.
  - *Upper bound:* split the vertices into the `2k+2` cells `{0,1}`, `{2,3}`, `{a_i, b_i}`, `{c_i}`. Each two-element cell is an edge, so an independent set meets each cell at most once.
- **In Lean.** I compiled this proof sorry-free in my scratch as `E993Transport.spiderOneTwoThrees_indepNum_eq (k : ℕ) : (spiderOneTwoThrees k).indepNum = 2*k+2`, with the companion lemmas `spider_le_indepNum` and `spider_indep_card_le` (file `LeanProof/CriticN2.lean`). `#print axioms` gives `[propext, Classical.choice, Quot.sound]`.
- **Grade:** `compiled`, a critic-derived advance attributed to `C-U1-F`.

**F3. The N7 draft is not the terminal the synthesis needs, and its stated dependencies are wrong.**

- **What N7 states.** `spiderOneTwoThrees_weightedHall_at_kPlus3 (k) (hk : 5 ≤ k) : ∃ f, IsSaturatingFlow (spiderOneTwoThrees k) (favorableLeaves _ (k+3)) (k+3) f` is a bare flow statement.
- **(i) N7 needs neither N1, N2 nor N3a.** The per-tag lemma needs injections only for tags in `F`, so injections for every leaf tag serve every `F`. Eligibility is not an input to the flow.
- **(ii) The draft has no tree or eligibility face.** Without `IsTree`, `crossingIndex + 2 ≤ k+3` and `3(k+3) < 2α + 1` on its face, it is not a restricted-scope (HALL) statement. C5-LA1 carried "the tree face".
- **The right split.** First, a key-level node (FLOW): every `k`, every `p ≥ k+2`, every `F ⊆ leafSet`, a deletion-supported saturating flow. This is exactly the registered spider key's core and needs no N2 or N3. Second, a terminal with the face.
- **Composition in Lean.** I compiled `E993Transport.spider_kPlus3_terminal_of_nodes` sorry-free (axioms `[propext, Classical.choice, Quot.sound]`; file `LeanProof/CriticCompose.lean`). It takes (FLOW) and N3a (`crossingIndex ≤ k+1` for `k ≥ 1`) as hypotheses. It proves, for `k ≥ 5`: `IsTree ∧ crossingIndex + 2 ≤ k+3 ∧ 3(k+3) < 2·indepNum + 1 ∧ ∃ f, IsSaturatingFlow … (favorableLeaves … (k+3)) (k+3) f`. It uses U1's N1 and my N2.
- **No circularity.** Neither hypothesis encodes a conclusion. (FLOW) is quantified over every `p ≥ k+2` and every leaf-tag set, and N3a is only an upper bound on `x`.
- **Consequence.** At the minimal `p = k+3` scope, N3b (and with it the Newton dependency) is **not** needed. It is needed only for the every-eligible-rank form, which requires `x ≥ k`.

**F4. The gap is larger than "the N5 iteration". This answers the attack brief.**

- **What the two-factor lemma covers.** It covers a product of **two chains starting at rank 0**.
- **What the general case needs:**
  - (a) An abstraction of a chain partition of a finite family of `Finset`s: saturated inclusion chains, each with centre `≤ c_i/2`.
  - (b) The rank-offset version: chains `[s, s+h]` and `[s', s'+L]` give the guard `2R ≥ (2s+h) + (2s'+L) + 1`. This reduces to the base lemma by translation, but that translation has no Lean text.
  - (c) The product of two partitioned families, with the hook partition taken per chain pair.
  - (d) Induction over a factor list.
  - (e) Explicit chain partitions of the three factor shapes. Note that `I(u–w)` is not symmetric: its chain `∅ < {u}` has centre ½ and `{w}` has centre 1. So the "`2·centre ≤ c_i`" form, not a symmetric-chain form, is the one that must be formalized.
- **What is outside N5 altogether:**
  - (f) The product bridge: the independent sets of `T` minus the fixed closed neighbourhoods correspond bijectively to tuples of factor sets, preserving inclusion and cardinality.
  - (g) The tag-class case analysis: leaf `1` by first root; tip `c_i` by `a_i ∈ B`. **The tip class has no draft statement at all**; only leaf `1` is drafted as N6.
  - (h) The vacuity lemma for cherry leaf `3`. If `0 ∈ B`, then `B ⊆ {0, 3} ∪` (one of `b_i, c_i` per arm), so `|B| ≤ k+2 < p+1`. No Lean text.
  - (i) Activity preservation and cross-class disjointness.
  - (j) Assembling `φ τ` by cases on `τ` before `apply saturatingFlow_of_perTag_deletionInjections`. The return's "composes directly by `apply`" holds only after this case assembly.
- **N3a also depends on N5-general.** It needs either the root-conditioning count bridge or an injection argument, and I found the latter. On root-free sets, the product `(1+y)(1+2y)(1+3y+y²)^k` has `Σc = 2k+3`, so the chain predecessor maps the root-free `(k+2)`-sets injectively into the root-free `(k+1)`-sets. The `2^k` root-containing `(k+2)`-sets map by deleting `3`. The `(k+1)`-set `{0, 3} ∪` (a choice in `k − 1` arms) is never hit, so `i_{k+2} < i_{k+1}`.
- **Verdict on the dependency graph:** the informal graph is closed (SR-C5-2 plus the steps above, all replayed on `k ≤ 5`). The Lean debt is engineering, but it is several nodes, not one induction.

**F5. The N6 draft statement is admissible but over-strong in form.**

- Its injectivity clause ranges over every `B, B' ∋ 1` in `I_{p+1}`, including **inactive** ones. The first clause does not constrain those.
- It is still provable, by extending `φ` as the identity on inactive sets (whose images are `(p+1)`-sets, disjoint from the `p`-set images). A Stage 7 statement should nonetheless quantify injectivity over active sources only, matching `hinj` of entry 0075.
- The hypothesis `k + 2 ≤ p` is the sharp threshold on my bounded range.

**F6. Citations are misattributed.** Neither `E-1` nor `E-2` appears in `SEMANTIC-CONTRACT.md` or `SOLUTION-CONTRACT.md`; I checked by `grep`. Yet the return and its Lean docstrings cite "`SEMANTIC-CONTRACT.md`'s `E-1`" and "`E-2` (`SEMANTIC-CONTRACT.md` …)" repeatedly. Both are Cycle 5 working labels (ruling 48), taken from the adjudication and synthesis. This is a provenance error with no mathematical consequence, but it must be corrected before any text is carried to Stage 7. Separately, entry 0075's own docstring labels itself "(N1)" (C4-LA1's graph). That collides with U1's N1 (the tree layer), and a Stage 7 brief should key nodes by (award, entry, digest) and not by N-labels.

**F7. Checks on hypotheses and arithmetic: nothing found.**

- **Hook lemma guard.** The guard `h + L + 1 ≤ 2(r+1)` is exactly `r + 1 ≥ c_max + ½` with `c_max = (h+L)/2`, so it matches the informal step-down.
- **Hook partition.** `hookChainIndex` is SR-C5-2's partition verbatim: `(i,j) ∈ C_j` if `i + j ≤ h`, else `C_{h−i}`.
- **Natural-number subtraction.** Every `h − i` in HookChain sits under `i ≤ h`, the `if` branch, or `omega` context. In `Spider.lean`, every `v.val − 1` and `(n−4)/3` is guarded.
- **N2 and N3a.** No hypothesis is missing. N3a's `1 ≤ k` is harmless: `x(S(1,2)) = 1` also satisfies it.
- **N3b.** `hk : 5 ≤ k` is the scope of record. It is weaker than what my bounded range shows (`x = k+1` already for `k ≥ 0`), which is correct caution given the Newton dependency.

**F8. Process.** The return discloses these items, and I checked them against the Stage 3 disclosures record:

- two `ls | grep` calls whose underlying listing ran over all of `control/` and all of `second-reads/`;
- a `find` rooted at a granted directory;
- an authorized over-read of three Cycle 5 U1 files.

Everything ran in the foreground and nothing was backgrounded. No finding beyond the disclosed items.

**What the return reaches, in one line:** a Lean-ready statement layer. It has two compiled nodes (N1; the two-factor N5) and the carried E-2. It has no new `proved_informal`-or-better restricted (HALL) and no (CUT) candidate. The text of gate ruling 30's letters (a)–(d) is not in my capsule, so I report against the attack brief's three-way question instead.

## Mechanism-equivalence and fence check

- **Per-tag injection versus the refuted per-leaf key.** The mechanism is the per-tag single-deletion injection, which is the shadow of the refuted `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`. It is used here only on the named family `S(1,2,3^k)`. The allocation says family-scoped use is not a revival, and nothing in the return or in my nodes asserts it universally.
- **Other refuted keys.** None of the other refuted keys is revived: not deletion-only Hall as a universal claim, not Delete/Retag, not own-support unit capacity.
- **Closed regions.** No closed region is re-proved as a contribution. The spider key is already `proved_informal`, and the chartered object is its Lean formalization. The "spider" family closed in SEMANTIC-CONTRACT §2 is the equal-length-three family `S(3^m)`, a different family.
- **Census values.** No census value enters a proof. My bounded tables are fidelity and falsification checks only.
- **Other fences.** There is no RTree wording, and (LIFT) and (DCB) are not used. The WID identity is used only as the fidelity assertion.

## Certification audit

| Literal in the return | Status |
|---|---|
| "`lake build LeanProof` → Build completed successfully" | **backed**: reproduced cold in my copy (8661 jobs). |
| `#print axioms` `[propext, Classical.choice, Quot.sound]` on `spiderOneTwoThrees_isTree`, `hookPred_injOn_rank`, `saturatingFlow_of_perTag_deletionInjections` | **backed**: reproduced. |
| "five `declaration uses 'sorry'` warnings"; `sorryAx` on the drafts | **backed**: reproduced for all five. |
| "grep … no match" over the five library files | **backed**: the only hit is a docstring word. |
| inventory digests (seven Lean and project files, seed files, template `05c24dda…`, fragment `378868ab…`) | **backed**: recomputed. |
| "`Carried.lean` byte-identical carry of C1-LA1 `Main.lean`" | **backed in part**: the whole-file digest equals ruling 47's recorded prefix, all 36 entries are self-consistent, and entries 1–13 and 22 equal the first-interior fragments. I did not compare against the full origin digest (outside my capsule). |
| "CarriedC4LA1 bodies byte-identical to C4-LA1 entries 73–75 … (all match the C5-STAGE7-FORMALIZER-BRIEF-LA1 table)" | **narrowed to "self-consistent"**: the bodies hash to their header digests, but the brief's table is not in my capsule. |
| "no `gkGraph`-specific text was pulled in" | **backed**: the entries are generic in `V` and `G`. |
| grade "**theorem**" (three rows) | **struck**; replaced by `compiled` (F1). |
| "exactly the tree of `SEMANTIC-CONTRACT.md`'s `E-1`" and "`E-2` (`SEMANTIC-CONTRACT.md` …)" | **struck as citations** (F6). The tree identity itself is backed by the Lean-adjacency probe. |
| "the single blocking step for N2's degree argument"; "the missing Lean bridge is a generating-function argument" | **struck** (F2): N2 is compiled here without either. |
| "N7 … assembled from N1, N2, N3a" | **struck as a dependency claim** (F3). |
| "an induction on `m`, not new combinatorics" | **narrowed** (F4): several engineering nodes plus the product bridge, the class analysis and the tip-class statement. |
| "No census; no numeric flow evidence" | **backed**: the return makes no numeric claims. |

**The `## Remaining obligation` of the return** is inexact in three ways. It lists N2 behind N5, which is wrong. It omits the tip-class injection statement, the leaf-3 vacuity lemma, the product bridge and the face of the terminal. It routes N7 through N2 and N3a instead of through (FLOW). The corrected text is below.

## Verdict

verdict: retained_narrowed
headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**What survives.** Every Lean claim I could replay stands: N1 and the two-factor N5 are sorry-free with the three permitted axioms, and the E-2 carry is generic and compiles. The narrowing is as follows:

- The grades fall to `compiled`.
- The citations to `SEMANTIC-CONTRACT.md` `E-1`/`E-2` are struck.
- The dependency graph is corrected: N2 is independent of N5, and N7's content is (FLOW) plus the face.
- The Lean gap is restated at its true size.

**Critic-derived advances, attributed to `C-U1-F`, all `compiled` in scratch:**

- N2, `spiderOneTwoThrees_indepNum_eq`, sorry-free.
- The low-window lemma `spider_lowWindow_kPlus3`.
- The face-carrying terminal composition `spider_kPlus3_terminal_of_nodes`, which reduces the `p = k+3` terminal to exactly two open nodes: (FLOW) and N3a.

The spider key's grade is unchanged at `proved_informal`. No statement here is `proved_informal`-new.

## Remaining obligation

For a terminal Stage 7 award at `p = k+3`, `k ≥ 5`, with the tree face, stated as `spider_kPlus3_terminal_of_nodes`'s conclusion, the remaining dependency graph is:

1. **Done (compiled; carry byte-identically).**
   - N1 `spiderOneTwoThrees_isTree` (U1).
   - N2 `spiderOneTwoThrees_indepNum_eq` and `spider_lowWindow_kPlus3` (C-U1-F).
   - The composition `spider_kPlus3_terminal_of_nodes` (C-U1-F).
   - E-2 = entry 0075 with 0073/0074 (C4-LA1).
2. **Open: (FLOW).** Every `k`, every `p ≥ k+2`, every `F ⊆ leafSet (spiderOneTwoThrees k)`: `∃ f, IsSaturatingFlow … F p f ∧` deletion support. Its sub-nodes are:
   - (2a) N5-general, meaning chain partitions with `2·centre ≤ c_i`, rank offsets, the pairwise hook product and induction, from `hookPred_injOn_rank`;
   - (2b) chain partitions of `I({v})`, `I(u–w)` and `I(a–b–c)`;
   - (2c) the product bridge from independent sets of the residual forest to factor tuples;
   - (2d) the per-tag injections, each quantified over **active** sources: leaf `1` (the first-root classes, with disjoint class images), tip `c_i` (`a_i` fixed; `Σc = 2k+1` at rank `p − 1`), and the vacuity lemma for leaf `3`;
   - (2e) assembly of `φ τ` by cases and `apply` of entry 0075.
3. **Open: N3a**, `crossingIndex ≤ k+1`: `i_{k+2} < i_{k+1}` by the injection of F4, whose root-free part uses (2a) to (2c).
4. **Not needed at `p = k+3`: N3b.** It is needed only for an every-eligible-rank terminal, and it carries Newton's inequalities as a named undischarged dependency, so that form cannot close `formally_verified` without formalizing Newton.

The informal graph is closed. A bounded Stage 7 attempt is fundable only if the synthesis accepts roughly nine Lean nodes as engineering. **A successor inherits:** U1's `Spider.lean` and `HookChain.lean`; the carried E-2; my `CriticN2.lean` and `CriticCompose.lean`; and the corrected dependency graph above.

## Artifact inventory

All scratch is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-crit-U1-F/`:

- **Seal scripts:** `seals.py` (`5d2ec850…`), `seals-output.txt` (`902d4fc7…`), `verify_seal.py` (U1's, copied, `ba5e5dfa…`), `entry_digests.py` (`adbfd4f3…`).
- **Python instrument:** `py/spider_check.py` (`3f737a7d…`), `py/spider_check-output.txt` (`01d931f3…`), `py/spider_flow.py` (`c8fd9f7a…`), `py/spider_flow-output.txt` (`3decfc35…`). Replay with `cd py && python3 -B spider_check.py 6 60` and `python3 -B spider_flow.py 5`.
- **Lean project.** `LeanProject/` is a copy of U1's project, with the seven inventoried files byte-identical and `.lake/packages` symlinked to the shared Mathlib. The critic files are `LeanProof/CriticN2.lean` (`0a0aac07…`), `LeanProof/CriticCompose.lean` (`8d38f023…`), `LeanProof/CriticProbe.lean` (`b91d14ee…`, the `#eval` and `#print axioms` probe) and `LeanProof/CriticProbe2.lean` (`cdc2a06f…`). Output is in `probe-output.txt` (`7bff7642…`). Replay with `cd LeanProject && lake build LeanProof LeanProof.SpiderDraft LeanProof.CriticN2 LeanProof.CriticCompose && lake env lean LeanProof/CriticProbe.lean`.

**Read-boundary disclosures:**

- Non-recursive `ls -la` of `scratchpad/c6-U1/`, its `LeanProject/`, `LeanProof/` and `.lake/` (granted).
- `ls` of the shared Mathlib project root and of Mathlib's `Combinatorics/SimpleGraph/`, a `grep` of Mathlib's `Clique.lean`, and a read of lines 895–1003 of that file (Mathlib API meaning).
- A `grep` of `control/SOURCE-DIGESTS.json` and a Python scan of the Stage 2 manifest's file list (both capsule members).
- `ls` of `sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Snippets/`, and a `grep` of `sources/c5-stage7-sources/U1/…/Main.lean` for `gkGraph_isTree` (within `sources/`).
- `grep` of the two contracts for `E-1`/`E-2`.
- `ls -la` of `cycles/cycle-6/stage4/critics/U1/` before writing. It showed that a sibling `T/` directory exists; I opened nothing in it.
- **Not read:** any `runs/` file, the formalizer brief, any other return or critique, or `scratchpad/c6-U1-replay/`.

**Process:**

- No network access and no package installs.
- No bytecode: every Python run used `python3 -B`, and `py/` holds no `__pycache__`.
- Every `lake` and `lean` invocation ran in the foreground inside my pinned copy.
- **No background job was started, so none needed to be killed.** I ran no process listing.
- One harmless shell error: a zsh `=`-expansion error from `echo =====` during the boot read.
