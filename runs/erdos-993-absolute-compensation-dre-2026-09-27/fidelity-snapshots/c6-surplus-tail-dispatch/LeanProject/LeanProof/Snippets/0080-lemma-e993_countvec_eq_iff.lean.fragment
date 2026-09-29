lemma e993_countvec_eq_iff {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i)))
    (t : ∀ i, Fin (r i + 1)) :
    e993CountVec r S = t ↔
      ∀ i, e993BlockCount r S i = (t i).val := by
  constructor
  · intro h i
    exact congrArg Fin.val (congrFun h i)
  · intro h
    funext i
    exact Fin.ext (h i)
