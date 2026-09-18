import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition C4LA1.vertexDeletionIndepSetCount 7e0a588e243735a611c919ea1080816911a3e27e4523478af0c0f560ce1b3b48
namespace C4LA1

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The coefficient `i_k(G-v)`, represented without changing vertex types:
independent `k`-subsets of the original finite vertex type that avoid `v`. -/
def vertexDeletionIndepSetCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (v : V) (k : Nat) : Nat :=
  (((Finset.univ.erase v).powersetCard k).filter fun s : Finset V =>
    G.IsIndepSet (s : Set V)).card

end C4LA1
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition C4LA1.vertexDeletionForwardDifference c2da50eb16ee788c439b146577efeedd7dd42811c6943fb437585edcf63b5880
namespace C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The forward coefficient difference `i_(p+1)(G-v) - i_p(G-v)`, with
natural counts embedded in the integers. -/
def vertexDeletionForwardDifference (G : SimpleGraph V) [DecidableRel G.Adj]
    (v : V) (p : Nat) : Int :=
  (vertexDeletionIndepSetCount G v (p + 1) : Int) -
    vertexDeletionIndepSetCount G v p

end C4LA1
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition C4LA1.IsFavorableAt 25d8f7d274f9080468bf6d46acc6db3d4a469c2e399e7faee6cdcee24290a0db
namespace C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Literal strict favorability of an original leaf at rank `p`. -/
def IsFavorableAt (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) (p : Nat) : Prop :=
  vertexDeletionForwardDifference G v p < 0

end C4LA1
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition C4LA1.IsGraphLeaf 65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5
namespace C4LA1

variable {V : Type*}

/-- A graph leaf has exactly one adjacent vertex. -/
def IsGraphLeaf (G : SimpleGraph V) (v : V) : Prop :=
  ∃! u, G.Adj v u

end C4LA1
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN lemma C4LA1.isIndepSet_insert_of_unique_neighbor 792665784226f42ee4138c1863f5db0312fee1122546999a8b85206666405f78
namespace C4LA1

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma isIndepSet_insert_of_unique_neighbor {G : SimpleGraph V} {v u : V}
    {s : Finset V} (huniq : forall w, G.Adj v w -> w = u)
    (hs : G.IsIndepSet (s : Set V)) (hv : v ∉ s) (hu : u ∉ s) :
    G.IsIndepSet ((insert v s : Finset V) : Set V) := by
  rw [SimpleGraph.isIndepSet_iff]
  simp only [Finset.coe_insert]
  rw [Set.pairwise_insert_of_notMem (by simpa using hv)]
  refine ⟨hs, ?_⟩
  intro w hw
  constructor
  · intro hvw
    exact hu (huniq w hvw ▸ hw)
  · intro hwv
    exact hu (huniq w hwv.symm ▸ hw)

end C4LA1
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN lemma C4LA1.support_mem_of_max_indep_avoids_leaf 49d38e011acf4223e557be333e8cc99f9bf41d31f1d425d4ec4c6743f0cf3935
namespace C4LA1

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma support_mem_of_max_indep_avoids_leaf {G : SimpleGraph V} {v u : V}
    {s : Finset V} (huniq : forall w, G.Adj v w -> w = u)
    (hs : G.IsIndepSet (s : Set V)) (hcard : s.card = G.indepNum) (hv : v ∉ s) :
    u ∈ s := by
  by_contra hu
  have hins := isIndepSet_insert_of_unique_neighbor huniq hs hv hu
  have hle := hins.card_le_indepNum
  rw [Finset.card_insert_of_notMem hv, hcard] at hle
  omega

end C4LA1
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN lemma C4LA1.exists_maximum_indepSet_containing_leaf 7aa899bcbaba4534e07c8da5ba513a51a932c99ab5c1866319fc7e6bbdddc637
namespace C4LA1

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma exists_maximum_indepSet_containing_leaf {G : SimpleGraph V} {v : V}
    (hAlpha : 2 ≤ G.indepNum) (hvLeaf : IsGraphLeaf G v) :
    ∃ s : Finset V, G.IsIndepSet (s : Set V) ∧ s.card = G.indepNum ∧ v ∈ s := by
  classical
  obtain ⟨u, _hvu, huniq⟩ := hvLeaf
  obtain ⟨s, hs⟩ := G.exists_isNIndepSet_indepNum
  by_cases hv : v ∈ s
  · exact ⟨s, hs.isIndepSet, hs.card_eq, hv⟩
  · have hu : u ∈ s :=
      support_mem_of_max_indep_avoids_leaf huniq hs.isIndepSet hs.card_eq hv
    let t := insert v (s.erase u)
    have herase : G.IsIndepSet ((s.erase u : Finset V) : Set V) :=
      Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_erase hx) hs.isIndepSet
    have ht : G.IsIndepSet (t : Set V) :=
      isIndepSet_insert_of_unique_neighbor huniq herase (by simp [t, hv]) (by simp [t])
    refine ⟨t, ht, ?_, by simp [t]⟩
    simp [t, hv, hu, hs.card_eq]
    omega

end C4LA1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN theorem C4LA1.topRankSelectorCollapse 16594cf6ea305f718a4bb6f7ed12653be6e2b07007c9a57ce888aefe0f95be9c
namespace C4LA1

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

theorem topRankSelectorCollapse (G : SimpleGraph V) [DecidableRel G.Adj]
    (_hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) (v : V)
    (hvLeaf : IsGraphLeaf G v) :
    IsFavorableAt G v (G.indepNum - 1) := by
  classical
  obtain ⟨u, hvu, huniq⟩ := hvLeaf
  let a := G.indepNum
  let A := ((Finset.univ.erase v).powersetCard a).filter fun s : Finset V =>
    G.IsIndepSet (s : Set V)
  let B := ((Finset.univ.erase v).powersetCard (a - 1)).filter fun s : Finset V =>
    G.IsIndepSet (s : Set V)
  let E := A.image fun s : Finset V => s.erase u

  have member_A_support {s : Finset V} (hsA : s ∈ A) : u ∈ s := by
    have hsA' := hsA
    simp only [A, Finset.mem_filter, Finset.mem_powersetCard] at hsA'
    have hv : v ∉ s := by
      intro hvs
      have := hsA'.1.1 hvs
      simpa using this
    exact support_mem_of_max_indep_avoids_leaf huniq hsA'.2 hsA'.1.2 hv

  have hEsub : E ⊆ B := by
    intro t ht
    rcases Finset.mem_image.mp ht with ⟨s, hsA, rfl⟩
    have hsA' := hsA
    simp only [A, Finset.mem_filter, Finset.mem_powersetCard] at hsA'
    have hu : u ∈ s := member_A_support hsA
    simp only [B, Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨?_, ?_⟩, ?_⟩
    · intro x hx
      have hxs : x ∈ s := Finset.mem_of_mem_erase hx
      exact Finset.mem_of_subset hsA'.1.1 hxs
    · rw [Finset.card_erase_of_mem hu, hsA'.1.2]
    · exact Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_erase hx) hsA'.2

  have hEinj : Set.InjOn (fun s : Finset V => s.erase u) (A : Set (Finset V)) := by
    intro s hs t ht hst
    have hus : u ∈ s := member_A_support hs
    have hut : u ∈ t := member_A_support ht
    calc
      s = insert u (s.erase u) := (Finset.insert_erase hus).symm
      _ = insert u (t.erase u) := congrArg (insert u) hst
      _ = t := Finset.insert_erase hut

  obtain ⟨M, hMind, hMcard, hvM⟩ :=
    exists_maximum_indepSet_containing_leaf hAlpha ⟨u, hvu, huniq⟩
  have huM : u ∉ M := by
    intro huM
    exact (hMind huM hvM hvu.ne.symm) hvu.symm
  let H := M.erase v
  have hHcard : H.card = a - 1 := by
    simp [H, Finset.card_erase_of_mem hvM, hMcard, a]
  have hHmemB : H ∈ B := by
    simp only [B, Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨?_, hHcard⟩, ?_⟩
    · intro x hx
      exact Finset.mem_erase.mpr ⟨(Finset.mem_erase.mp hx).1, Finset.mem_univ x⟩
    · exact Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_erase hx) hMind

  have hEproper : E ⊂ B := by
    refine Finset.ssubset_iff_subset_ne.mpr ⟨hEsub, ?_⟩
    intro hEB
    have hHmemE : H ∈ E := hEB.symm ▸ hHmemB
    rcases Finset.mem_image.mp hHmemE with ⟨S, hSA, hSerase⟩
    have huS : u ∈ S := member_A_support hSA
    have hSind : G.IsIndepSet (S : Set V) := by
      have hSA' := hSA
      simp only [A, Finset.mem_filter, Finset.mem_powersetCard] at hSA'
      exact hSA'.2
    have hS_eq : S = insert u H := by
      calc
        S = insert u (S.erase u) := (Finset.insert_erase huS).symm
        _ = insert u H := congrArg (insert u) hSerase
    have hHpos : 0 < H.card := by
      rw [hHcard]
      omega
    obtain ⟨w, hwH⟩ := Finset.card_pos.mp hHpos
    let K := insert u (H.erase w)
    have huH : u ∉ H := by
      intro huH
      exact huM (Finset.mem_of_mem_erase huH)
    have hKind : G.IsIndepSet (K : Set V) := by
      have hKsub : K ⊆ S := by
        intro x hx
        rw [hS_eq]
        have hx' : x = u ∨ x ∈ H.erase w := by simpa [K] using hx
        rcases hx' with hxu | hx
        · exact Finset.mem_insert.mpr (Or.inl hxu)
        · exact Finset.mem_insert_of_mem (Finset.mem_of_mem_erase hx)
      exact Set.Pairwise.mono (by intro x hx; exact hKsub hx) hSind
    have hKmemB : K ∈ B := by
      simp only [B, Finset.mem_filter, Finset.mem_powersetCard]
      refine ⟨⟨?_, ?_⟩, hKind⟩
      · intro x hx
        have hx' : x = u ∨ x ∈ H.erase w := by simpa [K] using hx
        rcases hx' with hxu | hx
        · exact Finset.mem_erase.mpr ⟨by simpa [hxu] using hvu.ne.symm, Finset.mem_univ x⟩
        · have hxH : x ∈ H := Finset.mem_of_mem_erase hx
          exact Finset.mem_erase.mpr ⟨(Finset.mem_erase.mp hxH).1, Finset.mem_univ x⟩
      · have huErase : u ∉ H.erase w := by simp [huH]
        rw [show K = insert u (H.erase w) by rfl,
          Finset.card_insert_of_notMem huErase, Finset.card_erase_of_mem hwH, hHcard]
        omega
    have hKnotE : K ∉ E := by
      intro hKE
      rcases Finset.mem_image.mp hKE with ⟨S', _, hS'K⟩
      have huK : u ∈ K := by simp [K]
      rw [← hS'K] at huK
      exact Finset.notMem_erase u S' huK
    exact hKnotE (hEB ▸ hKmemB)

  have hcard : A.card < B.card := by
    have himage : E.card = A.card := by
      exact Finset.card_image_of_injOn hEinj
    rw [← himage]
    exact Finset.card_lt_card hEproper

  have hcardInt : (A.card : Int) - B.card < 0 :=
    sub_neg.mpr (by exact_mod_cast hcard)
  simpa [IsFavorableAt, vertexDeletionForwardDifference, vertexDeletionIndepSetCount,
    A, B, a, Nat.sub_add_cancel (by omega : 1 ≤ G.indepNum)] using hcardInt

end C4LA1
-- VERITYOS ENTRY 8 END

