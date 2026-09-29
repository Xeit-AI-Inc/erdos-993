lemma e993_sum_counts {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) :
    ∑ i, e993BlockCount r S i = S.card := by
  calc
    ∑ i, e993BlockCount r S i = ∑ i, (e993Fiber r S i).card := by rfl
    _ = ((Finset.univ : Finset ι).sigma (e993Fiber r S)).card := by
      rw [Finset.card_sigma]
    _ = S.card := by rw [e993_rebuild_fibers]
