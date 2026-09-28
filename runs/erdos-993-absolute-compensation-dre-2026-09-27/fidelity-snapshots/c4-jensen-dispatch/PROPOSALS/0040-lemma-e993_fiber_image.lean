lemma e993_fiber_image {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ j, Fin (r j))) (i : ι) :
    (e993Fiber r S i).image (Sigma.mk i) = S ∩ e993BlockSet r i := by
  ext ⟨j, v⟩
  constructor
  · intro h
    rcases Finset.mem_image.mp h with ⟨u, hu, heq⟩
    have hS : Sigma.mk i u ∈ S := (Finset.mem_filter.mp hu).2
    rw [← heq]
    exact Finset.mem_inter.mpr ⟨hS, Finset.mem_image.mpr ⟨u, by simp, rfl⟩⟩
  · intro h
    rcases Finset.mem_inter.mp h with ⟨hS, hB⟩
    rcases Finset.mem_image.mp hB with ⟨u, _, heq⟩
    rw [← heq] at hS ⊢
    exact Finset.mem_image.mpr ⟨u, by simp [e993Fiber, hS], rfl⟩
