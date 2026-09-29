lemma e993_tail_exponent_sum {m : ℕ} (r : Fin m → ℕ) (i : Fin m)
    (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4)
    (k : ℕ) (hk : 1 ≤ k) (hkN : k ≤ e993TailN r) :
    e993BlockExponent (e993TailBlockSize r i)
      (fun b t => (e993TailB (e993TailBlockSize r i b)).coeff t) k =
      ∑ b, e993TailG (e993TailBlockSize r i b) (e993TailN r) k := by
  classical
  have hi : 1 ≤ r i := by
    rcases hr i with h | h | h <;> omega
  unfold e993BlockExponent
  apply Finset.sum_congr rfl
  intro b hb
  have ha : e993TailBlockSize r i b ≤ e993TailN r := by
    have h := Finset.single_le_sum
      (fun j (_hj : j ∈ (Finset.univ : Finset (Option (Fin m)))) =>
        Nat.zero_le (e993TailBlockSize r i j)) (Finset.mem_univ b)
    simpa only [e993_tail_block_sum r i hi] using h
  simp only [e993BlockMass, e993_tail_block_sum r i hi]
  exact e993_tail_singleton_exponent (e993TailBlockSize r i b)
    (e993TailN r) k (e993_tail_block_pos r i hr b) hk hkN
