lemma e993_count_eq_fiber_card {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) (i : ι) :
    e993BlockCount r S i = (e993Fiber r S i).card := rfl
