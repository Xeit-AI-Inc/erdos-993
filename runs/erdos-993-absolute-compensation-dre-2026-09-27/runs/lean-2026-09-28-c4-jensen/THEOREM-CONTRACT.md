# Theorem Contract: Full actual finite-subset coefficient expectation and Jensen-Taylor bound

- Contract ID: `e993-finite-block-coefficient-jensen-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `open`
- Contract SHA-256: `8a2b91971f0ca4348b7155b6b5d99a5d6a2147e5cbd18f39ec60250169aa0ff9`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite index type I, including the empty type, positive natural block sizes r_i, and real coefficients f_i(t) satisfying f_i(t) >= binomial(r_i,t) for every natural t <= r_i, put M=sum_i r_i, F_i(X)=sum_(t=0..r_i) f_i(t) X^t, and H=product_i F_i. For every natural k <= M let S be uniform among the actual k-element subsets of the labeled disjoint union V=Sigma_(i:I) Fin(r_i), and K_i its number of elements in block i. Put c=binomial(M,k), w_i(t)=f_i(t)/binomial(r_i,t), and y=sum_i sum_(t=0..r_i) p_i(t) * 2(f_i(t)-binomial(r_i,t))/(f_i(t)+binomial(r_i,t)), where p_i(t)=binomial(r_i,t)*binomial(M-r_i,k-t)/c if t<=k, and zero otherwise. Then, for every natural d, H[k]/c equals the actual uniform-subset average of product_i w_i(K_i), H[k] >= c*exp(y), and c*exp(y) >= c*sum_(a=0..d) y^a/a!. Binomial coefficients above their upper support are zero; the guard t<=k precedes natural subtraction. All three conclusions are required. Empty I, k=0, k=M, repeated sizes, blocks of size one, and d=0 are included. No independence of the conditioned block counts is assumed. No graph, deletion, first-descent, selector, or payment conclusion is asserted.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem e993_finite_block_coefficient_jensen`
- Statement SHA-256: `c044c8911cc997346d0295442122d98ae5a222aa0a50a6800214f62d51a3f396`

```lean
theorem e993_finite_block_coefficient_jensen
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (hr : ∀ i, 0 < r i)
    (f : ι → ℕ → ℝ)
    (hf : ∀ i t, t ≤ r i → ((r i).choose t : ℝ) ≤ f i t)
    (k d : ℕ) (hk : k ≤ ∑ i, r i) :
    (e993BlockProduct r f).coeff k / e993BlockMass r k =
        e993SubsetAverage r f k ∧
    e993BlockMass r k * Real.exp (e993BlockExponent r f k) ≤
        (e993BlockProduct r f).coeff k ∧
    e993BlockMass r k * e993ExpTaylor d (e993BlockExponent r f k) ≤
        e993BlockMass r k * Real.exp (e993BlockExponent r f k)
```

## Quantifiers

- `forall I` over `domain-index`
- `forall r` over `domain-r`
- `forall f` over `domain-f`
- `forall k` over `domain-natural`
- `forall d` over `domain-natural`

## Hypotheses

- `hyp-positive-blocks`: For every i, 0<r_i; vacuous for empty I.
- `hyp-binomial-floor`: For every i and natural t<=r_i, real choose(r_i,t)<=f_i(t).
- `hyp-rank`: Natural k<=sum_i r_i. Natural d is arbitrary.

## Conclusion

- `conclusion`: theorem e993_finite_block_coefficient_jensen
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (hr : ∀ i, 0 < r i)
    (f : ι → ℕ → ℝ)
    (hf : ∀ i t, t ≤ r i → ((r i).choose t : ℝ) ≤ f i t)
    (k d : ℕ) (hk : k ≤ ∑ i, r i) :
    (e993BlockProduct r f).coeff k / e993BlockMass r k =
        e993SubsetAverage r f k ∧
    e993BlockMass r k * Real.exp (e993BlockExponent r f k) ≤
        (e993BlockProduct r f).coeff k ∧
    e993BlockMass r k * e993ExpTaylor d (e993BlockExponent r f k) ≤
        e993BlockMass r k * Real.exp (e993BlockExponent r f k)

## Dependencies

- `domain-index` -> `domain-r`
- `domain-natural` -> `domain-r`
- `domain-index` -> `domain-f`
- `domain-natural` -> `domain-f`
- `domain-r` -> `domain-subsets`
- `domain-index` -> `def-e993blockproduct`
- `domain-r` -> `def-e993blockproduct`
- `domain-f` -> `def-e993blockproduct`
- `domain-subsets` -> `def-e993blockproduct`
- `domain-index` -> `def-e993blockmass`
- `domain-r` -> `def-e993blockmass`
- `domain-f` -> `def-e993blockmass`
- `domain-subsets` -> `def-e993blockmass`
- `domain-index` -> `def-e993blockcount`
- `domain-r` -> `def-e993blockcount`
- `domain-f` -> `def-e993blockcount`
- `domain-subsets` -> `def-e993blockcount`
- `domain-index` -> `def-e993subsetaverage`
- `domain-r` -> `def-e993subsetaverage`
- `domain-f` -> `def-e993subsetaverage`
- `domain-subsets` -> `def-e993subsetaverage`
- `domain-index` -> `def-e993blockexponent`
- `domain-r` -> `def-e993blockexponent`
- `domain-f` -> `def-e993blockexponent`
- `domain-subsets` -> `def-e993blockexponent`
- `domain-index` -> `def-e993exptaylor`
- `domain-r` -> `def-e993exptaylor`
- `domain-f` -> `def-e993exptaylor`
- `domain-subsets` -> `def-e993exptaylor`
- `domain-r` -> `hyp-positive-blocks`
- `domain-r` -> `hyp-binomial-floor`
- `domain-f` -> `hyp-binomial-floor`
- `domain-r` -> `hyp-rank`
- `domain-natural` -> `hyp-rank`
- `def-e993blockproduct` -> `conclusion`
- `def-e993blockmass` -> `conclusion`
- `def-e993blockcount` -> `conclusion`
- `def-e993subsetaverage` -> `conclusion`
- `def-e993blockexponent` -> `conclusion`
- `def-e993exptaylor` -> `conclusion`
- `hyp-positive-blocks` -> `conclusion`
- `hyp-binomial-floor` -> `conclusion`
- `hyp-rank` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-boundary-check-json`: `SOURCE/BOUNDARY-CHECK.json` (match)
- `source-boundary-check-py`: `SOURCE/BOUNDARY-CHECK.py` (match)
- `source-encoding-spec-lean`: `SOURCE/ENCODING-SPEC.lean` (match)
- `source-expected-statement-txt`: `SOURCE/EXPECTED-STATEMENT.txt` (match)
- `source-independent-proof-review-md`: `SOURCE/INDEPENDENT-PROOF-REVIEW.md` (match)
- `source-intended-statement-txt`: `SOURCE/INTENDED-STATEMENT.txt` (match)
- `source-proof-lead-md`: `SOURCE/PROOF-LEAD.md` (match)

## Validation Notes

- Errors: none
- Warnings: `formulation_truth_unverified`
