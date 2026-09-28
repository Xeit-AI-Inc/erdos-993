# Theorem Contract: Exact finite center-subset coefficient expansion

- Contract ID: `e993-center-subset-coefficient-expansion-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `open`
- Contract SHA-256: `6dffda6906c5394bdfaf16987700f9de7fbca424c086adc5831524494cf1c967`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every index type with decidable equality, every finite set s of indices, every function r from the index type to the natural numbers, and every natural k, define H(X) as the product over i in s of ((1+X)^(r(i))+X) in polynomials with natural coefficients. Then the coefficient of X^k in H is the sum over all subsets t of s of the following natural number: if the cardinality of t is at most k, take binomial(sum of r(i) over i in s minus t, k minus the cardinality of t); otherwise take zero. Binomial coefficients vanish when the lower argument exceeds the upper argument. The empty index set, zero exponents, repeated exponent values at distinct indices, and all natural k are included. No degree bound by the sum of the exponents is assumed.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem e993_center_subset_coeff`
- Statement SHA-256: `ea8fdc2956d3e883f671c69777d903114a69003ab1a370a33c02a08a199882e6`

```lean
theorem e993_center_subset_coeff {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (r : ι → ℕ) (k : ℕ) :
    (e993CenterProduct s r).coeff k =
      ∑ t ∈ s.powerset,
        if t.card ≤ k then (∑ i ∈ s \ t, r i).choose (k - t.card) else 0
```

## Quantifiers

- `forall ι` over `domain-index`
- `forall s` over `domain-finset`
- `forall r` over `domain-exponents`
- `forall k` over `domain-natural`

## Hypotheses

- `hyp-equality`: A DecidableEq instance on the arbitrary index type permits finite-set difference; no numerical, positivity, nonempty-set, or degree hypothesis is assumed.

## Conclusion

- `conclusion`: The k coefficient of e993CenterProduct s r equals the sum over t in s.powerset of if t.card<=k then Nat.choose (sum_(i in s minus t) r(i)) (k-t.card) else 0. The cardinality guard is explicit; arbitrary natural k and exponents are included.

## Dependencies

- `domain-index` -> `domain-finset`
- `domain-index` -> `domain-exponents`
- `domain-natural` -> `domain-exponents`
- `domain-finset` -> `def-product`
- `domain-exponents` -> `def-product`
- `domain-polynomial` -> `def-product`
- `domain-index` -> `hyp-equality`
- `def-product` -> `conclusion`
- `domain-natural` -> `conclusion`
- `hyp-equality` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-c3-center-expansion-boundary-check-json`: `SOURCE/C3-CENTER-EXPANSION-BOUNDARY-CHECK.json` (match)
- `source-c3-center-expansion-boundary-check-py`: `SOURCE/C3-CENTER-EXPANSION-BOUNDARY-CHECK.py` (match)
- `source-center-proof-lead-md`: `SOURCE/CENTER-PROOF-LEAD.md` (match)
- `source-intended-statement-txt`: `SOURCE/INTENDED-STATEMENT.txt` (match)

## Validation Notes

- Errors: none
- Warnings: `formulation_truth_unverified`
