lemma e993_tail_G4_band (N k : ℕ) (hN : 200 ≤ N)
    (hk : 1 ≤ k) (hband : N + 1 < 4 * k)
    (hguard : 2 * k ≤ N + 2) :
    (1 / 20 : ℝ) ≤ e993TailG 4 N k := by
  let K := (N + 2) / 2
  have hkK : k ≤ K := by dsimp [K]; omega
  have hKlast : K ≤ N - 3 := by dsimp [K]; omega
  have hKbase : (1 / 20 : ℝ) ≤ e993TailG 4 N K := by
    have hpar : ∃ s : ℕ, N = 2 * s ∨ N = 2 * s + 1 := ⟨N / 2, by omega⟩
    obtain ⟨s, hs | hs⟩ := hpar
    · have hs100 : 100 ≤ s := by omega
      have hK : K = s + 1 := by dsimp [K]; omega
      rw [hs, hK]
      exact e993_tail_G4_even_endpoint s hs100
    · have hs100 : 100 ≤ s := by omega
      have hK : K = s + 1 := by dsimp [K]; omega
      rw [hs, hK]
      exact e993_tail_G4_odd_endpoint s hs100
  have hmono : ∀ j, k ≤ j → j ≤ K → e993TailG 4 N j ≤ e993TailG 4 N k := by
    intro j hkj
    induction j, hkj using Nat.le_induction with
    | base => intro _; exact le_rfl
    | succ j hkj ih =>
        intro hjK
        have hjLast : j + 1 ≤ N - 3 := by omega
        have hjBand : N + 1 < 4 * j := by omega
        exact (e993_tail_G4_step N j hN (by omega) hjBand hjLast).trans
          (ih (by omega))
  exact hKbase.trans (hmono K hkK le_rfl)
