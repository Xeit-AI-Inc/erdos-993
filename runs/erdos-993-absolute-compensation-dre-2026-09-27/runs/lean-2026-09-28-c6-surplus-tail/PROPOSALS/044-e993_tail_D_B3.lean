lemma e993_tail_D_B3 : e993TailD 3 (e993TailB 3) =
    6 + 2 * Polynomial.X + 3 * Polynomial.X ^ 2 := by
  norm_num [e993TailD, e993TailB, Polynomial.derivative_pow,
    e993_tail_C2, e993_tail_C3, e993_tail_C4]
  ring
