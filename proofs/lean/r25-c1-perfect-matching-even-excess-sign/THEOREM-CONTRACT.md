# Theorem Contract: Perfect-matching uniform sign (Cycle 1 award group B, companion contract)

- Contract ID: `c1-la2-perfect-matching-uniform-sign-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `227b4260591267942d3ba6a73ad15326aa831336989e7f777a1365bd646fa425`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite simple graph G on a vertex type X of cardinality 2m carrying a perfect matching (an injective f : Fin m x Bool -> X with G.Adj (f (i,false)) (f (i,true)) for every i : Fin m), and every natural r with 2m <= 3r+1: Delta_r(G) <= 0. Equivalently, with d = 2m-2r (always even, forced by the perfect-matching hypothesis): a perfect-matching graph of order 2r+d with 3d <= 2m+2 has Delta_r <= 0. Uniform over even d only; not Tier 3a (says nothing about graphs without a perfect matching); no sharpness claim; no transfer to firstDescent/x(G), forests, residuals, G1 tuples, Tier 1, Tier 2, the diagnostic band, FOREST, TREE, TRANSFER, E993-BETA-AGG, or Erdos #993.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem Erdos993G1.C1LA2.perfectMatching_delta_nonpos`
- Statement SHA-256: `55639850c6d622371bad5b810a8624e6dbdb3ac8c31d3ea537257f9e753956d6`

```lean
theorem perfectMatching_delta_nonpos {X : Type u} [Finite X]
    (G : SimpleGraph X) (m r : ℕ) (hn : Nat.card X = 2 * m) (hr : 2 * m ≤ 3 * r + 1)
    (f : Fin m × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin m, G.Adj (f (i, false)) (f (i, true))) :
    Erdos993G1.delta G (r : ℤ) ≤ 0
```

## Quantifiers

- `forall X` over `domain-vertices`
- `forall finiteX` over `domain-finite`
- `forall G` over `domain-graph`
- `forall m` over `domain-matching-size`
- `forall r` over `domain-rank`
- `forall f` over `domain-matching-fn`

## Hypotheses

- `hyp-card`: Nat.card X = 2 * m.
- `hyp-threshold`: 2 * m <= 3 * r + 1 (equivalently, with d := 2m-2r, 3d <= 2m+2; d is forced even by hyp-card and hyp-matching-inj).
- `hyp-matching-inj`: Function.Injective f.
- `hyp-matching-adj`: forall i : Fin m, G.Adj (f (i, false)) (f (i, true)).

## Conclusion

- `conclusion`: Erdos993G1.delta G (r : Z) <= 0. Proved via two named lemmas: perfectMatching_containment ((r+1)*indepCount G (r+1) <= (2*(m-r):N:Z)*indepCount G r, the incidence double count over the m matching edges) and perfectMatching_threshold_arith ((2*(m-r):N:Z) <= (r:Z)+1, by omega from hyp-threshold), combined by cancellation (indepCount nonneg, r+1>0) for r<m, with the r>=m case handled separately (indepCount G (r+1) = 0 since every independent set has cardinality <= m under a perfect matching).

## Dependencies

- `def-simple-graph` -> `def-count`
- `def-count` -> `def-coeff`
- `def-coeff` -> `def-delta`
- `def-simple-graph` -> `def-perfect-matching`
- `def-simple-graph` -> `domain-vertices`
- `domain-vertices` -> `domain-finite`
- `domain-vertices` -> `domain-graph`
- `def-simple-graph` -> `domain-graph`
- `domain-vertices` -> `domain-matching-fn`
- `domain-matching-size` -> `domain-matching-fn`
- `domain-finite` -> `hyp-card`
- `domain-matching-size` -> `hyp-card`
- `domain-matching-size` -> `hyp-threshold`
- `domain-rank` -> `hyp-threshold`
- `domain-matching-fn` -> `hyp-matching-inj`
- `def-perfect-matching` -> `hyp-matching-inj`
- `domain-graph` -> `hyp-matching-adj`
- `domain-matching-fn` -> `hyp-matching-adj`
- `hyp-card` -> `conclusion`
- `hyp-threshold` -> `conclusion`
- `hyp-matching-inj` -> `conclusion`
- `hyp-matching-adj` -> `conclusion`
- `def-delta` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-c3-main`: `SOURCE/g1/LeanProof/Main.lean` (match)
- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)
- `source-semantic-contract`: `SOURCE/SEMANTIC-CONTRACT.md` (match)
- `source-solution-contract`: `SOURCE/SOLUTION-CONTRACT.md` (match)
- `source-synthesis`: `SOURCE/SYNTHESIS.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
