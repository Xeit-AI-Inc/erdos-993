import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition Erdos993G1.indepCount 820deb6e2988cd78614c4982336ebbfac792cbaa6e482aca3955e818e62eed66
namespace Erdos993G1

noncomputable
def indepCount {V : Type u} (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition Erdos993G1.coeff fc4774bffebcad3c2ee74e7f5ec229b731b98ebb0942d7d8e7d81dfdc0f52bb7
noncomputable
def coeff {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition Erdos993G1.delta 4252917adac16311e266d18962cb4e0e9305edd41cb61cb6a7df752395975a12
noncomputable
def delta {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k

end Erdos993G1
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition Erdos993G1.FirstWide.binomCoeff 2b9a3dd523cf91b9343ced154619861b1a2e932c7b815a5cd56401f45e483ddf
namespace Erdos993G1.FirstWide

def binomCoeff (n : ℕ) (k : ℤ) : ℤ :=
  if 0 ≤ k then (n.choose k.toNat : ℤ) else 0

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition Erdos993G1.ThirdWide.fSingleton 4c1aee3e361fee0d1d53d2ff9ac6ed477feafd9b5454f28ef178bb6234409e08
namespace Erdos993G1.ThirdWide

def fSingleton (n k d : ℕ) : ℤ :=
  Erdos993G1.FirstWide.binomCoeff (n - d) (k : ℤ) - Erdos993G1.FirstWide.binomCoeff (n - d) ((k : ℤ) - 1)

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN lemma Erdos993G1.FirstWide.binomCoeff_nat 6f2bf47a74c48621cd4b689a71df8989a360264d0f79753bb34a5c026db071b0
namespace Erdos993G1.FirstWide

lemma binomCoeff_nat (n k : ℕ) : binomCoeff n (k : ℤ) = (n.choose k : ℤ) := by
  simp [binomCoeff]
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN lemma Erdos993G1.FirstWide.binomCoeff_neg 2df80ed8860538f62588ff4ebcfafe6571c3ffc733ac5f4c2deaa90a097fcbf4
lemma binomCoeff_neg (n : ℕ) {k : ℤ} (hk : k < 0) : binomCoeff n k = 0 := by
  simp [binomCoeff, not_le.mpr hk]
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN lemma Erdos993G1.FirstWide.binomCoeff_nat_add_one ad18281f74d760e4131fbebfe297f5ffd5d914001422d28b1bd71ee0da0a0dd4
lemma binomCoeff_nat_add_one (n k : ℕ) :
    binomCoeff n ((k : ℤ) + 1) = (n.choose (k + 1) : ℤ) := by
  simpa only [Nat.cast_add, Nat.cast_one] using binomCoeff_nat n (k + 1)
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN lemma Erdos993G1.FirstWide.choose_step_strict 941725fb51cad360193ad6c1b920a892824f8d3e0a634279432ab848cf0b2169
lemma choose_step_strict {n k : ℕ} (h : 2 * k + 1 < n) :
    n.choose k < n.choose (k + 1) := by
  have hp : 0 < n.choose k := Nat.choose_pos (by omega)
  have he := Nat.choose_succ_right_eq n k
  have hd : k + 1 < n - k := by omega
  have hm := Nat.mul_lt_mul_of_pos_left hd hp
  rw [← he] at hm
  exact Nat.lt_of_mul_lt_mul_right hm
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma Erdos993G1.FirstWide.choose_step_nonpos bea71e474d71f06a4212a4bc19aa4a9cc4b2db80810577a10e007e20d5938a85
lemma choose_step_nonpos {n k : ℕ} (h : n ≤ 2 * k + 1) :
    n.choose (k + 1) ≤ n.choose k := by
  have he := Nat.choose_succ_right_eq n k
  have hd : n - k ≤ k + 1 := by omega
  have hm := Nat.mul_le_mul_left (n.choose k) hd
  rw [← he] at hm
  exact Nat.le_of_mul_le_mul_right hm (by omega)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma Erdos993G1.indepCount_eq_card_indepSetFinset e79e8910cdb4cc64d2cb9189e8ed79d46708680064fa123794a52416bbfa81c1
namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)

lemma indepCount_eq_card_indepSetFinset [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (k : ℕ) :
    indepCount F k = ((F.indepSetFinset k).card : ℤ) := by
  simp only [indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
    SimpleGraph.indepSetFinset]
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma Erdos993G1.coeff_nat 45fd37044ac9a85e1fc66164a12d4bbc64e144605956f198b103a8b51a7f56ee
lemma coeff_nat (k : ℕ) : coeff F (k : ℤ) = indepCount F k := by
  simp [coeff]
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma Erdos993G1.delta_nat 3149be260540cf229947aff0f569979183e7137c18c74cf10479e81b5931cdcf
lemma delta_nat (k : ℕ) :
    delta F (k : ℤ) = indepCount F (k + 1) - indepCount F k := by
  simpa only [delta, Nat.cast_add, Nat.cast_one] using
    congrArg₂ (· - ·) (coeff_nat F (k + 1)) (coeff_nat F k)
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma Erdos993G1.forest_card_edges_add_components 9360c82d0a4f0c575fcaa87d76dd4823d05904574a45d98a458b9c0461201072
lemma forest_card_edges_add_components {V : Type u} [Finite V]
    (F : SimpleGraph V) (hF : F.IsAcyclic) :
    Nat.card F.edgeSet + Nat.card F.ConnectedComponent = Nat.card V := by
  classical
  letI := Fintype.ofFinite V
  have hvertices :
      (∑ c : F.ConnectedComponent, Fintype.card c) = Fintype.card V := by
    have hv := Fintype.sum_fiberwise F.connectedComponentMk (fun _ : V => (1 : ℕ))
    simp only [Finset.sum_const, Finset.card_univ, smul_eq_mul, mul_one] at hv
    calc
      _ = ∑ c : F.ConnectedComponent,
          Fintype.card {v : V // F.connectedComponentMk v = c} := by
        apply Finset.sum_congr rfl
        intro c _
        exact Fintype.card_congr (Equiv.refl _)
      _ = _ := hv
  have hdegrees :
      (∑ c : F.ConnectedComponent, ∑ v : c, F.degree v.val) =
        ∑ v : V, F.degree v := by
    exact Fintype.sum_fiberwise F.connectedComponentMk (fun v : V => F.degree v)
  have hcomponent (c : F.ConnectedComponent) :
      (∑ v : c, F.degree v.val) + 2 = 2 * Fintype.card c := by
    have ht := (hF.isTree_connectedComponent c).card_edgeFinset
    have hd := c.toSimpleGraph.sum_degrees_eq_twice_card_edges
    have heq : (∑ v : c, F.degree v.val) =
        ∑ v : c, c.toSimpleGraph.degree v := by
      apply Finset.sum_congr rfl
      intro v _
      symm
      rw [← SimpleGraph.card_neighborSet_eq_degree,
        ← SimpleGraph.card_neighborSet_eq_degree]
      exact Fintype.card_congr
        { toFun := fun w => ⟨w.val.val, w.property⟩
          invFun := fun w =>
            ⟨⟨w.val, c.mem_supp_of_adj_mem_supp v.property w.property⟩, w.property⟩
          left_inv := fun _ => rfl
          right_inv := fun _ => rfl }
    rw [heq, hd]
    omega
  have hsum := congrArg
    (fun f : F.ConnectedComponent → ℕ => ∑ c, f c) (funext hcomponent)
  simp only [Finset.sum_add_distrib, Finset.sum_const, Finset.card_univ,
    smul_eq_mul, ← Finset.mul_sum] at hsum
  rw [hdegrees, hvertices, F.sum_degrees_eq_twice_card_edges] at hsum
  have hcount : F.edgeFinset.card + Fintype.card F.ConnectedComponent =
      Fintype.card V := by omega
  simpa only [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card] using hcount
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma Erdos993G1.components_card_pos_of_card_pos 9a22fc778bbe688e4ec782dce9016a022e14a07d1604f1fe342fceccb7429307
lemma components_card_pos_of_card_pos {V : Type u} [Finite V]
    (F : SimpleGraph V) (hV : 0 < Nat.card V) :
    0 < Nat.card F.ConnectedComponent := by
  haveI : Nonempty V := (Finite.card_pos_iff).mp hV
  exact Nat.card_pos

end Erdos993G1
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma Erdos993G1.ThirdWide.cover_fiber_count f116c6f46472401183d37aacb3ca4ac49a46a273a39aa70a473affe783dbf073
namespace Erdos993G1.ThirdWide

open Finset Classical

variable {X : Type u} [Fintype X] [DecidableEq X]

lemma cover_fiber_count (F : SimpleGraph X) [DecidableRel F.Adj] (C S : Finset X)
    (hSC : S ⊆ C) (hS : F.IsIndepSet S)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ) :
    (((F.indepSetFinset k).filter (fun T => T ∩ C = S)).card : ℤ) =
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card) := by
  classical
  let B := (univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)
  let A := (F.indepSetFinset k).filter (fun T => T ∩ C = S)
  by_cases hsk : S.card ≤ k
  · have hcount : A.card = (B.powersetCard (k-S.card)).card := by
      apply Finset.card_bij (fun T _ => T \ C)
      · intro T hT
        obtain ⟨hT,hTC⟩ := mem_filter.mp hT
        have hind := (SimpleGraph.mem_indepSetFinset_iff.mp hT).isIndepSet
        have htcard := (SimpleGraph.mem_indepSetFinset_iff.mp hT).card_eq
        refine mem_powersetCard.mpr ⟨?_,?_⟩
        · intro x hx
          obtain ⟨hxT,hxC⟩ := mem_sdiff.mp hx
          refine mem_filter.mpr ⟨mem_univ _, hxC, ?_⟩
          intro y hy hadj
          have hyT : y ∈ T := (mem_inter.mp (hTC ▸ hy)).1
          exact hind hyT hxT hadj.ne hadj
        · have hc := card_sdiff_add_card_inter T C
          rw [hTC,htcard] at hc
          omega
      · intro T hT U hU heq
        have hTC := (mem_filter.mp hT).2
        have hUC := (mem_filter.mp hU).2
        have hTdec : T \ C ∪ S = T := by rw [← hTC]; exact sdiff_union_inter _ _
        have hUdec : U \ C ∪ S = U := by rw [← hUC]; exact sdiff_union_inter _ _
        rw [← hTdec, ← hUdec, heq]
      · intro J hJ
        obtain ⟨hJB,hJcard⟩ := mem_powersetCard.mp hJ
        have hJC : Disjoint J C := disjoint_left.mpr (by
          intro x hx hxC
          exact (mem_filter.mp (hJB hx)).2.1 hxC)
        have hJS : Disjoint J S := hJC.mono_right hSC
        have hind : F.IsIndepSet (↑(J ∪ S) : Set X) := by
          intro x hx y hy hxy hadj
          rcases mem_union.mp hx with hx | hx <;> rcases mem_union.mp hy with hy | hy
          · rcases hcover x y hadj with hxC | hyC
            · exact (mem_filter.mp (hJB hx)).2.1 hxC
            · exact (mem_filter.mp (hJB hy)).2.1 hyC
          · exact (mem_filter.mp (hJB hx)).2.2 y hy hadj.symm
          · exact (mem_filter.mp (hJB hy)).2.2 x hx hadj
          · exact hS hx hy hxy hadj
        refine ⟨J ∪ S, mem_filter.mpr ⟨?_,?_⟩, ?_⟩
        · apply SimpleGraph.mem_indepSetFinset_iff.mpr
          refine ⟨hind,?_⟩
          rw [card_union_of_disjoint hJS,hJcard]
          omega
        · ext x
          simp only [mem_inter,mem_union]
          constructor
          · rintro ⟨hx,hxC⟩
            rcases hx with hx | hx
            · exact False.elim ((disjoint_left.mp hJC hx) hxC)
            · exact hx
          · intro hx
            exact ⟨Or.inr hx,hSC hx⟩
        · ext x
          simp only [mem_sdiff,mem_union]
          constructor
          · rintro ⟨hx,hxC⟩
            rcases hx with hx | hx
            · exact hx
            · exact False.elim (hxC (hSC hx))
          · intro hx
            exact ⟨Or.inl hx,fun hxC => disjoint_left.mp hJC hx hxC⟩
    rw [card_powersetCard] at hcount
    have hz : (k : ℤ) - S.card = ((k-S.card : ℕ) : ℤ) := by omega
    change (A.card : ℤ) = FirstWide.binomCoeff B.card _
    rw [hcount,hz,FirstWide.binomCoeff_nat]
  · have hA : A = ∅ := by
      apply eq_empty_iff_forall_notMem.mpr
      intro T hT
      obtain ⟨hT,hTC⟩ := mem_filter.mp hT
      have hc := card_le_card (inter_subset_left (s₁ := T) (s₂ := C))
      rw [hTC,(SimpleGraph.mem_indepSetFinset_iff.mp hT).card_eq] at hc
      exact hsk hc
    have hz : (k : ℤ) - S.card < 0 := by omega
    change (A.card : ℤ) = FirstWide.binomCoeff B.card _
    rw [hA,card_empty,FirstWide.binomCoeff_neg _ hz]
    rfl

-- ENTRY 166
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma Erdos993G1.ThirdWide.cover_indepCount_partition b07bb93880d9e22709580b3cc614a8735d135737350237777a0d0ff9e440791e
lemma cover_indepCount_partition (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ) :
    indepCount F k =
      ∑ S ∈ C.powerset.filter (fun S : Finset X => F.IsIndepSet S),
        FirstWide.binomCoeff
          ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
          ((k : ℤ) - S.card) := by
  classical
  rw [indepCount_eq_card_indepSetFinset]
  have hc := card_eq_sum_card_fiberwise
    (s := F.indepSetFinset k)
    (t := C.powerset.filter (fun S : Finset X => F.IsIndepSet S))
    (f := fun T => T ∩ C) (by
      intro T hT
      apply mem_filter.mpr
      refine ⟨mem_powerset.mpr (inter_subset_right),?_⟩
      exact (SimpleGraph.mem_indepSetFinset_iff.mp hT).isIndepSet.mono
        (by simpa using (inter_subset_left (s₁ := T) (s₂ := C))))
  rw [hc,Nat.cast_sum]
  apply sum_congr rfl
  intro S hS
  obtain ⟨hSC,hS⟩ := mem_filter.mp hS
  exact cover_fiber_count F C S (mem_powerset.mp hSC) hS hcover k

-- ENTRY 167
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma Erdos993G1.ThirdWide.cover_delta_partition 09c1f3f34ab5dbcc4dae97d966a7770ed4333dbdf28e5d46244742a62f8e2a36
lemma cover_delta_partition (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ) :
    delta F (k : ℤ) =
      ∑ S ∈ C.powerset.filter (fun S : Finset X => F.IsIndepSet S),
        (FirstWide.binomCoeff
          ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
          ((k : ℤ) - S.card + 1) -
        FirstWide.binomCoeff
          ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
          ((k : ℤ) - S.card)) := by
  rw [delta_nat,cover_indepCount_partition F C hcover,
    cover_indepCount_partition F C hcover,← sum_sub_distrib]
  apply sum_congr rfl
  intro S hS
  congr 2
  push_cast
  ring

-- ENTRY 168
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma Erdos993G1.ThirdWide.cover_sum_bound b4e87862e9788db0daf198f185cfca272be47f545a217cd8d7b4e5e53fa869da
lemma cover_sum_bound (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ)
    (f : Finset X → ℤ)
    (hmiss : ∀ S ⊆ C, ¬F.IsIndepSet S → f S ≤ 0)
    (hterm : ∀ S ⊆ C, F.IsIndepSet S → f S ≤
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card + 1) -
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card)) :
    ∑ S ∈ C.powerset, f S ≤ delta F (k : ℤ) := by
  rw [cover_delta_partition F C hcover]
  calc
    ∑ S ∈ C.powerset, f S ≤
        ∑ S ∈ C.powerset.filter (fun S : Finset X => F.IsIndepSet S), f S := by
      rw [sum_filter]
      apply sum_le_sum
      intro S hSC
      by_cases hS : F.IsIndepSet S
      · simp [hS]
      · simpa [hS] using hmiss S (mem_powerset.mp hSC) hS
    _ ≤ _ := by
      apply sum_le_sum
      intro S hS
      obtain ⟨hSC,hS⟩ := mem_filter.mp hS
      exact hterm S (mem_powerset.mp hSC) hS

-- ENTRY 172
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma Erdos993G1.ThirdWide.cover_cross_edges_le e42beda1cb5932253d7edb14773d737eb674cf9182a0fb3cae56a52dd26544df
lemma cover_cross_edges_le (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X) :
    ∑ a ∈ C, ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card ≤
      Nat.card F.edgeSet := by
  classical
  let P := C.sigma (fun a => (univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x))
  have hP : P.card ≤ F.edgeFinset.card := by
    apply card_le_card_of_injOn (fun p : Sigma (fun _ : X => X) => s(p.1,p.2))
    · intro p hp
      obtain ⟨hpC,hp⟩ := mem_sigma.mp hp
      exact SimpleGraph.mem_edgeFinset.mpr (mem_filter.mp hp).2.2
    · rintro ⟨a,x⟩ ha ⟨b,y⟩ hb heq
      obtain ⟨haC,hax⟩ := mem_sigma.mp ha
      obtain ⟨hbC,hby⟩ := mem_sigma.mp hb
      obtain ⟨_,hxC,hax⟩ := mem_filter.mp hax
      obtain ⟨_,hyC,hby⟩ := mem_filter.mp hby
      rcases Sym2.eq_iff.mp heq with ⟨hab,hxy⟩ | ⟨hay,hxb⟩
      · cases hab
        cases hxy
        rfl
      · exact False.elim (hyC (hay ▸ haC))
  rw [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card]
  simpa [P,card_sigma] using hP

-- ENTRY 174 note: the transcribed body's `simp only [mem_singleton,forall_eq]`
-- line (registered entry 21, below) carries the frozen source's own trailing
-- space (frozen line 3761 of sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean),
-- verified byte-for-byte against that line before registration (repair 1).
-- The surrounding namespace/open scaffolding remains grouped under this file's
-- shared Erdos993G1.ThirdWide section rather than the frozen source's own
-- per-entry wrapping -- a separate, already-disclosed, inert difference, not
-- touched by this repair.
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma Erdos993G1.ThirdWide.cover_singleton_available f72c64b6534ede23e1ec198087f52887b121e91f3e84ad0ccf0b53bd642010b9
lemma cover_singleton_available (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X) (a : X) :
    ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ ({a} : Finset X), ¬F.Adj y x)).card +
      ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card =
      Fintype.card X - C.card := by
  classical
  have h := card_filter_add_card_filter_not
    (s := (univ : Finset X).filter (fun x => x ∉ C)) (fun x => F.Adj a x)
  have hB : ((univ : Finset X).filter (fun x => x ∉ C)).card =
      Fintype.card X - C.card := by
    have he : (univ : Finset X).filter (fun x => x ∉ C) = univ \ C := by ext; simp
    rw [he,card_sdiff_of_subset (subset_univ _),card_univ]
  simp only [filter_filter] at h
  simp only [mem_singleton,forall_eq] 
  omega

-- ENTRY 178
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma Erdos993G1.ThirdWide.cover_available_empty e530a0c86d03a7daf7dcc9bca71300d330a0693013b22bbfd409192a8e2bc75d
lemma cover_available_empty (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X) :
    ((univ : Finset X).filter
      (fun x => x ∉ C ∧ ∀ y ∈ (∅ : Finset X), ¬F.Adj y x)).card =
      Fintype.card X - C.card := by
  have he : (univ : Finset X).filter
      (fun x => x ∉ C ∧ ∀ y ∈ (∅ : Finset X), ¬F.Adj y x) = univ \ C := by
    ext x
    simp
  rw [he,card_sdiff_of_subset (subset_univ _),card_univ]

-- Seat U3 Main.lean Step 1: renamed card-5 lemmas (rename done FIRST per charter)
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma Erdos993G1.ThirdWide.powerset_five_sum d97e0f7961a9ebe692d52f70afbb38b1d0c7c8335c72e030ca32d541add5c230
omit [Fintype X] [DecidableEq X] in
lemma powerset_five_sum (C : Finset X) (hC : C.card = 5) (b : ℕ → ℤ) :
    ∑ S ∈ C.powerset, b S.card =
      b 0 + 5 * b 1 + 10 * b 2 + 10 * b 3 + 5 * b 4 + b 5 := by
  rw [sum_powerset]
  simp_rw [sum_powersetCard]
  rw [hC]
  norm_num [sum_range_succ, Nat.choose]
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma Erdos993G1.ThirdWide.cover_rank_bound_five 9412969abeaa5b992b71813fdcc75fa802364f7eca175d0d3f1f10fd3b84b3a0
lemma cover_rank_bound_five (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hC : C.card = 5)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ)
    (b : ℕ → ℤ) (hb : ∀ t, 0 < t → b t ≤ 0)
    (hterm : ∀ S ⊆ C, F.IsIndepSet S → b S.card ≤
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card + 1) -
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card)) :
    b 0 + 5 * b 1 + 10 * b 2 + 10 * b 3 + 5 * b 4 + b 5 ≤ delta F (k : ℤ) := by
  rw [← powerset_five_sum C hC b]
  apply cover_sum_bound F C hcover k (fun S => b S.card) ?_ hterm
  intro S hSC hS
  apply hb
  by_contra h
  have : S = ∅ := card_eq_zero.mp (by omega)
  subst S
  exact hS (by simp [SimpleGraph.IsIndepSet])
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma Erdos993G1.ThirdWide.cover_five_sparse_vertex e627d25ebe7043b0615c2817463619884ad53e1de1be49f7ae07990c2268cbd5
lemma cover_five_sparse_vertex (F : SimpleGraph X) [DecidableRel F.Adj] (hF : F.IsAcyclic)
    (hX : 0 < Nat.card X) (C : Finset X) (hC : C.card = 5) (s : ℕ)
    (hs : Nat.card X ≤ 5 * s + 5) :
    ∃ a ∈ C, ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card ≤ s := by
  have he := forest_card_edges_add_components F hF
  have hp := components_card_pos_of_card_pos F hX
  have hc := cover_cross_edges_le F C
  by_contra h
  push_neg at h
  have hsum : 5 * (s + 1) ≤
      ∑ a ∈ C, ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card := by
    calc
      5 * (s + 1) = ∑ _a ∈ C, (s + 1) := by rw [sum_const, hC]; ring
      _ ≤ _ := sum_le_sum (fun a ha => by have := h a ha; omega)
  omega

-- Step 2: avail_le
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma Erdos993G1.ThirdWide.avail_le 9bd6286d5a0e7b5465cf35b550a28c5cd894d4ab72329748ac6ba412c8e9d21f
lemma avail_le (F : SimpleGraph X) [DecidableRel F.Adj] (C S : Finset X) :
    ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card ≤
      Fintype.card X - C.card := by
  have hsub : (univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x) ⊆
      (univ : Finset X).filter (fun x => x ∉ C) := by
    intro x hx
    simp only [mem_filter, mem_univ, true_and] at hx ⊢
    exact hx.1
  have hcard : ((univ : Finset X).filter (fun x => x ∉ C)).card =
      Fintype.card X - C.card := by
    have he : (univ : Finset X).filter (fun x => x ∉ C) = univ \ C := by ext; simp
    rw [he, card_sdiff_of_subset (subset_univ _), card_univ]
  calc
    ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card ≤
        ((univ : Finset X).filter (fun x => x ∉ C)).card := card_le_card hsub
    _ = Fintype.card X - C.card := hcard

-- Step 3: padding lemma
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma Erdos993G1.ThirdWide.exists_card_five_cover 7900fc13672125112686e18a21954d5a8f60430157ffcbd1106774cb9e80c338
lemma exists_card_five_cover (F : SimpleGraph X) [DecidableRel F.Adj]
    (C0 : Finset X) (hC0 : C0.card ≤ 5) (hX : 5 ≤ Fintype.card X)
    (hcover0 : ∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) :
    ∃ C : Finset X, C.card = 5 ∧ C0 ⊆ C ∧
      ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C := by
  obtain ⟨C, hC0C, hCcard⟩ := Finset.exists_superset_card_eq hC0
    (by simpa using hX)
  refine ⟨C, hCcard, hC0C, fun x y hxy => ?_⟩
  rcases hcover0 x y hxy with h | h
  · exact Or.inl (hC0C h)
  · exact Or.inr (hC0C h)

-- Step 4: LP-dual reference certificate (kept as documented reference form)
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma Erdos993G1.ThirdWide.joint_cert 4c26fac31c7d1fb57fdcb9c40fd3066ecad585b761cbff3b527e876472d0b517
omit [DecidableEq X] in
lemma joint_cert (n k : ℕ) (a b : ℤ) (N : ℕ)
    (hcert : ∀ d, d ≤ n → a - b * d ≤ fSingleton n k d)
    (hb : 0 ≤ b)
    (d : Fin 5 → ℕ) (hd : ∀ i, d i ≤ n) (hsum : (∑ i, d i) ≤ N) :
    5 * a - b * N ≤ ∑ i, fSingleton n k (d i) := by
  have hcast : (∑ i, (d i : ℤ)) ≤ N := by
    have : ((∑ i, d i : ℕ) : ℤ) ≤ ((N : ℕ) : ℤ) := Int.ofNat_le.mpr hsum
    simpa using this
  have hstep : ∑ i, (a - b * (d i : ℤ)) ≤ ∑ i, fSingleton n k (d i) :=
    Finset.sum_le_sum (fun i _ => hcert (d i) (hd i))
  have hlin : 5 * a - b * N ≤ ∑ i, (a - b * (d i : ℤ)) := by
    rw [Finset.sum_sub_distrib, ← Finset.mul_sum]
    simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
    have : b * (∑ i, (d i : ℤ)) ≤ b * (N : ℤ) := mul_le_mul_of_nonneg_left hcast hb
    push_cast
    linarith
  exact le_trans hlin hstep
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma Erdos993G1.ThirdWide.sum_powersetCard_one_eq 82ad3f7b041383c643419c827dd6f36a27019016d15a266f2d61e75d0b9bc59d
lemma sum_powersetCard_one_eq (C : Finset X) (g : Finset X → ℤ) :
    ∑ S ∈ C.powersetCard 1, g S = ∑ a ∈ C, g {a} := by
  rw [Finset.powersetCard_one, Finset.sum_map]
  rfl

-- Step 5: singleton aggregation
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma Erdos993G1.ThirdWide.cover_rank_bound_five_singletons db8900f871af4e79162114b65d39c2a8dbf2dae369d8a6b4cb275d65c03f715d
lemma cover_rank_bound_five_singletons
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X) (hC : C.card = 5)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k n : ℕ)
    (hn : Fintype.card X = n + 5)
    (b0 f2 f3 f4 f5 : ℤ)
    (hb0 : b0 ≤ FirstWide.binomCoeff n ((k : ℤ) + 1) - FirstWide.binomCoeff n (k : ℤ))
    (hf2 : ∀ m, m ≤ n → f2 ≤ FirstWide.binomCoeff m ((k : ℤ) - 2 + 1) - FirstWide.binomCoeff m ((k : ℤ) - 2))
    (hf3 : ∀ m, m ≤ n → f3 ≤ FirstWide.binomCoeff m ((k : ℤ) - 3 + 1) - FirstWide.binomCoeff m ((k : ℤ) - 3))
    (hf4 : ∀ m, m ≤ n → f4 ≤ FirstWide.binomCoeff m ((k : ℤ) - 4 + 1) - FirstWide.binomCoeff m ((k : ℤ) - 4))
    (hf5 : ∀ m, m ≤ n → f5 ≤ FirstWide.binomCoeff m ((k : ℤ) - 5 + 1) - FirstWide.binomCoeff m ((k : ℤ) - 5))
    (hf2neg : f2 ≤ 0) (hf3neg : f3 ≤ 0) (hf4neg : f4 ≤ 0) (hf5neg : f5 ≤ 0)
    (singletonSum : ℤ)
    (hsingleton : singletonSum ≤
      ∑ a ∈ C, fSingleton n k ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card) :
    b0 + singletonSum + 10 * f2 + 10 * f3 + 5 * f4 + f5 ≤ delta F (k : ℤ) := by
  classical
  have hcardeq : Fintype.card X - C.card = n := by omega
  set g : Finset X → ℤ := fun S =>
    if S.card = 0 then b0
    else if S.card = 1 then
      FirstWide.binomCoeff
          ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card (k : ℤ) -
        FirstWide.binomCoeff
          ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card ((k : ℤ) - 1)
    else if S.card = 2 then f2
    else if S.card = 3 then f3
    else if S.card = 4 then f4
    else if S.card = 5 then f5
    else 0 with hg
  have key : ∑ S ∈ C.powerset, g S ≤ delta F (k : ℤ) := by
    apply cover_sum_bound F C hcover k g
    · intro S hSC hS
      have hcard5 : S.card ≤ 5 := hC ▸ card_le_card hSC
      have hne0 : S.card ≠ 0 := by
        intro h0
        apply hS
        have hSe : S = ∅ := card_eq_zero.mp h0
        rw [hSe]
        simp [SimpleGraph.IsIndepSet]
      have hne1 : S.card ≠ 1 := by
        intro h1
        apply hS
        obtain ⟨a, hSa⟩ := card_eq_one.mp h1
        rw [hSa]
        simp [SimpleGraph.IsIndepSet]
      show g S ≤ 0
      simp only [hg, hne0, hne1, if_false]
      rcases (show S.card = 2 ∨ S.card = 3 ∨ S.card = 4 ∨ S.card = 5 by omega)
        with h2 | h3 | h4 | h5
      · rw [if_pos h2]; exact hf2neg
      · rw [if_neg (by omega), if_pos h3]; exact hf3neg
      · rw [if_neg (by omega), if_neg (by omega), if_pos h4]; exact hf4neg
      · rw [if_neg (by omega), if_neg (by omega), if_neg (by omega), if_pos h5]; exact hf5neg
    · intro S hSC hS
      show g S ≤
        FirstWide.binomCoeff
          ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
          ((k : ℤ) - S.card + 1) -
        FirstWide.binomCoeff
          ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
          ((k : ℤ) - S.card)
      by_cases h0 : S.card = 0
      · have hSe : S = ∅ := card_eq_zero.mp h0
        have havail : ((univ : Finset X).filter
            (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card = n := by
          rw [hSe]; rw [cover_available_empty F C]; omega
        simp only [hg, if_pos h0]
        rw [havail, h0]
        norm_num
        exact hb0
      · by_cases h1 : S.card = 1
        · simp only [hg, if_neg h0, if_pos h1]
          rw [show ((k:ℤ) - (S.card : ℤ) + 1) = (k:ℤ) by rw [h1]; push_cast; ring]
          rw [show ((k:ℤ) - (S.card : ℤ)) = (k:ℤ) - 1 by rw [h1]; push_cast; ring]
        · have hcard5 : S.card ≤ 5 := hC ▸ card_le_card hSC
          simp only [hg, if_neg h0, if_neg h1]
          have hle : ((univ : Finset X).filter
              (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card ≤ n := by
            rw [← hcardeq]; exact avail_le F C S
          rcases (show S.card = 2 ∨ S.card = 3 ∨ S.card = 4 ∨ S.card = 5 by omega)
            with h2 | h3 | h4 | h5
          · rw [if_pos h2, h2]; exact hf2 _ hle
          · rw [if_neg (by omega), if_pos h3, h3]; exact hf3 _ hle
          · rw [if_neg (by omega), if_neg (by omega), if_pos h4, h4]; exact hf4 _ hle
          · rw [if_neg (by omega), if_neg (by omega), if_neg (by omega), if_pos h5, h5]
            exact hf5 _ hle
  have hsplit : ∑ S ∈ C.powerset, g S =
      b0 + (∑ a ∈ C, fSingleton n k ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card)
        + 10 * f2 + 10 * f3 + 5 * f4 + f5 := by
    rw [Finset.sum_powerset]
    rw [hC]
    rw [show (5 : ℕ) + 1 = 6 from rfl, Finset.sum_range_succ, Finset.sum_range_succ,
      Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_succ,
      Finset.sum_range_one]
    have h0 : ∑ S ∈ C.powersetCard 0, g S = b0 := by
      have hCe : C.powersetCard 0 = {∅} := by
        ext S; simp
      rw [hCe, Finset.sum_singleton]
      show g ∅ = b0
      simp [hg]
    have h1 : ∑ S ∈ C.powersetCard 1, g S =
        ∑ a ∈ C, fSingleton n k ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card := by
      rw [sum_powersetCard_one_eq]
      apply Finset.sum_congr rfl
      intro a _
      have hcard1 : ({a} : Finset X).card = 1 := card_singleton a
      have hgval : g {a} = FirstWide.binomCoeff
          ((univ : Finset X).filter
            (fun x => x ∉ C ∧ ∀ y ∈ ({a} : Finset X), ¬F.Adj y x)).card (k : ℤ) -
          FirstWide.binomCoeff
          ((univ : Finset X).filter
            (fun x => x ∉ C ∧ ∀ y ∈ ({a} : Finset X), ¬F.Adj y x)).card ((k : ℤ) - 1) := by
        show g {a} = _
        simp only [hg]
        rw [if_neg (by omega : ¬(({a} : Finset X).card = 0))]
        rw [if_pos hcard1]
      rw [hgval]
      have hE174 := cover_singleton_available F C a
      have haval : ((univ : Finset X).filter
          (fun x => x ∉ C ∧ ∀ y ∈ ({a} : Finset X), ¬F.Adj y x)).card =
          n - ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card := by omega
      rw [haval]
      rfl
    have hgen2 : ∑ S ∈ C.powersetCard 2, g S = (C.card.choose 2 : ℤ) * f2 := by
      have hconst : ∀ S ∈ C.powersetCard 2, g S = f2 := by
        intro S hS
        obtain ⟨_, hScard⟩ := Finset.mem_powersetCard.mp hS
        show g S = f2
        simp only [hg]
        rw [if_neg (by omega : S.card ≠ 0), if_neg (by omega : S.card ≠ 1), if_pos hScard]
      rw [Finset.sum_congr rfl hconst, Finset.sum_const, Finset.card_powersetCard]
      simp
    have hgen3 : ∑ S ∈ C.powersetCard 3, g S = (C.card.choose 3 : ℤ) * f3 := by
      have hconst : ∀ S ∈ C.powersetCard 3, g S = f3 := by
        intro S hS
        obtain ⟨_, hScard⟩ := Finset.mem_powersetCard.mp hS
        show g S = f3
        simp only [hg]
        rw [if_neg (by omega : S.card ≠ 0), if_neg (by omega : S.card ≠ 1),
          if_neg (by omega : S.card ≠ 2), if_pos hScard]
      rw [Finset.sum_congr rfl hconst, Finset.sum_const, Finset.card_powersetCard]
      simp
    have hgen4 : ∑ S ∈ C.powersetCard 4, g S = (C.card.choose 4 : ℤ) * f4 := by
      have hconst : ∀ S ∈ C.powersetCard 4, g S = f4 := by
        intro S hS
        obtain ⟨_, hScard⟩ := Finset.mem_powersetCard.mp hS
        show g S = f4
        simp only [hg]
        rw [if_neg (by omega : S.card ≠ 0), if_neg (by omega : S.card ≠ 1),
          if_neg (by omega : S.card ≠ 2), if_neg (by omega : S.card ≠ 3), if_pos hScard]
      rw [Finset.sum_congr rfl hconst, Finset.sum_const, Finset.card_powersetCard]
      simp
    have hgen5 : ∑ S ∈ C.powersetCard 5, g S = (C.card.choose 5 : ℤ) * f5 := by
      have hconst : ∀ S ∈ C.powersetCard 5, g S = f5 := by
        intro S hS
        obtain ⟨_, hScard⟩ := Finset.mem_powersetCard.mp hS
        show g S = f5
        simp only [hg]
        rw [if_neg (by omega : S.card ≠ 0), if_neg (by omega : S.card ≠ 1),
          if_neg (by omega : S.card ≠ 2), if_neg (by omega : S.card ≠ 3),
          if_neg (by omega : S.card ≠ 4), if_pos hScard]
      rw [Finset.sum_congr rfl hconst, Finset.sum_const, Finset.card_powersetCard]
      simp
    rw [hC] at hgen2 hgen3 hgen4 hgen5
    norm_num [Nat.choose] at hgen2 hgen3 hgen4 hgen5
    rw [h0, h1, hgen2, hgen3, hgen4, hgen5]
  calc
    b0 + singletonSum + 10 * f2 + 10 * f3 + 5 * f4 + f5
        ≤ b0 + (∑ a ∈ C, fSingleton n k
            ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card)
          + 10 * f2 + 10 * f3 + 5 * f4 + f5 := by linarith [hsingleton]
    _ = ∑ S ∈ C.powerset, g S := hsplit.symm
    _ ≤ delta F (k : ℤ) := key

-- Step 6
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma Erdos993G1.ThirdWide.joint_cert_finset edba0c3f6d36aacd1f2834cfa2a1ab4bca8558d1c2bb280b14a907de82a919a9
omit [Fintype X] [DecidableEq X] in
lemma joint_cert_finset (C : Finset X) (hC : C.card = 5) (n k : ℕ) (a b : ℤ) (N : ℕ)
    (hcert : ∀ d, d ≤ n → a - b * d ≤ fSingleton n k d)
    (hbnn : 0 ≤ b)
    (crossdeg : X → ℕ) (hd : ∀ x ∈ C, crossdeg x ≤ n)
    (hsum : (∑ x ∈ C, crossdeg x) ≤ N) :
    5 * a - b * N ≤ ∑ x ∈ C, fSingleton n k (crossdeg x) := by
  have hcast : (∑ x ∈ C, (crossdeg x : ℤ)) ≤ (N : ℤ) := by
    have : ((∑ x ∈ C, crossdeg x : ℕ) : ℤ) ≤ ((N : ℕ) : ℤ) := Int.ofNat_le.mpr hsum
    simpa using this
  have hstep : ∑ x ∈ C, (a - b * (crossdeg x : ℤ)) ≤ ∑ x ∈ C, fSingleton n k (crossdeg x) :=
    Finset.sum_le_sum (fun x hx => hcert (crossdeg x) (hd x hx))
  have hlin : 5 * a - b * (N : ℤ) ≤ ∑ x ∈ C, (a - b * (crossdeg x : ℤ)) := by
    rw [Finset.sum_sub_distrib, ← Finset.mul_sum, Finset.sum_const, hC, nsmul_eq_mul]
    have hmul : b * (∑ x ∈ C, (crossdeg x : ℤ)) ≤ b * (N : ℤ) :=
      mul_le_mul_of_nonneg_left hcast hbnn
    push_cast
    linarith
  exact le_trans hlin hstep

-- Step 7
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma Erdos993G1.ThirdWide.crossdeg_le df499488182952986239aac96f49d1e73bccee836c529e813f67c8021c75acef
lemma crossdeg_le (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X) (a : X) :
    ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card ≤
      Fintype.card X - C.card := by
  have hsub : (univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x) ⊆
      (univ : Finset X).filter (fun x => x ∉ C) := by
    intro x hx
    simp only [mem_filter, mem_univ, true_and] at hx ⊢
    exact hx.1
  have hcard : ((univ : Finset X).filter (fun x => x ∉ C)).card =
      Fintype.card X - C.card := by
    have he : (univ : Finset X).filter (fun x => x ∉ C) = univ \ C := by ext; simp
    rw [he, card_sdiff_of_subset (subset_univ _), card_univ]
  calc
    ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card ≤
        ((univ : Finset X).filter (fun x => x ∉ C)).card := card_le_card hsub
    _ = Fintype.card X - C.card := hcard
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma Erdos993G1.ThirdWide.budget_bound a2bf3eefdda5e0fc69f0b5619ed03f062eb4af650c0e7ef76330db5c79779234
lemma budget_bound (F : SimpleGraph X) [DecidableRel F.Adj] (hF : F.IsAcyclic) (C : Finset X)
    (hpos : 0 < Fintype.card X) :
    ∑ a ∈ C, ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card ≤
      Fintype.card X - 1 := by
  have h172 := cover_cross_edges_le F C
  have h58 := Erdos993G1.forest_card_edges_add_components F hF
  have h59 := Erdos993G1.components_card_pos_of_card_pos F
    (show 0 < Nat.card X by rwa [Nat.card_eq_fintype_card])
  have hbridge : Nat.card X = Fintype.card X := Nat.card_eq_fintype_card
  omega
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma Erdos993G1.ThirdWide.cell_bound afecdadbcd256f8d0d12bab546f20a2a873a4962c23c1e89bf79c64f7424de64
lemma cell_bound (F : SimpleGraph X) [DecidableRel F.Adj] (hF : F.IsAcyclic)
    (C : Finset X) (hC : C.card = 5) (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C)
    (n k : ℕ) (hn : Fintype.card X = n + 5)
    (a b b0 f2 f3 f4 f5 total : ℤ)
    (hcert : ∀ d, d ≤ n → a - b * d ≤ fSingleton n k d)
    (hbnn : 0 ≤ b)
    (hb0 : b0 ≤ FirstWide.binomCoeff n ((k : ℤ) + 1) - FirstWide.binomCoeff n (k : ℤ))
    (hf2 : ∀ m, m ≤ n → f2 ≤ FirstWide.binomCoeff m ((k : ℤ) - 2 + 1) - FirstWide.binomCoeff m ((k : ℤ) - 2))
    (hf3 : ∀ m, m ≤ n → f3 ≤ FirstWide.binomCoeff m ((k : ℤ) - 3 + 1) - FirstWide.binomCoeff m ((k : ℤ) - 3))
    (hf4 : ∀ m, m ≤ n → f4 ≤ FirstWide.binomCoeff m ((k : ℤ) - 4 + 1) - FirstWide.binomCoeff m ((k : ℤ) - 4))
    (hf5 : ∀ m, m ≤ n → f5 ≤ FirstWide.binomCoeff m ((k : ℤ) - 5 + 1) - FirstWide.binomCoeff m ((k : ℤ) - 5))
    (hf2neg : f2 ≤ 0) (hf3neg : f3 ≤ 0) (hf4neg : f4 ≤ 0) (hf5neg : f5 ≤ 0)
    (htotal : b0 + (5 * a - b * (n + 4 : ℕ)) + 10 * f2 + 10 * f3 + 5 * f4 + f5 = total) :
    total ≤ delta F (k : ℤ) := by
  have hpos : 0 < Fintype.card X := by omega
  have hd : ∀ x ∈ C, ((univ : Finset X).filter (fun y => y ∉ C ∧ F.Adj x y)).card ≤ n := by
    intro x _
    have := crossdeg_le F C x
    omega
  have hsum : (∑ x ∈ C,
      ((univ : Finset X).filter (fun y => y ∉ C ∧ F.Adj x y)).card) ≤ n + 4 := by
    have := budget_bound F hF C hpos
    omega
  have hsingleton := joint_cert_finset C hC n k a b (n + 4) hcert hbnn
    (fun x => ((univ : Finset X).filter (fun y => y ∉ C ∧ F.Adj x y)).card) hd hsum
  have hmain := cover_rank_bound_five_singletons F C hC hcover k n hn
    b0 f2 f3 f4 f5 hb0 hf2 hf3 hf4 hf5 hf2neg hf3neg hf4neg hf5neg
    (5 * a - b * (n + 4 : ℕ)) hsingleton
  omega
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma Erdos993G1.ThirdWide.cell_9 72548698cc95c87fb436064143100e1341318ec810e8623c489d1c088b5e7523
lemma cell_9 (F : SimpleGraph X) [DecidableRel F.Adj] (hF : F.IsAcyclic)
    (hcard : Fintype.card X = 9) (C0 : Finset X) (hC0 : C0.card ≤ 5)
    (hcover0 : ∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) :
    (9 : ℤ) ≤ delta F (1 : ℤ) := by
  obtain ⟨C, hC, _, hcover⟩ := exists_card_five_cover F C0 hC0 (by omega) hcover0
  apply cell_bound F hF C hC hcover 4 1 (by omega)
    3 1 2 0 0 0 0 9
  · intro d hd; interval_cases d <;> decide
  · norm_num
  · decide
  · intro m hm; interval_cases m <;> decide
  · intro m hm; interval_cases m <;> decide
  · intro m hm; interval_cases m <;> decide
  · intro m hm; interval_cases m <;> decide
  · norm_num
  · norm_num
  · norm_num
  · norm_num
  · norm_num
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma Erdos993G1.ThirdWide.cell_11 8c03539561bdf522b13a723d15ef0e4de9478af7039149ea90dbbe820141b3fc
lemma cell_11 (F : SimpleGraph X) [DecidableRel F.Adj] (hF : F.IsAcyclic)
    (hcard : Fintype.card X = 11) (C0 : Finset X) (hC0 : C0.card ≤ 5)
    (hcover0 : ∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) :
    (5 : ℤ) ≤ delta F (2 : ℤ) := by
  obtain ⟨C, hC, _, hcover⟩ := exists_card_five_cover F C0 hC0 (by omega) hcover0
  apply cell_bound F hF C hC hcover 6 2 (by omega)
    6 2 5 (-1) 0 0 0 5
  · intro d hd; interval_cases d <;> decide
  · norm_num
  · decide
  · intro m hm; interval_cases m <;> decide
  · intro m hm; interval_cases m <;> decide
  · intro m hm; interval_cases m <;> decide
  · intro m hm; interval_cases m <;> decide
  · norm_num
  · norm_num
  · norm_num
  · norm_num
  · norm_num
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma Erdos993G1.ThirdWide.cell_13 243fb0589af7c1d4e3a4086b11fb3682bce68e712a791ff46a12627eb77ebb8d
lemma cell_13 (F : SimpleGraph X) [DecidableRel F.Adj] (hF : F.IsAcyclic)
    (hcard : Fintype.card X = 13) (C0 : Finset X) (hC0 : C0.card ≤ 5)
    (hcover0 : ∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) :
    (9 : ℤ) ≤ delta F (3 : ℤ) := by
  obtain ⟨C, hC, _, hcover⟩ := exists_card_five_cover F C0 hC0 (by omega) hcover0
  apply cell_bound F hF C hC hcover 8 3 (by omega)
    15 5 14 (-1) (-1) 0 0 9
  · intro d hd; interval_cases d <;> decide
  · norm_num
  · decide
  · intro m hm; interval_cases m <;> decide
  · intro m hm; interval_cases m <;> decide
  · intro m hm; interval_cases m <;> decide
  · intro m hm; interval_cases m <;> decide
  · norm_num
  · norm_num
  · norm_num
  · norm_num
  · norm_num
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma Erdos993G1.ThirdWide.cell_15 4452f30918c8ebb8cda2f78ef0ba897f4efcd0b8ab23088513aec0ee62ed9878
lemma cell_15 (F : SimpleGraph X) [DecidableRel F.Adj] (hF : F.IsAcyclic)
    (hcard : Fintype.card X = 15) (C0 : Finset X) (hC0 : C0.card ≤ 5)
    (hcover0 : ∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) :
    (21 : ℤ) ≤ delta F (4 : ℤ) := by
  obtain ⟨C, hC, _, hcover⟩ := exists_card_five_cover F C0 hC0 (by omega) hcover0
  apply cell_bound F hF C hC hcover 10 4 (by omega)
    42 14 42 (-2) (-1) (-1) 0 21
  · intro d hd; interval_cases d <;> decide
  · norm_num
  · decide
  · intro m hm; interval_cases m <;> decide
  · intro m hm; interval_cases m <;> decide
  · intro m hm; interval_cases m <;> decide
  · intro m hm; interval_cases m <;> decide
  · norm_num
  · norm_num
  · norm_num
  · norm_num
  · norm_num
-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma Erdos993G1.ThirdWide.cell_17 caffa7bc899ef63702307df67f95943da46d5a1f14ba704ce72a93c429968a24
lemma cell_17 (F : SimpleGraph X) [DecidableRel F.Adj] (hF : F.IsAcyclic)
    (hcard : Fintype.card X = 17) (C0 : Finset X) (hC0 : C0.card ≤ 5)
    (hcover0 : ∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) :
    (42 : ℤ) ≤ delta F (5 : ℤ) := by
  obtain ⟨C, hC, _, hcover⟩ := exists_card_five_cover F C0 hC0 (by omega) hcover0
  apply cell_bound F hF C hC hcover 12 5 (by omega)
    42 14 132 (-5) (-2) (-1) (-1) 42
  · intro d hd; interval_cases d <;> decide
  · norm_num
  · decide
  · intro m hm; interval_cases m <;> decide
  · intro m hm; interval_cases m <;> decide
  · intro m hm; interval_cases m <;> decide
  · intro m hm; interval_cases m <;> decide
  · norm_num
  · norm_num
  · norm_num
  · norm_num
  · norm_num

-- === statement (b): the card-5 cover_catalan_bound chain ===
-- ENTRY 136-143 + FirstWide 84/86/87 + ENTRY 177, transcribed via C-U3-F's
-- CriticU3FCover.lean closure; then cover_catalan_bound_five itself.
-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_pascal 97582ee01344b775cbe4d15b278588880e446c1b491d210a40f7eb6e6da88bb7
lemma binomDelta_pascal (m j : ℕ) :
    ((m+1).choose (j+2) : ℤ) - (m+1).choose (j+1) =
      ((m.choose (j+2) : ℤ) - m.choose (j+1)) +
      ((m.choose (j+1) : ℤ) - m.choose j) := by
  rw [show j+2=(j+1)+1 by omega, Nat.choose_succ_succ', Nat.choose_succ_succ']
  push_cast
  ring
-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_step_up 6e4d10c62c7e80d9268bbabe83b13ec5d482348abd4ecf2d97e9454e3541a72d
lemma binomDelta_step_up (m k : ℕ) (hm : 2*k ≤ m) :
    (m.choose (k+1) : ℤ) - m.choose k ≤
      ((m+1).choose (k+1) : ℤ) - (m+1).choose k := by
  cases k with
  | zero => simp
  | succ j =>
    have hc := FirstWide.choose_step_strict (n := m) (k := j) (by omega)
    have hc' : (m.choose j : ℤ) ≤ m.choose (j+1) := by exact_mod_cast hc.le
    have hp := binomDelta_pascal m j
    linarith
-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_step_down 1611ccdf6868d476632bba9978c3c9a1d6ba1594c44a902be1f4eddb3e031f06
lemma binomDelta_step_down (m k : ℕ) (hk : 1 ≤ k) (hm : m < 2*k) :
    ((m+1).choose (k+1) : ℤ) - (m+1).choose k ≤
      (m.choose (k+1) : ℤ) - m.choose k := by
  obtain ⟨j, rfl⟩ := Nat.exists_eq_add_of_le' hk
  have hc := FirstWide.choose_step_nonpos (n := m) (k := j) (by omega)
  have hc' : (m.choose (j+1) : ℤ) ≤ m.choose j := by exact_mod_cast hc
  have hp := binomDelta_pascal m j
  linarith
-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_mono_center ec321ef0044a12f64c517c4af2506fa241a7c6c9d5fedf84304b4e337b0bfcc6
lemma binomDelta_mono_center {k a b : ℕ} (h : 2*k ≤ a) (hab : a ≤ b) :
    (a.choose (k+1) : ℤ) - a.choose k ≤
      (b.choose (k+1) : ℤ) - b.choose k := by
  induction b, hab using Nat.le_induction with
  | base => exact le_rfl
  | succ b hab ih => exact ih.trans (binomDelta_step_up b k (by omega))
-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_mono 3733c9bd514bff9d1e54f78c31f1c3bb887ac496fa27155bc3ae1896024505bc
lemma binomDelta_mono {k a b : ℕ} (h : 2*k+1 ≤ a) (hab : a ≤ b) :
    (a.choose (k+1) : ℤ) - a.choose k ≤
      (b.choose (k+1) : ℤ) - b.choose k :=
  binomDelta_mono_center (by omega) hab
-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_antitone e00587a59d623ae970a2e6b8449c42a95bcba7b09e722a7455893bea790fbc84
lemma binomDelta_antitone {k a b : ℕ} (hk : 1 ≤ k) (hb : b ≤ 2*k) (hab : a ≤ b) :
    (b.choose (k+1) : ℤ) - b.choose k ≤
      (a.choose (k+1) : ℤ) - a.choose k := by
  induction b, hab using Nat.le_induction with
  | base => exact le_rfl
  | succ b hab ih =>
    exact (binomDelta_step_down b k hk (by omega)).trans (ih (by omega))
-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_central a9a0866e169a567f704ba70c3f94a3326b556a5d4d5e708757df0b069c9ab0b5
lemma binomDelta_central (j : ℕ) :
    ((2*j).choose (j+1) : ℤ) - (2*j).choose j = -(catalan j : ℤ) := by
  have hn : 2*j-j=j := by omega
  have he := Nat.choose_succ_right_eq (2*j) j
  rw [hn] at he
  have he' : ((2*j).choose (j+1) : ℤ) * (j+1) = (2*j).choose j * (j : ℤ) := by exact_mod_cast he
  have hc : ((j:ℤ)+1) * catalan j = (2*j).choose j := by
    exact_mod_cast succ_mul_catalan_eq_centralBinom j
  apply (mul_right_cancel₀ (show (j : ℤ)+1 ≠ 0 by omega))
  nlinarith
-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_floor a37ec000d0863f2d11fa44028722398d17cfaaad4ddfe20362bca6a82637fea3
lemma binomDelta_floor (m j : ℕ) :
    -(catalan j : ℤ) ≤ (m.choose (j+1) : ℤ) - m.choose j := by
  by_cases hj : j=0
  · subst j; simp; omega
  rw [← binomDelta_central j]
  rcases le_total m (2*j) with hm | hm
  · exact binomDelta_antitone (by omega) le_rfl hm
  · exact binomDelta_mono_center le_rfl hm
-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN lemma Erdos993G1.ThirdWide.binom_shift_floor a592cf3eb3f25da9df2ce8e06a06b0c4f24c62cebbf5feacd89aca6c0a7e1b36
lemma binom_shift_floor (m k t : ℕ) :
    -(if t ≤ k then (catalan (k-t) : ℤ) else 0) ≤
      FirstWide.binomCoeff m ((k : ℤ)-t+1) -
        FirstWide.binomCoeff m ((k : ℤ)-t) := by
  by_cases htk : t ≤ k
  · have hz : (k : ℤ)-t = ((k-t : ℕ) : ℤ) := by omega
    rw [hz,FirstWide.binomCoeff_nat_add_one,FirstWide.binomCoeff_nat,if_pos htk]
    exact binomDelta_floor m (k-t)
  · rw [if_neg htk,neg_zero]
    by_cases he : t = k+1
    · have hz : (k : ℤ)-t = -1 := by omega
      norm_num [hz,FirstWide.binomCoeff]
    · have hz : (k : ℤ)-t+1 < 0 := by omega
      rw [FirstWide.binomCoeff_neg _ hz,
        FirstWide.binomCoeff_neg _ (show (k : ℤ)-t < 0 by omega)]
      omega
-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN lemma Erdos993G1.ThirdWide.cover_catalan_bound_five 5514fb3dec038bb03d32709bf6c4f981e3ec6dc7914d9d17a53926ae914dae4a
lemma cover_catalan_bound_five (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hC : C.card = 5)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C)
    (n k : ℕ) (hn : Fintype.card X = n+5) :
    (n.choose (k+1) : ℤ) - n.choose k -
      5*(if 1 ≤ k then (catalan (k-1) : ℤ) else 0) -
      10*(if 2 ≤ k then (catalan (k-2) : ℤ) else 0) -
      10*(if 3 ≤ k then (catalan (k-3) : ℤ) else 0) -
      5*(if 4 ≤ k then (catalan (k-4) : ℤ) else 0) -
      (if 5 ≤ k then (catalan (k-5) : ℤ) else 0) ≤ delta F (k : ℤ) := by
  let b : ℕ → ℤ := fun t => if t = 0 then
    (n.choose (k+1) : ℤ) - n.choose k else
    -(if t ≤ k then (catalan (k-t) : ℤ) else 0)
  have h := cover_rank_bound_five F C hC hcover k b ?_ ?_
  · convert h using 1 <;> dsimp [b] <;> ring
  · intro t ht
    simp only [b,if_neg (by omega : t ≠ 0)]
    split_ifs <;> omega
  · intro S hSC hS
    by_cases hzero : S.card = 0
    · have he : S = ∅ := card_eq_zero.mp hzero
      subst S
      rw [cover_available_empty F C,hn,hC]
      norm_num only [Nat.add_sub_cancel,card_empty,Nat.cast_zero,sub_zero]
      simp [b,FirstWide.binomCoeff_nat_add_one,FirstWide.binomCoeff_nat]
    · simpa only [b,if_neg hzero] using binom_shift_floor
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card k S.card

-- Supporting identity (attributed to C-U3-T/C-U3-F; carried as a lemma, not
-- part of the terminal conjunction; catalan_gap5_pos is deliberately
-- EXCLUDED, since it is an instance of the already formally verified
-- E993-R25-CATALAN-GAP-MONOTONE-RATIO at tau = 5).
-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN lemma Erdos993G1.ThirdWide.catalan_recurrence_int 6e2e279c525d3b83c738980bfd2b288b9d917aaac96159d2d4d2778940e140c3
lemma catalan_recurrence_int (n : ℕ) :
    ((n:ℤ)+2) * catalan (n+1) = (4*n+2) * catalan n := by
  have hc := Nat.succ_mul_centralBinom_succ n
  rw [← succ_mul_catalan_eq_centralBinom (n+1), ← succ_mul_catalan_eq_centralBinom n] at hc
  have he : ((n:ℤ)+1) * (((n:ℤ)+2) * catalan (n+1)) =
      2*(2*n+1)*(((n:ℤ)+1)*catalan n) := by exact_mod_cast hc
  apply (mul_left_cancel₀ (show (n:ℤ)+1 ≠ 0 by omega))
  nlinarith [he]
-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN lemma Erdos993G1.ThirdWide.catalan_gap5_identity 04bb5c4f3c9061a22da51265d77d6cf27ece022558bcb7b7b244cfee33e2357a
lemma catalan_gap5_identity (t : ℕ) :
    (((t:ℤ)+2)*((t:ℤ)+3)*((t:ℤ)+4)*((t:ℤ)+5)*((t:ℤ)+6)*((t:ℤ)+7)) *
      ((catalan (t+6):ℤ) - 5*catalan (t+4) - 10*catalan (t+3) -
        10*catalan (t+2) - 5*catalan (t+1) - catalan t) =
      (-70560 - 125376*(t:ℤ) + 125130*(t:ℤ)^2 + 266145*(t:ℤ)^3 +
        137475*(t:ℤ)^4 + 28071*(t:ℤ)^5 + 1995*(t:ℤ)^6) * catalan t := by
  have e0 := catalan_recurrence_int t
  have e1 := catalan_recurrence_int (t+1)
  have e2 := catalan_recurrence_int (t+2)
  have e3 := catalan_recurrence_int (t+3)
  have e4 := catalan_recurrence_int (t+4)
  have e5 := catalan_recurrence_int (t+5)
  norm_num only [Nat.cast_add, Nat.cast_ofNat, show t+1+1=t+2 by omega,
    show t+2+1=t+3 by omega, show t+3+1=t+4 by omega, show t+4+1=t+5 by omega,
    show t+5+1=t+6 by omega] at e1 e2 e3 e4 e5
  linear_combination
    (-32760 + 6846*(t:ℤ) + 51425*(t:ℤ)^2 + 31055*(t:ℤ)^3 + 6775*(t:ℤ)^4 + 499*(t:ℤ)^5)*e0 +
    (-6720 + 7992*(t:ℤ) + 17208*(t:ℤ)^2 + 8838*(t:ℤ)^3 + 1788*(t:ℤ)^4 + 126*(t:ℤ)^5)*e1 +
    (3024 + 8544*(t:ℤ) + 7648*(t:ℤ)^2 + 2978*(t:ℤ)^3 + 524*(t:ℤ)^4 + 34*(t:ℤ)^5)*e2 +
    (4464 + 7116*(t:ℤ) + 4408*(t:ℤ)^2 + 1327*(t:ℤ)^3 + 194*(t:ℤ)^4 + 11*(t:ℤ)^5)*e3 +
    (2640 + 3868*(t:ℤ) + 2178*(t:ℤ)^2 + 592*(t:ℤ)^3 + 78*(t:ℤ)^4 + 4*(t:ℤ)^5)*e4 +
    (720 + 1044*(t:ℤ) + 580*(t:ℤ)^2 + 155*(t:ℤ)^3 + 20*(t:ℤ)^4 + (t:ℤ)^5)*e5

-- === TERMINAL DECLARATION ===
-- VERITYOS ENTRY 51 END

-- VERITYOS ENTRY 52 BEGIN theorem Erdos993G1.ThirdWide.card5_cells_and_cover_catalan_award 55ecedebda39541eb0f5e1f8a959de8140fd55cdbe98218d68803f9934037f92
theorem card5_cells_and_cover_catalan_award :
    (∀ {X : Type u} [Fintype X] [DecidableEq X] (F : SimpleGraph X) [DecidableRel F.Adj],
        F.IsAcyclic → Fintype.card X = 9 → ∀ (C0 : Finset X), C0.card ≤ 5 →
        (∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) → (9 : ℤ) ≤ delta F 1) ∧
    (∀ {X : Type u} [Fintype X] [DecidableEq X] (F : SimpleGraph X) [DecidableRel F.Adj],
        F.IsAcyclic → Fintype.card X = 11 → ∀ (C0 : Finset X), C0.card ≤ 5 →
        (∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) → (5 : ℤ) ≤ delta F 2) ∧
    (∀ {X : Type u} [Fintype X] [DecidableEq X] (F : SimpleGraph X) [DecidableRel F.Adj],
        F.IsAcyclic → Fintype.card X = 13 → ∀ (C0 : Finset X), C0.card ≤ 5 →
        (∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) → (9 : ℤ) ≤ delta F 3) ∧
    (∀ {X : Type u} [Fintype X] [DecidableEq X] (F : SimpleGraph X) [DecidableRel F.Adj],
        F.IsAcyclic → Fintype.card X = 15 → ∀ (C0 : Finset X), C0.card ≤ 5 →
        (∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) → (21 : ℤ) ≤ delta F 4) ∧
    (∀ {X : Type u} [Fintype X] [DecidableEq X] (F : SimpleGraph X) [DecidableRel F.Adj],
        F.IsAcyclic → Fintype.card X = 17 → ∀ (C0 : Finset X), C0.card ≤ 5 →
        (∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) → (42 : ℤ) ≤ delta F 5) ∧
    (∀ {X : Type u} [Fintype X] [DecidableEq X] (F : SimpleGraph X) [DecidableRel F.Adj]
        (C : Finset X), C.card = 5 → (∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) →
        ∀ n k : ℕ, Fintype.card X = n + 5 →
        (n.choose (k+1) : ℤ) - n.choose k - 5*(if 1 ≤ k then (catalan (k-1) : ℤ) else 0)
          - 10*(if 2 ≤ k then (catalan (k-2) : ℤ) else 0) - 10*(if 3 ≤ k then (catalan (k-3) : ℤ) else 0)
          - 5*(if 4 ≤ k then (catalan (k-4) : ℤ) else 0) - (if 5 ≤ k then (catalan (k-5) : ℤ) else 0)
          ≤ delta F (k : ℤ)) :=
  ⟨fun {X} _ _ F _ hF hcard C0 hC0 hcover0 => cell_9 F hF hcard C0 hC0 hcover0,
   fun {X} _ _ F _ hF hcard C0 hC0 hcover0 => cell_11 F hF hcard C0 hC0 hcover0,
   fun {X} _ _ F _ hF hcard C0 hC0 hcover0 => cell_13 F hF hcard C0 hC0 hcover0,
   fun {X} _ _ F _ hF hcard C0 hC0 hcover0 => cell_15 F hF hcard C0 hC0 hcover0,
   fun {X} _ _ F _ hF hcard C0 hC0 hcover0 => cell_17 F hF hcard C0 hC0 hcover0,
   fun {X} _ _ F _ C hC hcover n k hn => cover_catalan_bound_five F C hC hcover n k hn⟩

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 52 END

