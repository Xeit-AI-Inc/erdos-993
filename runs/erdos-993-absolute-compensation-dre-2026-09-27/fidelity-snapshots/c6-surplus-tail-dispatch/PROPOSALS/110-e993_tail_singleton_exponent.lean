lemma e993_tail_singleton_exponent (a N k : ℕ) (ha : 1 ≤ a)
    (hk : 1 ≤ k) (hkN : k ≤ N) :
    (∑ t ∈ Finset.range (a + 1),
      (if t ≤ k then
        (a.choose t : ℝ) * ((N - a).choose (k - t) : ℝ) /
          (N.choose k : ℝ)
       else 0) *
        (2 * ((e993TailB a).coeff t - (a.choose t : ℝ)) /
          ((e993TailB a).coeff t + (a.choose t : ℝ)))) =
      e993TailG a N k := by
  classical
  rw [Finset.sum_eq_single 1]
  · have hmem : 1 ∈ Finset.range (a + 1) := by simp; omega
    have hchoose : (a.choose 1 : ℝ) = (a : ℝ) := by simp
    have hcoeff : (e993TailB a).coeff 1 = (a : ℝ) + 1 := by
      rw [e993_tail_B_coeff]
      simp
    have hden : (N.choose k : ℝ) ≠ 0 := by
      exact_mod_cast (Nat.choose_pos hkN).ne'
    have hden2 : (2 * (a : ℝ) + 1) ≠ 0 := by positivity
    simp only [if_pos hk, Nat.sub_self, hchoose, hcoeff]
    unfold e993TailG
    field_simp
    ring
  · intro t ht hne
    rw [e993_tail_B_coeff]
    simp [hne]
  · intro hnot
    exact False.elim (hnot (by simp; omega))
