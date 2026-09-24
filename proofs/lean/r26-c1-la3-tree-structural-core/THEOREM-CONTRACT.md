# Theorem Contract: C1-LA3 Tree-Structural Core: the P_3 Lemma for Finite Literal Ordinary Trees (r26 Cycle 1)

- Contract ID: `c1-la3-tree-structural-core-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `3205cad3795799a18b8d8903f333965021560cf8f53977dad85fafa73fe7947c`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite simple graph G on a finite vertex type with decidable equality and decidable adjacency, if G is a tree, its leaf set has exactly two elements, and some vertex s has leaf degree exactly 2 (both leaves are adjacent to s), then G.indepNum = 2. The declaration is the deepest fact of award group C1-LA3, whose registered declarations are the tree-structural core of C1-ALLOCATION.md item 9 (a)-(f) in the sharp forms ruled by the Cycle 1 synthesis, together with the critic-compiled extensions L intersect C(G) = empty, lambda identically zero on the leaf set, j*|C_j| <= |L| hence k_2 <= floor(|L|/2), and k_2 = 0 on the eligible class when |L| = 2. No registered declaration mentions the aggregate S, W_III, the families, or (RC), and none consumes hyp-residual.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem R26LA3.leafDegree_two_indepNum_eq_two`
- Statement SHA-256: `272221c3cf3809e320778b53f0c156e68293e47bde5948dee3677de7a526add5`

```lean
(G : SimpleGraph V) [DecidableRel G.Adj] (hTree : G.IsTree) (hLeafCard : (C5LA1.leafSet G).card = 2) {s : V} (hDeg2 : C5LA1.leafDegree G s = 2) : G.indepNum = 2
```

## Quantifiers

- `forall V` over `domain-vertex-type`
- `forall G` over `domain-finite-simple-graph`
- `forall adjacencyDecision` over `domain-adjacency-decision`
- `forall s` over `domain-vertex`

## Hypotheses

- `hyp-tree`: G is a connected acyclic simple graph, i.e. G.IsTree. Both halves are load-bearing in the terminal declaration: acyclicity through the tree edge count inside lem-nonleaf-degree-eq-two, connectivity through lem-closed-reachable.
- `hyp-leaf-card`: The leaf set has exactly two elements: (C5LA1.leafSet G).card = 2.
- `hyp-leafdegree-two`: The distinguished vertex s supports both leaves: C5LA1.leafDegree G s = 2.

## Conclusion

- `conclusion-p3-indepnum-eq-two`: G.indepNum = 2. Under hyp-tree, hyp-leaf-card and hyp-leafdegree-two the tree is forced to be the three-vertex path t1 - s - t2, whose independence number is 2. The declaration asserts the independence-number value ONLY; it does not assert the vertex identification V = {t1, s, t2}, and it consumes NO hyp-alpha and NO hyp-residual.

## Dependencies

- `def-crossing-index` -> `lem-eligible-three-le-indepnum`
- `def-forward-difference-del` -> `def-crossing-index`
- `def-graph-leaf` -> `def-leaf-set`
- `def-graph-leaf` -> `def-support`
- `def-graph-leaf` -> `lem-card-leafset-ge-two-nontrivial`
- `def-graph-leaf` -> `lem-no-adjacent-leaves`
- `def-graph-leaf` -> `lem-nonleaf-degree-eq-two`
- `def-graph-leaf` -> `lem-support-spec`
- `def-indep-set-count` -> `def-forward-difference-del`
- `def-indep-sets-avoiding` -> `def-indep-set-count`
- `def-independence-number` -> `conclusion-p3-indepnum-eq-two`
- `def-independence-number` -> `def-crossing-index`
- `def-independence-number` -> `def-top-rank`
- `def-independence-number` -> `lem-eligible-three-le-indepnum`
- `def-independence-number` -> `lem-no-adjacent-leaves`
- `def-independence-number` -> `lem-p3-core`
- `def-independence-number` -> `lem-tree-two-le-indepnum-two-le-leafset`
- `def-leaf-degree` -> `hyp-leafdegree-two`
- `def-leaf-degree` -> `lem-leafdegree-eq-filter-support`
- `def-leaf-degree` -> `lem-leafdegree-eq-zero-not-mem-supportset`
- `def-leaf-degree` -> `lem-p3-core`
- `def-leaf-set` -> `def-leaf-degree`
- `def-leaf-set` -> `def-support-set`
- `def-leaf-set` -> `hyp-leaf-card`
- `def-leaf-set` -> `lem-card-leafset-ge-two-nontrivial`
- `def-leaf-set` -> `lem-disjoint-leafset-supportset`
- `def-leaf-set` -> `lem-leafdegree-eq-filter-support`
- `def-leaf-set` -> `lem-nonleaf-degree-eq-two`
- `def-leaf-set` -> `lem-p3-core`
- `def-support` -> `def-support-set`
- `def-support` -> `lem-leafdegree-eq-filter-support`
- `def-support` -> `lem-support-spec`
- `def-support-set` -> `lem-disjoint-leafset-supportset`
- `def-support-set` -> `lem-leaf-not-mem-supportset`
- `def-support-set` -> `lem-leafdegree-eq-zero-not-mem-supportset`
- `def-top-rank` -> `lem-eligible-three-le-indepnum`
- `domain-adjacency-decision` -> `def-indep-sets-avoiding`
- `domain-adjacency-decision` -> `def-leaf-degree`
- `domain-finite-simple-graph` -> `def-graph-leaf`
- `domain-finite-simple-graph` -> `def-indep-sets-avoiding`
- `domain-finite-simple-graph` -> `def-independence-number`
- `domain-finite-simple-graph` -> `domain-adjacency-decision`
- `domain-finite-simple-graph` -> `domain-vertex`
- `domain-finite-simple-graph` -> `hyp-tree`
- `domain-finite-simple-graph` -> `lem-card-leafset-ge-two-nontrivial`
- `domain-finite-simple-graph` -> `lem-closed-reachable`
- `domain-finite-simple-graph` -> `lem-nonleaf-degree-eq-two`
- `domain-vertex` -> `def-graph-leaf`
- `domain-vertex` -> `def-support`
- `domain-vertex` -> `hyp-leafdegree-two`
- `domain-vertex-type` -> `domain-finite-simple-graph`
- `domain-vertex-type` -> `domain-vertex`
- `hyp-leaf-card` -> `conclusion-p3-indepnum-eq-two`
- `hyp-leafdegree-two` -> `conclusion-p3-indepnum-eq-two`
- `hyp-tree` -> `conclusion-p3-indepnum-eq-two`
- `lem-adj-iff-support-eq` -> `lem-leaf-not-mem-supportset`
- `lem-adj-iff-support-eq` -> `lem-leafdegree-eq-filter-support`
- `lem-card-leafset-ge-two-nontrivial` -> `lem-tree-two-le-indepnum-two-le-leafset`
- `lem-closed-reachable` -> `lem-no-adjacent-leaves`
- `lem-closed-reachable` -> `lem-p3-core`
- `lem-eligible-three-le-indepnum` -> `lem-no-leafdegree-two-of-eligible`
- `lem-leaf-not-mem-supportset` -> `lem-disjoint-leafset-supportset`
- `lem-leaf-not-mem-supportset` -> `lem-leaf-leafdegree-eq-zero`
- `lem-leafdegree-eq-filter-support` -> `lem-leafdegree-eq-zero-not-mem-supportset`
- `lem-leafdegree-eq-filter-support` -> `lem-sum-leafdegree-eq-card-leafset`
- `lem-leafdegree-eq-zero-not-mem-supportset` -> `lem-leaf-leafdegree-eq-zero`
- `lem-mul-card-leafdegree-fiber-le` -> `lem-two-mul-card-c2-le`
- `lem-no-adjacent-leaves` -> `lem-leaf-not-mem-supportset`
- `lem-no-leafdegree-two-of-eligible` -> `lem-card-c2-eq-zero-of-eligible`
- `lem-nonleaf-degree-eq-two` -> `lem-p3-core`
- `lem-p3-core` -> `conclusion-p3-indepnum-eq-two`
- `lem-p3-core` -> `lem-no-leafdegree-two-of-eligible`
- `lem-sum-leafdegree-eq-card-leafset` -> `lem-card-c1-le-card-leafset`
- `lem-sum-leafdegree-eq-card-leafset` -> `lem-mul-card-leafdegree-fiber-le`
- `lem-support-spec` -> `lem-adj-iff-support-eq`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `Classical.choice`, `propext`, `Quot.sound`

## Source Evidence

- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-carry-table`: `DRAFTS/CARRY-TABLE.json` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)
- `source-lean-main`: `LeanProject/LeanProof/Main.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
