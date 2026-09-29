lemma e993_tail_B_sum_monomial (a : ℕ) (ha : 1 ≤ a) :
    (∑ t ∈ Finset.range (a + 1),
      Polynomial.monomial t ((e993TailB a).coeff t)) = e993TailB a := by
  symm
  exact Polynomial.as_sum_range' (e993TailB a) (a + 1)
    (Nat.lt_succ_of_le (e993_tail_B_degree a ha))
