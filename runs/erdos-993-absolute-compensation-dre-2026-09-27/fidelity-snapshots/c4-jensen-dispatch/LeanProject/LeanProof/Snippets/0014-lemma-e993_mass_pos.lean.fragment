lemma e993_mass_pos {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (k : ℕ) (hk : k ≤ ∑ i, r i) :
    0 < e993BlockMass r k := by
  unfold e993BlockMass
  exact_mod_cast Nat.choose_pos hk
