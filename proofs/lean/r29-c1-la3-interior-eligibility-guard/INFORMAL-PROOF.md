# INFORMAL-PROOF — C1-LA3 (ELIG) `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN`

Run: `runs/lean-2026-09-25-c1-la3-interior-eligibility-guard` (canonical DRE run id
`erdos-993-math-dre-20260925-r29-high-tail-certification`; r29 Cycle 1 Stage 7).
Producer: `c1-la3-formalizer-opus-20260925`. Model disclosure (two parts): chartered model **Claude Opus 5.5**, effort
high (on dispatch-record authority, `control/dispatch/c1-stage7/DISPATCH-C1-LA3.md`); runtime-reported model id,
verbatim: `claude-opus-5-5[1m]`.

Informal proof of record: synthesis `cycles/cycle-1/stage6/SYNTHESIS.md` (SHA-256
`bd7efb532f65e15df5bdf38d190d7c32f0802f9914b61ed249977e6d5bee9870`) `## Exact established results`, **R-ELIG**, with the
hypothesis map as corrected by C-T1-F, C-T1-U and T's adjudicator. This file restates it at statement level against the
exact Lean source and adds nothing mathematically new. It is not an audit; the independent proof-integrity audit is a
separate, still-pending gate.

## 1. Statement

For every finite type `V` (`[Fintype V] [DecidableEq V]`), every `G : SimpleGraph V` with `[DecidableRel G.Adj]` and
`hT : G.IsTree`: if `hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2` (in ℕ), then `7 ≤ G.indepNum`.

```lean
theorem interiorEligibilityAlphaGeSeven {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
    (hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2) :
    7 ≤ G.indepNum
```

Declared as `E993HighTail.interiorEligibilityAlphaGeSeven`; statement text SHA-256
`16f7270f20ee1f5980d1381a2297a3ea3460caf934ad0b7cc6d48299b15eac07`, byte-identical to the synthesis `### C1-LA3` block,
`SOLUTION-CONTRACT.md` §2 (Target 3) and the brief §2.

Notation: `n = Fintype.card V`, `α = G.indepNum`, `m = |E(G)|`, `i_k = C5LA1.indepSetCount G ∅ k` (independent
`k`-subsets of `V`), `Δ_k = C5LA1.forwardDifferenceDel G ∅ k = i_{k+1} − i_k` (in ℤ), `x = C5LA1.crossingIndex G` =
the least `k` with `Δ_k < 0` (`Nat.find`).

## 2. Proof (statement level; mirrors carried entry 43 and its `Guard` helpers)

The terminal theorem is the one-line application `E993Interior.eligibleAlphaGeSeven G hT hInterior` of the carried
entry 43. It is a **new terminal name applying the carried lemma, not a byte-identical re-export** (C-T1-U; T's
adjudicator). The carried proof runs as follows.

- **Step 0 (the guard in ℕ forces `α ≥ 4`).** If `α ≤ 3` then `α ∸ 2 ≤ 1 < 2 ≤ x + 2`, contradicting `hInterior`. So
  `α ≥ 4` and `α ∸ 2 = α − 2`. *(`hInterior` enters here.)*
- **Step 1 (`n ≥ α + 1`; `order_ge_alpha_succ`).** Take a maximum independent set `S` (`|S| = α`). If `n ≤ α` then
  `S = V`, so `G` has no edges; but a tree has `m + 1 = n` (`hT.card_edgeFinset`), so `n = 1 < 2 ≤ α`, a contradiction.
  *(`hT` enters: connectivity and acyclicity through `IsTree.card_edgeFinset`.)* Hence `n ≥ 5`.
- **Step 2 (`Δ_x < 0`; `crossing_negative`).** `Nat.find_spec` for the definition of `x`.
- **Step 3 (`Δ_0 ≥ 0`; `delta_zero_nonneg`).** `i_0 = 1`, `i_1 = n` (bridges `count_bridge`, `delta_bridge` to the r25
  `Erdos993G1` counts; `indep_count_zero`, `indep_count_one`), so `Δ_0 = n − 1 ≥ 0` for `n ≥ 2`. No graph hypothesis.
- **Case `α = 4`.** `hInterior` gives `x + 2 ≤ 2`, so `x = 0`, and Step 2 gives `Δ_0 < 0`, contradicting Step 3.
- **Case `α = 5`.** `x ≤ 1`. `Δ_1 = i_2 − i_1` with `i_2 + m = C(n, 2)` (entry 25 `indepCount_two_add_edges`) and
  `m = n − 1` (`hT.card_edgeFinset`), so `Δ_1 = C(n−1, 2) − n`, which is `≥ 0` for `n ≥ 6` (value 4 at `n = 6`;
  `delta_one_nonneg`, via entry 39 `scaledChooseTwo`). Here `n ≥ α + 1 = 6`. Both `x = 0` and `x = 1` contradict Step 2.
  *(`hT` enters through `card_edgeFinset` only.)*
- **Case `α = 6`.** `x ≤ 2`; `Δ_0, Δ_1 ≥ 0` as above (`n ≥ 7`), and it remains to show `Δ_2 ≥ 0`. For an acyclic graph
  (entry 34 `indepCount_three_add_edge_incidence`, which consumes `hT.isAcyclic`)
  `i_3 + m(n − 2) = C(n, 3) + D`, `D = Σ_u C(deg u, 2)`; with `i_2 = C(n, 2) − m` and `m = n − 1` this gives
  `6·Δ_2 = (n − 1)(n − 2)(n − 9) + 6D` (entries 39, 40 `scaledChooseTwo/Three`).
  - `n ≥ 9` (`delta_two_nonneg_large`): the product and `D` are both `≥ 0`.
  - `n = 7` (`delta_two_nonneg_seven`): `Δ_2 = −10 + D`. A maximum independent 6-set leaves one vertex `u`; every edge
    meets `u` (`edge_cover_subset`, `cover_degree_one`), so `deg u ≥ m = 6` and `D ≥ C(6, 2) = 15`
    (`degree_choose_ge_fifteen_at_seven`, `choose_ge_fifteen`, `choose_degree_one_le_sum`).
  - `n = 8` (`delta_two_nonneg_eight`): `Δ_2 = −7 + D`. The complement is two vertices `u ≠ w` covering all `m = 7`
    edges (`cover_degree_two`), so `deg u + deg w ≥ 7` and `D ≥ C(d, 2) + C(e, 2) ≥ 9` for `d + e ≥ 7`
    (`degree_choose_ge_nine_at_eight`, `choose_pair_ge_nine`, `choose_degree_two_le_sum`).
  - Each of `x ∈ {0, 1, 2}` then contradicts Step 2.
  *(`hT` enters: acyclicity through entry 34 in **all three** `Δ_2` branches; connectivity/edge count through
  `hT.card_edgeFinset` in all three branches and in the cover-degree bounds.)*
- **Conclusion.** `4 ≤ α ≤ 6` is impossible, so `α ≥ 7`. ∎

## 3. Hypothesis consumption

| Hypothesis | Where it enters | Notes |
|---|---|---|
| `hT : G.IsTree` — connectivity (with acyclicity, as the edge count `m + 1 = n`) | `IsTree.card_edgeFinset` in `order_ge_alpha_succ`, `delta_one_nonneg`, the three `Δ_2` branches (`delta_two_nonneg_large/seven/eight`) and the cover-degree bounds (`degree_choose_ge_fifteen_at_seven`, `degree_choose_ge_nine_at_eight`) | The only route by which connectivity is used. |
| `hT : G.IsTree` — acyclicity | `hT.isAcyclic` into entry 34 `Erdos993G1.indepCount_three_add_edge_incidence` in **all three** `Δ_2` branches; and inside `card_edgeFinset` | Correction of record (C-T1-F, C-T1-U, T's adjudicator): not only the `n ≥ 9` branch. |
| `hInterior` (ℕ) | Step 0 (`α ≥ 4`) and the three case splits bounding `x` | See the cast audit (§4). |
| `IsBipartite` | **not used** | (ELIG) is a tree statement; `IsTree.isBipartite` is never invoked. |
| `1 ≤ k`, `k ≤ a`, `p ≥ 1`, `p ≥ 2` | **not applicable** | No rank variable `k` or `p` is bound in this statement; the depth is fixed at `p = α − 2` through `hInterior`. |
| instance arguments `[Fintype V] [DecidableEq V] [DecidableRel G.Adj]` | carriers for the `Finset` counts of entries 10–14 | No mathematical content. |

## 4. ℕ/ℤ cast audit

- `hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2` is an inequality of natural numbers with truncated
  subtraction. **It is equivalent to the integer hypothesis `(x : ℤ) + 2 ≤ (α : ℤ) − 2` for every `α`:** when `α < 2`
  the ℕ right side is `0` and the integer right side is negative, and `x + 2 ≥ 2`, so both are false; when `α ≥ 2`,
  `α ∸ 2 = α − 2` and the two are identical. So the Lean hypothesis is exactly the registry's integer hypothesis
  `x(T) + 2 ≤ p` with `p = α(T) − 2`.
- `x` is a natural number (`Nat.find`), and `Δ_k` is an integer by definition (entry 12 casts the natural counts).
- The conclusion `7 ≤ G.indepNum` is in ℕ; no cast.
- Inside the carried proof the natural counts are bridged to the r25 `ℤ`-valued `Erdos993G1.indepCount` through
  `count_bridge` (entries 19, 26) and `delta_nat` (entry 21); `((n − 2 : ℕ) : ℤ) + 2 = n` is used under `n ≥ 2`
  (`delta_two_nonneg_large`). Every truncated subtraction there is guarded by `n ≥ α + 1 ≥ 5`.

## 5. Attribution, fences and excluded conclusions

- **Attribution.** Codex (GPT-6): entry 43's proof (the three low-`α` exclusions) and the proposed statement. r25: the G1
  definitions (entries 15–17, byte-identical to the r25 award) and the `Erdos993G1` counting layer as carried in the
  first-interior source. r24 C4-LA1 / r26: the `C4LA1` / `C5LA1` definition layer of record (entries 1–14). r29: T1's
  extraction, as corrected by C-T1-F, C-T1-U and T's adjudicator (acyclicity in all three `Δ_2` branches); U's
  adjudicator's recomputation (and its scratch candidate, the base of this file). This formalizer authored no
  mathematics: the only new declaration is the terminal application.
- **Fences.** §3.1: (ELIG) is a statement about independent-set counts on finite trees; it is not a no-recovery statement
  and transfers no status to `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER,
  `E993-BETA-AGG` or Erdős #993. §3.2: `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` (VERIFIED, the first-interior award)
  is unchanged and never re-registered; the relation of (ELIG) to it — (ELIG) is the eligibility guard compiled
  internally inside that award — is a scope note only. §3.5: no census value, r27 root correction or r28 Hall/SDR route
  is used. §3.7: attribution travels on every face (above). §3.8: this award is its own certificate; the presence of
  entry 43 inside the first-interior package is context, never a certificate.
- **Excluded conclusions.** No aggregate sign; no statement at any other depth; no no-recovery or unimodality claim; no
  re-certification of `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`.

## 6. Carry table (Lean source of record `LeanProject/LeanProof/Main.lean`)

Every carried entry was registered through the registrar from the frozen first-interior fragment path, and its
registrar digest equals the frozen `FORMALIZATION-STATE.json` digest (`CAPSULE-VERIFICATION.json` → `registrar`).
Private helpers travel inside their fragment (entry 43 carries the twenty `E993Interior.Guard` helpers).

| Original entry | Run entry | Kind | Declaration | SHA-256 | Origin / provenance |
|---|---|---|---|---|---|
| 1 | 1 | definition | `C4LA1.vertexDeletionIndepSetCount` | `7e0a588e243735a611c919ea1080816911a3e27e4523478af0c0f560ce1b3b48` | first-interior fragment `Snippets/0001-definition-C4LA1-vertexDeletionIndepSetCount.lean.fragment`, byte-identical |
| 2 | 2 | definition | `C4LA1.vertexDeletionForwardDifference` | `c2da50eb16ee788c439b146577efeedd7dd42811c6943fb437585edcf63b5880` | first-interior fragment `Snippets/0002-definition-C4LA1-vertexDeletionForwardDifference.lean.fragment`, byte-identical |
| 3 | 3 | definition | `C4LA1.IsFavorableAt` | `25d8f7d274f9080468bf6d46acc6db3d4a469c2e399e7faee6cdcee24290a0db` | first-interior fragment `Snippets/0003-definition-C4LA1-IsFavorableAt.lean.fragment`, byte-identical |
| 4 | 4 | definition | `C4LA1.IsGraphLeaf` | `65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5` | first-interior fragment `Snippets/0004-definition-C4LA1-IsGraphLeaf.lean.fragment`, byte-identical |
| 5 | 5 | definition | `C5LA1.support` | `8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4` | first-interior fragment `Snippets/0005-definition-C5LA1-support.lean.fragment`, byte-identical |
| 6 | 6 | definition | `C5LA1.leafSet` | `78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697` | first-interior fragment `Snippets/0006-definition-C5LA1-leafSet.lean.fragment`, byte-identical |
| 7 | 7 | definition | `C5LA1.leafDegree` | `ccfc9b2f549aa8c9986931152d249096ce49e3ccd3b67f4afd8678a749d93a68` | first-interior fragment `Snippets/0007-definition-C5LA1-leafDegree.lean.fragment`, byte-identical |
| 8 | 8 | definition | `C5LA1.H` | `55f37d9161901d6006e571cf548c4e56675c9d786a1aba83e7889ad9d443224d` | first-interior fragment `Snippets/0008-definition-C5LA1-H.lean.fragment`, byte-identical |
| 9 | 9 | definition | `C5LA1.R` | `a0407d82ab112a65a0f9d85970e9d6217b66201680cc079a4ba13751e53dc6b8` | first-interior fragment `Snippets/0009-definition-C5LA1-R.lean.fragment`, byte-identical |
| 10 | 10 | definition | `C5LA1.indepSetsAvoiding` | `ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368` | first-interior fragment `Snippets/0010-definition-C5LA1-indepSetsAvoiding.lean.fragment`, byte-identical |
| 11 | 11 | definition | `C5LA1.indepSetCount` | `e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71` | first-interior fragment `Snippets/0011-definition-C5LA1-indepSetCount.lean.fragment`, byte-identical |
| 12 | 12 | definition | `C5LA1.forwardDifferenceDel` | `60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f` | first-interior fragment `Snippets/0012-definition-C5LA1-forwardDifferenceDel.lean.fragment`, byte-identical |
| 13 | 13 | definition | `C5LA1.aggregate` | `d66e776c5cf49b2a78a2d9713e4a41de2cbaf5de0af7b6d580075064d1daea8b` | first-interior fragment `Snippets/0013-definition-C5LA1-aggregate.lean.fragment`, byte-identical |
| 14 | 14 | definition | `C5LA1.crossingIndex` | `378868ab2e660af8a36ea0b1045c55bc60f8383dca3d31dd85c4b52fa8a898fb` | first-interior fragment `Snippets/0014-definition-C5LA1-crossingIndex.lean.fragment`, byte-identical |
| 15 | 15 | definition | `Erdos993G1.indepCount` | `f6bc96fd41a76a97b28a866a483e2b1d637d371832690897422edeeb9b65bc2b` | first-interior fragment `Snippets/0015-definition-Erdos993G1-indepCount.lean.fragment`, byte-identical |
| 16 | 16 | definition | `Erdos993G1.coeff` | `15ce5e3474a249e2ae5d727a1012a8f6bea52cbbf8188b13cfe247eb844d5cf8` | first-interior fragment `Snippets/0016-definition-Erdos993G1-coeff.lean.fragment`, byte-identical |
| 17 | 17 | definition | `Erdos993G1.delta` | `d7dc776c79754ed209810ad69194b3b65d71e3bf718124b0133c53d1bee1a42c` | first-interior fragment `Snippets/0017-definition-Erdos993G1-delta.lean.fragment`, byte-identical |
| 19 | 18 | lemma | `Erdos993G1.indepCount_eq_card_indepSetFinset` | `01ee774fedf7bb37cb52000e541f0c8196f3882ce0e4c5a77cc46e05ba98e876` | first-interior fragment `Snippets/0019-lemma-Erdos993G1-indepCount_eq_card_indepSetFinset.lean.fragment`, byte-identical |
| 20 | 19 | lemma | `Erdos993G1.coeff_nat` | `91c74d915628f89477cb21d889b1e6cb464d34247520df6084260b72ec796440` | first-interior fragment `Snippets/0020-lemma-Erdos993G1-coeff_nat.lean.fragment`, byte-identical |
| 21 | 20 | lemma | `Erdos993G1.delta_nat` | `61f3c4d43f5847c9c65da6c606c0fa3083078cfbc394be9e5d90b14463c042a9` | first-interior fragment `Snippets/0021-lemma-Erdos993G1-delta_nat.lean.fragment`, byte-identical |
| 22 | 21 | lemma | `Erdos993G1.isNIndepSet_pair_iff` | `a5eb6d6e8d552c64fa2cb4001d5f440637a38ef7c2e15e179c1eaaab1db9d412` | first-interior fragment `Snippets/0022-lemma-Erdos993G1-isNIndepSet_pair_iff.lean.fragment`, byte-identical |
| 23 | 22 | lemma | `Erdos993G1.sym2_toFinset_injective` | `d90c2a73eb34028360b6e19de80ccb0f42b1901ef4a1fec0e9cc0281ba551a02` | first-interior fragment `Snippets/0023-lemma-Erdos993G1-sym2_toFinset_injective.lean.fragment`, byte-identical |
| 24 | 23 | lemma | `Erdos993G1.indepSetFinset_two_eq` | `9a618f5577e807ae3ba07edfc6fb09ddfe732dc3bca7f5260288a798c219a0d1` | first-interior fragment `Snippets/0024-lemma-Erdos993G1-indepSetFinset_two_eq.lean.fragment`, byte-identical |
| 25 | 24 | lemma | `Erdos993G1.indepCount_two_add_edges` | `889082ae5e0ef42ec09114ff404a94b0e30b0f5d9d2f4e621868328930e53ce3` | first-interior fragment `Snippets/0025-lemma-Erdos993G1-indepCount_two_add_edges.lean.fragment`, byte-identical |
| 26 | 25 | lemma | `Erdos993G1.indepSetFinset_eq_filter_powersetCard` | `5dae608f7a4c0080d5baf5c3d9c7f348b9ca8c8fe0696a8ff41609ad9715e16b` | first-interior fragment `Snippets/0026-lemma-Erdos993G1-indepSetFinset_eq_filter_powersetCard.lean.fragment`, byte-identical |
| 27 | 26 | lemma | `Erdos993G1.card_nonindep_pairs` | `6e86164cc77740b70b633979f1bb9f55b1379ed261467391fe51ffb0836f3fcf` | first-interior fragment `Snippets/0027-lemma-Erdos993G1-card_nonindep_pairs.lean.fragment`, byte-identical |
| 28 | 27 | lemma | `Erdos993G1.sum_card_filter_swap` | `8a32f504cb65462cc407e7d76e8cfa05f1df7f218b7072b70414f24aba94a68f` | first-interior fragment `Snippets/0028-lemma-Erdos993G1-sum_card_filter_swap.lean.fragment`, byte-identical |
| 29 | 28 | lemma | `Erdos993G1.sum_nonindep_pair_incidence` | `bafc19d498fd73893dbbd27856e681905568a5a1ed659a421802e2d1f4c4b1d9` | first-interior fragment `Snippets/0029-lemma-Erdos993G1-sum_nonindep_pair_incidence.lean.fragment`, byte-identical |
| 30 | 29 | lemma | `Erdos993G1.sum_indep_indicator` | `967e8cea5583894061db4c306ff05690dfe200422d9c6fd62d559a8ffbb1b3a8` | first-interior fragment `Snippets/0030-lemma-Erdos993G1-sum_indep_indicator.lean.fragment`, byte-identical |
| 31 | 30 | lemma | `Erdos993G1.triple_local_identity` | `b2a3d62321344a280924b2701b63fda6abb7f1fd6e8bba69fd46b6fc7538fbe7` | first-interior fragment `Snippets/0031-lemma-Erdos993G1-triple_local_identity.lean.fragment`, byte-identical |
| 32 | 31 | lemma | `Erdos993G1.indepSetFinset_three_incidence` | `e75d6c9bdb5332d9efa9c20535c35c0f047fcbf29add7232eaabf570bdb871a2` | first-interior fragment `Snippets/0032-lemma-Erdos993G1-indepSetFinset_three_incidence.lean.fragment`, byte-identical |
| 33 | 32 | lemma | `Erdos993G1.sum_triple_centered_neighbor_pairs` | `2d8c865096680299876ca4ee7a094c41cf849dd15d7c4ac33ae166f43d34e549` | first-interior fragment `Snippets/0033-lemma-Erdos993G1-sum_triple_centered_neighbor_pairs.lean.fragment`, byte-identical |
| 34 | 33 | lemma | `Erdos993G1.indepCount_three_add_edge_incidence` | `2f67af0812ec6608bd511d62e5579e86d21d3d59da08da663d11a124768a627e` | first-interior fragment `Snippets/0034-lemma-Erdos993G1-indepCount_three_add_edge_incidence.lean.fragment`, byte-identical |
| 35 | 34 | lemma | `Erdos993G1.forest_card_edges_add_components` | `7eef4f723871eb13f3132efb877cda06e5b4a7498589fca0a012eb49339ea183` | first-interior fragment `Snippets/0035-lemma-Erdos993G1-forest_card_edges_add_components.lean.fragment`, byte-identical |
| 36 | 35 | lemma | `Erdos993G1.components_card_pos_of_card_pos` | `2948f2bea2afbc682160cd1afae04ff4f83f519d4413e437dddd787c6d33f3a8` | first-interior fragment `Snippets/0036-lemma-Erdos993G1-components_card_pos_of_card_pos.lean.fragment`, byte-identical |
| 37 | 36 | lemma | `Erdos993G1.degreeDefect_nonneg` | `e13b00906721b8a815d185d3bc4f38148fccc231d200b3bb820579c0f05fdb8f` | first-interior fragment `Snippets/0037-lemma-Erdos993G1-degreeDefect_nonneg.lean.fragment`, byte-identical |
| 38 | 37 | lemma | `Erdos993G1.degreeChoose_sum_lower` | `990ee7b780b0a7a0c7c6a7c34cf026d13ded3d7de15d826aec6ea560dc1bff35` | first-interior fragment `Snippets/0038-lemma-Erdos993G1-degreeChoose_sum_lower.lean.fragment`, byte-identical |
| 39 | 38 | lemma | `Erdos993G1.scaledChooseTwo` | `998f5e2749af9a08a08bf161dcce06d9fe4036299593a66572a2f1d12eee0ca4` | first-interior fragment `Snippets/0039-lemma-Erdos993G1-scaledChooseTwo.lean.fragment`, byte-identical |
| 40 | 39 | lemma | `Erdos993G1.scaledChooseThree` | `d6f3427951f65a5d5b754f7876b5fa0b8e855ce52dfa70173a4ab26edf87aff0` | first-interior fragment `Snippets/0040-lemma-Erdos993G1-scaledChooseThree.lean.fragment`, byte-identical |
| 43 | 40 | lemma | `E993Interior.eligibleAlphaGeSeven` | `dbd200bd15cf7cf8ce2516587fb25491dbddad2b171a079bda87b92258c32b06` | first-interior fragment `Snippets/0043-lemma-E993Interior-eligibleAlphaGeSeven.lean.fragment`, byte-identical |
| — | 41 | theorem | `E993HighTail.interiorEligibilityAlphaGeSeven` | `0af7147bf85c54d14e43528590d52c2d0ee8bebec0d80270896e2b9a84f54cea` | NEW in this run (declaration text transported byte-identically from `ADJ-U-awards-LA3-Main.lean`; see §6) |

**Carry files (R2).** `sources/c1-stage7-sources/ADJ-U-awards-LA3-Main.lean` (SHA-256
`1ef28389c46e148a6f097d504b57c190ce7df2febaed2930e9a14041db70528d`, 42,882 B; origin
`scratchpad/c1-adj-U/awards/LA3/LeanProject/LeanProof/Main.lean`, U's adjudicator) is the base candidate: its carried
blocks are exactly the forty fragments above, and the terminal declaration text (`theorem … := E993Interior.eligibleAlphaGeSeven
G hT hInterior`, 280 bytes, SHA-256 `899e87a4732a8744d42d013fe11f6a3c2bac936a9f1b285da80a4f14f2d37e32`) is transported
from it byte-identically at the declaration level. Adjudicator-authored text; attributed to U's adjudicator. The
namespace wrapper, the `open E993Interior` line and the comment lines are this seat's wrapper, not body.
`sources/c1-stage7-sources/C-U1-F-LA3-Main.lean` (SHA-256 `65740a3e80655f287cdb7e101b932f8a66c2adde9095220d0e153f1ad3f020f2`,
34,277 B) was digest-verified and **not used** (the plan-of-record carry was chosen over C-U1-F's smaller option).
No declaration was re-derived.
