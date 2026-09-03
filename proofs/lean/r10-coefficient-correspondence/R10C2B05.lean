import NNSeqAdmission

open scoped Classical
noncomputable section

/-- Transport lemma for `Polynomial.coeff`, the `indepPoly` analogue of
`single_card_sum_coeff` (`NNSeqAdmission.lean`, consumed as FC-6). -/
theorem sum_X_pow_coeff {β : Type*} (s : Finset β) (f : β → ℕ) (n : ℕ) :
    (∑ S ∈ s, Polynomial.X ^ (f S) : Polynomial ℤ).coeff n
      = ((s.filter (fun S => f S = n)).card : ℤ) := by
  classical
  simp [Polynomial.finsetSum_coeff, Polynomial.coeff_X_pow, Finset.sum_boole, eq_comm]

theorem RTree.indepPoly_coeff_eq_card (t : RTree) (n : ℕ) :
    t.indepPoly.coeff n
      = ((t.vertices.powerset.filter (fun S => t.IndepSet S ∧ S.card = n)).card : ℤ) := by
  unfold RTree.indepPoly
  rw [sum_X_pow_coeff]
  congr 1
  rw [Finset.filter_filter]

/-- **The nonnegativity lemma the C3 allocation names.** `indepPoly.coeff`
is a `Nat`-cast, hence nonnegative — the fact that makes the `ℕ`-cast
restatement of `R10C2-B-05` (below) well-typed where the direct `NNRat`
`IntCast` statement was not (`NNRat` carries no `IntCast`; `C2-ORDER-B-1`,
FC-6's named residue). -/
theorem RTree.indepPoly_coeff_nonneg (t : RTree) (n : ℕ) : 0 ≤ t.indepPoly.coeff n := by
  rw [RTree.indepPoly_coeff_eq_card]
  exact Int.natCast_nonneg _

/-- The two filtered `Finset`s agree: `indepNNSeq_coeff`'s `(S.card:ℤ)=(n:ℤ)`
side condition (FC-6-1, consumed) and `indepPoly_coeff_eq_card`'s
`S.card = n` side condition pick out the same independent sets, by
`Nat.cast` injectivity. -/
theorem RTree.indepPoly_indepNNSeq_filter_eq (t : RTree) (n : ℕ) :
    (t.vertices.powerset.filter (fun S => t.IndepSet S ∧ (S.card : ℤ) = (n : ℤ)))
      = (t.vertices.powerset.filter (fun S => t.IndepSet S ∧ S.card = n)) := by
  apply Finset.filter_congr
  intro S _
  constructor
  · rintro ⟨h1, h2⟩; exact ⟨h1, by exact_mod_cast h2⟩
  · rintro ⟨h1, h2⟩; exact ⟨h1, by exact_mod_cast h2⟩

/-- **`R10C2-B-05`, closed** (`R10C3-B2-E4`, `C2-ORDER-B-1`). The
coefficient correspondence joining `RTree.indepNNSeq` (FC-6, the NNSeq
admission, consumed) to `RTree.indepPoly` (FC-1-adjacent, consumed),
restated via `ℕ`-casts on both sides plus the nonnegativity lemma above
— exactly the fix FC-6 names: the original
`(t.indepNNSeq).coeff (n:ℤ) = (t.indepPoly.coeff n : NNRat)` statement
never elaborated because `NNRat` has no `IntCast`. This closes the chain
from the governed recurrence (FC-1, via `indepPoly`) to the governed TRS2
predicate (`RTree.TRS2_iff_adjacentLogConcave`, via `indepNNSeq`) inside
the Lean kernel rather than by inspection. -/
theorem RTree.indepNNSeq_coeff_eq_indepPoly_coeff (t : RTree) (n : ℕ) :
    (t.indepNNSeq).coeff (n : ℤ) = ((t.indepPoly.coeff n).toNat : NNRat) := by
  rw [RTree.indepNNSeq_coeff, RTree.indepPoly_indepNNSeq_filter_eq,
      RTree.indepPoly_coeff_eq_card, Int.toNat_natCast]
