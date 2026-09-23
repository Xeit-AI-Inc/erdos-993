# Theorem Contract: Fixed-band d=5 seven-edge matching sign (Award group A, E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN)

- Contract ID: `c1-la1-d5-seven-matching-sign-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `2479fc1af6b2bf38659922b7a51cdef8f25779010382b9f2c6374bd38b85961b`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite simple graph G on a vertex type of cardinality 2r+5 carrying seven pairwise disjoint edges, Delta_r(G) <= 0, for every r >= 1. Bare: no crossing hypothesis, no acyclicity, no forest hypothesis. Delta, coeff, indepCount are the SEMANTIC-CONTRACT.md Erdos993G1 definitions reused verbatim. hr : 1 <= r is retained for fidelity with the C3 analogue (fiveMatching_delta_nonpos, entry 164) though derivable from cardinality (M.card = 14 <= Nat.card X = 2r+5 forces 5 <= r by omega; r <= 4 is vacuous).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem Erdos993G1.FourthWideMatching.sevenMatching_delta_nonpos`
- Statement SHA-256: `cc5575f4b906c41851529643770bd194f011c4064cf166566615b75645064706`

```lean
theorem sevenMatching_delta_nonpos {X : Type*} [Finite X] (G : SimpleGraph X) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card X = 2*r+5) (f : Fin 7 × Bool → X) (hf : Function.Injective f) (he : ∀ i : Fin 7, G.Adj (f (i, false)) (f (i, true))) : Erdos993G1.delta G (r : ℤ) ≤ 0
```

## Quantifiers

- `forall X` over `domain-vertex-type`
- `forall G` over `domain-graph`
- `forall r` over `domain-rank`
- `forall f` over `domain-matching-map`

## Hypotheses

- `hyp-finite`: X is Finite.
- `hyp-rank-pos`: hr : 1 <= r (retained for fidelity with the C3 analogue; redundant given hyp-card and hyp-matching-injective, since 14 <= 2r+5 forces 5 <= r).
- `hyp-card`: hn : Nat.card X = 2*r+5.
- `hyp-matching-injective`: hf : Function.Injective f (the 14 endpoints f(i,false), f(i,true) for i : Fin 7 are pairwise distinct).
- `hyp-matching-adjacent`: he : forall i : Fin 7, G.Adj (f (i, false)) (f (i, true)) (each of the seven pairs is an edge of G).

## Conclusion

- `conclusion-delta-nonpos`: Erdos993G1.delta G (r : ℤ) <= 0.

## Dependencies

- `def-indepcount` -> `def-coeff`
- `def-coeff` -> `def-delta`
- `domain-vertex-type` -> `domain-graph`
- `domain-vertex-type` -> `domain-matching-map`
- `domain-vertex-type` -> `hyp-finite`
- `domain-vertex-type` -> `hyp-card`
- `domain-rank` -> `hyp-rank-pos`
- `domain-rank` -> `hyp-card`
- `domain-matching-map` -> `hyp-matching-injective`
- `domain-matching-map` -> `hyp-matching-adjacent`
- `domain-graph` -> `hyp-matching-adjacent`
- `def-delta` -> `conclusion-delta-nonpos`
- `hyp-finite` -> `conclusion-delta-nonpos`
- `hyp-rank-pos` -> `conclusion-delta-nonpos`
- `hyp-card` -> `conclusion-delta-nonpos`
- `hyp-matching-injective` -> `conclusion-delta-nonpos`
- `hyp-matching-adjacent` -> `conclusion-delta-nonpos`
- `def-stratum` -> `conclusion-delta-nonpos`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-dependencies-pin`: `DEPENDENCIES.yaml` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
