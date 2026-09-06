import R12C6T.Targets

open scoped Classical
noncomputable section
namespace RTree

/-- Single-vertex deletion for independent-set counts inside an arbitrary
carrier inherited from the ambient tree. -/
theorem stage7_indepCountOn_succ_within (t : RTree) {V : Finset (List ℕ)}
    (hV : V ⊆ t.vertices) {z : List ℕ} (hz : z ∈ V) (r : ℕ) :
    t.indepCountOn V (r + 1) =
      t.indepCountOn (V.erase z) (r + 1) +
        t.indepCountOn (V \ t.closedNbhd z) r := by
  have hzt : z ∈ t.vertices := hV hz
  unfold RTree.indepCountOn
  have hRight :
      (V.powerset.filter (fun S => t.IndepSet S ∧ S.card = r + 1)).filter
          (fun S => z ∉ S) =
        (V.erase z).powerset.filter (fun S => t.IndepSet S ∧ S.card = r + 1) := by
    ext S
    simp only [Finset.mem_filter, Finset.mem_powerset]
    constructor
    · rintro ⟨⟨hsub, hI⟩, hz'⟩
      exact ⟨Finset.subset_erase.mpr ⟨hsub, hz'⟩, hI⟩
    · rintro ⟨hsub, hI⟩
      have hsub' : S ⊆ V := hsub.trans (Finset.erase_subset _ _)
      exact ⟨⟨hsub', hI⟩, (Finset.subset_erase.mp hsub).2⟩
  have hzcn : z ∈ t.closedNbhd z :=
    (mem_closedNbhd_iff t z z).mpr ⟨hzt, Or.inl rfl⟩
  have hLeft :
      ((V.powerset.filter (fun S => t.IndepSet S ∧ S.card = r + 1)).filter
          (fun S => z ∈ S)).card =
        ((V \ t.closedNbhd z).powerset.filter
          (fun S => t.IndepSet S ∧ S.card = r)).card := by
    apply Finset.card_bij' (fun S _ => S.erase z) (fun S' _ => insert z S')
    · intro S hS
      simp only [Finset.mem_filter, Finset.mem_powerset] at hS
      obtain ⟨⟨-, -, -⟩, hzS⟩ := hS
      exact Finset.insert_erase hzS
    · intro S' hS'
      simp only [Finset.mem_filter, Finset.mem_powerset] at hS'
      obtain ⟨hsub, -, -⟩ := hS'
      have hzS' : z ∉ S' := fun hmem => (Finset.mem_sdiff.mp (hsub hmem)).2 hzcn
      exact Finset.erase_insert hzS'
    · intro S hS
      simp only [Finset.mem_filter, Finset.mem_powerset] at hS
      obtain ⟨⟨hsub, hI, hcardS⟩, hzS⟩ := hS
      have hsubT : S.erase z ⊆ V \ t.closedNbhd z := by
        intro w hw
        have hwS : w ∈ S := Finset.mem_of_mem_erase hw
        have hwz : w ≠ z := Finset.ne_of_mem_erase hw
        have hwv : w ∈ V := hsub hwS
        rw [Finset.mem_sdiff, mem_closedNbhd_iff]
        refine ⟨hwv, ?_⟩
        rintro ⟨-, rfl | hadj⟩
        · exact hwz rfl
        · exact hI.2 z hzS w hwS hadj
      have hIndep : t.IndepSet (S.erase z) := hI.mono (Finset.erase_subset _ _)
      have hcardE : (S.erase z).card = r := by
        rw [Finset.card_erase_of_mem hzS]
        omega
      simp only [Finset.mem_filter, Finset.mem_powerset]
      exact ⟨hsubT, hIndep, hcardE⟩
    · intro S' hS'
      simp only [Finset.mem_filter, Finset.mem_powerset] at hS'
      obtain ⟨hsub, hI, hcard⟩ := hS'
      have hzS' : z ∉ S' := fun hmem => (Finset.mem_sdiff.mp (hsub hmem)).2 hzcn
      have hsubV : insert z S' ⊆ V :=
        Finset.insert_subset hz (hsub.trans Finset.sdiff_subset)
      have hIndep : t.IndepSet (insert z S') := by
        refine ⟨hsubV.trans hV, ?_⟩
        intro u hu w hw hadj
        rcases Finset.mem_insert.mp hu with hu0 | hu'
        · rcases Finset.mem_insert.mp hw with hw0 | hw'
          · rw [hu0, hw0] at hadj
            exact absurd hadj (addrAdjacent_irrefl z)
          · have hwmem := Finset.mem_sdiff.mp (hsub hw')
            rw [hu0] at hadj
            exact hwmem.2 ((mem_closedNbhd_iff t z w).mpr
              ⟨hV hwmem.1, Or.inr hadj⟩)
        · rcases Finset.mem_insert.mp hw with hw0 | hw'
          · have humem := Finset.mem_sdiff.mp (hsub hu')
            rw [hw0] at hadj
            exact humem.2 ((mem_closedNbhd_iff t z u).mpr
              ⟨hV humem.1, Or.inr ((addrAdjacent_comm u z).mp hadj)⟩)
          · exact hI.2 u hu' w hw' hadj
      have hcardI : (insert z S').card = r + 1 := by
        rw [Finset.card_insert_of_notMem hzS', hcard]
      simp only [Finset.mem_filter, Finset.mem_powerset]
      exact ⟨⟨hsubV, hIndep, hcardI⟩, Finset.mem_insert_self z S'⟩
  have hsplit :=
    Finset.card_filter_add_card_filter_not
      (s := V.powerset.filter (fun S => t.IndepSet S ∧ S.card = r + 1))
      (fun S => z ∈ S)
  rw [hRight] at hsplit
  rw [hLeft] at hsplit
  omega

/-- A known neighbor of a degree-two vertex has exactly one other neighbor. -/
theorem stage7_exists_unique_otherNeighbor (t : RTree) {s v : List ℕ}
    (hv : v ∈ t.vertices) (hsv : addrAdjacent s v) (hdeg2 : t.degree s = 2) :
    ∃! y, y ≠ v ∧ addrAdjacent s y ∧ y ∈ t.vertices := by
  unfold RTree.degree at hdeg2
  have hvNs : v ∈ t.vertices.filter (fun w => addrAdjacent s w) :=
    Finset.mem_filter.mpr ⟨hv, hsv⟩
  have hcard1 : ((t.vertices.filter (fun w => addrAdjacent s w)).erase v).card = 1 := by
    rw [Finset.card_erase_of_mem hvNs, hdeg2]
  obtain ⟨y, hy⟩ := Finset.card_eq_one.mp hcard1
  have hymem : y ∈ (t.vertices.filter (fun w => addrAdjacent s w)).erase v := by
    rw [hy]
    exact Finset.mem_singleton_self y
  have hyNs : y ∈ t.vertices.filter (fun w => addrAdjacent s w) :=
    Finset.mem_of_mem_erase hymem
  refine ⟨y, ⟨(Finset.mem_erase.mp hymem).1, (Finset.mem_filter.mp hyNs).2,
      (Finset.mem_filter.mp hyNs).1⟩, ?_⟩
  rintro y' ⟨hne, hadj, hmem⟩
  have hy'mem : y' ∈ (t.vertices.filter (fun w => addrAdjacent s w)).erase v :=
    Finset.mem_erase.mpr ⟨hne, Finset.mem_filter.mpr ⟨hmem, hadj⟩⟩
  rw [hy] at hy'mem
  exact Finset.mem_singleton.mp hy'mem

/-- The degree-two support has closed neighborhood exactly `{s, v, y}`. -/
theorem stage7_closedNbhd_eq_of_degree_two (t : RTree) {s v y : List ℕ}
    (hs : s ∈ t.vertices) (hv : v ∈ t.vertices) (hsv : addrAdjacent s v)
    (hy : y ≠ v ∧ addrAdjacent s y ∧ y ∈ t.vertices)
    (hdeg2 : t.degree s = 2) :
    t.closedNbhd s = {s, v, y} := by
  have huniq := t.stage7_exists_unique_otherNeighbor hv hsv hdeg2
  ext w
  rw [mem_closedNbhd_iff]
  simp only [Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨hwt, rfl | hadj⟩
    · exact Or.inl rfl
    · by_cases hwv : w = v
      · exact Or.inr (Or.inl hwv)
      · exact Or.inr (Or.inr (huniq.unique ⟨hwv, hadj, hwt⟩ hy))
  · rintro (rfl | rfl | rfl)
    · exact ⟨hs, Or.inl rfl⟩
    · exact ⟨hv, Or.inr hsv⟩
    · exact ⟨hy.2.2, Or.inr hy.2.1⟩

/-- Exact support-degree-two deletion and gap reduction.

For the bound carriers
`A = T - {v,s}`, `B = T - N[s]`, and `D = A - N[y]`, the first conjunct is
`g_r = d_(r-1)` at every positive rank. The second and third conjuncts are
the canonical `b`/`Bgen` gap identity and its non-strict sign equivalence. -/
theorem supportDegreeTwoGapReduction (t : RTree) {v s y : List ℕ}
    (hv : v ∈ t.leaves) (hsupport : s = t.support v)
    (hdeg2 : t.degree s = 2) (hyv : y ≠ v)
    (hsy : addrAdjacent s y) (hymem : y ∈ t.vertices)
    {p : ℕ} (hp : 2 ≤ p) :
    let A := (t.vertices.erase v).erase s
    let B := t.vertices \ t.closedNbhd s
    let D := A \ t.closedNbhd y
    (∀ r : ℕ, 1 ≤ r →
      (t.indepCountOn A r : ℤ) - (t.indepCountOn B r : ℤ) =
        (t.indepCountOn D (r - 1) : ℤ)) ∧
    t.b v p - t.Bgen s ((p : ℤ) - 1) =
      (t.indepCountOn D (p - 1) : ℤ) - (t.indepCountOn D (p - 2) : ℤ) ∧
    (t.b v p ≤ t.Bgen s ((p : ℤ) - 1) ↔
      t.indepCountOn D (p - 1) ≤ t.indepCountOn D (p - 2)) := by
  subst s
  let A : Finset (List ℕ) := (t.vertices.erase v).erase (t.support v)
  let B : Finset (List ℕ) := t.vertices \ t.closedNbhd (t.support v)
  let D : Finset (List ℕ) := A \ t.closedNbhd y
  change
    (∀ r : ℕ, 1 ≤ r →
      (t.indepCountOn A r : ℤ) - (t.indepCountOn B r : ℤ) =
        (t.indepCountOn D (r - 1) : ℤ)) ∧
    t.b v p - t.Bgen (t.support v) ((p : ℤ) - 1) =
      (t.indepCountOn D (p - 1) : ℤ) - (t.indepCountOn D (p - 2) : ℤ) ∧
    (t.b v p ≤ t.Bgen (t.support v) ((p : ℤ) - 1) ↔
      t.indepCountOn D (p - 1) ≤ t.indepCountOn D (p - 2))
  have hvmem : v ∈ t.vertices := (t.mem_leaves_iff v).mp hv |>.1
  have hsmem : t.support v ∈ t.vertices := t.support_mem_vertices hv
  have hsv : addrAdjacent (t.support v) v :=
    (addrAdjacent_comm v (t.support v)).mp (t.support_adjacent hv)
  have hclosed : t.closedNbhd (t.support v) = {t.support v, v, y} :=
    t.stage7_closedNbhd_eq_of_degree_two hsmem hvmem hsv
      ⟨hyv, hsy, hymem⟩ hdeg2
  have hB_eq : B = A.erase y := by
    dsimp [A, B]
    rw [hclosed]
    ext w
    simp only [Finset.mem_sdiff, Finset.mem_insert, Finset.mem_singleton,
      Finset.mem_erase]
    tauto
  have hys : y ≠ t.support v := by
    intro hyEq
    rw [hyEq] at hsy
    exact addrAdjacent_irrefl (t.support v) hsy
  have hyA : y ∈ A := by
    dsimp [A]
    exact Finset.mem_erase.mpr
      ⟨hys, Finset.mem_erase.mpr ⟨hyv, hymem⟩⟩
  have hAsub : A ⊆ t.vertices := by
    dsimp [A]
    exact (Finset.erase_subset (t.support v) (t.vertices.erase v)).trans
      (Finset.erase_subset v t.vertices)
  have hgap : ∀ r : ℕ, 1 ≤ r →
      (t.indepCountOn A r : ℤ) - (t.indepCountOn B r : ℤ) =
        (t.indepCountOn D (r - 1) : ℤ) := by
    intro r hr
    have hrec := t.stage7_indepCountOn_succ_within hAsub hyA (r - 1)
    have hrank : r - 1 + 1 = r := by omega
    rw [hrank, ← hB_eq] at hrec
    change t.indepCountOn A r =
      t.indepCountOn B r + t.indepCountOn D (r - 1) at hrec
    omega
  have hpredZ : (p : ℤ) - 1 = ((p - 1 : ℕ) : ℤ) := by omega
  have hsuccPred : p - 1 + 1 = p := by omega
  have hb : t.b v p =
      (t.indepCountOn A p : ℤ) - (t.indepCountOn A (p - 1) : ℤ) := by
    unfold RTree.b RTree.bZ
    rw [hpredZ, DeltaOnZ_natCast]
    unfold RTree.DeltaOn
    rw [hsuccPred]
    rfl
  have hBgen : t.Bgen (t.support v) ((p : ℤ) - 1) =
      (t.indepCountOn B p : ℤ) - (t.indepCountOn B (p - 1) : ℤ) := by
    unfold RTree.Bgen
    rw [hpredZ, DeltaOnZ_natCast]
    unfold RTree.DeltaOn
    rw [hsuccPred]
  have hgapP := hgap p (by omega)
  have hgapPred := hgap (p - 1) (by omega)
  have hpredPred : (p - 1) - 1 = p - 2 := by omega
  rw [hpredPred] at hgapPred
  have hmain : t.b v p - t.Bgen (t.support v) ((p : ℤ) - 1) =
      (t.indepCountOn D (p - 1) : ℤ) - (t.indepCountOn D (p - 2) : ℤ) := by
    omega
  refine ⟨hgap, hmain, ?_⟩
  constructor <;> intro h <;> omega

end RTree
end
