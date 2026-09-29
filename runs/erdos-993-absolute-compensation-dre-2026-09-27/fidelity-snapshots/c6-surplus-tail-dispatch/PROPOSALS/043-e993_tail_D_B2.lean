lemma e993_tail_D_B2 : e993TailD 2 (e993TailB 2) = 5 := by
  norm_num [e993TailD, e993TailB, Polynomial.derivative_pow,
    e993_tail_C2, e993_tail_C3, e993_tail_C4]
  ring
