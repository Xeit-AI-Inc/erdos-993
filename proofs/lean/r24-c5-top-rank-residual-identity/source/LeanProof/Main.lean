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

-- VERITYOS ENTRY 5 BEGIN definition C5LA1.support 8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The unique support (neighbour) of an original leaf `v`; unconstrained
(any value satisfying nothing further) off the leaf set. -/
noncomputable
def support (G : SimpleGraph V) (v : V) : V :=
  Classical.choose (p := fun u => C4LA1.IsGraphLeaf G v → G.Adj v u ∧ ∀ w, G.Adj v w → w = u)
    (by
      by_cases h : C4LA1.IsGraphLeaf G v
      · obtain ⟨u, hu, huniq⟩ := h
        exact ⟨u, fun _ => ⟨hu, huniq⟩⟩
      · exact ⟨v, fun hc => absurd hc h⟩)

end C5LA1
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition C5LA1.leafSet 78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- The set of original leaves of `G`. -/
noncomputable
def leafSet (G : SimpleGraph V) : Finset V :=
  Finset.univ.filter (C4LA1.IsGraphLeaf G)

end C5LA1
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition C5LA1.leafDegree ccfc9b2f549aa8c9986931152d249096ce49e3ccd3b67f4afd8678a749d93a68
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `lambda(s)`: the number of leaves of `G` adjacent to `s`, zero off
supports. -/
noncomputable
def leafDegree (G : SimpleGraph V) [DecidableRel G.Adj] (s : V) : Nat :=
  ((leafSet G).filter fun v => G.Adj v s).card

end C5LA1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition C5LA1.H 55f37d9161901d6006e571cf548c4e56675c9d786a1aba83e7889ad9d443224d
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `H_v = G - {v, s_v}`, realised as the deletion set for a leaf `v`. -/
noncomputable
def H (G : SimpleGraph V) (v : V) : Finset V :=
  {v, support G v}

end C5LA1
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition C5LA1.R a0407d82ab112a65a0f9d85970e9d6217b66201680cc079a4ba13751e53dc6b8
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `R_v = G - N[s_v]`, realised as the deletion set for a leaf `v`. -/
noncomputable
def R (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) : Finset V :=
  insert (support G v) (G.neighborFinset (support G v))

end C5LA1
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN definition C5LA1.indepSetsAvoiding ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `I_k(G - D)`: independent `k`-subsets of the original vertex type
avoiding the finite deletion set `D`. -/
def indepSetsAvoiding (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Finset (Finset V) :=
  ((Finset.univ \ D).powersetCard k).filter fun s : Finset V => G.IsIndepSet (s : Set V)

end C5LA1
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN definition C5LA1.indepSetCount e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `i_k(G - D)`. -/
def indepSetCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Nat :=
  (indepSetsAvoiding G D k).card

end C5LA1
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN definition C5LA1.forwardDifferenceDel 60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `Delta_k(G - D) = i_(k+1)(G-D) - i_k(G-D)`. -/
def forwardDifferenceDel (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Int :=
  (indepSetCount G D (k + 1) : Int) - indepSetCount G D k

end C5LA1
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN definition C5LA1.aggregate d66e776c5cf49b2a78a2d9713e4a41de2cbaf5de0af7b6d580075064d1daea8b
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- `S(G,p) = sum_{v in F} (b_v - B_v)`, the literal top-rank residual
aggregate, summed over the favorable filter of the leaf set. -/
noncomputable
def aggregate (G : SimpleGraph V) [DecidableRel G.Adj] (p : Nat) : Int :=
  ∑ v ∈ (leafSet G).filter fun v => C4LA1.IsFavorableAt G v p,
    (forwardDifferenceDel G (H G v) (p - 1) - forwardDifferenceDel G (R G v) (p - 1))

end C5LA1
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN definition C5LA1.crossingIndex 378868ab2e660af8a36ea0b1045c55bc60f8383dca3d31dd85c4b52fa8a898fb
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- `x(G)`: the least `k` with `Delta_k(G) < 0`; exists because
`Delta_(alpha)(G) = -i_alpha(G) < 0`. -/
noncomputable
def crossingIndex (G : SimpleGraph V) [DecidableRel G.Adj] : Nat :=
  Nat.find (p := fun k => forwardDifferenceDel G ∅ k < 0)
    (by
      classical
      obtain ⟨s, hs⟩ := G.exists_isNIndepSet_indepNum
      refine ⟨G.indepNum, ?_⟩
      have hzero : indepSetCount G ∅ (G.indepNum + 1) = 0 := by
        have hempty : indepSetsAvoiding G ∅ (G.indepNum + 1) = ∅ := by
          rw [Finset.eq_empty_iff_forall_notMem]
          intro t ht
          simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard] at ht
          have hle : t.card ≤ G.indepNum := ht.2.card_le_indepNum
          omega
        rw [indepSetCount, hempty, Finset.card_empty]
      have hpos : 0 < indepSetCount G ∅ G.indepNum := by
        rw [indepSetCount, Finset.card_pos]
        refine ⟨s, ?_⟩
        simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard]
        refine ⟨⟨?_, hs.card_eq⟩, hs.isIndepSet⟩
        intro x _
        simp
      simp only [forwardDifferenceDel, hzero]
      omega)

end C5LA1
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma C4LA1.isIndepSet_insert_of_unique_neighbor 792665784226f42ee4138c1863f5db0312fee1122546999a8b85206666405f78
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
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma C4LA1.support_mem_of_max_indep_avoids_leaf 49d38e011acf4223e557be333e8cc99f9bf41d31f1d425d4ec4c6743f0cf3935
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
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma C4LA1.exists_maximum_indepSet_containing_leaf 7aa899bcbaba4534e07c8da5ba513a51a932c99ab5c1866319fc7e6bbdddc637
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
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma C4LA1.topRankSelectorCollapse e9ffbcfbaf88ffd14aad1288a5add8057a2d92bd0845e816ca17f08b37a32a9e
namespace C4LA1

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma topRankSelectorCollapse (G : SimpleGraph V) [DecidableRel G.Adj]
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
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma C5LA1.support_spec 70b0781d1f99e74a3b34849eadd081b15d9968f177ef1e147c25765e186069fb
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma support_spec {G : SimpleGraph V} {v : V} (hv : C4LA1.IsGraphLeaf G v) :
    G.Adj v (support G v) ∧ ∀ y, G.Adj v y → y = support G v := by
  unfold support
  exact Classical.choose_spec
    (p := fun u => C4LA1.IsGraphLeaf G v → G.Adj v u ∧ ∀ w, G.Adj v w → w = u)
    (by
      by_cases h : C4LA1.IsGraphLeaf G v
      · obtain ⟨u, hu, huniq⟩ := h
        exact ⟨u, fun _ => ⟨hu, huniq⟩⟩
      · exact ⟨v, fun hc => absurd hc h⟩) hv

end C5LA1
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma C5LA1.adj_iff_support_eq f12f82bc757ccd70f1eea5e3aa5759bd654fb7d4088a5360e04cc098a202a81e
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma adj_iff_support_eq {G : SimpleGraph V} {v s : V} (hv : C4LA1.IsGraphLeaf G v) :
    G.Adj v s ↔ support G v = s := by
  constructor
  · intro h
    exact ((support_spec hv).2 s h).symm
  · intro h
    rw [← h]
    exact (support_spec hv).1

end C5LA1
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma C5LA1.support_ne_self 8cf3e2ee51f18d50c6b6c4a2dd74dd68783a94c1013337b7d1ae88aceeee0462
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma support_ne_self {G : SimpleGraph V} {v : V} (hv : C4LA1.IsGraphLeaf G v) :
    support G v ≠ v := by
  intro h
  have hadj : G.Adj v (support G v) := (support_spec hv).1
  rw [h] at hadj
  exact (G.ne_of_adj hadj) rfl

end C5LA1
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma C5LA1.leafDegree_eq_filter_support 53119a540f36ad19dd43c9dd7b7a5761e9eef2fdd92425606b8a92e8ff5e1597
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma leafDegree_eq_filter_support {G : SimpleGraph V} [DecidableRel G.Adj] (s : V) :
    leafDegree G s = ((leafSet G).filter fun v => support G v = s).card := by
  unfold leafDegree
  congr 1
  apply Finset.filter_congr
  intro v hv
  simp only [leafSet, Finset.mem_filter, Finset.mem_univ, true_and] at hv
  exact ⟨fun h => (adj_iff_support_eq hv).1 h, fun h => (adj_iff_support_eq hv).2 h⟩

end C5LA1
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma C5LA1.sum_card_filter_comm 8a2d0fcef47481141c9b03c55648c36181f4dde28ed2dd5ed1d8d96bc4b0f59e
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma sum_card_filter_comm {α β : Type*} [DecidableEq α] [DecidableEq β]
    (s : Finset α) (t : Finset β) (r : α → β → Prop) [∀ a b, Decidable (r a b)] :
    ∑ a ∈ s, (t.filter fun b => r a b).card = ∑ b ∈ t, (s.filter fun a => r a b).card := by
  simp_rw [Finset.card_filter]
  rw [Finset.sum_comm]

end C5LA1
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma C5LA1.H_bijection_card 5baf8f1fd00f875f31b82aeda3961b2524d1a8a971f311c126f6d0b1c3db7edd
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma H_bijection_card {G : SimpleGraph V} [DecidableRel G.Adj] {v : V}
    (hv : C4LA1.IsGraphLeaf G v) (k : Nat) :
    indepSetCount G (H G v) k
      = ((indepSetsAvoiding G ∅ (k + 1)).filter fun B => v ∈ B).card := by
  have hvs : G.Adj v (support G v) := (support_spec hv).1
  have hsuniq : ∀ w, G.Adj v w → w = support G v := (support_spec hv).2
  have hvne : v ≠ support G v := fun h => (G.ne_of_adj hvs) h
  unfold indepSetCount
  apply Finset.card_nbij' (fun C => insert v C) (fun B => B.erase v)
  · intro C hC
    simp only [Finset.mem_coe, indepSetsAvoiding, Finset.mem_filter,
      Finset.mem_powersetCard] at hC
    obtain ⟨⟨hCsub, hCcard⟩, hCind⟩ := hC
    have hvC : v ∉ C := by
      intro hmem
      exact absurd (hCsub hmem) (by simp [H])
    have hsC : support G v ∉ C := by
      intro hmem
      exact absurd (hCsub hmem) (by simp [H])
    have hind : G.IsIndepSet ((insert v C : Finset V) : Set V) :=
      C4LA1.isIndepSet_insert_of_unique_neighbor hsuniq hCind hvC hsC
    simp only [Finset.mem_coe, Finset.mem_filter]
    refine ⟨?_, Finset.mem_insert_self v C⟩
    simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨fun x _ => Finset.mem_sdiff.mpr ⟨Finset.mem_univ x, by simp⟩, ?_⟩, hind⟩
    rw [Finset.card_insert_of_notMem hvC, hCcard]
  · intro B hB
    simp only [Finset.mem_coe, Finset.mem_filter] at hB
    obtain ⟨hB1, hBv⟩ := hB
    simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard] at hB1
    obtain ⟨⟨_hBsub, hBcard⟩, hBind⟩ := hB1
    have hsB : support G v ∉ B := by
      intro hmem
      exact (hBind hBv hmem hvne) hvs
    simp only [Finset.mem_coe, indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨?_, ?_⟩, ?_⟩
    · intro x hx
      have hxB : x ∈ B := Finset.mem_of_mem_erase hx
      have hxne : x ≠ v := Finset.ne_of_mem_erase hx
      have hxne2 : x ≠ support G v := by
        intro hxeq
        rw [hxeq] at hxB
        exact hsB hxB
      simp only [H, Finset.mem_sdiff, Finset.mem_univ, true_and, Finset.mem_insert,
        Finset.mem_singleton]
      push_neg
      exact ⟨hxne, hxne2⟩
    · rw [Finset.card_erase_of_mem hBv, hBcard]; omega
    · exact Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_erase hx) hBind
  · intro C hC
    simp only [Finset.mem_coe, indepSetsAvoiding, Finset.mem_filter,
      Finset.mem_powersetCard] at hC
    obtain ⟨⟨hCsub, _⟩, _⟩ := hC
    have hvC : v ∉ C := by
      intro hmem
      exact absurd (hCsub hmem) (by simp [H])
    exact Finset.erase_insert hvC
  · intro B hB
    simp only [Finset.mem_coe, Finset.mem_filter] at hB
    exact Finset.insert_erase hB.2

end C5LA1
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma C5LA1.isIndepSet_insert_of_no_adj 09b4af885f4c75886f46324a56c0df2dbfa1340d01983751a8c46d47267a9201
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma isIndepSet_insert_of_no_adj {G : SimpleGraph V} {s0 : V} {C : Finset V}
    (hC : G.IsIndepSet (C : Set V)) (hs0 : s0 ∉ C) (hn : ∀ x ∈ C, ¬ G.Adj s0 x) :
    G.IsIndepSet ((insert s0 C : Finset V) : Set V) := by
  rw [SimpleGraph.isIndepSet_iff]
  simp only [Finset.coe_insert]
  rw [Set.pairwise_insert_of_notMem (by simpa using hs0)]
  refine ⟨hC, ?_⟩
  intro w hw
  exact ⟨fun h => hn w hw h, fun h => hn w hw h.symm⟩

end C5LA1
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma C5LA1.R_bijection_card ee259823168fb3e94a7d059897d50aafe504fbb8322354f90bb8cf3c4ba882d0
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma R_bijection_card {G : SimpleGraph V} [DecidableRel G.Adj] {v : V}
    (hv : C4LA1.IsGraphLeaf G v) (k : Nat) :
    indepSetCount G (R G v) k
      = ((indepSetsAvoiding G ∅ (k + 1)).filter fun B => support G v ∈ B).card := by
  unfold indepSetCount
  apply Finset.card_nbij' (fun C => insert (support G v) C) (fun B => B.erase (support G v))
  · intro C hC
    simp only [Finset.mem_coe, indepSetsAvoiding, Finset.mem_filter,
      Finset.mem_powersetCard] at hC
    obtain ⟨⟨hCsub, hCcard⟩, hCind⟩ := hC
    have hs0C : support G v ∉ C := by
      intro hmem
      exact absurd (hCsub hmem) (by simp [R])
    have hn : ∀ x ∈ C, ¬ G.Adj (support G v) x := by
      intro x hx hadj
      have hxR : x ∈ Finset.univ \ R G v := hCsub hx
      have hxnR : x ∉ R G v := (Finset.mem_sdiff.mp hxR).2
      apply hxnR
      simp only [R, Finset.mem_insert]
      right
      rw [SimpleGraph.mem_neighborFinset]
      exact hadj
    have hind : G.IsIndepSet ((insert (support G v) C : Finset V) : Set V) :=
      isIndepSet_insert_of_no_adj hCind hs0C hn
    simp only [Finset.mem_coe, Finset.mem_filter]
    refine ⟨?_, Finset.mem_insert_self (support G v) C⟩
    simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨fun x _ => Finset.mem_sdiff.mpr ⟨Finset.mem_univ x, by simp⟩, ?_⟩, hind⟩
    rw [Finset.card_insert_of_notMem hs0C, hCcard]
  · intro B hB
    simp only [Finset.mem_coe, Finset.mem_filter] at hB
    obtain ⟨hB1, hBs0⟩ := hB
    simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard] at hB1
    obtain ⟨⟨_hBsub, hBcard⟩, hBind⟩ := hB1
    simp only [Finset.mem_coe, indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨?_, ?_⟩, ?_⟩
    · intro x hx
      have hxB : x ∈ B := Finset.mem_of_mem_erase hx
      have hxne : x ≠ support G v := Finset.ne_of_mem_erase hx
      have hxnotadj : ¬ G.Adj (support G v) x := hBind hBs0 hxB (Ne.symm hxne)
      simp only [R, Finset.mem_sdiff, Finset.mem_univ, true_and, Finset.mem_insert]
      push_neg
      refine ⟨hxne, ?_⟩
      rw [SimpleGraph.mem_neighborFinset]
      exact hxnotadj
    · rw [Finset.card_erase_of_mem hBs0, hBcard]; omega
    · exact Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_erase hx) hBind
  · intro C hC
    simp only [Finset.mem_coe, indepSetsAvoiding, Finset.mem_filter,
      Finset.mem_powersetCard] at hC
    obtain ⟨⟨hCsub, _⟩, _⟩ := hC
    have hs0C : support G v ∉ C := by
      intro hmem
      exact absurd (hCsub hmem) (by simp [R])
    exact Finset.erase_insert hs0C
  · intro B hB
    simp only [Finset.mem_coe, Finset.mem_filter] at hB
    exact Finset.insert_erase hB.2

end C5LA1
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma C5LA1.H_count_eq_M 342ed6c99bfa5dd17e8bba58034490e9a8cedce7417010c2d3d7a57375c732f4
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma H_count_eq_M {G : SimpleGraph V} [DecidableRel G.Adj] {v : V}
    (hv : C4LA1.IsGraphLeaf G v) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ w, C4LA1.IsGraphLeaf G w →
      ∀ S : Finset V, G.IsIndepSet (S : Set V) → S.card = G.indepNum → w ∈ S) :
    indepSetCount G (H G v) (G.indepNum - 1) = indepSetCount G ∅ G.indepNum := by
  have hp1 : G.indepNum - 1 + 1 = G.indepNum := by omega
  rw [H_bijection_card hv (G.indepNum - 1), hp1]
  unfold indepSetCount
  congr 1
  apply Finset.filter_true_of_mem
  intro B hB
  simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard] at hB
  exact hResidual v hv B hB.2 hB.1.2

end C5LA1
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma C5LA1.R_count_eq_zero 6ace840bee5205e0d71b135f9ff55902dd8e013afead9bd2ec951b0ce39259fc
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma R_count_eq_zero {G : SimpleGraph V} [DecidableRel G.Adj] {v : V}
    (hv : C4LA1.IsGraphLeaf G v) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ w, C4LA1.IsGraphLeaf G w →
      ∀ S : Finset V, G.IsIndepSet (S : Set V) → S.card = G.indepNum → w ∈ S) :
    indepSetCount G (R G v) (G.indepNum - 1) = 0 := by
  have hp1 : G.indepNum - 1 + 1 = G.indepNum := by omega
  rw [R_bijection_card hv (G.indepNum - 1), hp1]
  rw [Finset.card_eq_zero]
  apply Finset.filter_false_of_mem
  intro B hB hcontra
  simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard] at hB
  have hvB : v ∈ B := hResidual v hv B hB.2 hB.1.2
  have hadj : G.Adj v (support G v) := (support_spec hv).1
  have hvne : v ≠ support G v := G.ne_of_adj hadj
  exact (hB.2 hvB hcontra hvne) hadj

end C5LA1
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma C5LA1.H_doubleCount cbfc5ccdaa5265a9d4b0f1f7e6cd360ce823b381a452364a2a5753500a449f92
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma H_doubleCount {G : SimpleGraph V} [DecidableRel G.Adj] (k : Nat) :
    ∑ v ∈ leafSet G, indepSetCount G (H G v) k
      = ∑ B ∈ indepSetsAvoiding G ∅ (k + 1), (B ∩ leafSet G).card := by
  have hstep : ∀ v ∈ leafSet G, indepSetCount G (H G v) k
      = ((indepSetsAvoiding G ∅ (k + 1)).filter fun B => v ∈ B).card := by
    intro v hv
    simp only [leafSet, Finset.mem_filter, Finset.mem_univ, true_and] at hv
    exact H_bijection_card hv k
  rw [Finset.sum_congr rfl hstep,
    sum_card_filter_comm (leafSet G) (indepSetsAvoiding G ∅ (k + 1)) (fun v B => v ∈ B)]
  apply Finset.sum_congr rfl
  intro B _
  rw [Finset.filter_mem_eq_inter, Finset.inter_comm]

end C5LA1
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma C5LA1.R_doubleCount 4039d9e3e0bcab3b73a38fb8f1ed36793741e14634713965a537d0ee37dfce0f
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma R_doubleCount {G : SimpleGraph V} [DecidableRel G.Adj] (k : Nat) :
    ∑ v ∈ leafSet G, indepSetCount G (R G v) k
      = ∑ B ∈ indepSetsAvoiding G ∅ (k + 1), ∑ s ∈ B, leafDegree G s := by
  have hstep : ∀ v ∈ leafSet G, indepSetCount G (R G v) k
      = ((indepSetsAvoiding G ∅ (k + 1)).filter fun B => support G v ∈ B).card := by
    intro v hv
    simp only [leafSet, Finset.mem_filter, Finset.mem_univ, true_and] at hv
    exact R_bijection_card hv k
  rw [Finset.sum_congr rfl hstep,
    sum_card_filter_comm (leafSet G) (indepSetsAvoiding G ∅ (k + 1))
      (fun v B => support G v ∈ B)]
  apply Finset.sum_congr rfl
  intro B _
  have hmaps : Set.MapsTo (fun v => support G v)
      ↑((leafSet G).filter fun v => support G v ∈ B) ↑B := by
    intro v hv
    simp only [Finset.mem_coe, Finset.mem_filter] at hv
    simpa using hv.2
  rw [Finset.card_eq_sum_card_fiberwise hmaps]
  apply Finset.sum_congr rfl
  intro s hs
  rw [leafDegree_eq_filter_support, Finset.filter_filter]
  congr 1
  apply Finset.filter_congr
  intro v _
  constructor
  · rintro ⟨_, h2⟩
    exact h2
  · intro h2
    exact ⟨h2 ▸ hs, h2⟩

end C5LA1
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN theorem C5LA1.topRankResidualIdentity 4cd69d70c1cbff9b0944c1c7b4776438817750c3e4de4db0c50c70935876bea8
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

theorem topRankResidualIdentity (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    (hEligible : crossingIndex G + 2 ≤ G.indepNum - 1)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v →
      ∀ S : Finset V, G.IsIndepSet (S : Set V) → S.card = G.indepNum → v ∈ S) :
    aggregate G (G.indepNum - 1)
      = ((leafSet G).card * indepSetCount G ∅ G.indepNum : Int)
        - ∑ B ∈ indepSetsAvoiding G ∅ (G.indepNum - 1),
            (((B ∩ leafSet G).card : Int) - ∑ s ∈ B, (leafDegree G s : Int)) := by
  classical
  set p := G.indepNum - 1 with hp_def
  have hsplit :
      (∑ B ∈ indepSetsAvoiding G ∅ p,
          (((B ∩ leafSet G).card : Int) - ∑ s ∈ B, (leafDegree G s : Int)))
        = (∑ B ∈ indepSetsAvoiding G ∅ p, ((B ∩ leafSet G).card : Int))
          - ∑ B ∈ indepSetsAvoiding G ∅ p, ∑ s ∈ B, (leafDegree G s : Int) :=
    Finset.sum_sub_distrib _ _
  rw [hsplit]
  have hp1 : p - 1 + 1 = p := by omega
  have hFilterAll : (leafSet G).filter (fun v => C4LA1.IsFavorableAt G v p) = leafSet G := by
    apply Finset.filter_true_of_mem
    intro v hv
    simp only [leafSet, Finset.mem_filter, Finset.mem_univ, true_and] at hv
    exact C4LA1.topRankSelectorCollapse G hTree hAlpha v hv
  have hsummand : ∀ v ∈ leafSet G,
      forwardDifferenceDel G (H G v) (p - 1) - forwardDifferenceDel G (R G v) (p - 1)
        = (indepSetCount G ∅ G.indepNum : Int)
          - (indepSetCount G (H G v) (p - 1) : Int)
          + (indepSetCount G (R G v) (p - 1) : Int) := by
    intro v hv
    simp only [leafSet, Finset.mem_filter, Finset.mem_univ, true_and] at hv
    have hM : indepSetCount G (H G v) p = indepSetCount G ∅ G.indepNum :=
      H_count_eq_M hv hAlpha hResidual
    have hR0 : indepSetCount G (R G v) p = 0 := R_count_eq_zero hv hAlpha hResidual
    unfold forwardDifferenceDel
    rw [hp1, hM, hR0]
    push_cast
    ring
  have hHnat := H_doubleCount (G := G) (p - 1)
  have hRnat := R_doubleCount (G := G) (p - 1)
  rw [hp1] at hHnat hRnat
  have hHcast : (∑ v ∈ leafSet G, (indepSetCount G (H G v) (p - 1) : Int))
      = ∑ B ∈ indepSetsAvoiding G ∅ p, ((B ∩ leafSet G).card : Int) := by
    exact_mod_cast hHnat
  have hRcast : (∑ v ∈ leafSet G, (indepSetCount G (R G v) (p - 1) : Int))
      = ∑ B ∈ indepSetsAvoiding G ∅ p, ∑ s ∈ B, (leafDegree G s : Int) := by
    exact_mod_cast hRnat
  show aggregate G p = _
  unfold aggregate
  rw [hFilterAll, Finset.sum_congr rfl hsummand]
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, Finset.sum_const, nsmul_eq_mul]
  rw [hHcast, hRcast]
  ring

end C5LA1
-- VERITYOS ENTRY 31 END

