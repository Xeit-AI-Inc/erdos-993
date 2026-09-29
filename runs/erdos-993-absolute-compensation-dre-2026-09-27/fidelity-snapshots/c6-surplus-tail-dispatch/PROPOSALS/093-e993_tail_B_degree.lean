lemma e993_tail_B_degree (a : ℕ) (ha : 1 ≤ a) :
    (e993TailB a).natDegree ≤ a := by
  have hL : (1 + Polynomial.X : Polynomial ℝ).natDegree ≤ 1 := by
    rw [add_comm]
    change (Polynomial.X + Polynomial.C (1 : ℝ)).natDegree ≤ 1
    rw [Polynomial.natDegree_X_add_C]
  have hp : ((1 + Polynomial.X : Polynomial ℝ) ^ a).natDegree ≤ a := by
    calc
      _ ≤ a * (1 + Polynomial.X : Polynomial ℝ).natDegree := Polynomial.natDegree_pow_le
      _ ≤ a * 1 := Nat.mul_le_mul_left a hL
      _ = a := by omega
  unfold e993TailB
  exact Polynomial.natDegree_add_le_of_degree_le hp (by simpa using ha)
