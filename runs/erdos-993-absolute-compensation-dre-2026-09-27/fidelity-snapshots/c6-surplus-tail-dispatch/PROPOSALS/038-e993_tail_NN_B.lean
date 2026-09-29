lemma e993_tail_NN_B (a : ℕ) : e993TailNN (e993TailB a) :=
  e993_tail_NN_add (e993_tail_NN_pow e993_tail_NN_L a) e993_tail_NN_X
