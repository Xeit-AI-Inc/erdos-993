lemma e993_tail_Q_coeff {m : ℕ} (r : Fin m → ℕ) (k : ℕ) :
    (e993TailQ r).coeff k =
      ∑ t ∈ (Finset.univ : Finset (Fin m)).powerset,
        if t.card ≤ k then
          ((∑ j ∈ (Finset.univ : Finset (Fin m)) \ t, r j).choose
            (k - t.card) : ℝ) else 0 := by
  simpa only [e993TailQ] using
    e993_tail_center_coeff (Finset.univ : Finset (Fin m)) r k
