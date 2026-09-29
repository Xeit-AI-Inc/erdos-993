lemma e993_tail_G_all (a N k : ℕ) (ha : a = 2 ∨ a = 3 ∨ a = 4)
    (hN : 200 ≤ N) (hk : 1 ≤ k) (hband : N + 1 < 4 * k)
    (hguard : 2 * k ≤ N + 2) :
    (1 / 20 : ℝ) ≤ e993TailG a N k := by
  have h4 := e993_tail_G4_band N k hN hk hband hguard
  rcases ha with h | h | h
  · subst a
    exact h4.trans ((e993_tail_G3_ge_G4 N k hN hk hband hguard).trans
      (e993_tail_G2_ge_G3 N k hN hk hband hguard))
  · subst a
    exact h4.trans (e993_tail_G3_ge_G4 N k hN hk hband hguard)
  · subst a
    exact h4
