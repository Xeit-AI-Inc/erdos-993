import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition ErdosR25BandCarryStep.choose 219359dc35b7249c079fedd06feb5dac97b5a2ccc24096bd6997195332cbd2c7
namespace ErdosR25BandCarryStep

/-- Zero-extended binomial coefficient. Named `choose` (not `C`), per
mandatory repair (3): resolves the shadowing hazard against the cover
binder `C` used throughout the graph layer below. -/
def choose (n : ℕ) (k : ℤ) : ℤ :=
  if 0 ≤ k then (n.choose k.toNat : ℤ) else 0

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition ErdosR25BandCarryStep.E dd1890bb93bb601568b5b8b9b3ff854f086ff84878ccd655ee5d8b5f2f9ac953
namespace ErdosR25BandCarryStep

/-- `E(n,k) = choose(n,k+1) − choose(n,k)`. -/
def E (n : ℕ) (k : ℤ) : ℤ := choose n (k + 1) - choose n k

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition ErdosR25BandCarryStep.D a7309779a022e792b57e446d6a5266dcff7df780b3931c46f92eb166197f7a7e
namespace ErdosR25BandCarryStep

/-- `D(b,m) = choose(b,m+1) − 2·choose(b,m) + choose(b,m−1)`. -/
def D (b : ℕ) (m : ℤ) : ℤ := choose b (m + 1) - 2 * choose b m + choose b (m - 1)

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition ErdosR25BandCarryStep.capTerm 30e0b591a007e78420968f219e3b5d9cd9782e6a536f6364dad935a296d50fb7
namespace ErdosR25BandCarryStep

/-- The clamped, always-nonnegative per-`b` term `max(0, D(b,m))`. -/
def capTerm (b : ℕ) (m : ℤ) : ℕ := (max 0 (D b m)).toNat

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition ErdosR25BandCarryStep.Mclamped c55efcbaadb6a77cf58aa1f079c8be85e32c36df9b449f35b3810712a4273d1b
namespace ErdosR25BandCarryStep

/-- `Mclamped r a m = max(0, max_{0 ≤ b ≤ 2r−1−a} D(b,m))`. -/
def Mclamped (r a : ℕ) (m : ℤ) : ℕ :=
  if a ≤ 2 * r - 1 then
    (Finset.range (2 * r - a)).sup (fun b => capTerm b m)
  else 0

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition ErdosR25BandCarryStep.Bd 85b923f0982d77d2be78fa6a31bc8bdbb7aa0c4eab886b8909a0eec7137dd626
namespace ErdosR25BandCarryStep

/-- The RANGED `Bd(r,k)`, character-for-character the object of record. -/
def Bd (r : ℕ) (k : ℤ) : ℤ :=
  D (2 * r - 1) k +
    ∑ a ∈ Finset.Icc 1 6, (Nat.choose 6 a : ℤ) * (Mclamped r a (k - (a : ℤ)) : ℤ)

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition ErdosR25BandCarryStep.indepCount 2175c665e3e4d0c499aafb28ee5c05264bf47b186e8b65c6f47620fc58ef1cc6
namespace ErdosR25BandCarryStep

/-- The independent-`k`-set count, `Nat.card` of the subtype (no
decidability assumed: `Nat.card` is total on every type). -/
noncomputable
def indepCount {V : Type u} (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition ErdosR25BandCarryStep.coeff e69a5fa7de1298f2dfffa4ca1e02f1cf2ca8579ac1df639a7ddc8739b582be25
namespace ErdosR25BandCarryStep

/-- `coeff F k = indepCount F k` for `k ≥ 0`, integer zero extension
below. -/
noncomputable
def coeff {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then indepCount F k.toNat else 0

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition ErdosR25BandCarryStep.delta 60372662d99d86048e0525826e415a85a769421ef5343e88af51dd9647fde078
namespace ErdosR25BandCarryStep

/-- `delta F k = coeff F (k+1) − coeff F k`. -/
noncomputable
def delta {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  coeff F (k + 1) - coeff F k

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN definition ErdosR25BandCarryStep.nonCover db1c845c007985f88739beecf3d25e46b9558876b86a228dde24e596e92518fe
namespace ErdosR25BandCarryStep

/-- The non-cover side `B = V ∖ C`, as a `Finset`. -/
def nonCover {V : Type u} [Fintype V] [DecidableEq V] (C : Finset V) : Finset V :=
  Finset.univ \ C

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN definition ErdosR25BandCarryStep.bFinset 8fc6ba46b205b22b8d2b39b48f4f6ee8cf1ac94eee74bd7b2ba40a51f2eb25d3
namespace ErdosR25BandCarryStep

/-- `b_S = |B ∖ N(S)|` for `S ⊆ C`, in the ORIGINAL graph `F`. -/
def bFinset {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} [DecidableRel F.Adj] (C S : Finset V) : Finset V :=
  nonCover C \ S.biUnion (fun v => F.neighborFinset v)

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN definition ErdosR25BandCarryStep.partner 3243353fb42834342c4271a0e407ac3d4859b5eeeb01b0ccf7bfd7f13ff8db23
namespace ErdosR25BandCarryStep

section PartnerConstruction

attribute [local instance] Classical.propDecidable

/-- The `M`-partner of `v` (junk value `v` when `v` is unmatched). Scoped
`Classical.propDecidable`: this `dite` needs a decision procedure for the
general existential `∃ w, M.Adj v w`, and this is the ONLY declaration in
this project elaborated with that instance active (mandatory repair (4)'s
resolution: the section closes immediately below, so no `IsIndepSet`/
`IsNIndepSet` `Finset.filter` anywhere else in this project is ever
elaborated under it). -/
noncomputable
def partner {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} (M : F.Subgraph) (v : V) : V :=
  if h : ∃ w, M.Adj v w then h.choose else v

end PartnerConstruction

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma ErdosR25BandCarryStep.D_eq_diff_E ea3e8705f51710edaa52addced489f346fe92edc8c462c70aa06019247536b6f
namespace ErdosR25BandCarryStep

/-- `D` is the second difference of `choose(b,·)`. -/
lemma D_eq_diff_E (b : ℕ) (m : ℤ) : D b m = E b m - E b (m - 1) := by
  unfold D E
  ring_nf

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma ErdosR25BandCarryStep.clamp_lemma 04ffe1784cd89371484a88bbdc45b5255ea12e205fe3cce338076dfa5f4ba605
namespace ErdosR25BandCarryStep

/-- **The clamp lemma**: a sum over a finite set `t` of size at most `n`,
every term bounded above by a NONNEGATIVE `B`, is bounded above by `n · B`. -/
lemma clamp_lemma {α : Type*} (t : Finset α) (n : ℕ) (f : α → ℤ) (B : ℤ)
    (hn : t.card ≤ n) (hB : 0 ≤ B) (hf : ∀ x ∈ t, f x ≤ B) :
    ∑ x ∈ t, f x ≤ (n : ℤ) * B := by
  calc ∑ x ∈ t, f x ≤ ∑ _x ∈ t, B := Finset.sum_le_sum hf
    _ = (t.card : ℤ) * B := by rw [Finset.sum_const, nsmul_eq_mul]
    _ ≤ (n : ℤ) * B :=
        mul_le_mul_of_nonneg_right (by exact_mod_cast hn) hB

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma ErdosR25BandCarryStep.bd_two_two fd5ef2148adf8c24bc3b9d7048da2137a56c8fbea0042bcae6f12da5ac7724ea
namespace ErdosR25BandCarryStep

lemma bd_two_two : Bd 2 2 = 24 := by decide

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma ErdosR25BandCarryStep.bd_three_three e6e9e5761cb5e4e86fad316770297392c25ff9df6abdaf9e8743658b1d8f1bb3
namespace ErdosR25BandCarryStep

lemma bd_three_three : Bd 3 3 = 31 := by decide

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma ErdosR25BandCarryStep.bd_four_four 731a88aa680fbae78368d2d5a338821d4458a4ee763724f8b9b299a401749061
namespace ErdosR25BandCarryStep

lemma bd_four_four : Bd 4 4 = 48 := by decide

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma ErdosR25BandCarryStep.bd_five_five 6c62861cc08d4cf590b98b2a9187f31a617cfb374012583f8d41e91c395a7146
namespace ErdosR25BandCarryStep

lemma bd_five_five : Bd 5 5 = 33 := by decide

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma ErdosR25BandCarryStep.bd_six_six 6d01bcd8964698ab2688a6108cd129236c5fd33d949fa6f847b7e75abd7c3df6
namespace ErdosR25BandCarryStep

lemma bd_six_six : Bd 6 6 = -16 := by decide

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma ErdosR25BandCarryStep.indepCount_eq_card 6a8c37b8118f3528424a2ca6464fb71f356556ec3603f57e7b8f829df16562e9
namespace ErdosR25BandCarryStep

lemma indepCount_eq_card {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} [DecidableRel F.Adj] (n : ℕ) :
    indepCount F n =
      ((({T | F.IsNIndepSet n T} : Finset (Finset V))).card : ℤ) := by
  unfold indepCount
  congr 1
  rw [Nat.card_eq_fintype_card, Fintype.card_subtype]

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma ErdosR25BandCarryStep.nonCover_indep de9919b41b0c21f080be54a6fa14ce62081fa461e02d7a8013a1c4a553fd46e7
namespace ErdosR25BandCarryStep

lemma nonCover_indep {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} [DecidableRel F.Adj]
    {C : Finset V} (hC : F.IsVertexCover (↑C : Set V)) :
    F.IsIndepSet (↑(nonCover C) : Set V) := by
  intro x hx y hy _ hadj
  simp only [nonCover, Finset.coe_sdiff, Finset.coe_univ, Set.mem_diff, Set.mem_univ, true_and,
    Finset.mem_coe] at hx hy
  rcases hC hadj with h | h
  · exact hx h
  · exact hy h

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma ErdosR25BandCarryStep.fiber_card 662fe9d68f1ea44802a4cf9cdede16e988e3147a8e35b64b2fdcabfa51f98f0c
namespace ErdosR25BandCarryStep

lemma fiber_card {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} [DecidableRel F.Adj]
    {C : Finset V} (hC : F.IsVertexCover (↑C : Set V)) (n : ℕ)
    {S : Finset V} (hS : S ⊆ C) (hSind : F.IsIndepSet (↑S : Set V)) :
    ((({T | F.IsNIndepSet n T} : Finset (Finset V)).filter
        (fun T => T ∩ C = S)).card : ℤ)
      = choose (bFinset (F := F) C S).card ((n : ℤ) - (S.card : ℤ)) := by
  by_cases hcard : S.card ≤ n
  · -- the `choose(b_S, n − |S|)` case
    have hnonneg : (0 : ℤ) ≤ (n : ℤ) - (S.card : ℤ) := by
      have : (S.card : ℤ) ≤ (n : ℤ) := by exact_mod_cast hcard
      omega
    rw [choose, if_pos hnonneg]
    have htoNat : ((n : ℤ) - (S.card : ℤ)).toNat = n - S.card := by omega
    rw [htoNat]
    rw [← Finset.card_powersetCard (n - S.card) (bFinset (F := F) C S)]
    congr 1
    refine Finset.card_nbij' (fun T => T \ C) (fun U => U ∪ S) ?_ ?_ ?_ ?_
    · -- MapsTo: `T ↦ T ∖ C`
      rintro T hT
      simp only [Finset.coe_filter, Set.mem_setOf_eq, Finset.mem_filter,
        Finset.mem_coe] at hT
      obtain ⟨hTmem, hTfib⟩ := hT
      have hTind : F.IsNIndepSet n T := by
        simpa using hTmem
      simp only [Finset.mem_coe, Finset.mem_powersetCard]
      constructor
      · -- `T ∖ C ⊆ B ∖ N(S)`
        intro w hw
        simp only [Finset.mem_sdiff] at hw
        simp only [bFinset, nonCover, Finset.mem_sdiff, Finset.mem_univ, true_and,
          Finset.mem_biUnion, not_exists, not_and]
        refine ⟨hw.2, ?_⟩
        rintro v hvS hvw
        have hvT : v ∈ T := by
          have : v ∈ T ∩ C := hTfib ▸ hvS
          exact (Finset.mem_inter.mp this).1
        have hwadj : F.Adj v w := by
          simpa [SimpleGraph.mem_neighborFinset] using hvw
        have hne : v ≠ w := hwadj.ne
        exact hTind.isIndepSet (by simpa using hvT) (by simpa using hw.1) hne hwadj
      · -- cardinality
        have hsplit : (T \ C).card + (T ∩ C).card = T.card :=
          Finset.card_sdiff_add_card_inter T C
        rw [hTfib] at hsplit
        have hTc : T.card = n := hTind.card_eq
        omega
    · -- MapsTo: `U ↦ U ∪ S`
      rintro U hU
      simp only [Finset.mem_coe, Finset.mem_powersetCard] at hU
      obtain ⟨hUsub, hUcard⟩ := hU
      have hUB : ∀ u ∈ U, u ∉ C := by
        intro u hu
        have := hUsub hu
        simp only [bFinset, nonCover, Finset.mem_sdiff, Finset.mem_univ, true_and] at this
        exact this.1
      have hUN : ∀ u ∈ U, ∀ v ∈ S, ¬ F.Adj v u := by
        intro u hu v hv hadj
        have := hUsub hu
        simp only [bFinset, nonCover, Finset.mem_sdiff, Finset.mem_biUnion, not_exists,
          not_and] at this
        exact this.2 v hv (by simpa [SimpleGraph.mem_neighborFinset] using hadj)
      have hdisj : Disjoint U S := by
        rw [Finset.disjoint_left]
        intro u hu huS
        exact hUB u hu (hS huS)
      simp only [Finset.coe_filter, Set.mem_setOf_eq, Finset.mem_filter, Finset.mem_coe]
      constructor
      · -- `U ∪ S` is an `n`-independent set
        simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_coe,
          Finset.mem_filter]
        refine ⟨?_, ?_⟩
        · -- independence
          intro x hx y hy hxy hadj
          simp only [Finset.coe_union, Set.mem_union, Finset.mem_coe] at hx hy
          have hBind := nonCover_indep (F := F) hC
          rcases hx with hx | hx <;> rcases hy with hy | hy
          · -- both in `U ⊆ B`
            have hxB : x ∈ nonCover C := by
              have := hUsub hx
              simp only [bFinset, Finset.mem_sdiff] at this
              exact this.1
            have hyB : y ∈ nonCover C := by
              have := hUsub hy
              simp only [bFinset, Finset.mem_sdiff] at this
              exact this.1
            exact hBind (by simpa using hxB) (by simpa using hyB) hxy hadj
          · exact hUN x hx y hy hadj.symm
          · exact hUN y hy x hx hadj
          · exact hSind (by simpa using hx) (by simpa using hy) hxy hadj
        · -- cardinality
          rw [Finset.card_union_of_disjoint hdisj, hUcard]
          omega
      · -- `(U ∪ S) ∩ C = S`
        ext x
        simp only [Finset.mem_inter, Finset.mem_union]
        constructor
        · rintro ⟨hx | hx, hxC⟩
          · exact absurd hxC (hUB x hx)
          · exact hx
        · intro hx
          exact ⟨Or.inr hx, hS hx⟩
    · -- left inverse: `(T ∖ C) ∪ S = T`
      rintro T hT
      simp only [Finset.coe_filter, Set.mem_setOf_eq, Finset.mem_filter,
        Finset.mem_coe] at hT
      rw [← hT.2]
      exact Finset.sdiff_union_inter T C
    · -- right inverse: `(U ∪ S) ∖ C = U`
      rintro U hU
      simp only [Finset.mem_coe, Finset.mem_powersetCard] at hU
      have hUB : ∀ u ∈ U, u ∉ C := by
        intro u hu
        have := hU.1 hu
        simp only [bFinset, nonCover, Finset.mem_sdiff, Finset.mem_univ, true_and] at this
        exact this.1
      ext x
      simp only [Finset.mem_sdiff, Finset.mem_union]
      constructor
      · rintro ⟨hx | hx, hxC⟩
        · exact hx
        · exact absurd (hS hx) hxC
      · intro hx
        exact ⟨Or.inl hx, hUB x hx⟩
  · -- `|S| > n`: the fiber is empty and the binomial is zero-extended to 0
    push_neg at hcard
    have hneg : ¬ (0 : ℤ) ≤ (n : ℤ) - (S.card : ℤ) := by
      have : (n : ℤ) < (S.card : ℤ) := by exact_mod_cast hcard
      omega
    rw [choose, if_neg hneg]
    have : (({T | F.IsNIndepSet n T} : Finset (Finset V)).filter
        (fun T => T ∩ C = S)) = ∅ := by
      ext T
      simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.notMem_empty,
        iff_false, not_and, Finset.mem_filter]
      rintro hT hfib
      have hTind : F.IsNIndepSet n T := by simpa using hT
      have hSsub : S ⊆ T := by
        rw [← hfib]; exact Finset.inter_subset_left
      have := Finset.card_le_card hSsub
      rw [hTind.card_eq] at this
      omega
    rw [this]
    simp

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma ErdosR25BandCarryStep.coverFiberPartitionIdentity dfcf5d8186830415c8c787400beefd3ac672813512c0f971f0162514a59546fc
namespace ErdosR25BandCarryStep

lemma coverFiberPartitionIdentity {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} [DecidableRel F.Adj]
    (C : Finset V) (hC : F.IsVertexCover (↑C : Set V)) (k : ℤ) :
    coeff F k =
      ∑ S ∈ C.powerset.filter (fun (S : Finset V) => F.IsIndepSet (↑S : Set V)),
        choose (bFinset (F := F) C S).card (k - (S.card : ℤ)) := by
  by_cases hk : 0 ≤ k
  · -- `k ≥ 0`
    obtain ⟨n, rfl⟩ : ∃ n : ℕ, k = (n : ℤ) := ⟨k.toNat, by omega⟩
    rw [coeff, if_pos hk, show ((n : ℤ)).toNat = n by simp, indepCount_eq_card]
    have hmaps : ((({T | F.IsNIndepSet n T} : Finset (Finset V)) : Set (Finset V)).MapsTo
        (fun T => T ∩ C)
        (C.powerset.filter (fun (S : Finset V) => F.IsIndepSet (↑S : Set V)))) := by
      intro T hT
      simp only [Finset.coe_filter, Set.mem_setOf_eq, Finset.mem_univ, true_and] at hT
      simp only [Finset.mem_coe, Finset.mem_filter, Finset.mem_powerset]
      refine ⟨Finset.inter_subset_right, ?_⟩
      have hTind : F.IsIndepSet (↑T : Set V) := hT.isIndepSet
      exact hTind.mono (by intro x hx; exact (Finset.mem_inter.mp hx).1)
    rw [Finset.card_eq_sum_card_fiberwise hmaps]
    push_cast
    refine Finset.sum_congr rfl ?_
    intro S hS
    simp only [Finset.mem_filter, Finset.mem_powerset] at hS
    exact fiber_card (F := F) hC n hS.1 hS.2
  · -- `k < 0`: both sides are zero by integer zero extension
    push_neg at hk
    rw [coeff, if_neg (by omega)]
    symm
    refine Finset.sum_eq_zero ?_
    intro S _
    rw [choose, if_neg]
    have : (0 : ℤ) ≤ (S.card : ℤ) := Int.natCast_nonneg _
    omega

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma ErdosR25BandCarryStep.delta_fiber db0f217ce7805761703f3866477009c98cff3e15d7b2daf4b196f9e645dd28e3
namespace ErdosR25BandCarryStep

lemma delta_fiber {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} [DecidableRel F.Adj]
    (C : Finset V) (hC : F.IsVertexCover (↑C : Set V)) (k : ℤ) :
    delta F k =
      ∑ S ∈ C.powerset.filter (fun (S : Finset V) => F.IsIndepSet (↑S : Set V)),
        E (bFinset (F := F) C S).card (k - (S.card : ℤ)) := by
  rw [delta, coverFiberPartitionIdentity C hC (k + 1),
    coverFiberPartitionIdentity C hC k, ← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl ?_
  intro S _
  simp only [E, choose]
  ring_nf

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma ErdosR25BandCarryStep.carry_fiber d8dcc5ad43cd7d41b40395cd4eef6edef5780d57daad5cd8767dcbda3e7f9799
namespace ErdosR25BandCarryStep

lemma carry_fiber {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} [DecidableRel F.Adj]
    (C : Finset V) (hC : F.IsVertexCover (↑C : Set V)) (k : ℤ) :
    delta F k - delta F (k - 1) =
      ∑ S ∈ C.powerset.filter (fun (S : Finset V) => F.IsIndepSet (↑S : Set V)),
        D (bFinset (F := F) C S).card (k - (S.card : ℤ)) := by
  rw [delta_fiber C hC k, delta_fiber C hC (k - 1), ← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl ?_
  intro S _
  simp only [E, D]
  ring_nf

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma ErdosR25BandCarryStep.partner_adj c4aa08fd31a9d2d9f91ebaeafb4fd06c2b76924acd6fd4bbd3b42a1c4ddca034
namespace ErdosR25BandCarryStep

lemma partner_adj {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} {M : F.Subgraph} {v : V}
    (hv : v ∈ M.verts) (hM : M.IsMatching) : M.Adj v (partner M v) := by
  classical
  obtain ⟨w, hw, -⟩ := hM hv
  have hex : ∃ w, M.Adj v w := ⟨w, hw⟩
  rw [partner, dif_pos hex]
  exact hex.choose_spec

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma ErdosR25BandCarryStep.partner_eq b80a0067049e73627e5796fd5cbf82ecee590849fc543231efd194261fe99d79
namespace ErdosR25BandCarryStep

lemma partner_eq {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} {M : F.Subgraph} {v w : V}
    (hM : M.IsMatching) (h : M.Adj v w) : partner M v = w := by
  obtain ⟨w', -, hw'⟩ := hM h.fst_mem
  rw [hw' _ (partner_adj h.fst_mem hM), hw' _ h]

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma ErdosR25BandCarryStep.partner_mem 39551595967beb009d40cc070ad2af487f8bbd8a80140c7d3c86da4ebe38cbb9
namespace ErdosR25BandCarryStep

lemma partner_mem {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} {M : F.Subgraph} {v : V}
    (hv : v ∈ M.verts) (hM : M.IsMatching) : partner M v ∈ M.verts :=
  (partner_adj hv hM).snd_mem

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma ErdosR25BandCarryStep.partner_ne 7e0f38aad33dcb04dcfc6eb100e2e285f3ba360462ac3868b573a3dad12eb924
namespace ErdosR25BandCarryStep

lemma partner_ne {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} {M : F.Subgraph} {v : V}
    (hv : v ∈ M.verts) (hM : M.IsMatching) : partner M v ≠ v :=
  fun h => (M.adj_sub (partner_adj hv hM)).ne' (by rw [h])

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma ErdosR25BandCarryStep.partner_involutive d7f5e8718e982024301d9554055295de1795fe33838716421bbf7d56db93d9af
namespace ErdosR25BandCarryStep

lemma partner_involutive {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} {M : F.Subgraph} {v : V}
    (hv : v ∈ M.verts) (hM : M.IsMatching) : partner M (partner M v) = v :=
  partner_eq hM (M.adj_symm (partner_adj hv hM))

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma ErdosR25BandCarryStep.partner_injOn f64f021a2a9fa7198e112930504638d2ca76784e2c5df9617073ea6633a3a764
namespace ErdosR25BandCarryStep

lemma partner_injOn {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} {M : F.Subgraph} (hM : M.IsMatching)
    {s : Set V} (hs : s ⊆ M.verts) : Set.InjOn (partner M) s := by
  intro u hu v hv huv
  have := partner_involutive (hs hu) hM
  rw [← this, huv, partner_involutive (hs hv) hM]

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma ErdosR25BandCarryStep.partner_mem_cover 3b31c0f6efb2e9e3967509874b07836805915044751b85aab21bad519281540d
namespace ErdosR25BandCarryStep

/-- `φ` maps the unmatched-by-`C` side into `C`: every `M`-edge is an
`F`-edge, and `C` covers every `F`-edge. -/
lemma partner_mem_cover {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} {M : F.Subgraph} (hM : M.IsMatching)
    {C : Finset V} (hC : F.IsVertexCover (↑C : Set V)) {v : V}
    (hv : v ∈ M.verts) (hvC : v ∉ C) : partner M v ∈ C := by
  rcases hC (M.adj_sub (partner_adj hv hM)) with h | h
  · exact absurd h hvC
  · exact h

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma ErdosR25BandCarryStep.cover_subset_and_partner_out b66da622f0ffb7bbda4457682c2c7feb50cb4ab6c03c03850eb194fbd98f1908
namespace ErdosR25BandCarryStep

lemma cover_subset_and_partner_out {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} {M : F.Subgraph}
    (hM : M.IsMatching) {C : Finset V} (hC : F.IsVertexCover (↑C : Set V))
    (hMcard : M.verts.ncard = 2 * C.card) :
    (∀ v ∈ C, v ∈ M.verts) ∧ (∀ v ∈ C, partner M v ∉ C) := by
  classical
  set W : Finset V := M.verts.toFinset with hW
  have hWcard : W.card = 2 * C.card := by
    rw [hW, ← Set.ncard_eq_toFinset_card']
    exact hMcard
  have hWmem : ∀ v, v ∈ W ↔ v ∈ M.verts := by intro v; simp [hW]
  -- `φ` maps `W ∖ C` injectively into `W ∩ C`
  have hmaps : ∀ v ∈ W \ C, partner M v ∈ W ∩ C := by
    intro v hv
    rw [Finset.mem_sdiff] at hv
    have hvW := (hWmem v).mp hv.1
    exact Finset.mem_inter.mpr
      ⟨(hWmem _).mpr (partner_mem hvW hM), partner_mem_cover hM hC hvW hv.2⟩
  have hinj : Set.InjOn (partner M) ((W \ C : Finset V) : Set V) := by
    apply partner_injOn hM
    intro x hx
    simp only [Finset.coe_sdiff, Set.mem_diff, Finset.mem_coe] at hx
    exact (hWmem x).mp hx.1
  have hle : (W \ C).card ≤ (W ∩ C).card :=
    Finset.card_le_card_of_injOn _ hmaps hinj
  have hsplit : (W \ C).card + (W ∩ C).card = W.card :=
    Finset.card_sdiff_add_card_inter W C
  have hinterle : (W ∩ C).card ≤ C.card :=
    Finset.card_le_card Finset.inter_subset_right
  have hinter_eq : (W ∩ C).card = C.card := by omega
  have hWinter : W ∩ C = C :=
    Finset.eq_of_subset_of_card_le Finset.inter_subset_right (le_of_eq hinter_eq.symm)
  have hCsubW : C ⊆ W := by
    intro v hv
    have hv' : v ∈ W ∩ C := by rw [hWinter]; exact hv
    exact (Finset.mem_inter.mp hv').1
  refine ⟨fun v hv => (hWmem v).mp (hCsubW hv), ?_⟩
  -- `φ : W ∖ C → W ∩ C = C` is a bijection (equal finite cardinalities),
  -- and `φ` is an involution, so `φ` carries `C` back into `W ∖ C`.
  have hsdiff_eq : (W \ C).card = C.card := by omega
  have himage : (W \ C).image (partner M) = C := by
    have hsub : (W \ C).image (partner M) ⊆ W ∩ C := by
      intro x hx
      obtain ⟨v, hv, rfl⟩ := Finset.mem_image.mp hx
      exact hmaps v hv
    have hcard : ((W \ C).image (partner M)).card = C.card := by
      rw [Finset.card_image_of_injOn hinj]; exact hsdiff_eq
    have himg2 : (W \ C).image (partner M) = W ∩ C :=
      Finset.eq_of_subset_of_card_le hsub (by omega)
    rw [himg2, hWinter]
  intro v hv
  have hv' : v ∈ (W \ C).image (partner M) := by rw [himage]; exact hv
  obtain ⟨u, hu, hvu⟩ := Finset.mem_image.mp hv'
  have huW : u ∈ M.verts := (hWmem u).mp (Finset.mem_sdiff.mp hu).1
  have : partner M v = u := by rw [← hvu, partner_involutive huW hM]
  rw [this]
  exact (Finset.mem_sdiff.mp hu).2

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma ErdosR25BandCarryStep.konigSaturation 06046d1686232ca73f3b872aab9ad2d610bd8c1c7ec97c586236f094c5ee8516
namespace ErdosR25BandCarryStep

lemma konigSaturation {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} [DecidableRel F.Adj]
    (C : Finset V) (hC : F.IsVertexCover (↑C : Set V))
    (M : F.Subgraph) (hM : M.IsMatching) (hMcard : M.verts.ncard = 2 * C.card)
    (S : Finset V) (hS : S ⊆ C) :
    (bFinset (F := F) C S).card ≤ (nonCover C).card - S.card := by
  classical
  obtain ⟨hCW, hCout⟩ := cover_subset_and_partner_out hM hC hMcard
  have hinjS : Set.InjOn (partner M) (S : Set V) :=
    partner_injOn hM (fun x hx => hCW x (hS hx))
  set T : Finset V := S.image (partner M) with hT
  have hTcard : T.card = S.card := Finset.card_image_of_injOn hinjS
  -- `T ⊆ B` and `T ⊆ N(S)`, so `T` is disjoint from `b_S` and sits inside `B`
  have hTB : T ⊆ nonCover C := by
    intro x hx
    obtain ⟨v, hv, rfl⟩ := Finset.mem_image.mp hx
    simp only [nonCover, Finset.mem_sdiff, Finset.mem_univ, true_and]
    exact hCout v (hS hv)
  have hTN : ∀ x ∈ T, x ∈ S.biUnion (fun v => F.neighborFinset v) := by
    intro x hx
    obtain ⟨v, hv, rfl⟩ := Finset.mem_image.mp hx
    refine Finset.mem_biUnion.mpr ⟨v, hv, ?_⟩
    simpa [SimpleGraph.mem_neighborFinset] using
      M.adj_sub (partner_adj (hCW v (hS hv)) hM)
  have hsub : bFinset (F := F) C S ⊆ nonCover C \ T := by
    intro x hx
    simp only [bFinset, Finset.mem_sdiff] at hx ⊢
    exact ⟨hx.1, fun hxT => hx.2 (hTN x hxT)⟩
  calc (bFinset (F := F) C S).card
      ≤ (nonCover C \ T).card := Finset.card_le_card hsub
    _ = (nonCover C).card - T.card := by
        rw [Finset.card_sdiff, Finset.inter_eq_left.mpr hTB]
    _ = (nonCover C).card - S.card := by rw [hTcard]

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN theorem ErdosR25BandCarryStep.bandCarryStepHall 233c5c521daecadb43358b4d1a7cbf30875a258159c69dcce7ad072aa5e0e842
namespace ErdosR25BandCarryStep

theorem bandCarryStepHall {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} [DecidableRel F.Adj] (r : ℕ)
    (hcard : Fintype.card V = 2 * r + 5)
    (C : Finset V) (hC : F.IsVertexCover (↑C : Set V)) (hCcard : C.card = 6)
    (M : F.Subgraph) (hM : M.IsMatching) (hMcard : M.verts.ncard = 12)
    (k : ℤ) :
    delta F k - delta F (k - 1) ≤ Bd r k := by
  classical
  -- `r ≥ 4` is derived, not assumed.
  have hr : 4 ≤ r := by
    have h12 : (12 : ℕ) ≤ Fintype.card V := by
      have hle := Set.ncard_le_ncard (Set.subset_univ M.verts) Set.finite_univ
      rw [hMcard, Set.ncard_univ, Nat.card_eq_fintype_card] at hle
      exact hle
    omega
  have hB : (nonCover C).card = 2 * r - 1 := by
    simp only [nonCover]
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ C), Finset.card_univ, hcard, hCcard]
    omega
  set P : Finset (Finset V) :=
    C.powerset.filter (fun (S : Finset V) => F.IsIndepSet (↑S : Set V)) with hP
  rw [carry_fiber C hC k]
  -- Split the fiber sum by `|S| = a ∈ [0,6]`.
  have hmaps : ∀ S ∈ P, S.card ∈ Finset.range 7 := by
    intro S hS
    simp only [hP, Finset.mem_filter, Finset.mem_powerset] at hS
    have := Finset.card_le_card hS.1
    simp only [Finset.mem_range]
    omega
  rw [← Finset.sum_fiberwise_of_maps_to hmaps]
  have hsplit : Finset.range 7 = insert 0 (Finset.Icc 1 6) := by decide
  rw [hsplit, Finset.sum_insert (by decide : (0 : ℕ) ∉ Finset.Icc 1 6)]
  rw [Bd]
  refine add_le_add ?_ ?_
  · -- the `a = 0` fiber is exactly `{∅}`, and `b_∅ = |B| = 2r-1`
    have hfib : P.filter (fun S => S.card = 0) = {∅} := by
      ext S
      simp only [hP, Finset.mem_filter, Finset.mem_powerset, Finset.mem_singleton,
        Finset.card_eq_zero]
      constructor
      · rintro ⟨-, h⟩; exact h
      · rintro rfl; exact ⟨⟨Finset.empty_subset _, by simp⟩, rfl⟩
    rw [hfib, Finset.sum_singleton]
    have hb0 : (bFinset (F := F) C ∅).card = 2 * r - 1 := by
      simp only [bFinset, Finset.biUnion_empty, Finset.sdiff_empty]
      exact hB
    rw [hb0]
    simp
  · -- each `a ∈ [1,6]` fiber: at most `choose(6,a)` terms, each `≤ Mclamped r a (k-a)`
    refine Finset.sum_le_sum ?_
    intro a ha
    simp only [Finset.mem_Icc] at ha
    have hcount : (P.filter (fun S => S.card = a)).card ≤ Nat.choose 6 a := by
      have hsub : P.filter (fun S => S.card = a) ⊆ C.powersetCard a := by
        intro S hS
        simp only [hP, Finset.mem_filter, Finset.mem_powerset] at hS
        exact Finset.mem_powersetCard.mpr ⟨hS.1.1, hS.2⟩
      calc (P.filter (fun S => S.card = a)).card
          ≤ (C.powersetCard a).card := Finset.card_le_card hsub
        _ = Nat.choose 6 a := by rw [Finset.card_powersetCard, hCcard]
    have hMnonneg : (0 : ℤ) ≤ (Mclamped r a (k - (a : ℤ)) : ℤ) :=
      Int.natCast_nonneg _
    have hterm : ∀ S ∈ P.filter (fun S => S.card = a),
        D (bFinset (F := F) C S).card (k - (S.card : ℤ))
          ≤ (Mclamped r a (k - (a : ℤ)) : ℤ) := by
      intro S hS
      simp only [hP, Finset.mem_filter, Finset.mem_powerset] at hS
      obtain ⟨⟨hSsub, -⟩, hScard⟩ := hS
      -- node (ii): `b_S ≤ |B| - |S| = 2r-1-a`
      have hb := konigSaturation (F := F) C hC M hM (by rw [hCcard]; omega) S hSsub
      rw [hB, hScard] at hb
      have hrange : (bFinset (F := F) C S).card ∈ Finset.range (2 * r - a) := by
        simp only [Finset.mem_range]
        omega
      have hguard : a ≤ 2 * r - 1 := by omega
      rw [hScard, Mclamped, if_pos hguard]
      have hle : capTerm (bFinset (F := F) C S).card (k - (a : ℤ))
          ≤ (Finset.range (2 * r - a)).sup
              (fun b => capTerm b (k - (a : ℤ))) :=
            Finset.le_sup (f := fun b => capTerm b (k - (a : ℤ))) hrange
      have hcap : D (bFinset (F := F) C S).card (k - (a : ℤ))
          ≤ (capTerm (bFinset (F := F) C S).card (k - (a : ℤ)) : ℤ) := by
        simp only [capTerm]
        rw [Int.toNat_of_nonneg (le_max_left _ _)]
        exact le_max_right _ _
      exact hcap.trans (by exact_mod_cast hle)
    calc ∑ S ∈ P.filter (fun S => S.card = a),
            D (bFinset (F := F) C S).card (k - (S.card : ℤ))
        ≤ (Nat.choose 6 a : ℤ) * (Mclamped r a (k - (a : ℤ)) : ℤ) :=
          clamp_lemma _ (Nat.choose 6 a) _ _ hcount hMnonneg hterm
      _ = (Nat.choose 6 a : ℤ) * (Mclamped r a (k - (a : ℤ)) : ℤ) := rfl

end ErdosR25BandCarryStep
-- VERITYOS ENTRY 35 END

