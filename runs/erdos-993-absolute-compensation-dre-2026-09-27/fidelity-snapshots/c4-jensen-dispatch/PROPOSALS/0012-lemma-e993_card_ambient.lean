lemma e993_card_ambient {ι : Type*} [Fintype ι]
    (r : ι → ℕ) : Fintype.card (Σ i, Fin (r i)) = ∑ i, r i := by
  simp [Fintype.card_sigma]
