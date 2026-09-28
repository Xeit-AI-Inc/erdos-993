lemma e993_card_block_fiber (n t : ℕ) :
    Fintype.card {T : Finset (Fin n) // T.card = t} = n.choose t := by
  classical
  rw [Fintype.card_subtype]
  rw [← Finset.powerset_univ (α := Fin n)]
  rw [← Finset.powersetCard_eq_filter]
  simp
