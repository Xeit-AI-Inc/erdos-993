lemma e993_tail_payment_from_U
    (m : ℕ) (hm : 100 ≤ m) (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4)
    (i : Fin m) (k : ℕ) (hk : 1 ≤ k)
    (hguard : 2 * k ≤ e993TailN r + 2)
    (hU : ((e993TailN r).choose k : ℝ) * ((m : ℝ) + 2) <
      (e993TailU r i).coeff k) :
    0 < ((e993TailH r : ℝ) + 1) * (e993TailU r i).coeff k *
        (e993TailC r).coeff k +
      ((k : ℝ) + 1) * ((e993TailH r : ℝ) - (k : ℝ) + 1) *
        ((e993TailE r).coeff k * (e993TailC r).coeff k -
          (e993TailE r).coeff (k + 1) * (e993TailC r).coeff (k - 1)) := by
  let N := e993TailN r
  let H := e993TailH r
  let e : ℝ := (N.choose (k - 1) : ℝ)
  let c : ℝ := (N.choose k : ℝ)
  let U : ℝ := (e993TailU r i).coeff k
  let A : ℝ := (e993TailC r).coeff k
  let M : ℝ := (e993TailE r).coeff k * A -
    (e993TailE r).coeff (k + 1) * (e993TailC r).coeff (k - 1)
  let g : ℝ := ((k : ℝ) + 1) * ((H : ℝ) - (k : ℝ) + 1)
  have hNlo : 2 * m ≤ N := e993_tail_arity_lower r hr
  have hNhi : N ≤ 4 * m := e993_tail_arity_upper r hr
  have hH : N + 1 ≤ H := e993_tail_order_lower r hr
  have hkN : k ≤ N := e993_tail_guard_le_N r hm hr k hguard
  have he : 0 < e := by
    dsimp [e, N]
    exact_mod_cast Nat.choose_pos (by omega : k - 1 ≤ e993TailN r)
  have hc : 0 < c := by
    dsimp [c, N]
    exact_mod_cast Nat.choose_pos hkN
  have hA : 0 < A := e993_tail_C_coeff_pos r k (by omega)
  have hkR : (0 : ℝ) < k := by exact_mod_cast hk
  have hHreal : (N : ℝ) + 1 ≤ H := by exact_mod_cast hH
  have hkNR : (k : ℝ) ≤ N := by exact_mod_cast hkN
  have hcurv : 0 < (H : ℝ) - (k : ℝ) + 1 := by nlinarith
  have hHpos : 0 < (H : ℝ) + 1 := by nlinarith
  have hg : 0 < g := mul_pos (by positivity) hcurv
  have hchoose : c * (k : ℝ) = e * ((N : ℝ) + 1 - (k : ℝ)) :=
    e993_tail_choose_adjacent N k hk hkN
  have hnum : (k : ℝ) * ((k : ℝ) + 1) <
      2 * ((m : ℝ) + 2) * ((N : ℝ) + 1 - (k : ℝ)) :=
    e993_tail_numeric_payment m N k hm hNlo hNhi hk hguard
  have hnumE := mul_lt_mul_of_pos_left hnum he
  have hchooseM : 2 * ((m : ℝ) + 2) * (c * (k : ℝ)) =
      2 * ((m : ℝ) + 2) * (e * ((N : ℝ) + 1 - (k : ℝ))) :=
    congrArg (2 * ((m : ℝ) + 2) * ·) hchoose
  have hbaseK : (k : ℝ) * (e * ((k : ℝ) + 1)) <
      (k : ℝ) * (2 * c * ((m : ℝ) + 2)) := by
    nlinarith [hnumE, hchooseM]
  have hbase : e * ((k : ℝ) + 1) < 2 * c * ((m : ℝ) + 2) := by
    nlinarith [hbaseK]
  have hscale : g * e < 2 * ((H : ℝ) + 1) * c * ((m : ℝ) + 2) := by
    calc
      g * e = ((H : ℝ) - (k : ℝ) + 1) * (e * ((k : ℝ) + 1)) := by dsimp [g]; ring
      _ < ((H : ℝ) - (k : ℝ) + 1) * (2 * c * ((m : ℝ) + 2)) :=
        mul_lt_mul_of_pos_left hbase hcurv
      _ ≤ ((H : ℝ) + 1) * (2 * c * ((m : ℝ) + 2)) := by
        apply mul_le_mul_of_nonneg_right _ (by positivity)
        linarith
      _ = 2 * ((H : ℝ) + 1) * c * ((m : ℝ) + 2) := by ring
  have hminor : -(e * A) / 2 < M := e993_tail_minor_half r hr k hk hkN
  have hUterm := mul_lt_mul_of_pos_right hU (mul_pos hHpos hA)
  have hMterm := mul_lt_mul_of_pos_left hminor hg
  have hpay := mul_lt_mul_of_pos_right hscale hA
  dsimp [N, H, e, c, U, A, M, g] at *
  nlinarith [hUterm, hMterm, hpay]
