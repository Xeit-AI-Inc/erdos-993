lemma e993_tail_D_B1 : e993TailD 1 (e993TailB 1) = 4 := by
  norm_num [e993TailD, e993TailB, Polynomial.derivative_pow,
    e993_tail_C2, e993_tail_C3, e993_tail_C4]
  ring
