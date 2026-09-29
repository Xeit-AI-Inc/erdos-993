# Theorem Contract: Exact guarded tip-surplus tail for every arity2/3/4 profile with at least100 branches

- Contract ID: `e993-guarded-tip-surplus-tail-m100-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `open`
- Contract SHA-256: `01cdacd246c3f41d099eba4e7b88ecd72c8442ca20f1cf7ff4940a0f0771699d`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every natural m>=100, every function r from Fin m to the natural numbers with r_i in {2,3,4}, every i in Fin m, and every natural k with 1<=k and 2k<=N+2, put N=sum_j r_j, h=1+sum_j w(r_j), where w(2)=2,w(3)=4,w(4)=7. In the real polynomial ring let L=1+X, B_a=L^a+X, C=B_1 product_j B_(r_j), U_i=B_1 B_(r_i-1) product_(j!=i) B_(r_j), and E=X L^N. Then (h+1)U_i[k]C[k]+(k+1)(h-k+1)(E[k]C[k]-E[k+1]C[k-1]) is strictly positive. Brackets mean actual monomial coefficients with zero extension. The subtraction h-k+1 in the expression is real subtraction; k>=1 guards the natural coefficient index k-1. All repeated and mixed arity profiles and both parity endpoints are included. There is no actual-first-descent, selector, assumed ULC, main-product LR or numerical-prefix hypothesis. No assertion is made for m<100, for the endpoint deletion, for a full shifted-comparison minor, for selected payment, or for arbitrary trees.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem e993_guarded_tip_surplus_tail`
- Statement SHA-256: `4dd33af0ac00b5ff9b9421bf9910116355b29019fa3652755c220c0e6da2cd82`

```lean
theorem e993_guarded_tip_surplus_tail
    (m : ℕ) (hm : 100 ≤ m) (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4)
    (i : Fin m) (k : ℕ) (hk : 1 ≤ k) (hguard : 2 * k ≤ e993TailN r + 2) :
    0 < ((e993TailH r : ℝ) + 1) * (e993TailU r i).coeff k * (e993TailC r).coeff k +
      ((k : ℝ) + 1) * ((e993TailH r : ℝ) - (k : ℝ) + 1) *
        ((e993TailE r).coeff k * (e993TailC r).coeff k -
          (e993TailE r).coeff (k + 1) * (e993TailC r).coeff (k - 1))
```

## Quantifiers

- `forall m` over `domain-natural`
- `forall r` over `domain-profile`
- `forall i` over `domain-index`
- `forall k` over `domain-natural`

## Hypotheses

- `hyp-tail`: 100<=m.
- `hyp-arity`: Every r_i equals2,3 or4.
- `hyp-rank`: 1<=k and2k<=N+2.

## Conclusion

- `conclusion`: theorem e993_guarded_tip_surplus_tail
    (m : ℕ) (hm : 100 ≤ m) (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4)
    (i : Fin m) (k : ℕ) (hk : 1 ≤ k) (hguard : 2 * k ≤ e993TailN r + 2) :
    0 < ((e993TailH r : ℝ) + 1) * (e993TailU r i).coeff k * (e993TailC r).coeff k +
      ((k : ℝ) + 1) * ((e993TailH r : ℝ) - (k : ℝ) + 1) *
        ((e993TailE r).coeff k * (e993TailC r).coeff k -
          (e993TailE r).coeff (k + 1) * (e993TailC r).coeff (k - 1))

## Dependencies

- `domain-natural` -> `domain-profile`
- `domain-natural` -> `def-e993tailb`
- `domain-profile` -> `def-e993tailb`
- `domain-polynomial` -> `def-e993tailb`
- `domain-natural` -> `def-e993tailn`
- `domain-profile` -> `def-e993tailn`
- `domain-polynomial` -> `def-e993tailn`
- `domain-natural` -> `def-e993tailh`
- `domain-profile` -> `def-e993tailh`
- `domain-polynomial` -> `def-e993tailh`
- `domain-natural` -> `def-e993tailc`
- `domain-profile` -> `def-e993tailc`
- `domain-polynomial` -> `def-e993tailc`
- `domain-natural` -> `def-e993tailu`
- `domain-profile` -> `def-e993tailu`
- `domain-polynomial` -> `def-e993tailu`
- `domain-natural` -> `def-e993taile`
- `domain-profile` -> `def-e993taile`
- `domain-polynomial` -> `def-e993taile`
- `domain-natural` -> `hyp-tail`
- `domain-profile` -> `hyp-arity`
- `domain-natural` -> `hyp-rank`
- `def-e993tailn` -> `hyp-rank`
- `def-e993tailb` -> `conclusion`
- `def-e993tailn` -> `conclusion`
- `def-e993tailh` -> `conclusion`
- `def-e993tailc` -> `conclusion`
- `def-e993tailu` -> `conclusion`
- `def-e993taile` -> `conclusion`
- `hyp-tail` -> `conclusion`
- `hyp-arity` -> `conclusion`
- `hyp-rank` -> `conclusion`
- `domain-natural` -> `domain-index`
- `domain-index` -> `def-e993tailu`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-c6-synthesis-md`: `SOURCE/C6-SYNTHESIS.md` (match)
- `source-center-verification-report-json`: `SOURCE/CENTER-VERIFICATION-REPORT.json` (match)
- `source-center-verified-source-lean`: `SOURCE/CENTER-VERIFIED-SOURCE.lean` (match)
- `source-encoding-spec-lean`: `SOURCE/ENCODING-SPEC.lean` (match)
- `source-expected-statement-txt`: `SOURCE/EXPECTED-STATEMENT.txt` (match)
- `source-intended-statement-txt`: `SOURCE/INTENDED-STATEMENT.txt` (match)
- `source-jensen-verification-report-json`: `SOURCE/JENSEN-VERIFICATION-REPORT.json` (match)
- `source-jensen-verified-source-lean`: `SOURCE/JENSEN-VERIFIED-SOURCE.lean` (match)
- `source-preliminary-independent-review-md`: `SOURCE/PRELIMINARY-INDEPENDENT-REVIEW.md` (match)
- `source-proof-dag-md`: `SOURCE/PROOF-DAG.md` (match)
- `source-ratio-verification-report-json`: `SOURCE/RATIO-VERIFICATION-REPORT.json` (match)
- `source-ratio-verified-source-lean`: `SOURCE/RATIO-VERIFIED-SOURCE.lean` (match)
- `source-reviewed-proof-candidate-md`: `SOURCE/REVIEWED-PROOF-CANDIDATE.md` (match)

## Validation Notes

- Errors: none
- Warnings: `formulation_truth_unverified`
