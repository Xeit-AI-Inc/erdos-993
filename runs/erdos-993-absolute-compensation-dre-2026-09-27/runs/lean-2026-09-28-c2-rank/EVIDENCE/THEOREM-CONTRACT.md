# Theorem Contract: Arity 2-4 parent polynomial rank bound at every strict descent

- Contract ID: `e993-any-strict-descent-rank-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `open`
- Contract SHA-256: `3d75ed4dd1d160b2652f1a221d779a2b84ddd9c81aad62b122c2df4a65a209e3`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite list rs of natural numbers whose entries are each 2, 3 or 4, let N be the sum of rs and define P(X)=(1+2X)*product_{r in rs}((1+X)^r+X)+X*(1+X)^(N+1) in rational polynomials. For every natural k, if the coefficient of X^(k+1) in P is strictly less than the coefficient of X^k in P, then 2*N<=5*k. Coefficients have their standard zero extension and the empty list is permitted.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem e993_rank_any_strict_descent`
- Statement SHA-256: `d04776272178640e26f7a28a630330b1a17eb3dd95b86cd0faf670fbb5def75f`

```lean
theorem e993_rank_any_strict_descent (rs : List ℕ)
    (hr : ∀ r ∈ rs, r = 2 ∨ r = 3 ∨ r = 4) (k : ℕ)
    (hdrop : (e993RankParent rs).coeff (k + 1) < (e993RankParent rs).coeff k) :
    2 * rs.sum ≤ 5 * k
```

## Quantifiers

- `forall rs` over `domain-list`
- `forall k` over `domain-natural`

## Hypotheses

- `hyp-arity`: Every r in rs is equal to 2, 3 or 4.
- `hyp-drop`: (e993RankParent rs).coeff (k+1) < (e993RankParent rs).coeff k for the given natural k. No first-descent minimality is assumed.

## Conclusion

- `conclusion`: 2 * rs.sum <= 5 * k as an inequality of natural numbers. No log-concavity, extra positivity, cutoff, or graph interpretation is assumed.

## Dependencies

- `domain-natural` -> `domain-list`
- `domain-list` -> `def-parent`
- `domain-polynomial` -> `def-parent`
- `domain-list` -> `hyp-arity`
- `def-parent` -> `hyp-drop`
- `domain-natural` -> `hyp-drop`
- `hyp-arity` -> `conclusion`
- `hyp-drop` -> `conclusion`
- `domain-natural` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-intended-statement`: `SOURCE/INTENDED-STATEMENT.txt` (match)
- `source-rank-proof-lead`: `SOURCE/RANK-PROOF-LEAD.md` (match)

## Validation Notes

- Errors: none
- Warnings: `formulation_truth_unverified`
