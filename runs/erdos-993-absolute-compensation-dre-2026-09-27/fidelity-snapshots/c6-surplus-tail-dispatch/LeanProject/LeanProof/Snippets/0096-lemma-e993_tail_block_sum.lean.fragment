lemma e993_tail_block_sum {m : ℕ} (r : Fin m → ℕ) (i : Fin m)
    (hi : 1 ≤ r i) :
    (∑ b, e993TailBlockSize r i b) = e993TailN r := by
  classical
  rw [Fintype.sum_option]
  change 1 + (∑ j, if j = i then r i - 1 else r j) = e993TailN r
  have hfix := Finset.add_sum_erase (Finset.univ : Finset (Fin m))
    (fun j => if j = i then r i - 1 else r j) (Finset.mem_univ i)
  have hfix' : (∑ j, if j = i then r i - 1 else r j) =
      (r i - 1) + ∑ j ∈ (Finset.univ : Finset (Fin m)).erase i, r j := by
    rw [← hfix]
    simp only [if_pos rfl]
    congr 1
    apply Finset.sum_congr rfl
    intro j hj
    have hne : j ≠ i := (Finset.mem_erase.mp hj).1
    simp [hne]
  have horig := Finset.add_sum_erase (Finset.univ : Finset (Fin m))
    r (Finset.mem_univ i)
  rw [hfix']
  unfold e993TailN
  omega
