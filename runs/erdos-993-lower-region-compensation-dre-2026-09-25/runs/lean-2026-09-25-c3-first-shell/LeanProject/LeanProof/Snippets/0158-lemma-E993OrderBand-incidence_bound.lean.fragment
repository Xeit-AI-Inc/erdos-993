namespace E993OrderBand

open Classical

lemma incidence_bound {α β : Type*} [DecidableEq α] [DecidableEq β]
    (s : Finset α) (t : Finset β) (r : α → β → Prop)
    [∀ a b, Decidable (r a b)]
    (sm : Finset α) (tg : Finset β) (k m : ℕ)
    (hsm : sm ⊆ s) (htg : tg ⊆ t)
    (hlow : ∀ b ∈ s,
      k + (if b ∈ sm then 1 else 0) ≤ (t.bipartiteAbove r b).card)
    (hup : ∀ a ∈ t,
      (s.bipartiteBelow r a).card + k + (if a ∈ tg then 1 else 0) ≤ m) :
    k * s.card + sm.card + k * t.card + tg.card ≤ m * t.card := by
  classical
  have hleft := Finset.sum_le_sum (s := s) hlow
  have hright := Finset.sum_le_sum (s := t) hup
  have hdouble := Finset.sum_card_bipartiteAbove_eq_sum_card_bipartiteBelow
    (r := r) (s := s) (t := t)
  have hsm_sum : (∑ b ∈ s, if b ∈ sm then (1 : ℕ) else 0) = sm.card :=
    (Finset.card_eq_sum_ite hsm).symm
  have htg_sum : (∑ a ∈ t, if a ∈ tg then (1 : ℕ) else 0) = tg.card :=
    (Finset.card_eq_sum_ite htg).symm
  simp only [Finset.sum_add_distrib, Finset.sum_const, nsmul_eq_mul] at hleft hright
  simp only [hsm_sum, htg_sum] at hleft hright
  rw [hdouble] at hleft
  nlinarith

end E993OrderBand
