lemma e993_prod_monomial {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (t : ι → ℕ) (a : ι → ℝ) :
    (∏ i ∈ s, Polynomial.monomial (t i) (a i)) =
      Polynomial.monomial (∑ i ∈ s, t i) (∏ i ∈ s, a i) := by
  induction s using Finset.induction with
  | empty => simp
  | @insert i s hi ih =>
      simp [Finset.prod_insert hi, Finset.sum_insert hi, ih,
        Polynomial.monomial_mul_monomial]
