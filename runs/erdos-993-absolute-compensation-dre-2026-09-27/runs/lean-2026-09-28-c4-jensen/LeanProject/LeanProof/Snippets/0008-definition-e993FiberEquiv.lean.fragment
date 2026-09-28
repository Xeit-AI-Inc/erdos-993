noncomputable
def e993FiberEquiv {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) :
    Finset (Σ i, Fin (r i)) ≃ (∀ i, Finset (Fin (r i))) where
  toFun := e993Fiber r
  invFun := (Finset.univ : Finset ι).sigma
  left_inv := by
    intro S
    ext ⟨i, v⟩
    simp [e993Fiber]
  right_inv := by
    intro A
    funext i
    ext v
    simp [e993Fiber]
