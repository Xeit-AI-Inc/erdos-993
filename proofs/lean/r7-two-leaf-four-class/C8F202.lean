import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Combinatorics.SimpleGraph.Clique
import Mathlib.Data.Fintype.OfMap
import Mathlib.Data.Fintype.Powerset
import Lean.Elab.Tactic.Omega

namespace C8F202

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Independent labelled finsets of integer rank `k` whose vertices lie in `A`.
The integer equality makes the type empty automatically when `k < 0`. -/
def IndepFinsetAt (G : SimpleGraph V) (A : Set V) (k : ℤ) :=
  {s : Finset V //
    G.IsIndepSet (s : Set V) ∧ (s : Set V) ⊆ A ∧ (s.card : ℤ) = k}

noncomputable instance instFintypeIndepFinsetAt
    (G : SimpleGraph V) (A : Set V) (k : ℤ) : Fintype (IndepFinsetAt G A k) :=
  Fintype.ofInjective Subtype.val Subtype.val_injective

/-- The integer-rank independent-set coefficient of the induced labelled graph on `A`. -/
noncomputable def iCoeff (G : SimpleGraph V) (A : Set V) (k : ℤ) : ℤ :=
  Fintype.card (IndepFinsetAt G A k)

/-- Adjacent-coefficient difference, with `iCoeff` already zero-extended on `ℤ`. -/
noncomputable def delta (G : SimpleGraph V) (A : Set V) (r : ℤ) : ℤ :=
  iCoeff G A (r + 1) - iCoeff G A r

/-- The vertices of `H = T - {x,y}`. Labels are the original elements of `V`. -/
def HVerts (x y : V) : Set V := ({x, y} : Set V)ᶜ

/-- The vertices of `H - u`. -/
def HuVerts (x y u : V) : Set V := HVerts x y \ {u}

/-- The vertices of `H - w`. -/
def HwVerts (x y w : V) : Set V := HVerts x y \ {w}

/-- The vertices of `C = H - {u,w}`; set deletion removes a repeated support once. -/
def CVerts (x y u w : V) : Set V := HVerts x y \ {u, w}

@[simp] lemma mem_HVerts_iff {x y z : V} : z ∈ HVerts x y ↔ z ≠ x ∧ z ≠ y := by
  simp [HVerts, and_comm]

@[simp] lemma mem_HuVerts_iff {x y u z : V} :
    z ∈ HuVerts x y u ↔ z ≠ x ∧ z ≠ y ∧ z ≠ u := by
  simp [HuVerts, and_assoc]

@[simp] lemma mem_HwVerts_iff {x y w z : V} :
    z ∈ HwVerts x y w ↔ z ≠ x ∧ z ≠ y ∧ z ≠ w := by
  simp [HwVerts, and_assoc]

@[simp] lemma mem_CVerts_iff {x y u w z : V} :
    z ∈ CVerts x y u w ↔ z ≠ x ∧ z ≠ y ∧ z ≠ u ∧ z ≠ w := by
  simp [CVerts, and_assoc]

lemma not_mem_of_indep_adj {G : SimpleGraph V} {s : Finset V} {v z : V}
    (hs : G.IsIndepSet (s : Set V)) (hv : v ∈ s) (hvz : G.Adj v z) : z ∉ s := by
  intro hz
  exact hs hv hz hvz.ne hvz

lemma indep_erase {G : SimpleGraph V} {s : Finset V} (hs : G.IsIndepSet (s : Set V))
    (v : V) : G.IsIndepSet (s.erase v : Set V) := by
  apply hs.mono
  intro z hz
  exact Finset.mem_of_mem_erase hz

lemma indep_insert_of_unique_neighbor {G : SimpleGraph V} {s : Finset V} {v u : V}
    (hs : G.IsIndepSet (s : Set V)) (hu : u ∉ s)
    (huniq : ∀ z, G.Adj v z → z = u) :
    G.IsIndepSet (↑(insert v s : Finset V) : Set V) := by
  change (↑(insert v s : Finset V) : Set V).Pairwise (fun a b ↦ ¬ G.Adj a b)
  intro a ha b hb hab
  simp only [Finset.mem_coe, Finset.mem_insert] at ha hb
  rcases ha with rfl | ha <;> rcases hb with rfl | hb
  · exact (hab rfl).elim
  · intro hvb
    exact hu (huniq b hvb ▸ hb)
  · intro hav
    exact hu (huniq a hav.symm ▸ ha)
  · exact hs ha hb hab

lemma leaves_not_adjacent {T : SimpleGraph V} {x y : V}
    (hT : T.IsTree) (hcard : 3 ≤ Fintype.card V) (hxy : x ≠ y)
    (hxleaf : ∃! z, T.Adj x z) (hyleaf : ∃! z, T.Adj y z) :
    ¬ T.Adj x y := by
  intro hadj
  have hx_unique : ∀ z, T.Adj x z → z = y := by
    intro z hz
    exact hxleaf.unique hz hadj
  have hy_unique : ∀ z, T.Adj y z → z = x := by
    intro z hz
    exact hyleaf.unique hz hadj.symm
  have all_pair : ∀ z : V, z = x ∨ z = y := by
    intro z
    have hr := (reachable_iff_reflTransGen x z).mp (hT.connected x z)
    induction hr with
    | refl => exact Or.inl rfl
    | tail _ hab ih =>
        rcases ih with rfl | rfl
        · exact Or.inr (hx_unique _ hab)
        · exact Or.inl (hy_unique _ hab)
  have huniv : (Finset.univ : Finset V) ⊆ {x, y} := by
    intro z _
    rcases all_pair z with rfl | rfl <;> simp
  have hle : Fintype.card V ≤ 2 := by
    simpa [hxy] using Finset.card_le_card huniv
  omega

abbrev FourClasses (T : SimpleGraph V) (x y u w : V) (k : ℤ) :=
  IndepFinsetAt T (HVerts x y) k ⊕
    (IndepFinsetAt T (HuVerts x y u) (k - 1) ⊕
      (IndepFinsetAt T (HwVerts x y w) (k - 1) ⊕
        IndepFinsetAt T (CVerts x y u w) (k - 2)))

/-- The direct four-way partition by intersection with `{x,y}`. -/
noncomputable def fourClassEquiv {T : SimpleGraph V} {x y u w : V}
    (hxy : x ≠ y) (hnadj : ¬ T.Adj x y)
    (hxu : T.Adj x u) (hyw : T.Adj y w)
    (hxuniq : ∀ z, T.Adj x z → z = u)
    (hyuniq : ∀ z, T.Adj y z → z = w) (k : ℤ) :
    IndepFinsetAt T Set.univ k ≃ FourClasses T x y u w k := by
  classical
  let toFour : IndepFinsetAt T Set.univ k → FourClasses T x y u w k := fun S => by
    by_cases hx : x ∈ S.1
    · by_cases hy : y ∈ S.1
      · apply Sum.inr
        apply Sum.inr
        apply Sum.inr
        let t := (S.1.erase x).erase y
        have hu : u ∉ S.1 := not_mem_of_indep_adj S.2.1 hx hxu
        have hw : w ∉ S.1 := not_mem_of_indep_adj S.2.1 hy hyw
        have hy' : y ∈ S.1.erase x := Finset.mem_erase.mpr ⟨hxy.symm, hy⟩
        refine ⟨t, indep_erase (indep_erase S.2.1 x) y, ?_, ?_⟩
        · intro z hz
          have hzy : z ≠ y := (Finset.mem_erase.mp hz).1
          have hzx_mem : z ∈ S.1.erase x := (Finset.mem_erase.mp hz).2
          have hzx : z ≠ x := (Finset.mem_erase.mp hzx_mem).1
          have hzs : z ∈ S.1 := (Finset.mem_erase.mp hzx_mem).2
          exact mem_CVerts_iff.mpr
            ⟨hzx, hzy, fun h ↦ hu (h ▸ hzs), fun h ↦ hw (h ▸ hzs)⟩
        · have hc1 := Finset.card_erase_add_one hx
          have hc2 := Finset.card_erase_add_one hy'
          have hc1' := congrArg (fun n : ℕ ↦ (n : ℤ)) hc1
          have hc2' := congrArg (fun n : ℕ ↦ (n : ℤ)) hc2
          simp only [Nat.cast_add, Nat.cast_one] at hc1' hc2'
          change ((((S.1.erase x).erase y).card : ℕ) : ℤ) = k - 2
          have hcard : (S.1.card : ℤ) = k := S.2.2.2
          omega
      · apply Sum.inr
        apply Sum.inl
        let t := S.1.erase x
        have hu : u ∉ S.1 := not_mem_of_indep_adj S.2.1 hx hxu
        refine ⟨t, indep_erase S.2.1 x, ?_, ?_⟩
        · intro z hz
          have hzx : z ≠ x := (Finset.mem_erase.mp hz).1
          have hzs : z ∈ S.1 := (Finset.mem_erase.mp hz).2
          exact mem_HuVerts_iff.mpr
            ⟨hzx, fun h ↦ hy (h ▸ hzs), fun h ↦ hu (h ▸ hzs)⟩
        · have hc := Finset.card_erase_add_one hx
          have hc' := congrArg (fun n : ℕ ↦ (n : ℤ)) hc
          simp only [Nat.cast_add, Nat.cast_one] at hc'
          change (((S.1.erase x).card : ℕ) : ℤ) = k - 1
          have hcard : (S.1.card : ℤ) = k := S.2.2.2
          omega
    · by_cases hy : y ∈ S.1
      · apply Sum.inr
        apply Sum.inr
        apply Sum.inl
        let t := S.1.erase y
        have hw : w ∉ S.1 := not_mem_of_indep_adj S.2.1 hy hyw
        refine ⟨t, indep_erase S.2.1 y, ?_, ?_⟩
        · intro z hz
          have hzy : z ≠ y := (Finset.mem_erase.mp hz).1
          have hzs : z ∈ S.1 := (Finset.mem_erase.mp hz).2
          exact mem_HwVerts_iff.mpr
            ⟨fun h ↦ hx (h ▸ hzs), hzy, fun h ↦ hw (h ▸ hzs)⟩
        · have hc := Finset.card_erase_add_one hy
          have hc' := congrArg (fun n : ℕ ↦ (n : ℤ)) hc
          simp only [Nat.cast_add, Nat.cast_one] at hc'
          change (((S.1.erase y).card : ℕ) : ℤ) = k - 1
          have hcard : (S.1.card : ℤ) = k := S.2.2.2
          omega
      · apply Sum.inl
        exact ⟨S.1, S.2.1, fun z hz ↦ mem_HVerts_iff.mpr
          ⟨fun h ↦ hx (h ▸ hz), fun h ↦ hy (h ▸ hz)⟩, S.2.2.2⟩
  let fromFour : FourClasses T x y u w k → IndepFinsetAt T Set.univ k := fun Q => by
    rcases Q with S | Q
    · exact ⟨S.1, S.2.1, Set.subset_univ _, S.2.2.2⟩
    · rcases Q with S | Q
      · have hx : x ∉ S.1 := fun hx ↦ (mem_HuVerts_iff.mp (S.2.2.1 hx)).1 rfl
        have hu : u ∉ S.1 := fun hu ↦ (mem_HuVerts_iff.mp (S.2.2.1 hu)).2.2 rfl
        refine ⟨insert x S.1, indep_insert_of_unique_neighbor S.2.1 hu hxuniq,
          Set.subset_univ _, ?_⟩
        have hc := Finset.card_insert_of_notMem hx
        have hc' := congrArg (fun n : ℕ ↦ (n : ℤ)) hc
        simp only [Nat.cast_add, Nat.cast_one] at hc'
        have hcard : (S.1.card : ℤ) = k - 1 := S.2.2.2
        omega
      · rcases Q with S | S
        · have hy : y ∉ S.1 := fun hy ↦ (mem_HwVerts_iff.mp (S.2.2.1 hy)).2.1 rfl
          have hw : w ∉ S.1 := fun hw ↦ (mem_HwVerts_iff.mp (S.2.2.1 hw)).2.2 rfl
          refine ⟨insert y S.1, indep_insert_of_unique_neighbor S.2.1 hw hyuniq,
            Set.subset_univ _, ?_⟩
          have hc := Finset.card_insert_of_notMem hy
          have hc' := congrArg (fun n : ℕ ↦ (n : ℤ)) hc
          simp only [Nat.cast_add, Nat.cast_one] at hc'
          have hcard : (S.1.card : ℤ) = k - 1 := S.2.2.2
          omega
        · have hx : x ∉ S.1 := fun hx ↦ (mem_CVerts_iff.mp (S.2.2.1 hx)).1 rfl
          have hy : y ∉ S.1 := fun hy ↦ (mem_CVerts_iff.mp (S.2.2.1 hy)).2.1 rfl
          have hu : u ∉ S.1 := fun hu ↦ (mem_CVerts_iff.mp (S.2.2.1 hu)).2.2.1 rfl
          have hw : w ∉ S.1 := fun hw ↦ (mem_CVerts_iff.mp (S.2.2.1 hw)).2.2.2 rfl
          have huy : u ≠ y := fun h ↦ hnadj (h ▸ hxu)
          have hi_y : T.IsIndepSet (↑(insert y S.1 : Finset V) : Set V) :=
            indep_insert_of_unique_neighbor S.2.1 hw hyuniq
          have hu' : u ∉ insert y S.1 := by simp [hu, huy]
          refine ⟨insert x (insert y S.1),
            indep_insert_of_unique_neighbor hi_y hu' hxuniq, Set.subset_univ _, ?_⟩
          have hc1 := Finset.card_insert_of_notMem hy
          have hx' : x ∉ insert y S.1 := by simp [hx, hxy]
          have hc2 := Finset.card_insert_of_notMem hx'
          have hc1' := congrArg (fun n : ℕ ↦ (n : ℤ)) hc1
          have hc2' := congrArg (fun n : ℕ ↦ (n : ℤ)) hc2
          simp only [Nat.cast_add, Nat.cast_one] at hc1' hc2'
          have hcard : (S.1.card : ℤ) = k - 2 := S.2.2.2
          omega
  refine ⟨toFour, fromFour, ?_, ?_⟩
  · intro S
    apply Subtype.ext
    by_cases hx : x ∈ S.1
    · by_cases hy : y ∈ S.1
      · simp only [toFour, fromFour, dif_pos hx, dif_pos hy]
        have hy' : y ∈ S.1.erase x := Finset.mem_erase.mpr ⟨hxy.symm, hy⟩
        rw [Finset.insert_erase hy', Finset.insert_erase hx]
      · simp [toFour, fromFour, hx, hy]
    · by_cases hy : y ∈ S.1
      · simp [toFour, fromFour, hx, hy]
      · simp [toFour, fromFour, hx, hy]
  · intro Q
    rcases Q with S | Q
    · have hx : x ∉ S.1 := fun hx ↦ (mem_HVerts_iff.mp (S.2.2.1 hx)).1 rfl
      have hy : y ∉ S.1 := fun hy ↦ (mem_HVerts_iff.mp (S.2.2.1 hy)).2 rfl
      simp [toFour, fromFour, hx, hy]
    · rcases Q with S | Q
      · have hx : x ∉ S.1 := fun hx ↦ (mem_HuVerts_iff.mp (S.2.2.1 hx)).1 rfl
        have hy : y ∉ S.1 := fun hy ↦ (mem_HuVerts_iff.mp (S.2.2.1 hy)).2.1 rfl
        simp [toFour, fromFour, hx, hy, hxy.symm]
      · rcases Q with S | S
        · have hx : x ∉ S.1 := fun hx ↦ (mem_HwVerts_iff.mp (S.2.2.1 hx)).1 rfl
          have hy : y ∉ S.1 := fun hy ↦ (mem_HwVerts_iff.mp (S.2.2.1 hy)).2.1 rfl
          simp [toFour, fromFour, hx, hy, hxy]
        · have hx : x ∉ S.1 := fun hx ↦ (mem_CVerts_iff.mp (S.2.2.1 hx)).1 rfl
          have hy : y ∉ S.1 := fun hy ↦ (mem_CVerts_iff.mp (S.2.2.1 hy)).2.1 rfl
          simp [toFour, fromFour, hx, hy, hxy]

lemma coefficient_identity {T : SimpleGraph V} {x y u w : V}
    (hT : T.IsTree) (hcard : 3 ≤ Fintype.card V) (hxy : x ≠ y)
    (hxleaf : ∃! z, T.Adj x z) (hyleaf : ∃! z, T.Adj y z)
    (hxu : T.Adj x u) (hyw : T.Adj y w) : ∀ k : ℤ,
    iCoeff T Set.univ k =
      iCoeff T (HVerts x y) k +
      iCoeff T (HuVerts x y u) (k - 1) +
      iCoeff T (HwVerts x y w) (k - 1) +
      iCoeff T (CVerts x y u w) (k - 2) := by
  intro k
  have hnadj := leaves_not_adjacent hT hcard hxy hxleaf hyleaf
  have hxuniq : ∀ z, T.Adj x z → z = u := fun z hz ↦ hxleaf.unique hz hxu
  have hyuniq : ∀ z, T.Adj y z → z = w := fun z hz ↦ hyleaf.unique hz hyw
  have hc := Fintype.card_congr (fourClassEquiv hxy hnadj hxu hyw hxuniq hyuniq k)
  have hc' := congrArg (fun n : ℕ ↦ (n : ℤ)) hc
  simpa [iCoeff, FourClasses, Nat.cast_add, add_assoc] using hc'

/-- C8-F2-02: exact two-leaf coefficient decomposition and its Delta corollary. -/
theorem two_leaf_four_class {T : SimpleGraph V} {x y u w : V}
    (hT : T.IsTree) (hcard : 3 ≤ Fintype.card V) (hxy : x ≠ y)
    (hxleaf : ∃! z, T.Adj x z) (hyleaf : ∃! z, T.Adj y z)
    (hxu : T.Adj x u) (hyw : T.Adj y w) :
    (∀ k : ℤ,
      iCoeff T Set.univ k =
        iCoeff T (HVerts x y) k +
        iCoeff T (HuVerts x y u) (k - 1) +
        iCoeff T (HwVerts x y w) (k - 1) +
        iCoeff T (CVerts x y u w) (k - 2)) ∧
    (∀ r : ℤ,
      delta T Set.univ r =
        delta T (HVerts x y) r +
        delta T (HuVerts x y u) (r - 1) +
        delta T (HwVerts x y w) (r - 1) +
        delta T (CVerts x y u w) (r - 2)) := by
  have hcoeff := coefficient_identity hT hcard hxy hxleaf hyleaf hxu hyw
  refine ⟨hcoeff, ?_⟩
  intro r
  simp only [delta]
  rw [hcoeff (r + 1), hcoeff r]
  have hr1 : r - 1 + 1 = r := by omega
  have hr2 : r - 2 + 1 = r - 1 := by omega
  have hr3 : r + 1 - 1 = r := by omega
  have hr4 : r + 1 - 2 = r - 1 := by omega
  rw [hr1, hr2, hr3, hr4]
  omega

end C8F202
