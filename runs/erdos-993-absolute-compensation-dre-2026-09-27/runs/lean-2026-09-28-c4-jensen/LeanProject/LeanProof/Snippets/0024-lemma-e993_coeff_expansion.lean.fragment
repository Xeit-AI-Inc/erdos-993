lemma e993_coeff_expansion {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) :
    (e993BlockProduct r f).coeff k =
      ∑ t : (∀ i, Fin (r i + 1)),
        if (∑ i, (t i).val) = k then ∏ i, f i (t i).val else 0 := by
  classical
  calc
    (e993BlockProduct r f).coeff k =
        (∏ i, ∑ t : Fin (r i + 1),
          Polynomial.monomial t.val (f i t.val)).coeff k := by
      simp only [e993BlockProduct]
      congr 1
      apply Finset.prod_congr rfl
      intro i hi
      exact (Fin.sum_univ_eq_sum_range
        (fun t => Polynomial.monomial t (f i t)) (r i + 1)).symm
    _ = (∑ t : (∀ i, Fin (r i + 1)),
          ∏ i, Polynomial.monomial (t i).val (f i (t i).val)).coeff k := by
      rw [Fintype.prod_sum]
    _ = _ := by
      simp_rw [e993_prod_monomial Finset.univ]
      simp [Polynomial.finsetSum_coeff, Polynomial.coeff_monomial]
