# Theorem Contract: Bottom-rank uniform matching sign (award group C4-LA1)

- Contract ID: `c4-la1-bottom-rank-uniform-matching-sign-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `6f15b1aa61b511dd22d342da416d56d697b2a17bf67568c7fe33943201d71082`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every d >= 3, every finite type X, every finite simple graph G on X with Nat.card X = 3*d, and every matching of size m(d) = (3*d+1)/2 - 1 in G (realised by an injective f : Fin m(d) x Bool -> X with G.Adj (f (i,false)) (f (i,true)) for every i), Erdos993G1.delta G (d : Z) <= 0, where delta/coeff/indepCount are the G1 definitions counting actual independent-set sizes with integer zero extension. No crossing hypothesis, no acyclicity, no cover; uniform in d with no horizon; rank r = d and order 3*d only.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem Erdos993G1.UniformMatching.bottomRank_delta_nonpos`
- Statement SHA-256: `d753f988e3315dfbb39a7d2aa0ac10c689740308f893918656de9b0f5efd80c5`

```lean
theorem bottomRank_delta_nonpos {X : Type u} [Finite X] (d : ℕ) (hd : 3 ≤ d) (G : SimpleGraph X) (hn : Nat.card X = 3 * d) (f : Fin ((3 * d + 1) / 2 - 1) × Bool → X) (hf : Function.Injective f) (he : ∀ i, G.Adj (f (i, false)) (f (i, true))) : Erdos993G1.delta G (d : ℤ) ≤ 0
```

## Quantifiers

- `forall X` over `domain-x`
- `forall d` over `domain-x`
- `forall G` over `domain-graph`
- `forall f` over `domain-matching`

## Hypotheses

- `hyp-finite`: X is Finite.
- `hyp-d-ge-3`: 3 <= d.
- `hyp-order`: Nat.card X = 3 * d.
- `hyp-injective`: f is Function.Injective.
- `hyp-adjacent`: For every i, G.Adj (f (i, false)) (f (i, true)) -- the images form a matching of size m(d) = (3*d+1)/2 - 1.

## Conclusion

- `conclusion`: Erdos993G1.delta G (d : Z) <= 0.

## Dependencies

- `def-coeff` -> `def-delta`
- `def-delta` -> `conclusion`
- `def-indepcount` -> `def-coeff`
- `def-stratum` -> `def-inside-incidence`
- `def-stratum` -> `def-outside-incidence`
- `def-stratum` -> `def-partition`
- `domain-graph` -> `hyp-adjacent`
- `domain-matching` -> `hyp-adjacent`
- `domain-matching` -> `hyp-injective`
- `domain-x` -> `domain-graph`
- `domain-x` -> `domain-matching`
- `domain-x` -> `hyp-finite`
- `domain-x` -> `hyp-order`
- `hyp-adjacent` -> `conclusion`
- `hyp-d-ge-3` -> `hyp-order`
- `hyp-finite` -> `conclusion`
- `hyp-injective` -> `hyp-adjacent`
- `hyp-order` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)
- `source-originating-fragment`: `SOURCE/originating-fragment-Main.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
