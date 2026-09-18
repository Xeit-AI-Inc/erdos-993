# Theorem Contract: C5-LA1 Top-Rank Residual Identity for Finite Literal Ordinary Trees (F7 Collapse Composed With (RI))

- Contract ID: `c5-la1-top-rank-residual-identity-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `750bc81b5af8c18c6c9766c5a419411e57213829d359843ac70493ec4ad12b00`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite simple graph G on a finite vertex type with decidable equality and decidable adjacency, if G is a tree, 2 <= G.indepNum, x(G)+2 <= G.indepNum-1, and every leaf of G belongs to every maximum independent set of G, then with p = G.indepNum-1, L the leaf set, ell = |L|, M = i_alpha(G), and lambda(s) the number of leaf neighbours of s (zero off supports), the equality S(G,p) = ell*M - sum_{B in I_p(G)} (|B intersect L| - sum_{s in B} lambda(s)) holds. This composes the verified F7 selector collapse (which discharges the favorable-filter-equals-leaf-set step) with the (RI) double-counting identity; it asserts no (RC) content, no inequality, and no sign claim.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem C5LA1.topRankResidualIdentity`
- Statement SHA-256: `4713d55cf0cdbb1763946e8ddf35d337e396c63b78104b0fd1bd8935acaaa2b6`

```lean
(G : SimpleGraph V) [DecidableRel G.Adj] (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) (hEligible : crossingIndex G + 2 ≤ G.indepNum - 1) (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) → S.card = G.indepNum → v ∈ S) : aggregate G (G.indepNum - 1) = ((leafSet G).card * indepSetCount G ∅ G.indepNum : Int) - ∑ B ∈ indepSetsAvoiding G ∅ (G.indepNum - 1), (((B ∩ leafSet G).card : Int) - ∑ s ∈ B, (leafDegree G s : Int))
```

## Quantifiers

- `forall V` over `domain-vertex-type`
- `forall G` over `domain-finite-simple-graph`
- `forall adjacencyDecision` over `domain-adjacency-decision`

## Hypotheses

- `hyp-tree`: G is a connected acyclic simple graph, i.e. G.IsTree.
- `hyp-alpha`: 2 <= G.indepNum.
- `hyp-eligible`: x(G) + 2 <= G.indepNum - 1, i.e. crossingIndex G + 2 <= G.indepNum - 1. Not used by the proof; mandatory in the terminal declaration per the controller ruling.
- `hyp-residual`: Every leaf of G belongs to every maximum independent set of G: for every leaf v and every independent S with S.card = G.indepNum, v is in S.

## Conclusion

- `conclusion-top-rank-residual-identity`: aggregate G (G.indepNum-1) = ((leafSet G).card * indepSetCount(G, empty, G.indepNum) : Int) - sum_{B in indepSetsAvoiding G empty (G.indepNum-1)} ( (B intersect leafSet G).card - sum_{s in B} leafDegree G s ), i.e. the literal (RI) identity composed with the F7 collapse. An equality; never weakened to or accompanied by an inequality or sign claim.

## Dependencies

- `def-aggregate` -> `conclusion-top-rank-residual-identity`
- `def-crossing-index` -> `hyp-eligible`
- `def-favorable` -> `def-aggregate`
- `def-forward-difference` -> `def-favorable`
- `def-graph-leaf` -> `def-leaf-set`
- `def-graph-leaf` -> `def-support`
- `def-graph-leaf` -> `hyp-residual`
- `def-h-del` -> `def-aggregate`
- `def-indep-sets-card` -> `conclusion-top-rank-residual-identity`
- `def-indep-sets-card` -> `def-aggregate`
- `def-indep-sets-card` -> `def-crossing-index`
- `def-independence-number` -> `conclusion-top-rank-residual-identity`
- `def-independence-number` -> `def-crossing-index`
- `def-independence-number` -> `def-top-rank`
- `def-independence-number` -> `hyp-alpha`
- `def-independence-number` -> `hyp-residual`
- `def-leaf-degree` -> `conclusion-top-rank-residual-identity`
- `def-leaf-set` -> `conclusion-top-rank-residual-identity`
- `def-leaf-set` -> `def-aggregate`
- `def-leaf-set` -> `def-leaf-degree`
- `def-r-del` -> `def-aggregate`
- `def-support` -> `def-h-del`
- `def-support` -> `def-r-del`
- `def-top-rank` -> `conclusion-top-rank-residual-identity`
- `def-top-rank` -> `hyp-eligible`
- `def-vertex-deletion-coefficient` -> `def-forward-difference`
- `domain-adjacency-decision` -> `def-indep-sets-card`
- `domain-adjacency-decision` -> `def-leaf-degree`
- `domain-adjacency-decision` -> `def-r-del`
- `domain-adjacency-decision` -> `def-vertex-deletion-coefficient`
- `domain-finite-simple-graph` -> `def-graph-leaf`
- `domain-finite-simple-graph` -> `def-indep-sets-card`
- `domain-finite-simple-graph` -> `def-independence-number`
- `domain-finite-simple-graph` -> `def-vertex-deletion-coefficient`
- `domain-finite-simple-graph` -> `domain-adjacency-decision`
- `domain-finite-simple-graph` -> `domain-vertex`
- `domain-finite-simple-graph` -> `hyp-tree`
- `domain-vertex` -> `def-graph-leaf`
- `domain-vertex` -> `def-support`
- `domain-vertex` -> `def-vertex-deletion-coefficient`
- `domain-vertex-type` -> `domain-finite-simple-graph`
- `domain-vertex-type` -> `domain-vertex`
- `hyp-alpha` -> `conclusion-top-rank-residual-identity`
- `hyp-eligible` -> `conclusion-top-rank-residual-identity`
- `hyp-residual` -> `conclusion-top-rank-residual-identity`
- `hyp-tree` -> `conclusion-top-rank-residual-identity`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `Classical.choice`, `propext`, `Quot.sound`

## Source Evidence

- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
