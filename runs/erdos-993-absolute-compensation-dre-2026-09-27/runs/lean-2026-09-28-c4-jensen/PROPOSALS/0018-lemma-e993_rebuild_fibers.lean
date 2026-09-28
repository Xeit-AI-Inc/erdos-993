lemma e993_rebuild_fibers {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) :
    (Finset.univ : Finset ι).sigma (e993Fiber r S) = S := by
  ext ⟨i, v⟩
  simp [e993Fiber]
