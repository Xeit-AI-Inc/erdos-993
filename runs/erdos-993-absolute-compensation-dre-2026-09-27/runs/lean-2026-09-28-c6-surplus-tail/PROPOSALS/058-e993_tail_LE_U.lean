lemma e993_tail_LE_U {m : ℕ} (r : Fin m → ℕ) (i : Fin m)
    (hi : 1 ≤ r i) :
    e993TailLE ((1 + Polynomial.X : Polynomial ℝ) ^ e993TailN r)
      (e993TailU r i) := by
  let s : Finset (Fin m) := Finset.univ.erase i
  have hsum : 1 + (r i - 1) + (∑ j ∈ s, r j) = e993TailN r := by
    have h := Finset.add_sum_erase (Finset.univ : Finset (Fin m)) r (Finset.mem_univ i)
    dsimp [e993TailN, s]
    omega
  have hfirst := e993_tail_LE_mul (e993_tail_LE_B 1)
    (e993_tail_LE_B (r i - 1))
    (e993_tail_NN_pow e993_tail_NN_L (r i - 1)) (e993_tail_NN_B 1)
  have h := e993_tail_LE_mul hfirst (e993_tail_LE_prod r s)
    (e993_tail_NN_pow e993_tail_NN_L (∑ j ∈ s, r j))
    (e993_tail_NN_mul (e993_tail_NN_B 1) (e993_tail_NN_B (r i - 1)))
  intro n
  change ((1 + Polynomial.X : Polynomial ℝ) ^ e993TailN r).coeff n ≤
    (e993TailB 1 * e993TailB (r i - 1) *
      ∏ j ∈ (Finset.univ : Finset (Fin m)).erase i, e993TailB (r j)).coeff n
  rw [← hsum, pow_add, pow_add, pow_one]
  simpa only [s, pow_one] using h n
