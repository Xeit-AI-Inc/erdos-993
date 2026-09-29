lemma e993_tail_G4_formula (N k : ℕ) (hN : 8 ≤ N)
    (hk : 1 ≤ k) (hkN : k ≤ N - 3) :
    e993TailG 4 N k =
      (8 : ℝ) / 9 *
        ((k : ℝ) * ((N : ℝ) - k) * ((N : ℝ) - k - 1) *
          ((N : ℝ) - k - 2)) /
        ((N : ℝ) * ((N : ℝ) - 1) * ((N : ℝ) - 2) * ((N : ℝ) - 3)) := by
  have hc : (N.choose k : ℝ) ≠ 0 := by
    exact_mod_cast (Nat.choose_pos (by omega : k ≤ N)).ne'
  have hden : (N : ℝ) * ((N : ℝ) - 1) * ((N : ℝ) - 2) * ((N : ℝ) - 3) ≠ 0 := by
    have hNR : (8 : ℝ) ≤ N := by exact_mod_cast hN
    apply ne_of_gt
    apply mul_pos
    apply mul_pos
    apply mul_pos
    · nlinarith
    · nlinarith
    · nlinarith
    · nlinarith
  have hnat := e993_tail_choose_four N k hN hk hkN
  have hreal : (N.choose k : ℝ) * k * ((N : ℝ) - k) *
      ((N : ℝ) - k - 1) * ((N : ℝ) - k - 2) =
        ((N - 4).choose (k - 1) : ℝ) * N * ((N : ℝ) - 1) *
          ((N : ℝ) - 2) * ((N : ℝ) - 3) := by
    have h := congrArg (fun x : ℕ => (x : ℝ)) hnat
    push_cast at h
    rw [Nat.cast_sub (by omega : 1 ≤ N - k),
      Nat.cast_sub (by omega : 2 ≤ N - k)] at h
    rw [Nat.cast_sub (by omega : k ≤ N)] at h
    rw [Nat.cast_sub (by omega : 1 ≤ N),
      Nat.cast_sub (by omega : 2 ≤ N),
      Nat.cast_sub (by omega : 3 ≤ N)] at h
    push_cast at h
    convert h using 1 <;> ring
  have hratio : ((N - 4).choose (k - 1) : ℝ) / (N.choose k : ℝ) =
      ((k : ℝ) * ((N : ℝ) - k) * ((N : ℝ) - k - 1) *
        ((N : ℝ) - k - 2)) /
      ((N : ℝ) * ((N : ℝ) - 1) * ((N : ℝ) - 2) * ((N : ℝ) - 3)) := by
    apply (div_eq_div_iff hc hden).2
    nlinarith [hreal]
  unfold e993TailG
  norm_num
  simp only [mul_div_assoc, hratio]
