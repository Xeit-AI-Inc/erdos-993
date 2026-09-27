# Theorem Contract: C6-LA2: the spider S(1,2,3^k) is a tree, the rank k+3 is eligible, and weighted Hall (a saturating flow) holds at rank k+3, for k >= 5

- Contract ID: `erdos-993-r30-c6-la2-spider-tree-weighted-hall-rank-k-plus-3-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `dc2fc2a0ecf623fb1fa916a17c73e3fdd965563db8cbf7b0a4d608f59d417651`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Canonical run id erdos-993-math-dre-20260926-r30-weighted-transport; award C6-LA2; key on closure E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-TREE-WEIGHTED-HALL-AT-RANK-K-PLUS-3-FOR-K-AT-LEAST-5 (a SEPARATE key from the registered proved_informal spider key). For every natural k >= 5, the spider S(1,2,3^k) = spiderOneTwoThrees k on Fin (3k+4) (root 0; pendant leaf 1; pendant path 0-2-3; k pendant paths 0-a_i-b_i-c_i with a_i = 4+3i, b_i = 5+3i, c_i = 6+3i) is a tree; its first strict descent x = C5LA1.crossingIndex satisfies x + 2 <= k + 3; 3(k+3) < 2*alpha + 1 with alpha = indepNum; and the transport network of the spider at rank p = k+3 with the fixed original strict selector F = favorableLeaves (spider) (k+3) has a saturating integral flow (IsSaturatingFlow: positive only on transportRel arcs = (D) deletion union (S) two-for-one switch; every source in I_{k+4} sends exactly its activeWeight, the number of ACTIVE tags; every target in I_{k+3} receives at most its activeWeight). That is: the rank k+3 is eligible and (HALL) holds there. The hypothesis 5 <= k is used only for the low window. Fences on the face: S(1,2,3^k) only; rank k+3 only; k >= 5 only (the statement is FALSE for k <= 4 because the low window 3(k+3) < 2*alpha+1 = 4k+5 is empty there); deletion-supported flows. NOT (HALL) at full scope; NOT every eligible rank of the spider (needs N3b, whose Newton dependency is undischarged; the registered proved_informal spider key E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-SATURATES-BY-VERTEX-DELETIONS-FROM-RANK-K-PLUS-2 keeps that scope and is NOT superseded at other ranks); NOT every tree; mechanism is not aggregate: nothing on the primary aggregate; not an RTree statement; no statement about switch arcs; no status change of (HALL), the primary aggregate, E993-R23-..., BETA-AGG, TREE, FOREST, TRANSFER, any refuted key or #993; the per-tag deletion on this one family is family-scoped and revives nothing (the universal per-leaf key is REFUTED). No grade is asserted for any companion lemma (R29-N-12). Attribution: mechanism, active-tag weight, relation, the (HALL) key and the lower-region run: Codex GPT-6 (Astra/Sol/Luna); the sharp boundary 3p < 2alpha+1 and high-tail certificates: r29 (Claude, Fable-controlled); definition entries 1-18 incl. C5LA1.crossingIndex (entry 14): the first-interior run (Codex) and the r26/r24/r25 layers; the network definitions: C1-LA1 (r30 Cycle 1); the graph-generic chain machinery and the per-tag composition (entry 75): C4-LA1 (r30 Cycle 4); the spider family theorem: r30 Cycle 5 (critic C-F2-U, Claude Opus 5.5; E-2 per-tag sufficiency: F2, Claude Sonnet 5; hook discharge: the Cycle 5 F adjudicator; SR-C5-2 reader); r30 Cycle 6: U1 (Claude Sonnet 5) the spider definition and tree layer; C-U1-F (Claude Opus 5.5) alpha equality, the low window, the composition face, the root split; C-U1-T (Claude Opus 5.5) the chain carry, the block assignment, the root split, the alpha lower bound; the U adjudicator (Claude Opus 5.5) node (F0) and the carry verification; the tree-layer pattern: C5-LA1 (r30 Cycle 5 formalizer). Lean text: the C6-LA2 formalizer (producer c6-la2-formalizer-opus-20260928; chartered Claude Opus 5.5; runtime-reported model id claude-opus-5-5[1m]).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993Transport.spiderOneTwoThrees_treeWeightedHall_kPlus3`
- Statement SHA-256: `b5fba0738b066636d65685aab8b1a74a517a05ad99c8eafa2e3bf171931a9a10`

```lean
theorem spiderOneTwoThrees_treeWeightedHall_kPlus3 (k : ℕ) (hk : 5 ≤ k) :
    (spiderOneTwoThrees k).IsTree ∧
    C5LA1.crossingIndex (spiderOneTwoThrees k) + 2 ≤ k + 3 ∧
    3 * (k + 3) < 2 * (spiderOneTwoThrees k).indepNum + 1 ∧
    ∃ f, IsSaturatingFlow (spiderOneTwoThrees k)
      (favorableLeaves (spiderOneTwoThrees k) (k + 3)) (k + 3) f
```

## Quantifiers

- `forall k` over `domain-k`

## Hypotheses

- `hyp-k-ge-five`: hk : 5 ≤ k (verbatim). Used only for the low window 3(k+3) < 2(2k+2)+1, i.e. k >= 5; the root split consumes only its consequence 1 <= k. No other hypothesis: finiteness via Fin (3k+4); no quotient step; no invariance hypothesis; F is the derived selector favorableLeaves (spiderOneTwoThrees k) (k+3), never hard-coded.

## Conclusion

- `conclusion`: (spiderOneTwoThrees k).IsTree ∧ C5LA1.crossingIndex (spiderOneTwoThrees k) + 2 ≤ k + 3 ∧ 3 * (k + 3) < 2 * (spiderOneTwoThrees k).indepNum + 1 ∧ ∃ f, IsSaturatingFlow (spiderOneTwoThrees k) (favorableLeaves (spiderOneTwoThrees k) (k + 3)) (k + 3) f — the tree face, eligibility of the rank k+3 (x + 2 <= k+3 and the low window), and a saturating integral flow at rank k+3 with the fixed original strict selector.

## Dependencies

- `def-spider-edge` -> `def-spider`
- `def-spider` -> `def-spider-decadj`
- `def-spider-edge` -> `def-spider-decadj`
- `def-graph-leaf` -> `def-support`
- `def-graph-leaf` -> `def-leaf-set`
- `def-support` -> `def-tag-witnesses`
- `def-tag-witnesses` -> `def-active-weight`
- `def-vdel-count` -> `def-vdel-diff`
- `def-vdel-diff` -> `def-favorable-at`
- `def-leaf-set` -> `def-favorable-leaves`
- `def-favorable-at` -> `def-favorable-leaves`
- `def-indep-family` -> `def-saturating-flow`
- `def-active-weight` -> `def-saturating-flow`
- `def-transport-rel` -> `def-saturating-flow`
- `def-indep-avoiding` -> `def-indep-count`
- `def-indep-count` -> `def-forward-diff`
- `def-forward-diff` -> `def-crossing-index`
- `def-indep-count` -> `def-crossing-index`
- `def-indep-avoiding` -> `def-crossing-index`
- `domain-k` -> `hyp-k-ge-five`
- `hyp-k-ge-five` -> `conclusion`
- `def-spider` -> `conclusion`
- `def-spider-decadj` -> `conclusion`
- `def-is-tree` -> `conclusion`
- `def-crossing-index` -> `conclusion`
- `def-indep-num` -> `conclusion`
- `def-saturating-flow` -> `conclusion`
- `def-favorable-leaves` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-brief`: `SOURCE/C6-STAGE7-FORMALIZER-BRIEF-LA2.md` (match)
- `src-c-u1-f-criticcompose-lean`: `SOURCE/C-U1-F-CriticCompose.lean` (match)
- `src-c-u1-f-criticn2-lean`: `SOURCE/C-U1-F-CriticN2.lean` (match)
- `src-c-u1-t-criticindeplb-lean`: `SOURCE/C-U1-T-CriticIndepLB.lean` (match)
- `src-c-u1-t-critique`: `SOURCE/cycle-6-C-U1-T-CRITIQUE.md` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-carried-001`: `LeanProject/LeanProof/Snippets/0001-definition-C4LA1-vertexDeletionIndepSetCount.lean.fragment` (match)
- `src-carried-002`: `LeanProject/LeanProof/Snippets/0002-definition-C4LA1-vertexDeletionForwardDifference.lean.fragment` (match)
- `src-carried-003`: `LeanProject/LeanProof/Snippets/0003-definition-C4LA1-IsFavorableAt.lean.fragment` (match)
- `src-carried-004`: `LeanProject/LeanProof/Snippets/0004-definition-C4LA1-IsGraphLeaf.lean.fragment` (match)
- `src-carried-005`: `LeanProject/LeanProof/Snippets/0005-definition-C5LA1-support.lean.fragment` (match)
- `src-carried-006`: `LeanProject/LeanProof/Snippets/0006-definition-C5LA1-leafSet.lean.fragment` (match)
- `src-carried-007`: `LeanProject/LeanProof/Snippets/0007-definition-C5LA1-H.lean.fragment` (match)
- `src-carried-008`: `LeanProject/LeanProof/Snippets/0008-definition-C5LA1-R.lean.fragment` (match)
- `src-carried-009`: `LeanProject/LeanProof/Snippets/0009-definition-C5LA1-indepSetsAvoiding.lean.fragment` (match)
- `src-carried-010`: `LeanProject/LeanProof/Snippets/0010-definition-C5LA1-indepSetCount.lean.fragment` (match)
- `src-carried-011`: `LeanProject/LeanProof/Snippets/0011-definition-C5LA1-forwardDifferenceDel.lean.fragment` (match)
- `src-carried-012`: `LeanProject/LeanProof/Snippets/0012-definition-C5LA1-aggregate.lean.fragment` (match)
- `src-carried-013`: `LeanProject/LeanProof/Snippets/0013-definition-E993Interior-taggedFamily.lean.fragment` (match)
- `src-carried-014`: `LeanProject/LeanProof/Snippets/0014-definition-E993Transport-indepFamily.lean.fragment` (match)
- `src-carried-015`: `LeanProject/LeanProof/Snippets/0015-definition-E993Transport-tagWitnesses.lean.fragment` (match)
- `src-carried-016`: `LeanProject/LeanProof/Snippets/0016-definition-E993Transport-activeWeight.lean.fragment` (match)
- `src-carried-017`: `LeanProject/LeanProof/Snippets/0017-definition-E993Transport-layerWeight.lean.fragment` (match)
- `src-carried-018`: `LeanProject/LeanProof/Snippets/0018-definition-E993Transport-favorableLeaves.lean.fragment` (match)
- `src-carried-019`: `LeanProject/LeanProof/Snippets/0019-definition-E993Transport-transportRel.lean.fragment` (match)
- `src-carried-020`: `LeanProject/LeanProof/Snippets/0020-definition-E993Transport-IsSaturatingFlow.lean.fragment` (match)
- `src-carried-021`: `LeanProject/LeanProof/Snippets/0021-definition-E993Transport-WeightedHall.lean.fragment` (match)
- `src-carried-022`: `LeanProject/LeanProof/Snippets/0022-definition-E993Transport-ChainFactor.lean.fragment` (match)
- `src-carried-023`: `LeanProject/LeanProof/Snippets/0023-definition-E993Transport-ChainFactor-verts.lean.fragment` (match)
- `src-carried-024`: `LeanProject/LeanProof/Snippets/0024-definition-E993Transport-ChainFactor-code.lean.fragment` (match)
- `src-carried-025`: `LeanProject/LeanProof/Snippets/0025-definition-E993Transport-ChainFactor-drop.lean.fragment` (match)
- `src-carried-026`: `LeanProject/LeanProof/Snippets/0026-definition-E993Transport-ChainFactor-rk.lean.fragment` (match)
- `src-carried-027`: `LeanProject/LeanProof/Snippets/0027-definition-E993Transport-ChainFactor-Valid.lean.fragment` (match)
- `src-carried-028`: `LeanProject/LeanProof/Snippets/0028-definition-E993Transport-chainDownUp.lean.fragment` (match)
- `src-carried-029`: `LeanProject/LeanProof/Snippets/0029-definition-E993Transport-chainDownVertex.lean.fragment` (match)
- `src-carried-030`: `LeanProject/LeanProof/Snippets/0030-definition-E993Transport-chainVerts.lean.fragment` (match)
- `src-carried-031`: `LeanProject/LeanProof/Snippets/0031-definition-E993Transport-chainSize.lean.fragment` (match)
- `src-carried-032`: `LeanProject/LeanProof/Snippets/0032-definition-E993Transport-chainRank.lean.fragment` (match)
- `src-carried-033`: `LeanProject/LeanProof/Snippets/0033-definition-E993Transport-ChainValid.lean.fragment` (match)
- `src-carried-034`: `LeanProject/LeanProof/Snippets/0034-definition-E993Transport-ChainDisjoint.lean.fragment` (match)
- `src-carried-035`: `LeanProject/LeanProof/Snippets/0035-definition-C5LA1-crossingIndex.lean.fragment` (match)
- `src-carried-054`: `LeanProject/LeanProof/Snippets/0054-lemma-E993Interior-highTailAggregateFromShadow.lean.fragment` (match)
- `src-carried-055`: `LeanProject/LeanProof/Snippets/0055-lemma-E993Transport-indepFamily_eq_indepSetsAvoiding.lean.fragment` (match)
- `src-carried-056`: `LeanProject/LeanProof/Snippets/0056-lemma-E993Transport-isGraphLeaf_of_mem_favorableLeaves.lean.fragment` (match)
- `src-carried-057`: `LeanProject/LeanProof/Snippets/0057-lemma-E993Transport-tagWitnesses_subset_R.lean.fragment` (match)
- `src-carried-058`: `LeanProject/LeanProof/Snippets/0058-lemma-E993Transport-card_active_eq_tagged.lean.fragment` (match)
- `src-carried-059`: `LeanProject/LeanProof/Snippets/0059-lemma-E993Transport-layerWeight_eq_sum_card.lean.fragment` (match)
- `src-carried-060`: `LeanProject/LeanProof/Snippets/0060-lemma-E993Transport-layerWeight_sub_eq_sum.lean.fragment` (match)
- `src-carried-061`: `LeanProject/LeanProof/Snippets/0061-lemma-E993Transport-activeWeightAggregateIdentity.lean.fragment` (match)
- `src-carried-062`: `LeanProject/LeanProof/Snippets/0062-lemma-E993Transport-aggregate_nonpos_of_saturatingFlow.lean.fragment` (match)
- `src-carried-063`: `LeanProject/LeanProof/Snippets/0063-lemma-E993Transport-weightedHall_of_saturatingFlow.lean.fragment` (match)
- `src-carried-064`: `LeanProject/LeanProof/Snippets/0064-lemma-E993Transport-ChainFactor-card_inter_path_eq.lean.fragment` (match)
- `src-carried-065`: `LeanProject/LeanProof/Snippets/0065-lemma-E993Transport-ChainFactor-two_mul_card_add_len_eq.lean.fragment` (match)
- `src-carried-066`: `LeanProject/LeanProof/Snippets/0066-lemma-E993Transport-ChainFactor-code_fst_le_snd.lean.fragment` (match)
- `src-carried-067`: `LeanProject/LeanProof/Snippets/0067-lemma-E993Transport-ChainFactor-exists_drop_of_code_pos.lean.fragment` (match)
- `src-carried-068`: `LeanProject/LeanProof/Snippets/0068-lemma-E993Transport-ChainFactor-code_erase_of_notMem.lean.fragment` (match)
- `src-carried-069`: `LeanProject/LeanProof/Snippets/0069-lemma-E993Transport-ChainFactor-drop_mem_or_mem_of_ne.lean.fragment` (match)
- `src-carried-070`: `LeanProject/LeanProof/Snippets/0070-lemma-E993Transport-mem_chainVerts_iff.lean.fragment` (match)
- `src-carried-071`: `LeanProject/LeanProof/Snippets/0071-lemma-E993Transport-chainDownUp_erase_of_notMem.lean.fragment` (match)
- `src-carried-072`: `LeanProject/LeanProof/Snippets/0072-lemma-E993Transport-two_mul_chainSize_add_up_eq.lean.fragment` (match)
- `src-carried-073`: `LeanProject/LeanProof/Snippets/0073-lemma-E993Transport-mem_and_exists_drop_of_chainDownVertex.lean.fragment` (match)
- `src-carried-074`: `LeanProject/LeanProof/Snippets/0074-lemma-E993Transport-exists_chainDownVertex_of_down_pos.lean.fragment` (match)
- `src-carried-075`: `LeanProject/LeanProof/Snippets/0075-lemma-E993Transport-chainDownUp_erase_chainDownVertex.lean.fragment` (match)
- `src-carried-076`: `LeanProject/LeanProof/Snippets/0076-lemma-E993Transport-notMem_verts_of_chainDownVertex.lean.fragment` (match)
- `src-carried-077`: `LeanProject/LeanProof/Snippets/0077-lemma-E993Transport-eq_of_chainDownVertex_erase_eq.lean.fragment` (match)
- `src-carried-078`: `LeanProject/LeanProof/Snippets/0078-lemma-E993Transport-chainDownUp_snd_eq_zero_of_top.lean.fragment` (match)
- `src-carried-079`: `LeanProject/LeanProof/Snippets/0079-lemma-E993Transport-chainSize_eq_card_inter.lean.fragment` (match)
- `src-carried-080`: `LeanProject/LeanProof/Snippets/0080-lemma-E993Transport-chainSize_le_length.lean.fragment` (match)
- `src-carried-081`: `LeanProject/LeanProof/Snippets/0081-lemma-E993Transport-top_of_length_le_chainSize.lean.fragment` (match)
- `src-carried-082`: `LeanProject/LeanProof/Snippets/0082-lemma-E993Transport-mem_indepFamily_iff.lean.fragment` (match)
- `src-carried-083`: `LeanProject/LeanProof/Snippets/0083-lemma-E993Transport-erase_mem_indepFamily.lean.fragment` (match)
- `src-carried-084`: `LeanProject/LeanProof/Snippets/0084-lemma-E993Transport-saturatingFlow_of_perTag_deletionInjections.lean.fragment` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-semantic-contract`: `SOURCE/SEMANTIC-CONTRACT.md` (match)
- `src-synthesis`: `SOURCE/cycle-6-SYNTHESIS.md` (match)
- `src-u-adjudication`: `SOURCE/cycle-6-U-ADJUDICATION.md` (match)
- `src-u1-spider-lean`: `SOURCE/U1-Spider.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
