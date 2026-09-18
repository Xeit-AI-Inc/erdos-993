# Theorem Contract: C4-LA1 Top-Rank Selector Collapse for Finite Literal Ordinary Trees

- Contract ID: `c4-la1-top-rank-selector-collapse-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `9faa81ad73f1dec562b84a8c9a3173ff2b1565ff4b3f80c350d6f297d3358090`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite literal ordinary tree T with alpha(T) at least 2, every leaf v is strictly favorable at p = alpha(T)-1; equivalently, i_alpha(T)(T-v) is strictly less than i_(alpha(T)-1)(T-v).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem C4LA1.topRankSelectorCollapse`
- Statement SHA-256: `f813035a1746753b30cc21544541c6538e84c75a738633d0ef504000cd7256ce`

```lean
(G : SimpleGraph V) [DecidableRel G.Adj] (_hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) (v : V) (hvLeaf : IsGraphLeaf G v) : IsFavorableAt G v (G.indepNum - 1)
```

## Quantifiers

- `forall V` over `domain-vertex-type`
- `forall G` over `domain-finite-simple-graph`
- `forall adjacencyDecision` over `domain-adjacency-decision`
- `forall v` over `domain-vertex`

## Hypotheses

- `hyp-tree`: G is a connected acyclic simple graph, i.e. G.IsTree.
- `hyp-alpha-lower-bound`: 2 <= G.indepNum.
- `hyp-leaf`: v is a leaf of G in the unique-neighbor sense.

## Conclusion

- `conclusion-top-rank-selector-collapse`: v is favorable at G.indepNum - 1, equivalently the integer forward difference i_alpha(G)(G-v) - i_(alpha(G)-1)(G-v) is strictly negative.

## Dependencies

- `domain-finite-simple-graph` -> `def-independence-number`
- `domain-finite-simple-graph` -> `def-graph-leaf`
- `domain-vertex` -> `def-graph-leaf`
- `domain-adjacency-decision` -> `def-vertex-deletion-coefficient`
- `domain-finite-simple-graph` -> `def-vertex-deletion-coefficient`
- `domain-vertex` -> `def-vertex-deletion-coefficient`
- `def-vertex-deletion-coefficient` -> `def-forward-difference`
- `def-forward-difference` -> `def-favorable`
- `def-independence-number` -> `def-top-rank`
- `domain-vertex-type` -> `domain-finite-simple-graph`
- `domain-finite-simple-graph` -> `domain-adjacency-decision`
- `domain-finite-simple-graph` -> `domain-vertex`
- `domain-vertex-type` -> `domain-vertex`
- `domain-finite-simple-graph` -> `hyp-tree`
- `def-independence-number` -> `hyp-alpha-lower-bound`
- `def-graph-leaf` -> `hyp-leaf`
- `def-favorable` -> `conclusion-top-rank-selector-collapse`
- `def-top-rank` -> `conclusion-top-rank-selector-collapse`
- `hyp-alpha-lower-bound` -> `conclusion-top-rank-selector-collapse`
- `hyp-leaf` -> `conclusion-top-rank-selector-collapse`
- `hyp-tree` -> `conclusion-top-rank-selector-collapse`

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
