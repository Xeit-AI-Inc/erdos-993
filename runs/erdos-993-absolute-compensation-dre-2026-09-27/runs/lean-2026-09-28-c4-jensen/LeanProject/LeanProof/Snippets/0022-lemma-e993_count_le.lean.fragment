lemma e993_count_le {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) (i : ι) :
    e993BlockCount r S i ≤ r i := by
  rw [e993_count_eq_fiber_card]
  simpa [e993Fiber] using (Finset.card_le_card
    (Finset.filter_subset (fun v : Fin (r i) => Sigma.mk i v ∈ S) Finset.univ))
