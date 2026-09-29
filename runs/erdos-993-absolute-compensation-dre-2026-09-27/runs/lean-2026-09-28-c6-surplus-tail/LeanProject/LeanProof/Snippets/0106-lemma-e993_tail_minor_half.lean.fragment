lemma e993_tail_minor_half {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4)
    (k : ℕ) (hk : 1 ≤ k) (hkN : k ≤ e993TailN r) :
    -(((e993TailN r).choose (k - 1) : ℝ) * (e993TailC r).coeff k) / 2 <
      (e993TailE r).coeff k * (e993TailC r).coeff k -
        (e993TailE r).coeff (k + 1) * (e993TailC r).coeff (k - 1) := by
  let N := e993TailN r
  let e : ℝ := (N.choose (k - 1) : ℝ)
  let c : ℝ := (N.choose k : ℝ)
  let A : ℝ := (e993TailC r).coeff k
  let B : ℝ := (e993TailC r).coeff (k - 1)
  have he : 0 < e := by
    dsimp [e, N]
    exact_mod_cast Nat.choose_pos (by omega : k - 1 ≤ e993TailN r)
  have hB : 0 < B := by
    dsimp [B]
    apply e993_tail_C_coeff_pos
    omega
  have hkR : (0 : ℝ) < k := by exact_mod_cast hk
  have hchoose : c * (k : ℝ) = e * ((N : ℝ) + 1 - (k : ℝ)) :=
    e993_tail_choose_adjacent N k hk hkN
  have hratio : 2 * ((N : ℝ) + 2 - (k : ℝ)) * B ≤ 3 * (k : ℝ) * A :=
    e993_tail_C_ratio r hr k hk
  have hmul : 0 ≤ e * (3 * (k : ℝ) * A - 2 * ((N : ℝ) + 2 - (k : ℝ)) * B) :=
    mul_nonneg (le_of_lt he) (sub_nonneg.mpr hratio)
  have hchooseB : c * (k : ℝ) * B =
      e * ((N : ℝ) + 1 - (k : ℝ)) * B := congrArg (· * B) hchoose
  have hstep : 0 < (k : ℝ) * (3 * e * A - 2 * c * B) := by
    nlinarith [mul_pos he hB]
  have hhalf : 0 < 3 * e * A - 2 * c * B := by
    nlinarith [hstep]
  rw [e993_tail_E_coeff r k hk, e993_tail_E_coeff_succ]
  dsimp [e, c, A, B, N] at hhalf ⊢
  nlinarith
