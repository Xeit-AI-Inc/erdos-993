noncomputable
def e993TailE {m : ℕ} (r : Fin m → ℕ) : Polynomial ℝ :=
  Polynomial.X * (1 + Polynomial.X)^e993TailN r
