lemma e993_tail_E_minor_low {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4)
    (k : ℕ) (hk : 1 ≤ k) (hlow : 4 * k ≤ e993TailN r + 1) :
    0 ≤ (e993TailE r).coeff k * (e993TailC r).coeff k -
      (e993TailE r).coeff (k + 1) * (e993TailC r).coeff (k - 1) := by
  let N := e993TailN r
  have hQrise := e993_tail_Q_normalized_rise r hr k hk hlow
  by_cases hk1 : k = 1
  · subst k
    have hC1 := e993_tail_C_coeff_succ m r 0
    have hC0 := e993_tail_C_coeff_zero m r
    have hQ0 : 0 ≤ (e993TailQ r).coeff 0 := by
      dsimp [e993TailQ]
      exact e993_tail_NN_prod r Finset.univ 0
    rw [e993_tail_E_coeff r 1 (by omega), e993_tail_E_coeff_succ,
      hC1, hC0]
    norm_num at hQrise ⊢
    nlinarith
  · have hk2 : 2 ≤ k := by omega
    have hCk := e993_tail_C_coeff_succ m r (k - 1)
    have hCprev := e993_tail_C_coeff_succ m r (k - 2)
    have h1 : k - 1 + 1 = k := by omega
    have h2 : k - 2 + 1 = k - 1 := by omega
    rw [h1] at hCk
    rw [h2] at hCprev
    have hQprev := e993_tail_Q_predecessor_bracket r hr k hk2 hlow
    rw [e993_tail_E_coeff r k hk, e993_tail_E_coeff_succ,
      hCk, hCprev]
    nlinarith [hQrise, hQprev]
