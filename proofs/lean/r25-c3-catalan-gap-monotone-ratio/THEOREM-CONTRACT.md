# Theorem Contract: Catalan-dominance gap: monotone ratio, base propagation, and the tau>=8 ceiling

- Contract ID: `c3-la1-catalan-gap-monotone-ratio-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `c812154b5c773bed711f2423f0fe2f212a9c1ff697d681c0fc88d6ea470d23ac`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For the Catalan-dominance gap Gamma(tau,k) = catalan(k+1) - sum_{j=1}^{tau} C(tau,j)*(catalan(k-j) if j<=k else 0) (catalan Mathlib's Catalan-number function, the guard an integer zero-extension convention of record): (1) for every tau>=1 and k>=tau, Gamma(tau,k)*catalan(k+2) < Gamma(tau,k+1)*catalan(k+1) (the ratio Gamma(tau,k)/catalan(k+1) strictly increases in k, stated denominator-free); (2) hence from any base 0<Gamma(tau,K) with tau<=K, 0<Gamma(tau,k) for every k>=K; (3) with the seven explicit bases K(1..7) = 0,2,3,4,6,12,70, i.e. Gamma(tau,k)>0 for every k>=K(tau) at tau=1..7; and (4) Gamma(tau,k)<0 for every tau>=8 and k>=tau. A theorem about Catalan integers, uniform in tau with explicit thresholds. Not a graph theorem; not fixed-band; not uniform in d (d does not occur).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem Erdos993G1.U3.catalanGap_monotone_ratio_award`
- Statement SHA-256: `67fe40be210430be9bca214b0ee022a910d2cb95c5149819fe6e4c9b93d7773f`

```lean
    (∀ τ k : ℕ, 1 ≤ τ → τ ≤ k →
        Gamma τ k * (catalan (k + 2) : ℤ) < Gamma τ (k + 1) * (catalan (k + 1) : ℤ)) ∧
    (∀ τ K : ℕ, 1 ≤ τ → τ ≤ K → 0 < Gamma τ K → ∀ k : ℕ, K ≤ k → 0 < Gamma τ k) ∧
    ((∀ k, 0 ≤ k → 0 < Gamma 1 k) ∧ (∀ k, 2 ≤ k → 0 < Gamma 2 k) ∧
     (∀ k, 3 ≤ k → 0 < Gamma 3 k) ∧ (∀ k, 4 ≤ k → 0 < Gamma 4 k) ∧
     (∀ k, 6 ≤ k → 0 < Gamma 5 k) ∧ (∀ k, 12 ≤ k → 0 < Gamma 6 k) ∧
     (∀ k, 70 ≤ k → 0 < Gamma 7 k)) ∧
    (∀ τ k : ℕ, 8 ≤ τ → τ ≤ k → Gamma τ k < 0)
```

## Quantifiers

- `forall tau` over `domain-tau`
- `forall k` over `domain-k`
- `forall K` over `domain-basek`

## Hypotheses

- `hyp-tau-lb`: 1 <= tau. Load-bearing in three of the four conjuncts (monotone_ratio, gamma_pos_of_base, and each gamma_pos_i); the tau>=8 ceiling conjunct instead carries the strictly stronger 8<=tau. 25 violations of the denominator-free monotonicity occur at k<tau if this hypothesis is dropped.
- `hyp-rank-order`: tau<=k (monotone_ratio, tau>=8 ceiling), or tau<=K<=k (gamma_pos_of_base), or the seven explicit K(tau)<=k instances (gamma_pos_1..7). Load-bearing, not decorative: `hk : tau<=k` (or K<=k) is necessary for Gamma_unfold's domain and for the monotone-ratio proof.

## Conclusion

- `conclusion`: catalanGap_monotone_ratio_award: the explicit four-part conjunction (monotone_ratio) AND (gamma_pos_of_base) AND (gamma_pos_1 AND ... AND gamma_pos_7) AND (gamma_neg_of_ge_eight), exactly as stated in lean_binding.expected_statement.

## Dependencies

- `domain-tau` -> `hyp-tau-lb`
- `domain-tau` -> `hyp-rank-order`
- `domain-k` -> `hyp-rank-order`
- `domain-basek` -> `hyp-rank-order`
- `def-gamma` -> `conclusion`
- `def-catalan` -> `conclusion`
- `domain-tau` -> `conclusion`
- `domain-k` -> `conclusion`
- `domain-basek` -> `conclusion`
- `hyp-tau-lb` -> `conclusion`
- `hyp-rank-order` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)
- `source-originating-project`: `EVIDENCE/originating-source/Main.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
