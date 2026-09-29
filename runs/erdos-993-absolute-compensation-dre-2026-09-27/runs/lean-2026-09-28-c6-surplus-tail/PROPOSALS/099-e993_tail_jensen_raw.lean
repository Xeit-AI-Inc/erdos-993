lemma e993_tail_jensen_raw {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4) (i : Fin m)
    (k : ℕ) (hk : k ≤ e993TailN r) :
    ((e993TailN r).choose k : ℝ) *
      Real.exp (e993BlockExponent (e993TailBlockSize r i)
        (fun b t => (e993TailB (e993TailBlockSize r i b)).coeff t) k) ≤
      (e993TailU r i).coeff k := by
  have hi : 1 ≤ r i := by
    rcases hr i with h | h | h <;> omega
  have hj := (e993_finite_block_coefficient_jensen
    (e993TailBlockSize r i) (e993_tail_block_pos r i hr)
    (fun b t => (e993TailB (e993TailBlockSize r i b)).coeff t)
    (e993_tail_block_floor r i) k 0
    (by simpa only [e993_tail_block_sum r i hi] using hk)).2.1
  rw [e993_tail_block_product r i hr, e993BlockMass,
    e993_tail_block_sum r i hi] at hj
  exact hj
