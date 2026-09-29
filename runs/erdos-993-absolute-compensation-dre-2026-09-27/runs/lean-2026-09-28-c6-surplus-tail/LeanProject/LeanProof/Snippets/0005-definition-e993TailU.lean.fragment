noncomputable
def e993TailU {m : ℕ} (r : Fin m → ℕ) (i : Fin m) : Polynomial ℝ :=
  e993TailB 1 * e993TailB (r i - 1) *
    ∏ j ∈ (Finset.univ : Finset (Fin m)).erase i, e993TailB (r j)
