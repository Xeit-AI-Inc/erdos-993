lemma e993_fiber_rebuild {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (A : ∀ i, Finset (Fin (r i))) (i : ι) :
    e993Fiber r ((Finset.univ : Finset ι).sigma A) i = A i := by
  ext v
  simp [e993Fiber]
