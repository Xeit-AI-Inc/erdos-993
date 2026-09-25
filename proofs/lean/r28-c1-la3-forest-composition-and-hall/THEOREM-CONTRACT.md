# Theorem Contract: r28 C1-LA3: forest degree lemma from the tree degree lemma at every size a ≤ k (FC, corrected), with the SDR/threshold equivalence on trees as companion lemma

- Contract ID: `erdos-993-r28-c1-la3-forest-composition-and-hall-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `b66b680ac9463a25b133d61d1c6eb2531f187e4fec91995933743877f3f394a4`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

(FC), corrected (erratum R28-E-c), key E993-R28-FOREST-DEGREE-LEMMA-FROM-TREES: for every finite simple graph G on a finite type X in universe u with G acyclic (a finite forest) and every k : ℕ, IF for every finite tree T on any carrier Y : Type u and every a ≤ k the degree lemma D_a(T) ≤ 2a·i_a(T) holds, THEN D_k(G) ≤ 2k·i_k(G), with i = Erdos993G1.indepCount (r25 entry 1) and D = Erdos993G1.indepDegreeSum (r27 entry 7). Acyclicity enters only through 'components of a forest are trees'; the composition itself (separated-union convolution, bridge, peel over components) holds for every finite graph (scope declarations R28CritU2T.degree_lemma_of_components, R28CritU2T.forest_degree_lemma_of_components_allk, R28U2.indepCountOn_union, R28U2.indepDegreeSumOn_union — hsep and hdisj both necessary — R28CritU2T.bridge, R28CritU2T.induce_supp_isTree). Companion lemma in the same source, key E993-R28-SDR-THRESHOLD-EQUIVALENCE (registers independently; not a dependency of the terminal theorem): lemma sdr_iff_threshold_pos_of_tree {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hT : G.IsTree) (k : ℕ) :
    (∃ f : R28U2.Slot G → X, Function.Injective f ∧
        ∀ s, G.degree (f s) = 1 ∧ R28U2.occ G s.1.1 k ≤ R28U2.occ G (f s) k) ↔
      (∀ t, 1 ≤ t → R28U2.slotsAtLeast G k t ≤ R28U2.leavesAtLeast G k t) ; scope declaration R28U2.sdr_iff_threshold (graph-general, ∀ t : ℕ) via R28U2.nested_hall_iff_threshold and R28U2.sdr_iff_threshold_abstract, and R28CritU2F.tree_slots_zero_le. Fences: (FC) is never composed with r27's forest_degree_lemma to present a second proof of (DL) (not carried into this project); it is the formal consequence clause of E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION, a scope note there. The SDR equivalence is per (G, k), never evidence for either side. U2's slot_leaf_sdr_exists and tree_leaf_slot_dominance (FALSE, T22) are not carried and nothing depends on them. No status transfer (SOLUTION-CONTRACT §3.1). Attribution: (FC) — r27 convolution key (SR-JOIN JN-2), U2 (seat, convolution in Lean), C-U2-T (end to end, bridge), C-U2-F (core); SDR — T2 (Lemma SAP, informal), C-F1-T (rank lemma), Hall (Mathlib), U2 (graph-general Lean), C-U2-F (tree form), SR-PP (PP-3).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem Erdos993G1.forest_degree_lemma_of_tree_degree_lemma`
- Statement SHA-256: `0ed31930e9fc871882eefe8970a7555779e7425265d8c04901212fed5237b2b0`

```lean
theorem forest_degree_lemma_of_tree_degree_lemma {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ)
    (htree : ∀ {Y : Type u} [Fintype Y] [DecidableEq Y] (T : SimpleGraph Y) [DecidableRel T.Adj], T.IsTree →
      ∀ a ≤ k, (Erdos993G1.indepDegreeSum T a : ℤ) ≤ 2 * a * Erdos993G1.indepCount T a) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k
```

## Quantifiers

- `forall X` over `dom-x`
- `forall G` over `dom-g`
- `forall k` over `dom-k`

## Hypotheses

- `hyp-instances`: [Fintype X] [DecidableEq X] [DecidableRel G.Adj] (instance binders of the terminal statement, verbatim).
- `hyp-acyclic`: (hG : G.IsAcyclic) — verbatim. Consumed only in R28CritU2T.induce_supp_isTree (each component of G, induced, is a tree).
- `hyp-tree-degree-lemma`: (htree : ∀ {Y : Type u} [Fintype Y] [DecidableEq Y] (T : SimpleGraph Y) [DecidableRel T.Adj], T.IsTree →
      ∀ a ≤ k, (Erdos993G1.indepDegreeSum T a : ℤ) ≤ 2 * a * Erdos993G1.indepCount T a) — verbatim. The degree lemma at EVERY size a ≤ k on every finite tree in universe u (erratum R28-E-c; the SOLUTION-CONTRACT §2 single-k component hypothesis is not used: K_4 ⊔ K_4, k = 2).

## Conclusion

- `conclusion`: (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k — verbatim; D_k(G) ≤ 2k·i_k(G) in ℤ.

## Dependencies

- `def-is-acyclic` -> `def-is-tree`
- `def-indep-set-finset` -> `def-indep-count`
- `def-indep-set-finset` -> `def-indep-degree-sum`
- `def-degree` -> `def-indep-degree-sum`
- `def-indep-set-finset` -> `def-occ`
- `def-occ` -> `def-slots-at-least`
- `def-degree` -> `def-slots-at-least`
- `def-occ` -> `def-leaves-at-least`
- `def-degree` -> `def-leaves-at-least`
- `def-degree` -> `def-branch`
- `def-degree` -> `def-leaf-t`
- `def-branch` -> `def-slot`
- `def-degree` -> `def-slot`
- `def-indep-set-finset` -> `def-indep-finset-on`
- `def-indep-finset-on` -> `def-indep-count-on`
- `def-indep-finset-on` -> `def-indep-degree-sum-on`
- `def-degree` -> `def-indep-degree-sum-on`
- `dom-x` -> `dom-g`
- `dom-k` -> `dom-tree-carrier`
- `dom-x` -> `hyp-instances`
- `dom-g` -> `hyp-instances`
- `def-is-acyclic` -> `hyp-acyclic`
- `dom-g` -> `hyp-acyclic`
- `def-is-tree` -> `hyp-tree-degree-lemma`
- `def-indep-count` -> `hyp-tree-degree-lemma`
- `def-indep-degree-sum` -> `hyp-tree-degree-lemma`
- `dom-tree-carrier` -> `hyp-tree-degree-lemma`
- `hyp-instances` -> `conclusion`
- `hyp-acyclic` -> `conclusion`
- `hyp-tree-degree-lemma` -> `conclusion`
- `def-indep-count` -> `conclusion`
- `def-indep-degree-sum` -> `conclusion`
- `dom-k` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `frag-01`: `LeanProject/LeanProof/Snippets/0001-definition-Erdos993G1-indepCount.lean.fragment` (match)
- `frag-02`: `LeanProject/LeanProof/Snippets/0002-definition-Erdos993G1-indepDegreeSum.lean.fragment` (match)
- `frag-03`: `LeanProject/LeanProof/Snippets/0003-definition-R28U2-occ.lean.fragment` (match)
- `frag-04`: `LeanProject/LeanProof/Snippets/0004-definition-R28U2-slotsAtLeast.lean.fragment` (match)
- `frag-05`: `LeanProject/LeanProof/Snippets/0005-definition-R28U2-leavesAtLeast.lean.fragment` (match)
- `frag-06`: `LeanProject/LeanProof/Snippets/0006-definition-R28U2-indepFinsetOn.lean.fragment` (match)
- `frag-07`: `LeanProject/LeanProof/Snippets/0007-definition-R28U2-indepCountOn.lean.fragment` (match)
- `frag-08`: `LeanProject/LeanProof/Snippets/0008-definition-R28U2-indepDegreeSumOn.lean.fragment` (match)
- `frag-09`: `LeanProject/LeanProof/Snippets/0009-definition-R28U2-splitPair.lean.fragment` (match)
- `frag-10`: `LeanProject/LeanProof/Snippets/0010-definition-R28U2-joinPair.lean.fragment` (match)
- `frag-11`: `LeanProject/LeanProof/Snippets/0011-definition-R28U2-Branch.lean.fragment` (match)
- `frag-12`: `LeanProject/LeanProof/Snippets/0012-definition-R28U2-LeafT.lean.fragment` (match)
- `frag-13`: `LeanProject/LeanProof/Snippets/0013-definition-R28U2-Slot.lean.fragment` (match)
- `frag-14`: `LeanProject/LeanProof/Snippets/0014-lemma-Erdos993G1-indepCount_eq_card_indepSetFinset.lean.fragment` (match)
- `frag-15`: `LeanProject/LeanProof/Snippets/0015-lemma-R28U2-indepFinsetOn_univ.lean.fragment` (match)
- `frag-16`: `LeanProject/LeanProof/Snippets/0016-lemma-R28U2-indepCountOn_univ.lean.fragment` (match)
- `frag-17`: `LeanProject/LeanProof/Snippets/0017-lemma-R28U2-indepDegreeSumOn_univ.lean.fragment` (match)
- `frag-18`: `LeanProject/LeanProof/Snippets/0018-lemma-R28U2-isIndepSet_union_iff.lean.fragment` (match)
- `frag-19`: `LeanProject/LeanProof/Snippets/0019-lemma-R28U2-join_splitPair.lean.fragment` (match)
- `frag-20`: `LeanProject/LeanProof/Snippets/0020-lemma-R28U2-splitPair_joinPair.lean.fragment` (match)
- `frag-21`: `LeanProject/LeanProof/Snippets/0021-lemma-R28U2-splitPair_mem.lean.fragment` (match)
- `frag-22`: `LeanProject/LeanProof/Snippets/0022-lemma-R28U2-joinPair_mem.lean.fragment` (match)
- `frag-23`: `LeanProject/LeanProof/Snippets/0023-lemma-R28U2-indepCountOn_union_filter_card.lean.fragment` (match)
- `frag-24`: `LeanProject/LeanProof/Snippets/0024-lemma-R28U2-indepDegreeSumOn_union_filter_sum.lean.fragment` (match)
- `frag-25`: `LeanProject/LeanProof/Snippets/0025-lemma-R28U2-interS_card_mem_range.lean.fragment` (match)
- `frag-26`: `LeanProject/LeanProof/Snippets/0026-lemma-R28U2-indepCountOn_union.lean.fragment` (match)
- `frag-27`: `LeanProject/LeanProof/Snippets/0027-lemma-R28U2-indepDegreeSumOn_union.lean.fragment` (match)
- `frag-28`: `LeanProject/LeanProof/Snippets/0028-lemma-R28U2-nested_hall_iff_threshold.lean.fragment` (match)
- `frag-29`: `LeanProject/LeanProof/Snippets/0029-lemma-R28U2-sdr_iff_threshold_abstract.lean.fragment` (match)
- `frag-30`: `LeanProject/LeanProof/Snippets/0030-lemma-R28U2-card_filter_subtype_eq.lean.fragment` (match)
- `frag-31`: `LeanProject/LeanProof/Snippets/0031-lemma-R28U2-sum_filter_subtype_eq.lean.fragment` (match)
- `frag-32`: `LeanProject/LeanProof/Snippets/0032-lemma-R28U2-card_filter_slot_eq.lean.fragment` (match)
- `frag-33`: `LeanProject/LeanProof/Snippets/0033-lemma-R28U2-card_filter_leaf_eq.lean.fragment` (match)
- `frag-34`: `LeanProject/LeanProof/Snippets/0034-lemma-R28U2-sdr_iff_threshold.lean.fragment` (match)
- `frag-35`: `LeanProject/LeanProof/Snippets/0035-lemma-R28CritU2T-degree_lemma_on_union.lean.fragment` (match)
- `frag-36`: `LeanProject/LeanProof/Snippets/0036-lemma-R28CritU2T-sum_empty_on.lean.fragment` (match)
- `frag-37`: `LeanProject/LeanProof/Snippets/0037-lemma-R28CritU2T-bridge.lean.fragment` (match)
- `frag-38`: `LeanProject/LeanProof/Snippets/0038-lemma-R28CritU2T-supp_closed.lean.fragment` (match)
- `frag-39`: `LeanProject/LeanProof/Snippets/0039-lemma-R28CritU2T-degree_lemma_of_components.lean.fragment` (match)
- `frag-40`: `LeanProject/LeanProof/Snippets/0040-lemma-R28CritU2T-forest_degree_lemma_of_components_allk.lean.fragment` (match)
- `frag-41`: `LeanProject/LeanProof/Snippets/0041-lemma-R28CritU2T-induce_supp_isTree.lean.fragment` (match)
- `frag-42`: `LeanProject/LeanProof/Snippets/0042-lemma-R28CritU2T-forest_degree_lemma_of_tree_degree_lemma.lean.fragment` (match)
- `frag-43`: `LeanProject/LeanProof/Snippets/0043-lemma-R28CritU2F-dl_union.lean.fragment` (match)
- `frag-44`: `LeanProject/LeanProof/Snippets/0044-lemma-R28CritU2F-card_isolated_le_one.lean.fragment` (match)
- `frag-45`: `LeanProject/LeanProof/Snippets/0045-lemma-R28CritU2F-tree_slots_zero_le.lean.fragment` (match)
- `frag-46`: `LeanProject/LeanProof/Snippets/0046-lemma-R28CritU2F-sdr_iff_threshold_pos_of_tree.lean.fragment` (match)
- `frag-47`: `LeanProject/LeanProof/Snippets/0047-lemma-R28CritU2F-mem_of_reachable_of_closed.lean.fragment` (match)
- `frag-48`: `LeanProject/LeanProof/Snippets/0048-lemma-R28CritU2F-dl_closed_of_components.lean.fragment` (match)
- `frag-49`: `LeanProject/LeanProof/Snippets/0049-lemma-R28CritU2F-degree_lemma_of_component_supports.lean.fragment` (match)
- `frag-50`: `LeanProject/LeanProof/Snippets/0050-lemma-Erdos993G1-sdr_iff_threshold_pos_of_tree.lean.fragment` (match)
- `frag-51`: `LeanProject/LeanProof/Snippets/0051-theorem-Erdos993G1-forest_degree_lemma_of_tree_degree_lemma.lean.fragment` (match)
- `src-brief`: `SOURCES/C1-STAGE7-FORMALIZER-BRIEF-LA3.md` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-carry-cu2f`: `SOURCES/c1-stage7-sources/C-U2-F-CritAdvance.lean` (match)
- `src-carry-cu2t`: `SOURCES/c1-stage7-sources/C-U2-T-CritU2T.lean` (match)
- `src-carry-digests`: `SOURCES/c1-stage7-sources/SOURCE-DIGESTS.json` (match)
- `src-carry-table`: `DRAFTS/carry-table.json` (match)
- `src-carry-u2`: `SOURCES/c1-stage7-sources/U2-Main.lean` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-r25-award-main`: `SOURCES/r25/Main.lean` (match)
- `src-r27-award-main`: `SOURCES/r27/Main.lean` (match)
- `src-semantic-contract`: `SOURCES/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract`: `SOURCES/SOLUTION-CONTRACT.md` (match)
- `src-synthesis`: `SOURCES/SYNTHESIS.md` (match)
- `src-transport-script`: `DRAFTS/transport.py` (match)

## Validation Notes

- Errors: none
- Warnings: none
