lemma e993_tail_subset_cross (N R s k : ℕ)
    (hk : 1 ≤ k) (hRN : R ≤ N) (hRs : R ≤ 4 * s)
    (hlow : 4 * k ≤ N + 1) :
    (N.choose (k - 1) : ℝ) *
        (if s ≤ k then ((N - R).choose (k - s) : ℝ) else 0) ≥
      (N.choose k : ℝ) *
        (if s ≤ k - 1 then ((N - R).choose (k - 1 - s) : ℝ) else 0) := by
  by_cases hsk : s ≤ k - 1
  · have hskt : s ≤ k := by omega
    simp only [if_pos hskt, if_pos hsk]
    let n := N - R
    let t := k - s
    have ht : 1 ≤ t := by dsimp [t]; omega
    have htn : t ≤ n := by
      dsimp [t, n]
      omega
    have hkN : k ≤ N := by omega
    have he : (0 : ℝ) < (N.choose (k - 1) : ℝ) := by
      exact_mod_cast Nat.choose_pos (by omega : k - 1 ≤ N)
    have hq : (0 : ℝ) < (n.choose (t - 1) : ℝ) := by
      exact_mod_cast Nat.choose_pos (by omega : t - 1 ≤ n)
    have hkt : (0 : ℝ) < (k : ℝ) * (t : ℝ) := by
      have hkR : (0 : ℝ) < k := by exact_mod_cast hk
      have htR : (0 : ℝ) < t := by exact_mod_cast ht
      exact mul_pos hkR htR
    have hNchoose := e993_tail_choose_adjacent N k hk hkN
    have hnchoose := e993_tail_choose_adjacent n t ht htn
    have hsign : (0 : ℝ) ≤ (s : ℝ) * ((N : ℝ) + 1) - (k : ℝ) * (R : ℝ) := by
      have hRsr : (R : ℝ) ≤ 4 * (s : ℝ) := by exact_mod_cast hRs
      have hlr : 4 * (k : ℝ) ≤ (N : ℝ) + 1 := by exact_mod_cast hlow
      have hmul := mul_le_mul_of_nonneg_right hRsr (show (0 : ℝ) ≤ k by positivity)
      have hmul2 := mul_le_mul_of_nonneg_left hlr (show (0 : ℝ) ≤ s by positivity)
      nlinarith [hmul, hmul2]
    have hcross :
        ((N.choose (k - 1) : ℝ) * (n.choose t : ℝ) -
          (N.choose k : ℝ) * (n.choose (t - 1) : ℝ)) *
            (k : ℝ) * (t : ℝ) =
          (N.choose (k - 1) : ℝ) * (n.choose (t - 1) : ℝ) *
            ((s : ℝ) * ((N : ℝ) + 1) - (k : ℝ) * (R : ℝ)) := by
      have hnR : (n : ℝ) = (N : ℝ) - R := by
        dsimp [n]
        rw [Nat.cast_sub hRN]
      have hts : (t : ℝ) = (k : ℝ) - s := by
        dsimp [t]
        rw [Nat.cast_sub hskt]
      have hratioexpr : (k : ℝ) * ((n : ℝ) + 1 - (t : ℝ)) -
          (t : ℝ) * ((N : ℝ) + 1 - (k : ℝ)) =
          (s : ℝ) * ((N : ℝ) + 1) - (k : ℝ) * (R : ℝ) := by
        rw [hnR, hts]
        ring
      calc
        _ = ((n.choose t : ℝ) * (t : ℝ)) *
              ((N.choose (k - 1) : ℝ) * (k : ℝ)) -
            ((N.choose k : ℝ) * (k : ℝ)) *
              ((n.choose (t - 1) : ℝ) * (t : ℝ)) := by ring
        _ = ((n.choose (t - 1) : ℝ) * ((n : ℝ) + 1 - (t : ℝ))) *
              ((N.choose (k - 1) : ℝ) * (k : ℝ)) -
            ((N.choose (k - 1) : ℝ) * ((N : ℝ) + 1 - (k : ℝ))) *
              ((n.choose (t - 1) : ℝ) * (t : ℝ)) := by
          rw [hnchoose, hNchoose]
        _ = (N.choose (k - 1) : ℝ) * (n.choose (t - 1) : ℝ) *
              ((k : ℝ) * ((n : ℝ) + 1 - (t : ℝ)) -
                (t : ℝ) * ((N : ℝ) + 1 - (k : ℝ))) := by ring
        _ = _ := by rw [hratioexpr]
    have hnonneg : 0 ≤ (N.choose (k - 1) : ℝ) *
        (n.choose (t - 1) : ℝ) *
          ((s : ℝ) * ((N : ℝ) + 1) - (k : ℝ) * (R : ℝ)) := by positivity
    have hgoal : 0 ≤ (N.choose (k - 1) : ℝ) * (n.choose t : ℝ) -
        (N.choose k : ℝ) * (n.choose (t - 1) : ℝ) := by
      nlinarith [hcross, hnonneg]
    have hprev : k - 1 - s = t - 1 := by dsimp [t]; omega
    dsimp [n, t] at hgoal ⊢
    rw [hprev]
    linarith
  · by_cases hskt : s ≤ k
    · have hprev : ¬ s ≤ k - 1 := hsk
      simp only [if_pos hskt, if_neg hprev, mul_zero]
      positivity
    · have hprev : ¬ s ≤ k - 1 := by omega
      simp only [if_neg hskt, if_neg hprev, mul_zero]
      exact le_refl _
