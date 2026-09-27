import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition e993BinomialCoeff 6d31063a905679fe877d3767d1d444e38d561af1e81a6435aaf500dfa0b79ab5
def e993BinomialCoeff (u : ℕ) (k : ℤ) : ℤ :=
  if k < 0 then 0 else (u.choose k.toNat : ℤ)
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition e993BlockCoeff 47e26ec893da2936a9775aceab8722bc8fc22aa283e2eeed0be175d01abf2918
def e993BlockCoeff (t u : ℕ) (j : ℤ) : ℤ :=
  e993BinomialCoeff u (j - (t : ℤ)) + 2 * e993BinomialCoeff u (j - (t : ℤ) - 1)
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN lemma e993_choose_rise 54a892f7706720a27724c05b410391ce572d1ea4cf73904285f98046ae79117b
lemma e993_choose_rise (u k : ℕ) (hk : 2 * k + 1 ≤ u) :
    u.choose k ≤ u.choose (k + 1) := by
  have hku : k ≤ u := by omega
  have hfac : (k + 1 : ℤ) ≤ (u - k : ℕ) := by omega
  have heq : (u.choose (k + 1) : ℤ) * (k + 1) =
      (u.choose k : ℤ) * (u - k : ℕ) := by
    exact_mod_cast Nat.choose_succ_right_eq u k
  have hpos : (0 : ℤ) < k + 1 := by omega
  have hcpos : (0 : ℤ) < (u.choose k : ℤ) := by exact_mod_cast Nat.choose_pos hku
  have hmul := mul_le_mul_of_nonneg_left hfac (le_of_lt hcpos)
  by_contra h
  have hlt : (u.choose (k + 1) : ℤ) < (u.choose k : ℤ) := by exact_mod_cast Nat.lt_of_not_ge h
  nlinarith
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN lemma e993_choose_strict 83a2297ada129a523fafdc4d272ca08aeeea29262e7fab1725e3b046b0dcf161
lemma e993_choose_strict (u k : ℕ) (hk : 2 * k + 1 < u) :
    u.choose k < u.choose (k + 1) := by
  have hku : k ≤ u := by omega
  have hfac : (k + 1 : ℤ) < (u - k : ℕ) := by omega
  have heq : (u.choose (k + 1) : ℤ) * (k + 1) =
      (u.choose k : ℤ) * (u - k : ℕ) := by
    exact_mod_cast Nat.choose_succ_right_eq u k
  have hpos : (0 : ℤ) < k + 1 := by omega
  have hcpos : (0 : ℤ) < (u.choose k : ℤ) := by exact_mod_cast Nat.choose_pos hku
  by_contra h
  have hle : (u.choose (k + 1) : ℤ) ≤ (u.choose k : ℤ) := by exact_mod_cast Nat.le_of_not_gt h
  nlinarith
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN lemma e993_choose_fall c44d6fa27d3036e4a5bd660da20807d4b4026c9b115e94f5213b34cbc518cc89
lemma e993_choose_fall (u k : ℕ) (hk : u ≤ 2 * k + 1) :
    u.choose (k + 1) ≤ u.choose k := by
  by_cases hku : k ≤ u
  · have hfac : (u - k : ℕ) ≤ k + 1 := by omega
    have heq : (u.choose (k + 1) : ℤ) * (k + 1) =
        (u.choose k : ℤ) * (u - k : ℕ) := by
      exact_mod_cast Nat.choose_succ_right_eq u k
    have hpos : (0 : ℤ) < k + 1 := by omega
    have hcpos : (0 : ℤ) ≤ (u.choose k : ℤ) := by positivity
    have hmul := mul_le_mul_of_nonneg_left (show (u - k : ℕ) ≤ k + 1 from hfac) (Nat.zero_le (u.choose k))
    by_contra h
    have hlt : (u.choose k : ℤ) < (u.choose (k + 1) : ℤ) := by exact_mod_cast Nat.lt_of_not_ge h
    nlinarith
  · have h : u < k + 1 := by omega
    simp [Nat.choose_eq_zero_of_lt h]
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN lemma e993_coeff_nonneg d0ce62663c0d0d7ee73b3a386c7d000ad5b5d4ffa6ca7cfa8c97244d9f62652e
lemma e993_coeff_nonneg (u : ℕ) (k : ℤ) : 0 ≤ e993BinomialCoeff u k := by
  unfold e993BinomialCoeff
  split_ifs <;> positivity
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN theorem e993_binomial_block_signs 2b151b62af6ec5f8d411c5d461bfca6409cb289b84c4baa84a224bca559e969d
theorem e993_binomial_block_signs (t u : ℕ) (j : ℤ) :
    (j ≤ (t : ℤ) + ((u / 2 : ℕ) : ℤ) →
      e993BlockCoeff t u j ≤ e993BlockCoeff t u (j + 1)) ∧
    ((t : ℤ) + ((u / 2 : ℕ) : ℤ) + 1 ≤ j →
      e993BlockCoeff t u (j + 1) ≤ e993BlockCoeff t u j) ∧
    (0 ≤ j → j ≤ ((u / 2 : ℕ) : ℤ) →
      e993BlockCoeff 0 u j < e993BlockCoeff 0 u (j + 1)) := by
  constructor
  · intro hr
    by_cases hneg : j - (t : ℤ) < 0
    · by_cases hsmall : j - (t : ℤ) ≤ -2
      · have hb0 : e993BlockCoeff t u j = 0 := by
          have ha : j - (t : ℤ) < 0 := by omega
          have hb : j - (t : ℤ) - 1 < 0 := by omega
          simp [e993BlockCoeff, e993BinomialCoeff, ha, hb]
        have hb1 : e993BlockCoeff t u (j + 1) = 0 := by
          have ha : j + 1 - (t : ℤ) < 0 := by omega
          have hb : j + 1 - (t : ℤ) - 1 < 0 := by omega
          simp [e993BlockCoeff, e993BinomialCoeff, ha, hb]
        rw [hb0, hb1]
      · have hminus : j - (t : ℤ) = -1 := by omega
        have hb0 : e993BlockCoeff t u j = 0 := by
          have hb : j - (t : ℤ) - 1 = -2 := by omega
          unfold e993BlockCoeff
          rw [hb, hminus]
          norm_num [e993BinomialCoeff] <;> split_ifs <;> omega
        have hb1 : e993BlockCoeff t u (j + 1) = 1 := by
          have ha : j + 1 - (t : ℤ) = 0 := by omega
          have hb : j + 1 - (t : ℤ) - 1 = -1 := by omega
          unfold e993BlockCoeff
          rw [hb, ha]
          norm_num [e993BinomialCoeff] <;> split_ifs <;> omega
        rw [hb0, hb1]
        omega
    · have hnonneg : 0 ≤ j - (t : ℤ) := by omega
      let n : ℕ := (j - (t : ℤ)).toNat
      have hj : j - (t : ℤ) = (n : ℤ) := by omega
      have hnle : n ≤ u / 2 := by omega
      by_cases hnzero : n = 0
      · have hzero : j - (t : ℤ) = 0 := by omega
        have hb0 : e993BlockCoeff t u j = 1 := by
          unfold e993BlockCoeff
          have hprev : j - (t : ℤ) - 1 = -1 := by omega
          rw [hprev, hzero]
          norm_num [e993BinomialCoeff] <;> split_ifs <;> omega
        have hb1 : e993BlockCoeff t u (j + 1) = (u : ℤ) + 2 := by
          unfold e993BlockCoeff
          have hnext : j + 1 - (t : ℤ) = 1 := by omega
          have hback : j + 1 - (t : ℤ) - 1 = 0 := by omega
          rw [hback, hnext]
          norm_num [e993BinomialCoeff, Nat.choose_one_right]
        rw [hb0, hb1]
        omega
      · have hnpos : 0 < n := by omega
        have hprev : j - (t : ℤ) - 1 = ((n - 1 : ℕ) : ℤ) := by omega
        have hnext : j + 1 - (t : ℤ) = ((n + 1 : ℕ) : ℤ) := by omega
        have hback : j + 1 - (t : ℤ) - 1 = (n : ℤ) := by omega
        have hb0 : e993BlockCoeff t u j =
            (u.choose n : ℤ) + 2 * (u.choose (n - 1) : ℤ) := by
          unfold e993BlockCoeff
          rw [hprev, hj]
          norm_num [e993BinomialCoeff] <;> split_ifs <;> omega
        have hb1 : e993BlockCoeff t u (j + 1) =
            (u.choose (n + 1) : ℤ) + 2 * (u.choose n : ℤ) := by
          unfold e993BlockCoeff
          rw [hback, hnext]
          norm_num [e993BinomialCoeff] <;> split_ifs <;> omega
        have hsecond : u.choose (n - 1) < u.choose n := by
          have hbound : 2 * (n - 1) + 1 < u := by omega
          have hs := e993_choose_strict u (n - 1) hbound
          have hnsub : n - 1 + 1 = n := by omega
          simpa [hnsub] using hs
        have hsecondz : (u.choose (n - 1) : ℤ) < (u.choose n : ℤ) := by
          exact_mod_cast hsecond
        by_cases hfirst : 2 * n + 1 ≤ u
        · have hfirstz : (u.choose n : ℤ) ≤ (u.choose (n + 1) : ℤ) := by
            exact_mod_cast e993_choose_rise u n hfirst
          rw [hb0, hb1]
          omega
        · have hu : u = 2 * n := by omega
          have hindex : u - (n - 1) = n + 1 := by omega
          have hsymm := Nat.choose_symm (show n - 1 ≤ u by omega)
          rw [hindex] at hsymm
          have hsymmz : (u.choose (n + 1) : ℤ) = (u.choose (n - 1) : ℤ) := by
            exact_mod_cast hsymm
          rw [hb0, hb1]
          omega
  constructor
  · intro hf
    let n : ℕ := (j - (t : ℤ)).toNat
    have hj : j - (t : ℤ) = (n : ℤ) := by omega
    have hnlow : u / 2 + 1 ≤ n := by omega
    have hnpos : 0 < n := by omega
    have hprev : j - (t : ℤ) - 1 = ((n - 1 : ℕ) : ℤ) := by omega
    have hnext : j + 1 - (t : ℤ) = ((n + 1 : ℕ) : ℤ) := by omega
    have hback : j + 1 - (t : ℤ) - 1 = (n : ℤ) := by omega
    have hb0 : e993BlockCoeff t u j =
        (u.choose n : ℤ) + 2 * (u.choose (n - 1) : ℤ) := by
      unfold e993BlockCoeff
      rw [hprev, hj]
      norm_num [e993BinomialCoeff] <;> split_ifs <;> omega
    have hb1 : e993BlockCoeff t u (j + 1) =
        (u.choose (n + 1) : ℤ) + 2 * (u.choose n : ℤ) := by
      unfold e993BlockCoeff
      rw [hback, hnext]
      norm_num [e993BinomialCoeff] <;> split_ifs <;> omega
    have hfirst : u.choose (n + 1) ≤ u.choose n :=
      e993_choose_fall u n (by omega)
    have hsecond : u.choose n ≤ u.choose (n - 1) := by
      have hs := e993_choose_fall u (n - 1) (by omega)
      have hnsub : n - 1 + 1 = n := by omega
      simpa [hnsub] using hs
    have hfirstz : (u.choose (n + 1) : ℤ) ≤ (u.choose n : ℤ) := by
      exact_mod_cast hfirst
    have hsecondz : (u.choose n : ℤ) ≤ (u.choose (n - 1) : ℤ) := by
      exact_mod_cast hsecond
    rw [hb0, hb1]
    omega
  · intro hlo hhi
    let n : ℕ := (j - ((0 : ℕ) : ℤ)).toNat
    have hj : j - ((0 : ℕ) : ℤ) = (n : ℤ) := by omega
    have hnle : n ≤ u / 2 := by omega
    by_cases hnzero : n = 0
    · have hzero : j - ((0 : ℕ) : ℤ) = 0 := by omega
      have hb0 : e993BlockCoeff 0 u j = 1 := by
        unfold e993BlockCoeff
        have hprev : j - ((0 : ℕ) : ℤ) - 1 = -1 := by omega
        rw [hprev, hzero]
        norm_num [e993BinomialCoeff] <;> split_ifs <;> omega
      have hb1 : e993BlockCoeff 0 u (j + 1) = (u : ℤ) + 2 := by
        unfold e993BlockCoeff
        have hnext : j + 1 - ((0 : ℕ) : ℤ) = 1 := by omega
        have hback : j + 1 - ((0 : ℕ) : ℤ) - 1 = 0 := by omega
        rw [hback, hnext]
        norm_num [e993BinomialCoeff, Nat.choose_one_right]
      rw [hb0, hb1]
      omega
    · have hnpos : 0 < n := by omega
      have hprev : j - ((0 : ℕ) : ℤ) - 1 = ((n - 1 : ℕ) : ℤ) := by omega
      have hnext : j + 1 - ((0 : ℕ) : ℤ) = ((n + 1 : ℕ) : ℤ) := by omega
      have hback : j + 1 - ((0 : ℕ) : ℤ) - 1 = (n : ℤ) := by omega
      have hb0 : e993BlockCoeff 0 u j =
          (u.choose n : ℤ) + 2 * (u.choose (n - 1) : ℤ) := by
        unfold e993BlockCoeff
        rw [hprev, hj]
        norm_num [e993BinomialCoeff] <;> split_ifs <;> omega
      have hb1 : e993BlockCoeff 0 u (j + 1) =
          (u.choose (n + 1) : ℤ) + 2 * (u.choose n : ℤ) := by
        unfold e993BlockCoeff
        rw [hback, hnext]
        norm_num [e993BinomialCoeff] <;> split_ifs <;> omega
      have hsecond : u.choose (n - 1) < u.choose n := by
        have hbound : 2 * (n - 1) + 1 < u := by omega
        have hs := e993_choose_strict u (n - 1) hbound
        have hnsub : n - 1 + 1 = n := by omega
        simpa [hnsub] using hs
      have hsecondz : (u.choose (n - 1) : ℤ) < (u.choose n : ℤ) := by
        exact_mod_cast hsecond
      by_cases hfirst : 2 * n + 1 ≤ u
      · have hfirstz : (u.choose n : ℤ) ≤ (u.choose (n + 1) : ℤ) := by
          exact_mod_cast e993_choose_rise u n hfirst
        rw [hb0, hb1]
        omega
      · have hu : u = 2 * n := by omega
        have hindex : u - (n - 1) = n + 1 := by omega
        have hsymm := Nat.choose_symm (show n - 1 ≤ u by omega)
        rw [hindex] at hsymm
        have hsymmz : (u.choose (n + 1) : ℤ) = (u.choose (n - 1) : ℤ) := by
          exact_mod_cast hsymm
        rw [hb0, hb1]
        omega
-- VERITYOS ENTRY 7 END

