lemma e993_tail_block_pos {m : ℕ} (r : Fin m → ℕ) (i : Fin m)
    (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4) :
    ∀ b, 0 < e993TailBlockSize r i b := by
  intro b
  cases b with
  | none => simp [e993TailBlockSize]
  | some j =>
      by_cases hji : j = i
      · subst j
        rcases hr i with h | h | h <;> simp [e993TailBlockSize, h]
      · rcases hr j with h | h | h <;> simp [e993TailBlockSize, hji, h]
