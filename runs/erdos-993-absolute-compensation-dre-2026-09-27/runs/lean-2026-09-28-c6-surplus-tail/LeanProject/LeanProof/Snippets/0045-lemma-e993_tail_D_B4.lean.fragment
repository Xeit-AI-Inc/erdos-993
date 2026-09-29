lemma e993_tail_D_B4 : e993TailD 4 (e993TailB 4) =
    7 + 6 * Polynomial.X + 12 * Polynomial.X ^ 2 + 4 * Polynomial.X ^ 3 := by
  norm_num [e993TailD, e993TailB, Polynomial.derivative_pow,
    e993_tail_C2, e993_tail_C3, e993_tail_C4]
  ring
