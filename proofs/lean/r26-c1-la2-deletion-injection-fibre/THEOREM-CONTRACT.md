# Theorem Contract: C1-LA2 Deletion Injection and Sharp Fibre Inequality for Independent Subsets of an Arbitrary Vertex Finset

- Contract ID: `c1-la2-deletion-injection-fibre-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `76080c7df5f789150dc0eb66f48dfa9603cafd2df56f570f68216d9c08d61f7c`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Let V be a finite type with decidable equality, G a simple graph on V with decidable adjacency, U : Finset V an arbitrary vertex finset, and I(U) the finset of independent subsets of U. Then (a) 2 * (sum over A in I(U) of |A|) <= |U| * |I(U)| in the natural numbers, and (b) for EVERY natural number ℓ, ((ℓ : ℤ) - (|U| : ℤ)) * (|I(U)| : ℤ) <= sum over A in I(U) of ((ℓ : ℤ) - 2 * (|A| : ℤ)) in the integers. The terminal declaration of this contract is (b), the sharp fibre inequality. There are no hypotheses beyond finiteness: no tree, no connectivity, no hyp-alpha, no hyp-eligible, no residual hypothesis (star), and no |U| <= ℓ. Statement (a) is the in-run RE-PROOF of the occupancy bound of Andriantiana-Razanajatovo Misanantenaina-Wagner (2020), carried on the face of this contract per SOLUTION-CONTRACT.md fence 7; nothing is imported. The award asserts nothing about the residual aggregate S, about trees, about the family decomposition, about W_III, or about (RC); the instantiation of (b) at U := U(J') belongs to award group C1-LA1.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem R26LA2.fibreInequalitySharp`
- Statement SHA-256: `4c23d4046c43790a6142ee1462d1c8338144ca7c330727957ceb3b7231f05e46`

```lean
(G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) (ℓ : ℕ) : ((ℓ : ℤ) - (U.card : ℤ)) * ((indepPowerset G U).card : ℤ) ≤ ∑ A ∈ indepPowerset G U, ((ℓ : ℤ) - 2 * (A.card : ℤ))
```

## Quantifiers

- `forall V` over `domain-vertex-type`
- `forall G` over `domain-finite-simple-graph`
- `forall adjacencyDecision` over `domain-adjacency-decision`
- `forall U` over `domain-vertex-finset`
- `forall ell` over `domain-rank-parameter`

## Hypotheses

- None.

## Conclusion

- `conclusion-sharp-fibre-inequality`: For every finite vertex type V with decidable equality, every simple graph G on V with decidable adjacency, every U : Finset V and every natural number ℓ, the inequality ((ℓ : ℤ) - (|U| : ℤ)) * (|I(U)| : ℤ) <= sum over A in I(U) of ((ℓ : ℤ) - 2 * (|A| : ℤ)) holds in the integers, where I(U) = indepPowerset G U. No hypothesis beyond finiteness is used: no tree, no connectivity, no hyp-alpha, no hyp-eligible, no residual hypothesis, and in particular no |U| <= ℓ. The statement asserts nothing about the residual sign S, about trees, about families (I)/(II)/(III), about W_III or about (RC); its instantiation at U := U(J') belongs to award group C1-LA1 and is outside this contract.

## Dependencies

- `domain-vertex-type` -> `def-indep-powerset`
- `domain-finite-simple-graph` -> `def-indep-powerset`
- `domain-adjacency-decision` -> `def-indep-powerset`
- `domain-vertex-finset` -> `def-indep-powerset`
- `def-indep-powerset` -> `def-deletion-injection-bound`
- `def-sum-card-filter-comm` -> `def-deletion-injection-bound`
- `domain-vertex-type` -> `def-deletion-injection-bound`
- `domain-finite-simple-graph` -> `def-deletion-injection-bound`
- `domain-adjacency-decision` -> `def-deletion-injection-bound`
- `domain-vertex-finset` -> `def-deletion-injection-bound`
- `domain-vertex-type` -> `domain-finite-simple-graph`
- `domain-finite-simple-graph` -> `domain-adjacency-decision`
- `domain-vertex-type` -> `domain-vertex-finset`
- `def-indep-powerset` -> `conclusion-sharp-fibre-inequality`
- `def-deletion-injection-bound` -> `conclusion-sharp-fibre-inequality`
- `def-sum-card-filter-comm` -> `conclusion-sharp-fibre-inequality`
- `domain-vertex-type` -> `conclusion-sharp-fibre-inequality`
- `domain-finite-simple-graph` -> `conclusion-sharp-fibre-inequality`
- `domain-adjacency-decision` -> `conclusion-sharp-fibre-inequality`
- `domain-vertex-finset` -> `conclusion-sharp-fibre-inequality`
- `domain-rank-parameter` -> `conclusion-sharp-fibre-inequality`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `Classical.choice`, `propext`, `Quot.sound`

## Source Evidence

- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-carry-deletion-injection-bound`: `DRAFTS/carry-deletionInjectionBound.declaration.txt` (match)
- `source-carry-fibre-inequality-sharp`: `DRAFTS/carry-fibreInequalitySharp.declaration.txt` (match)
- `source-carry-indep-powerset`: `DRAFTS/carry-indepPowerset.declaration.txt` (match)
- `source-carry-sum-card-filter-comm`: `DRAFTS/carry-C5LA1-sum_card_filter_comm.declaration.txt` (match)
- `source-fragment-1-indep-powerset`: `LeanProject/LeanProof/Snippets/0001-definition-R26LA2-indepPowerset.lean.fragment` (match)
- `source-fragment-2-sum-card-filter-comm`: `LeanProject/LeanProof/Snippets/0002-lemma-C5LA1-sum_card_filter_comm.lean.fragment` (match)
- `source-fragment-3-deletion-injection-bound`: `LeanProject/LeanProof/Snippets/0003-lemma-R26LA2-deletionInjectionBound.lean.fragment` (match)
- `source-fragment-4-fibre-inequality-sharp`: `LeanProject/LeanProof/Snippets/0004-theorem-R26LA2-fibreInequalitySharp.lean.fragment` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
