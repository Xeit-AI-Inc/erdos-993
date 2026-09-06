import R12C4T.CorridorIngredients
import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Combinatorics.SimpleGraph.Clique

open scoped Classical
noncomputable section

namespace RTree

/-- The inherited address carrier after deleting the closed neighborhood of `v`. -/
def c13DeletedVertices (t : RTree) (v : List Nat) : Finset (List Nat) :=
  t.vertices \ t.closedNbhd v

/-- The finite carrier of the C13 induced deletion, with inherited addresses. -/
abbrev C13DeletedCarrier (t : RTree) (v : List Nat) :=
  {x : List Nat // x ∈ t.c13DeletedVertices v}

/-- The exact inherited adjacency relation on the deleted carrier. -/
def c13DeletionGraph (t : RTree) (v : List Nat) :
    SimpleGraph (t.C13DeletedCarrier v) where
  Adj u w := addrAdjacent u.1 w.1
  symm := ⟨fun u w h => (addrAdjacent_comm u.1 w.1).mp h⟩
  loopless := ⟨fun u h => addrAdjacent_irrefl u.1 h⟩

@[simp]
theorem c13DeletionGraph_adj_iff (t : RTree) (v : List Nat)
    (u w : t.C13DeletedCarrier v) :
    (t.c13DeletionGraph v).Adj u w ↔ addrAdjacent u.1 w.1 :=
  Iff.rfl

/-- The same deletion as a vertex set inside the imported `toSimpleGraph`. -/
def c13DeletionSet (t : RTree) (v : List Nat) :
    Set {x : List Nat // x ∈ t.vertices} :=
  {x | x.1 ∈ t.c13DeletedVertices v}

/-- The direct deleted-address carrier and the imported induced carrier coincide. -/
def c13DeletionCarrierEquiv (t : RTree) (v : List Nat) :
    t.C13DeletedCarrier v ≃ t.c13DeletionSet v where
  toFun x := ⟨⟨x.1, (Finset.mem_sdiff.mp x.2).1⟩, x.2⟩
  invFun x := ⟨x.1.1, x.2⟩
  left_inv _ := rfl
  right_inv _ := rfl

/-- The address graph is exactly the imported graph induced on the deletion set. -/
def c13DeletionInduceIso (t : RTree) (v : List Nat) :
    t.c13DeletionGraph v ≃g t.toSimpleGraph.induce (t.c13DeletionSet v) where
  toEquiv := t.c13DeletionCarrierEquiv v
  map_rel_iff' := by rfl

/-- Foresthood follows once ambient address-graph acyclicity is supplied. -/
theorem c13DeletionGraph_isAcyclic_of_ambient (t : RTree) (v : List Nat)
    (h : t.toSimpleGraph.IsAcyclic) :
    (t.c13DeletionGraph v).IsAcyclic := by
  exact (t.c13DeletionInduceIso v).isAcyclic_iff.mpr
    (h.induce (t.c13DeletionSet v))

/-- Forgetting subtype proofs maps a carrier finset back to inherited addresses. -/
def c13AddressFinset (t : RTree) (v : List Nat)
    (A : Finset (t.C13DeletedCarrier v)) : Finset (List Nat) :=
  A.map (Function.Embedding.subtype _)

@[simp]
theorem c13AddressFinset_card (t : RTree) (v : List Nat)
    (A : Finset (t.C13DeletedCarrier v)) :
    (t.c13AddressFinset v A).card = A.card := by
  simp [c13AddressFinset]

theorem c13AddressFinset_subset (t : RTree) (v : List Nat)
    (A : Finset (t.C13DeletedCarrier v)) :
    t.c13AddressFinset v A ⊆ t.c13DeletedVertices v := by
  intro x hx
  change x ∈ A.map (Function.Embedding.subtype _) at hx
  obtain ⟨y, hy, rfl⟩ := Finset.mem_map.mp hx
  exact y.2

/-- Graph independence on the finite deletion is exactly imported `RTree.IndepSet`. -/
theorem c13DeletionGraph_indep_iff (t : RTree) (v : List Nat)
    (A : Finset (t.C13DeletedCarrier v)) :
    (t.c13DeletionGraph v).IsIndepSet (A : Set (t.C13DeletedCarrier v)) ↔
      t.IndepSet (t.c13AddressFinset v A) := by
  constructor
  · intro hA
    refine ⟨(t.c13AddressFinset_subset v A).trans Finset.sdiff_subset, ?_⟩
    intro u hu w hw hadj
    change u ∈ A.map (Function.Embedding.subtype _) at hu
    change w ∈ A.map (Function.Embedding.subtype _) at hw
    obtain ⟨u', hu', rfl⟩ := Finset.mem_map.mp hu
    obtain ⟨w', hw', rfl⟩ := Finset.mem_map.mp hw
    have hne : u' ≠ w' := by
      intro heq
      subst w'
      exact addrAdjacent_irrefl u'.1 hadj
    exact hA hu' hw' hne hadj
  · intro hA
    intro u hu w hw _hne hadj
    exact hA.2 u.1
      (Finset.mem_map.mpr ⟨u, hu, rfl⟩) w.1
      (Finset.mem_map.mpr ⟨w, hw, rfl⟩) hadj

/-- Carrier finsets are equivalent to address finsets contained in the deletion. -/
def c13FinsetCarrierEquiv (t : RTree) (v : List Nat) :
    Finset (t.C13DeletedCarrier v) ≃
      {S : Finset (List Nat) // S ⊆ t.c13DeletedVertices v} :=
  Equiv.finsetSubtypeComm (fun x : List Nat => x ∈ t.c13DeletedVertices v)

@[simp]
theorem c13FinsetCarrierEquiv_apply (t : RTree) (v : List Nat)
    (A : Finset (t.C13DeletedCarrier v)) :
    (t.c13FinsetCarrierEquiv v A).1 = t.c13AddressFinset v A :=
  rfl

@[simp]
theorem c13FinsetCarrierEquiv_card (t : RTree) (v : List Nat)
    (A : Finset (t.C13DeletedCarrier v)) :
    ((t.c13FinsetCarrierEquiv v A).1).card = A.card := by
  simp [c13FinsetCarrierEquiv, Equiv.finsetSubtypeComm]

/-- Rank-`r` independent sets correspond before taking cardinalities. -/
def c13RankedIndepEquiv (t : RTree) (v : List Nat) (r : Nat) :
    {A : Finset (t.C13DeletedCarrier v) //
      (t.c13DeletionGraph v).IsNIndepSet r A} ≃
    {S : {S : Finset (List Nat) // S ⊆ t.c13DeletedVertices v} //
      t.IndepSet S.1 ∧ S.1.card = r} :=
  (t.c13FinsetCarrierEquiv v).subtypeEquiv (fun A => by
    rw [SimpleGraph.isNIndepSet_iff]
    constructor
    · rintro ⟨hI, hc⟩
      refine ⟨?_, ?_⟩
      · simpa using (t.c13DeletionGraph_indep_iff v A).mp hI
      simpa using hc
    · rintro ⟨hI, hc⟩
      refine ⟨(t.c13DeletionGraph_indep_iff v A).mpr (by simpa using hI), ?_⟩
      simpa using hc)

/-- The address-side ranked family is exactly the filter used by `indepCountOn`. -/
def c13AddressRankedEquiv (t : RTree) (v : List Nat) (r : Nat) :
    {S : {S : Finset (List Nat) // S ⊆ t.c13DeletedVertices v} //
      t.IndepSet S.1 ∧ S.1.card = r} ≃
    {S : Finset (List Nat) //
      S ∈ (t.c13DeletedVertices v).powerset.filter
        (fun U => t.IndepSet U ∧ U.card = r)} where
  toFun S := ⟨S.1.1, Finset.mem_filter.mpr
    ⟨Finset.mem_powerset.mpr S.1.2, S.2⟩⟩
  invFun S := ⟨⟨S.1, Finset.mem_powerset.mp (Finset.mem_filter.mp S.2).1⟩,
    (Finset.mem_filter.mp S.2).2⟩
  left_inv _ := rfl
  right_inv _ := rfl

/-- Exact rankwise bijection between graph independent sets and `indepCountOn` objects. -/
def c13IndepCountEquiv (t : RTree) (v : List Nat) (r : Nat) :
    {A : Finset (t.C13DeletedCarrier v) //
      A ∈ (t.c13DeletionGraph v).indepSetFinset r} ≃
    {S : Finset (List Nat) //
      S ∈ (t.c13DeletedVertices v).powerset.filter
        (fun U => t.IndepSet U ∧ U.card = r)} :=
  ((Equiv.refl (Finset (t.C13DeletedCarrier v))).subtypeEquiv
      (fun A => SimpleGraph.mem_indepSetFinset_iff)).trans
    ((t.c13RankedIndepEquiv v r).trans (t.c13AddressRankedEquiv v r))

/-- The induced-deletion graph count is the existing address-model count. -/
theorem c13DeletionGraph_indep_count_eq (t : RTree) (v : List Nat) (r : Nat) :
    ((t.c13DeletionGraph v).indepSetFinset r).card =
      t.indepCountOn (t.vertices \ t.closedNbhd v) r := by
  unfold RTree.indepCountOn c13DeletedVertices
  calc
    _ = Fintype.card
        {A // A ∈ (t.c13DeletionGraph v).indepSetFinset r} :=
      (Fintype.card_coe _).symm
    _ = Fintype.card
        {S // S ∈ (t.vertices \ t.closedNbhd v).powerset.filter
          (fun U => t.IndepSet U ∧ U.card = r)} :=
      Fintype.card_congr (t.c13IndepCountEquiv v r)
    _ = _ := Fintype.card_coe _

end RTree
