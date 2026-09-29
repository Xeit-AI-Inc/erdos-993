lemma e993_tail_exponent_lower {m : ℕ} (r : Fin m → ℕ)
    (hm : 100 ≤ m) (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4)
    (i : Fin m) (k : ℕ) (hk : 1 ≤ k)
    (hband : e993TailN r + 1 < 4 * k)
    (hguard : 2 * k ≤ e993TailN r + 2) :
    (((m - 1 : ℕ) : ℝ) / 20) ≤
      e993BlockExponent (e993TailBlockSize r i)
        (fun b t => (e993TailB (e993TailBlockSize r i b)).coeff t) k := by
  classical
  have hN : 200 ≤ e993TailN r := by
    have h := e993_tail_arity_lower r hr
    omega
  have hkN : k ≤ e993TailN r := by omega
  rw [e993_tail_exponent_sum r i hr k hk hkN, Fintype.sum_option]
  have hsplit := Finset.add_sum_erase (Finset.univ : Finset (Fin m))
    (fun j => e993TailG (e993TailBlockSize r i (some j)) (e993TailN r) k)
    (Finset.mem_univ i)
  have hroot : 0 ≤ e993TailG (e993TailBlockSize r i none) (e993TailN r) k :=
    e993_tail_G_nonneg _ _ _
  have hmark : 0 ≤ e993TailG (e993TailBlockSize r i (some i)) (e993TailN r) k :=
    e993_tail_G_nonneg _ _ _
  have hother : (∑ j ∈ (Finset.univ : Finset (Fin m)).erase i, (1 / 20 : ℝ)) ≤
      ∑ j ∈ (Finset.univ : Finset (Fin m)).erase i,
        e993TailG (e993TailBlockSize r i (some j)) (e993TailN r) k := by
    apply Finset.sum_le_sum
    intro j hj
    have hji : j ≠ i := (Finset.mem_erase.mp hj).1
    have ha : r j = 2 ∨ r j = 3 ∨ r j = 4 := hr j
    simpa only [e993TailBlockSize, if_neg hji] using
      e993_tail_G_all (r j) (e993TailN r) k ha hN hk hband hguard
  have hcard : ((∑ j ∈ (Finset.univ : Finset (Fin m)).erase i, (1 / 20 : ℝ))) =
      (((m - 1 : ℕ) : ℝ) / 20) := by
    simp [div_eq_mul_inv]
  rw [← hsplit]
  rw [hcard] at hother
  nlinarith
