# Theorem Contract: C5-LA1 (r30 Cycle 5, erdos-993-math-dre-20260926-r30-weighted-transport): the tree face and (HALL) at every eligible rank of G_k

- Contract ID: `erdos-993-r30-c5-la1-gk-weighted-hall-every-eligible-rank-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `3acc3c906fb4f078bffeb269ba1299207aa39a163875487ae84cc48f22010930`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every k : Nat, the graph G_k = gkGraph k on Fin (3k+5) (root 0; leaf 1; cherry 2 with leaves 3, 4; k arms 0 - a_i - b_i - c_i) is a tree, and for every rank p with crossingIndex(G_k) + 2 <= p and 3p < 2 indepNum(G_k) + 1 the transport network of SOLUTION-CONTRACT section 2 at rank p with tag set F_p(G_k) = favorableLeaves (gkGraph k) p admits a saturating integral flow. hLow is carried and unused. Proof DAG: N0 carried (C4-LA1 entries 1-112, first-interior entry 14); N1 gkGraph_isTree (U1); N4a count bridge i_(j+1) = u_(j+1) + u_j, i_0 = u_0 (gkHalfCount); N4b u_j <= u_(j+2) for j + 2 <= k + 1; N4 = GK-MONO in Lean (0 <= Delta_j for j <= k); N2 k + 1 <= crossingIndex iff no descent at j <= k (C-U1-F); N3 reduction to C4-LA1 lemma entry 110 (C-U1-F); terminal = <N1, N3 o N2 o N4>. Fences: G_k only; deletion-supported flows (C4-LA1's); not (HALL) at full scope; not 'every tree'; nothing about the primary aggregate beyond G_k; not an RTree statement; not the strict GK-SIGN; G_k is not a second family for gate ruling 39; the k = 3 row (n = 14, p = 6) lies in the formally closed band n <= 2p+2 and is covered without re-proving that band; no statement about switch arcs or cuts; no status change of (HALL), the primary aggregate or any refuted key; (HALL) is asserted at no scope other than this theorem's own family. Companions: GK-MONO (key E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE) is stated on the face as a companion; its Lean form is the lemma gk_forwardDifference_nonneg (N4); this contract asserts no grade for any companion (the controller rules). Eligible set nonempty iff k >= 3 (informal companion fact, SR-C4-8; indepNum = 2k+3 not authored). Canonical run id erdos-993-math-dre-20260926-r30-weighted-transport; award C5-LA1; key on closure E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK (separate from C4-LA1's key). Attribution: mechanism and the lower-region run: Codex GPT-6; definition layers: first-interior (Codex) entries 1-18 incl. C5LA1.crossingIndex (entry 14), the r26/r24/r25 carried layers; C1-LA1/C1-LA2 (r30); the G_k flow: C4-LA1 (r30 Cycle 4; CT-1 by critic C-F2-T, R2' by the Cycle 4 F adjudicator); gkGraph_isTree: U1 (Claude Sonnet 5); GK-MONO: C-U1-T and C-U1-F (Claude Opus 5.5); the Lean reduction: C-U1-F; the composition and DAG: the Cycle 5 U adjudicator (Claude Opus 5.5); count bridge fibre count, N4b re-pairing and integer closing step, and Lean assembly: the C5-LA1 formalizer (Claude Opus 5.5); r29 high tail: not used.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993Transport.gk_lowerRegionWeightedHall_everyEligibleRank`
- Statement SHA-256: `2effae848dda25fd9ee30432264ded33f7049dea69f4418781443702bc931156`

```lean
theorem gk_lowerRegionWeightedHall_everyEligibleRank (k : ℕ) :
    (gkGraph k).IsTree ∧
    ∀ p : ℕ, C5LA1.crossingIndex (gkGraph k) + 2 ≤ p → 3 * p < 2 * (gkGraph k).indepNum + 1 →
      ∃ f, IsSaturatingFlow (gkGraph k) (favorableLeaves (gkGraph k) p) p f
```

## Quantifiers

- `forall k` over `dom-k`
- `forall p` over `dom-p`
- `exists f` over `dom-f`

## Hypotheses

- `hyp-elig`: C5LA1.crossingIndex (gkGraph k) + 2 ≤ p (hElig; a Nat inequality, no subtraction guard; the ONLY hypothesis consumed: it gives p >= k + 3 through k + 1 <= crossingIndex (gkGraph k)).
- `hyp-low`: 3 * p < 2 * (gkGraph k).indepNum + 1 (hLow; carried to match SOLUTION-CONTRACT section 2 (HALL) signature; UNUSED by the proof).

## Conclusion

- `conclusion`: (gkGraph k).IsTree ∧ ∀ p : ℕ, C5LA1.crossingIndex (gkGraph k) + 2 ≤ p → 3 * p < 2 * (gkGraph k).indepNum + 1 → ∃ f, IsSaturatingFlow (gkGraph k) (favorableLeaves (gkGraph k) p) p f. For every k: G_k is a tree, and at every eligible rank p the network with tag set F_p(G_k) has a saturating integral flow ((HALL) in flow form). The deletion-support conjunct of C4-LA1 is omitted from the conclusion (choice recorded). Fences: G_k only; deletion-supported flows (C4-LA1's); not (HALL) at full scope; not 'every tree'; nothing about the primary aggregate beyond G_k; not an RTree statement; not the strict GK-SIGN; G_k is not a second family for gate ruling 39; the k = 3 row (n = 14, p = 6) lies in the formally closed band n <= 2p+2 and is covered without re-proving that band; no statement about switch arcs or cuts; no status change of (HALL), the primary aggregate or any refuted key; (HALL) is asserted at no scope other than this theorem's own family. Companions: GK-MONO (key E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE) is stated on the face as a companion; its Lean form is the lemma gk_forwardDifference_nonneg (N4); this contract asserts no grade for any companion (the controller rules). Eligible set nonempty iff k >= 3 (informal companion fact, SR-C4-8; indepNum = 2k+3 not authored). Canonical run id erdos-993-math-dre-20260926-r30-weighted-transport; award C5-LA1; key on closure E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK (separate from C4-LA1's key).

## Dependencies

- `def-gk-edge` -> `def-gk-graph`
- `def-gk-graph` -> `def-gk-dec-adj`
- `def-indep-sets-avoiding` -> `def-indep-set-count`
- `def-indep-set-count` -> `def-forward-difference-del`
- `def-forward-difference-del` -> `def-crossing-index`
- `def-indep-set-count` -> `def-crossing-index`
- `def-indep-sets-avoiding` -> `def-crossing-index`
- `def-indep-num` -> `def-crossing-index`
- `def-vertex-deletion-indep-set-count` -> `def-vertex-deletion-forward-difference`
- `def-vertex-deletion-forward-difference` -> `def-is-favorable-at`
- `def-is-graph-leaf` -> `def-leaf-set`
- `def-is-graph-leaf` -> `def-support`
- `def-leaf-set` -> `def-favorable-leaves`
- `def-is-favorable-at` -> `def-favorable-leaves`
- `def-support` -> `def-tag-witnesses`
- `def-tag-witnesses` -> `def-active-weight`
- `def-indep-family` -> `def-is-saturating-flow`
- `def-transport-rel` -> `def-is-saturating-flow`
- `def-active-weight` -> `def-is-saturating-flow`
- `dom-k` -> `dom-f`
- `def-crossing-index` -> `hyp-elig`
- `def-gk-graph` -> `hyp-elig`
- `def-gk-dec-adj` -> `hyp-elig`
- `dom-k` -> `hyp-elig`
- `dom-p` -> `hyp-elig`
- `def-indep-num` -> `hyp-low`
- `def-gk-graph` -> `hyp-low`
- `dom-k` -> `hyp-low`
- `dom-p` -> `hyp-low`
- `hyp-elig` -> `conclusion`
- `hyp-low` -> `conclusion`
- `def-is-tree` -> `conclusion`
- `def-is-saturating-flow` -> `conclusion`
- `def-favorable-leaves` -> `conclusion`
- `def-gk-graph` -> `conclusion`
- `dom-f` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-adjudication-u`: `SOURCE/governing/ADJUDICATION-U.md` (match)
- `src-brief`: `SOURCE/governing/C5-STAGE7-FORMALIZER-BRIEF-LA1.md` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-carried-c4la1-001`: `LeanProject/LeanProof/Snippets/0001-definition-C4LA1-vertexDeletionIndepSetCount.lean.fragment` (match)
- `src-carried-c4la1-002`: `LeanProject/LeanProof/Snippets/0002-definition-C4LA1-vertexDeletionForwardDifference.lean.fragment` (match)
- `src-carried-c4la1-003`: `LeanProject/LeanProof/Snippets/0003-definition-C4LA1-IsFavorableAt.lean.fragment` (match)
- `src-carried-c4la1-004`: `LeanProject/LeanProof/Snippets/0004-definition-C4LA1-IsGraphLeaf.lean.fragment` (match)
- `src-carried-c4la1-005`: `LeanProject/LeanProof/Snippets/0005-definition-C5LA1-support.lean.fragment` (match)
- `src-carried-c4la1-006`: `LeanProject/LeanProof/Snippets/0006-definition-C5LA1-leafSet.lean.fragment` (match)
- `src-carried-c4la1-007`: `LeanProject/LeanProof/Snippets/0007-definition-C5LA1-H.lean.fragment` (match)
- `src-carried-c4la1-008`: `LeanProject/LeanProof/Snippets/0008-definition-C5LA1-R.lean.fragment` (match)
- `src-carried-c4la1-009`: `LeanProject/LeanProof/Snippets/0009-definition-C5LA1-indepSetsAvoiding.lean.fragment` (match)
- `src-carried-c4la1-010`: `LeanProject/LeanProof/Snippets/0010-definition-C5LA1-indepSetCount.lean.fragment` (match)
- `src-carried-c4la1-011`: `LeanProject/LeanProof/Snippets/0011-definition-C5LA1-forwardDifferenceDel.lean.fragment` (match)
- `src-carried-c4la1-012`: `LeanProject/LeanProof/Snippets/0012-definition-C5LA1-aggregate.lean.fragment` (match)
- `src-carried-c4la1-013`: `LeanProject/LeanProof/Snippets/0013-definition-E993Interior-taggedFamily.lean.fragment` (match)
- `src-carried-c4la1-014`: `LeanProject/LeanProof/Snippets/0014-definition-E993Transport-indepFamily.lean.fragment` (match)
- `src-carried-c4la1-015`: `LeanProject/LeanProof/Snippets/0015-definition-E993Transport-tagWitnesses.lean.fragment` (match)
- `src-carried-c4la1-016`: `LeanProject/LeanProof/Snippets/0016-definition-E993Transport-activeWeight.lean.fragment` (match)
- `src-carried-c4la1-017`: `LeanProject/LeanProof/Snippets/0017-definition-E993Transport-layerWeight.lean.fragment` (match)
- `src-carried-c4la1-018`: `LeanProject/LeanProof/Snippets/0018-definition-E993Transport-favorableLeaves.lean.fragment` (match)
- `src-carried-c4la1-019`: `LeanProject/LeanProof/Snippets/0019-definition-E993Transport-transportRel.lean.fragment` (match)
- `src-carried-c4la1-020`: `LeanProject/LeanProof/Snippets/0020-definition-E993Transport-IsSaturatingFlow.lean.fragment` (match)
- `src-carried-c4la1-021`: `LeanProject/LeanProof/Snippets/0021-definition-E993Transport-WeightedHall.lean.fragment` (match)
- `src-carried-c4la1-022`: `LeanProject/LeanProof/Snippets/0022-definition-E993Transport-gkEdge.lean.fragment` (match)
- `src-carried-c4la1-023`: `LeanProject/LeanProof/Snippets/0023-definition-E993Transport-gkGraph.lean.fragment` (match)
- `src-carried-c4la1-024`: `LeanProject/LeanProof/Snippets/0024-definition-E993Transport-gkGraph_decAdj.lean.fragment` (match)
- `src-carried-c4la1-025`: `LeanProject/LeanProof/Snippets/0025-definition-E993Transport-ChainFactor.lean.fragment` (match)
- `src-carried-c4la1-026`: `LeanProject/LeanProof/Snippets/0026-definition-E993Transport-ChainFactor-verts.lean.fragment` (match)
- `src-carried-c4la1-027`: `LeanProject/LeanProof/Snippets/0027-definition-E993Transport-ChainFactor-code.lean.fragment` (match)
- `src-carried-c4la1-028`: `LeanProject/LeanProof/Snippets/0028-definition-E993Transport-ChainFactor-drop.lean.fragment` (match)
- `src-carried-c4la1-029`: `LeanProject/LeanProof/Snippets/0029-definition-E993Transport-ChainFactor-rk.lean.fragment` (match)
- `src-carried-c4la1-030`: `LeanProject/LeanProof/Snippets/0030-definition-E993Transport-ChainFactor-Valid.lean.fragment` (match)
- `src-carried-c4la1-031`: `LeanProject/LeanProof/Snippets/0031-definition-E993Transport-chainDownUp.lean.fragment` (match)
- `src-carried-c4la1-032`: `LeanProject/LeanProof/Snippets/0032-definition-E993Transport-chainDownVertex.lean.fragment` (match)
- `src-carried-c4la1-033`: `LeanProject/LeanProof/Snippets/0033-definition-E993Transport-chainVerts.lean.fragment` (match)
- `src-carried-c4la1-034`: `LeanProject/LeanProof/Snippets/0034-definition-E993Transport-chainSize.lean.fragment` (match)
- `src-carried-c4la1-035`: `LeanProject/LeanProof/Snippets/0035-definition-E993Transport-chainRank.lean.fragment` (match)
- `src-carried-c4la1-036`: `LeanProject/LeanProof/Snippets/0036-definition-E993Transport-ChainValid.lean.fragment` (match)
- `src-carried-c4la1-037`: `LeanProject/LeanProof/Snippets/0037-definition-E993Transport-ChainDisjoint.lean.fragment` (match)
- `src-carried-c4la1-038`: `LeanProject/LeanProof/Snippets/0038-definition-E993Transport-gkVertex.lean.fragment` (match)
- `src-carried-c4la1-039`: `LeanProject/LeanProof/Snippets/0039-definition-E993Transport-gkLeafBlock.lean.fragment` (match)
- `src-carried-c4la1-040`: `LeanProject/LeanProof/Snippets/0040-definition-E993Transport-gkCherryBlock.lean.fragment` (match)
- `src-carried-c4la1-041`: `LeanProject/LeanProof/Snippets/0041-definition-E993Transport-gkArmBlock.lean.fragment` (match)
- `src-carried-c4la1-042`: `LeanProject/LeanProof/Snippets/0042-definition-E993Transport-gkArmIndex.lean.fragment` (match)
- `src-carried-c4la1-043`: `LeanProject/LeanProof/Snippets/0043-definition-E993Transport-gkTagFactors.lean.fragment` (match)
- `src-carried-c4la1-044`: `LeanProject/LeanProof/Snippets/0044-definition-E993Transport-gkTagDown.lean.fragment` (match)
- `src-carried-c4la1-045`: `LeanProject/LeanProof/Snippets/0053-lemma-E993Interior-highTailAggregateFromShadow.lean.fragment` (match)
- `src-carried-c4la1-046`: `LeanProject/LeanProof/Snippets/0054-lemma-E993Transport-indepFamily_eq_indepSetsAvoiding.lean.fragment` (match)
- `src-carried-c4la1-047`: `LeanProject/LeanProof/Snippets/0055-lemma-E993Transport-isGraphLeaf_of_mem_favorableLeaves.lean.fragment` (match)
- `src-carried-c4la1-048`: `LeanProject/LeanProof/Snippets/0056-lemma-E993Transport-tagWitnesses_subset_R.lean.fragment` (match)
- `src-carried-c4la1-049`: `LeanProject/LeanProof/Snippets/0057-lemma-E993Transport-card_active_eq_tagged.lean.fragment` (match)
- `src-carried-c4la1-050`: `LeanProject/LeanProof/Snippets/0058-lemma-E993Transport-layerWeight_eq_sum_card.lean.fragment` (match)
- `src-carried-c4la1-051`: `LeanProject/LeanProof/Snippets/0059-lemma-E993Transport-layerWeight_sub_eq_sum.lean.fragment` (match)
- `src-carried-c4la1-052`: `LeanProject/LeanProof/Snippets/0060-lemma-E993Transport-activeWeightAggregateIdentity.lean.fragment` (match)
- `src-carried-c4la1-053`: `LeanProject/LeanProof/Snippets/0061-lemma-E993Transport-aggregate_nonpos_of_saturatingFlow.lean.fragment` (match)
- `src-carried-c4la1-054`: `LeanProject/LeanProof/Snippets/0062-lemma-E993Transport-weightedHall_of_saturatingFlow.lean.fragment` (match)
- `src-carried-c4la1-055`: `LeanProject/LeanProof/Snippets/0063-lemma-E993Transport-ChainFactor-card_inter_path_eq.lean.fragment` (match)
- `src-carried-c4la1-056`: `LeanProject/LeanProof/Snippets/0064-lemma-E993Transport-ChainFactor-two_mul_card_add_len_eq.lean.fragment` (match)
- `src-carried-c4la1-057`: `LeanProject/LeanProof/Snippets/0065-lemma-E993Transport-ChainFactor-code_fst_le_snd.lean.fragment` (match)
- `src-carried-c4la1-058`: `LeanProject/LeanProof/Snippets/0066-lemma-E993Transport-ChainFactor-exists_drop_of_code_pos.lean.fragment` (match)
- `src-carried-c4la1-059`: `LeanProject/LeanProof/Snippets/0067-lemma-E993Transport-ChainFactor-code_erase_of_notMem.lean.fragment` (match)
- `src-carried-c4la1-060`: `LeanProject/LeanProof/Snippets/0068-lemma-E993Transport-ChainFactor-drop_mem_or_mem_of_ne.lean.fragment` (match)
- `src-carried-c4la1-061`: `LeanProject/LeanProof/Snippets/0069-lemma-E993Transport-mem_chainVerts_iff.lean.fragment` (match)
- `src-carried-c4la1-062`: `LeanProject/LeanProof/Snippets/0070-lemma-E993Transport-chainDownUp_erase_of_notMem.lean.fragment` (match)
- `src-carried-c4la1-063`: `LeanProject/LeanProof/Snippets/0071-lemma-E993Transport-two_mul_chainSize_add_up_eq.lean.fragment` (match)
- `src-carried-c4la1-064`: `LeanProject/LeanProof/Snippets/0072-lemma-E993Transport-mem_and_exists_drop_of_chainDownVertex.lean.fragment` (match)
- `src-carried-c4la1-065`: `LeanProject/LeanProof/Snippets/0073-lemma-E993Transport-exists_chainDownVertex_of_down_pos.lean.fragment` (match)
- `src-carried-c4la1-066`: `LeanProject/LeanProof/Snippets/0074-lemma-E993Transport-chainDownUp_erase_chainDownVertex.lean.fragment` (match)
- `src-carried-c4la1-067`: `LeanProject/LeanProof/Snippets/0075-lemma-E993Transport-notMem_verts_of_chainDownVertex.lean.fragment` (match)
- `src-carried-c4la1-068`: `LeanProject/LeanProof/Snippets/0076-lemma-E993Transport-eq_of_chainDownVertex_erase_eq.lean.fragment` (match)
- `src-carried-c4la1-069`: `LeanProject/LeanProof/Snippets/0077-lemma-E993Transport-chainDownUp_snd_eq_zero_of_top.lean.fragment` (match)
- `src-carried-c4la1-070`: `LeanProject/LeanProof/Snippets/0078-lemma-E993Transport-chainSize_eq_card_inter.lean.fragment` (match)
- `src-carried-c4la1-071`: `LeanProject/LeanProof/Snippets/0079-lemma-E993Transport-chainSize_le_length.lean.fragment` (match)
- `src-carried-c4la1-072`: `LeanProject/LeanProof/Snippets/0080-lemma-E993Transport-top_of_length_le_chainSize.lean.fragment` (match)
- `src-carried-c4la1-073`: `LeanProject/LeanProof/Snippets/0081-lemma-E993Transport-mem_indepFamily_iff.lean.fragment` (match)
- `src-carried-c4la1-074`: `LeanProject/LeanProof/Snippets/0082-lemma-E993Transport-erase_mem_indepFamily.lean.fragment` (match)
- `src-carried-c4la1-075`: `LeanProject/LeanProof/Snippets/0083-lemma-E993Transport-saturatingFlow_of_perTag_deletionInjections.lean.fragment` (match)
- `src-carried-c4la1-076`: `LeanProject/LeanProof/Snippets/0084-lemma-E993Transport-gkVertex_val.lean.fragment` (match)
- `src-carried-c4la1-077`: `LeanProject/LeanProof/Snippets/0085-lemma-E993Transport-eq_gkVertex_iff.lean.fragment` (match)
- `src-carried-c4la1-078`: `LeanProject/LeanProof/Snippets/0086-lemma-E993Transport-gkGraph_adj_iff.lean.fragment` (match)
- `src-carried-c4la1-079`: `LeanProject/LeanProof/Snippets/0087-lemma-E993Transport-gkGraph_adj_iff_val.lean.fragment` (match)
- `src-carried-c4la1-080`: `LeanProject/LeanProof/Snippets/0088-lemma-E993Transport-gkGraph_adj_of_val.lean.fragment` (match)
- `src-carried-c4la1-081`: `LeanProject/LeanProof/Snippets/0089-lemma-E993Transport-gkLeafBlock_verts.lean.fragment` (match)
- `src-carried-c4la1-082`: `LeanProject/LeanProof/Snippets/0090-lemma-E993Transport-gkCherryBlock_verts.lean.fragment` (match)
- `src-carried-c4la1-083`: `LeanProject/LeanProof/Snippets/0091-lemma-E993Transport-gkArmBlock_verts.lean.fragment` (match)
- `src-carried-c4la1-084`: `LeanProject/LeanProof/Snippets/0092-lemma-E993Transport-mem_gkLeafBlock_verts_iff.lean.fragment` (match)
- `src-carried-c4la1-085`: `LeanProject/LeanProof/Snippets/0093-lemma-E993Transport-mem_gkCherryBlock_verts_iff.lean.fragment` (match)
- `src-carried-c4la1-086`: `LeanProject/LeanProof/Snippets/0094-lemma-E993Transport-mem_gkArmBlock_verts_iff.lean.fragment` (match)
- `src-carried-c4la1-087`: `LeanProject/LeanProof/Snippets/0095-lemma-E993Transport-mem_chainVerts_gkTagFactors_iff.lean.fragment` (match)
- `src-carried-c4la1-088`: `LeanProject/LeanProof/Snippets/0096-lemma-E993Transport-chainDisjoint_gkTagFactors.lean.fragment` (match)
- `src-carried-c4la1-089`: `LeanProject/LeanProof/Snippets/0097-lemma-E993Transport-chainSize_gkTagFactors.lean.fragment` (match)
- `src-carried-c4la1-090`: `LeanProject/LeanProof/Snippets/0098-lemma-E993Transport-chainRank_map_gkArmBlock_le.lean.fragment` (match)
- `src-carried-c4la1-091`: `LeanProject/LeanProof/Snippets/0099-lemma-E993Transport-chainRank_gkTagFactors_le.lean.fragment` (match)
- `src-carried-c4la1-092`: `LeanProject/LeanProof/Snippets/0100-lemma-E993Transport-gkVertex_ne.lean.fragment` (match)
- `src-carried-c4la1-093`: `LeanProject/LeanProof/Snippets/0101-lemma-E993Transport-gkGraph_adj_of_val_root.lean.fragment` (match)
- `src-carried-c4la1-094`: `LeanProject/LeanProof/Snippets/0102-lemma-E993Transport-gkGraph_adj_of_val_arm.lean.fragment` (match)
- `src-carried-c4la1-095`: `LeanProject/LeanProof/Snippets/0103-lemma-E993Transport-gk_not_adj_of_indep.lean.fragment` (match)
- `src-carried-c4la1-096`: `LeanProject/LeanProof/Snippets/0104-lemma-E993Transport-gk_leaf_cases.lean.fragment` (match)
- `src-carried-c4la1-097`: `LeanProject/LeanProof/Snippets/0105-lemma-E993Transport-not_disjoint_erase_tagWitnesses_iff.lean.fragment` (match)
- `src-carried-c4la1-098`: `LeanProject/LeanProof/Snippets/0106-lemma-E993Transport-gk_active_arm_iff.lean.fragment` (match)
- `src-carried-c4la1-099`: `LeanProject/LeanProof/Snippets/0107-lemma-E993Transport-gk_active_cherry_iff.lean.fragment` (match)
- `src-carried-c4la1-100`: `LeanProject/LeanProof/Snippets/0108-lemma-E993Transport-gk_active_one_iff.lean.fragment` (match)
- `src-carried-c4la1-101`: `LeanProject/LeanProof/Snippets/0109-lemma-E993Transport-gk_root_notMem.lean.fragment` (match)
- `src-carried-c4la1-102`: `LeanProject/LeanProof/Snippets/0110-lemma-E993Transport-inter_triple_eq_pair.lean.fragment` (match)
- `src-carried-c4la1-103`: `LeanProject/LeanProof/Snippets/0111-lemma-E993Transport-gk_path_valid.lean.fragment` (match)
- `src-carried-c4la1-104`: `LeanProject/LeanProof/Snippets/0112-lemma-E993Transport-chainValid_gkTagFactors.lean.fragment` (match)
- `src-carried-c4la1-105`: `LeanProject/LeanProof/Snippets/0113-lemma-E993Transport-exists_chainDownVertex_gkTagFactors.lean.fragment` (match)
- `src-carried-c4la1-106`: `LeanProject/LeanProof/Snippets/0114-lemma-E993Transport-gk_one_blocks_top_of_avoid.lean.fragment` (match)
- `src-carried-c4la1-107`: `LeanProject/LeanProof/Snippets/0115-lemma-E993Transport-gk_one_active_after_down.lean.fragment` (match)
- `src-carried-c4la1-108`: `LeanProject/LeanProof/Snippets/0116-lemma-E993Transport-gkTagDown_erase_keeps_tag_active.lean.fragment` (match)
- `src-carried-c4la1-109`: `LeanProject/LeanProof/Snippets/0117-lemma-E993Transport-gkTagDown_injOn.lean.fragment` (match)
- `src-carried-c4la1-110`: `LeanProject/LeanProof/Snippets/0118-lemma-E993Transport-gk_exists_deletionSupported_saturatingFlow.lean.fragment` (match)
- `src-carried-c4la1-111`: `LeanProject/LeanProof/Snippets/0119-lemma-E993Transport-gk_weightedHall_of_rank_ge.lean.fragment` (match)
- `src-carried-c4la1-112`: `LeanProject/LeanProof/Snippets/0120-lemma-E993Transport-gk_aggregate_nonpos_of_rank_ge.lean.fragment` (match)
- `src-carried-fi-014`: `LeanProject/LeanProof/Snippets/0045-definition-C5LA1-crossingIndex.lean.fragment` (match)
- `src-critique-c-u1-f`: `SOURCE/governing/CRITIQUE-C-U1-F.md` (match)
- `src-critique-c-u1-t`: `SOURCE/governing/CRITIQUE-C-U1-T.md` (match)
- `src-frozen-c-u1-f-corollary`: `SOURCE/frozen/C-U1-F-Corollary.lean` (match)
- `src-frozen-u1-main`: `SOURCE/frozen/U1-Main.lean` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-protocol`: `SOURCE/governing/C5-STAGE7-PROTOCOL.md` (match)
- `src-semantic-contract`: `SOURCE/governing/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract`: `SOURCE/governing/SOLUTION-CONTRACT.md` (match)
- `src-synthesis`: `SOURCE/governing/SYNTHESIS.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
