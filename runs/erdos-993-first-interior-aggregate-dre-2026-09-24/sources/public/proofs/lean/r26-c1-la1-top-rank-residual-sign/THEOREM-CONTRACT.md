# Theorem Contract: C1-LA1 Top-Rank Residual Sign for Finite Eligible Residual Trees (RC)

- Contract ID: `c1-la1-top-rank-residual-sign-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `c73eb8dc970327036f2ea034f1d1b84de0b62075b389f147037c83ce12fc2c6d`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite simple graph G on a finite vertex type with decidable equality and decidable adjacency: if G is a tree, 2 <= alpha(G), x(G) + 2 <= alpha(G) - 1, and every leaf of G belongs to every maximum independent set of G, then the literal top-rank residual aggregate satisfies S(G, alpha(G)-1) <= 0. The proof composes the verified (RI) identity S = ell M - W with the exact budget identity sum_{s in B cap C}(lambda(s)-1) + (a - |B cap D|) + h(B) = 1 on I_{alpha-1}(G), the three-family classification (I) A_C empty, (II) A_C = {s} with lambda(s) = 2, (III) |A_D| = a - 1 obtained by forced-neighbour pruning under (star), the exact counts |family I| = ell M and N_2 <= k_2 M with k_2 <= floor(ell/2), and the nonnegativity of the family-(III) weight sum via the deletion injection, giving S <= -ell(ell-2) M - (ell-4) N_2 and hence S <= 0 in each of the branches ell >= 4, ell = 3 and ell = 2. The statement is NON-STRICT and is confined to rank alpha-1 on the eligible residual class.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem R26LA1.topRankResidualSign`
- Statement SHA-256: `7ab65fbf07bda813ce859c89a52e79802fee3c10f2ee2662d64deff9483576a6`

```lean
theorem topRankResidualSign (G : SimpleGraph V) [DecidableRel G.Adj] (hTree : G.IsTree)
    (hAlpha : 2 ≤ G.indepNum) (hEligible : crossingIndex G + 2 ≤ G.indepNum - 1)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S) :
    aggregate G (G.indepNum - 1) ≤ 0
```

## Quantifiers

- `forall V` over `domain-vertex-type`
- `forall G` over `domain-finite-simple-graph`
- `forall adjacencyDecision` over `domain-adjacency-decision`

## Hypotheses

- `hyp-tree`: G is a connected acyclic simple graph, i.e. G.IsTree.
- `hyp-alpha`: 2 <= G.indepNum.
- `hyp-eligible`: x(G) + 2 <= G.indepNum - 1, i.e. crossingIndex G + 2 <= G.indepNum - 1. Retained verbatim in the statement of record per C1-STAGE1-GATE.md Ruling 5; the proof consumes it ONLY through alpha >= 3 (node-eligible-imp-alpha-ge-three), and its only other occurrence is as an inert argument of (RI).
- `hyp-residual`: (star): every leaf of G belongs to every maximum independent set of G.

## Conclusion

- `conclusion-top-rank-residual-sign`: aggregate G (G.indepNum - 1) <= 0: the literal top-rank residual aggregate of an eligible residual tree is nonpositive. NON-STRICT. This award does not state S < 0, does not state S = 0 iff P_5, states nothing at any other rank, nothing on the non-residual class, nothing about forests or RTree, does not restate (RI), states no fixed-band, bounded or censused result, does not state N_2 <= M, and says nothing about the all-rank aggregate.

## Dependencies

- `def-a-val` -> `def-fam-one`
- `def-a-val` -> `def-fam-three`
- `def-a-val` -> `def-fam-two`
- `def-a-val` -> `def-max-indep-interior`
- `def-a-val` -> `def-shell-d`
- `def-a-val` -> `node-alpha-eq-ell-add-a`
- `def-a-val` -> `node-budget-identity`
- `def-aggregate` -> `conclusion-top-rank-residual-sign`
- `def-aggregate` -> `node-top-rank-residual-identity`
- `def-c-one` -> `def-u-set`
- `def-c-two` -> `node-c2-zero`
- `def-c-two` -> `node-k2-le-ell-div-two`
- `def-c-two` -> `node-n2-le-k2-mul-m`
- `def-crossing-index` -> `hyp-eligible`
- `def-crossing-index` -> `node-eligible-imp-alpha-ge-three`
- `def-fam-one` -> `node-family-one-weight`
- `def-fam-one` -> `node-w-split`
- `def-fam-one-map` -> `node-family-one-count`
- `def-fam-one-source` -> `node-family-one-count`
- `def-fam-three` -> `node-family-three-bijection`
- `def-fam-three` -> `node-w-split`
- `def-fam-three-index` -> `node-family-three-bijection`
- `def-fam-three-map` -> `node-family-three-bijection`
- `def-fam-two` -> `def-n-two`
- `def-fam-two` -> `node-family-two-weight`
- `def-fam-two` -> `node-w-split`
- `def-fam-two-map` -> `node-n2-le-k2-mul-m`
- `def-favorable` -> `def-aggregate`
- `def-forward-difference-del` -> `def-aggregate`
- `def-forward-difference-del` -> `def-crossing-index`
- `def-graph-leaf` -> `def-leaf-set`
- `def-graph-leaf` -> `def-support`
- `def-graph-leaf` -> `hyp-residual`
- `def-h-del` -> `def-aggregate`
- `def-indep-powerset` -> `def-fam-three-index`
- `def-indep-powerset` -> `node-deletion-injection`
- `def-indep-powerset` -> `node-h-nonneg`
- `def-indep-set-count` -> `def-forward-difference-del`
- `def-indep-set-count` -> `node-m-eq-card-max-indep-d`
- `def-indep-set-count` -> `node-top-rank-residual-identity`
- `def-indep-sets-avoiding` -> `def-indep-set-count`
- `def-indep-sets-avoiding` -> `def-top-shell`
- `def-indep-sets-avoiding` -> `node-top-rank-residual-identity`
- `def-independence-number` -> `def-top-rank`
- `def-independence-number` -> `hyp-alpha`
- `def-independence-number` -> `hyp-residual`
- `def-independence-number` -> `node-alpha-eq-ell-add-a`
- `def-independence-number` -> `node-eligible-imp-alpha-ge-three`
- `def-independence-number` -> `node-ell-two-lambda-two`
- `def-interior` -> `def-fam-one`
- `def-interior` -> `def-fam-three`
- `def-interior` -> `def-fam-two`
- `def-interior` -> `def-interior-indep`
- `def-interior` -> `node-alpha-eq-ell-add-a`
- `def-interior` -> `node-forced-neighbour`
- `def-interior-indep` -> `def-a-val`
- `def-interior-indep` -> `def-max-indep-interior`
- `def-interior-indep` -> `def-shell-d`
- `def-leaf-degree` -> `def-c-one`
- `def-leaf-degree` -> `def-c-two`
- `def-leaf-degree` -> `def-slack`
- `def-leaf-degree` -> `def-support-set`
- `def-leaf-degree` -> `def-weight`
- `def-leaf-degree` -> `node-ell-two-lambda-two`
- `def-leaf-degree` -> `node-forced-neighbour`
- `def-leaf-degree` -> `node-leaf-degree-sum`
- `def-leaf-degree` -> `node-top-rank-residual-identity`
- `def-leaf-set` -> `def-aggregate`
- `def-leaf-set` -> `def-fam-three-map`
- `def-leaf-set` -> `def-fam-two-map`
- `def-leaf-set` -> `def-interior`
- `def-leaf-set` -> `def-leaf-degree`
- `def-leaf-set` -> `def-slack`
- `def-leaf-set` -> `def-weight`
- `def-leaf-set` -> `node-c-eq-support-image`
- `def-leaf-set` -> `node-ell-two-lambda-two`
- `def-leaf-set` -> `node-leaf-card-ge-two`
- `def-leaf-set` -> `node-leaf-degree-sum`
- `def-leaf-set` -> `node-top-rank-residual-identity`
- `def-max-indep-interior` -> `node-m-eq-card-max-indep-d`
- `def-n-two` -> `node-n2-le-k2-mul-m`
- `def-n-two` -> `node-w-two`
- `def-r-del` -> `def-aggregate`
- `def-shell-d` -> `def-fam-three-index`
- `def-slack` -> `node-budget-identity`
- `def-slack` -> `node-h-nonneg`
- `def-support` -> `def-fam-three-map`
- `def-support` -> `def-fam-two-map`
- `def-support` -> `def-h-del`
- `def-support` -> `def-r-del`
- `def-support` -> `node-c-eq-support-image`
- `def-support-set` -> `def-fam-one`
- `def-support-set` -> `def-fam-two`
- `def-support-set` -> `def-interior`
- `def-support-set` -> `node-budget-identity`
- `def-support-set` -> `node-c-eq-support-image`
- `def-support-set` -> `node-max-indep-no-support`
- `def-top-rank` -> `conclusion-top-rank-residual-sign`
- `def-top-rank` -> `def-top-shell`
- `def-top-rank` -> `hyp-eligible`
- `def-top-shell` -> `def-fam-one`
- `def-top-shell` -> `def-fam-three`
- `def-top-shell` -> `def-fam-two`
- `def-top-shell` -> `node-budget-identity`
- `def-top-shell` -> `node-w-split`
- `def-u-set` -> `def-fam-three-index`
- `def-u-set` -> `node-fibre-nonneg`
- `def-vertex-deletion-coefficient` -> `def-vertex-deletion-forward-difference`
- `def-vertex-deletion-forward-difference` -> `def-favorable`
- `def-weight` -> `node-family-one-weight`
- `def-weight` -> `node-family-two-weight`
- `def-weight` -> `node-w-split`
- `domain-adjacency-decision` -> `def-fam-one-source`
- `domain-adjacency-decision` -> `def-indep-powerset`
- `domain-adjacency-decision` -> `def-indep-sets-avoiding`
- `domain-adjacency-decision` -> `def-leaf-degree`
- `domain-adjacency-decision` -> `def-r-del`
- `domain-adjacency-decision` -> `def-u-set`
- `domain-adjacency-decision` -> `def-vertex-deletion-coefficient`
- `domain-finite-simple-graph` -> `def-graph-leaf`
- `domain-finite-simple-graph` -> `def-independence-number`
- `domain-finite-simple-graph` -> `domain-adjacency-decision`
- `domain-finite-simple-graph` -> `hyp-tree`
- `domain-vertex` -> `def-graph-leaf`
- `domain-vertex` -> `def-vertex-deletion-coefficient`
- `domain-vertex-type` -> `def-fam-one-map`
- `domain-vertex-type` -> `domain-finite-simple-graph`
- `domain-vertex-type` -> `domain-vertex`
- `hyp-alpha` -> `conclusion-top-rank-residual-sign`
- `hyp-alpha` -> `node-alpha-eq-ell-add-a`
- `hyp-alpha` -> `node-forced-neighbour`
- `hyp-alpha` -> `node-leaf-card-ge-two`
- `hyp-alpha` -> `node-leaf-support-disjoint`
- `hyp-alpha` -> `node-top-rank-residual-identity`
- `hyp-eligible` -> `conclusion-top-rank-residual-sign`
- `hyp-eligible` -> `node-eligible-imp-alpha-ge-three`
- `hyp-eligible` -> `node-top-rank-residual-identity`
- `hyp-residual` -> `conclusion-top-rank-residual-sign`
- `hyp-residual` -> `node-family-support-pruned`
- `hyp-residual` -> `node-forced-neighbour`
- `hyp-residual` -> `node-max-indep-eq-leaf-union-d`
- `hyp-residual` -> `node-max-indep-no-support`
- `hyp-residual` -> `node-top-rank-residual-identity`
- `hyp-tree` -> `conclusion-top-rank-residual-sign`
- `hyp-tree` -> `node-alpha-eq-ell-add-a`
- `hyp-tree` -> `node-ell-two-lambda-two`
- `hyp-tree` -> `node-forced-neighbour`
- `hyp-tree` -> `node-leaf-card-ge-two`
- `hyp-tree` -> `node-leaf-support-disjoint`
- `hyp-tree` -> `node-top-rank-residual-identity`
- `node-alpha-eq-ell-add-a` -> `node-budget-identity`
- `node-alpha-eq-ell-add-a` -> `node-family-one-count`
- `node-alpha-eq-ell-add-a` -> `node-family-three-bijection`
- `node-alpha-eq-ell-add-a` -> `node-forced-neighbour`
- `node-alpha-eq-ell-add-a` -> `node-max-indep-eq-leaf-union-d`
- `node-budget-identity` -> `node-budget-shapes`
- `node-budget-identity` -> `node-family-one-weight`
- `node-budget-shapes` -> `node-family-support-pruned`
- `node-budget-shapes` -> `node-family-three-bijection`
- `node-c-eq-support-image` -> `node-alpha-eq-ell-add-a`
- `node-c-eq-support-image` -> `node-leaf-support-disjoint`
- `node-c2-zero` -> `node-finish-ell-two`
- `node-deletion-injection` -> `node-fibre-nonneg`
- `node-eligible-imp-alpha-ge-three` -> `conclusion-top-rank-residual-sign`
- `node-ell-two-lambda-two` -> `node-c2-zero`
- `node-family-one-count` -> `node-w-one`
- `node-family-one-weight` -> `node-family-one-count`
- `node-family-one-weight` -> `node-w-one`
- `node-family-support-pruned` -> `node-family-two-weight`
- `node-family-support-pruned` -> `node-n2-le-k2-mul-m`
- `node-family-three-bijection` -> `node-w-three`
- `node-family-two-weight` -> `node-w-two`
- `node-fibre-nonneg` -> `node-w-three`
- `node-finish-ell-ge-four` -> `conclusion-top-rank-residual-sign`
- `node-finish-ell-three` -> `conclusion-top-rank-residual-sign`
- `node-finish-ell-two` -> `conclusion-top-rank-residual-sign`
- `node-forced-neighbour` -> `node-family-support-pruned`
- `node-h-nonneg` -> `node-budget-shapes`
- `node-k2-le-ell-div-two` -> `node-finish-ell-three`
- `node-leaf-card-ge-two` -> `conclusion-top-rank-residual-sign`
- `node-leaf-degree-sum` -> `node-fibre-nonneg`
- `node-leaf-degree-sum` -> `node-k2-le-ell-div-two`
- `node-leaf-support-disjoint` -> `node-alpha-eq-ell-add-a`
- `node-leaf-support-disjoint` -> `node-budget-identity`
- `node-leaf-support-disjoint` -> `node-family-three-bijection`
- `node-m-eq-card-max-indep-d` -> `node-family-one-count`
- `node-m-eq-card-max-indep-d` -> `node-n2-le-k2-mul-m`
- `node-max-indep-eq-leaf-union-d` -> `node-m-eq-card-max-indep-d`
- `node-max-indep-no-support` -> `node-max-indep-eq-leaf-union-d`
- `node-n2-le-k2-mul-m` -> `node-finish-ell-three`
- `node-n2-le-k2-mul-m` -> `node-finish-ell-two`
- `node-sign-bound` -> `conclusion-top-rank-residual-sign`
- `node-sign-bound` -> `node-finish-ell-ge-four`
- `node-sign-bound` -> `node-finish-ell-three`
- `node-sign-bound` -> `node-finish-ell-two`
- `node-top-rank-residual-identity` -> `node-sign-bound`
- `node-w-one` -> `node-sign-bound`
- `node-w-split` -> `node-sign-bound`
- `node-w-three` -> `node-sign-bound`
- `node-w-two` -> `node-sign-bound`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-c-u2-f`: `SOURCES/C-U2-F-CritF.lean` (match)
- `source-c-u2-t`: `SOURCES/C-U2-T-CriticT.lean` (match)
- `source-c-u3-t`: `SOURCES/C-U3-T-CriticU3T.lean` (match)
- `source-c5-la1-frozen`: `SOURCES/C5LA1-Main.lean` (match)
- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-fragment-001`: `LeanProject/LeanProof/Snippets/0001-definition-C4LA1-vertexDeletionIndepSetCount.lean.fragment` (match)
- `source-fragment-002`: `LeanProject/LeanProof/Snippets/0002-definition-C4LA1-vertexDeletionForwardDifference.lean.fragment` (match)
- `source-fragment-003`: `LeanProject/LeanProof/Snippets/0003-definition-C4LA1-IsFavorableAt.lean.fragment` (match)
- `source-fragment-004`: `LeanProject/LeanProof/Snippets/0004-definition-C4LA1-IsGraphLeaf.lean.fragment` (match)
- `source-fragment-005`: `LeanProject/LeanProof/Snippets/0005-definition-C5LA1-support.lean.fragment` (match)
- `source-fragment-006`: `LeanProject/LeanProof/Snippets/0006-definition-C5LA1-leafSet.lean.fragment` (match)
- `source-fragment-007`: `LeanProject/LeanProof/Snippets/0007-definition-C5LA1-leafDegree.lean.fragment` (match)
- `source-fragment-008`: `LeanProject/LeanProof/Snippets/0008-definition-C5LA1-H.lean.fragment` (match)
- `source-fragment-009`: `LeanProject/LeanProof/Snippets/0009-definition-C5LA1-R.lean.fragment` (match)
- `source-fragment-010`: `LeanProject/LeanProof/Snippets/0010-definition-C5LA1-indepSetsAvoiding.lean.fragment` (match)
- `source-fragment-011`: `LeanProject/LeanProof/Snippets/0011-definition-C5LA1-indepSetCount.lean.fragment` (match)
- `source-fragment-012`: `LeanProject/LeanProof/Snippets/0012-definition-C5LA1-forwardDifferenceDel.lean.fragment` (match)
- `source-fragment-013`: `LeanProject/LeanProof/Snippets/0013-definition-C5LA1-aggregate.lean.fragment` (match)
- `source-fragment-014`: `LeanProject/LeanProof/Snippets/0014-definition-C5LA1-crossingIndex.lean.fragment` (match)
- `source-fragment-015`: `LeanProject/LeanProof/Snippets/0015-definition-R26LA1-indepPowerset.lean.fragment` (match)
- `source-fragment-016`: `LeanProject/LeanProof/Snippets/0016-definition-R26CritT-famOneMap.lean.fragment` (match)
- `source-fragment-017`: `LeanProject/LeanProof/Snippets/0017-definition-R26CritT-famOneSource.lean.fragment` (match)
- `source-fragment-037`: `LeanProject/LeanProof/Snippets/0037-lemma-C4LA1-isIndepSet_insert_of_unique_neighbor.lean.fragment` (match)
- `source-fragment-038`: `LeanProject/LeanProof/Snippets/0038-lemma-C4LA1-support_mem_of_max_indep_avoids_leaf.lean.fragment` (match)
- `source-fragment-039`: `LeanProject/LeanProof/Snippets/0039-lemma-C4LA1-exists_maximum_indepSet_containing_leaf.lean.fragment` (match)
- `source-fragment-040`: `LeanProject/LeanProof/Snippets/0040-lemma-C4LA1-topRankSelectorCollapse.lean.fragment` (match)
- `source-fragment-041`: `LeanProject/LeanProof/Snippets/0041-lemma-C5LA1-support_spec.lean.fragment` (match)
- `source-fragment-042`: `LeanProject/LeanProof/Snippets/0042-lemma-C5LA1-adj_iff_support_eq.lean.fragment` (match)
- `source-fragment-043`: `LeanProject/LeanProof/Snippets/0043-lemma-C5LA1-support_ne_self.lean.fragment` (match)
- `source-fragment-044`: `LeanProject/LeanProof/Snippets/0044-lemma-C5LA1-leafDegree_eq_filter_support.lean.fragment` (match)
- `source-fragment-045`: `LeanProject/LeanProof/Snippets/0045-lemma-C5LA1-sum_card_filter_comm.lean.fragment` (match)
- `source-fragment-046`: `LeanProject/LeanProof/Snippets/0046-lemma-C5LA1-H_bijection_card.lean.fragment` (match)
- `source-fragment-047`: `LeanProject/LeanProof/Snippets/0047-lemma-C5LA1-isIndepSet_insert_of_no_adj.lean.fragment` (match)
- `source-fragment-048`: `LeanProject/LeanProof/Snippets/0048-lemma-C5LA1-R_bijection_card.lean.fragment` (match)
- `source-fragment-049`: `LeanProject/LeanProof/Snippets/0049-lemma-C5LA1-H_count_eq_M.lean.fragment` (match)
- `source-fragment-050`: `LeanProject/LeanProof/Snippets/0050-lemma-C5LA1-R_count_eq_zero.lean.fragment` (match)
- `source-fragment-051`: `LeanProject/LeanProof/Snippets/0051-lemma-C5LA1-H_doubleCount.lean.fragment` (match)
- `source-fragment-052`: `LeanProject/LeanProof/Snippets/0052-lemma-C5LA1-R_doubleCount.lean.fragment` (match)
- `source-fragment-053`: `LeanProject/LeanProof/Snippets/0053-lemma-C5LA1-topRankResidualIdentity.lean.fragment` (match)
- `source-fragment-054`: `LeanProject/LeanProof/Snippets/0054-lemma-R26LA1-deletionInjectionBound.lean.fragment` (match)
- `source-fragment-055`: `LeanProject/LeanProof/Snippets/0055-lemma-R26LA1-isIndepSet_union_of_no_cross_adj.lean.fragment` (match)
- `source-fragment-056`: `LeanProject/LeanProof/Snippets/0056-lemma-R26LA1-budgetWeightBound.lean.fragment` (match)
- `source-fragment-057`: `LeanProject/LeanProof/Snippets/0057-lemma-R26LA1-leafDegree_sum_eq_inter_support.lean.fragment` (match)
- `source-fragment-058`: `LeanProject/LeanProof/Snippets/0058-lemma-R26U3-closed_reachable.lean.fragment` (match)
- `source-fragment-059`: `LeanProject/LeanProof/Snippets/0059-lemma-R26U3-card_leafSet_ge_two_of_nontrivial.lean.fragment` (match)
- `source-fragment-060`: `LeanProject/LeanProof/Snippets/0060-lemma-R26U3-tree_two_le_indepNum_two_le_leafSet.lean.fragment` (match)
- `source-fragment-061`: `LeanProject/LeanProof/Snippets/0061-lemma-R26U3-tree_two_le_indepNum_no_adjacent_leaves.lean.fragment` (match)
- `source-fragment-062`: `LeanProject/LeanProof/Snippets/0062-lemma-R26U3-sum_leafDegree_eq_card_leafSet.lean.fragment` (match)
- `source-fragment-063`: `LeanProject/LeanProof/Snippets/0063-lemma-R26U3-eligible_three_le_indepNum.lean.fragment` (match)
- `source-fragment-064`: `LeanProject/LeanProof/Snippets/0064-lemma-R26U3-nonleaf_degree_eq_two_of_leafSet_card_eq_two.lean.fragment` (match)
- `source-fragment-065`: `LeanProject/LeanProof/Snippets/0065-lemma-R26U3-leafDegree_two_indepNum_eq_two.lean.fragment` (match)
- `source-fragment-066`: `LeanProject/LeanProof/Snippets/0066-lemma-R26CritU3T-mul_card_leafDegree_fiber_le_card_leafSet.lean.fragment` (match)
- `source-fragment-067`: `LeanProject/LeanProof/Snippets/0067-lemma-R26CritU3T-two_mul_card_C2_le_card_leafSet.lean.fragment` (match)
- `source-fragment-068`: `LeanProject/LeanProof/Snippets/0068-lemma-R26CritT-famOneInjOn.lean.fragment` (match)
- `source-fragment-069`: `LeanProject/LeanProof/Snippets/0069-lemma-R26CritT-famOneImageCard.lean.fragment` (match)
- `source-fragment-070`: `LeanProject/LeanProof/Snippets/0070-lemma-R26CritF-fibreInequalitySharp.lean.fragment` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)
- `source-lean-main`: `LeanProject/LeanProof/Main.lean` (match)
- `source-u2`: `SOURCES/U2-Main.lean` (match)
- `source-u3`: `SOURCES/U3-Main.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
