import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Combinatorics.SimpleGraph.Clique
import Mathlib.Combinatorics.SimpleGraph.Sum
import Mathlib.Data.Finset.Sum
import Mathlib.Data.Fintype.Powerset
import Mathlib.Data.Int.Interval
import Mathlib.Tactic.Linarith

open scoped BigOperators

namespace C8U3Selector

open SimpleGraph

noncomputable section

/-- The finite type of actual independent `n`-vertex subsets. -/
def RankedIndependentSet {V : Type*} (G : SimpleGraph V) (n : ℕ) :=
  {s : Finset V // G.IsNIndepSet n s}

noncomputable instance rankedIndependentSetFintype {V : Type*} [Fintype V]
    (G : SimpleGraph V) (n : ℕ) : Fintype (RankedIndependentSet G n) := by
  classical
  unfold RankedIndependentSet
  exact Fintype.ofFinset (G.indepSetFinset n) (fun s ↦ SimpleGraph.mem_indepSetFinset_iff)

/-- The number of independent `n`-subsets, represented in `ℤ`. -/
def independentCountNat {V : Type*} [Fintype V] (G : SimpleGraph V) (n : ℕ) : ℤ :=
  Fintype.card (RankedIndependentSet G n)

lemma isIndepSet_disjSum_iff {V W : Type*} (G : SimpleGraph V) (H : SimpleGraph W)
    (s : Finset V) (t : Finset W) :
    (G ⊕g H).IsIndepSet (s.disjSum t : Finset (V ⊕ W)) ↔
      G.IsIndepSet (s : Set V) ∧ H.IsIndepSet (t : Set W) := by
  classical
  simp only [SimpleGraph.isIndepSet_iff, Set.Pairwise]
  constructor
  · intro h
    constructor
    · intro v hv v' hv' hvv'
      have hne : Sum.inl v ≠ (Sum.inl v' : V ⊕ W) := by simpa using hvv'
      simpa using h (by simpa using hv) (by simpa using hv') hne
    · intro w hw w' hw' hww'
      have hne : Sum.inr w ≠ (Sum.inr w' : V ⊕ W) := by simpa using hww'
      simpa using h (by simpa using hw) (by simpa using hw') hne
  · rintro ⟨hG, hH⟩ (v | w) hv (v' | w') hv' hne
    · simpa using hG (by simpa using hv) (by simpa using hv') (by simpa using hne)
    · simp
    · simp
    · simpa using hH (by simpa using hv) (by simpa using hv') (by simpa using hne)

/-- Integer-rank extension of the independent-set numbers.  The upper guard is
the graph independence number from Mathlib. -/
def independentCount {V : Type*} [Fintype V] (G : SimpleGraph V) (r : ℤ) : ℤ :=
  if 0 ≤ r then
    if r.toNat ≤ G.indepNum then independentCountNat G r.toNat else 0
  else 0

lemma independentCountNat_eq_zero_of_indepNum_lt {V : Type*} [Fintype V]
    (G : SimpleGraph V) {n : ℕ} (h : G.indepNum < n) : independentCountNat G n = 0 := by
  unfold independentCountNat
  norm_cast
  rw [Fintype.card_eq_zero_iff]
  exact ⟨fun s ↦ (not_le_of_gt h)
    (s.property.card_eq ▸ s.property.isIndepSet.card_le_indepNum)⟩

@[simp]
lemma independentCount_ofNat {V : Type*} [Fintype V] (G : SimpleGraph V) (n : ℕ) :
    independentCount G (n : ℤ) = independentCountNat G n := by
  by_cases h : n ≤ G.indepNum
  · simp [independentCount, h]
  · simp [independentCount, h, independentCountNat_eq_zero_of_indepNum_lt G (Nat.lt_of_not_ge h)]

lemma independentCount_eq_zero_of_neg {V : Type*} [Fintype V] (G : SimpleGraph V)
    {r : ℤ} (h : r < 0) : independentCount G r = 0 := by
  unfold independentCount
  rw [if_neg (not_le.mpr h)]

lemma independentCount_eq_zero_of_indepNum_lt {V : Type*} [Fintype V]
    (G : SimpleGraph V) {n : ℕ} (h : G.indepNum < n) :
    independentCount G (n : ℤ) = 0 := by
  rw [independentCount_ofNat, independentCountNat_eq_zero_of_indepNum_lt G h]

lemma indepNum_eq_zero_of_isEmpty {V : Type*} [Fintype V] [IsEmpty V]
    (G : SimpleGraph V) : G.indepNum = 0 := by
  obtain ⟨s, hs⟩ := G.exists_isNIndepSet_indepNum
  have hempty : s = ∅ := by
    ext v
    exact isEmptyElim v
  simpa [hempty] using hs.card_eq.symm

@[simp]
lemma independentCount_zero {V : Type*} [Fintype V] (G : SimpleGraph V) :
    independentCount G 0 = 1 := by
  rw [show (0 : ℤ) = ((0 : ℕ) : ℤ) by rfl, independentCount_ofNat]
  let e : RankedIndependentSet G 0 ≃ Unit :=
    { toFun := fun _ ↦ ()
      invFun := fun _ ↦ ⟨∅, ⟨by simp [SimpleGraph.isIndepSet_iff], rfl⟩⟩
      left_inv := fun s ↦ Subtype.ext (Finset.card_eq_zero.mp s.property.card_eq).symm
      right_inv := fun _ ↦ rfl }
  unfold independentCountNat
  norm_cast
  simpa using Fintype.card_congr e

/-- The total adjacent-rank difference sequence. -/
def delta {V : Type*} [Fintype V] (G : SimpleGraph V) (r : ℤ) : ℤ :=
  independentCount G (r + 1) - independentCount G r

@[simp]
lemma delta_neg_one {V : Type*} [Fintype V] (G : SimpleGraph V) : delta G (-1) = 1 := by
  simp [delta, independentCount_eq_zero_of_neg]

lemma delta_eq_zero_of_le_neg_two {V : Type*} [Fintype V] (G : SimpleGraph V)
    {r : ℤ} (h : r ≤ -2) : delta G r = 0 := by
  have hr : r < 0 := by omega
  have hr1 : r + 1 < 0 := by omega
  simp [delta, independentCount_eq_zero_of_neg G hr, independentCount_eq_zero_of_neg G hr1]

/-- Split an independent set of a graph disjoint union by summand. -/
def rankedIndependentSetSumTo {V W : Type*} [Fintype V] [Fintype W]
    (G : SimpleGraph V) (H : SimpleGraph W) (n : ℕ)
    (S : RankedIndependentSet (G ⊕g H) n) :
    Σ t : Fin (n + 1), RankedIndependentSet H t × RankedIndependentSet G (n - t) := by
    let l : Finset V := S.val.toLeft
    let r : Finset W := S.val.toRight
    have hcard : l.card + r.card = n := by
      rw [show l.card + r.card = S.val.card by
        simpa [l, r] using Finset.card_toLeft_add_card_toRight (u := S.val)]
      exact S.property.card_eq
    have hind : G.IsIndepSet (l : Set V) ∧ H.IsIndepSet (r : Set W) := by
      apply (isIndepSet_disjSum_iff G H l r).mp
      rw [show l.disjSum r = S.val by
        simpa [l, r] using Finset.toLeft_disjSum_toRight (u := S.val)]
      exact S.property.isIndepSet
    let t : Fin (n + 1) := ⟨r.card, by omega⟩
    exact ⟨t,
      ⟨⟨r, ⟨hind.2, rfl⟩⟩,
        ⟨l, ⟨hind.1, by change l.card = n - r.card; omega⟩⟩⟩⟩

/-- Reassemble ranked independent sets in the two summands. -/
def rankedIndependentSetSumFrom {V W : Type*} [Fintype V] [Fintype W]
    (G : SimpleGraph V) (H : SimpleGraph W) (n : ℕ)
    (z : Σ t : Fin (n + 1), RankedIndependentSet H t × RankedIndependentSet G (n - t)) :
    RankedIndependentSet (G ⊕g H) n := by
    rcases z with ⟨t, ⟨B, A⟩⟩
    refine ⟨A.val.disjSum B.val, ⟨?_, ?_⟩⟩
    · exact (isIndepSet_disjSum_iff G H A.val B.val).mpr
        ⟨A.property.isIndepSet, B.property.isIndepSet⟩
    · rw [Finset.card_disjSum, A.property.card_eq, B.property.card_eq]
      exact Nat.sub_add_cancel (Nat.le_of_lt_succ t.isLt)

lemma cast_rankedIndependentPair_fst_val {V W : Type*} [Fintype V] [Fintype W]
    (G : SimpleGraph V) (H : SimpleGraph W) (n : ℕ) {t u : Fin (n + 1)}
    (h : t = u) (x : RankedIndependentSet H t × RankedIndependentSet G (n - t)) :
    ((Eq.recOn h x : RankedIndependentSet H u × RankedIndependentSet G (n - u)).1).val =
      x.1.val := by
  cases h
  rfl

lemma cast_rankedIndependentPair_snd_val {V W : Type*} [Fintype V] [Fintype W]
    (G : SimpleGraph V) (H : SimpleGraph W) (n : ℕ) {t u : Fin (n + 1)}
    (h : t = u) (x : RankedIndependentSet H t × RankedIndependentSet G (n - t)) :
    ((Eq.recOn h x : RankedIndependentSet H u × RankedIndependentSet G (n - u)).2).val =
      x.2.val := by
  cases h
  rfl

/-- An independent `n`-set of a graph disjoint union is exactly a choice of an
independent `t`-set on the right and an independent `(n-t)`-set on the left. -/
def rankedIndependentSetSumEquiv {V W : Type*} [Fintype V] [Fintype W]
    (G : SimpleGraph V) (H : SimpleGraph W) (n : ℕ) :
    RankedIndependentSet (G ⊕g H) n ≃
      Σ t : Fin (n + 1), RankedIndependentSet H t × RankedIndependentSet G (n - t) where
  toFun := rankedIndependentSetSumTo G H n
  invFun := rankedIndependentSetSumFrom G H n
  left_inv S := by
    apply Subtype.ext
    exact Finset.toLeft_disjSum_toRight
  right_inv z := by
    rcases z with ⟨t, ⟨B, A⟩⟩
    have ht :
        (rankedIndependentSetSumTo G H n
          (rankedIndependentSetSumFrom G H n ⟨t, (B, A)⟩)).1 = t := by
      apply Fin.ext
      simp [rankedIndependentSetSumTo, rankedIndependentSetSumFrom, B.property.card_eq]
    apply Sigma.eq ht
    apply Prod.ext
    · apply Subtype.ext
      rw [cast_rankedIndependentPair_fst_val G H n ht]
      simp [rankedIndependentSetSumTo, rankedIndependentSetSumFrom]
    · apply Subtype.ext
      rw [cast_rankedIndependentPair_snd_val G H n ht]
      simp [rankedIndependentSetSumTo, rankedIndependentSetSumFrom]

lemma independentCountNat_sum {V W : Type*} [Fintype V] [Fintype W]
    (G : SimpleGraph V) (H : SimpleGraph W) (n : ℕ) :
    independentCountNat (G ⊕g H) n =
      ∑ t ∈ Finset.range (n + 1), independentCountNat H t * independentCountNat G (n - t) := by
  unfold independentCountNat
  norm_cast
  calc
    Fintype.card (RankedIndependentSet (G ⊕g H) n) =
        Fintype.card (Σ t : Fin (n + 1),
          RankedIndependentSet H t × RankedIndependentSet G (n - t)) :=
      Fintype.card_congr (rankedIndependentSetSumEquiv G H n)
    _ = ∑ t : Fin (n + 1),
          Fintype.card (RankedIndependentSet H t) *
            Fintype.card (RankedIndependentSet G (n - t)) := by simp
    _ = ∑ t ∈ Finset.range (n + 1),
          Fintype.card (RankedIndependentSet H t) *
            Fintype.card (RankedIndependentSet G (n - t)) := by
      simpa using Fin.sum_univ_eq_sum_range (fun t ↦
        Fintype.card (RankedIndependentSet H t) *
          Fintype.card (RankedIndependentSet G (n - t))) (n + 1)

lemma independentCount_sum_ofNat {V W : Type*} [Fintype V] [Fintype W]
    (G : SimpleGraph V) (H : SimpleGraph W) (n : ℕ) :
    independentCount (G ⊕g H) (n : ℤ) =
      ∑ t ∈ Finset.range (n + 1),
        independentCount H (t : ℤ) * independentCount G ((n : ℤ) - t) := by
  rw [independentCount_ofNat, independentCountNat_sum]
  apply Finset.sum_congr rfl
  intro t ht
  have htn : t ≤ n := Nat.lt_succ_iff.mp (Finset.mem_range.mp ht)
  rw [independentCount_ofNat]
  have hsub : ((n - t : ℕ) : ℤ) = (n : ℤ) - (t : ℤ) := by omega
  rw [← hsub, independentCount_ofNat]

lemma independentCount_sum_bounded_ofNat {V W : Type*} [Fintype V] [Fintype W]
    (G : SimpleGraph V) (H : SimpleGraph W) (n : ℕ) :
    independentCount (G ⊕g H) (n : ℤ) =
      ∑ t ∈ Finset.Icc 0 H.indepNum,
        independentCount H (t : ℤ) * independentCount G ((n : ℤ) - t) := by
  rw [independentCount_sum_ofNat]
  have hIcc : Finset.Icc 0 H.indepNum = Finset.range (H.indepNum + 1) := by
    ext t
    simp
  rw [hIcc]
  rcases le_total n H.indepNum with hna | han
  · apply Finset.sum_subset (Finset.range_mono (Nat.succ_le_succ hna))
    intro t htBig htSmall
    have hnt : n < t := by
      have : ¬ t < n + 1 := by simpa using htSmall
      omega
    have hneg : (n : ℤ) - (t : ℤ) < 0 := by omega
    simp [independentCount_eq_zero_of_neg G hneg]
  · symm
    apply Finset.sum_subset (Finset.range_mono (Nat.succ_le_succ han))
    intro t htBig htSmall
    have hat : H.indepNum < t := by
      have : ¬ t < H.indepNum + 1 := by simpa using htSmall
      omega
    simp [independentCount_eq_zero_of_indepNum_lt H hat]

lemma independentCount_sum_bounded {V W : Type*} [Fintype V] [Fintype W]
    (G : SimpleGraph V) (H : SimpleGraph W) {r : ℤ} (hr : 0 ≤ r) :
    independentCount (G ⊕g H) r =
      ∑ t ∈ Finset.Icc 0 H.indepNum,
        independentCount H (t : ℤ) * independentCount G (r - t) := by
  have hr' : ((r.toNat : ℕ) : ℤ) = r := Int.toNat_of_nonneg hr
  nth_rewrite 1 [← hr']
  rw [independentCount_sum_bounded_ofNat]
  apply Finset.sum_congr rfl
  intro t ht
  rw [hr']

/-- The fully bounded correction sum from the frozen contract. -/
def correction {V W : Type*} [Fintype V] [Fintype W]
    (T : SimpleGraph V) (H : SimpleGraph W) (r : ℤ) : ℤ :=
  ∑ t ∈ Finset.Icc 1 H.indepNum,
    independentCount H (t : ℤ) * delta T (r - t)

lemma correction_eq_zero_of_isEmpty {V W : Type*} [Fintype V] [Fintype W] [IsEmpty W]
    (T : SimpleGraph V) (H : SimpleGraph W) (r : ℤ) : correction T H r = 0 := by
  simp [correction, indepNum_eq_zero_of_isEmpty H]

lemma delta_sum_identity {V W : Type*} [Fintype V] [Fintype W]
    (T : SimpleGraph V) (H : SimpleGraph W) {r : ℤ} (hr : 0 ≤ r) :
    delta (T ⊕g H) r = delta T r + correction T H r := by
  have hr1 : 0 ≤ r + 1 := by omega
  rw [delta, independentCount_sum_bounded T H hr1,
    independentCount_sum_bounded T H hr]
  rw [← Finset.sum_sub_distrib]
  have hsum :
      (∑ t ∈ Finset.Icc 0 H.indepNum,
          (independentCount H (t : ℤ) * independentCount T (r + 1 - t) -
            independentCount H (t : ℤ) * independentCount T (r - t))) =
        ∑ t ∈ Finset.Icc 0 H.indepNum,
          independentCount H (t : ℤ) * delta T (r - t) := by
    apply Finset.sum_congr rfl
    intro t ht
    simp only [delta]
    have harg : r + 1 - (t : ℤ) = (r - (t : ℤ)) + 1 := by omega
    rw [harg]
    rw [mul_sub]
  calc
    (∑ t ∈ Finset.Icc 0 H.indepNum,
        (independentCount H (t : ℤ) * independentCount T (r + 1 - t) -
          independentCount H (t : ℤ) * independentCount T (r - t))) =
        ∑ t ∈ Finset.Icc 0 H.indepNum,
          independentCount H (t : ℤ) * delta T (r - t) := hsum
    _ = delta T r + correction T H r := by
      have hsplit : Finset.Icc 0 H.indepNum = insert 0 (Finset.Icc 1 H.indepNum) := by
        ext t
        simp
        omega
      rw [hsplit, Finset.sum_insert (by simp)]
      simp [correction]

lemma isIndepSet_map_iso_iff {V W : Type*} {G : SimpleGraph V} {H : SimpleGraph W}
    (e : G ≃g H) (s : Finset V) :
    H.IsIndepSet (s.map e.toEquiv.toEmbedding : Finset W) ↔ G.IsIndepSet (s : Set V) := by
  classical
  simp only [SimpleGraph.isIndepSet_iff, Set.Pairwise]
  constructor
  · intro h v hv v' hv' hvv'
    have hne : e v ≠ e v' := e.injective.ne hvv'
    have hnot := h (by simpa using hv) (by simpa using hv') hne
    simpa [e.map_rel_iff] using hnot
  · intro h w hw w' hw' hww'
    simp only [Finset.coe_map, Set.mem_image] at hw hw'
    obtain ⟨v, hv, rfl⟩ := hw
    obtain ⟨v', hv', rfl⟩ := hw'
    have hvv' : v ≠ v' := fun hEq ↦ hww' (congrArg e hEq)
    have hnot := h hv hv' hvv'
    simpa [e.map_rel_iff] using hnot

def rankedIndependentSetIso {V W : Type*} [Fintype V] [Fintype W]
    {G : SimpleGraph V} {H : SimpleGraph W} (e : G ≃g H) (n : ℕ) :
    RankedIndependentSet G n ≃ RankedIndependentSet H n where
  toFun s := ⟨s.val.map e.toEquiv.toEmbedding,
    ⟨(isIndepSet_map_iso_iff e s.val).mpr s.property.isIndepSet,
      by simpa using s.property.card_eq⟩⟩
  invFun t := ⟨t.val.map e.toEquiv.symm.toEmbedding,
    ⟨(isIndepSet_map_iso_iff e.symm t.val).mpr t.property.isIndepSet,
      by simpa using t.property.card_eq⟩⟩
  left_inv s := by
    apply Subtype.ext
    change (s.val.map e.toEquiv.toEmbedding).map e.toEquiv.symm.toEmbedding = s.val
    rw [Finset.map_map]
    have hemb : e.toEquiv.toEmbedding.trans e.toEquiv.symm.toEmbedding =
        Function.Embedding.refl V := by
      ext v
      exact e.toEquiv.symm_apply_apply v
    rw [hemb, Finset.map_refl]
  right_inv t := by
    apply Subtype.ext
    change (t.val.map e.toEquiv.symm.toEmbedding).map e.toEquiv.toEmbedding = t.val
    rw [Finset.map_map]
    have hemb : e.toEquiv.symm.toEmbedding.trans e.toEquiv.toEmbedding =
        Function.Embedding.refl W := by
      ext w
      exact e.toEquiv.apply_symm_apply w
    rw [hemb, Finset.map_refl]

lemma independentCountNat_iso {V W : Type*} [Fintype V] [Fintype W]
    {G : SimpleGraph V} {H : SimpleGraph W} (e : G ≃g H) (n : ℕ) :
    independentCountNat G n = independentCountNat H n := by
  unfold independentCountNat
  norm_cast
  exact Fintype.card_congr (rankedIndependentSetIso e n)

lemma independentCount_iso {V W : Type*} [Fintype V] [Fintype W]
    {G : SimpleGraph V} {H : SimpleGraph W} (e : G ≃g H) (r : ℤ) :
    independentCount G r = independentCount H r := by
  cases r with
  | ofNat n => simpa using independentCountNat_iso e n
  | negSucc n =>
      have hneg : Int.negSucc n < (0 : ℤ) := Int.negSucc_lt_zero n
      simp [independentCount_eq_zero_of_neg G hneg,
        independentCount_eq_zero_of_neg H hneg]

lemma delta_iso {V W : Type*} [Fintype V] [Fintype W]
    {G : SimpleGraph V} {H : SimpleGraph W} (e : G ≃g H) (r : ℤ) :
    delta G r = delta H r := by
  simp only [delta, independentCount_iso e]

noncomputable instance componentVertexFintype {V : Type*} [Fintype V]
    {F : SimpleGraph V} (j : F.ConnectedComponent) : Fintype j := Fintype.ofFinite j

noncomputable instance componentComplementVertexFintype {V : Type*} [Fintype V]
    {F : SimpleGraph V} (j : F.ConnectedComponent) : Fintype (j.suppᶜ : Set V) :=
  Fintype.ofFinite (j.suppᶜ : Set V)

/-- The forest left after deleting one actual connected component. -/
def componentComplement {V : Type*} (F : SimpleGraph V) (j : F.ConnectedComponent) :
    SimpleGraph (j.suppᶜ : Set V) := F.induce j.suppᶜ

lemma componentComplement_isAcyclic {V : Type*} {F : SimpleGraph V}
    (hForest : F.IsAcyclic) (j : F.ConnectedComponent) :
    (componentComplement F j).IsAcyclic := hForest.induce j.suppᶜ

/-- The original labelled graph is isomorphic to the disjoint union of the
chosen connected component and its vertex complement. -/
def componentSumIso {V : Type*} (F : SimpleGraph V) (j : F.ConnectedComponent) :
    j.toSimpleGraph ⊕g componentComplement F j ≃g F := by
  classical
  refine
    { toEquiv := Equiv.Set.sumCompl j.supp
      map_rel_iff' := ?_ }
  intro x y
  rcases x with x | x <;> rcases y with y | y
  · change F.Adj x y ↔ F.Adj x y
    rfl
  · rw [Equiv.Set.sumCompl_apply_inl, Equiv.Set.sumCompl_apply_inr]
    constructor
    · intro hadj
      exact False.elim (y.property ((j.mem_supp_congr_adj hadj).mp x.property))
    · intro hsum
      exact False.elim (SimpleGraph.not_adj_sum_inl_inr x y hsum)
  · rw [Equiv.Set.sumCompl_apply_inr, Equiv.Set.sumCompl_apply_inl]
    constructor
    · intro hadj
      exact False.elim (x.property ((j.mem_supp_congr_adj hadj.symm).mp y.property))
    · intro hsum
      exact False.elim (SimpleGraph.not_adj_sum_inl_inr y x
        ((j.toSimpleGraph ⊕g componentComplement F j).adj_symm hsum))
  · change F.Adj x y ↔ F.Adj x y
    rfl

/-- The component-indexed correction from the contract, with `j` ranging over
the actual connected components of `F`. -/
def componentCorrection {V : Type*} [Fintype V] (F : SimpleGraph V)
    (j : F.ConnectedComponent) (r : ℤ) : ℤ :=
  correction j.toSimpleGraph (componentComplement F j) r

/-- Fixed-component coefficient identity at every guarded rank.  The acyclicity
hypothesis places the declaration at exactly finite-forest scope; Mathlib then
identifies `j.toSimpleGraph` as a tree. -/
theorem fixedComponentIdentity {V : Type*} [Fintype V] [Nonempty V]
    (F : SimpleGraph V) (hForest : F.IsAcyclic) (j : F.ConnectedComponent)
    (r : ℤ) (hr : 0 ≤ r) :
    delta F r = delta j.toSimpleGraph r + componentCorrection F j r := by
  have _hTree : j.toSimpleGraph.IsTree := hForest.isTree_connectedComponent j
  calc
    delta F r = delta (j.toSimpleGraph ⊕g componentComplement F j) r :=
      (delta_iso (componentSumIso F j) r).symm
    _ = delta j.toSimpleGraph r + componentCorrection F j r :=
      delta_sum_identity j.toSimpleGraph (componentComplement F j) hr

/-- The first-recovery sign pattern. -/
def FR {V : Type*} [Fintype V] (G : SimpleGraph V) (p q : ℤ) : Prop :=
  p < q ∧ delta G p < 0 ∧
    (∀ s : ℤ, p < s → s < q → delta G s ≤ 0) ∧ delta G q > 0

def leftSelector {V : Type*} [Fintype V] (F : SimpleGraph V) (p : ℤ) :
    Set F.ConnectedComponent :=
  {j | componentCorrection F j p > delta F p}

def middleSelector {V : Type*} [Fintype V] (F : SimpleGraph V) (s : ℤ) :
    Set F.ConnectedComponent :=
  {j | componentCorrection F j s ≥ delta F s}

def rightSelector {V : Type*} [Fintype V] (F : SimpleGraph V) (q : ℤ) :
    Set F.ConnectedComponent :=
  {j | componentCorrection F j q < delta F q}

/-- The subtype index makes an empty family of interior ranks evaluate to
`Set.univ`, exactly as required when `q = p + 1`. -/
def interiorSelector {V : Type*} [Fintype V] (F : SimpleGraph V) (p q : ℤ) :
    Set F.ConnectedComponent :=
  ⋂ s : {s : ℤ // p < s ∧ s < q}, middleSelector F s

lemma interiorSelector_eq_univ_of_adjacent {V : Type*} [Fintype V]
    (F : SimpleGraph V) (p : ℤ) : interiorSelector F p (p + 1) = Set.univ := by
  ext j
  simp [interiorSelector]
  omega

/-- Exact frozen selector characterization for every finite nonempty labelled
forest and every one of its actual tree components. -/
theorem componentSelectorCharacterization {V : Type*} [Fintype V] [Nonempty V]
    (F : SimpleGraph V) (hForest : F.IsAcyclic) (j : F.ConnectedComponent)
    (p q : ℤ) (hp : 0 ≤ p) (hpq : p < q) :
    FR j.toSimpleGraph p q ↔
      j ∈ leftSelector F p ∩ interiorSelector F p q ∩ rightSelector F q := by
  unfold FR leftSelector interiorSelector middleSelector rightSelector
  simp only [Set.mem_inter_iff, Set.mem_iInter, Set.mem_setOf_eq]
  have hq : 0 ≤ q := by omega
  have hidp := fixedComponentIdentity F hForest j p hp
  have hidq := fixedComponentIdentity F hForest j q hq
  constructor
  · rintro ⟨_, hleft, hmiddle, hright⟩
    refine ⟨⟨by linarith, ?_⟩, by linarith⟩
    intro s
    have hs0 : 0 ≤ (s : ℤ) := by omega
    have hids := fixedComponentIdentity F hForest j (s : ℤ) hs0
    have hsign := hmiddle (s : ℤ) s.property.1 s.property.2
    linarith
  · rintro ⟨⟨hleft, hmiddle⟩, hright⟩
    refine ⟨hpq, by linarith, ?_, by linarith⟩
    intro s hps hsq
    have hs0 : 0 ≤ s := by omega
    have hids := fixedComponentIdentity F hForest j s hs0
    have hcorr := hmiddle ⟨s, hps, hsq⟩
    linarith

end

end C8U3Selector
