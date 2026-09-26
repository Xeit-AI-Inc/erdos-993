namespace E993OrderBand

open Classical

lemma bad_good_partition {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) :
    (badFamily G U W k).card + (goodFamily G U W k).card =
      (E993Interior.taggedFamily G U W k).card := by
  classical
  have hcomp : badFamily G U W k =
      (E993Interior.taggedFamily G U W k).filter
        (fun A => ¬ ∃ x ∈ U, ∃ a ∈ A, G.Adj x a) := by
    ext A
    simp only [badFamily, Finset.mem_filter]
    constructor
    · rintro ⟨hA, hbad⟩
      refine ⟨hA, ?_⟩
      rintro ⟨x, hx, a, ha, hadj⟩
      exact hbad x hx a ha hadj
    · rintro ⟨hA, hnot⟩
      refine ⟨hA, ?_⟩
      intro x hx a ha hadj
      exact hnot ⟨x, hx, a, ha, hadj⟩
  have hsplit := Finset.card_filter_add_card_filter_not
    (s := E993Interior.taggedFamily G U W k)
    (p := fun A : Finset V => ∃ x ∈ U, ∃ a ∈ A, G.Adj x a)
  rw [hcomp]
  simpa only [goodFamily, add_comm] using hsplit

end E993OrderBand
