noncomputable
def e993CountFiberEquiv {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (t : ι → ℕ) :
    {S : Finset (Σ i, Fin (r i)) // ∀ i, e993BlockCount r S i = t i} ≃
      (∀ i, {T : Finset (Fin (r i)) // T.card = t i}) where
  toFun := fun S i => ⟨e993Fiber r S.val i, S.property i⟩
  invFun := fun A => ⟨(Finset.univ : Finset ι).sigma (fun i => (A i).val), by
    intro i
    have h : e993Fiber r ((Finset.univ : Finset ι).sigma (fun i => (A i).val)) i =
        (A i).val := by
      ext v
      simp [e993Fiber]
    change (e993Fiber r ((Finset.univ : Finset ι).sigma (fun i => (A i).val)) i).card = t i
    rw [h]
    exact (A i).property⟩
  left_inv := by
    intro S
    apply Subtype.ext
    ext ⟨i, v⟩
    simp [e993Fiber]
  right_inv := by
    intro A
    funext i
    apply Subtype.ext
    ext v
    simp [e993Fiber]
