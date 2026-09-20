import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition Erdos993G1.indepCount 858f5de3d80b67c1390e828786f252d3d6d020b7311b0039071e14bd1407c4a9
universe u

noncomputable def Erdos993G1.indepCount {V : Type u}
    (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)

-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition Erdos993G1.coeff 92ee6695ec9af348314ae6543d4102a54df31fa504644e0a0f386d6b81bd44cd
noncomputable def Erdos993G1.coeff {V : Type u}
    (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0

-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition Erdos993G1.delta b34fa17ed22bb7174290541832e4f5abe5ec3e5ea329b7ab516d5b2db76eb201
noncomputable def Erdos993G1.delta {V : Type u}
    (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k

-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition Erdos993G1.firstDescent 313f419876bd7051ace88951c422a36bde99b098190313d6954d65d888befd99
noncomputable def Erdos993G1.firstDescent {V : Type u}
    (F : SimpleGraph V) : ℕ :=
  sInf {k : ℕ | Erdos993G1.delta F (k : ℤ) < 0}

-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition Erdos993G1.vertexDegree 0abc03201f8e96696be3a79d027d32bf1b282c722165cf63bf228b01ed59d555
noncomputable def Erdos993G1.vertexDegree {V : Type u}
    (F : SimpleGraph V) (v : V) : ℕ :=
  Nat.card (F.neighborSet v)

-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition Erdos993G1.closedNeighborhood 589a193da9846f7dfa34a178b346f3466b219affcd372591acccba327bc5c9a3
def Erdos993G1.closedNeighborhood {V : Type u}
    (T : SimpleGraph V) (v : V) : Set V :=
  {w | w = v ∨ T.Adj v w}

-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition Erdos993G1.deleteVerts 8044160bd96993004323eaebfb80e42820d15779af6158f7906dd76e79c61378
def Erdos993G1.deleteVerts {V : Type u}
    (F : SimpleGraph V) (S : Set V) : SimpleGraph {w : V // w ∉ S} :=
  F.induce Sᶜ

-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition Erdos993G1.ambientA b504fd5411779932120471f20ba7398be72724b13e87404b5b6ad5a7df9a3a55
def Erdos993G1.ambientA {V : Type u}
    (T : SimpleGraph V) (v : V) :=
  Erdos993G1.deleteVerts T (Erdos993G1.closedNeighborhood T v)

-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition Erdos993G1.ambientH 0c426523e170fbac06f689b2cbcb0d97f5ee5bdd220162360724a82b4c7fe0be
def Erdos993G1.ambientH {V : Type u}
    (T : SimpleGraph V) (v g : V) :=
  Erdos993G1.deleteVerts T (Erdos993G1.closedNeighborhood T v ∪ {g})

-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN definition Erdos993G1.residual 8ed38df1b3849e3213fd89fae58371f9982b84585b2a180e44dc62857cd71d7e
def Erdos993G1.residual {V : Type u}
    (T : SimpleGraph V) (v g : V) :=
  Erdos993G1.deleteVerts T
    (Erdos993G1.closedNeighborhood T v ∪ Erdos993G1.closedNeighborhood T g)

-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN definition Erdos993G1.residualOrder f78b693e38755673f5859f82b106377d6e270f5001ef539f0bc8704ac2287450
noncomputable def Erdos993G1.residualOrder {V : Type u}
    (T : SimpleGraph V) (v g : V) : ℕ :=
  Nat.card {w : V //
    w ∉ Erdos993G1.closedNeighborhood T v ∪ Erdos993G1.closedNeighborhood T g}

-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN definition Erdos993G1.ordinaryG1Guards d2845e8dec482006b4613d96fb63af68333d7ee29c1ceba51751342ec01a07ed
def Erdos993G1.ordinaryG1Guards {V : Type u}
    (T : SimpleGraph V) (v s g : V) (p : ℕ) : Prop :=
  T.IsTree ∧
  Erdos993G1.vertexDegree T v = 1 ∧ T.Adj v s ∧
  Erdos993G1.vertexDegree T s = 2 ∧ T.Adj s g ∧ g ≠ v ∧
  p = Erdos993G1.firstDescent T + 1 ∧
  Erdos993G1.delta (Erdos993G1.ambientA T v) (p : ℤ) +
    Erdos993G1.delta (Erdos993G1.ambientH T v g) ((p : ℤ) - 1) < 0 ∧
  2 * p - 3 < Erdos993G1.residualOrder T v g ∧
  Erdos993G1.firstDescent (Erdos993G1.residual T v g) < p - 2


namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)

-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN definition Erdos993G1.FirstWide.stratum 40bf47352e6afe078b65c1712a28f55d023bf8006cb8700f480a42e4dc27925c
namespace FirstWide

noncomputable def stratum {X : Type u} [Fintype X]
    (G : SimpleGraph X) (M : Finset X) (k j : ℕ) : Finset (Finset X) := by
  classical
  exact (G.indepSetFinset k).filter (fun S => (S ∩ M).card = j)

end FirstWide
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN definition Erdos993G1.FirstWide.binomCoeff 15be04fe3358ec671f28da2db52c757627e101992d8d40791181b1b1e5f06a6d
namespace FirstWide

def binomCoeff (n : ℕ) (k : ℤ) : ℤ :=
  if 0 ≤ k then (n.choose k.toNat : ℤ) else 0

end FirstWide
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma Erdos993G1.isNIndepSet_zero_iff 9df9b861d801c09b5ab131b483e26dacc5056eb6ffb7867c7523a51e8ed843fb
lemma isNIndepSet_zero_iff (S : Finset V) :
    F.IsNIndepSet 0 S ↔ S = ∅ := by
  simpa only [SimpleGraph.isNClique_compl] using
    (SimpleGraph.isNClique_zero (G := Fᶜ) (s := S))

-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma Erdos993G1.isNIndepSet_one_iff b12f77f59d3690c92c7c8bada90d9b4c5f1449b5b17c2e5574308cfbf54a0536
lemma isNIndepSet_one_iff (S : Finset V) :
    F.IsNIndepSet 1 S ↔ ∃ a, S = {a} := by
  classical
  simpa only [SimpleGraph.isNClique_compl] using
    (SimpleGraph.isNClique_one (G := Fᶜ) (s := S))

-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma Erdos993G1.indepCount_eq_card_indepSetFinset 4c59444af666076a0ce8c355415235545a1d9c97ae721113599f63dcfb489a31
lemma indepCount_eq_card_indepSetFinset [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (k : ℕ) :
    indepCount F k = ((F.indepSetFinset k).card : ℤ) := by
  simp only [indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
    SimpleGraph.indepSetFinset]

-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma Erdos993G1.indepCount_nonneg d5a62e3c3455c4d50f47db7e930f327551be59af8aaf1acfb08fff9a88e86136
lemma indepCount_nonneg (k : ℕ) : 0 ≤ indepCount F k := by
  exact Int.natCast_nonneg _

-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma Erdos993G1.indepCount_zero acffad838916a1b13c96fef7c654f39104b03af428110c4da5e9d500b0e07674
lemma indepCount_zero [Finite V] : indepCount F 0 = 1 := by
  classical
  letI := Fintype.ofFinite V
  rw [indepCount_eq_card_indepSetFinset]
  have h : F.indepSetFinset 0 = {∅} := by
    ext S
    simp [SimpleGraph.mem_indepSetFinset_iff, isNIndepSet_zero_iff]
  simp [h]

-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma Erdos993G1.indepCount_one 2c3536cb34ec79e12b8147cd94b40ec4f4c21269c2fc1c9efd90a558e487a31e
lemma indepCount_one [Finite V] : indepCount F 1 = (Nat.card V : ℤ) := by
  classical
  letI := Fintype.ofFinite V
  rw [indepCount_eq_card_indepSetFinset]
  have h : F.indepSetFinset 1 = Finset.univ.image (fun a : V => ({a} : Finset V)) := by
    ext S
    simp only [SimpleGraph.mem_indepSetFinset_iff, isNIndepSet_one_iff,
      Finset.mem_image, Finset.mem_univ, true_and]
    exact ⟨fun ⟨a, ha⟩ => ⟨a, ha.symm⟩, fun ⟨a, ha⟩ => ⟨a, ha.symm⟩⟩
  rw [h, Finset.card_image_of_injective _ Finset.singleton_injective,
    Finset.card_univ, Nat.card_eq_fintype_card]

-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma Erdos993G1.indepCount_eq_zero_of_indepNum_lt 123be264ea42836f1785056098a62c5d48fa1d801d8b6a9393f0f5b0f96e0bb6
lemma indepCount_eq_zero_of_indepNum_lt [Finite V] {k : ℕ}
    (hk : F.indepNum < k) : indepCount F k = 0 := by
  haveI : IsEmpty {S : Finset V // F.IsNIndepSet k S} :=
    ⟨fun S => by
      have h := S.property.isIndepSet.card_le_indepNum
      rw [S.property.card_eq] at h
      exact (not_le_of_gt hk) h⟩
  simp [indepCount]

-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma Erdos993G1.indepCount_indepNum_pos c554d650c08283f9a98deb95737d52a97e95ae100d09a228280fd7cd658e6202
lemma indepCount_indepNum_pos [Finite V] :
    0 < indepCount F F.indepNum := by
  obtain ⟨S, hS⟩ := F.exists_isNIndepSet_indepNum
  haveI : Nonempty {S : Finset V // F.IsNIndepSet F.indepNum S} := ⟨⟨S, hS⟩⟩
  unfold indepCount
  exact_mod_cast (Nat.card_pos (α := {S : Finset V // F.IsNIndepSet F.indepNum S}))

-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma Erdos993G1.coeff_nat 03f00ca029c7e10a6278ad907c2d6e5891668cdff802ec6768f9f93e51ed47f7
lemma coeff_nat (k : ℕ) : coeff F (k : ℤ) = indepCount F k := by
  simp [coeff]

-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma Erdos993G1.coeff_of_neg bcf669545ab3401ca5ba88ac2a8cf77144df87049057892e19b7f7728b3174fc
lemma coeff_of_neg {k : ℤ} (hk : k < 0) : coeff F k = 0 := by
  simp [coeff, not_le_of_gt hk]

-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma Erdos993G1.delta_nat a7a02236294541ef40fa02c9d9f0dd02052d13536f6523f462e2d5b96ff04f9e
lemma delta_nat (k : ℕ) :
    delta F (k : ℤ) = indepCount F (k + 1) - indepCount F k := by
  simpa only [delta, Nat.cast_add, Nat.cast_one] using
    congrArg₂ (· - ·) (coeff_nat F (k + 1)) (coeff_nat F k)

-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma Erdos993G1.delta_zero c43a89269ad4d7bad8f5c8faa0222710d3815a826516edd0955a80bef67ebcb8
lemma delta_zero [Finite V] : delta F 0 = (Nat.card V : ℤ) - 1 := by
  simpa [indepCount_zero, indepCount_one] using (delta_nat F 0)

-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma Erdos993G1.delta_neg_one bfc4d805f6742022ecad22b2e0a4815d4b9dbdf74ee1a0c0d9029447718946dc
lemma delta_neg_one [Finite V] : delta F (-1) = 1 := by
  simp [delta, coeff, indepCount_zero]

-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma Erdos993G1.descentSet_nonempty a350a656e5d6dc22c0ce9c46cfdf112a3e20b1d02183576c24f5e68684fb6e37
lemma descentSet_nonempty [Finite V] :
    {k : ℕ | delta F (k : ℤ) < 0}.Nonempty := by
  refine ⟨F.indepNum, ?_⟩
  change delta F (F.indepNum : ℤ) < 0
  rw [delta_nat, indepCount_eq_zero_of_indepNum_lt F (Nat.lt_succ_self _)]
  have h := indepCount_indepNum_pos F
  omega

-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma Erdos993G1.delta_firstDescent_neg 89b0cab7b8771183c2d0b5ac70403180c74b49b516232480839218649f06509c
lemma delta_firstDescent_neg [Finite V] :
    delta F (firstDescent F : ℤ) < 0 := by
  exact Nat.sInf_mem (descentSet_nonempty F)

-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma Erdos993G1.delta_nonneg_of_lt_firstDescent 3392871c932e55446fbc42daf9e9c43a4e1cb08354049e72cb027cb6d19bf932
lemma delta_nonneg_of_lt_firstDescent {k : ℕ} (hk : k < firstDescent F) :
    0 ≤ delta F (k : ℤ) := by
  exact le_of_not_gt (Nat.notMem_of_lt_sInf hk)

-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma Erdos993G1.firstDescent_le_of_delta_neg 28265626e5cf310d23d33068a703ee3331532a0e2606bec2f98f236af0c037d9
lemma firstDescent_le_of_delta_neg {k : ℕ} (hk : delta F (k : ℤ) < 0) :
    firstDescent F ≤ k :=
  Nat.sInf_le hk

end Erdos993G1


universe w

namespace Erdos993G1

variable {V : Type u} {W : Type w} {F : SimpleGraph V} {G : SimpleGraph W}

-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma Erdos993G1.isNIndepSet_map_iso bd57ae9ed83550b3ae866881446b3f65e474c92abf31958c2ec9fceb1ecebea4
lemma isNIndepSet_map_iso (e : F ≃g G) (k : ℕ) (S : Finset V) :
    G.IsNIndepSet k (S.map e.toEquiv.toEmbedding) ↔ F.IsNIndepSet k S := by
  constructor
  · intro h
    refine ⟨?_, by simpa using h.card_eq⟩
    intro a ha b hb hab hAdj
    exact h.isIndepSet (by simpa using ha) (by simpa using hb)
      (e.injective.ne hab) (e.map_adj_iff.mpr hAdj)
  · intro h
    refine ⟨?_, by simpa using h.card_eq⟩
    intro a ha b hb hab hAdj
    obtain ⟨x, hx, rfl⟩ := Finset.mem_map.mp ha
    obtain ⟨y, hy, rfl⟩ := Finset.mem_map.mp hb
    exact h.isIndepSet hx hy (fun hxy => hab (congrArg e hxy))
      (e.map_adj_iff.mp hAdj)

-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma Erdos993G1.indepCount_iso f71434b13438181169e26ebd673578c3c4195847c1f0e972ecc94516cacde2c6
lemma indepCount_iso (e : F ≃g G) (k : ℕ) :
    indepCount F k = indepCount G k := by
  let eS : {S : Finset V // F.IsNIndepSet k S} ≃
      {S : Finset W // G.IsNIndepSet k S} :=
    { toFun := fun S => ⟨S.val.map e.toEquiv.toEmbedding,
        (isNIndepSet_map_iso e k S.val).mpr S.property⟩
      invFun := fun S => ⟨S.val.map e.symm.toEquiv.toEmbedding,
        (isNIndepSet_map_iso e.symm k S.val).mpr S.property⟩
      left_inv := fun S => by
        apply Subtype.ext
        simp [Finset.map_map]
      right_inv := fun S => by
        apply Subtype.ext
        simp [Finset.map_map] }
  exact congrArg (fun n : ℕ => (n : ℤ)) (Nat.card_congr eS)

-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma Erdos993G1.coeff_iso 3631b58dff1d09b36ceb6d30994a98a373baa90c430e6b6848fce34a00f7c1a9
lemma coeff_iso (e : F ≃g G) (k : ℤ) : coeff F k = coeff G k := by
  simp only [coeff, indepCount_iso e]

-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma Erdos993G1.delta_iso 6827baaeefaade9988a5b47db939fb51b758021e44a3205b90ae8ca504f80599
lemma delta_iso (e : F ≃g G) (k : ℤ) : delta F k = delta G k := by
  simp only [delta, coeff_iso e]

-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma Erdos993G1.firstDescent_iso f953a9d539a63b112ee6ea9442f78bdee854281e3ae2a6ab9c778bea34fe54dc
lemma firstDescent_iso (e : F ≃g G) : firstDescent F = firstDescent G := by
  simp only [firstDescent, delta_iso e]

-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma Erdos993G1.vertexDegree_eq_degree 1d25716bb2cfa9c9539a083cbf0540c1058822084e51f30235b21366df7eec48
lemma vertexDegree_eq_degree (a : V) [Fintype (F.neighborSet a)] :
    vertexDegree F a = F.degree a := by
  rw [vertexDegree, Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree]

-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma Erdos993G1.deleteVerts_isAcyclic fa008ac82c212d1670b3452bfae66fd9cdc7d0daf5cf0730113bca4db67f24d6
lemma deleteVerts_isAcyclic (h : F.IsAcyclic) (S : Set V) :
    (deleteVerts F S).IsAcyclic :=
  h.induce _

-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma Erdos993G1.residual_isAcyclic 171132e213d52d4989b295159e09daa1eaaf63f1c17c19916ef0fd2154c70202
lemma residual_isAcyclic (h : F.IsAcyclic) (v g : V) :
    (residual F v g).IsAcyclic :=
  h.induce _

-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma Erdos993G1.residualOrder_eq_card 849a5567c708fcc6b316d35358f7d832501d64d77ea0e18262b92d5a4e589d95
lemma residualOrder_eq_card (v g : V) :
    residualOrder F v g =
      Nat.card {a : V // a ∉ closedNeighborhood F v ∪ closedNeighborhood F g} :=
  rfl

end Erdos993G1


namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)

-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma Erdos993G1.isNIndepSet_pair_iff c7fe22b14d4127788420f1fc872c6908e1c8e03d5089db1a4512366a1c6011cd
lemma isNIndepSet_pair_iff [DecidableEq V] (a b : V) :
    F.IsNIndepSet 2 {a, b} ↔ a ≠ b ∧ ¬F.Adj a b := by
  by_cases h : a = b
  · subst b
    simp [SimpleGraph.isNIndepSet_iff]
  · simp [SimpleGraph.isNIndepSet_iff, SimpleGraph.isIndepSet_iff, Set.Pairwise, h, F.adj_comm] <;> tauto

-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma Erdos993G1.sym2_toFinset_injective b6bb80d1fc0be2dc048f714854ea2d7ae9649fbceb0e5bbffbd1fae3d1947acd
lemma sym2_toFinset_injective [DecidableEq V] :
    Function.Injective (Sym2.toFinset : Sym2 V → Finset V) := by
  intro a b h
  apply Sym2.ext
  intro v
  simpa only [Sym2.mem_toFinset] using iff_of_eq (congrArg (v ∈ ·) h)

-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN lemma Erdos993G1.indepSetFinset_two_eq 39a4bb3841ed900d0110289548de64819de9508cc2754cd12dd313c2afe30cc8
lemma indepSetFinset_two_eq [Fintype V] [DecidableEq V] [DecidableRel F.Adj] :
    F.indepSetFinset 2 = (Fᶜ.edgeFinset).image Sym2.toFinset := by
  ext S
  constructor
  · intro h
    have hS := SimpleGraph.mem_indepSetFinset_iff.mp h
    obtain ⟨a, b, hab, rfl⟩ := Finset.card_eq_two.mp hS.card_eq
    refine Finset.mem_image.mpr ⟨s(a, b), ?_, Sym2.toFinset_mk_eq⟩
    simpa only [SimpleGraph.mem_edgeFinset, SimpleGraph.mem_edgeSet,
      SimpleGraph.compl_adj] using (isNIndepSet_pair_iff F a b).mp hS
  · intro h
    obtain ⟨e, he, rfl⟩ := Finset.mem_image.mp h
    induction e using Sym2.inductionOn with
    | hf a b =>
      rw [SimpleGraph.mem_indepSetFinset_iff, Sym2.toFinset_mk_eq,
        isNIndepSet_pair_iff]
      simpa only [SimpleGraph.mem_edgeFinset, SimpleGraph.mem_edgeSet,
        SimpleGraph.compl_adj] using he

-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN lemma Erdos993G1.indepCount_two_add_edges a01f026068c216985f79412914a708de863f8d52ac60d7369e2b85a21c58c014
lemma indepCount_two_add_edges [Finite V] :
    indepCount F 2 + (Nat.card F.edgeSet : ℤ) = ((Nat.card V).choose 2 : ℤ) := by
  classical
  letI := Fintype.ofFinite V
  have hd : Disjoint F.edgeFinset Fᶜ.edgeFinset :=
    SimpleGraph.disjoint_edgeFinset.mpr disjoint_compl_right
  have hu : F.edgeFinset ∪ Fᶜ.edgeFinset = (⊤ : SimpleGraph V).edgeFinset := by
    ext e
    induction e using Sym2.inductionOn with
    | hf a b =>
      by_cases hab : a = b
      · subst b
        simp
      · simp [SimpleGraph.compl_adj, hab]
        exact Classical.em _
  have ht : F.edgeFinset.card + Fᶜ.edgeFinset.card = (Fintype.card V).choose 2 := by
    rw [← Finset.card_union_of_disjoint hd, hu,
      SimpleGraph.card_edgeFinset_top_eq_card_choose_two]
  rw [indepCount_eq_card_indepSetFinset, indepSetFinset_two_eq,
    Finset.card_image_of_injective _ sym2_toFinset_injective,
    Nat.card_eq_fintype_card, Nat.card_eq_fintype_card,
    ← SimpleGraph.edgeFinset_card]
  exact_mod_cast (by omega : Fᶜ.edgeFinset.card + F.edgeFinset.card = (Fintype.card V).choose 2)

end Erdos993G1


namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)

-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN lemma Erdos993G1.indepSetFinset_eq_filter_powersetCard ec9d1ede162d82ed94a34a38672bad65fc69ea0b778b5162ae78c5fec73a5628
lemma indepSetFinset_eq_filter_powersetCard [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (k : ℕ) :
    F.indepSetFinset k = ((Finset.univ : Finset V).powersetCard k).filter
      (fun B : Finset V => F.IsIndepSet B) := by
  ext B
  simp [SimpleGraph.mem_indepSetFinset_iff, SimpleGraph.isNIndepSet_iff, and_comm]

-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN lemma Erdos993G1.card_nonindep_pairs 96c84ad8516cd9224be112085b17e6b4dceb988fd19ce9e39ffaad28a4804cbc
lemma card_nonindep_pairs [Fintype V] [DecidableEq V] [DecidableRel F.Adj] :
    (((Finset.univ : Finset V).powersetCard 2).filter
      (fun E : Finset V => ¬F.IsIndepSet E)).card = Nat.card F.edgeSet := by
  have hp := Finset.card_filter_add_card_filter_not
    (s := (Finset.univ : Finset V).powersetCard 2)
    (fun E : Finset V => F.IsIndepSet E)
  rw [← indepSetFinset_eq_filter_powersetCard, Finset.card_powersetCard,
    Finset.card_univ] at hp
  have he := indepCount_two_add_edges F
  rw [indepCount_eq_card_indepSetFinset,
    Nat.card_eq_fintype_card (α := V)] at he
  omega

-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN lemma Erdos993G1.sum_card_filter_swap db506bda8bc6b666134551b5bc0fd50e22daf1b537ec59f21be1da84eb4ffe98
lemma sum_card_filter_swap {A : Type u} {B : Type w}
    (s : Finset A) (t : Finset B) (p : A → B → Prop)
    [DecidableRel p] :
    ∑ a ∈ s, (t.filter (p a)).card =
      ∑ b ∈ t, (s.filter (fun a => p a b)).card := by
  simp only [Finset.card_eq_sum_ones, Finset.sum_filter]
  exact Finset.sum_comm

-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN lemma Erdos993G1.sum_nonindep_pair_incidence da829ee128471804d3016cd47dc81dc700c969ffe760cdfe792d805388f36292
lemma sum_nonindep_pair_incidence [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] :
    ∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
      ((B.powersetCard 2).filter (fun E : Finset V => ¬F.IsIndepSet E)).card =
        Nat.card F.edgeSet * (Fintype.card V - 2) := by
  classical
  let E := ((Finset.univ : Finset V).powersetCard 2).filter
    (fun S : Finset V => ¬F.IsIndepSet S)
  have hlocal (B : Finset V) :
      (B.powersetCard 2).filter (fun S : Finset V => ¬F.IsIndepSet S) =
        E.filter (fun S => S ⊆ B) := by
    ext S
    simp [E, and_assoc, and_left_comm, and_comm]
  calc
    _ = ∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
        (E.filter (fun S => S ⊆ B)).card := by
      apply Finset.sum_congr rfl
      intro B _
      rw [hlocal]
    _ = ∑ S ∈ E, (((Finset.univ : Finset V).powersetCard 3).filter
        (fun B => S ⊆ B)).card :=
      sum_card_filter_swap _ _ (fun B S : Finset V => S ⊆ B)
    _ = ∑ S ∈ E, (Fintype.card V - 2) := by
      apply Finset.sum_congr rfl
      intro S hS
      have hcard : S.card = 2 := (Finset.mem_powersetCard.mp
        (Finset.mem_filter.mp hS).1).2
      rw [Finset.card_filter_powersetCard_subset S Finset.univ 3
        (Finset.subset_univ _) (by omega), hcard, Finset.card_univ]
      simp
    _ = E.card * (Fintype.card V - 2) := by simp
    _ = _ := by rw [show E.card = Nat.card F.edgeSet from card_nonindep_pairs F]

-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN lemma Erdos993G1.sum_indep_indicator e8656c5832d89388faa9e5fbe465d97c9212944d86545795e43360d7cf446d54
lemma sum_indep_indicator [Fintype V] [DecidableEq V] [DecidableRel F.Adj]
    (k : ℕ) :
    ∑ B ∈ (Finset.univ : Finset V).powersetCard k,
      (if F.IsIndepSet B then 1 else 0) = (F.indepSetFinset k).card := by
  rw [indepSetFinset_eq_filter_powersetCard]
  simp only [Finset.card_eq_sum_ones, Finset.sum_filter]

end Erdos993G1


namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)

-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN lemma Erdos993G1.triple_local_identity 1987228dfddb76922331fd7897112e6fbb9500d655adc833b004028ebafcd53d
lemma triple_local_identity [DecidableEq V] [DecidableRel F.Adj]
    (hF : F.IsAcyclic) (B : Finset V) (hB : B.card = 3) :
    (if F.IsIndepSet B then 1 else 0) +
        ((B.powersetCard 2).filter (fun E : Finset V => ¬F.IsIndepSet E)).card =
      1 + ∑ a ∈ B, ((B.filter (F.Adj a)).card).choose 2 := by
  classical
  obtain ⟨a, b, c, hab, hac, hbc, rfl⟩ := Finset.card_eq_three.mp hB
  have hn : ¬(F.Adj a b ∧ F.Adj a c ∧ F.Adj b c) := by
    intro h
    exact (hF.cliqueFree (by omega : 3 ≤ 3)) {a, b, c}
      ((F.is3Clique_triple_iff).mpr h)
  have hsingle : ({c} : Finset V).powerset = {∅, {c}} := by
    change (insert c ∅ : Finset V).powerset = _
    rw [Finset.powerset_insert]
    simp
  have hpabac : ({a, b} : Finset V) ≠ {a, c} := by
    intro h
    have h' := congrArg (fun S : Finset V => b ∈ S) h
    simp [hab.symm, hbc] at h'
  have hpabbc : ({a, b} : Finset V) ≠ {b, c} := by
    intro h
    have h' := congrArg (fun S : Finset V => a ∈ S) h
    simp [hab, hac] at h'
  have hpacbc : ({a, c} : Finset V) ≠ {b, c} := by
    intro h
    have h' := congrArg (fun S : Finset V => a ∈ S) h
    simp [hab, hac] at h'
  have hp : ({a, b, c} : Finset V).powersetCard 2 =
      {{a, b}, {a, c}, {b, c}} := by
    simp [Finset.powersetCard_eq_filter, Finset.powerset_insert,
      hsingle, Finset.filter_insert, Finset.filter_singleton, Finset.insert_comm,
      hab, hac, hbc, hab.symm, hac.symm, hbc.symm]
  rw [hp]
  by_cases hab' : F.Adj a b <;> by_cases hac' : F.Adj a c <;>
    by_cases hbc' : F.Adj b c
  all_goals simp_all [SimpleGraph.isIndepSet_iff, Set.Pairwise, F.adj_comm,
    Finset.filter_insert, Finset.filter_singleton, hpabac, hpabbc, hpacbc,
    hab, hac, hbc, hab.symm, hac.symm, hbc.symm]

end Erdos993G1


namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)

-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN lemma Erdos993G1.indepSetFinset_three_incidence 80322d36a50c5f8eedef153e69e935eaf0bebd0f6e842e96267c37f5a18cb932
lemma indepSetFinset_three_incidence [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (hF : F.IsAcyclic) :
    (F.indepSetFinset 3).card + Nat.card F.edgeSet * (Fintype.card V - 2) =
      (Fintype.card V).choose 3 +
        ∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
          ∑ a ∈ B, ((B.filter (F.Adj a)).card).choose 2 := by
  have hs :
      (∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
        ((if F.IsIndepSet B then 1 else 0) +
          ((B.powersetCard 2).filter (fun E : Finset V => ¬F.IsIndepSet E)).card)) =
      ∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
        (1 + ∑ a ∈ B, ((B.filter (F.Adj a)).card).choose 2) := by
    apply Finset.sum_congr rfl
    intro B hB
    exact triple_local_identity F hF B (Finset.mem_powersetCard.mp hB).2
  simp only [Finset.sum_add_distrib] at hs
  rw [sum_indep_indicator, sum_nonindep_pair_incidence] at hs
  simpa only [Finset.sum_const, smul_eq_mul, mul_one,
    Finset.card_powersetCard, Finset.card_univ] using hs

-- VERITYOS ENTRY 51 END

-- VERITYOS ENTRY 52 BEGIN lemma Erdos993G1.indepCount_three_incidence 3adc3e522766311fc9fcd178eccb3be21853afe0f6f45f08e276fee0469da6e6
lemma indepCount_three_incidence [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (hF : F.IsAcyclic) :
    indepCount F 3 + (Nat.card F.edgeSet : ℤ) * ((Fintype.card V - 2 : ℕ) : ℤ) =
      ((Fintype.card V).choose 3 : ℤ) +
        ∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
          ∑ a ∈ B, (((B.filter (F.Adj a)).card).choose 2 : ℤ) := by
  rw [indepCount_eq_card_indepSetFinset]
  exact_mod_cast indepSetFinset_three_incidence F hF

end Erdos993G1

namespace Erdos993G1

-- VERITYOS ENTRY 52 END

-- VERITYOS ENTRY 53 BEGIN lemma Erdos993G1.sum_triple_centered_neighbor_pairs 5d6d13f96ef2b45f6ff273927629e027fd51f7516517e36611d6551eb587a326
lemma sum_triple_centered_neighbor_pairs {V : Type u}
    [Fintype V] [DecidableEq V] (F : SimpleGraph V) [DecidableRel F.Adj] :
    (∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
      ∑ a ∈ B, ((B.filter (F.Adj a)).card).choose 2) =
      ∑ a : V, (F.degree a).choose 2 := by
  let L : Finset (Σ _B : Finset V, Σ _a : V, Finset V) :=
    ((Finset.univ : Finset V).powersetCard 3).sigma fun B =>
      B.sigma fun a => (B.filter (F.Adj a)).powersetCard 2
  let R : Finset (Σ _a : V, Finset V) :=
    (Finset.univ : Finset V).sigma fun a => (F.neighborFinset a).powersetCard 2
  have hcard : L.card = R.card := by
    refine Finset.card_bij'
      (fun x _ => x.2)
      (fun y _ => ⟨insert y.1 y.2, y⟩) ?_ ?_ ?_ ?_
    · rintro ⟨B, a, N⟩ hx
      simp only [L, Finset.mem_sigma, Finset.mem_powersetCard,
        Finset.subset_univ, true_and] at hx
      obtain ⟨hB, ha, hN, hn⟩ := hx
      simp only [R, Finset.mem_sigma, Finset.mem_univ, true_and,
        Finset.mem_powersetCard]
      refine ⟨?_, hn⟩
      intro w hw
      exact (F.mem_neighborFinset a w).mpr (Finset.mem_filter.mp (hN hw)).2
    · rintro ⟨a, N⟩ hy
      simp only [R, Finset.mem_sigma, Finset.mem_univ, true_and,
        Finset.mem_powersetCard] at hy
      obtain ⟨hN, hn⟩ := hy
      have ha : a ∉ N := by
        intro h
        exact F.irrefl ((F.mem_neighborFinset a a).mp (hN h))
      simp only [L, Finset.mem_sigma, Finset.mem_powersetCard,
        Finset.subset_univ, true_and]
      refine ⟨?_, Finset.mem_insert_self a N, ?_, hn⟩
      · simp [Finset.card_insert_of_notMem ha, hn]
      · intro w hw
        exact Finset.mem_filter.mpr
          ⟨Finset.mem_insert_of_mem hw, (F.mem_neighborFinset a w).mp (hN hw)⟩
    · rintro ⟨B, a, N⟩ hx
      simp only [L, Finset.mem_sigma, Finset.mem_powersetCard,
        Finset.subset_univ, true_and] at hx
      obtain ⟨hB, haB, hN, hn⟩ := hx
      have ha : a ∉ N := by
        intro h
        exact F.irrefl (Finset.mem_filter.mp (hN h)).2
      have hNB : insert a N ⊆ B := by
        intro w hw
        obtain rfl | hw := Finset.mem_insert.mp hw
        · exact haB
        · exact (Finset.mem_filter.mp (hN hw)).1
      have hEq : insert a N = B := by
        apply Finset.eq_of_subset_of_card_le hNB
        simp [hB, Finset.card_insert_of_notMem ha, hn]
      simp only [hEq]
    · rintro ⟨a, N⟩ _
      rfl
  simpa only [L, R, Finset.card_sigma, Finset.card_powersetCard,
    SimpleGraph.card_neighborFinset_eq_degree] using hcard

end Erdos993G1


namespace Erdos993G1

-- VERITYOS ENTRY 53 END

-- VERITYOS ENTRY 54 BEGIN lemma Erdos993G1.indepCount_three_add_edge_incidence b398a1f04b7b79977e8c1fc91c4eff3e3af0fec8c9def9962f181c902fe781da
lemma indepCount_three_add_edge_incidence {V : Type u} [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (hF : F.IsAcyclic) :
    indepCount F 3 + (Nat.card F.edgeSet : ℤ) * ((Fintype.card V - 2 : ℕ) : ℤ) =
      ((Fintype.card V).choose 3 : ℤ) +
        ∑ a : V, ((F.degree a).choose 2 : ℤ) := by
  have h := indepSetFinset_three_incidence F hF
  rw [sum_triple_centered_neighbor_pairs] at h
  rw [indepCount_eq_card_indepSetFinset]
  exact_mod_cast h

end Erdos993G1


-- VERITYOS ENTRY 54 END

-- VERITYOS ENTRY 55 BEGIN lemma Erdos993G1.pathEight_indepCount_three 0e29db059505f864e12c75ec433be8e57e84a96d1e97e6398d27fb771cca9bdd
lemma Erdos993G1.pathEight_indepCount_three :
    Erdos993G1.indepCount (SimpleGraph.pathGraph 8) 3 = 20 := by
  letI : DecidableRel (SimpleGraph.pathGraph 8).Adj := fun v w =>
    decidable_of_iff (v.val + 1 = w.val ∨ w.val + 1 = v.val) SimpleGraph.pathGraph_adj.symm
  rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
  decide

-- VERITYOS ENTRY 55 END

-- VERITYOS ENTRY 56 BEGIN lemma Erdos993G1.pathEight_indepCount_four f9906c059d315b180581ede34ccec23534348d14c27029f28598cc0ccd0cb0c0
lemma Erdos993G1.pathEight_indepCount_four :
    Erdos993G1.indepCount (SimpleGraph.pathGraph 8) 4 = 5 := by
  letI : DecidableRel (SimpleGraph.pathGraph 8).Adj := fun v w =>
    decidable_of_iff (v.val + 1 = w.val ∨ w.val + 1 = v.val) SimpleGraph.pathGraph_adj.symm
  rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
  decide

-- VERITYOS ENTRY 56 END

-- VERITYOS ENTRY 57 BEGIN lemma Erdos993G1.pathEight_delta_three 0c20bb8db1477bcbdfafbf318f9399d38469e5bca9071fe57a29f54b76a338df
lemma Erdos993G1.pathEight_delta_three :
    Erdos993G1.delta (SimpleGraph.pathGraph 8) 3 = -15 := by
  have h := Erdos993G1.delta_nat (SimpleGraph.pathGraph 8) 3
  norm_num [Erdos993G1.pathEight_indepCount_three,
    Erdos993G1.pathEight_indepCount_four] at h
  exact h

namespace Erdos993G1

-- VERITYOS ENTRY 57 END

-- VERITYOS ENTRY 58 BEGIN lemma Erdos993G1.forest_card_edges_add_components 0c2fc141909dd6efa072639e3071ed6f5e6b14787697f3dd2ee2579560bb017f
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

-- VERITYOS ENTRY 58 END

-- VERITYOS ENTRY 59 BEGIN lemma Erdos993G1.components_card_pos_of_card_pos bd55e00b7dabf7179733a98d36feec04246ff14e0711a9213ddea4545442ebba
lemma components_card_pos_of_card_pos {V : Type u} [Finite V]
    (F : SimpleGraph V) (hV : 0 < Nat.card V) :
    0 < Nat.card F.ConnectedComponent := by
  haveI : Nonempty V := (Finite.card_pos_iff).mp hV
  exact Nat.card_pos

-- VERITYOS ENTRY 59 END

-- VERITYOS ENTRY 60 BEGIN lemma Erdos993G1.connected_of_components_card_eq_one d1fa40fce26c4bacfa1c0213caf51f70364e8df2ff028548f79d089919d34f6a
lemma connected_of_components_card_eq_one {V : Type u}
    (F : SimpleGraph V) (hc : Nat.card F.ConnectedComponent = 1) :
    F.Connected := by
  obtain ⟨hsub, hnonempty⟩ := Nat.card_eq_one_iff_unique.mp hc
  letI := hsub
  obtain ⟨c⟩ := hnonempty
  haveI : Nonempty V := ⟨c.out⟩
  exact ⟨fun v w => SimpleGraph.ConnectedComponent.exact (Subsingleton.elim _ _)⟩

end Erdos993G1


namespace Erdos993G1.PathClassification

open SimpleGraph

-- VERITYOS ENTRY 60 END

-- VERITYOS ENTRY 61 BEGIN lemma Erdos993G1.PathClassification.longestPath_support_closed eb014ed9e3bba006ccd1bfec10b3c8919996695ec39461ac245621e58d2bc87f
lemma longestPath_support_closed {V : Type u} [Finite V] {G : SimpleGraph V}
    {a b : V} (p : G.Walk a b) (hp : p.IsPath)
    (hmax : ∀ (a' b' : V) (q : G.Walk a' b'), q.IsPath → q.length ≤ p.length)
    (hdeg : ∀ v, Nat.card (G.neighborSet v) ≤ 2) :
    ∀ v ∈ p.support, ∀ w, G.Adj v w → w ∈ p.support := by
  classical
  intro v hv w hadj
  by_contra hw
  obtain ⟨i, hi, hil⟩ := Walk.mem_support_iff_exists_getVert.mp hv
  by_cases hi0 : i = 0
  · have hva : v = a := by simpa [hi0] using hi.symm
    rw [hva] at hadj
    have hq := hmax w b (p.cons hadj.symm) (hp.cons hw)
    simp only [Walk.length_cons] at hq
    omega
  by_cases hie : i = p.length
  · have hvb : v = b := by simpa [hie] using hi.symm
    rw [hvb] at hadj
    have hq := hmax a w (p.concat hadj) (hp.concat hw hadj)
    simp only [Walk.length_concat] at hq
    omega
  have hit : i < p.length := lt_of_le_of_ne hil hie
  have hcard := hp.ncard_neighborSet_toSubgraph_internal_eq_two hi0 hit
  have hsub : p.toSubgraph.neighborSet (p.getVert i) ⊆ G.neighborSet (p.getVert i) :=
    fun _ h => p.toSubgraph.adj_sub h
  have heq := Set.eq_of_subset_of_ncard_le hsub (by
    rw [hcard]
    exact hdeg (p.getVert i))
  have hin : w ∈ p.toSubgraph.neighborSet (p.getVert i) := by
    rw [heq, hi]
    exact hadj
  exact hw (p.mem_support_of_adj_toSubgraph hin.symm)

-- VERITYOS ENTRY 61 END

-- VERITYOS ENTRY 62 BEGIN lemma Erdos993G1.PathClassification.longestPath_spanning 36b63e828d4fb832735cac7939db6767d6c1bda373c2c2e1903de4ee5e0d00bf
lemma longestPath_spanning {V : Type u} [Finite V] {G : SimpleGraph V}
    (hc : G.Connected) {a b : V} (p : G.Walk a b) (hp : p.IsPath)
    (hmax : ∀ (a' b' : V) (q : G.Walk a' b'), q.IsPath → q.length ≤ p.length)
    (hdeg : ∀ v, Nat.card (G.neighborSet v) ≤ 2) :
    p.toSubgraph.IsSpanning := by
  have hclosed := longestPath_support_closed p hp hmax hdeg
  have hwalk : ∀ {v w : V} (q : G.Walk v w), v ∈ p.support → w ∈ p.support := by
    intro v w q
    induction q with
    | nil => exact id
    | cons hadj q ih => exact fun hv => ih (hclosed _ hv _ hadj)
  intro v
  exact p.mem_verts_toSubgraph.mpr (hwalk (hc a v).some p.start_mem_support)

-- VERITYOS ENTRY 62 END

-- VERITYOS ENTRY 63 BEGIN lemma Erdos993G1.PathClassification.tree_maxDegreeTwo_iso_pathGraph_card 29ac2e202882dce5f177871f54ca5f2de2b04889ab0c3c813bc2c99d6e75d30b
lemma tree_maxDegreeTwo_iso_pathGraph_card {V : Type u} [Finite V] {G : SimpleGraph V}
    (hG : G.IsTree) (hdeg : ∀ v, Nat.card (G.neighborSet v) ≤ 2) :
    Nonempty (G ≃g SimpleGraph.pathGraph (Nat.card V)) := by
  classical
  letI : Nonempty V := hG.connected.nonempty
  obtain ⟨a, b, p, hp, hmax⟩ := Walk.exists_isPath_forall_isPath_length_le_length G
  have hspan := longestPath_spanning hG.connected p hp hmax hdeg
  let e := p.toSubgraph.spanningCoeEquivCoeOfSpanning hspan
  have hc : p.toSubgraph.spanningCoe.Connected :=
    e.connected_iff.mpr p.toSubgraph_connected.coe
  have heq : p.toSubgraph.spanningCoe = G := le_antisymm
    p.toSubgraph.spanningCoe_le ((isTree_iff_minimal_connected.mp hG).2 hc
      p.toSubgraph.spanningCoe_le)
  let e2 : G ≃g p.toSubgraph.coe :=
    cast (congrArg (fun H : SimpleGraph V => H ≃g p.toSubgraph.coe) heq) e
  let e3 : G ≃g SimpleGraph.pathGraph (p.length + 1) :=
    e2.trans hp.pathGraphIsoToSubgraph.symm
  have hlen : Nat.card V = p.length + 1 := by
    simpa using Nat.card_congr e3.toEquiv
  exact ⟨cast (congrArg (fun n => G ≃g SimpleGraph.pathGraph n) hlen.symm) e3⟩

-- VERITYOS ENTRY 63 END

-- VERITYOS ENTRY 64 BEGIN lemma Erdos993G1.PathClassification.tree_order_eight_maxDegreeTwo_iso_pathGraph 532fc845394e40f375e4dfd3b0fe4d6cb419a03f6e0ce849a7f2ede4000acc3b
lemma tree_order_eight_maxDegreeTwo_iso_pathGraph {V : Type u} [Finite V]
    {G : SimpleGraph V} (hG : G.IsTree) (horder : Nat.card V = 8)
    (hdeg : ∀ v, Nat.card (G.neighborSet v) ≤ 2) :
    Nonempty (G ≃g SimpleGraph.pathGraph 8) := by
  exact cast (congrArg (fun n => Nonempty (G ≃g SimpleGraph.pathGraph n)) horder)
    (tree_maxDegreeTwo_iso_pathGraph_card hG hdeg)

end Erdos993G1.PathClassification


-- VERITYOS ENTRY 64 END

-- VERITYOS ENTRY 65 BEGIN lemma Erdos993G1.lowRankArithmetic 46e31bf020e3711e0bf5e2bb3f54ba1fbb1136760a2b4b25fab8b5c6c69dfa95
lemma Erdos993G1.lowRankArithmetic
    (m p x : ℕ) (c S d0 d1 d2 : ℤ)
    (hp : p ≤ 5) (hm : 2 * p - 3 < m) (hx : x < p - 2)
    (hc : 1 ≤ c) (hS : 0 ≤ S) (hSdeg : (m : ℤ) - 2 * c ≤ S)
    (hd0 : d0 = (m : ℤ) - 1)
    (hd1 : 2 * d1 = (m : ℤ) * ((m : ℤ) - 5) + 2 * c)
    (hd2 : 6 * d2 = (m : ℤ) * ((m : ℤ) - 1) * ((m : ℤ) - 5) -
      6 * ((m : ℤ) - c) * ((m : ℤ) - 3) + 6 * S)
    (hneg : (if x = 0 then d0 else if x = 1 then d1 else d2) < 0) :
    p = 5 ∧ m = 8 ∧ c = 1 ∧ S = 6 ∧ x = 2 := by
  have hp3 : 3 ≤ p := by omega
  have hm4 : 4 ≤ m := by omega
  have hm4z : (4 : ℤ) ≤ m := by exact_mod_cast hm4
  have hx2 : x ≤ 2 := by omega
  have hx0 : x ≠ 0 := by
    intro h
    simp only [h, ↓reduceIte] at hneg
    omega
  have hx1 : x ≠ 1 := by
    intro h
    have hp4 : 4 ≤ p := by omega
    have hm6 : 6 ≤ m := by omega
    have hm6z : (6 : ℤ) ≤ m := by exact_mod_cast hm6
    have hmul : (0 : ℤ) < (m : ℤ) * ((m : ℤ) - 5) :=
      mul_pos (by omega) (by omega)
    simp only [h, Nat.one_ne_zero, ↓reduceIte] at hneg
    nlinarith
  have hxeq : x = 2 := by omega
  have hpeq : p = 5 := by omega
  have hm8 : 8 ≤ m := by omega
  have hm8z : (8 : ℤ) ≤ m := by exact_mod_cast hm8
  have hd2neg : d2 < 0 := by simpa [hxeq] using hneg
  have hmle : m ≤ 8 := by
    by_contra h
    have hm9 : 9 ≤ m := by omega
    have hm9z : (9 : ℤ) ≤ m := by exact_mod_cast hm9
    have ht : 0 ≤ ((m : ℤ) - 1) * ((m : ℤ) - 2) * ((m : ℤ) - 9) :=
      mul_nonneg (mul_nonneg (by omega) (by omega)) (by omega)
    have he : 0 ≤ (c - 1) * ((m : ℤ) - 3) :=
      mul_nonneg (by omega) (by omega)
    nlinarith
  have hmeq : m = 8 := by omega
  have hd2eight : d2 = 5 * c - 12 + S := by
    norm_num [hmeq] at hd2
    omega
  have hSdeg8 : (8 : ℤ) - 2 * c ≤ S := by simpa [hmeq] using hSdeg
  have hceq : c = 1 := by omega
  have hSeq : S = 6 := by omega
  exact ⟨hpeq, hmeq, hceq, hSeq, hxeq⟩


-- VERITYOS ENTRY 65 END

-- VERITYOS ENTRY 66 BEGIN lemma Erdos993G1.degreeDefect_nonneg 36d264dd1540fb3c551965bb8704a04e73dffb2748e1497c1638b7d3407c7d8e
lemma Erdos993G1.degreeDefect_nonneg (d : ℕ) :
    (0 : ℤ) ≤ (d.choose 2 : ℤ) - (d : ℤ) + 1 := by
  cases d with
  | zero => norm_num
  | succ n =>
    rw [Nat.choose_succ_succ]
    simp only [Nat.choose_one_right, Nat.cast_add, Nat.cast_succ]
    have h := (Nat.cast_nonneg (n.choose 2) : (0 : ℤ) ≤ n.choose 2)
    omega

-- VERITYOS ENTRY 66 END

-- VERITYOS ENTRY 67 BEGIN lemma Erdos993G1.degreeDefect_eq_zero_iff 53d6ffa1551d55b391d6ca657b12f47e7be6bc8842ecb9e8ae7528700baed7d9
lemma Erdos993G1.degreeDefect_eq_zero_iff (d : ℕ) :
    (d.choose 2 : ℤ) - (d : ℤ) + 1 = 0 ↔ d = 1 ∨ d = 2 := by
  cases d with
  | zero => norm_num
  | succ n =>
    rw [Nat.choose_succ_succ]
    simp only [Nat.choose_one_right, Nat.cast_add, Nat.cast_succ]
    change ((n : ℤ) + (n.choose 2 : ℤ)) - ((n : ℤ) + 1) + 1 = 0 ↔
      n + 1 = 1 ∨ n + 1 = 2
    have hz : (n.choose 2 : ℤ) = 0 ↔ n < 2 := by
      exact_mod_cast (Nat.choose_eq_zero_iff (n := n) (k := 2))
    constructor
    · intro h
      have hn : n < 2 := hz.mp (by omega)
      omega
    · intro h
      have hn : n < 2 := by omega
      have he := hz.mpr hn
      omega

-- VERITYOS ENTRY 67 END

-- VERITYOS ENTRY 68 BEGIN lemma Erdos993G1.degreeChoose_sum_lower 32408765453e657cc5f7832829d929966472874f342ca4c81d8899d5d346784e
lemma Erdos993G1.degreeChoose_sum_lower {V : Type*} [Fintype V] (d : V → ℕ) :
    (∑ v, (d v : ℤ)) - Fintype.card V ≤ ∑ v, ((d v).choose 2 : ℤ) := by
  have h : 0 ≤ ∑ v, (((d v).choose 2 : ℤ) - (d v : ℤ) + 1) :=
    Finset.sum_nonneg (fun v _ => Erdos993G1.degreeDefect_nonneg (d v))
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, Finset.sum_const,
    Finset.card_univ, nsmul_eq_mul, mul_one] at h
  omega

-- VERITYOS ENTRY 68 END

-- VERITYOS ENTRY 69 BEGIN lemma Erdos993G1.degreeChoose_sum_equality 69a77469b5e1465d40f99e5c096dad7b2a81bc1de12f0b88b6971afc3ef62763
lemma Erdos993G1.degreeChoose_sum_equality {V : Type*} [Fintype V] (d : V → ℕ)
    (h : (∑ v, ((d v).choose 2 : ℤ)) = (∑ v, (d v : ℤ)) - Fintype.card V) :
    ∀ v, d v = 1 ∨ d v = 2 := by
  have hsum : ∑ v, (((d v).choose 2 : ℤ) - (d v : ℤ) + 1) = 0 := by
    simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, Finset.sum_const,
      Finset.card_univ, nsmul_eq_mul, mul_one]
    omega
  have hz := (Finset.sum_eq_zero_iff_of_nonneg
    (fun v (_ : v ∈ (Finset.univ : Finset V)) =>
      Erdos993G1.degreeDefect_nonneg (d v))).mp hsum
  intro v
  exact (Erdos993G1.degreeDefect_eq_zero_iff (d v)).mp (hz v (Finset.mem_univ v))


-- VERITYOS ENTRY 69 END

-- VERITYOS ENTRY 70 BEGIN lemma Erdos993G1.scaledChooseTwo c526653f5ce4c90392e252c3e28e6ce164135670fdd12d5664f120646f2671d8
lemma Erdos993G1.scaledChooseTwo (n : ℕ) :
    2 * (n.choose 2 : ℤ) = (n : ℤ) * ((n : ℤ) - 1) := by
  induction n with
  | zero => norm_num
  | succ n ih =>
    rw [Nat.choose_succ_succ]
    simp only [Nat.choose_one_right, Nat.cast_add, Nat.cast_succ]
    change 2 * ((n : ℤ) + (n.choose 2 : ℤ)) =
      ((n : ℤ) + 1) * ((n : ℤ) + 1 - 1)
    nlinarith

-- VERITYOS ENTRY 70 END

-- VERITYOS ENTRY 71 BEGIN lemma Erdos993G1.scaledChooseThree bcef58787034fa165d746e7fa2a863cc1a20b351dafb9951cc1178ad9b01fc1b
lemma Erdos993G1.scaledChooseThree (n : ℕ) :
    6 * (n.choose 3 : ℤ) = (n : ℤ) * ((n : ℤ) - 1) * ((n : ℤ) - 2) := by
  induction n with
  | zero => norm_num
  | succ n ih =>
    rw [Nat.choose_succ_succ]
    simp only [Nat.cast_add, Nat.cast_succ]
    change 6 * ((n.choose 2 : ℤ) + (n.choose 3 : ℤ)) =
      ((n : ℤ) + 1) * ((n : ℤ) + 1 - 1) * ((n : ℤ) + 1 - 2)
    nlinarith [Erdos993G1.scaledChooseTwo n]


-- VERITYOS ENTRY 71 END

-- VERITYOS ENTRY 72 BEGIN lemma Erdos993G1.lowRankForestClassification_of_count_identities 220e0b030714563a8724d6ffb5c60b4f9e242de52a313d58cf04fe1d2a8e6bfc
lemma Erdos993G1.lowRankForestClassification_of_count_identities
    {V : Type u} [Fintype V] [DecidableEq V] (F : SimpleGraph V) [DecidableRel F.Adj]
    (p : ℕ) (hF : F.IsAcyclic) (hp : p ≤ 5)
    (hm : 2 * p - 3 < Nat.card V) (hx : Erdos993G1.firstDescent F < p - 2)
    (hpair : Erdos993G1.indepCount F 2 + (Nat.card F.edgeSet : ℤ) =
      ((Nat.card V).choose 2 : ℤ))
    (htriple : Erdos993G1.indepCount F 3 +
      (Nat.card F.edgeSet : ℤ) * ((Fintype.card V - 2 : ℕ) : ℤ) =
      ((Fintype.card V).choose 3 : ℤ) + ∑ a : V, ((F.degree a).choose 2 : ℤ)) :
    p = 5 ∧ Nonempty (F ≃g SimpleGraph.pathGraph 8) ∧ Erdos993G1.delta F 3 = -15 := by
  let m : ℕ := Nat.card V
  let c : ℤ := Nat.card F.ConnectedComponent
  let S : ℤ := ∑ a : V, ((F.degree a).choose 2 : ℤ)
  have hncard : Fintype.card V = m := by
    exact Nat.card_eq_fintype_card.symm
  have hp3 : 3 ≤ p := by omega
  have hm4 : 4 ≤ m := by dsimp [m]; omega
  have hc : 1 ≤ c := by
    have h := Erdos993G1.components_card_pos_of_card_pos F (show 0 < Nat.card V by omega)
    dsimp [c]
    exact_mod_cast h
  have he : (Nat.card F.edgeSet : ℤ) = (m : ℤ) - c := by
    have h : (Nat.card F.edgeSet : ℤ) + (Nat.card F.ConnectedComponent : ℤ) =
        (Nat.card V : ℤ) := by
      exact_mod_cast Erdos993G1.forest_card_edges_add_components F hF
    exact eq_sub_iff_add_eq.mpr h
  have hS : 0 ≤ S := Finset.sum_nonneg (fun _ _ => Nat.cast_nonneg _)
  have hdegreeSum : (∑ v, (F.degree v : ℤ)) = 2 * (Nat.card F.edgeSet : ℤ) := by
    rw [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card]
    exact_mod_cast F.sum_degrees_eq_twice_card_edges
  have hSdeg : (m : ℤ) - 2 * c ≤ S := by
    have h := Erdos993G1.degreeChoose_sum_lower (fun v : V => F.degree v)
    rw [hdegreeSum, hncard] at h
    change 2 * (Nat.card F.edgeSet : ℤ) - (m : ℤ) ≤ S at h
    omega
  have hd0 : Erdos993G1.delta F 0 = (m : ℤ) - 1 := Erdos993G1.delta_zero F
  have hi1 : Erdos993G1.indepCount F 1 = (m : ℤ) := Erdos993G1.indepCount_one F
  have hd1raw : Erdos993G1.delta F 1 =
      Erdos993G1.indepCount F 2 - Erdos993G1.indepCount F 1 := by
    simpa using Erdos993G1.delta_nat F 1
  have hd2raw : Erdos993G1.delta F 2 =
      Erdos993G1.indepCount F 3 - Erdos993G1.indepCount F 2 := by
    simpa using Erdos993G1.delta_nat F 2
  change Erdos993G1.indepCount F 2 + (Nat.card F.edgeSet : ℤ) = (m.choose 2 : ℤ) at hpair
  rw [hncard] at htriple
  have hsub : ((m - 2 : ℕ) : ℤ) = (m : ℤ) - 2 := Nat.cast_sub (by omega)
  rw [hsub] at htriple
  change Erdos993G1.indepCount F 3 + (Nat.card F.edgeSet : ℤ) * ((m : ℤ) - 2) =
    (m.choose 3 : ℤ) + S at htriple
  have hd1 : 2 * Erdos993G1.delta F 1 = (m : ℤ) * ((m : ℤ) - 5) + 2 * c := by
    nlinarith [Erdos993G1.scaledChooseTwo m]
  have hd2 : 6 * Erdos993G1.delta F 2 =
      (m : ℤ) * ((m : ℤ) - 1) * ((m : ℤ) - 5) -
      6 * ((m : ℤ) - c) * ((m : ℤ) - 3) + 6 * S := by
    nlinarith [Erdos993G1.scaledChooseTwo m, Erdos993G1.scaledChooseThree m]
  have hneg : (if Erdos993G1.firstDescent F = 0 then Erdos993G1.delta F 0
      else if Erdos993G1.firstDescent F = 1 then Erdos993G1.delta F 1
      else Erdos993G1.delta F 2) < 0 := by
    have h := Erdos993G1.delta_firstDescent_neg F
    by_cases h0 : Erdos993G1.firstDescent F = 0
    · simpa [h0] using h
    by_cases h1 : Erdos993G1.firstDescent F = 1
    · simpa [h1] using h
    have h2 : Erdos993G1.firstDescent F = 2 := by omega
    simpa [h2] using h
  obtain ⟨hp5, hm8, hc1, hS6, _⟩ := Erdos993G1.lowRankArithmetic m p
    (Erdos993G1.firstDescent F) c S (Erdos993G1.delta F 0)
    (Erdos993G1.delta F 1) (Erdos993G1.delta F 2)
    hp hm hx hc hS hSdeg hd0 hd1 hd2 hneg
  have hc1nat : Nat.card F.ConnectedComponent = 1 := by
    dsimp [c] at hc1
    exact_mod_cast hc1
  have htree : F.IsTree := ⟨Erdos993G1.connected_of_components_card_eq_one F hc1nat, hF⟩
  have hsumEq : (∑ a : V, ((F.degree a).choose 2 : ℤ)) =
      (∑ a : V, (F.degree a : ℤ)) - Fintype.card V := by
    rw [hdegreeSum, hncard]
    change S = 2 * (Nat.card F.edgeSet : ℤ) - (m : ℤ)
    omega
  have hdeg := Erdos993G1.degreeChoose_sum_equality (fun v : V => F.degree v) hsumEq
  have hdegCard : ∀ v, Nat.card (F.neighborSet v) ≤ 2 := by
    intro v
    rw [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree]
    rcases hdeg v with h | h <;> omega
  obtain ⟨e⟩ := Erdos993G1.PathClassification.tree_order_eight_maxDegreeTwo_iso_pathGraph
    htree hm8 hdegCard
  refine ⟨hp5, ⟨e⟩, ?_⟩
  rw [Erdos993G1.delta_iso e, Erdos993G1.pathEight_delta_three]

namespace Erdos993G1.Deletion

open SimpleGraph

-- VERITYOS ENTRY 72 END

-- VERITYOS ENTRY 73 BEGIN lemma Erdos993G1.Deletion.deleteVerts_union_iso 84567459ae6e5bc695dfa19c17afc6bb310c8826f9edac168b186ef817a46594
lemma deleteVerts_union_iso {V : Type u} (F : SimpleGraph V) (S Q : Set V) :
    Nonempty (deleteVerts F (S ∪ Q) ≃g
      deleteVerts (deleteVerts F S) {a | a.val ∈ Q}) := by
  refine ⟨{
    toFun := fun a => ⟨⟨a.val, fun hs => a.prop (Or.inl hs)⟩,
      fun hq => a.prop (Or.inr hq)⟩
    invFun := fun a => ⟨a.val.val, fun h => h.elim a.val.prop a.prop⟩
    left_inv := by intro a; rfl
    right_inv := by intro a; rfl
    map_rel_iff' := by intros; rfl
  }⟩

-- VERITYOS ENTRY 73 END

-- VERITYOS ENTRY 74 BEGIN lemma Erdos993G1.Deletion.ambientH_iso_delete_ambientA 769b68f49bb5a60a0b07c05242ca0c137d2384e08b8244b46302a6ebf4c54759
lemma ambientH_iso_delete_ambientA {V : Type u} (T : SimpleGraph V) (v g : V) :
    Nonempty (ambientH T v g ≃g
      deleteVerts (ambientA T v) {a | a.val = g}) := by
  exact deleteVerts_union_iso T (closedNeighborhood T v) {g}

-- VERITYOS ENTRY 74 END

-- VERITYOS ENTRY 75 BEGIN lemma Erdos993G1.Deletion.original_residual_deletion_set_eq 8e7124c437efa47597a6ff309c3511759132571e7f6e12f8c10af4890b741a42
lemma original_residual_deletion_set_eq {V : Type u} (T : SimpleGraph V)
    (v s g : V) (hvs : T.Adj v s) :
    (closedNeighborhood T v ∪ {g}) ∪ {w | T.Adj g w ∧ w ≠ s} =
      closedNeighborhood T v ∪ closedNeighborhood T g := by
  ext w
  simp only [closedNeighborhood, Set.mem_union, Set.mem_singleton_iff, Set.mem_setOf_eq]
  by_cases hws : w = s <;> aesop

-- VERITYOS ENTRY 75 END

-- VERITYOS ENTRY 76 BEGIN lemma Erdos993G1.Deletion.residual_iso_delete_ambientH 36d14d97e9d35db700fda92549e71479c33ef1c5144afedcd7f7c30dafcf9ffd
lemma residual_iso_delete_ambientH {V : Type u} (T : SimpleGraph V)
    (v s g : V) (hvs : T.Adj v s) :
    Nonempty (residual T v g ≃g
      deleteVerts (ambientH T v g) {a | T.Adj g a.val ∧ a.val ≠ s}) := by
  obtain ⟨e⟩ := deleteVerts_union_iso T (closedNeighborhood T v ∪ {g})
    {w | T.Adj g w ∧ w ≠ s}
  exact ⟨cast (congrArg (fun S : Set V =>
    deleteVerts T S ≃g
      deleteVerts (ambientH T v g) {a | T.Adj g a.val ∧ a.val ≠ s})
    (original_residual_deletion_set_eq T v s g hvs)) e⟩

-- VERITYOS ENTRY 76 END

-- VERITYOS ENTRY 77 BEGIN lemma Erdos993G1.Deletion.other_support_neighbor_survives 759d52f4d9f8cfa0ac2ee0493e3e1ff7003954d01a5e8ce54da8fa6bbb7a4dbd
lemma other_support_neighbor_survives {V : Type u} [Finite V] (T : SimpleGraph V)
    (v s g : V) (hleaf : vertexDegree T v = 1)
    (hvs : T.Adj v s) (hsg : T.Adj s g) (hgv : g ≠ v) :
    g ∉ closedNeighborhood T v := by
  have hset : ({s} : Set V) = T.neighborSet v := Set.eq_of_subset_of_ncard_le
    (Set.singleton_subset_iff.mpr hvs) (by
      rw [Set.ncard_singleton, ← Nat.card_coe_set_eq]
      exact hleaf.le)
  rintro (heq | hadj)
  · exact hgv heq
  · have hmem : g ∈ T.neighborSet v := hadj
    rw [← hset] at hmem
    exact hsg.ne (Set.mem_singleton_iff.mp hmem).symm

-- VERITYOS ENTRY 77 END

-- VERITYOS ENTRY 78 BEGIN lemma Erdos993G1.Deletion.ambientH_iso_delete_typed_survivor ea96d8a8c373dc902349ab1bbe029041639fc399ea5006f88346305fea97a1fe
lemma ambientH_iso_delete_typed_survivor {V : Type u} (T : SimpleGraph V) (v g : V)
    (hg : g ∉ closedNeighborhood T v) :
    Nonempty (ambientH T v g ≃g
      deleteVerts (ambientA T v) {⟨g, hg⟩}) := by
  have hset : ({a : {w : V // w ∉ closedNeighborhood T v} | a.val = g}) =
      {⟨g, hg⟩} := by
    ext a
    simp only [Set.mem_setOf_eq, Set.mem_singleton_iff, Subtype.ext_iff]
  obtain ⟨e⟩ := ambientH_iso_delete_ambientA T v g
  exact ⟨cast (congrArg (fun S => ambientH T v g ≃g deleteVerts (ambientA T v) S)
    hset) e⟩

-- VERITYOS ENTRY 78 END

-- VERITYOS ENTRY 79 BEGIN lemma Erdos993G1.Deletion.leaf_ambientH_iso_delete_typed_survivor 5e04878ee268c444211ced7b140695f5d81c75d0207a1892d19938d73463f14a
lemma leaf_ambientH_iso_delete_typed_survivor {V : Type u} [Finite V]
    (T : SimpleGraph V) (v s g : V) (hleaf : vertexDegree T v = 1)
    (hvs : T.Adj v s) (hsg : T.Adj s g) (hgv : g ≠ v) :
    Nonempty (ambientH T v g ≃g deleteVerts (ambientA T v)
      {⟨g, other_support_neighbor_survives T v s g hleaf hvs hsg hgv⟩}) :=
  ambientH_iso_delete_typed_survivor T v g
    (other_support_neighbor_survives T v s g hleaf hvs hsg hgv)

end Erdos993G1.Deletion


-- VERITYOS ENTRY 79 END

-- VERITYOS ENTRY 80 BEGIN lemma Erdos993G1.lowRankForestClassification 87931db520d541292d805b40c26e574756d1edcc5ddecaa17dc0939e6fb593dc
lemma Erdos993G1.lowRankForestClassification {V : Type u} [Finite V]
    (F : SimpleGraph V) (p : ℕ) (hF : F.IsAcyclic) (hp : p ≤ 5)
    (hm : 2 * p - 3 < Nat.card V) (hx : Erdos993G1.firstDescent F < p - 2) :
    p = 5 ∧ Nonempty (F ≃g SimpleGraph.pathGraph 8) ∧
      Erdos993G1.delta F 3 = -15 := by
  classical
  letI := Fintype.ofFinite V
  exact Erdos993G1.lowRankForestClassification_of_count_identities F p hF hp hm hx
    (Erdos993G1.indepCount_two_add_edges F)
    (Erdos993G1.indepCount_three_add_edge_incidence F hF)

-- VERITYOS ENTRY 80 END

-- VERITYOS ENTRY 81 BEGIN lemma Erdos993G1.ordinaryG1_lowRank 6f43a8c7ebe501315351076f7f437f0d0620934a9696bba3efdb0c3a30c2f054
lemma Erdos993G1.ordinaryG1_lowRank {W : Type u} [Finite W]
    (T : SimpleGraph W) (v s g : W) (pT : ℕ)
    (hG : Erdos993G1.ordinaryG1Guards T v s g pT) (hp : pT ≤ 5) :
    Erdos993G1.delta (Erdos993G1.residual T v g) ((pT : ℤ) - 2) ≤ 0 := by
  rcases hG with ⟨hT, hleaf, hvs, hsupport, hsg, hgv, hpT, hgamma, hsize, hcross⟩
  have hF := Erdos993G1.residual_isAcyclic hT.isAcyclic v g
  obtain ⟨hp5, hiso, hdelta⟩ := Erdos993G1.lowRankForestClassification
    (Erdos993G1.residual T v g) pT hF hp hsize hcross
  have hr : (pT : ℤ) - 2 = 3 := by omega
  rw [hr, hdelta]
  norm_num


-- VERITYOS ENTRY 81 END

-- VERITYOS ENTRY 82 BEGIN lemma Erdos993G1.FirstWide.binomCoeff_nat 586e57d9bbf57356d8d3f141a64048b60b0025dd334aa3cb43cf0c05b86fd40b
namespace Erdos993G1.FirstWide

lemma binomCoeff_nat (n k : ℕ) : binomCoeff n (k : ℤ) = (n.choose k : ℤ) := by
  simp [binomCoeff]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 82 END

-- VERITYOS ENTRY 83 BEGIN lemma Erdos993G1.FirstWide.binomCoeff_neg 0fd093d56b6fbbc606c172582bf0269994ddb4b44a43255450640e15ac99592f
namespace Erdos993G1.FirstWide

lemma binomCoeff_neg (n : ℕ) {k : ℤ} (hk : k < 0) : binomCoeff n k = 0 := by
  simp [binomCoeff, not_le.mpr hk]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 83 END

-- VERITYOS ENTRY 84 BEGIN lemma Erdos993G1.FirstWide.binomCoeff_nat_add_one 76f6bc26fab79b1f54a080fdcc272777f055775d5150d9b65db3ba4ebe8c4f1a
namespace Erdos993G1.FirstWide

lemma binomCoeff_nat_add_one (n k : ℕ) :
    binomCoeff n ((k : ℤ) + 1) = (n.choose (k + 1) : ℤ) := by
  simpa only [Nat.cast_add, Nat.cast_one] using binomCoeff_nat n (k + 1)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 84 END

-- VERITYOS ENTRY 85 BEGIN lemma Erdos993G1.FirstWide.binomCoeff_nat_sub_one fa5eacaa79aa247673c3bd77e20ab7280a3496796f6c6fe1d9bca152cf171c62
namespace Erdos993G1.FirstWide

lemma binomCoeff_nat_sub_one (n k : ℕ) (hk : 1 ≤ k) :
    binomCoeff n ((k : ℤ) - 1) = (n.choose (k - 1) : ℤ) := by
  have h : (k : ℤ) - 1 = ((k - 1 : ℕ) : ℤ) := by omega
  rw [h, binomCoeff_nat]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 85 END

-- VERITYOS ENTRY 86 BEGIN lemma Erdos993G1.FirstWide.choose_step_strict a77a46e8e0db35c873c8c5bcfe3054e7201a5ddde6de100392fa5146d748b0a2
namespace Erdos993G1.FirstWide

lemma choose_step_strict {n k : ℕ} (h : 2 * k + 1 < n) :
    n.choose k < n.choose (k + 1) := by
  have hp : 0 < n.choose k := Nat.choose_pos (by omega)
  have he := Nat.choose_succ_right_eq n k
  have hd : k + 1 < n - k := by omega
  have hm := Nat.mul_lt_mul_of_pos_left hd hp
  rw [← he] at hm
  exact Nat.lt_of_mul_lt_mul_right hm

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 86 END

-- VERITYOS ENTRY 87 BEGIN lemma Erdos993G1.FirstWide.choose_step_nonpos 708d7e4957a1c64891a918c1199c643b3442f186a588790b914669abafaa6a4b
namespace Erdos993G1.FirstWide

lemma choose_step_nonpos {n k : ℕ} (h : n ≤ 2 * k + 1) :
    n.choose (k + 1) ≤ n.choose k := by
  have he := Nat.choose_succ_right_eq n k
  have hd : n - k ≤ k + 1 := by omega
  have hm := Nat.mul_le_mul_left (n.choose k) hd
  rw [← he] at hm
  exact Nat.le_of_mul_le_mul_right hm (by omega)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 87 END

-- VERITYOS ENTRY 88 BEGIN lemma Erdos993G1.FirstWide.choose_step_strict_down 305669e8111e1d6db019e3060bddd15634031e5adaec725c4093fb24e2ef154f
namespace Erdos993G1.FirstWide

lemma choose_step_strict_down {n k : ℕ} (hk : k ≤ n) (h : n < 2 * k + 1) :
    n.choose (k + 1) < n.choose k := by
  have hp : 0 < n.choose k := Nat.choose_pos hk
  have he := Nat.choose_succ_right_eq n k
  have hd : n - k < k + 1 := by omega
  have hm := Nat.mul_lt_mul_of_pos_left hd hp
  rw [← he] at hm
  exact Nat.lt_of_mul_lt_mul_right hm

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 88 END

-- VERITYOS ENTRY 89 BEGIN lemma Erdos993G1.FirstWide.edgeless_expression_pos 59973140081fcd6f5a79d037bb406542ef7339ee2c5626efcad1b6652747a85e
namespace Erdos993G1.FirstWide

lemma edgeless_expression_pos {r k : ℕ} (hk : k ≤ r) :
    0 < binomCoeff (2 * r + 2) ((k : ℤ) + 1) -
      binomCoeff (2 * r + 2) (k : ℤ) := by
  rw [binomCoeff_nat_add_one, binomCoeff_nat]
  have h := choose_step_strict (n := 2 * r + 2) (k := k) (by omega)
  exact sub_pos.mpr (by exact_mod_cast h)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 89 END

-- VERITYOS ENTRY 90 BEGIN lemma Erdos993G1.FirstWide.one_edge_expression_pos cf9dea25b395f63394ba326710679e7151f6777e79be14e92ee54b872628e186
namespace Erdos993G1.FirstWide

lemma one_edge_expression_pos {r k : ℕ} (hr : 1 ≤ r) (hk : k ≤ r) :
    0 < (binomCoeff (2 * r) ((k : ℤ) + 1) +
      2 * binomCoeff (2 * r) (k : ℤ)) -
      (binomCoeff (2 * r) (k : ℤ) +
        2 * binomCoeff (2 * r) ((k : ℤ) - 1)) := by
  by_cases hk0 : k = 0
  · subst k
    simp [binomCoeff]
    omega
  have hk1 : 1 ≤ k := by omega
  rw [binomCoeff_nat_add_one, binomCoeff_nat, binomCoeff_nat_sub_one _ _ hk1]
  by_cases hkr : k = r
  · subst k
    have he : (2 * r).choose (r + 1) = (2 * r).choose (r - 1) :=
      Nat.choose_symm_of_eq_add (by omega)
    have hp := choose_step_strict (n := 2 * r) (k := r - 1) (by omega)
    have hpred : r - 1 + 1 = r := by omega
    rw [hpred] at hp
    rw [he]
    have hp' : ((2 * r).choose (r - 1) : ℤ) < ((2 * r).choose r : ℤ) := by
      exact_mod_cast hp
    linarith
  · have hc := choose_step_strict (n := 2 * r) (k := k) (by omega)
    have hp := choose_step_strict (n := 2 * r) (k := k - 1) (by omega)
    have hpred : k - 1 + 1 = k := by omega
    rw [hpred] at hp
    have hc' : ((2 * r).choose k : ℤ) < ((2 * r).choose (k + 1) : ℤ) := by
      exact_mod_cast hc
    have hp' : ((2 * r).choose (k - 1) : ℤ) < ((2 * r).choose k : ℤ) := by
      exact_mod_cast hp
    linarith

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 90 END

-- VERITYOS ENTRY 91 BEGIN lemma Erdos993G1.FirstWide.center_expression_nonpos b895ef3085345a90b75294f9d1e35cbeadb516c06c0b7b3513d5b8f6939cd6ed
namespace Erdos993G1.FirstWide

lemma center_expression_nonpos {r q : ℕ} (hr : 1 ≤ r) (hq : q ≤ 2 * r - 1) :
    (binomCoeff (2 * r + 1) ((r : ℤ) + 1) + binomCoeff q (r : ℤ)) -
      (binomCoeff (2 * r + 1) (r : ℤ) + binomCoeff q ((r : ℤ) - 1)) ≤ 0 := by
  rw [binomCoeff_nat_add_one, binomCoeff_nat, binomCoeff_nat,
    binomCoeff_nat_sub_one _ _ hr, Nat.choose_symm_half]
  have h := choose_step_nonpos (n := q) (k := r - 1) (by omega)
  have hpred : r - 1 + 1 = r := by omega
  rw [hpred] at h
  have h' : (q.choose r : ℤ) ≤ (q.choose (r - 1) : ℤ) := by exact_mod_cast h
  linarith

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 91 END

-- VERITYOS ENTRY 92 BEGIN lemma Erdos993G1.FirstWide.triangle_expression_neg 0d48996514007adc12fa19659b5b5ad485218f6d6764d136ef85229c475a9f9e
namespace Erdos993G1.FirstWide

lemma triangle_expression_neg {r : ℕ} (hr : 1 ≤ r) :
    (binomCoeff (2 * r - 1) ((r : ℤ) + 1) +
      3 * binomCoeff (2 * r - 1) (r : ℤ)) -
      (binomCoeff (2 * r - 1) (r : ℤ) +
        3 * binomCoeff (2 * r - 1) ((r : ℤ) - 1)) < 0 := by
  rw [binomCoeff_nat_add_one, binomCoeff_nat, binomCoeff_nat_sub_one _ _ hr]
  have he : (2 * r - 1).choose r = (2 * r - 1).choose (r - 1) :=
    Nat.choose_symm_of_eq_add (by omega)
  have h := choose_step_strict_down (n := 2 * r - 1) (k := r) (by omega) (by omega)
  have h' : ((2 * r - 1).choose (r + 1) : ℤ) < ((2 * r - 1).choose r : ℤ) := by
    exact_mod_cast h
  rw [he] at h' ⊢
  linarith

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 92 END

-- VERITYOS ENTRY 93 BEGIN lemma Erdos993G1.FirstWide.delta_pos_of_edgeless_counts c30bada5713a560a315d3aa627387479a741f4fc16240a009a035ebe456372f1
namespace Erdos993G1.FirstWide

lemma delta_pos_of_edgeless_counts {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ) (hn : Nat.card Y = 2 * r + 2)
    (hc : ∀ j : ℕ, indepCount G j = binomCoeff (Nat.card Y) (j : ℤ))
    {k : ℕ} (hk : k ≤ r) : 0 < delta G (k : ℤ) := by
  rw [delta_nat, hc, hc, hn]
  simpa only [Nat.cast_add, Nat.cast_one] using edgeless_expression_pos hk

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 93 END

-- VERITYOS ENTRY 94 BEGIN lemma Erdos993G1.FirstWide.delta_pos_of_one_edge_counts f74414a03a900086794954e466ea63fc1e2bf77d023ebaf28de34f29b60ce9bb
namespace Erdos993G1.FirstWide

lemma delta_pos_of_one_edge_counts {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card Y = 2 * r + 2)
    (hc : ∀ j : ℕ, indepCount G j = binomCoeff (Nat.card Y - 2) (j : ℤ) +
      2 * binomCoeff (Nat.card Y - 2) ((j : ℤ) - 1))
    {k : ℕ} (hk : k ≤ r) : 0 < delta G (k : ℤ) := by
  have hn' : Nat.card Y - 2 = 2 * r := by omega
  rw [delta_nat, hc, hc, hn']
  simpa only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right] using
    one_edge_expression_pos hr hk

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 94 END

-- VERITYOS ENTRY 95 BEGIN lemma Erdos993G1.FirstWide.delta_nonpos_of_center_counts cfeea82027a48154c86e8e65aef0d0424e543f6b7558edc837a2ea5eb3129d1e
namespace Erdos993G1.FirstWide

lemma delta_nonpos_of_center_counts {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r q : ℕ) (hr : 1 ≤ r) (hq : q ≤ 2 * r - 1)
    (hc : ∀ j : ℕ, indepCount G j = binomCoeff (2 * r + 1) (j : ℤ) +
      binomCoeff q ((j : ℤ) - 1)) : delta G (r : ℤ) ≤ 0 := by
  rw [delta_nat, hc, hc]
  simpa only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right] using
    center_expression_nonpos hr hq

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 95 END

-- VERITYOS ENTRY 96 BEGIN lemma Erdos993G1.FirstWide.delta_neg_of_triangle_counts 68fad36276c13facb0b04954b337de9a124051a465e50f88b2bceb1bdfdeefc2
namespace Erdos993G1.FirstWide

lemma delta_neg_of_triangle_counts {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ) (hr : 1 ≤ r)
    (hc : ∀ j : ℕ, indepCount G j = binomCoeff (2 * r - 1) (j : ℤ) +
      3 * binomCoeff (2 * r - 1) ((j : ℤ) - 1)) : delta G (r : ℤ) < 0 := by
  rw [delta_nat, hc, hc]
  simpa only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right] using
    triangle_expression_neg hr

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 96 END

-- VERITYOS ENTRY 97 BEGIN lemma Erdos993G1.FirstWide.firstDescent_gt_of_positive_history bd19f6ab2d00df81b8aad74fd5e3dcfecee3812230f5080376e7b4d2aa1327d9
namespace Erdos993G1.FirstWide

lemma firstDescent_gt_of_positive_history {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ)
    (hpos : ∀ k : ℕ, k ≤ r → 0 < delta G (k : ℤ)) :
    r < firstDescent G := by
  by_contra h
  have hle : firstDescent G ≤ r := by omega
  have hp := hpos (firstDescent G) hle
  have hn := delta_firstDescent_neg G
  omega

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 97 END

-- VERITYOS ENTRY 98 BEGIN lemma Erdos993G1.FirstWide.ordinaryG1_firstWide_rank a0779e97094008be3df4fb829485a0bab6b18a0e338b9a7588e6fe0ce08675a3
namespace Erdos993G1.FirstWide

lemma ordinaryG1_firstWide_rank {Y : Type u} [Finite Y]
    (T : SimpleGraph Y) (v s g : Y) (p : ℕ)
    (hG : ordinaryG1Guards T v s g p)
    (hn : residualOrder T v g = 2 * p - 2) :
    1 ≤ p - 2 ∧
      Nat.card {a : Y // a ∉ closedNeighborhood T v ∪ closedNeighborhood T g} =
        2 * (p - 2) + 2 ∧
      ((p - 2 : ℕ) : ℤ) = (p : ℤ) - 2 ∧
      firstDescent (residual T v g) < p - 2 := by
  rcases hG with ⟨hT, hleaf, hvs, hsupport, hsg, hgv, hp, hgamma, hsize, hcross⟩
  have hp3 : 3 ≤ p := by omega
  change Nat.card {a : Y // a ∉ closedNeighborhood T v ∪ closedNeighborhood T g} =
    2 * p - 2 at hn
  refine ⟨by omega, ?_, by omega, hcross⟩
  omega

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 98 END

-- VERITYOS ENTRY 99 BEGIN lemma Erdos993G1.FirstWide.edgeSet_natCard_eq_edgeFinset_card 173afaea29333238363411afefbda96929468184e2246a92b678b19529e126e1
namespace Erdos993G1.FirstWide

lemma edgeSet_natCard_eq_edgeFinset_card {Y : Type u}
    (G : SimpleGraph Y) [Fintype G.edgeSet] :
    Nat.card G.edgeSet = G.edgeFinset.card := by
  rw [Nat.card_eq_fintype_card, G.edgeFinset_card]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 99 END

-- VERITYOS ENTRY 100 BEGIN lemma Erdos993G1.FirstWide.indepCount_edgeless 65f447028fbab531a1ab9d37c8485f02dc5b12b52002d438703c6308017fe3bd
namespace Erdos993G1.FirstWide

lemma indepCount_edgeless {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (he : Nat.card G.edgeSet = 0) (k : ℕ) :
    indepCount G k = binomCoeff (Nat.card Y) (k : ℤ) := by
  classical
  letI := Fintype.ofFinite Y
  letI : IsEmpty G.edgeSet := Finite.card_eq_zero_iff.mp he
  have hi : ∀ S : Finset Y, G.IsIndepSet S := by
    intro S a ha b hb hab hadj
    exact isEmptyElim (⟨s(a, b), hadj⟩ : G.edgeSet)
  rw [indepCount_eq_card_indepSetFinset, indepSetFinset_eq_filter_powersetCard,
    Finset.filter_eq_self.mpr (fun S _ => hi S), Finset.card_powersetCard,
    Finset.card_univ, binomCoeff_nat, Nat.card_eq_fintype_card]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 100 END

-- VERITYOS ENTRY 101 BEGIN lemma Erdos993G1.FirstWide.edgeSet_one_endpoints 6e97c5b582b476b8ea43649632fffd288f4baabb9e24dc0f6a6d5a86a534a4e6
namespace Erdos993G1.FirstWide

lemma edgeSet_one_endpoints {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (hc : Nat.card G.edgeSet = 1) :
    ∃ a b : Y, a ≠ b ∧ G.edgeSet = {s(a, b)} := by
  classical
  letI := Fintype.ofFinite Y
  have hc' : G.edgeFinset.card = 1 := by
    rw [← edgeSet_natCard_eq_edgeFinset_card]
    exact hc
  obtain ⟨e, he⟩ := Finset.card_eq_one.mp hc'
  obtain ⟨a, b⟩ := e
  have hmem : s(a, b) ∈ G.edgeFinset := by rw [he]; simp
  have hadj : G.Adj a b := by
    simpa only [SimpleGraph.mem_edgeFinset, SimpleGraph.mem_edgeSet] using hmem
  refine ⟨a, b, hadj.ne, ?_⟩
  have hset := congrArg (fun t : Finset (Sym2 Y) => (t : Set (Sym2 Y))) he
  simpa only [SimpleGraph.coe_edgeFinset, Finset.coe_singleton] using hset

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 101 END

-- VERITYOS ENTRY 102 BEGIN lemma Erdos993G1.FirstWide.indepSet_iff_omit_unique_endpoints 0cc04950f0336870793246695e3513f0241182363d502893c08033fc6146414b
namespace Erdos993G1.FirstWide

lemma indepSet_iff_omit_unique_endpoints {Y : Type u}
    (G : SimpleGraph Y) (a b : Y) (hab : a ≠ b)
    (he : G.edgeSet = {s(a, b)}) (S : Finset Y) :
    G.IsIndepSet S ↔ a ∉ S ∨ b ∉ S := by
  classical
  have hadj : G.Adj a b := by
    change s(a, b) ∈ G.edgeSet
    rw [he]
    exact Set.mem_singleton _
  constructor
  · intro hS
    by_cases ha : a ∈ S
    · right
      intro hb
      exact hS ha hb hab hadj
    · exact Or.inl ha
  · intro h x hx y hy hxy hAdj
    have hmem : s(x, y) ∈ G.edgeSet := hAdj
    have hexy : s(x, y) = s(a, b) := by simpa only [he, Set.mem_singleton_iff] using hmem
    have haS : a ∈ S := by
      have hm : a ∈ s(x, y) := by rw [hexy]; simp
      rcases Sym2.mem_iff.mp hm with rfl | rfl <;> assumption
    have hbS : b ∈ S := by
      have hm : b ∈ s(x, y) := by rw [hexy]; simp
      rcases Sym2.mem_iff.mp hm with rfl | rfl <;> assumption
    rcases h with ha | hb
    · exact ha haS
    · exact hb hbS

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 102 END

-- VERITYOS ENTRY 103 BEGIN lemma Erdos993G1.FirstWide.indepCount_one_edge 07f1da65efa1980dd45e15eed8b0d3b5e6faa30ea20f7afb1c60836cb4f135d6
namespace Erdos993G1.FirstWide

lemma indepCount_one_edge {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (hc : Nat.card G.edgeSet = 1) (k : ℕ) :
    indepCount G k = binomCoeff (Nat.card Y - 2) (k : ℤ) +
      2 * binomCoeff (Nat.card Y - 2) ((k : ℤ) - 1) := by
  classical
  letI := Fintype.ofFinite Y
  by_cases hk0 : k = 0
  · subst k
    simp [indepCount_zero, binomCoeff]
  have hk1 : 1 ≤ k := by omega
  obtain ⟨a, b, hab, he⟩ := edgeSet_one_endpoints G hc
  have hn2 : 2 ≤ Fintype.card Y := by
    have h := Finset.card_le_card (Finset.subset_univ ({a, b} : Finset Y))
    simpa [hab] using h
  let A := ((Finset.univ : Finset Y).erase a).powersetCard k
  let B := ((Finset.univ : Finset Y).erase b).powersetCard k
  let C := (((Finset.univ : Finset Y).erase a).erase b).powersetCard k
  have hu : G.indepSetFinset k = A ∪ B := by
    ext S
    simp only [SimpleGraph.mem_indepSetFinset_iff, SimpleGraph.isNIndepSet_iff,
      indepSet_iff_omit_unique_endpoints G a b hab he, A, B, Finset.mem_union,
      Finset.mem_powersetCard, Finset.subset_erase, Finset.subset_univ, true_and]
    tauto
  have hi : A ∩ B = C := by
    ext S
    simp only [A, B, C, Finset.mem_inter, Finset.mem_powersetCard,
      Finset.subset_erase, Finset.subset_univ, true_and]
    tauto
  have hAc : A.card = (Fintype.card Y - 1).choose k := by simp [A]
  have hBc : B.card = (Fintype.card Y - 1).choose k := by simp [B]
  have hCc : C.card = (Fintype.card Y - 2).choose k := by
    simp [C, Finset.card_erase_of_mem (show b ∈ (Finset.univ : Finset Y).erase a by
      simp [hab.symm]), Nat.sub_sub]
  have hcard := Finset.card_union_add_card_inter A B
  rw [← hu, hi, hAc, hBc, hCc] at hcard
  have hcount : indepCount G k + ((Fintype.card Y - 2).choose k : ℤ) =
      2 * ((Fintype.card Y - 1).choose k : ℤ) := by
    rw [indepCount_eq_card_indepSetFinset]
    exact_mod_cast (by omega : (G.indepSetFinset k).card +
      (Fintype.card Y - 2).choose k = 2 * (Fintype.card Y - 1).choose k)
  have hrec := Nat.choose_succ_left (Fintype.card Y - 2) k (by omega : 0 < k)
  have hnminus : Fintype.card Y - 2 + 1 = Fintype.card Y - 1 := by omega
  rw [hnminus] at hrec
  have hrec' : ((Fintype.card Y - 1).choose k : ℤ) =
      ((Fintype.card Y - 2).choose (k - 1) : ℤ) +
      ((Fintype.card Y - 2).choose k : ℤ) := by exact_mod_cast hrec
  rw [binomCoeff_nat, binomCoeff_nat_sub_one _ _ hk1, Nat.card_eq_fintype_card]
  linarith

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 103 END

-- VERITYOS ENTRY 104 BEGIN lemma Erdos993G1.FirstWide.matching_distinct a449a8fd573a2b348e91e1610f6f79a685e38909fe0739a27b72066a59de837d
namespace Erdos993G1.FirstWide

lemma matching_distinct {X : Type u} (G : SimpleGraph X) (a b c d : X)
    (hab : G.Adj a b) (hcd : G.Adj c d)
    (hdis : Disjoint ({a,b} : Set X) {c,d}) :
    a ≠ b ∧ a ≠ c ∧ a ≠ d ∧ b ≠ c ∧ b ≠ d ∧ c ≠ d := by
  have h := Set.disjoint_left.mp hdis
  have hac : a ≠ c := by intro e; exact h (a := a) (by simp) (by simp [e])
  have had : a ≠ d := by intro e; exact h (a := a) (by simp) (by simp [e])
  have hbc : b ≠ c := by intro e; exact h (a := b) (by simp) (by simp [e])
  have hbd : b ≠ d := by intro e; exact h (a := b) (by simp) (by simp [e])
  exact ⟨hab.ne, hac, had, hbc, hbd, hcd.ne⟩

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 104 END

-- VERITYOS ENTRY 105 BEGIN lemma Erdos993G1.FirstWide.matching_endpoints_card ce4e0346c857d4aeb91938f538f0b180ff8c28c85b5e927b85f0e3e3b9e4cbd6
namespace Erdos993G1.FirstWide

lemma matching_endpoints_card {X : Type u} [DecidableEq X]
    (G : SimpleGraph X) (a b c d : X) (hab : G.Adj a b) (hcd : G.Adj c d)
    (hdis : Disjoint ({a,b} : Set X) {c,d}) : ({a,b,c,d} : Finset X).card = 4 := by
  obtain ⟨h1,h2,h3,h4,h5,h6⟩ := matching_distinct G a b c d hab hcd hdis
  simp [h1,h2,h3,h4,h5,h6]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 105 END

-- VERITYOS ENTRY 106 BEGIN lemma Erdos993G1.FirstWide.indep_inter_matching_le_two 997ea066a7aff492e2c104d8916155048fa7e5e7403f8e064ccc69587b207acb
namespace Erdos993G1.FirstWide

lemma indep_inter_matching_le_two {X : Type u} [DecidableEq X]
    (G : SimpleGraph X) (a b c d : X) (hab : G.Adj a b) (hcd : G.Adj c d)
    (S : Finset X) (hS : G.IsIndepSet S) : (S ∩ {a,b,c,d}).card ≤ 2 := by
  have hedge (x y : X) (hxy : G.Adj x y) : (S ∩ {x,y}).card ≤ 1 := by
    apply Finset.card_le_one.mpr
    intro p hp q hq
    have hpS := (Finset.mem_inter.mp hp).1
    have hqS := (Finset.mem_inter.mp hq).1
    have hp' := (Finset.mem_inter.mp hp).2
    have hq' := (Finset.mem_inter.mp hq).2
    simp only [Finset.mem_insert,Finset.mem_singleton] at hp' hq'
    rcases hp' with rfl | rfl <;> rcases hq' with rfl | rfl
    · rfl
    · exact False.elim (hS hpS hqS hxy.ne hxy)
    · exact False.elim (hS hqS hpS hxy.ne hxy)
    · rfl
  have he : S ∩ {a,b,c,d} = (S ∩ {a,b}) ∪ (S ∩ {c,d}) := by
    ext x
    simp only [Finset.mem_inter,Finset.mem_insert,Finset.mem_singleton,Finset.mem_union]
    tauto
  rw [he]
  exact (Finset.card_union_le _ _).trans (by have h1 := hedge a b hab; have h2 := hedge c d hcd; omega)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 106 END

-- VERITYOS ENTRY 107 BEGIN lemma Erdos993G1.FirstWide.stratum_mem 504d4af084832f88d2563028e2faf28c0bb1338a3f4b6a51a6fcff6564656f73
namespace Erdos993G1.FirstWide

lemma stratum_mem {X : Type u} [Fintype X] [dX : DecidableEq X]
    (G : SimpleGraph X) (M S : Finset X) (k j : ℕ) :
    S ∈ stratum G M k j ↔ G.IsNIndepSet k S ∧ (S ∩ M).card = j := by
  classical
  simp only [stratum, Finset.mem_filter, SimpleGraph.mem_indepSetFinset_iff]
  have hd : (fun a b : X => Classical.propDecidable (a = b)) =
      dX := Subsingleton.elim _ _
  cases hd
  rfl

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 107 END

-- VERITYOS ENTRY 108 BEGIN lemma Erdos993G1.FirstWide.stratum_partition 6d086dd15c11fe70589d5707d757c100ef39058297f73df4b5446c345068440b
namespace Erdos993G1.FirstWide

lemma stratum_partition {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X)
    (hM : ∀ S : Finset X, G.IsIndepSet S → (S ∩ M).card ≤ 2) (k : ℕ) :
    indepCount G k = ((stratum G M k 0).card : ℤ) +
      ((stratum G M k 1).card : ℤ) + ((stratum G M k 2).card : ℤ) := by
  classical
  have hp := Finset.card_eq_sum_card_fiberwise
    (s := G.indepSetFinset k) (t := ({0,1,2} : Finset ℕ))
    (f := fun S : Finset X => (S ∩ M).card) (by
      intro S hS
      have hle := hM S (SimpleGraph.mem_indepSetFinset_iff.mp hS).isIndepSet
      simp only [Finset.mem_coe, Finset.mem_insert, Finset.mem_singleton]
      omega)
  have hf (j : ℕ) : (G.indepSetFinset k).filter (fun S => (S ∩ M).card = j) =
      stratum G M k j := by
    ext S
    simp only [Finset.mem_filter, SimpleGraph.mem_indepSetFinset_iff, stratum_mem]
  simp only [hf] at hp
  rw [indepCount_eq_card_indepSetFinset]
  have hp' : (G.indepSetFinset k).card = (stratum G M k 0).card +
      (stratum G M k 1).card + (stratum G M k 2).card := by
    simpa [add_assoc] using hp
  exact_mod_cast hp'

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 108 END

-- VERITYOS ENTRY 109 BEGIN lemma Erdos993G1.FirstWide.erase_inter_eq 80fd100398812f2e356dc20bec0b214775918fcc2b6d277d944b97f58dc20dd1
namespace Erdos993G1.FirstWide

lemma erase_inter_eq {X : Type u} [DecidableEq X] (S M : Finset X) (a : X) :
    S.erase a ∩ M = (S ∩ M).erase a := by ext x; simp

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 109 END

-- VERITYOS ENTRY 110 BEGIN lemma Erdos993G1.FirstWide.subset_fiber_eq_image e80b8cbb8d4e06d57ce70402981d36db3353854c32af7e06a56f22ed2af0f310
namespace Erdos993G1.FirstWide

lemma subset_fiber_eq_image {X : Type u} [DecidableEq X]
    (F : Finset (Finset X)) (S : Finset X) (k : ℕ)
    (hF : ∀ B ∈ F, B.card = k) (hS : S.card = k + 1) :
    F.filter (fun B => B ⊆ S) = (S.filter (fun a => S.erase a ∈ F)).image S.erase := by
  classical
  ext B
  simp only [Finset.mem_filter, Finset.mem_image]
  constructor
  · rintro ⟨hBF,hBS⟩
    obtain ⟨a,ha,he⟩ := Finset.exists_eq_insert_iff.mpr ⟨hBS, by rw [hF B hBF,hS]⟩
    have he' : S.erase a = B := by rw [← he,Finset.erase_insert ha]
    exact ⟨a,⟨by rw [← he]; simp,by simpa [he'] using hBF⟩,he'⟩
  · rintro ⟨a,⟨ha,he⟩,rfl⟩
    exact ⟨he,Finset.erase_subset _ _⟩

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 110 END

-- VERITYOS ENTRY 111 BEGIN lemma Erdos993G1.FirstWide.erase_image_card bce886ffb6829c7053b6b56d89c1adfe62f5407b0a58185245bded59618aee00
namespace Erdos993G1.FirstWide

lemma erase_image_card {X : Type u} [DecidableEq X] (S T : Finset X)
    (hT : T ⊆ S) : (T.image S.erase).card = T.card := by
  apply Finset.card_image_of_injOn
  intro a ha b hb he
  exact (Finset.erase_inj S (hT ha)).mp he

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 111 END

-- VERITYOS ENTRY 112 BEGIN lemma Erdos993G1.FirstWide.extension_fiber_bound 77c89a89044242a6a606c8e315ed0195a061f1e9df5ffd54ca1bba94b0cee8cb
namespace Erdos993G1.FirstWide

lemma extension_fiber_bound {X : Type u} [DecidableEq X]
    (U : Finset (Finset X)) (B Q : Finset X) (k : ℕ)
    (hU : ∀ S ∈ U, S.card = k+1) (hB : B.card = k)
    (hQ : ∀ a, a ∉ B → insert a B ∈ U → a ∈ Q) :
    (U.filter (fun S => B ⊆ S)).card ≤ Q.card := by
  classical
  calc
    _ ≤ (Q.image (fun a => insert a B)).card := Finset.card_le_card (by
      intro S hS
      obtain ⟨hSU,hBS⟩ := Finset.mem_filter.mp hS
      obtain ⟨a,ha,he⟩ := Finset.exists_eq_insert_iff.mpr ⟨hBS,by rw [hB,hU S hSU]⟩
      exact Finset.mem_image.mpr ⟨a,hQ a ha (by simpa [he] using hSU),he⟩)
    _ ≤ _ := Finset.card_image_le


end Erdos993G1.FirstWide
-- VERITYOS ENTRY 112 END

-- VERITYOS ENTRY 113 BEGIN lemma Erdos993G1.FirstWide.stratum_erase_outside_iff 757fa20557947ef6c340f03672327a4d2e51c127821d73a88a4c0eb1a4f4c51b
namespace Erdos993G1.FirstWide

lemma stratum_erase_outside_iff {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M S : Finset X) (k j : ℕ)
    (hS : S ∈ stratum G M (k+1) j) (a : X) (ha : a ∈ S) :
    S.erase a ∈ stratum G M k j ↔ a ∉ M := by
  have hs := (stratum_mem G M S (k+1) j).mp hS
  rw [stratum_mem]
  constructor
  · intro h haM
    have hc := Finset.card_erase_add_one (Finset.mem_inter.mpr ⟨ha,haM⟩)
    rw [← erase_inter_eq, h.2, hs.2] at hc
    omega
  · intro haM
    refine ⟨⟨hs.1.isIndepSet.mono (by exact Finset.erase_subset a S), ?_⟩, ?_⟩
    · have hc := Finset.card_erase_add_one ha
      rw [hs.1.card_eq] at hc
      omega
    · rw [erase_inter_eq,Finset.erase_eq_of_notMem (by simp [haM]),hs.2]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 113 END

-- VERITYOS ENTRY 114 BEGIN lemma Erdos993G1.FirstWide.stratum_erase_inside d08583874e7cb5bc39103f6cbe245aaf447740802812596ba5eee7d19484efd9
namespace Erdos993G1.FirstWide

lemma stratum_erase_inside {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M S : Finset X) (k j : ℕ)
    (hS : S ∈ stratum G M (k+1) (j+1)) (a : X) (ha : a ∈ S ∩ M) :
    S.erase a ∈ stratum G M k j := by
  have hs := (stratum_mem G M S (k+1) (j+1)).mp hS
  apply (stratum_mem G M (S.erase a) k j).mpr
  refine ⟨⟨hs.1.isIndepSet.mono (by exact Finset.erase_subset a S), ?_⟩, ?_⟩
  · have hc := Finset.card_erase_add_one (Finset.mem_inter.mp ha).1
    rw [hs.1.card_eq] at hc
    omega
  · have hc := Finset.card_erase_add_one ha
    rw [← erase_inter_eq, hs.2] at hc
    omega

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 114 END

-- VERITYOS ENTRY 115 BEGIN lemma Erdos993G1.FirstWide.stratum_insert_same_outside 4912eb459f7be5241cab85f68d8e0ba38e15b28b2bc499e53fbaac3995017df0
namespace Erdos993G1.FirstWide

lemma stratum_insert_same_outside {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M B : Finset X) (k j : ℕ)
    (hB : B ∈ stratum G M k j) (a : X) (ha : a ∉ B)
    (hS : insert a B ∈ stratum G M (k+1) j) : a ∉ M := by
  intro haM
  have hb := (stratum_mem G M B k j).mp hB
  have hs := (stratum_mem G M (insert a B) (k+1) j).mp hS
  have he : insert a B ∩ M = insert a (B ∩ M) := by ext x; simp only [Finset.mem_inter, Finset.mem_insert]; aesop
  have hc := Finset.card_insert_of_notMem (s := B ∩ M) (a := a) (by simp [ha])
  rw [← he, hb.2, hs.2] at hc
  omega

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 115 END

-- VERITYOS ENTRY 116 BEGIN lemma Erdos993G1.FirstWide.stratum_insert_cross_inside 6812c84b0d422aaeefc22bc3abeac557902e65ec37c3e6d767f380ae3ba07b3b
namespace Erdos993G1.FirstWide

lemma stratum_insert_cross_inside {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M B : Finset X) (k j : ℕ)
    (hB : B ∈ stratum G M k j) (a : X)
    (hS : insert a B ∈ stratum G M (k+1) (j+1)) : a ∈ M := by
  by_contra haM
  have hb := (stratum_mem G M B k j).mp hB
  have hs := (stratum_mem G M (insert a B) (k+1) (j+1)).mp hS
  have he : insert a B ∩ M = B ∩ M := by ext x; simp only [Finset.mem_inter, Finset.mem_insert]; aesop
  rw [he,hb.2] at hs
  omega

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 116 END

-- VERITYOS ENTRY 117 BEGIN lemma Erdos993G1.FirstWide.outside_incidence_bound cc9d1f4b9812be6d690e03db3481726c1e9fa303be0790d6a54e04d47f006fd2
namespace Erdos993G1.FirstWide

lemma outside_incidence_bound {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X) (hM : M.card = 4)
    (r : ℕ) (hr : 2 ≤ r) (hn : Nat.card X = 2*r+2) (j : ℕ) (hj : j ≤ 2) :
    (r+1-j) * (stratum G M (r+1) j).card ≤
      (r+j-2) * (stratum G M r j).card := by
  classical
  have hcount := Finset.card_mul_le_card_mul (fun S B : Finset X => B ⊆ S)
    (s := stratum G M (r+1) j) (t := stratum G M r j)
    (m := r+1-j) (n := r+j-2) ?_ ?_
  · simpa only [Nat.mul_comm] using hcount
  · intro S hS
    change r+1-j ≤ ((stratum G M r j).filter (fun B => B ⊆ S)).card
    have hs := (stratum_mem G M S (r+1) j).mp hS
    rw [subset_fiber_eq_image _ S r
      (fun B hB => ((stratum_mem G M B r j).mp hB).1.card_eq) hs.1.card_eq]
    have he : S.filter (fun a => S.erase a ∈ stratum G M r j) = S \ M := by
      ext a
      simp only [Finset.mem_filter,Finset.mem_sdiff]
      exact and_congr_right (fun ha => stratum_erase_outside_iff G M S r j hS a ha)
    rw [he,erase_image_card S (S \ M) Finset.sdiff_subset]
    have hc := Finset.card_sdiff_add_card_inter S M
    rw [hs.2,hs.1.card_eq] at hc
    omega
  · intro B hB
    change ((stratum G M (r+1) j).filter (fun S => B ⊆ S)).card ≤ r+j-2
    have hb := (stratum_mem G M B r j).mp hB
    have hbound := extension_fiber_bound (stratum G M (r+1) j) B
      (Finset.univ \ (M ∪ B)) r
      (fun S hS => ((stratum_mem G M S (r+1) j).mp hS).1.card_eq) hb.1.card_eq
      (fun a ha hS => by
        have haM := stratum_insert_same_outside G M B r j hB a ha hS
        simp [ha,haM])
    have hc := Finset.card_union_add_card_inter M B
    have hi : (M ∩ B).card = j := by rw [Finset.inter_comm,hb.2]
    rw [hM,hb.1.card_eq,hi] at hc
    have hn' : (Finset.univ : Finset X).card = 2*r+2 := by simpa [Nat.card_eq_fintype_card] using hn
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ _),hn'] at hbound
    have he : 2*r+2 - (M ∪ B).card = r+j-2 := by omega
    simpa only [he] using hbound


end Erdos993G1.FirstWide
-- VERITYOS ENTRY 117 END

-- VERITYOS ENTRY 118 BEGIN lemma Erdos993G1.FirstWide.matching_partner 259d75877bc12cbbc42be914263de232da90e97e15b3690baa0fc9ef8d418759
namespace Erdos993G1.FirstWide

lemma matching_partner {X : Type u} [DecidableEq X]
    (G : SimpleGraph X) (a b c d : X) (hab : G.Adj a b) (hcd : G.Adj c d)
    (x : X) (hx : x ∈ ({a,b,c,d} : Finset X)) :
    ∃ y ∈ ({a,b,c,d} : Finset X), G.Adj x y := by
  simp only [Finset.mem_insert,Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl
  · exact ⟨b,by simp,hab⟩
  · exact ⟨a,by simp,hab.symm⟩
  · exact ⟨d,by simp,hcd⟩
  · exact ⟨c,by simp,hcd.symm⟩

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 118 END

-- VERITYOS ENTRY 119 BEGIN lemma Erdos993G1.FirstWide.matching_cross_incidence_bound 12af7ed015f585a0312634023f0a0684d50afa6857b54d1580d6ab0d45f38801
namespace Erdos993G1.FirstWide

lemma matching_cross_incidence_bound {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (a b c d : X) (hab : G.Adj a b) (hcd : G.Adj c d)
    (hdis : Disjoint ({a,b} : Set X) {c,d}) (r : ℕ) :
    2 * (stratum G {a,b,c,d} (r+1) 2).card ≤
      2 * (stratum G {a,b,c,d} r 1).card := by
  classical
  let M : Finset X := {a,b,c,d}
  have hM : M.card = 4 := matching_endpoints_card G a b c d hab hcd hdis
  have hcount := Finset.card_mul_le_card_mul (fun S B : Finset X => B ⊆ S)
    (s := stratum G M (r+1) 2) (t := stratum G M r 1) (m := 2) (n := 2) ?_ ?_
  · simpa only [Nat.mul_comm] using hcount
  · intro S hS
    change 2 ≤ ((stratum G M r 1).filter (fun B => B ⊆ S)).card
    have hs := (stratum_mem G M S (r+1) 2).mp hS
    calc
      2 = (S ∩ M).card := hs.2.symm
      _ = ((S ∩ M).image S.erase).card :=
        (erase_image_card S (S ∩ M) Finset.inter_subset_left).symm
      _ ≤ _ := Finset.card_le_card (by
        intro B hB
        obtain ⟨x,hx,rfl⟩ := Finset.mem_image.mp hB
        exact Finset.mem_filter.mpr ⟨stratum_erase_inside G M S r 1 hS x hx,
          Finset.erase_subset x S⟩)
  · intro B hB
    change ((stratum G M (r+1) 2).filter (fun S => B ⊆ S)).card ≤ 2
    have hb := (stratum_mem G M B r 1).mp hB
    obtain ⟨x,hx⟩ := Finset.card_pos.mp (show 0 < (B ∩ M).card by omega)
    have hxB := (Finset.mem_inter.mp hx).1
    have hxM := (Finset.mem_inter.mp hx).2
    obtain ⟨y,hyM,hxy⟩ := matching_partner G a b c d hab hcd x hxM
    have hpair : ({x,y} : Finset X) ⊆ M := by
      intro z hz
      simp only [Finset.mem_insert,Finset.mem_singleton] at hz
      rcases hz with rfl | rfl <;> assumption
    have hQ : (M \ {x,y}).card = 2 := by
      rw [Finset.card_sdiff_of_subset hpair,hM,Finset.card_pair hxy.ne]
    apply le_trans (b := (M \ {x,y}).card) ?_ hQ.le
    apply extension_fiber_bound (stratum G M (r+1) 2) B (M \ {x,y}) r
      (fun S hS => ((stratum_mem G M S (r+1) 2).mp hS).1.card_eq) hb.1.card_eq
    intro z hz hS
    have hzM := stratum_insert_cross_inside G M B r 1 hB z hS
    have hzx : z ≠ x := by intro he; exact hz (he ▸ hxB)
    have hzy : z ≠ y := by
      intro he
      have hs := ((stratum_mem G M (insert z B) (r+1) 2).mp hS).1.isIndepSet
      have hy : y ∈ insert z B := by simp [he]
      exact hs (by simp [hxB]) hy hxy.ne hxy
    simp [hzM,hzx,hzy]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 119 END

-- VERITYOS ENTRY 120 BEGIN lemma Erdos993G1.FirstWide.stratum_univ_empty fc80060f69804a645caad6e008c8d8371e942720ab9fbcf49c9028bb3f77e41d
namespace Erdos993G1.FirstWide

lemma stratum_univ_empty {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (k j : ℕ) (h : k ≠ j) : stratum G Finset.univ k j = ∅ := by
  classical
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro S hS
  have hs := (stratum_mem G Finset.univ S k j).mp hS
  have hc := hs.1.card_eq
  simp only [Finset.inter_univ] at hs
  exact h (hc.symm.trans hs.2)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 120 END

-- VERITYOS ENTRY 121 BEGIN lemma Erdos993G1.FirstWide.delta_nonpos_of_disjoint_edges bc5f1254c9d31ae39347aa6af57b869504a2c26e0ec9e99aa67b3b4298f64da2
namespace Erdos993G1.FirstWide

lemma delta_nonpos_of_disjoint_edges {X : Type u} [Finite X]
    (G : SimpleGraph X) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card X = 2*r+2)
    (a b c d : X) (hab : G.Adj a b) (hcd : G.Adj c d)
    (hdis : Disjoint ({a,b} : Set X) {c,d}) : delta G (r : ℤ) ≤ 0 := by
  classical
  letI := Fintype.ofFinite X
  let M : Finset X := {a,b,c,d}
  have hM : M.card = 4 := matching_endpoints_card G a b c d hab hcd hdis
  have hle : ∀ S : Finset X, G.IsIndepSet S → (S ∩ M).card ≤ 2 :=
    fun S hS => indep_inter_matching_le_two G a b c d hab hcd S hS
  have hL := stratum_partition G M hle r
  have hV := stratum_partition G M hle (r+1)
  have hcross := matching_cross_incidence_bound G a b c d hab hcd hdis r
  have hcross' : (stratum G M (r+1) 2).card ≤ (stratum G M r 1).card := by
    change 2 * (stratum G M (r+1) 2).card ≤ 2 * (stratum G M r 1).card at hcross
    omega
  rw [delta_nat,hL,hV]
  by_cases hr1 : r = 1
  · subst r
    have hn' : (Finset.univ : Finset X).card = 4 := by simpa [Nat.card_eq_fintype_card] using hn
    have hMu : M = Finset.univ := Finset.eq_of_subset_of_card_le (Finset.subset_univ _) (by omega)
    have e10 := stratum_univ_empty G 1 0 (by omega)
    have e12 := stratum_univ_empty G 1 2 (by omega)
    have e20 := stratum_univ_empty G 2 0 (by omega)
    have e21 := stratum_univ_empty G 2 1 (by omega)
    rw [hMu] at hcross' ⊢
    simp only [e10,e12,e20,e21,Finset.card_empty,Nat.cast_zero,zero_add,add_zero]
    have hc : ((stratum G Finset.univ 2 2).card : ℤ) ≤
        (stratum G Finset.univ 1 1).card := by exact_mod_cast hcross'
    omega
  · have hr2 : 2 ≤ r := by omega
    have h0 := outside_incidence_bound G M hM r hr2 hn 0 (by omega)
    have h1 := outside_incidence_bound G M hM r hr2 hn 1 (by omega)
    have h2 := outside_incidence_bound G M hM r hr2 hn 2 (by omega)
    have he1 : r+1-1 = r := by omega
    have he2 : r+1-2 = r-1 := by omega
    have he3 : r+2-2 = r := by omega
    simp only [Nat.add_zero,Nat.sub_zero] at h0
    rw [he1,he2] at h1
    rw [he2,he3] at h2
    have hv0 : (stratum G M (r+1) 0).card ≤ (stratum G M r 0).card := by
      have hrm : r-2 ≤ r+1 := by omega
      nlinarith [Nat.mul_le_mul_right (stratum G M r 0).card hrm]
    have hv12 : (stratum G M (r+1) 1).card + (stratum G M (r+1) 2).card ≤
        (stratum G M r 1).card + (stratum G M r 2).card := by
      have he : r-1+1=r := by omega
      nlinarith
    have h0z : ((stratum G M (r+1) 0).card : ℤ) ≤ (stratum G M r 0).card := by exact_mod_cast hv0
    have h12z : ((stratum G M (r+1) 1).card : ℤ) + (stratum G M (r+1) 2).card ≤
        (stratum G M r 1).card + (stratum G M r 2).card := by exact_mod_cast hv12
    omega

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 121 END

-- VERITYOS ENTRY 122 BEGIN lemma Erdos993G1.firstWide_exceptional_history 7241d7166debed6cbff2ad02fc9192d4493a39178bdfa34dfaeca471a9a08b8c
lemma Erdos993G1.firstWide_exceptional_history {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card Y = 2 * r + 2)
    (he : Nat.card G.edgeSet ≤ 1) (k : ℕ) (hk : k ≤ r) :
    0 < Erdos993G1.delta G (k : ℤ) := by
  by_cases he0 : Nat.card G.edgeSet = 0
  · exact Erdos993G1.FirstWide.delta_pos_of_edgeless_counts G r hn
      (Erdos993G1.FirstWide.indepCount_edgeless G he0) hk
  · have he1 : Nat.card G.edgeSet = 1 := by omega
    exact Erdos993G1.FirstWide.delta_pos_of_one_edge_counts G r hr hn
      (Erdos993G1.FirstWide.indepCount_one_edge G he1) hk
-- VERITYOS ENTRY 122 END

-- VERITYOS ENTRY 123 BEGIN lemma Erdos993G1.FirstWide.shape_edges_overlap c7a18cb14f679409132fad56f06cda44eec7dd3a5b84519f848ab596aa3aad7f
namespace Erdos993G1.FirstWide

lemma shape_edges_overlap {V : Type u} (G : SimpleGraph V)
    (hnone : ¬ ∃ a b c d : V, G.Adj a b ∧ G.Adj c d ∧
      Disjoint ({a,b} : Set V) {c,d})
    {a b c d : V} (hab : G.Adj a b) (hcd : G.Adj c d) :
    a = c ∨ a = d ∨ b = c ∨ b = d := by
  by_contra h
  apply hnone
  refine ⟨a,b,c,d,hab,hcd,?_⟩
  simp only [Set.disjoint_left, Set.mem_insert_iff, Set.mem_singleton_iff]
  aesop

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 123 END

-- VERITYOS ENTRY 124 BEGIN lemma Erdos993G1.FirstWide.shape_two_incident a347e4eb45f7d367392f11b85662c6b3c734264865cdb89aa40a5944fbf2fbdc
namespace Erdos993G1.FirstWide

lemma shape_two_incident {V : Type u} [Finite V] (G : SimpleGraph V)
    (hedge : 2 ≤ Nat.card G.edgeSet)
    (hnone : ¬ ∃ a b c d : V, G.Adj a b ∧ G.Adj c d ∧
      Disjoint ({a,b} : Set V) {c,d}) :
    ∃ a b c : V, G.Adj a b ∧ G.Adj a c ∧ b ≠ c := by
  classical
  letI : Nontrivial G.edgeSet := Finite.one_lt_card_iff_nontrivial.mp (by omega)
  obtain ⟨e,f,hef⟩ := exists_pair_ne G.edgeSet
  obtain ⟨e,he⟩ := e
  obtain ⟨f,hf⟩ := f
  have hne : e ≠ f := by simpa using hef
  induction e using Sym2.inductionOn with | _ a b =>
  induction f using Sym2.inductionOn with | _ c d =>
  have hab : G.Adj a b := he
  have hcd : G.Adj c d := hf
  have ho := shape_edges_overlap G hnone hab hcd
  have hne' := (mt Sym2.eq_iff.mpr hne)
  rcases ho with h | h | h | h
  · subst c; exact ⟨a,b,d,hab,hcd,by aesop⟩
  · subst d; exact ⟨a,b,c,hab,hcd.symm,by aesop⟩
  · subst c; exact ⟨b,a,d,hab.symm,hcd,by aesop⟩
  · subst d; exact ⟨b,a,c,hab.symm,hcd.symm,by aesop⟩

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 124 END

-- VERITYOS ENTRY 125 BEGIN lemma Erdos993G1.FirstWide.intersecting_edges_center_or_triangle 1cd4ea3d6eb1664face4bc3a848c07c50ea76be77e3f3d629f8b7c073058d207
namespace Erdos993G1.FirstWide

lemma intersecting_edges_center_or_triangle {V : Type u} [Finite V]
    (G : SimpleGraph V) (hedge : 2 ≤ Nat.card G.edgeSet)
    (hnone : ¬ ∃ a b c d : V, G.Adj a b ∧ G.Adj c d ∧
      Disjoint ({a,b} : Set V) {c,d}) :
    (∃ a b c : V, G.Adj a b ∧ G.Adj a c ∧ b ≠ c ∧
      ∀ x y : V, G.Adj x y → x = a ∨ y = a) ∨
    (∃ a b c : V, a ≠ b ∧ a ≠ c ∧ b ≠ c ∧
      ∀ x y : V, G.Adj x y ↔ x ≠ y ∧
        (x = a ∨ x = b ∨ x = c) ∧ (y = a ∨ y = b ∨ y = c)) := by
  classical
  obtain ⟨a,b,c,hab,hac,hbc⟩ := shape_two_incident G hedge hnone
  by_cases hc : ∀ x y : V, G.Adj x y → x = a ∨ y = a
  · exact Or.inl ⟨a,b,c,hab,hac,hbc,hc⟩
  push Not at hc
  obtain ⟨x,y,hxy,hxa,hya⟩ := hc
  have hb := shape_edges_overlap G hnone hab hxy
  have hc := shape_edges_overlap G hnone hac hxy
  have hadj : G.Adj b c := by
    have hyx := hxy.symm
    clear hnone hedge
    aesop
  clear hb hc hxy hxa hya
  right
  refine ⟨a,b,c,hab.ne,hac.ne,hbc,?_⟩
  intro x y
  constructor
  · intro h
    have h1 := shape_edges_overlap G hnone h hab
    have h2 := shape_edges_overlap G hnone h hac
    have h3 := shape_edges_overlap G hnone h hadj
    have hn := h.ne
    have habn := hab.ne
    have hacn := hac.ne
    clear hnone hedge hab hac hadj
    aesop
  · rintro ⟨hne,hx,hy⟩
    have hba := hab.symm
    have hca := hac.symm
    have hcb := hadj.symm
    clear hnone hedge
    aesop

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 125 END

-- VERITYOS ENTRY 126 BEGIN lemma Erdos993G1.FirstWide.shape_indep_on_edgeless 8d1f03b1dd503525f9843dfda50dd92574a58231497237fca86e4cf3494e8bee
namespace Erdos993G1.FirstWide

lemma shape_indep_on_edgeless {V : Type u} [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V)
    (hU : G.IsIndepSet U) (j : ℕ) :
    ((U.powersetCard j).filter (fun S : Finset V => G.IsIndepSet S)).card = U.card.choose j := by
  rw [Finset.filter_eq_self.mpr, Finset.card_powersetCard]
  intro S hS
  exact hU.mono (by simpa using (Finset.mem_powersetCard.mp hS).1)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 126 END

-- VERITYOS ENTRY 127 BEGIN lemma Erdos993G1.FirstWide.shape_indep_on_succ 8bce84601f17028aa6b5281a6709b267fc112a5de410ed07a0bcef70f551c148
namespace Erdos993G1.FirstWide

lemma shape_indep_on_succ {V : Type u} [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) (a : V)
    (ha : a ∈ U) (j : ℕ) :
    ((U.powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S)).card =
      (((U.erase a).powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S)).card +
      ((((U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)).powersetCard j)).filter
        (fun S : Finset V => G.IsIndepSet S)).card := by
  classical
  let N := U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)
  let A := (U.powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S)
  have hexclude : A.filter (fun S => a ∉ S) =
      ((U.erase a).powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S) := by
    ext S
    simp only [A, Finset.mem_filter, Finset.mem_powersetCard]
    constructor
    · rintro ⟨⟨⟨hSU,hcard⟩,hind⟩,hnot⟩
      exact ⟨⟨by intro x hx; exact Finset.mem_erase.mpr ⟨by aesop,hSU hx⟩,hcard⟩,hind⟩
    · rintro ⟨⟨hSU,hcard⟩,hind⟩
      exact ⟨⟨⟨fun x hx => (Finset.mem_erase.mp (hSU hx)).2,hcard⟩,hind⟩,
        by intro h; simpa using hSU h⟩
  have hinclude : (A.filter (fun S => a ∈ S)).card =
      ((N.powersetCard j).filter (fun S : Finset V => G.IsIndepSet S)).card := by
    apply Finset.card_bij (fun S _ => S.erase a)
    · intro S hS
      obtain ⟨hS,haS⟩ := Finset.mem_filter.mp hS
      obtain ⟨hS,hind⟩ := Finset.mem_filter.mp hS
      obtain ⟨hSU,hcard⟩ := Finset.mem_powersetCard.mp hS
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_powersetCard.mpr ⟨?_,?_⟩,?_⟩
      · intro x hx
        obtain ⟨hxa,hxS⟩ := Finset.mem_erase.mp hx
        exact Finset.mem_filter.mpr ⟨hSU hxS,hxa,hind haS hxS (Ne.symm hxa)⟩
      · simpa [hcard] using Finset.card_erase_of_mem haS
      · exact hind.mono (by simpa using Finset.erase_subset a S)
    · intro S hS T hT hST
      have haS := (Finset.mem_filter.mp hS).2
      have haT := (Finset.mem_filter.mp hT).2
      calc S = insert a (S.erase a) := (Finset.insert_erase haS).symm
           _ = insert a (T.erase a) := by rw [hST]
           _ = T := Finset.insert_erase haT
    · intro S hS
      obtain ⟨hS,hind⟩ := Finset.mem_filter.mp hS
      obtain ⟨hSN,hcard⟩ := Finset.mem_powersetCard.mp hS
      have hnot : a ∉ S := by intro h; exact (Finset.mem_filter.mp (hSN h)).2.1 rfl
      have hSU : S ⊆ U := fun x hx => (Finset.mem_filter.mp (hSN hx)).1
      have hnew : G.IsIndepSet (↑(insert a S) : Set V) := by
        intro x hx y hy hxy hAdj
        simp only [Finset.mem_coe, Finset.mem_insert] at hx hy
        rcases hx with rfl | hx
        · rcases hy with rfl | hy
          · exact hxy rfl
          · exact (Finset.mem_filter.mp (hSN hy)).2.2 hAdj
        · rcases hy with rfl | hy
          · exact (Finset.mem_filter.mp (hSN hx)).2.2 hAdj.symm
          · exact hind hx hy hxy hAdj
      refine ⟨insert a S,?_,Finset.erase_insert hnot⟩
      apply Finset.mem_filter.mpr
      refine ⟨?_,Finset.mem_insert_self a S⟩
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_powersetCard.mpr ⟨Finset.insert_subset ha hSU,?_⟩,hnew⟩
      rw [Finset.card_insert_of_notMem hnot,hcard]
  have hp := Finset.card_filter_add_card_filter_not (s := A) (fun S => a ∈ S)
  rw [hinclude,hexclude] at hp
  exact hp.symm.trans (Nat.add_comm _ _)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 127 END

-- VERITYOS ENTRY 128 BEGIN lemma Erdos993G1.FirstWide.shape_indep_on_center 0fa259df3c1afda8858ce7e3e9effea405b4e5ff2e39fe173dc207168776fb4f
namespace Erdos993G1.FirstWide

lemma shape_indep_on_center {V : Type u} [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) (a : V)
    (ha : a ∈ U)
    (hc : ∀ x ∈ U, ∀ y ∈ U, G.Adj x y → x = a ∨ y = a) (j : ℕ) :
    ((U.powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S)).card =
      (U.card-1).choose (j+1) +
        (U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)).card.choose j := by
  have hi : G.IsIndepSet (↑(U.erase a) : Set V) := by
    intro x hx y hy hxy hAdj
    obtain ⟨hxa,hxU⟩ := Finset.mem_erase.mp hx
    obtain ⟨hya,hyU⟩ := Finset.mem_erase.mp hy
    rcases hc x hxU y hyU hAdj with h | h
    · exact hxa h
    · exact hya h
  have hN : G.IsIndepSet (↑(U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)) : Set V) := by
    apply hi.mono
    intro x hx
    obtain ⟨hxU,hxa,_⟩ := Finset.mem_filter.mp hx
    exact Finset.mem_erase.mpr ⟨hxa,hxU⟩
  rw [shape_indep_on_succ G U a ha j, shape_indep_on_edgeless G _ hi,
    shape_indep_on_edgeless G _ hN, Finset.card_erase_of_mem ha]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 128 END

-- VERITYOS ENTRY 129 BEGIN lemma Erdos993G1.FirstWide.coeff_center ebb0a7aec5871bfe38c9779ca5ca49c878c4fb83f4c2b0e09f3e0500fe186868
namespace Erdos993G1.FirstWide

lemma coeff_center {V : Type u} [Finite V] (G : SimpleGraph V)
    {a b c : V} (hab : G.Adj a b) (hac : G.Adj a c) (hbc : b ≠ c)
    (hc : ∀ x y : V, G.Adj x y → x = a ∨ y = a) :
    ∃ q : ℕ, q ≤ Nat.card V - 3 ∧ ∀ j : ℕ,
      Erdos993G1.indepCount G j = binomCoeff (Nat.card V - 1) (j : ℤ) +
        binomCoeff q ((j : ℤ)-1) := by
  classical
  letI := Fintype.ofFinite V
  let U : Finset V := Finset.univ
  let N := U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)
  have hN : N ⊆ U \ {a,b,c} := by
    intro x hx
    obtain ⟨hxU,hxa,hna⟩ := Finset.mem_filter.mp hx
    apply Finset.mem_sdiff.mpr
    refine ⟨hxU,?_⟩
    simp only [Finset.mem_insert,Finset.mem_singleton]
    rintro (rfl | rfl | rfl)
    · exact hxa rfl
    · exact hna hab
    · exact hna hac
  have hthree : ({a,b,c} : Finset V).card = 3 := by
    simp [hab.ne,hac.ne,hbc]
  have hcardU : U.card = Nat.card V := by simp [U,Nat.card_eq_fintype_card]
  have hbound : N.card ≤ Nat.card V - 3 := by
    have h := Finset.card_le_card hN
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ _), hthree, hcardU] at h
    exact h
  refine ⟨N.card,hbound,?_⟩
  intro j
  cases j with
  | zero => simp [Erdos993G1.indepCount_zero,binomCoeff]
  | succ j =>
    have hcount := shape_indep_on_center G U a (Finset.mem_univ a)
      (fun x _ y _ h => hc x y h) j
    rw [hcardU] at hcount
    rw [Erdos993G1.indepCount_eq_card_indepSetFinset,
      Erdos993G1.indepSetFinset_eq_filter_powersetCard]
    change (((U.powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S)).card : ℤ) = _
    rw [hcount, Nat.cast_add]
    simp [binomCoeff, Nat.cast_add, N, show (0 : ℤ) ≤ (j : ℤ)+1 by omega]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 129 END

-- VERITYOS ENTRY 130 BEGIN lemma Erdos993G1.FirstWide.coeff_triangle 68801e620bc92e155e0a73688a6f255bdd45798379f051be63a9236b3e1ea258
namespace Erdos993G1.FirstWide

lemma coeff_triangle {V : Type u} [Finite V] (G : SimpleGraph V)
    {a b c : V} (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (hG : ∀ x y : V, G.Adj x y ↔ x ≠ y ∧
      (x = a ∨ x = b ∨ x = c) ∧ (y = a ∨ y = b ∨ y = c)) :
    ∀ j : ℕ, Erdos993G1.indepCount G j =
      binomCoeff (Nat.card V-3) (j : ℤ) +
        3 * binomCoeff (Nat.card V-3) ((j : ℤ)-1) := by
  classical
  letI := Fintype.ofFinite V
  let U : Finset V := Finset.univ
  let A := U.erase a
  let I := U \ {a,b,c}
  have habG : G.Adj a b := (hG a b).mpr ⟨hab,Or.inl rfl,Or.inr (Or.inl rfl)⟩
  have hacG : G.Adj a c := (hG a c).mpr ⟨hac,Or.inl rfl,Or.inr (Or.inr rfl)⟩
  have hbcG : G.Adj b c := (hG b c).mpr ⟨hbc,Or.inr (Or.inl rfl),Or.inr (Or.inr rfl)⟩
  have hmemI (x : V) : x ∈ I ↔ x ≠ a ∧ x ≠ b ∧ x ≠ c := by
    simp [I,U]
  have hcardU : U.card = Nat.card V := by simp [U,Nat.card_eq_fintype_card]
  have hthree : ({a,b,c} : Finset V).card = 3 := by simp [hab,hac,hbc]
  have hn : 3 ≤ Nat.card V := by
    have h := Finset.card_le_card (show ({a,b,c} : Finset V) ⊆ U from Finset.subset_univ _)
    rwa [hthree,hcardU] at h
  have hcardI : I.card = Nat.card V-3 := by
    exact (Finset.card_sdiff_of_subset (Finset.subset_univ _)).trans (by rw [hthree,hcardU])
  have hcardA : A.card = Nat.card V-1 := by simp [A,U,Nat.card_eq_fintype_card]
  have hIa : U.filter (fun x => x ≠ a ∧ ¬G.Adj a x) = I := by
    ext x
    rw [hmemI]
    simp only [Finset.mem_filter, U, Finset.mem_univ, true_and]
    constructor
    · rintro ⟨hxa,hno⟩
      exact ⟨hxa,by intro h; subst x; exact hno habG,
        by intro h; subst x; exact hno hacG⟩
    · rintro ⟨hxa,hxb,hxc⟩
      refine ⟨hxa,?_⟩
      intro h
      rcases (hG a x).mp h with ⟨_,_,h | h | h⟩
      · exact hxa h
      · exact hxb h
      · exact hxc h
  have hIb : A.filter (fun x => x ≠ b ∧ ¬G.Adj b x) = I := by
    ext x
    rw [hmemI]
    simp only [Finset.mem_filter, A, Finset.mem_erase, U, Finset.mem_univ, and_true]
    constructor
    · rintro ⟨hxa,hxb,hno⟩
      exact ⟨hxa,hxb,by intro h; subst x; exact hno hbcG⟩
    · rintro ⟨hxa,hxb,hxc⟩
      refine ⟨hxa,hxb,?_⟩
      intro h
      rcases (hG b x).mp h with ⟨_,_,h | h | h⟩
      · exact hxa h
      · exact hxb h
      · exact hxc h
  have hi : G.IsIndepSet (↑I : Set V) := by
    intro x hx y hy hxy hAdj
    obtain ⟨hxa,hxb,hxc⟩ := (hmemI x).mp hx
    rcases ((hG x y).mp hAdj).2.1 with h | h | h
    · exact hxa h
    · exact hxb h
    · exact hxc h
  have hcenter : ∀ x ∈ A, ∀ y ∈ A, G.Adj x y → x = b ∨ y = b := by
    intro x hx y hy hAdj
    have hxa := (Finset.mem_erase.mp hx).1
    have hya := (Finset.mem_erase.mp hy).1
    obtain ⟨hne,hx,hy⟩ := (hG x y).mp hAdj
    clear hG
    aesop
  intro j
  cases j with
  | zero => simp [Erdos993G1.indepCount_zero,binomCoeff]
  | succ j =>
    have hcount := shape_indep_on_succ G U a (Finset.mem_univ a) j
    have hc := shape_indep_on_center G A b (by simp [A,U,Ne.symm hab]) hcenter j
    rw [hIb,hcardA,hcardI] at hc
    change ((U.powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S)).card =
      ((A.powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S)).card + _ at hcount
    rw [hc,hIa,shape_indep_on_edgeless G I hi,hcardI] at hcount
    have hn' : Nat.card V-1-1 = (Nat.card V-3)+1 := by omega
    rw [hn',Nat.choose_succ_succ'] at hcount
    rw [Erdos993G1.indepCount_eq_card_indepSetFinset,
      Erdos993G1.indepSetFinset_eq_filter_powersetCard]
    change (((U.powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S)).card : ℤ) = _
    rw [hcount]
    simp [binomCoeff, Nat.cast_add, show (0 : ℤ) ≤ (j : ℤ)+1 by omega]
    ring

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 130 END

-- VERITYOS ENTRY 131 BEGIN lemma Erdos993G1.FirstWide.intersecting_edges_count_shapes 2ef1af9291a95162818c1c19180c72a1fa95692f5f9b7af236a5f7c0078da68a
namespace Erdos993G1.FirstWide

lemma intersecting_edges_count_shapes {V : Type u} [Finite V]
    (G : SimpleGraph V) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card V = 2*r+2)
    (hedge : 2 ≤ Nat.card G.edgeSet)
    (hnone : ¬ ∃ a b c d : V, G.Adj a b ∧ G.Adj c d ∧
      Disjoint ({a,b} : Set V) {c,d}) :
    (∃ q : ℕ, q ≤ 2*r-1 ∧ ∀ j : ℕ,
      Erdos993G1.indepCount G j = binomCoeff (2*r+1) (j : ℤ) +
        binomCoeff q ((j : ℤ)-1)) ∨
    (∀ j : ℕ, Erdos993G1.indepCount G j =
      binomCoeff (2*r-1) (j : ℤ) + 3*binomCoeff (2*r-1) ((j : ℤ)-1)) := by
  rcases intersecting_edges_center_or_triangle G hedge hnone with h | h
  · obtain ⟨a,b,c,hab,hac,hbc,hc⟩ := h
    obtain ⟨q,hq,hqcount⟩ := coeff_center G hab hac hbc hc
    left
    refine ⟨q,by omega,?_⟩
    have hn' : Nat.card V-1 = 2*r+1 := by omega
    simpa [hn'] using hqcount
  · obtain ⟨a,b,c,hab,hac,hbc,hG⟩ := h
    right
    have hn' : Nat.card V-3 = 2*r-1 := by omega
    simpa [hn'] using coeff_triangle G hab hac hbc hG

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 131 END

-- VERITYOS ENTRY 132 BEGIN lemma Erdos993G1.firstWide_nonpos_of_two_edges faec7f6b03d4b2a9a2b48b2bf0589cbd323c4b04517f46bdf0d4612ffb919b0c
lemma Erdos993G1.firstWide_nonpos_of_two_edges {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card Y = 2 * r + 2)
    (he : 2 ≤ Nat.card G.edgeSet) : Erdos993G1.delta G (r : ℤ) ≤ 0 := by
  classical
  by_cases hm : ∃ a b c d : Y, G.Adj a b ∧ G.Adj c d ∧
      Disjoint ({a, b} : Set Y) {c, d}
  · obtain ⟨a, b, c, d, hab, hcd, hdis⟩ := hm
    exact Erdos993G1.FirstWide.delta_nonpos_of_disjoint_edges G r hr hn a b c d hab hcd hdis
  · rcases Erdos993G1.FirstWide.intersecting_edges_count_shapes G r hr hn he hm with hc | hc
    · obtain ⟨q, hq, hc⟩ := hc
      exact Erdos993G1.FirstWide.delta_nonpos_of_center_counts G r q hr hq hc
    · exact (Erdos993G1.FirstWide.delta_neg_of_triangle_counts G r hr hc).le

-- VERITYOS ENTRY 132 END

-- VERITYOS ENTRY 133 BEGIN lemma Erdos993G1.firstWide_delta_pos_iff 31492549fd371b31871f994d6fd5221333f0a07fe6680accb2872748a2a902bc
lemma Erdos993G1.firstWide_delta_pos_iff {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card Y = 2 * r + 2) :
    0 < Erdos993G1.delta G (r : ℤ) ↔ Nat.card G.edgeSet ≤ 1 := by
  constructor
  · intro hp
    by_contra he
    have he2 : 2 ≤ Nat.card G.edgeSet := by omega
    have hnpos := Erdos993G1.firstWide_nonpos_of_two_edges G r hr hn he2
    omega
  · intro he
    exact Erdos993G1.firstWide_exceptional_history G r hr hn he r le_rfl

-- VERITYOS ENTRY 133 END

-- VERITYOS ENTRY 134 BEGIN lemma Erdos993G1.firstWide_crossing_sign a058abb1bd2d67916c65c5edda79c34ef232bc9027794ac2ff822a5a720b1999
lemma Erdos993G1.firstWide_crossing_sign {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card Y = 2 * r + 2)
    (hx : Erdos993G1.firstDescent G < r) : Erdos993G1.delta G (r : ℤ) ≤ 0 := by
  by_contra hnpos
  have hp : 0 < Erdos993G1.delta G (r : ℤ) := by omega
  have he := (Erdos993G1.firstWide_delta_pos_iff G r hr hn).mp hp
  have hhistory := Erdos993G1.firstWide_exceptional_history G r hr hn he
  have hgt := Erdos993G1.FirstWide.firstDescent_gt_of_positive_history G r hhistory
  omega

-- VERITYOS ENTRY 134 END

-- VERITYOS ENTRY 135 BEGIN lemma Erdos993G1.ordinaryG1_firstWide 585a1f22186160b391142afde64351080325aafd1713e3d97530b315495924ef
lemma Erdos993G1.ordinaryG1_firstWide {Y : Type u} [Finite Y]
    (T : SimpleGraph Y) (v s g : Y) (p : ℕ)
    (hG : Erdos993G1.ordinaryG1Guards T v s g p)
    (hn : Erdos993G1.residualOrder T v g = 2 * p - 2) :
    Erdos993G1.delta (Erdos993G1.residual T v g) ((p : ℤ) - 2) ≤ 0 := by
  obtain ⟨hr, hcard, hcast, hx⟩ :=
    Erdos993G1.FirstWide.ordinaryG1_firstWide_rank T v s g p hG hn
  have h := Erdos993G1.firstWide_crossing_sign (Erdos993G1.residual T v g)
    (p - 2) hr hcard hx
  simpa only [hcast] using h

-- VERITYOS ENTRY 135 END

-- VERITYOS ENTRY 136 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_pascal ad8f2dd24203350c1b26319fbfe9ce36e791a7ab1181dec1a3d61d2ba461e416
namespace Erdos993G1.ThirdWide

lemma binomDelta_pascal (m j : ℕ) :
    ((m+1).choose (j+2) : ℤ) - (m+1).choose (j+1) =
      ((m.choose (j+2) : ℤ) - m.choose (j+1)) +
      ((m.choose (j+1) : ℤ) - m.choose j) := by
  rw [show j+2=(j+1)+1 by omega, Nat.choose_succ_succ', Nat.choose_succ_succ']
  push_cast
  ring

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 136 END

-- VERITYOS ENTRY 137 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_step_up 51c9d817de14a155103da4671e3aa29680831ba65d5f4af8297ff07153c1d509
namespace Erdos993G1.ThirdWide

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

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 137 END

-- VERITYOS ENTRY 138 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_step_down bd86c1e1a691759cc8f1436bffaf861ada3c7aa10e83e4fee50ad78add9a9f6d
namespace Erdos993G1.ThirdWide

lemma binomDelta_step_down (m k : ℕ) (hk : 1 ≤ k) (hm : m < 2*k) :
    ((m+1).choose (k+1) : ℤ) - (m+1).choose k ≤
      (m.choose (k+1) : ℤ) - m.choose k := by
  obtain ⟨j, rfl⟩ := Nat.exists_eq_add_of_le' hk
  have hc := FirstWide.choose_step_nonpos (n := m) (k := j) (by omega)
  have hc' : (m.choose (j+1) : ℤ) ≤ m.choose j := by exact_mod_cast hc
  have hp := binomDelta_pascal m j
  linarith

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 138 END

-- VERITYOS ENTRY 139 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_mono_center 1d4d3404c0783fa125c8e3a91106b6cff6674f6e958d6149ecc532eeb68acb4b
namespace Erdos993G1.ThirdWide

lemma binomDelta_mono_center {k a b : ℕ} (h : 2*k ≤ a) (hab : a ≤ b) :
    (a.choose (k+1) : ℤ) - a.choose k ≤
      (b.choose (k+1) : ℤ) - b.choose k := by
  induction b, hab using Nat.le_induction with
  | base => exact le_rfl
  | succ b hab ih => exact ih.trans (binomDelta_step_up b k (by omega))

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 139 END

-- VERITYOS ENTRY 140 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_mono f797ffe1817d76ba63cfd96c5704d14a06836d912966a689fca1796984c5d523
namespace Erdos993G1.ThirdWide

lemma binomDelta_mono {k a b : ℕ} (h : 2*k+1 ≤ a) (hab : a ≤ b) :
    (a.choose (k+1) : ℤ) - a.choose k ≤
      (b.choose (k+1) : ℤ) - b.choose k :=
  binomDelta_mono_center (by omega) hab

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 140 END

-- VERITYOS ENTRY 141 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_antitone bcd6d0976d001e9c61610c510e25609915dc22d8e9dcb0e54be64b79d3e79d6c
namespace Erdos993G1.ThirdWide

lemma binomDelta_antitone {k a b : ℕ} (hk : 1 ≤ k) (hb : b ≤ 2*k) (hab : a ≤ b) :
    (b.choose (k+1) : ℤ) - b.choose k ≤
      (a.choose (k+1) : ℤ) - a.choose k := by
  induction b, hab using Nat.le_induction with
  | base => exact le_rfl
  | succ b hab ih =>
    exact (binomDelta_step_down b k hk (by omega)).trans (ih (by omega))

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 141 END

-- VERITYOS ENTRY 142 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_central 74de08f467cafa3ed9d638d43136a91ed8037c2d4513adf43615166cea3ad6a6
namespace Erdos993G1.ThirdWide

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

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 142 END

-- VERITYOS ENTRY 143 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_floor ee78710b4c5656a1f4366d96a3445e8f53611ca4e5b3c34f3d77600045f8757e
namespace Erdos993G1.ThirdWide

lemma binomDelta_floor (m j : ℕ) :
    -(catalan j : ℤ) ≤ (m.choose (j+1) : ℤ) - m.choose j := by
  by_cases hj : j=0
  · subst j; simp; omega
  rw [← binomDelta_central j]
  rcases le_total m (2*j) with hm | hm
  · exact binomDelta_antitone (by omega) le_rfl hm
  · exact binomDelta_mono_center le_rfl hm

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 143 END

-- VERITYOS ENTRY 144 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_lower_central 9f37cca56bb32544dedb09cae9c83d92eaed2c3031b04c8f21deea5ecd016905
namespace Erdos993G1.ThirdWide

lemma binomDelta_lower_central (k : ℕ) :
    ((2*k+2).choose (k+1) : ℤ) - (2*k+2).choose k = catalan (k+1) := by
  have h := binomDelta_central (k+1)
  have hs : (2*(k+1)).choose (k+1+1) = (2*(k+1)).choose k :=
    Nat.choose_symm_of_eq_add (by omega)
  rw [hs] at h
  have ht : 2*(k+1)=2*k+2 := by omega
  rw [ht] at h
  linarith

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 144 END

-- VERITYOS ENTRY 145 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_lower 9fc2229e0008914088575cf460e0200016b995432b8515b6fdc49f482cb80634
namespace Erdos993G1.ThirdWide

lemma binomDelta_lower (m k : ℕ) (h : 2*k+2 ≤ m) :
    (catalan (k+1) : ℤ) ≤ (m.choose (k+1) : ℤ) - m.choose k := by
  rw [← binomDelta_lower_central k]
  exact binomDelta_mono_center (by omega) h

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 145 END

-- VERITYOS ENTRY 146 BEGIN lemma Erdos993G1.ThirdWide.catalan_pos_int 6daec2923384e73fdac57762d37e7e60f4af9f6db10ac7ba4c1fc73d7d0ce92e
namespace Erdos993G1.ThirdWide

lemma catalan_pos_int (n : ℕ) : (0 : ℤ) < catalan n := by
  have hc : (0:ℕ) < (2*n).choose n := Nat.choose_pos (by omega)
  have he := succ_mul_catalan_eq_centralBinom n
  change (n+1)*catalan n=(2*n).choose n at he
  have : 0<catalan n := by nlinarith
  exact_mod_cast this

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 146 END

-- VERITYOS ENTRY 147 BEGIN lemma Erdos993G1.ThirdWide.catalan_recurrence_int 781e38a130fc5a4c11297a11a33f51fc8c7a5714cd1bfc99dbe2ca0cae3ea852
namespace Erdos993G1.ThirdWide

lemma catalan_recurrence_int (n : ℕ) :
    ((n:ℤ)+2) * catalan (n+1) = (4*n+2) * catalan n := by
  have hc := Nat.succ_mul_centralBinom_succ n
  rw [← succ_mul_catalan_eq_centralBinom (n+1), ← succ_mul_catalan_eq_centralBinom n] at hc
  have he : ((n:ℤ)+1) * (((n:ℤ)+2) * catalan (n+1)) =
      2*(2*n+1)*(((n:ℤ)+1)*catalan n) := by exact_mod_cast hc
  apply (mul_left_cancel₀ (show (n:ℤ)+1 ≠ 0 by omega))
  nlinarith [he]

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 147 END

-- VERITYOS ENTRY 148 BEGIN lemma Erdos993G1.ThirdWide.catalan_gap_identity 1ee4cb872cab161bae8ebcd306fdfd24240cae92f7b90a778f769428b5556ff3
namespace Erdos993G1.ThirdWide

lemma catalan_gap_identity (t : ℕ) :
    (((t:ℤ)+2)*((t:ℤ)+3)*((t:ℤ)+4)*((t:ℤ)+5)*((t:ℤ)+6)) *
      ((catalan (t+5):ℤ) - 4*catalan (t+3) - 6*catalan (t+2) -
        4*catalan (t+1) - catalan t) =
      (3600+20748*(t:ℤ)+36556*(t:ℤ)^2+24797*(t:ℤ)^3+
        6884*(t:ℤ)^4+655*(t:ℤ)^5)*catalan t := by
  have e0 := catalan_recurrence_int t
  have e1 := catalan_recurrence_int (t+1)
  have e2 := catalan_recurrence_int (t+2)
  have e3 := catalan_recurrence_int (t+3)
  have e4 := catalan_recurrence_int (t+4)
  norm_num only [Nat.cast_add, Nat.cast_ofNat, show t+1+1=t+2 by omega,
    show t+2+1=t+3 by omega, show t+3+1=t+4 by omega, show t+4+1=t+5 by omega] at e1 e2 e3 e4
  linear_combination
    (2160+6576*(t:ℤ)+5416*(t:ℤ)^2+1644*(t:ℤ)^3+164*(t:ℤ)^4)*e0 +
    (1200+2448*(t:ℤ)+1656*(t:ℤ)^2+450*(t:ℤ)^3+42*(t:ℤ)^4)*e1 +
    (792+1164*(t:ℤ)+624*(t:ℤ)^2+144*(t:ℤ)^3+12*(t:ℤ)^4)*e2 +
    (432+564*(t:ℤ)+266*(t:ℤ)^2+54*(t:ℤ)^3+4*(t:ℤ)^4)*e3 +
    (120+154*(t:ℤ)+71*(t:ℤ)^2+14*(t:ℤ)^3+(t:ℤ)^4)*e4

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 148 END

-- VERITYOS ENTRY 149 BEGIN lemma Erdos993G1.ThirdWide.catalan_gap_pos 8e27823a598cfcc4a6ae17132e70dd86de38212d26cfa661094cd2885f0450a7
namespace Erdos993G1.ThirdWide

lemma catalan_gap_pos (k : ℕ) (h : 4 ≤ k) :
    0 < (catalan (k+1):ℤ) - 4*catalan (k-1) - 6*catalan (k-2) -
      4*catalan (k-3) - catalan (k-4) := by
  obtain ⟨t, rfl⟩ := Nat.exists_eq_add_of_le' h
  have he := catalan_gap_identity t
  have hc := catalan_pos_int t
  have hp : (0:ℤ) < 3600+20748*(t:ℤ)+36556*(t:ℤ)^2+24797*(t:ℤ)^3+
      6884*(t:ℤ)^4+655*(t:ℤ)^5 := by positivity
  have hd : (0:ℤ) < ((t:ℤ)+2)*((t:ℤ)+3)*((t:ℤ)+4)*((t:ℤ)+5)*((t:ℤ)+6) := by positivity
  have hg : (0:ℤ) < (catalan (t+5):ℤ) - 4*catalan (t+3) - 6*catalan (t+2) -
      4*catalan (t+1) - catalan t := by
    have hm := mul_pos hp hc
    rw [← he] at hm
    exact (mul_pos_iff_of_pos_left hd).mp hm
  simpa only [show t+4+1=t+5 by omega, show t+4-1=t+3 by omega,
    show t+4-2=t+2 by omega, show t+4-3=t+1 by omega, Nat.add_sub_cancel] using hg

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 149 END

-- VERITYOS ENTRY 150 BEGIN lemma Erdos993G1.ThirdWide.forest_leaf_of_edge a5b1f215a01b6301161483c73c89cf84f72023d318a6a4fb1e85846d68f611c0
namespace Erdos993G1.ThirdWide

lemma forest_leaf_of_edge {X : Type u} [Finite X]
    (F : SimpleGraph X) (hF : F.IsAcyclic) (he : ∃ a b, F.Adj a b) :
    ∃ l u, F.Adj l u ∧ ∀ v, F.Adj l v → v = u := by
  classical
  letI : Fintype X := Fintype.ofFinite X
  obtain ⟨a, b, hab⟩ := he
  let c := F.connectedComponentMk a
  have ha : a ∈ c.supp := SimpleGraph.ConnectedComponent.connectedComponentMk_mem
  have hb : b ∈ c.supp := c.mem_supp_of_adj_mem_supp ha hab
  let a' : c := ⟨a, ha⟩
  let b' : c := ⟨b, hb⟩
  have hab' : c.toSimpleGraph.Adj a' b' := hab
  letI : Nontrivial c := c.toSimpleGraph.nontrivial_of_not_isIsolated
    hab'.not_isIsolated_left
  letI : Fintype c := Fintype.ofFinite c
  obtain ⟨l, hl⟩ := (hF.isTree_connectedComponent c).exists_vert_degree_one_of_nontrivial
  obtain ⟨u, hlu, hu⟩ := SimpleGraph.degree_eq_one_iff_existsUnique_adj.mp hl
  refine ⟨l.val, u.val, hlu, ?_⟩
  intro v hlv
  have hv : v ∈ c.supp := c.mem_supp_of_adj_mem_supp l.property hlv
  exact congrArg Subtype.val (hu ⟨v, hv⟩ hlv)

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 150 END

-- VERITYOS ENTRY 151 BEGIN lemma Erdos993G1.ThirdWide.forest_certificate_extend 01723246be81462b47382bbee8486b14a67dabd926ca92efef0b2067b6f2a486
namespace Erdos993G1.ThirdWide

lemma forest_certificate_extend {X : Type u} (F : SimpleGraph X) {l u : X}
    (hlu : F.Adj l u) (hl : ∀ v, F.Adj l v → v = u)
    (m : ℕ) (C : Finset {v : X // v ≠ l ∧ v ≠ u})
    (f : Fin m × Bool → {v : X // v ≠ l ∧ v ≠ u})
    (hcard : C.card = m) (hinj : Function.Injective f)
    (hedge : ∀ i, F.Adj (f (i, false)).val (f (i, true)).val)
    (hcover : ∀ x y : {v : X // v ≠ l ∧ v ≠ u},
      F.Adj x.val y.val → x ∈ C ∨ y ∈ C) :
    ∃ (D : Finset X) (g : Fin (m + 1) × Bool → X), D.card = m + 1 ∧
      Function.Injective g ∧ (∀ i, F.Adj (g (i, false)) (g (i, true))) ∧
      ∀ x y, F.Adj x y → x ∈ D ∨ y ∈ D := by
  classical
  let D := insert u (C.image Subtype.val)
  let g : Fin (m + 1) × Bool → X := fun p =>
    Fin.cases (if p.2 then u else l) (fun i => (f (i, p.2)).val) p.1
  have hg0 (b : Bool) : g (0, b) = if b then u else l := rfl
  have hgs (i : Fin m) (b : Bool) : g (i.succ, b) = (f (i, b)).val := rfl
  have hne : l ≠ u := hlu.ne
  have huC : u ∉ C.image Subtype.val := by
    rintro h
    obtain ⟨v, hv, hvu⟩ := Finset.mem_image.mp h
    exact v.property.2 hvu
  have hg : Function.Injective g := by
    rintro ⟨i, b⟩ ⟨j, c⟩ heq
    induction i using Fin.cases with
    | zero =>
      induction j using Fin.cases with
      | zero =>
        rw [hg0, hg0] at heq
        cases b <;> cases c <;> simp_all
      | succ j =>
        rw [hg0, hgs] at heq
        cases b
        · exact False.elim ((f (j, c)).property.1 heq.symm)
        · exact False.elim ((f (j, c)).property.2 heq.symm)
    | succ i =>
      induction j using Fin.cases with
      | zero =>
        rw [hgs, hg0] at heq
        cases c
        · exact False.elim ((f (i, b)).property.1 heq)
        · exact False.elim ((f (i, b)).property.2 heq)
      | succ j =>
        rw [hgs, hgs] at heq
        have hp := hinj (Subtype.ext heq)
        have hi : i = j := congrArg Prod.fst hp
        have hb : b = c := congrArg Prod.snd hp
        cases hi
        cases hb
        rfl
  refine ⟨D, g, ?_, hg, ?_, ?_⟩
  · simp only [D, Finset.card_insert_of_notMem huC,
      Finset.card_image_of_injective _ Subtype.val_injective, hcard]
  · intro i
    induction i using Fin.cases with
    | zero => simpa only [hg0, Bool.false_eq_true, if_false, if_true] using hlu
    | succ i => simpa only [hgs] using hedge i
  · intro x y hxy
    by_cases hxu : x = u
    · left
      simp [D, hxu]
    by_cases hyu : y = u
    · right
      simp [D, hyu]
    have hxl : x ≠ l := by
      intro hxl
      subst x
      exact hyu (hl y hxy)
    have hyl : y ≠ l := by
      intro hyl
      subst y
      exact hxu (hl x hxy.symm)
    obtain hx | hy := hcover ⟨x, hxl, hxu⟩ ⟨y, hyl, hyu⟩ hxy
    · left
      exact Finset.mem_insert_of_mem (Finset.mem_image.mpr ⟨⟨x, hxl, hxu⟩, hx, rfl⟩)
    · right
      exact Finset.mem_insert_of_mem (Finset.mem_image.mpr ⟨⟨y, hyl, hyu⟩, hy, rfl⟩)

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 151 END

-- VERITYOS ENTRY 152 BEGIN lemma Erdos993G1.ThirdWide.forest_matching_cover_certificate 3690a1a1461e8978c2d2afaf1b3b8b6aa717e456a383f45e6a29232b8b64cf18
namespace Erdos993G1.ThirdWide

lemma forest_matching_cover_certificate {X : Type u} [Finite X]
    (F : SimpleGraph X) (hF : F.IsAcyclic) :
    ∃ (m : ℕ) (C : Finset X) (f : Fin m × Bool → X), C.card = m ∧
      Function.Injective f ∧ (∀ i, F.Adj (f (i, false)) (f (i, true))) ∧
      ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C := by
  classical
  have aux : ∀ n : ℕ, ∀ (Y : Type u) [Finite Y] (G : SimpleGraph Y),
      Nat.card Y = n → G.IsAcyclic →
      ∃ (m : ℕ) (C : Finset Y) (f : Fin m × Bool → Y), C.card = m ∧
        Function.Injective f ∧ (∀ i, G.Adj (f (i, false)) (f (i, true))) ∧
        ∀ x y, G.Adj x y → x ∈ C ∨ y ∈ C := by
    intro n
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro Y _ G hn hG
      letI : Fintype Y := Fintype.ofFinite Y
      by_cases he : ∃ a b, G.Adj a b
      · obtain ⟨l, u, hlu, hl⟩ := forest_leaf_of_edge G hG he
        let S : Set Y := {v | v ≠ l ∧ v ≠ u}
        have hlt : Nat.card S < n := by
          rw [← hn, Nat.card_eq_fintype_card, Nat.card_eq_fintype_card]
          exact Fintype.card_subtype_lt (x := l) (by simp [S])
        obtain ⟨m, C, f, hcard, hinj, hedge, hcover⟩ :=
          ih (Nat.card S) hlt S (G.induce S) rfl (hG.induce S)
        obtain ⟨D, g, hD, hg, hgedge, hgcover⟩ :=
          forest_certificate_extend G hlu hl m C f hcard hinj hedge hcover
        exact ⟨m + 1, D, g, hD, hg, hgedge, hgcover⟩
      · refine ⟨0, ∅, (fun p => Fin.elim0 p.1), rfl, ?_, ?_, ?_⟩
        · intro p
          exact Fin.elim0 p.1
        · intro i
          exact Fin.elim0 i
        · intro x y hxy
          exact False.elim (he ⟨x, y, hxy⟩)
  exact aux (Nat.card X) X F rfl hF

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 152 END

-- VERITYOS ENTRY 153 BEGIN lemma Erdos993G1.ThirdWide.forest_matching_or_cover 1c8a4a8808e4c16971e8bf13d505de2de8fb535c675897f7ad52247c8cdafa2a
namespace Erdos993G1.ThirdWide

lemma forest_matching_or_cover {X : Type u} [Finite X]
    (F : SimpleGraph X) (hF : F.IsAcyclic) :
    (∃ f : Fin 5 × Bool → X, Function.Injective f ∧
      ∀ i : Fin 5, F.Adj (f (i, false)) (f (i, true))) ∨
    (∃ C : Finset X, C.card ≤ 4 ∧ ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) := by
  obtain ⟨m, C, f, hcard, hinj, hedge, hcover⟩ := forest_matching_cover_certificate F hF
  by_cases hm : m ≤ 4
  · exact Or.inr ⟨C, hcard ▸ hm, hcover⟩
  · have hm5 : 5 ≤ m := by omega
    let e : Fin 5 × Bool → Fin m × Bool := fun p => (Fin.castLE hm5 p.1, p.2)
    have he : Function.Injective e := by
      rintro ⟨i, b⟩ ⟨j, c⟩ heq
      have hi : i = j := Fin.ext (congrArg (fun p : Fin m × Bool => p.1.val) heq)
      have hb : b = c := congrArg Prod.snd heq
      cases hi
      cases hb
      rfl
    exact Or.inl ⟨f ∘ e, hinj.comp he, fun i => hedge (Fin.castLE hm5 i)⟩

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 153 END

-- VERITYOS ENTRY 154 BEGIN lemma Erdos993G1.ThirdWide.fiveMatching_endpoints_card 64505949eba26fbee5f7dfc4773e05e3826e78aff20970b126252a1288d46266
namespace Erdos993G1.ThirdWide
open FirstWide

lemma fiveMatching_endpoints_card {X : Type u} [DecidableEq X]
    (f : Fin 5 × Bool → X) (hf : Function.Injective f) :
    (Finset.univ.image f).card = 10 := by
  rw [Finset.card_image_of_injective _ hf]
  simp

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 154 END

-- VERITYOS ENTRY 155 BEGIN lemma Erdos993G1.ThirdWide.fiveMatching_forbidden 705b531a72515b86c05189a6bf89bd234b572e893b4e0fafcbb06a07aeaf3987
namespace Erdos993G1.ThirdWide
open FirstWide

lemma fiveMatching_forbidden {X : Type u} [DecidableEq X]
    (G : SimpleGraph X) (f : Fin 5 × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin 5, G.Adj (f (i, false)) (f (i, true)))
    (S : Finset X) (hS : G.IsIndepSet S) :
    ∃ Q : Finset X, Q ⊆ Finset.univ.image f ∧
      Q.card = 2 * (S ∩ Finset.univ.image f).card ∧
      ∀ x ∈ Q, x ∈ S ∨ ∃ y ∈ S, G.Adj y x := by
  classical
  let C : Finset (Fin 5 × Bool) := Finset.univ.filter (fun p => f p ∈ S)
  let flip : Fin 5 × Bool → Fin 5 × Bool := fun p => (p.1, !p.2)
  have hflip (p : Fin 5 × Bool) : flip (flip p) = p := by
    rcases p with ⟨i, b⟩
    cases b <;> rfl
  have hflipinj : Function.Injective flip := Function.LeftInverse.injective hflip
  have hadj (p : Fin 5 × Bool) : G.Adj (f p) (f (flip p)) := by
    rcases p with ⟨i, b⟩
    cases b
    · exact he i
    · exact (he i).symm
  have himage : C.image f = S ∩ Finset.univ.image f := by
    ext x
    simp only [C, Finset.mem_image, Finset.mem_filter, Finset.mem_univ,
      true_and, Finset.mem_inter]
    constructor
    · rintro ⟨p, hp, rfl⟩
      exact ⟨hp, p, rfl⟩
    · rintro ⟨hx, p, rfl⟩
      exact ⟨p, hx, rfl⟩
  have hCcard : C.card = (S ∩ Finset.univ.image f).card := by
    rw [← himage, Finset.card_image_of_injective _ hf]
  have hdis : Disjoint C (C.image flip) := by
    apply Finset.disjoint_left.mpr
    intro p hp hp'
    obtain ⟨q, hq, rfl⟩ := Finset.mem_image.mp hp'
    have hqS : f q ∈ S := (Finset.mem_filter.mp hq).2
    have hpS : f (flip q) ∈ S := (Finset.mem_filter.mp hp).2
    exact hS hqS hpS (hadj q).ne (hadj q)
  refine ⟨(C ∪ C.image flip).image f, ?_, ?_, ?_⟩
  · exact Finset.image_subset_image (Finset.subset_univ _)
  · rw [Finset.card_image_of_injective _ hf, Finset.card_union_of_disjoint hdis,
      Finset.card_image_of_injective _ hflipinj, hCcard]
    omega
  · intro x hx
    obtain ⟨p, hp, rfl⟩ := Finset.mem_image.mp hx
    rcases Finset.mem_union.mp hp with hp | hp
    · exact Or.inl (Finset.mem_filter.mp hp).2
    · obtain ⟨q, hq, rfl⟩ := Finset.mem_image.mp hp
      exact Or.inr ⟨f q, (Finset.mem_filter.mp hq).2, hadj q⟩

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 155 END

-- VERITYOS ENTRY 156 BEGIN lemma Erdos993G1.ThirdWide.fiveMatching_support 4c7552a1bf333cca48476c08da36bc499f4c438a4835990b690f5b88b50035cf
namespace Erdos993G1.ThirdWide
open FirstWide

lemma fiveMatching_support {X : Type u} [DecidableEq X]
    (G : SimpleGraph X) (f : Fin 5 × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin 5, G.Adj (f (i, false)) (f (i, true)))
    (S : Finset X) (hS : G.IsIndepSet S) :
    (S ∩ Finset.univ.image f).card ≤ 5 := by
  obtain ⟨Q, hQ, hc, _⟩ := fiveMatching_forbidden G f hf he S hS
  have hle := Finset.card_le_card hQ
  rw [hc, fiveMatching_endpoints_card f hf] at hle
  omega

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 156 END

-- VERITYOS ENTRY 157 BEGIN lemma Erdos993G1.ThirdWide.fiveMatching_stratum_partition 0310bf719707849254dfb032855611b9b743fc5da0cb3f6a7fc6f46c301f3377
namespace Erdos993G1.ThirdWide
open FirstWide

lemma fiveMatching_stratum_partition {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X)
    (hM : ∀ S : Finset X, G.IsIndepSet S → (S ∩ M).card ≤ 5) (k : ℕ) :
    indepCount G k = ((stratum G M k 0).card : ℤ) +
      ((stratum G M k 1).card : ℤ) + ((stratum G M k 2).card : ℤ) +
      ((stratum G M k 3).card : ℤ) + ((stratum G M k 4).card : ℤ) +
      ((stratum G M k 5).card : ℤ) := by
  classical
  have hp := Finset.card_eq_sum_card_fiberwise
    (s := G.indepSetFinset k) (t := ({0,1,2,3,4,5} : Finset ℕ))
    (f := fun S : Finset X => (S ∩ M).card) (by
      intro S hS
      have hle := hM S (SimpleGraph.mem_indepSetFinset_iff.mp hS).isIndepSet
      simp only [Finset.mem_coe, Finset.mem_insert, Finset.mem_singleton]
      omega)
  have hfiber (j : ℕ) : (G.indepSetFinset k).filter (fun S => (S ∩ M).card = j) =
      stratum G M k j := by
    ext S
    simp only [Finset.mem_filter, SimpleGraph.mem_indepSetFinset_iff, stratum_mem]
  simp only [hfiber] at hp
  rw [indepCount_eq_card_indepSetFinset]
  have hp' : (G.indepSetFinset k).card = (stratum G M k 0).card +
      (stratum G M k 1).card + (stratum G M k 2).card +
      (stratum G M k 3).card + (stratum G M k 4).card +
      (stratum G M k 5).card := by
    simpa [add_assoc] using hp
  exact_mod_cast hp'

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 157 END

-- VERITYOS ENTRY 158 BEGIN lemma Erdos993G1.ThirdWide.fiveMatching_stratum_empty 0b41178762ebb2c0656e31dbf83772fd879481d8bfd6166c54847856e878d6cb
namespace Erdos993G1.ThirdWide
open FirstWide

lemma fiveMatching_stratum_empty {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X) (k j : ℕ)
    (h : Nat.card X + j < M.card + k) : stratum G M k j = ∅ := by
  classical
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro S hS
  have hs := (stratum_mem G M S k j).mp hS
  have hc := Finset.card_union_add_card_inter S M
  have hle := Finset.card_le_card (Finset.subset_univ (S ∪ M))
  rw [hs.1.card_eq, hs.2] at hc
  simp only [Finset.card_univ, ← Nat.card_eq_fintype_card] at hle
  omega

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 158 END

-- VERITYOS ENTRY 159 BEGIN lemma Erdos993G1.ThirdWide.fiveMatching_outside_incidence f5f87a0eb750682644ec1455121c8c17fd1109f8b1adf718405e7c81cc7bbad2
namespace Erdos993G1.ThirdWide
open FirstWide

lemma fiveMatching_outside_incidence {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X) (hM : M.card = 10)
    (r : ℕ) (hn : Nat.card X = 2*r+4) (j : ℕ) :
    (r+1-j) * (stratum G M (r+1) j).card ≤
      (r+j-6) * (stratum G M r j).card := by
  classical
  have hcount := Finset.card_mul_le_card_mul (fun S B : Finset X => B ⊆ S)
    (s := stratum G M (r+1) j) (t := stratum G M r j)
    (m := r+1-j) (n := r+j-6) ?_ ?_
  · simpa only [Nat.mul_comm] using hcount
  · intro S hS
    change r+1-j ≤ ((stratum G M r j).filter (fun B => B ⊆ S)).card
    have hs := (stratum_mem G M S (r+1) j).mp hS
    rw [subset_fiber_eq_image _ S r
      (fun B hB => ((stratum_mem G M B r j).mp hB).1.card_eq) hs.1.card_eq]
    have hfilter : S.filter (fun a => S.erase a ∈ stratum G M r j) = S \ M := by
      ext a
      simp only [Finset.mem_filter, Finset.mem_sdiff]
      exact and_congr_right (fun ha => stratum_erase_outside_iff G M S r j hS a ha)
    rw [hfilter, erase_image_card S (S \ M) Finset.sdiff_subset]
    have hc := Finset.card_sdiff_add_card_inter S M
    rw [hs.2, hs.1.card_eq] at hc
    omega
  · intro B hB
    change ((stratum G M (r+1) j).filter (fun S => B ⊆ S)).card ≤ r+j-6
    have hb := (stratum_mem G M B r j).mp hB
    have hbound := extension_fiber_bound (stratum G M (r+1) j) B
      (Finset.univ \ (M ∪ B)) r
      (fun S hS => ((stratum_mem G M S (r+1) j).mp hS).1.card_eq) hb.1.card_eq
      (fun a ha hS => by
        have haM := stratum_insert_same_outside G M B r j hB a ha hS
        simp [ha, haM])
    have hc := Finset.card_union_add_card_inter M B
    have hi : (M ∩ B).card = j := by rw [Finset.inter_comm, hb.2]
    rw [hM, hb.1.card_eq, hi] at hc
    have hn' : (Finset.univ : Finset X).card = 2*r+4 := by
      simpa [Nat.card_eq_fintype_card] using hn
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ _), hn'] at hbound
    have hsame : 2*r+4 - (M ∪ B).card = r+j-6 := by omega
    simpa only [hsame] using hbound

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 159 END

-- VERITYOS ENTRY 160 BEGIN lemma Erdos993G1.ThirdWide.fiveMatching_inside_incidence a966cc2e311a40ad5c3b1f74e78ccea82dfa093f7d3e184115c10a64f705a12b
namespace Erdos993G1.ThirdWide
open FirstWide

lemma fiveMatching_inside_incidence {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (f : Fin 5 × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin 5, G.Adj (f (i, false)) (f (i, true)))
    (r j : ℕ) (hj : j ≤ 4) :
    (j+1) * (stratum G (Finset.univ.image f) (r+1) (j+1)).card ≤
      (2*(5-j)) * (stratum G (Finset.univ.image f) r j).card := by
  classical
  let M : Finset X := Finset.univ.image f
  have hM : M.card = 10 := fiveMatching_endpoints_card f hf
  have hcount := Finset.card_mul_le_card_mul (fun S B : Finset X => B ⊆ S)
    (s := stratum G M (r+1) (j+1)) (t := stratum G M r j)
    (m := j+1) (n := 2*(5-j)) ?_ ?_
  · simpa only [Nat.mul_comm] using hcount
  · intro S hS
    change j+1 ≤ ((stratum G M r j).filter (fun B => B ⊆ S)).card
    have hs := (stratum_mem G M S (r+1) (j+1)).mp hS
    calc
      j+1 = (S ∩ M).card := hs.2.symm
      _ = ((S ∩ M).image S.erase).card :=
        (erase_image_card S (S ∩ M) Finset.inter_subset_left).symm
      _ ≤ _ := Finset.card_le_card (by
        intro B hB
        obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp hB
        exact Finset.mem_filter.mpr ⟨stratum_erase_inside G M S r j hS x hx,
          Finset.erase_subset x S⟩)
  · intro B hB
    change ((stratum G M (r+1) (j+1)).filter (fun S => B ⊆ S)).card ≤ 2*(5-j)
    have hb := (stratum_mem G M B r j).mp hB
    obtain ⟨Q, hQM, hQc, hQforbid⟩ := fiveMatching_forbidden G f hf he B hb.1.isIndepSet
    change Q ⊆ M at hQM
    change Q.card = 2 * (B ∩ M).card at hQc
    rw [hb.2] at hQc
    have hQsize : (M \ Q).card = 2*(5-j) := by
      rw [Finset.card_sdiff_of_subset hQM, hM, hQc]
      omega
    apply le_trans (b := (M \ Q).card) ?_ hQsize.le
    apply extension_fiber_bound (stratum G M (r+1) (j+1)) B (M \ Q) r
      (fun S hS => ((stratum_mem G M S (r+1) (j+1)).mp hS).1.card_eq) hb.1.card_eq
    intro z hz hS
    have hzM := stratum_insert_cross_inside G M B r j hB z hS
    have hzQ : z ∉ Q := by
      intro hzQ
      rcases hQforbid z hzQ with hzB | ⟨y, hy, hyz⟩
      · exact hz hzB
      · have hs := ((stratum_mem G M (insert z B) (r+1) (j+1)).mp hS).1.isIndepSet
        exact hs (by simp [hy]) (by simp) hyz.ne hyz
    exact Finset.mem_sdiff.mpr ⟨hzM, hzQ⟩

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 160 END

-- VERITYOS ENTRY 161 BEGIN lemma Erdos993G1.ThirdWide.fiveMatching_inside_incidence_int 24876e4ab8fa0f5e2b52a79734d17c421ecd5fece02a424fd18fe2f182d90a8a
namespace Erdos993G1.ThirdWide
open FirstWide

lemma fiveMatching_inside_incidence_int {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (f : Fin 5 × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin 5, G.Adj (f (i, false)) (f (i, true)))
    (r j : ℕ) (hj : j ≤ 4) :
    ((j+1 : ℕ) : ℤ) * ((stratum G (Finset.univ.image f) (r+1) (j+1)).card : ℤ) ≤
      ((2*(5-j) : ℕ) : ℤ) * ((stratum G (Finset.univ.image f) r j).card : ℤ) := by
  exact_mod_cast fiveMatching_inside_incidence G f hf he r j hj

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 161 END

-- VERITYOS ENTRY 162 BEGIN lemma Erdos993G1.ThirdWide.fiveMatching_outside_incidence_large_int 4c6736778488f5ce65d1b9bb58af60856a283637f5f9fff8717c63e05b951a04
namespace Erdos993G1.ThirdWide
open FirstWide

lemma fiveMatching_outside_incidence_large_int {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X) (hM : M.card = 10)
    (t : ℕ) (hn : Nat.card X = 2*(t+6)+4) (j : ℕ) (hj : j ≤ 5) :
    ((t : ℤ) + ((7-j : ℕ) : ℤ)) * ((stratum G M (t+6+1) j).card : ℤ) ≤
      ((t : ℤ) + (j : ℤ)) * ((stratum G M (t+6) j).card : ℤ) := by
  have h := fiveMatching_outside_incidence G M hM (t+6) hn j
  have hl : t+6+1-j = t+(7-j) := by omega
  have hr : t+6+j-6 = t+j := by omega
  rw [hl, hr] at h
  exact_mod_cast h

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 162 END

-- VERITYOS ENTRY 163 BEGIN lemma Erdos993G1.ThirdWide.fiveMatching_integer_certificate 55aca15dfea03ef7f9db66dff7f04afcec53a7c4aa244ed512eed8553dc5a967
namespace Erdos993G1.ThirdWide
open FirstWide

lemma fiveMatching_integer_certificate
    (t a0 a1 a2 a3 a4 a5 b0 b1 b2 b3 b4 b5 : ℤ)
    (ht : 0 ≤ t) (ha5 : 0 ≤ a5)
    (O0 : (t+7)*b0 ≤ (t)*a0)
    (O1 : (t+6)*b1 ≤ (t+1)*a1)
    (O2 : (t+5)*b2 ≤ (t+2)*a2)
    (O3 : (t+4)*b3 ≤ (t+3)*a3)
    (O4 : (t+3)*b4 ≤ (t+4)*a4)
    (O5 : (t+2)*b5 ≤ (t+5)*a5)
    (I1 : 1*b1 ≤ 10*a0)
    (I2 : 2*b2 ≤ 8*a1)
    (I3 : 3*b3 ≤ 6*a2)
    (I4 : 4*b4 ≤ 4*a3)
    (I5 : 5*b5 ≤ 2*a4)
    : b0+b1+b2+b3+b4+b5 ≤ a0+a1+a2+a3+a4+a5 := by
  let L : ℤ := 1612800 + 2568960*t + 1633280*t^2 + 532800*t^3 + 94400*t^4 + 8640*t^5 + 320*t^6
  let A0 : ℤ := 230400 + 334080*t + 185600*t^2 + 49600*t^3 + 6400*t^4 + 320*t^5
  let A1 : ℤ := 241920 + 348864*t + 192416*t^2 + 50944*t^3 + 6496*t^4 + 320*t^5
  let A2 : ℤ := 254016 + 364080*t + 199240*t^2 + 52240*t^3 + 6584*t^4 + 320*t^5
  let A3 : ℤ := 265104 + 377616*t + 205076*t^2 + 53296*t^3 + 6652*t^4 + 320*t^5
  let A4 : ℤ := 265104 + 377616*t + 205076*t^2 + 53296*t^3 + 6652*t^4 + 320*t^5
  let A5 : ℤ := 115920 + 234780*t + 155050*t^2 + 45700*t^3 + 6230*t^4 + 320*t^5
  let B1 : ℤ := 161280 + 233856*t + 129920*t^2 + 34720*t^3 + 4480*t^4 + 224*t^5
  let B2 : ℤ := 171360 + 247272*t + 136500*t^2 + 36180*t^3 + 4620*t^4 + 228*t^5
  let B3 : ℤ := 184128 + 264464*t + 145120*t^2 + 38180*t^3 + 4832*t^4 + 236*t^5
  let B4 : ℤ := 204372 + 292752*t + 160109*t^2 + 41959*t^3 + 5287*t^4 + 257*t^5
  let B5 : ℤ := 276192 + 396696*t + 217680*t^2 + 57270*t^3 + 7248*t^4 + 354*t^5
  let E : ℤ := 1033200 + 1279140*t + 623250*t^2 + 149250*t^3 + 17550*t^4 + 810*t^5
  have hL : 0 < L := by dsimp [L]; positivity
  have hE : 0 ≤ E*a5 := mul_nonneg (by dsimp [E]; positivity) ha5
  have hO0 := mul_le_mul_of_nonneg_left O0 (show 0 ≤ A0 by dsimp [A0]; positivity)
  have hO1 := mul_le_mul_of_nonneg_left O1 (show 0 ≤ A1 by dsimp [A1]; positivity)
  have hO2 := mul_le_mul_of_nonneg_left O2 (show 0 ≤ A2 by dsimp [A2]; positivity)
  have hO3 := mul_le_mul_of_nonneg_left O3 (show 0 ≤ A3 by dsimp [A3]; positivity)
  have hO4 := mul_le_mul_of_nonneg_left O4 (show 0 ≤ A4 by dsimp [A4]; positivity)
  have hO5 := mul_le_mul_of_nonneg_left O5 (show 0 ≤ A5 by dsimp [A5]; positivity)
  have hI1 := mul_le_mul_of_nonneg_left I1 (show 0 ≤ B1 by dsimp [B1]; positivity)
  have hI2 := mul_le_mul_of_nonneg_left I2 (show 0 ≤ B2 by dsimp [B2]; positivity)
  have hI3 := mul_le_mul_of_nonneg_left I3 (show 0 ≤ B3 by dsimp [B3]; positivity)
  have hI4 := mul_le_mul_of_nonneg_left I4 (show 0 ≤ B4 by dsimp [B4]; positivity)
  have hI5 := mul_le_mul_of_nonneg_left I5 (show 0 ≤ B5 by dsimp [B5]; positivity)
  have H := (add_le_add (add_le_add (add_le_add (add_le_add (add_le_add (add_le_add (add_le_add (add_le_add (add_le_add (add_le_add hO0 hO1) hO2) hO3) hO4) hO5) hI1) hI2) hI3) hI4) hI5)
  have Hsum : L*(b0+b1+b2+b3+b4+b5)+E*a5 ≤ L*(a0+a1+a2+a3+a4+a5) := by
    calc
      _ = A0*((t+7)*b0) + A1*((t+6)*b1) + A2*((t+5)*b2) + A3*((t+4)*b3) + A4*((t+3)*b4) + A5*((t+2)*b5) + B1*(1*b1) + B2*(2*b2) + B3*(3*b3) + B4*(4*b4) + B5*(5*b5) + E*a5 := by
        dsimp [L, E, A0, A1, A2, A3, A4, A5, B1, B2, B3, B4, B5]
        ring
      _ ≤ A0*((t+0)*a0) + A1*((t+1)*a1) + A2*((t+2)*a2) + A3*((t+3)*a3) + A4*((t+4)*a4) + A5*((t+5)*a5) + B1*(10*a0) + B2*(8*a1) + B3*(6*a2) + B4*(4*a3) + B5*(2*a4) + E*a5 := by
        simpa only [add_zero] using add_le_add H (le_refl (E*a5))
      _ = _ := by
        dsimp [L, E, A0, A1, A2, A3, A4, A5, B1, B2, B3, B4, B5]
        ring
  have Hfinal : L*(b0+b1+b2+b3+b4+b5) ≤ L*(a0+a1+a2+a3+a4+a5) := by
    linarith only [Hsum, hE]
  exact (mul_le_mul_iff_right₀ hL).mp Hfinal

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 163 END

-- VERITYOS ENTRY 164 BEGIN lemma Erdos993G1.ThirdWide.fiveMatching_delta_nonpos 6419ef96b926ea9d1ffab5f179fdc10fa4fa1305f56de49503055d82f1dada4d
namespace Erdos993G1.ThirdWide
open FirstWide

set_option maxHeartbeats 1600000 in
lemma fiveMatching_delta_nonpos {X : Type u} [Finite X]
    (G : SimpleGraph X) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card X = 2*r+4)
    (f : Fin 5 × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin 5, G.Adj (f (i, false)) (f (i, true))) :
    delta G (r : ℤ) ≤ 0 := by
  classical
  letI := Fintype.ofFinite X
  let M : Finset X := Finset.univ.image f
  have hM : M.card = 10 := fiveMatching_endpoints_card f hf
  have hMle := Finset.card_le_card (Finset.subset_univ M)
  have hn' : (Finset.univ : Finset X).card = 2*r+4 := by
    simpa [Nat.card_eq_fintype_card] using hn
  have hr3 : 3 ≤ r := by omega
  have hsupport : ∀ S : Finset X, G.IsIndepSet S → (S ∩ M).card ≤ 5 :=
    fun S hS => fiveMatching_support G f hf he S hS
  have hL := fiveMatching_stratum_partition G M hsupport r
  have hU := fiveMatching_stratum_partition G M hsupport (r+1)
  have i1 : (1:ℤ)*((stratum G M (r+1) 1).card : ℤ) ≤
      10*((stratum G M r 0).card : ℤ) := by
    exact fiveMatching_inside_incidence_int G f hf he r 0 (by omega)
  have i2 : (2:ℤ)*((stratum G M (r+1) 2).card : ℤ) ≤
      8*((stratum G M r 1).card : ℤ) := by
    exact fiveMatching_inside_incidence_int G f hf he r 1 (by omega)
  have i3 : (3:ℤ)*((stratum G M (r+1) 3).card : ℤ) ≤
      6*((stratum G M r 2).card : ℤ) := by
    exact fiveMatching_inside_incidence_int G f hf he r 2 (by omega)
  have i4 : (4:ℤ)*((stratum G M (r+1) 4).card : ℤ) ≤
      4*((stratum G M r 3).card : ℤ) := by
    exact fiveMatching_inside_incidence_int G f hf he r 3 (by omega)
  have i5 : (5:ℤ)*((stratum G M (r+1) 5).card : ℤ) ≤
      2*((stratum G M r 4).card : ℤ) := by
    exact fiveMatching_inside_incidence_int G f hf he r 4 (by omega)
  rw [delta_nat, hL, hU]
  by_cases hr6 : 6 ≤ r
  · obtain ⟨t, rfl⟩ : ∃ t : ℕ, r = t+6 := ⟨r-6, by omega⟩
    have o0 := fiveMatching_outside_incidence_large_int G M hM t hn 0 (by omega)
    have o1 := fiveMatching_outside_incidence_large_int G M hM t hn 1 (by omega)
    have o2 := fiveMatching_outside_incidence_large_int G M hM t hn 2 (by omega)
    have o3 := fiveMatching_outside_incidence_large_int G M hM t hn 3 (by omega)
    have o4 := fiveMatching_outside_incidence_large_int G M hM t hn 4 (by omega)
    have o5 := fiveMatching_outside_incidence_large_int G M hM t hn 5 (by omega)
    norm_num at o0 o1 o2 o3 o4 o5
    have hc := fiveMatching_integer_certificate
      (t:ℤ) ((stratum G M (t+6) 0).card : ℤ) ((stratum G M (t+6) 1).card : ℤ) ((stratum G M (t+6) 2).card : ℤ) ((stratum G M (t+6) 3).card : ℤ) ((stratum G M (t+6) 4).card : ℤ) ((stratum G M (t+6) 5).card : ℤ) ((stratum G M (t+6+1) 0).card : ℤ) ((stratum G M (t+6+1) 1).card : ℤ) ((stratum G M (t+6+1) 2).card : ℤ) ((stratum G M (t+6+1) 3).card : ℤ) ((stratum G M (t+6+1) 4).card : ℤ) ((stratum G M (t+6+1) 5).card : ℤ)
      (by positivity) (by positivity)
      o0 o1 o2 o3 o4 o5 i1 i2 i3 i4 i5
    exact sub_nonpos.mpr hc
  · have hcases : r = 3 ∨ r = 4 ∨ r = 5 := by omega
    rcases hcases with rfl | rfl | rfl
    · have hMu : M = Finset.univ :=
        Finset.eq_of_subset_of_card_le (Finset.subset_univ _) (by omega)
      have e30 := stratum_univ_empty G 3 0 (by omega)
      have e31 := stratum_univ_empty G 3 1 (by omega)
      have e32 := stratum_univ_empty G 3 2 (by omega)
      have e34 := stratum_univ_empty G 3 4 (by omega)
      have e35 := stratum_univ_empty G 3 5 (by omega)
      have e40 := stratum_univ_empty G 4 0 (by omega)
      have e41 := stratum_univ_empty G 4 1 (by omega)
      have e42 := stratum_univ_empty G 4 2 (by omega)
      have e43 := stratum_univ_empty G 4 3 (by omega)
      have e45 := stratum_univ_empty G 4 5 (by omega)
      rw [hMu] at i4 ⊢
      norm_num at i4
      norm_num only [e30, e31, e32, e34, e35, e40, e41, e42, e43, e45, Finset.card_empty, Nat.cast_zero, zero_add, add_zero] at ⊢
      omega
    · have o3 := fiveMatching_outside_incidence G M hM 4 hn 3
      have o4 := fiveMatching_outside_incidence G M hM 4 hn 4
      have e40 : stratum G M 4 0 = ∅ :=
        fiveMatching_stratum_empty G M 4 0 (by rw [hn, hM]; omega)
      have e41 : stratum G M 4 1 = ∅ :=
        fiveMatching_stratum_empty G M 4 1 (by rw [hn, hM]; omega)
      have e50 : stratum G M 5 0 = ∅ :=
        fiveMatching_stratum_empty G M 5 0 (by rw [hn, hM]; omega)
      have e51 : stratum G M 5 1 = ∅ :=
        fiveMatching_stratum_empty G M 5 1 (by rw [hn, hM]; omega)
      have e52 : stratum G M 5 2 = ∅ :=
        fiveMatching_stratum_empty G M 5 2 (by rw [hn, hM]; omega)
      norm_num only [e40, e41, e50, e51, e52, Finset.card_empty, Nat.cast_zero, zero_add, add_zero] at ⊢
      norm_num at o3 o4 i1 i2 i3 i4 i5
      omega
    · have o2 := fiveMatching_outside_incidence G M hM 5 hn 2
      have o3 := fiveMatching_outside_incidence G M hM 5 hn 3
      have o4 := fiveMatching_outside_incidence G M hM 5 hn 4
      have e50 : stratum G M 5 0 = ∅ :=
        fiveMatching_stratum_empty G M 5 0 (by rw [hn, hM]; omega)
      have e60 : stratum G M 6 0 = ∅ :=
        fiveMatching_stratum_empty G M 6 0 (by rw [hn, hM]; omega)
      norm_num only [e50, e60, Finset.card_empty, Nat.cast_zero, zero_add, add_zero] at i1 ⊢
      norm_num at o2 o3 o4 i1 i2 i3 i4 i5
      have hb1 : ((stratum G M 6 1).card : ℤ) = 0 := by simpa using i1
      omega

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 164 END

-- VERITYOS ENTRY 165 BEGIN lemma Erdos993G1.ThirdWide.cover_fiber_count 6307108c49fc64c9a0029a9d74c226018a516ebbcaaa7045e971bef3b0caf46e
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_fiber_count {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C S : Finset X)
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

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 165 END

-- VERITYOS ENTRY 166 BEGIN lemma Erdos993G1.ThirdWide.cover_indepCount_partition 9c0d62d2686b57a95bb19223e8dedcd0cd1e3918140e84f34ca38c6da685363a
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_indepCount_partition {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
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

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 166 END

-- VERITYOS ENTRY 167 BEGIN lemma Erdos993G1.ThirdWide.cover_delta_partition fa600fe0f83173c8c834c607ef8f5b97c7c61055370b1f9d7b7d282085b638c1
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_delta_partition {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
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

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 167 END

-- VERITYOS ENTRY 168 BEGIN lemma Erdos993G1.ThirdWide.cover_sum_bound eb0bad9f51f529b85c826eadc79952c681d7712777d855ef9d14a287c19dcb2c
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_sum_bound {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
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

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 168 END

-- VERITYOS ENTRY 169 BEGIN lemma Erdos993G1.ThirdWide.powerset_four_sum 14e1c216feebe1e659caee09b9ab098b716d3e6d3177bb2512e818da3d3f4f76
namespace Erdos993G1.ThirdWide

open Finset

lemma powerset_four_sum {X : Type u} [DecidableEq X] (C : Finset X)
    (hC : C.card = 4) (b : ℕ → ℤ) :
    ∑ S ∈ C.powerset, b S.card = b 0 + 4*b 1 + 6*b 2 + 4*b 3 + b 4 := by
  rw [sum_powerset]
  simp_rw [sum_powersetCard]
  rw [hC]
  norm_num [sum_range_succ, Nat.choose]

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 169 END

-- VERITYOS ENTRY 170 BEGIN lemma Erdos993G1.ThirdWide.cover_rank_bound f6e33a24c0a0008d0b5b99cac47374687f513979ed590ced93dee1459abd54c9
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_rank_bound {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hC : C.card = 4)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ)
    (b : ℕ → ℤ) (hb : ∀ t, 0 < t → b t ≤ 0)
    (hterm : ∀ S ⊆ C, F.IsIndepSet S → b S.card ≤
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card + 1) -
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card)) :
    b 0 + 4*b 1 + 6*b 2 + 4*b 3 + b 4 ≤ delta F (k : ℤ) := by
  rw [← powerset_four_sum C hC b]
  apply cover_sum_bound F C hcover k (fun S => b S.card) ?_ hterm
  intro S hSC hS
  apply hb
  by_contra h
  have : S = ∅ := card_eq_zero.mp (by omega)
  subst S
  exact hS (by simp [SimpleGraph.IsIndepSet])

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 170 END

-- VERITYOS ENTRY 171 BEGIN lemma Erdos993G1.ThirdWide.cover_rank_bound_singleton c5417995140494b557deb7bb6cdaf882219c1f6ceea198df9f804291884fefab
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_rank_bound_singleton {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hC : C.card = 4)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ)
    (a : X) (ha : a ∈ C) (b : ℕ → ℤ) (z : ℤ)
    (hb : ∀ t, 0 < t → b t ≤ 0)
    (hterm : ∀ S ⊆ C, F.IsIndepSet S →
      b S.card + (if S = {a} then z else 0) ≤
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card + 1) -
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card)) :
    b 0 + 4*b 1 + 6*b 2 + 4*b 3 + b 4 + z ≤ delta F (k : ℤ) := by
  have h := cover_sum_bound F C hcover k
    (fun S => b S.card + if S = {a} then z else 0) ?_ hterm
  · rw [sum_add_distrib,powerset_four_sum C hC b] at h
    simpa [mem_powerset,singleton_subset_iff,ha] using h
  · intro S hSC hS
    have hne : S ≠ {a} := by
      intro he
      subst S
      exact hS (by simp [SimpleGraph.IsIndepSet])
    rw [if_neg hne,add_zero]
    apply hb
    by_contra h
    have : S = ∅ := card_eq_zero.mp (by omega)
    subst S
    exact hS (by simp [SimpleGraph.IsIndepSet])

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 171 END

-- VERITYOS ENTRY 172 BEGIN lemma Erdos993G1.ThirdWide.cover_cross_edges_le b32d3a22f51995e48376876f0089f27d33541d36099f0c82d75ac15cd0962023
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_cross_edges_le {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X) :
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

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 172 END

-- VERITYOS ENTRY 173 BEGIN lemma Erdos993G1.ThirdWide.cover_four_sparse_vertex ae33397d5835c1792cefe8e000a3ed8a0d752f8e68e5d961ac3a0bb071ec43b2
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_four_sparse_vertex {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (hF : F.IsAcyclic)
    (hn : Nat.card X = 12) (C : Finset X) (hC : C.card = 4) :
    ∃ a ∈ C, ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card ≤ 2 := by
  have he := forest_card_edges_add_components F hF
  have hp := components_card_pos_of_card_pos F (by omega)
  have hc := cover_cross_edges_le F C
  by_contra h
  push Not at h
  have hs : 3*C.card ≤
      ∑ a ∈ C, ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card := by
    calc
      3*C.card = ∑ _a ∈ C, 3 := by simp [mul_comm]
      _ ≤ _ := sum_le_sum (fun a ha => by have := h a ha; omega)
  omega

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 173 END

-- VERITYOS ENTRY 174 BEGIN lemma Erdos993G1.ThirdWide.cover_singleton_available 5077d1d27ead79f330b9b6389a66211290cfc89d84a0334e02223ebaaaaaca55
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_singleton_available {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X) (a : X) :
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

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 174 END

-- VERITYOS ENTRY 175 BEGIN lemma Erdos993G1.ThirdWide.forest_delta_one_pos b7a8f175866bc785b5ee83c77b20fe6aa95cd71b565b10eb6775f2d1666f4212
namespace Erdos993G1.ThirdWide

open Finset

lemma forest_delta_one_pos {X : Type u} [Finite X]
    (F : SimpleGraph X) (hF : F.IsAcyclic) (hn : 6 ≤ Nat.card X) :
    0 < delta F 1 := by
  have hp := components_card_pos_of_card_pos F (by omega)
  have he := forest_card_edges_add_components F hF
  have hpair := indepCount_two_add_edges F
  have hchoose := scaledChooseTwo (Nat.card X)
  have hnz : (6 : ℤ) ≤ Nat.card X := by exact_mod_cast hn
  have hez : (Nat.card F.edgeSet : ℤ) + 1 ≤ Nat.card X := by exact_mod_cast (by omega : Nat.card F.edgeSet + 1 ≤ Nat.card X)
  have hh := mul_nonneg (show (0:ℤ) ≤ Nat.card X by positivity)
    (show (0:ℤ) ≤ (Nat.card X : ℤ)-5 by omega)
  rw [show (1:ℤ) = ((1:ℕ):ℤ) by rfl,delta_nat,indepCount_one]
  norm_num only [Nat.reduceAdd]
  nlinarith

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 175 END

-- VERITYOS ENTRY 176 BEGIN lemma Erdos993G1.ThirdWide.forest_delta_two_ten_pos 4dbac3461fcbd6ddef14e0fdda1f69a4c1a2aa41009d366a8b083701ff039918
namespace Erdos993G1.ThirdWide

open Finset

lemma forest_delta_two_ten_pos {X : Type u} [Finite X]
    (F : SimpleGraph X) (hF : F.IsAcyclic) (hn : Nat.card X = 10) :
    0 < delta F 2 := by
  classical
  letI := Fintype.ofFinite X
  have hnx : Fintype.card X = 10 := by simpa [Nat.card_eq_fintype_card] using hn
  have hp := components_card_pos_of_card_pos F (by omega)
  have he := forest_card_edges_add_components F hF
  have hpair := indepCount_two_add_edges F
  have htriple := indepCount_three_add_edge_incidence F hF
  have hsum := degreeChoose_sum_lower (fun x : X => F.degree x)
  have hd : (∑ x, (F.degree x : ℤ)) = 2 * (Nat.card F.edgeSet : ℤ) := by
    rw [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card]
    exact_mod_cast F.sum_degrees_eq_twice_card_edges
  rw [hd,hnx] at hsum
  norm_num only [hn,hnx,Nat.choose] at hpair htriple hsum
  have hez : (Nat.card F.edgeSet : ℤ) ≤ 9 := by exact_mod_cast (by omega : Nat.card F.edgeSet ≤ 9)
  rw [show (2:ℤ) = ((2:ℕ):ℤ) by rfl,delta_nat]
  norm_num only [Nat.reduceAdd]
  linarith

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 176 END

-- VERITYOS ENTRY 177 BEGIN lemma Erdos993G1.ThirdWide.binom_shift_floor 253c632bb86abb74aabfad8b26e0d4d56480630f526e952ad17200c5b4d954d8
namespace Erdos993G1.ThirdWide

open Finset

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

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 177 END

-- VERITYOS ENTRY 178 BEGIN lemma Erdos993G1.ThirdWide.cover_available_empty d7560723830bf2e156d752286dfed3bd71e12e6a15fd9d3b68eadc48c07b85d5
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_available_empty {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X) :
    ((univ : Finset X).filter
      (fun x => x ∉ C ∧ ∀ y ∈ (∅ : Finset X), ¬F.Adj y x)).card =
      Fintype.card X - C.card := by
  have he : (univ : Finset X).filter
      (fun x => x ∉ C ∧ ∀ y ∈ (∅ : Finset X), ¬F.Adj y x) = univ \ C := by
    ext x
    simp
  rw [he,card_sdiff_of_subset (subset_univ _),card_univ]

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 178 END

-- VERITYOS ENTRY 179 BEGIN lemma Erdos993G1.ThirdWide.cover_catalan_bound 857cee46b82fee44d079400240826d29cc820bcd5f7685efd868a5a35c3b11c4
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_catalan_bound {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hC : C.card = 4)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C)
    (n k : ℕ) (hn : Fintype.card X = n+4) :
    (n.choose (k+1) : ℤ) - n.choose k -
      4*(if 1 ≤ k then (catalan (k-1) : ℤ) else 0) -
      6*(if 2 ≤ k then (catalan (k-2) : ℤ) else 0) -
      4*(if 3 ≤ k then (catalan (k-3) : ℤ) else 0) -
      (if 4 ≤ k then (catalan (k-4) : ℤ) else 0) ≤ delta F (k : ℤ) := by
  let b : ℕ → ℤ := fun t => if t = 0 then
    (n.choose (k+1) : ℤ) - n.choose k else
    -(if t ≤ k then (catalan (k-t) : ℤ) else 0)
  have h := cover_rank_bound F C hC hcover k b ?_ ?_
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

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 179 END

-- VERITYOS ENTRY 180 BEGIN lemma Erdos993G1.ThirdWide.cover_delta_two_pos dea5b5df7cdbd457252b0f450fbf9d96ee3e00ab6f85635e712e1fd5ee776263
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_delta_two_pos {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hC : C.card = 4)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C)
    (n : ℕ) (hn : Fintype.card X = n+4) (hn8 : 8 ≤ n) :
    0 < delta F 2 := by
  have h := cover_catalan_bound F C hC hcover n 2 hn
  have hm := binomDelta_mono (k := 2) (a := 8) (b := n) (by omega) hn8
  norm_num [Nat.choose,catalan_zero,catalan_one,catalan_two,catalan_three] at h hm
  linarith

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 180 END

-- VERITYOS ENTRY 181 BEGIN lemma Erdos993G1.ThirdWide.cover_delta_three_large_pos 100d361d989a682096f483f9da4b3963a45c14c12652d990806e1e8de594e648
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_delta_three_large_pos {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hC : C.card = 4)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C)
    (n : ℕ) (hn : Fintype.card X = n+4) (hn10 : 10 ≤ n) :
    0 < delta F 3 := by
  have h := cover_catalan_bound F C hC hcover n 3 hn
  have hm := binomDelta_mono (k := 3) (a := 10) (b := n) (by omega) hn10
  norm_num [Nat.choose,catalan_zero,catalan_one,catalan_two,catalan_three] at h hm
  linarith

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 181 END

-- VERITYOS ENTRY 182 BEGIN lemma Erdos993G1.ThirdWide.cover_delta_large_pos 353b63ad9d257130ecdf579cef50dfd454ff351e4352f47923e4de4d93263b68
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_delta_large_pos {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hC : C.card = 4)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C)
    (n k : ℕ) (hn : Fintype.card X = n+4) (hk : 4 ≤ k) (hnk : 2*k+2 ≤ n) :
    0 < delta F (k : ℤ) := by
  have h := cover_catalan_bound F C hC hcover n k hn
  have hm := binomDelta_lower n k hnk
  have hp := catalan_gap_pos k hk
  rw [if_pos (by omega : 1 ≤ k),if_pos (by omega : 2 ≤ k),
    if_pos (by omega : 3 ≤ k),if_pos hk] at h
  linarith

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 182 END

-- VERITYOS ENTRY 183 BEGIN lemma Erdos993G1.ThirdWide.cover_delta_three_twelve_pos a531aa13418bc833b82c1a27ede978da6d2773f1a37e5b8c1f5c2a1460c9d143
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_delta_three_twelve_pos {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (hF : F.IsAcyclic)
    (hn : Nat.card X = 12) (C : Finset X) (hC : C.card = 4)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) :
    0 < delta F 3 := by
  classical
  obtain ⟨a,ha,hasmall⟩ := cover_four_sparse_vertex F hF hn C hC
  have hnx : Fintype.card X = 12 := by simpa only [Nat.card_eq_fintype_card] using hn
  let m := ((univ : Finset X).filter
    (fun x => x ∉ C ∧ ∀ y ∈ ({a} : Finset X), ¬F.Adj y x)).card
  have hm : 6 ≤ m := by
    have h := cover_singleton_available F C a
    rw [hnx,hC] at h
    dsimp [m]
    omega
  let b : ℕ → ℤ := fun t => if t = 0 then 14 else
    -(if t ≤ 3 then (catalan (3-t) : ℤ) else 0)
  have h := cover_rank_bound_singleton F C hC hcover 3 a ha b 7 ?_ ?_
  · norm_num [b,catalan_zero,catalan_one,catalan_two,catalan_three,Nat.choose] at h
    omega
  · intro t ht
    simp only [b,if_neg (by omega : t ≠ 0)]
    split_ifs <;> omega
  · intro S hSC hS
    by_cases hzero : S.card = 0
    · have he : S = ∅ := card_eq_zero.mp hzero
      subst S
      rw [cover_available_empty F C,hnx,hC]
      norm_num [b,FirstWide.binomCoeff,Int.toNat,Nat.choose]
    · by_cases hsingle : S = {a}
      · subst S
        have hb := binomDelta_lower m 2 (by omega)
        change b ({a} : Finset X).card + (if ({a} : Finset X) = {a} then 7 else 0) ≤
          FirstWide.binomCoeff m ((3 : ℤ)-({a} : Finset X).card+1) -
          FirstWide.binomCoeff m ((3 : ℤ)-({a} : Finset X).card)
        norm_num [b,FirstWide.binomCoeff,Int.toNat,catalan_zero,catalan_one,catalan_two,catalan_three,Nat.choose] at hb ⊢
        linarith
      · rw [if_neg hsingle,add_zero]
        simpa only [b,if_neg hzero] using binom_shift_floor
          ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card 3 S.card

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 183 END

-- VERITYOS ENTRY 184 BEGIN lemma Erdos993G1.ThirdWide.coverFour_prehistory 750e190e751e99ee3d1aab95f143f898d3135b9da58d0bf974379db3cf32447e
namespace Erdos993G1.ThirdWide

open Finset

lemma coverFour_prehistory {X : Type u} [Finite X] (F : SimpleGraph X) (r : ℕ)
    (hF : F.IsAcyclic) (hr : 1 ≤ r) (hn : Nat.card X = 2*r+4)
    (C : Finset X) (hC : C.card ≤ 4)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) :
    ∀ k : ℕ, k < r → 0 < delta F (k : ℤ) := by
  classical
  letI := Fintype.ofFinite X
  have hnx : Fintype.card X = 2*r+4 := by simpa only [Nat.card_eq_fintype_card] using hn
  obtain ⟨D,hCD,_,hD⟩ := exists_subsuperset_card_eq (subset_univ C) hC
    (show 4 ≤ (univ : Finset X).card by rw [card_univ,hnx]; omega)
  have hDcover : ∀ x y, F.Adj x y → x ∈ D ∨ y ∈ D := by
    intro x y hxy
    exact (hcover x y hxy).imp (fun h => hCD h) (fun h => hCD h)
  intro k hk
  by_cases hk4 : 4 ≤ k
  · exact cover_delta_large_pos F D hD hDcover (2*r) k hnx hk4 (by omega)
  · interval_cases k
    · simpa only [Nat.cast_zero,delta_zero,hn,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat]
        using (show (0 : ℤ) < 2*(r : ℤ)+4-1 by omega)
    · exact forest_delta_one_pos F hF (by omega)
    · by_cases hr3 : r = 3
      · exact forest_delta_two_ten_pos F hF (by rw [hn,hr3])
      · exact cover_delta_two_pos F D hD hDcover (2*r) hnx (by omega)
    · by_cases hr4 : r = 4
      · exact cover_delta_three_twelve_pos F hF (by rw [hn,hr4]) D hD hDcover
      · exact cover_delta_three_large_pos F D hD hDcover (2*r) hnx (by omega)

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 184 END

-- VERITYOS ENTRY 185 BEGIN lemma Erdos993G1.thirdWide_crossing_sign b4f7cf6ea2828d76ff0b24e18ea8288fdcb68800ce50aa2041194068c74b06de
lemma Erdos993G1.thirdWide_crossing_sign {X : Type u} [Finite X]
    (F : SimpleGraph X) (r : ℕ) (hF : F.IsAcyclic) (hr : 1 ≤ r)
    (hn : Nat.card X = 2*r+4) (hx : Erdos993G1.firstDescent F < r) :
    Erdos993G1.delta F (r : ℤ) ≤ 0 := by
  obtain hm | hc := Erdos993G1.ThirdWide.forest_matching_or_cover F hF
  · obtain ⟨f, hf, he⟩ := hm
    exact Erdos993G1.ThirdWide.fiveMatching_delta_nonpos F r hr hn f hf he
  · obtain ⟨C, hC, hcover⟩ := hc
    have hp := Erdos993G1.ThirdWide.coverFour_prehistory F r hF hr hn C hC hcover
      (Erdos993G1.firstDescent F) hx
    have hn := Erdos993G1.delta_firstDescent_neg F
    omega
-- VERITYOS ENTRY 185 END

-- VERITYOS ENTRY 186 BEGIN lemma Erdos993G1.ordinaryG1_thirdWide 117cde66333c6e890b8db347247e2cb5c218f23f67376ad36272c0828eec4cc5
lemma Erdos993G1.ordinaryG1_thirdWide {X : Type u} [Finite X]
    (T : SimpleGraph X) (v s g : X) (p : ℕ)
    (hG : Erdos993G1.ordinaryG1Guards T v s g p)
    (hn : Erdos993G1.residualOrder T v g = 2*p) :
    Erdos993G1.delta (Erdos993G1.residual T v g) ((p : ℤ)-2) ≤ 0 := by
  obtain ⟨hT, hv, hvs, hs, hsg, hgv, hp, hgamma, hwide, hx⟩ := hG
  have hr : 1 ≤ p-2 := by omega
  have hF := Erdos993G1.residual_isAcyclic hT.isAcyclic v g
  have hcard : Nat.card {w : X //
      w ∉ Erdos993G1.closedNeighborhood T v ∪ Erdos993G1.closedNeighborhood T g} =
      2*(p-2)+4 := by
    change Erdos993G1.residualOrder T v g = 2*(p-2)+4
    omega
  have h := Erdos993G1.thirdWide_crossing_sign (Erdos993G1.residual T v g)
    (p-2) hF hr hcard hx
  have hc : ((p-2 : ℕ) : ℤ) = (p:ℤ)-2 := by omega
  simpa only [hc] using h
-- VERITYOS ENTRY 186 END

-- VERITYOS ENTRY 187 BEGIN theorem Erdos993G1.thirdWideForestAndG1 f93cc534af49ac6841d7cebf0ed61826ea6dc1d5a664db5e9791166751d850d5
theorem Erdos993G1.thirdWideForestAndG1 :
    (∀ (V : Type u) [finiteV : Finite V] (F : SimpleGraph V) (r : ℕ),
      F.IsAcyclic →
      1 ≤ r →
      Nat.card V = 2 * r + 4 →
      Erdos993G1.firstDescent F < r →
      Erdos993G1.delta F (r : ℤ) ≤ 0) ∧
    (∀ (X : Type u) [finiteX : Finite X] (T : SimpleGraph X)
      (v s g : X) (p : ℕ),
      Erdos993G1.ordinaryG1Guards T v s g p →
      Erdos993G1.residualOrder T v g = 2 * p →
      Erdos993G1.delta (Erdos993G1.residual T v g) ((p : ℤ) - 2) ≤ 0) := by
  constructor
  · intro V finiteV F r hF hr hn hx
    exact Erdos993G1.thirdWide_crossing_sign F r hF hr hn hx
  · intro X finiteX T v s g p hG hn
    exact Erdos993G1.ordinaryG1_thirdWide T v s g p hG hn
-- VERITYOS ENTRY 187 END

