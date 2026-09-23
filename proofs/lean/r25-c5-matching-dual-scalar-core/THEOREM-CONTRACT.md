# Theorem Contract: Matching dual scalar core (award group C5-LA1, E993-R25-MATCHING-DUAL-SCALAR-CORE)

- Contract ID: `c5-la1-matching-dual-scalar-core-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `5a6ad44c2c59d95c378c3e60e3b4a37d539dbfb2c8c0df719d663efd1210663c`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Pure arithmetic of the stratified matching-incidence certificate's greedy dual, uniform in (m, d) on the region and in the index, no horizon. The conjunction of: (1) the discriminant factorisation 9d^2+12(m+1)d-12(m+1)^2 = 3*(3d-2(m+1))*(d+2(m+1)) for all integers m,d; (2) the two-sided region characterisation: for m,d >= 0, the discriminant is <= 0 iff 3d <= 2m+2; (3) step (S): for m,d >= 0 with 3d <= 2m+2 and every integer n, (n+1)*((2m-d)+1-n) >= 4*(m+n-(2m-d))*(m-n); (4) PStatement m K n := Nat.descFactorial n (2n-K-1) >= 2^(2n-K-1) * Nat.descFactorial (m+n-K-1) (2n-K-1) holds at every hard index n (K+1 < 2n, n <= m) for all naturals m,K with K <= 2m and 3*(2m-K) <= 2m+2, i.e. both parities of K. SCOPE (mandatory fences): this is the SCALAR core; it does not raise E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY (whose object is the coefficientwise-in-t nonnegativity of N_j); it is not the large-rank theorem and not the Tier 3a schema; no statement about any graph, forest, G1 tuple, tier, FOREST, TREE, TRANSFER or Erdos #993; no SimpleGraph, Delta_k, indepCount occurs; no sharpness claim; no claim that a certificate exists for any particular graph; m and d are numerals (arbitrary naturals/integers as quantified, not fixed constants). Attribution (travels on the award's face): the definitions, the discriminant lemmas, step (S) and both base cases are seat U1's; the induction step (CRITIC-ATTRIBUTED, C-U1-F's toolkit-free proof, PRIMARY) and the induction principle (CRITIC-ATTRIBUTED, C-U1-T's Nat.le_induction scaffold, re-derived here to call C-U1-F's step) are critic-attributed, independently.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem ErdosR25.E1ArithmeticCore.matchingDual_scalarCore_award`
- Statement SHA-256: `2da4ae2dc4bf632aca0a4ef6e31663cabcd31b764362d690b270cebd0f8723b5`

```lean
theorem matchingDual_scalarCore_award : (∀ m d : ℤ, 9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 = 3 * (3 * d - 2 * (m + 1)) * (d + 2 * (m + 1))) ∧ (∀ m d : ℤ, 0 ≤ m → 0 ≤ d → (9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 ≤ 0 ↔ 3 * d ≤ 2 * m + 2)) ∧ (∀ m d n : ℤ, 0 ≤ m → 0 ≤ d → 3 * d ≤ 2 * m + 2 → (n + 1) * ((2 * m - d) + 1 - n) ≥ 4 * (m + n - (2 * m - d)) * (m - n)) ∧ (∀ m K : ℕ, (K : ℤ) ≤ 2 * (m : ℤ) → 3 * (2 * (m : ℤ) - (K : ℤ)) ≤ 2 * (m : ℤ) + 2 → ∀ n : ℕ, K + 1 < 2 * n → n ≤ m → PStatement m K n)
```

## Quantifiers

- None (closed proposition).

## Hypotheses

- None.

## Conclusion

- `conclusion`: theorem matchingDual_scalarCore_award : (∀ m d : ℤ, 9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 = 3 * (3 * d - 2 * (m + 1)) * (d + 2 * (m + 1))) ∧ (∀ m d : ℤ, 0 ≤ m → 0 ≤ d → (9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 ≤ 0 ↔ 3 * d ≤ 2 * m + 2)) ∧ (∀ m d n : ℤ, 0 ≤ m → 0 ≤ d → 3 * d ≤ 2 * m + 2 → (n + 1) * ((2 * m - d) + 1 - n) ≥ 4 * (m + n - (2 * m - d)) * (m - n)) ∧ (∀ m K : ℕ, (K : ℤ) ≤ 2 * (m : ℤ) → 3 * (2 * (m : ℤ) - (K : ℤ)) ≤ 2 * (m : ℤ) + 2 → ∀ n : ℕ, K + 1 < 2 * n → n ≤ m → PStatement m K n)

## Dependencies

- `domain-nat` -> `def-pstatement`
- `domain-int` -> `def-discriminant-factorization`
- `domain-int` -> `def-discriminant-in-k-matches-in-d`
- `domain-int` -> `def-discriminant-nonpos-iff`
- `def-discriminant-factorization` -> `def-discriminant-nonpos-iff`
- `domain-int` -> `def-s-quadratic-nonneg`
- `domain-int` -> `def-s-holds-of-discriminant-nonpos`
- `def-s-quadratic-nonneg` -> `def-s-holds-of-discriminant-nonpos`
- `domain-int` -> `def-s-holds-on-region`
- `def-discriminant-nonpos-iff` -> `def-s-holds-on-region`
- `def-discriminant-in-k-matches-in-d` -> `def-s-holds-on-region`
- `def-s-holds-of-discriminant-nonpos` -> `def-s-holds-on-region`
- `def-pstatement` -> `def-p-base-s1`
- `def-pstatement` -> `def-p-base-s2`
- `def-pstatement` -> `def-p-induction-step-critic`
- `def-s-holds-of-discriminant-nonpos` -> `def-p-induction-step-critic`
- `def-pstatement` -> `def-p-holds-critic`
- `def-discriminant-nonpos-iff` -> `def-p-holds-critic`
- `def-discriminant-in-k-matches-in-d` -> `def-p-holds-critic`
- `def-p-base-s1` -> `def-p-holds-critic`
- `def-p-base-s2` -> `def-p-holds-critic`
- `def-p-induction-step-critic` -> `def-p-holds-critic`
- `def-p-holds-critic` -> `def-p-holds-critic-general`
- `domain-int` -> `conclusion`
- `domain-nat` -> `conclusion`
- `def-discriminant-factorization` -> `conclusion`
- `def-discriminant-nonpos-iff` -> `conclusion`
- `def-s-holds-on-region` -> `conclusion`
- `def-p-holds-critic-general` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)
- `source-originating-critic-u1-f`: `SOURCE/originating-critic-U1-F-CriticStep.lean` (match)
- `source-originating-critic-u1-t`: `SOURCE/originating-critic-U1-T-CriticAll.lean` (match)
- `source-originating-seat-u1`: `SOURCE/originating-seat-U1-Main.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
