---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la2-formalizer-opus-20260928
critic_id: c1-la2-opus-informal-20260928
attestation_id: c1-la2-informal-pass-20260928
claim_sha256: 7727dfd44902c023e4e2bb35a294a4ca4c086e97441ba17722d1208c45417a0a
---

# Informal Proof Integrity Audit

**Boot.** I operated within VerityOS. I read `verity.md`, `identity/startup-protocol.md` and
`skills/proof-integrity-audit/skill.md`. Subsystems loaded: identity (the startup protocol), skills (proof-integrity audit) and
experiments (this run root, inside the brief's read boundary). The brief `control/C1-STAGE7-INFORMAL-AUDITOR-BRIEF-LA2.md` was
digest-checked before it was read: `67301ac9849dba4a63070a471b0dfb66bca2d9218da39444d4bc6e18ea0cf898`, a match.

**Model disclosure (two-part).** Chartered on dispatch-record authority: Claude Opus 5.5, effort high. Runtime-reported model id,
verbatim: `claude-opus-5-5`. No child agents were used.

**Seat.** Reviewer `c1-la2-opus-informal-20260928` (kind `independent-mathematical-proof-integrity-reviewer`). I am not the
artifact producer, and I edited no contract, Lean source, informal proof or receipt. Date of record 2026-09-28. Canonical run id
`erdos-993-math-dre-20260927-r31-cb-uniform-switch`.

## Intended Claim

The claim is the contract's `theorem.informal_statement` (`THEOREM-CONTRACT.yaml`; I parsed it as JSON).
- I recomputed `claim_sha256 = SHA-256(" ".join(s.split()))` myself. The result is
  `7727dfd44902c023e4e2bb35a294a4ca4c086e97441ba17722d1208c45417a0a`, **equal** to the dispatched value.
- In substance, the claim has three parts:
  - **Object.** The CB(8,m) layer: `cbGraph m = SimpleGraph.fromRel (cbEdge m)` on `Fin (17m+3)`, with the frozen labelling and the
    computable `cbGraph_decAdj`.
  - **Structural facts.** These are companion lemmas with no certificate of their own:
    - tree (every `m`);
    - `α = 9m+1` (`0 < m`);
    - `leafSet = {v} ∪ C` (`0 < m`), card `8m+1` (`0 < m`);
    - `W_v = {r}` (no `hm`), `W_{c_ij} = {u_i}`;
    - the low window (`0 < m`);
    - the graph-generic `favorableLeaves_eq_leafSet_of_all`, `N(u_i)`, `N(r)`, `deg u_i = 9`.
  - **Terminal.** For every `m` with `107 ≤ m` and `m % 3 = 2`, suppose (hE) `crossingIndex + 2 ≤ (16m+4)/3` and (hH) a saturating
    flow exists at that rank with the derived selector. Then the SOLUTION-CONTRACT §2 four-conjunct body holds. Conjuncts 1 and 3
    are discharged; conjuncts 2 and 4 are hypotheses and are not asserted; `hres` is unused.

**Artifacts audited** (each digest recomputed by me):

| Artifact | SHA-256 | Expected |
|---|---|---|
| `THEOREM-CONTRACT.yaml` | `2ccf0c3b6dede75d6b36321e472cb0723f3d972d04b8480879e96645318408cf` | match |
| `INFORMAL-PROOF.md` | `f24936502db79f8f3eaf654d09fd902cb49eef19e3048d74182af68db44d4c80` | match |
| `LeanProject/LeanProof/Main.lean` | `a906ec179d52c2548ca7026d8c9de532577100308444af2e722db3fd963b5f3f` | match |
| `CAPSULE-VERIFICATION.json` | `6b1d56c9cd56ec4f19d8acbcacad6bda15be0e37feb619357fe60d6c3b954825` | (no expected value dispatched) |
| `FORMALIZER-REPORT.md` | `9060968aaf36990449c2842b2f0e33882b89d4ff54bec00e32c59d794100a7e1` | (no expected value dispatched) |

**Capsule.**
- `control/c1-stage7-capsules/C1-LA2-PACKET-MANIFEST.json`: I recomputed the seal as the SHA-256 of the compact key-sorted JSON
  minus `seal_sha256`. It is `7f13a1b9fa858236082babc9435d9b0cc8586d2661549131394822eb5e73692a`, a **match**.
- All 801 members match their listed SHA-256.
- `sources/c1-stage7-sources/SOURCE-DIGESTS.json`: 924 of 924 files match.

## Claim Ledger

Verdict key:
- **V** = verified with reproduced evidence (my evaluator, plus a line-by-line reading of the proof against the Lean source).
- **V-imp** = verified; the prose is imprecise but the statement is true and not load-bearing.

Evidence IDs refer to `cb_eval_out.json` keys (see the next section).

| ID | Claim (INFORMAL-PROOF node) | Hypotheses and where they enter | ℕ-subtraction / cast audit | Evidence | Verdict |
|---|---|---|---|---|---|
| L0 | Carried definitions: `IsGraphLeaf = ∃! u, Adj v u`; `support` via `Classical.choose`; `leafSet = univ.filter IsGraphLeaf`; `tagWitnesses = (N(support v)).erase v`; `favorableLeaves = leafSet.filter IsFavorableAt`; `IsSaturatingFlow`; `crossingIndex` | none | ℤ casts only inside the carried `vertexDeletionForwardDifference` and `forwardDifferenceDel` | I read the text against Main.lean entries 4, 5, 6, 15, 18, 20 and 22; byte check in §Reproduced (E-1) | V |
| L1 | 0123: at a leaf `v` with `Adj v s`, `support v = s` | `hv` (leaf), `hs` (adjacency); used via uniqueness in `Classical.choose_spec` | none | carried byte-identical (E-1) | V |
| L2 | 0124: `w ∈ W_v ↔ w ≠ v ∧ Adj s w` | same as L1 | none | carried byte-identical (E-1) | V |
| D0 | `cbEdge`: pairs (0,1), (1,2), (0, 3+17i), (3+17i, 3+17i+1+2j), (3+17i+1+2j, 3+17i+2+2j), `i < m`, `j < 8`; `cbGraph = fromRel cbEdge` | none | none | a literal transcription equals the name-built CB(8,m) of SEMANTIC-CONTRACT §2 under the frozen labelling, `m = 0..12` (`m*.literal_cbGraph_equals_named_CB`); the labelling is a bijection onto `[0,17m+3)` at 19 rows up to `m = 113` | V |
| D1 | `cbGraph_decAdj` is computable, with a bounded `∃` | none | none | axiom log: `[propext, Quot.sound]`, no `Classical.choice`; instances are subsingletons, so it does not affect the meaning of the carried definitions | V |
| A1/A2 | `n < 17m+3 ⇒ (cbVertex m n).val = n`; `v = cbVertex m n ↔ v.val = n` | the bound `h` is used by `Nat.mod_eq_of_lt` | `n % (17m+3)` | `m*.A1_cbVertex_val`; it fails outside the bound (`cbVertex 1 20 = 0`) | V |
| A3 | `Adj u v ↔ cbEdge u v ∨ cbEdge v u`; the diagonal clause is redundant because the right label exceeds the left in all 5 shapes | none | none | `m*.A3_cbEdge_right_gt_left` (and `17m+2` directed pairs); `fromRel_adj` checked in Mathlib `Basic.lean:137` | V |
| A4 | The named edges exist; `3+17i+2+2j ≤ 17(m−1)+19 = 17m+2` | `i < m`, `j < 8` | none | `m*.A4_labels_in_range`: max label `17m+2`; identity recomputed | V |
| B1 | Every `n < 17m+3` is one of the six shapes, via `i = (n−3)/17`, `q = (n−3)%17` | `¬ n ≤ 2` for the `n−3` branch | `n−3` only with `n ≥ 3`; `q−1` only for odd `q`; `q−2` only for even `q ≠ 0` | `m*.B1_unique_shape_and_decomposition` (also uniqueness) | V-imp (see O1) |
| B2 | Connected: every vertex is reached from `r` in at most 3 steps | B1 cases; `i < m` from `n < 17m+3` | as B1 | `m*.B_tree_connected_and_edges` | V |
| B3 | `cbParentVal n < n` for `n ≥ 1`; the parent at each shape; every non-root vertex is adjacent to its parent | `hn : 1 ≤ n` | `cbParentVal 0 = 0` by truncation, and it is never used (the root is excluded) | `m*.B3_parent_lt_and_adjacent`; `NSUB_cbParentVal_truncation_only_at_n0` (the only truncating input is `n = 0`) | V |
| B4 | `cbChildEdge` is injective (`v = p w ∧ w = p v ⇒ v < w < v`); its range is the edge set (every edge `(a,b)` has `b ≠ 0`, `parent b = a`) | `v.val ≠ 0` | none | `m*.B4_child_edge_bijection` | V |
| B5 | `#{v ≠ 0} + 1 = 17m+3`, so `IsTree` by `isTree_iff_connected_and_card` | none (every `m`, including `m = 0`) | none | Mathlib `Acyclic.lean:480` checked: `IsTree ↔ Connected ∧ Nat.card edgeSet + 1 = Nat.card V`; `m0` passes (the path `r–s–v`) | V |
| C | `leafSet = {v} ∪ {c_ij}`: (⇒) every other shape has two distinct neighbours; (⇐) the unique neighbour | `hm : 0 < m`, only for `r`'s second neighbour `u_0` | none | `m*.C_leafSet`; **sharpness:** at `m = 0`, `leafSet = {0, 2}` (`r` is a leaf), so the statement fails (`m0.C_hm_needed_root_is_leaf`) | V |
| D1' | `cbLowerWitness = {s} ∪ {u_i} ∪ {c_ij}`: independent, card `9m+1` | none | none | `m*.D1_lower_witness` | V |
| D2 | `|S| ≤ 9m+1` for independent `S`: `|SA| ≤ m` (uses `hm` when `r ∈ S`), `|SB| ≤ 1`, `|SC| ≤ 8m` by the injection `x ↦ ((x−3)/17, ((x−3)%17−1)/2)`; the three parts cover `S` | `hm : 0 < m` (the `r ∈ S` case: `1 ≤ m`) | `x−3` with `x ≥ 3` on `SC`; `q−1` with `q ∈ {1+2j, 2+2j}` | `m*.D2_injection_map` (both `b_ij` and `c_ij` map to `(i,j)`); exhaustive over **all 33,573** independent sets of CB(8,1): every part bound holds and the map is injective on `SC` (`m1.D2_partition_bounds_every_independent_set`) | V |
| D3 | `indepNum = 9m+1` by antisymmetry, with `indepNum` attained | `hm` | none | exact tree DP at 19 rows up to `m = 113` (`m*.D_alpha_9m_plus_1`); **sharpness:** `α(CB(8,0)) = 2 ≠ 1`; Mathlib `Clique.lean:983/991/997` checked | V |
| E1 | `W_v = {r}` (no `hm`) | none; `v` is a leaf for every `m` | none | `m*.E1_W_v_eq_r`, including `m = 0`; the seed differs from entry 69 only by the dropped binder, which its proof never used (E-3) | V |
| E2 | `W_{c_ij} = {u_i}` | `hi : i < m`, `hj : j < 8` | none | `m*.E2_W_c_eq_u`; **sharpness of `hi`:** at `m = 1`, `i = 1`, `j = 0` the label 22 wraps to `v`, `W = {r}`, but no vertex has value 20, so the statement fails (`E2_without_hi_fails_m1_i1_j0`) | V-imp (see O2) |
| F | `3·⌊(16m+4)/3⌋ < 2·indepNum + 1`, via D3, `3⌊x/3⌋ ≤ x` and `16m+4 < 18m+3 ⟺ m ≥ 1` | `hm` (through D3) | ℕ floor division; exactness not used | `F_formula_low_window_m1_to_20000`; `F_floor_property`; `F_equiv_16m4_lt_18m3_iff_m_ge_1`; the formula inequality fails at `m = 0` (`3 < 3`) | V (see O4) |
| G | card `leafSet = 8m+1`: `v ∉` the image; `17a₁+2a₂ = 17b₁+2b₂`, `a₂,b₂ < 8 ⇒` equal (`2|a₂−b₂| ≤ 14 < 17`) | `hm` (through C) | none | `m*.G_leafSet_card_8m_plus_1`; `G_injectivity_17a_2b` exhaustive for `a₁,b₁ < 150`; **sharpness:** card 2 at `m = 0` | V |
| H1 | If all leaves are favorable at `p`, then `favorableLeaves = leafSet` (`filter_true_of_mem`) | the all-favorable hypothesis | none | read against entry 74; conditional, asserts no favorability | V |
| H2/H4 | `N(u_i) = {r} ∪ {b_ij}`; `deg u_i = 9` | `hi : i < m` | none | `m*.H2_H4_N_u_and_degree`; **sharpness of `hi`:** at `m = 1`, `i = 1` the vertex wraps to `r`, which has degree 2 | V |
| H3 | `N(r) = {s} ∪ {u_i}` | none (every `m`) | none | `m*.H3_N_r`, including `m = 0` | V |
| T | The terminal: `⟨cbGraph_isTree m, hE, cb_lowWindow m (by omega), hH⟩` | `hm : 107 ≤ m` enters only as `0 < m`; `hres` unused (not referenced in the proof term); `hE` and `hH` returned verbatim | `(16m+4)/3` is ℕ division | the statement text equals the contract's `expected_statement`, the INFORMAL-PROOF display and Main.lean (E-4); the conclusion equals the SOLUTION-CONTRACT §2 terminal body (whitespace-normalized); `T_hm107_implies_pos`; `T_residue_not_needed_for_window` | V |
| X | The ℕ/cast audit section as a whole | — | — | every subtraction site is re-audited in B1, B3 and D2 above | V-imp (see O3) |

**Dependencies.** Recorded edges: A → B, C, D, E, H; B1 → B2, C, D2; C → E, G; D → F; B, F → T.
- The terminal's statement closure is textual, over Main.lean entries (E-5). It consists of `crossingIndex`,
  `forwardDifferenceDel`, `indepSetCount`, `indepSetsAvoiding`, `IsSaturatingFlow`, `indepFamily`, `transportRel`, `activeWeight`,
  `tagWitnesses`, `support`, `favorableLeaves`, `leafSet`, `IsGraphLeaf`, `IsFavorableAt`, `vertexDeletionForwardDifference`,
  `vertexDeletionIndepSetCount`, `cbGraph`, `cbEdge`, plus `cbGraph_decAdj` by instance.
- The six carried definitions the contract marks "not in the statement" appear in neither the statement closure nor the
  54-declaration proof closure: `C5LA1.H`, `C5LA1.R`, `C5LA1.aggregate`, `E993Interior.taggedFamily`, `layerWeight`,
  `WeightedHall`.
- `hres` is unused, as the contract says.
- Nothing marked NOT a dependency is a dependency.

## Reproduced Mathematical Evidence

Every instrument is my own, under `scratchpad/c1-s7-informal-LA2/`. Each uses only the standard library, and each lists its
imports in its docstring or first comment. No prior evaluator was imported, and no hashed output has a wall-clock field.

| ID | File (SHA-256) | Imports | Result |
|---|---|---|---|
| E-1 | `carry_check.py` (`8fca3f2d131f34d497d48115abcbf0a2b44b1986c0af8b934acac9c2c6a982a2`) | json, hashlib, re | `ALL_CARRIED_OK True` |
| E-2 | `cb_eval.py` (`19d965d1b57335db745c36ceb3a827be6724a334ac87ac386ab8cf735c1047e2`) | json, hashlib, itertools, collections, sys | **369 checks, 0 failed**; output `cb_eval_out.json` (`375780b9395b1b76f603757f074139592175ae138c3698cd1e1b469cf5004e29`) |
| E-3 | `seed_diff.py` (`925f3dbdaf54a5f14f3c070a381791870aa5345390be2c5f21c3096bcfbee04d`) | re, sys | seed comparison as described below |
| E-4 | `statement_check.py` (`e10c1f6744bd81030c76959e8254b68c114fb5652aab25b400f6f79817dd54bb`) | json, hashlib, re | all equalities True |
| E-5 | `dep_closure.py` (`dc63e2576d9dfca175a68568cb11b8717af360655a6ef437ba702fd1a4ea1d7f`) | re | closure as reported in the ledger |

**E-1 (carried fragments, byte for byte).** The origin award is r30 C6-LA2
(`sources/r30/lean/lean-2026-09-28-c6-la2-spider-tree-weighted-hall-rank-k-plus-3`). The mapping is origin entries 1–21 → this
run's 1–21; 35 → 22; 123 → 31; 124 → 32. For each of the 24 entries all of the following hold:
- the origin fragment's bytes hash to the origin `FORMALIZATION-STATE.json` `source_sha256`;
- that digest equals `sources/SOURCE-DIGESTS.json`;
- this run's `Snippets/` fragment is byte-identical to the origin's;
- the Main.lean managed block body is byte-identical to the fragment;
- the block marker digest equals the fragment digest;
- the names agree.

Binding and exclusions:
- The origin's own Main.lean contains every carried block verbatim.
- Its SHA-256 `df5e287022083ad3b61c2efa3ce53953da22896145fb90046f871a082a4c60fc` equals the origin kernel receipt's
  `source_sha256_before/after`. The receipt file itself hashes to `ce9dbc19…e219`, with verdict `verified`.
- First-interior `0014` `C5LA1.crossingIndex` hashes to `378868ab…`, which is C6-LA2 entry 35.
- None of r30 **C1-LA2**'s entries 0014–0021 (pre-freeze bytes, R-8) occurs in this run. I only hashed them to show this:
  `44216498…`, `d4433856…` and so on, none present.
- All 78 Main.lean blocks have marker digest = fragment digest = run-state digest.
- The only non-block text in Main.lean is `import Mathlib`, the generator comment and blank lines.
- A lexical scan finds 0 occurrences each of `sorry`, `admit`, `native_decide`, `axiom` and `decide`.
- There is exactly one `theorem`.

**E-2 (independent evaluator).** Two constructions are compared:
- **(L)** a literal transcription of `cbEdge` / `fromRel` / `cbParentVal` / `cbVertex`, with truncated ℕ subtraction;
- **(N)** CB(8,m) built by vertex names from SEMANTIC-CONTRACT §2 and mapped through the frozen labelling.

The evaluator checks:
- (L) = (N) as edge sets at `m = 0..12`;
- the labelling bijection at `m ∈ {0..12, 20, 37, 95, 107, 110, 113}`;
- every ledger item above at those rows: B1 with uniqueness, tree, parent map, edge bijection, leaves, `α` by exact tree DP,
  lower witness, the D2 map, `W_v`, `W_{c_ij}`, `N(r)`, `N(u_i)`, `deg u_i`, and the low window with the true `α`;
- the closed form of record `I(CB(8,m)) = (1+2x)G^m + x(1+x)(1+2x)^{8m}` equals the tree-DP independence polynomial at `m = 0..6`;
- the exhaustive D2 part bounds over all 33,573 independent sets of CB(8,1). That count equals `I(CB(8,1); 1)`, so every set was
  visited;
- the integer statements on grids: `3⌊(16m+4)/3⌋ < 18m+3` for `1 ≤ m ≤ 20000`; `3⌊x/3⌋ ≤ x` for `x < 10^5`;
  `16m+4 < 18m+3 ⟺ m ≥ 1` for `m ≤ 20000`; label injectivity; `(16m+4) ≡ 0 (mod 3)` on the residue-2 class;
  `107 ≤ m ⇒ 0 < m`.

Fixed points of SEMANTIC-CONTRACT §5, reproduced:
- `CB(8,95)`: `n = 1618`, `α = 856`, `p* = 508`;
- `CB(8,107)`: `n = 1822`, `α = 964` (also as the degree of the exact independence polynomial), `p* = 572`;
- `CB(8,110)`: `n = 1873`, `p* = 588`;
- `CB(8,113)`: `n = 1924`, `p* = 604`.

At `m = 107` the first strict descent of the exact independence polynomial is `x = 570`, so `hE` is satisfiable there
(`570 + 2 ≤ 572`). This is a check that the terminal's first hypothesis is not vacuous at a class row. It is **not** an award
claim, and nothing in the award asserts it.

Sharpness exhibits (where the record says a hypothesis is needed):
- `0 < m` in C, G and D3: `r` is a leaf, the leaf count is 2, and `α = 2` at `m = 0`.
- `i < m` in E2 and H4: `cbVertex` wraps at `m = 1`, `i = 1`.
- The A1 bound: `cbVertex 1 20 = 0`.

**E-3 (seed faithfulness).** Comments and doc strings are stripped, and whitespace is normalized. On that basis, all 54 NEW
declarations are identical to the DRAFT seeds, apart from the two recorded edits:
- the seeds are C-U1-T `CriticAdvance.lean` (`c94ef3bd…`) for entries 23–30, 33–73 and 78, and C-U1-F `Audit.lean` for 74–77;
- the first edit is `theorem` → `lemma` for non-terminals;
- the second is dropping `(hm : 0 < m)` from `mem_cb_tagWitnesses_v_iff`. `hm` does not occur in the seed's proof body.

So no frozen statement was widened or weakened.

**E-4 (statement identity).** The following texts are identical:
- the contract's `lean_binding.expected_statement`;
- the Main.lean source from `theorem` up to but excluding ` :=`;
- the INFORMAL-PROOF display.

Its SHA-256 matches `expected_statement_sha256` (`daf83423…a538`). The conclusion equals the SOLUTION-CONTRACT §2
`cb8_topRank_eligible_and_weightedHall` body (whitespace-normalized). The per-declaration axiom log has 78 distinct fully
qualified names, and every one is a subset of `{propext, Classical.choice, Quot.sound}`.

## Independent Critic Pass

This is a second, adversarial pass over my own ledger, with the claim unchanged.

1. **Could the terminal assert conjunct 2 or 4?** No. Both appear in the conclusion only as the hypotheses `hE` and `hH`, returned
   unchanged. The theorem is an implication, and the ledger records it as such.
   - The award is infrastructure, so a vacuity risk is not a correctness defect.
   - I nonetheless checked that `hE` holds at `m = 107` (E-2).
   - `hH`, the flow at `p*`, is fenced, and I did not test it.
2. **Could `cbGraph` differ from CB(8,m)?**
   - I built (N) from names, independently of the label arithmetic, and it equals the literal Lean relation on 13 rows.
   - The labelling is a bijection on 19 rows.
   - The universal Lean proofs, not these samples, carry the claim. The samples only confirm that the definitions mean what the
     prose says.
3. **Hidden truncation.** I searched every ℕ-subtraction in the NEW text:
   - `n−3` in `cbParentVal`, `cb_val_cases`, `cbGraph_adj_parent` and D2;
   - `q−1` and `q−2`;
   - `((x−3)%17 − 1)/2`.

   The only truncating input that is reached is `cbParentVal 0`, which is never consumed. No cast occurs in the NEW layer.
4. **Fragile hypotheses.**
   - Every `0 < m` the record calls necessary is exhibited as failing at `m = 0`.
   - Every `i < m` I tested fails without its guard.
   - `W_v`, `N(r)` and `IsTree` hold at `m = 0`, as their `hm`-free statements require.
   - `cb_lowWindow`'s conclusion happens to be true at `m = 0` (true `α = 2`: `3 < 5`), so its `hm` enters only through D3. The
     informal proof claims no sharpness for F, so this is not a defect (O4).
5. **Carry attacks.**
   - Stale r30 C1-LA2 bytes are absent.
   - U1's comment-stripped entries 15, 123 and 124 are absent: the run's blocks equal the C6-LA2 fragments, author lines
     included.
   - No cross-award `import` exists: the only import is `import Mathlib`.
6. **Dependency overclaim or underclaim.** The six "not in the statement" definitions are outside both closures (E-5), and the
   contract's dependency graph covers the statement closure.
7. **Attribution drift.** Both the INFORMAL-PROOF "Attribution" list and the contract's scope text carry the synthesis list
   verbatim:
   - structural content: r30's CB record (`R30-CB-RECORD`) and its seats;
   - Lean layer: r31 U1;
   - leaf-card and terminal reduction: C-U1-T;
   - interface lemmas: C-U1-F;
   - the integration check: the U adjudicator;
   - the network definitions: r30 awards.

   Each adds the formalizer `c1-la2-formalizer-opus-20260928` (Claude Opus 5.5).

My critic pass found no defect. It confirms the imprecisions below, none of which is load-bearing:

- **O1 (B1).** The prose says "exactly one of" the six shapes. The proof sketch, and the Lean `cb_val_cases`, establish coverage
  only. Uniqueness is true (E-2), but it is neither proved in the sketch nor needed.
- **O2 (E2).** The prose says each alternative "forces `i' = i`, `j' = j`". Some alternatives are in fact contradictions: the
  offsets `0`, `1+2j'` and `2+2j'` modulo 17 differ by parity or by zero. The rest force the indices. The conclusion is unchanged.
- **O3 (cast audit).** The audit names `forwardDifferenceDel` (inside `crossingIndex`, via `hE`) as the only cast-bearing object.
  The ℤ-valued `C4LA1.vertexDeletionForwardDifference` also occurs, inside `favorableLeaves` in `hH` and conjunct 4. As with
  `hE`, the terminal passes it through verbatim and never reasons about it, so the omission is harmless.
- **O4 (F).** The inequality chain in F needs `m ≥ 1` only because it runs through `α = 9m+1`. The low-window conclusion itself
  also holds at `m = 0`. No claim of sharpness is made.
- **O5 (record, not mathematics).** The contract's "key on closure: named by the synthesis `## Registrations`" is inherited from
  the brief. The synthesis `## Registrations` proposes **no** key for this layer ("Not proposed … The CB structural layer: r30
  content"). This is a note for the controller's registration step. It does not bear on the proof.

## Scope and Fence Check

The claim was checked against the synthesis `### C1-LA2` fences and excluded conclusions, and against formalizer brief §2 and §3.

- **Structural facts only.** The only rank-shaped statement is the low window `3p* < 2α+1` (the brief allows exactly this).
  Nothing is claimed about any other rank.
- **No (HALL), favorability or descent.**
  - (HALL) and the flow enter only as the hypothesis `hH`.
  - Descent enters only as the hypothesis `hE`.
  - `favorableLeaves_eq_leafSet_of_all` is conditional on an all-favorable hypothesis, and both faces say so.
  - No claim is made for Tier 1, (HALL) at any scope, the favorability key, E1, (ELIG-top)(a), any aggregate, TREE, FOREST,
    TRANSFER or Erdős #993. Both faces list these as excluded.
- **Infrastructure, not Tier 2 progress.** This is stated on both faces.
- **No grade asserted.** Both faces say that a compiled declaration has no grade until the award closes, and that companions
  carry no certificate.
- **Statement frozen.** The statement is not widened or weakened (E-3, E-4). The only permitted edit, dropping the unused `hm`,
  was made. Exactly one terminal `theorem`.
- **R2 (uniform proofs).** There is no `sorry`, `admit`, `native_decide`, `axiom` or `decide`. `m`, `i`, `j`, `n` and `w` are
  variables throughout. The finite splits are over label shapes, `j < 8` and parity, and each case is closed by `omega` with its
  variables symbolic.
- **R1 (single source; byte-identical carries).** Verified in E-1, with a binding to the origin kernel receipt.
- **Attribution on the face.** Present, and verbatim in both `INFORMAL-PROOF.md` and the contract's scope text (critic item 7).
- **Read-boundary disclosures.**
  - The harness injected the project `CLAUDE.md` and the user's auto-memory index at session start. Neither was used, and no
    conversation log was written: the brief confines writes to this scratch directory.
  - Beyond the brief's list, I made the following reads, all inside this run's own directory or the authorized `sources/`:
    - a names-only listing of the run directory, `RECEIPTS/` and `SOURCE/`;
    - the run's `FORMALIZATION-STATE.json`, to locate its `Snippets/`;
    - the run's `Snippets/*.lean.fragment` files;
    - `LeanProof.lean`, `lakefile.toml` and `lean-toolchain`;
    - the verdict and source-digest fields of the run's `RECEIPTS/kernel-verification.json`;
    - digests (only) of r30 C1-LA2 `Snippets/` 0014–0021, to prove their absence.
  - I grepped Mathlib only inside the pinned package directory.
  - There was no network access, no package installation, no `lake` or `lean` invocation, and no `find` or `grep` rooted above
    the permitted paths.

## Verdict

passed

`INFORMAL-PROOF.md` is a correct and complete statement-level proof of the contract's intended claim. Every definition,
inference, hypothesis entry point and ℕ-subtraction was checked against the Lean source and recomputed by independent
exact-integer evidence. The carried definitions are byte-identical to r30 C6-LA2 of record. The terminal is exactly the
SOLUTION-CONTRACT §2 body, reduced to its conjuncts 2 and 4 as hypotheses. No fenced conclusion is asserted, and the synthesis
attribution travels on both faces.

I found no defective step. Observations O1–O5 are imprecisions or record notes, not defects.

Model disclosure: chartered Claude Opus 5.5, effort high (dispatch-record authority); runtime-reported model id `claude-opus-5-5`.
