lemma e993_card_subsets {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (k : ℕ) :
    ((Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k).card =
      (∑ i, r i).choose k := by
  rw [Finset.card_powersetCard, Finset.card_univ, e993_card_ambient]
