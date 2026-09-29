lemma e993_tail_NN_pow {p : Polynomial ℝ} (hp : e993TailNN p) (m : ℕ) :
    e993TailNN (p ^ m) := by
  induction m with
  | zero => simpa using e993_tail_NN_one
  | succ m ih => simpa [pow_succ] using e993_tail_NN_mul ih hp
