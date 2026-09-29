lemma e993_tail_block_product {m : ℕ} (r : Fin m → ℕ) (i : Fin m)
    (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4) :
    e993BlockProduct (e993TailBlockSize r i)
      (fun b t => (e993TailB (e993TailBlockSize r i b)).coeff t) = e993TailU r i := by
  classical
  unfold e993BlockProduct
  simp_rw [e993_tail_B_sum_monomial _ (e993_tail_block_pos r i hr _)]
  rw [Fintype.prod_option]
  change e993TailB 1 * (∏ j, e993TailB (if j = i then r i - 1 else r j)) =
    e993TailU r i
  have hfix := Finset.mul_prod_erase (Finset.univ : Finset (Fin m))
    (fun j => e993TailB (if j = i then r i - 1 else r j)) (Finset.mem_univ i)
  have hfix' : (∏ j, e993TailB (if j = i then r i - 1 else r j)) =
      e993TailB (r i - 1) *
        ∏ j ∈ (Finset.univ : Finset (Fin m)).erase i, e993TailB (r j) := by
    rw [← hfix]
    simp only [if_pos rfl]
    congr 1
    apply Finset.prod_congr rfl
    intro j hj
    have hne : j ≠ i := (Finset.mem_erase.mp hj).1
    simp [hne]
  rw [hfix']
  simp only [e993TailU, mul_assoc]
