def e993TailH {m : ℕ} (r : Fin m → ℕ) : ℕ :=
  1 + ∑ i, if r i = 2 then 2 else if r i = 3 then 4 else 7
