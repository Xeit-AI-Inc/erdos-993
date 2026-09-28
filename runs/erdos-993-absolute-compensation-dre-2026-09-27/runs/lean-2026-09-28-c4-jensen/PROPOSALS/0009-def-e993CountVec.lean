noncomputable
def e993CountVec {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) : ∀ i, Fin (r i + 1) :=
  fun i => ⟨e993BlockCount r S i, by
    have hle :
        ((Finset.univ : Finset (Fin (r i))).filter
          fun v => Sigma.mk i v ∈ S).card ≤ r i := by
      simpa using (Finset.card_le_card
        (Finset.filter_subset (fun v : Fin (r i) => Sigma.mk i v ∈ S) Finset.univ))
    exact Nat.lt_succ_of_le hle⟩
