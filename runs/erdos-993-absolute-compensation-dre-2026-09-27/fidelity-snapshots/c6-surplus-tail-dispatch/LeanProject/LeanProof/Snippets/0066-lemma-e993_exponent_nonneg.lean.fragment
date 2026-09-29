lemma e993_exponent_nonneg {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ)
    (hf : ∀ i t, t ≤ r i → ((r i).choose t : ℝ) ≤ f i t)
    (k : ℕ) (hk : k ≤ ∑ i, r i) :
    0 ≤ e993BlockExponent r f k := by
  unfold e993BlockExponent
  apply Finset.sum_nonneg
  intro i hi
  apply Finset.sum_nonneg
  intro t ht
  have htr : t ≤ r i := by simpa using (Finset.mem_range.mp ht)
  have hc : (0 : ℝ) < (r i).choose t := by exact_mod_cast Nat.choose_pos htr
  have hf' := hf i t htr
  apply mul_nonneg
  · split_ifs
    · apply div_nonneg
      · positivity
      · exact le_of_lt (e993_mass_pos r k hk)
    · exact le_refl 0
  · apply div_nonneg
    · nlinarith
    · linarith
