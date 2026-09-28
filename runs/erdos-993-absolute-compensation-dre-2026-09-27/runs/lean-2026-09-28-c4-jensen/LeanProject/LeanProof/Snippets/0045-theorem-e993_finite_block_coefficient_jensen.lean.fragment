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
        e993BlockMass r k * Real.exp (e993BlockExponent r f k) := by
  classical
  let Ω := (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k
  let z := fun S : Finset (Σ i, Fin (r i)) =>
    ∑ i, Real.log (f i (e993BlockCount r S i) /
      ((r i).choose (e993BlockCount r S i) : ℝ))
  let g := fun S : Finset (Σ i, Fin (r i)) =>
    ∑ i, 2 * (f i (e993BlockCount r S i) -
      ((r i).choose (e993BlockCount r S i) : ℝ)) /
      (f i (e993BlockCount r S i) +
      ((r i).choose (e993BlockCount r S i) : ℝ))
  have hm : 0 < e993BlockMass r k := e993_mass_pos r k hk
  have hΩcard : (Ω.card : ℝ) = e993BlockMass r k := by
    simp [Ω, e993BlockMass]
  have hΩ : Ω.Nonempty := Finset.card_pos.mp (by
    have h : 0 < Ω.card := by
      rw [e993_card_subsets]
      exact Nat.choose_pos hk
    exact h)
  have hlog : e993BlockExponent r f k ≤
      (∑ S ∈ Ω, z S) / e993BlockMass r k := by
    rw [e993_exponent_eq_average]
    apply div_le_div_of_nonneg_right _ (le_of_lt hm)
    apply Finset.sum_le_sum
    intro S hS
    exact e993_pointwise_log r f hf S
  have hjensen : Real.exp ((∑ S ∈ Ω, z S) / e993BlockMass r k) ≤
      (e993BlockProduct r f).coeff k / e993BlockMass r k := by
    have hj := e993_finite_jensen Ω hΩ z
    rw [hΩcard] at hj
    have hnum : (∑ S ∈ Ω, Real.exp (z S)) =
        (e993BlockProduct r f).coeff k := by
      calc
        (∑ S ∈ Ω, Real.exp (z S)) =
            ∑ S ∈ Ω, ∏ i, f i (e993BlockCount r S i) /
              ((r i).choose (e993BlockCount r S i) : ℝ) := by
          apply Finset.sum_congr rfl
          intro S hS
          exact e993_exp_log_product r f hf S
        _ = (e993BlockProduct r f).coeff k :=
          (e993_coeff_actual r f k).symm
    rwa [hnum] at hj
  have hbound : e993BlockMass r k * Real.exp (e993BlockExponent r f k) ≤
      (e993BlockProduct r f).coeff k := by
    have h := (Real.exp_le_exp.mpr hlog).trans hjensen
    simpa only [mul_comm] using (le_div_iff₀ hm).mp h
  refine ⟨e993_coefficient_average r f k, hbound, ?_⟩
  exact mul_le_mul_of_nonneg_left
    (e993_taylor_le d (e993_exponent_nonneg r f hf k hk)) (le_of_lt hm)
