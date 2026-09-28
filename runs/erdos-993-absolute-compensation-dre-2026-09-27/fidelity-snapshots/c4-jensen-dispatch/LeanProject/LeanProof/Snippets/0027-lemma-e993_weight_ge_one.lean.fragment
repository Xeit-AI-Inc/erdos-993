lemma e993_weight_ge_one {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ)
    (hf : ∀ i t, t ≤ r i → ((r i).choose t : ℝ) ≤ f i t)
    (i : ι) (t : ℕ) (ht : t ≤ r i) :
    1 ≤ f i t / ((r i).choose t : ℝ) := by
  have hc : (0 : ℝ) < (r i).choose t := by exact_mod_cast Nat.choose_pos ht
  exact (le_div_iff₀ hc).2 (by simpa using hf i t ht)
