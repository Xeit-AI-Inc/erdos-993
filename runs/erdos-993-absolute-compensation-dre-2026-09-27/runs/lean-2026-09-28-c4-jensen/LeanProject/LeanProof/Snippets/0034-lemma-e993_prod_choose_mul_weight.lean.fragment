lemma e993_prod_choose_mul_weight {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ)
    (t : ∀ i, Fin (r i + 1)) :
    (∏ i, ((r i).choose (t i).val : ℝ)) *
      (∏ i, f i (t i).val / ((r i).choose (t i).val : ℝ)) =
      ∏ i, f i (t i).val := by
  rw [← Finset.prod_mul_distrib]
  apply Finset.prod_congr rfl
  intro i hi
  have hc : (((r i).choose (t i).val : ℕ) : ℝ) ≠ 0 := by
    exact_mod_cast (Nat.choose_pos (Nat.le_of_lt_succ (t i).isLt)).ne'
  field_simp
