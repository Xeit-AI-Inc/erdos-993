import Mathlib
namespace C6PositiveRank

open SimpleGraph

noncomputable section

universe u

/-- The finite type of independent vertex sets of cardinality `n`. -/
def RankedIndependentSet {V : Type u} (G : SimpleGraph V) (n : Nat) :=
  {S : Finset V // G.IsNIndepSet n S}

noncomputable instance rankedIndependentSetFintype {V : Type u} [Fintype V]
    (G : SimpleGraph V) (n : Nat) : Fintype (RankedIndependentSet G n) := by
  classical
  unfold RankedIndependentSet
  exact Fintype.ofFinset (G.indepSetFinset n)
    (fun S => SimpleGraph.mem_indepSetFinset_iff)

/-- The actual number of independent `n`-subsets of a finite labelled graph. -/
noncomputable def indepCoeff {V : Type u} [Fintype V]
    (G : SimpleGraph V) (n : Nat) : Nat :=
  Fintype.card (RankedIndependentSet G n)

/-- Integer-rank zero extension of the independence coefficients. -/
noncomputable def indepCoeffInt {V : Type u} [Fintype V]
    (G : SimpleGraph V) (r : Int) : Int :=
  if 0 <= r then Int.ofNat (indepCoeff G r.toNat) else 0

/-- The adjacent difference `Delta_r = i_(r+1) - i_r` at every integer rank. -/
noncomputable def indepDelta {V : Type u} [Fintype V]
    (G : SimpleGraph V) (r : Int) : Int :=
  indepCoeffInt G (r + 1) - indepCoeffInt G r

/-- The frozen first-recovery predicate, including treehood and rank guards. -/
def FR {V : Type u} [Fintype V] (G : SimpleGraph V) (p q : Int) : Prop :=
  G.IsTree ∧
    0 <= p ∧ p < q ∧
    indepDelta G p < 0 ∧
    (∀ r : Int, p < r -> r < q -> indepDelta G r <= 0) ∧
    0 < indepDelta G q

/-- A first-recovery tree of minimum vertex count among all smaller finite
labelled trees, with no same-order tie-break or uniqueness condition. -/
def HminTree {V : Type u} [Fintype V]
    (T : SimpleGraph V) (p q : Int) : Prop :=
  FR T p q ∧
    ∀ {W : Type u} [Fintype W] (U : SimpleGraph W),
      U.IsTree ->
      Fintype.card W < Fintype.card V ->
      ∀ r s : Int, 0 <= r -> r < s -> ¬FR U r s

@[simp]
theorem indepCoeffInt_ofNat {V : Type u} [Fintype V]
    (G : SimpleGraph V) (n : Nat) :
    indepCoeffInt G (n : Int) = Int.ofNat (indepCoeff G n) := by
  simp [indepCoeffInt]

@[simp]
theorem indepCoeff_zero {V : Type u} [Fintype V] (G : SimpleGraph V) :
    indepCoeff G 0 = 1 := by
  let e : RankedIndependentSet G 0 ≃ Unit :=
    { toFun := fun _ => ()
      invFun := fun _ => ⟨∅, ⟨by simp [SimpleGraph.isIndepSet_iff], rfl⟩⟩
      left_inv := fun S =>
        Subtype.ext (Finset.card_eq_zero.mp S.property.card_eq).symm
      right_inv := fun _ => rfl }
  unfold indepCoeff
  simpa using Fintype.card_congr e

/-- Independent one-sets are canonically indexed by their unique vertex. -/
noncomputable def rankedIndependentSetOneEquiv {V : Type u} [Fintype V]
    (G : SimpleGraph V) : RankedIndependentSet G 1 ≃ V := by
  classical
  let f : V -> RankedIndependentSet G 1 := fun v =>
    ⟨{v}, ⟨by simp [SimpleGraph.isIndepSet_iff], by simp⟩⟩
  refine (Equiv.ofBijective f ?_).symm
  constructor
  · intro v w hvw
    have : ({v} : Finset V) = {w} := congrArg Subtype.val hvw
    simpa using this
  · intro S
    obtain ⟨v, hv⟩ := Finset.card_eq_one.mp S.property.card_eq
    refine ⟨v, Subtype.ext ?_⟩
    exact hv.symm

@[simp]
theorem indepCoeff_one {V : Type u} [Fintype V] (G : SimpleGraph V) :
    indepCoeff G 1 = Fintype.card V := by
  unfold indepCoeff
  exact Fintype.card_congr (rankedIndependentSetOneEquiv G)

/-- A positive coefficient supplies an actual rank-sized subset of the carrier. -/
theorem rank_le_card_of_indepCoeff_pos {V : Type u} [Fintype V]
    (G : SimpleGraph V) {n : Nat} (h : 0 < indepCoeff G n) :
    n <= Fintype.card V := by
  have hnonempty : Nonempty (RankedIndependentSet G n) := by
    exact Fintype.card_pos_iff.mp h
  obtain ⟨S⟩ := hnonempty
  calc
    n = S.val.card := S.property.card_eq.symm
    _ <= Fintype.card V := S.val.card_le_univ

/-- Integer-rank form of the carrier bound, transported through `Int.toNat`. -/
theorem rank_le_card_of_indepCoeffInt_pos {V : Type u} [Fintype V]
    (G : SimpleGraph V) {r : Int} (hr : 0 <= r)
    (h : 0 < indepCoeffInt G r) :
    r <= Int.ofNat (Fintype.card V) := by
  rw [indepCoeffInt, if_pos hr] at h
  have hNat : 0 < indepCoeff G r.toNat := Int.natCast_pos.mp h
  have hRankNat : r.toNat <= Fintype.card V :=
    rank_le_card_of_indepCoeff_pos G hNat
  have hRankInt : (r.toNat : Int) <= Int.ofNat (Fintype.card V) :=
    Int.ofNat_le.mpr hRankNat
  rwa [Int.natCast_toNat_eq_self.mpr hr] at hRankInt

@[simp]
theorem indepDelta_ofNat {V : Type u} [Fintype V]
    (G : SimpleGraph V) (n : Nat) :
    indepDelta G (n : Int) =
      Int.ofNat (indepCoeff G (n + 1)) - Int.ofNat (indepCoeff G n) := by
  unfold indepDelta indepCoeffInt
  have hn : 0 <= (n : Int) := Int.natCast_nonneg n
  have hSucc : 0 <= (n : Int) + 1 := by omega
  rw [if_pos hSucc, if_pos hn]
  simp

/-- Positivity of `Delta_q` forces a positive coefficient at rank `q+1`. -/
theorem indepCoeff_succ_pos_of_indepDelta_pos {V : Type u} [Fintype V]
    (G : SimpleGraph V) (q : Nat) (h : 0 < indepDelta G (q : Int)) :
    0 < indepCoeff G (q + 1) := by
  rw [indepDelta_ofNat] at h
  have hNat : indepCoeff G q < indepCoeff G (q + 1) := by
    exact Int.ofNat_lt.mp (sub_pos.mp h)
  omega

/-- At a nonnegative integer rank, positive `Delta_q` forces
`i_(q+1) > 0` in the integer-rank zero extension. -/
theorem indepCoeffInt_succ_pos_of_indepDelta_pos {V : Type u} [Fintype V]
    (G : SimpleGraph V) {q : Int} (hq : 0 <= q)
    (h : 0 < indepDelta G q) :
    0 < indepCoeffInt G (q + 1) := by
  have hCoeffNonneg : 0 <= indepCoeffInt G q := by
    rw [indepCoeffInt, if_pos hq]
    exact Int.natCast_nonneg _
  unfold indepDelta at h
  omega

@[simp]
theorem indepDelta_zero {V : Type u} [Fintype V] (G : SimpleGraph V) :
    indepDelta G 0 = Int.ofNat (Fintype.card V) - 1 := by
  simpa using (indepDelta_ofNat G 0)

/-- Natural-rank corollary retained as an auxiliary transport theorem. -/
theorem C5_T2_POSITIVE_RANK_REPAIR_nat {V : Type u} [Fintype V]
    (T : SimpleGraph V) (p q : Nat) (h : HminTree T p q) :
    (0 < p ∧ p < q) ∧
      0 < indepCoeff T (q + 1) ∧
      (q + 1 <= Fintype.card V ∧ 2 <= Fintype.card V) ∧
      (indepDelta T 0 = Int.ofNat (Fintype.card V) - 1 ∧
        0 < Int.ofNat (Fintype.card V) - 1) := by
  rcases h.1 with ⟨_hTree, _hpNonneg, hpqInt, hDeltaP, _hInterior, hDeltaQ⟩
  have hpq : p < q := by
    exact_mod_cast hpqInt
  have hCoeff : 0 < indepCoeff T (q + 1) :=
    indepCoeff_succ_pos_of_indepDelta_pos T q hDeltaQ
  have hRank : q + 1 <= Fintype.card V :=
    rank_le_card_of_indepCoeff_pos T hCoeff
  have hTwoRank : 2 <= q + 1 := by omega
  have hTwoCard : 2 <= Fintype.card V := hTwoRank.trans hRank
  have hDeltaZero : indepDelta T 0 = Int.ofNat (Fintype.card V) - 1 :=
    indepDelta_zero T
  have hZeroPositive : 0 < Int.ofNat (Fintype.card V) - 1 := by
    have hCardCast : (1 : Int) < Int.ofNat (Fintype.card V) := by
      exact Int.ofNat_lt.mpr (show 1 < Fintype.card V by omega)
    omega
  have hp : 0 < p := by
    by_contra hpNot
    have hpZero : p = 0 := Nat.eq_zero_of_not_pos hpNot
    subst p
    have hDeltaPNeg : indepDelta T 0 < 0 := by simpa using hDeltaP
    have : 0 < indepDelta T 0 := hDeltaZero.symm ▸ hZeroPositive
    exact (not_lt_of_ge (le_of_lt this)) hDeltaPNeg
  exact ⟨⟨hp, hpq⟩, hCoeff, ⟨hRank, hTwoCard⟩,
    ⟨hDeltaZero, hZeroPositive⟩⟩

/-- `C5-T2-POSITIVE-RANK-REPAIR`: the exact integer-interface Cycle 6 nominee.
The minimum-order projection of `HminTree` is retained in the hypothesis but is
not needed for this boundary argument. -/
theorem C5_T2_POSITIVE_RANK_REPAIR {V : Type u} [Fintype V]
    (T : SimpleGraph V) (p q : Int) (h : HminTree T p q) :
    (0 < p ∧ p < q) ∧
      0 < indepCoeffInt T (q + 1) ∧
      (q + 1 <= Int.ofNat (Fintype.card V) ∧
        2 <= Int.ofNat (Fintype.card V)) ∧
      (indepDelta T 0 = Int.ofNat (Fintype.card V) - 1 ∧
        0 < Int.ofNat (Fintype.card V) - 1) := by
  rcases h.1 with ⟨_hTree, hpNonneg, hpq, hDeltaP, _hInterior, hDeltaQ⟩
  have hqNonneg : 0 <= q := hpNonneg.trans (le_of_lt hpq)
  have hqSuccNonneg : 0 <= q + 1 := by omega
  have hCoeff : 0 < indepCoeffInt T (q + 1) :=
    indepCoeffInt_succ_pos_of_indepDelta_pos T hqNonneg hDeltaQ
  have hRank : q + 1 <= Int.ofNat (Fintype.card V) :=
    rank_le_card_of_indepCoeffInt_pos T hqSuccNonneg hCoeff
  have hTwoRank : (2 : Int) <= q + 1 := by omega
  have hTwoCard : (2 : Int) <= Int.ofNat (Fintype.card V) :=
    hTwoRank.trans hRank
  have hDeltaZero : indepDelta T 0 = Int.ofNat (Fintype.card V) - 1 :=
    indepDelta_zero T
  have hZeroPositive : 0 < Int.ofNat (Fintype.card V) - 1 := by omega
  have hp : 0 < p := by
    by_contra hpNot
    have hpZero : p = 0 := by omega
    subst p
    have hDeltaPNeg : indepDelta T 0 < 0 := by simpa using hDeltaP
    have hDeltaZeroPos : 0 < indepDelta T 0 :=
      hDeltaZero.symm ▸ hZeroPositive
    omega
  exact ⟨⟨hp, hpq⟩, hCoeff, ⟨hRank, hTwoCard⟩,
    ⟨hDeltaZero, hZeroPositive⟩⟩

end

end C6PositiveRank
