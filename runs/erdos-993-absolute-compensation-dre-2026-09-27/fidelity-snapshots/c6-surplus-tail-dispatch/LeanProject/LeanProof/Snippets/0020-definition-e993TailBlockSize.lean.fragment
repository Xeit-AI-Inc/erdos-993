def e993TailBlockSize {m : ℕ} (r : Fin m → ℕ) (i : Fin m) : Option (Fin m) → ℕ
  | none => 1
  | some j => if j = i then r i - 1 else r j
