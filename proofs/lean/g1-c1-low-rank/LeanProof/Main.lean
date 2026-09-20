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

-- VERITYOS ENTRY 13 BEGIN lemma Erdos993G1.isNIndepSet_zero_iff 9df9b861d801c09b5ab131b483e26dacc5056eb6ffb7867c7523a51e8ed843fb
lemma isNIndepSet_zero_iff (S : Finset V) :
    F.IsNIndepSet 0 S ↔ S = ∅ := by
  simpa only [SimpleGraph.isNClique_compl] using
    (SimpleGraph.isNClique_zero (G := Fᶜ) (s := S))

-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma Erdos993G1.isNIndepSet_one_iff b12f77f59d3690c92c7c8bada90d9b4c5f1449b5b17c2e5574308cfbf54a0536
lemma isNIndepSet_one_iff (S : Finset V) :
    F.IsNIndepSet 1 S ↔ ∃ a, S = {a} := by
  classical
  simpa only [SimpleGraph.isNClique_compl] using
    (SimpleGraph.isNClique_one (G := Fᶜ) (s := S))

-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma Erdos993G1.indepCount_eq_card_indepSetFinset 4c59444af666076a0ce8c355415235545a1d9c97ae721113599f63dcfb489a31
lemma indepCount_eq_card_indepSetFinset [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (k : ℕ) :
    indepCount F k = ((F.indepSetFinset k).card : ℤ) := by
  simp only [indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
    SimpleGraph.indepSetFinset]

-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma Erdos993G1.indepCount_nonneg d5a62e3c3455c4d50f47db7e930f327551be59af8aaf1acfb08fff9a88e86136
lemma indepCount_nonneg (k : ℕ) : 0 ≤ indepCount F k := by
  exact Int.natCast_nonneg _

-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma Erdos993G1.indepCount_zero acffad838916a1b13c96fef7c654f39104b03af428110c4da5e9d500b0e07674
lemma indepCount_zero [Finite V] : indepCount F 0 = 1 := by
  classical
  letI := Fintype.ofFinite V
  rw [indepCount_eq_card_indepSetFinset]
  have h : F.indepSetFinset 0 = {∅} := by
    ext S
    simp [SimpleGraph.mem_indepSetFinset_iff, isNIndepSet_zero_iff]
  simp [h]

-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma Erdos993G1.indepCount_one 2c3536cb34ec79e12b8147cd94b40ec4f4c21269c2fc1c9efd90a558e487a31e
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

-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma Erdos993G1.indepCount_eq_zero_of_indepNum_lt 123be264ea42836f1785056098a62c5d48fa1d801d8b6a9393f0f5b0f96e0bb6
lemma indepCount_eq_zero_of_indepNum_lt [Finite V] {k : ℕ}
    (hk : F.indepNum < k) : indepCount F k = 0 := by
  haveI : IsEmpty {S : Finset V // F.IsNIndepSet k S} :=
    ⟨fun S => by
      have h := S.property.isIndepSet.card_le_indepNum
      rw [S.property.card_eq] at h
      exact (not_le_of_gt hk) h⟩
  simp [indepCount]

-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma Erdos993G1.indepCount_indepNum_pos c554d650c08283f9a98deb95737d52a97e95ae100d09a228280fd7cd658e6202
lemma indepCount_indepNum_pos [Finite V] :
    0 < indepCount F F.indepNum := by
  obtain ⟨S, hS⟩ := F.exists_isNIndepSet_indepNum
  haveI : Nonempty {S : Finset V // F.IsNIndepSet F.indepNum S} := ⟨⟨S, hS⟩⟩
  unfold indepCount
  exact_mod_cast (Nat.card_pos (α := {S : Finset V // F.IsNIndepSet F.indepNum S}))

-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma Erdos993G1.coeff_nat 03f00ca029c7e10a6278ad907c2d6e5891668cdff802ec6768f9f93e51ed47f7
lemma coeff_nat (k : ℕ) : coeff F (k : ℤ) = indepCount F k := by
  simp [coeff]

-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma Erdos993G1.coeff_of_neg bcf669545ab3401ca5ba88ac2a8cf77144df87049057892e19b7f7728b3174fc
lemma coeff_of_neg {k : ℤ} (hk : k < 0) : coeff F k = 0 := by
  simp [coeff, not_le_of_gt hk]

-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma Erdos993G1.delta_nat a7a02236294541ef40fa02c9d9f0dd02052d13536f6523f462e2d5b96ff04f9e
lemma delta_nat (k : ℕ) :
    delta F (k : ℤ) = indepCount F (k + 1) - indepCount F k := by
  simpa only [delta, Nat.cast_add, Nat.cast_one] using
    congrArg₂ (· - ·) (coeff_nat F (k + 1)) (coeff_nat F k)

-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma Erdos993G1.delta_zero c43a89269ad4d7bad8f5c8faa0222710d3815a826516edd0955a80bef67ebcb8
lemma delta_zero [Finite V] : delta F 0 = (Nat.card V : ℤ) - 1 := by
  simpa [indepCount_zero, indepCount_one] using (delta_nat F 0)

-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma Erdos993G1.delta_neg_one bfc4d805f6742022ecad22b2e0a4815d4b9dbdf74ee1a0c0d9029447718946dc
lemma delta_neg_one [Finite V] : delta F (-1) = 1 := by
  simp [delta, coeff, indepCount_zero]

-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma Erdos993G1.descentSet_nonempty a350a656e5d6dc22c0ce9c46cfdf112a3e20b1d02183576c24f5e68684fb6e37
lemma descentSet_nonempty [Finite V] :
    {k : ℕ | delta F (k : ℤ) < 0}.Nonempty := by
  refine ⟨F.indepNum, ?_⟩
  change delta F (F.indepNum : ℤ) < 0
  rw [delta_nat, indepCount_eq_zero_of_indepNum_lt F (Nat.lt_succ_self _)]
  have h := indepCount_indepNum_pos F
  omega

-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma Erdos993G1.delta_firstDescent_neg 89b0cab7b8771183c2d0b5ac70403180c74b49b516232480839218649f06509c
lemma delta_firstDescent_neg [Finite V] :
    delta F (firstDescent F : ℤ) < 0 := by
  exact Nat.sInf_mem (descentSet_nonempty F)

-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma Erdos993G1.delta_nonneg_of_lt_firstDescent 3392871c932e55446fbc42daf9e9c43a4e1cb08354049e72cb027cb6d19bf932
lemma delta_nonneg_of_lt_firstDescent {k : ℕ} (hk : k < firstDescent F) :
    0 ≤ delta F (k : ℤ) := by
  exact le_of_not_gt (Nat.notMem_of_lt_sInf hk)

-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma Erdos993G1.firstDescent_le_of_delta_neg 28265626e5cf310d23d33068a703ee3331532a0e2606bec2f98f236af0c037d9
lemma firstDescent_le_of_delta_neg {k : ℕ} (hk : delta F (k : ℤ) < 0) :
    firstDescent F ≤ k :=
  Nat.sInf_le hk

end Erdos993G1


universe w

namespace Erdos993G1

variable {V : Type u} {W : Type w} {F : SimpleGraph V} {G : SimpleGraph W}

-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma Erdos993G1.isNIndepSet_map_iso bd57ae9ed83550b3ae866881446b3f65e474c92abf31958c2ec9fceb1ecebea4
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

-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma Erdos993G1.indepCount_iso f71434b13438181169e26ebd673578c3c4195847c1f0e972ecc94516cacde2c6
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

-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma Erdos993G1.coeff_iso 3631b58dff1d09b36ceb6d30994a98a373baa90c430e6b6848fce34a00f7c1a9
lemma coeff_iso (e : F ≃g G) (k : ℤ) : coeff F k = coeff G k := by
  simp only [coeff, indepCount_iso e]

-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma Erdos993G1.delta_iso 6827baaeefaade9988a5b47db939fb51b758021e44a3205b90ae8ca504f80599
lemma delta_iso (e : F ≃g G) (k : ℤ) : delta F k = delta G k := by
  simp only [delta, coeff_iso e]

-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma Erdos993G1.firstDescent_iso f953a9d539a63b112ee6ea9442f78bdee854281e3ae2a6ab9c778bea34fe54dc
lemma firstDescent_iso (e : F ≃g G) : firstDescent F = firstDescent G := by
  simp only [firstDescent, delta_iso e]

-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma Erdos993G1.vertexDegree_eq_degree 1d25716bb2cfa9c9539a083cbf0540c1058822084e51f30235b21366df7eec48
lemma vertexDegree_eq_degree (a : V) [Fintype (F.neighborSet a)] :
    vertexDegree F a = F.degree a := by
  rw [vertexDegree, Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree]

-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma Erdos993G1.deleteVerts_isAcyclic fa008ac82c212d1670b3452bfae66fd9cdc7d0daf5cf0730113bca4db67f24d6
lemma deleteVerts_isAcyclic (h : F.IsAcyclic) (S : Set V) :
    (deleteVerts F S).IsAcyclic :=
  h.induce _

-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma Erdos993G1.residual_isAcyclic 171132e213d52d4989b295159e09daa1eaaf63f1c17c19916ef0fd2154c70202
lemma residual_isAcyclic (h : F.IsAcyclic) (v g : V) :
    (residual F v g).IsAcyclic :=
  h.induce _

-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma Erdos993G1.residualOrder_eq_card 849a5567c708fcc6b316d35358f7d832501d64d77ea0e18262b92d5a4e589d95
lemma residualOrder_eq_card (v g : V) :
    residualOrder F v g =
      Nat.card {a : V // a ∉ closedNeighborhood F v ∪ closedNeighborhood F g} :=
  rfl

end Erdos993G1


namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)

-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma Erdos993G1.isNIndepSet_pair_iff c7fe22b14d4127788420f1fc872c6908e1c8e03d5089db1a4512366a1c6011cd
lemma isNIndepSet_pair_iff [DecidableEq V] (a b : V) :
    F.IsNIndepSet 2 {a, b} ↔ a ≠ b ∧ ¬F.Adj a b := by
  by_cases h : a = b
  · subst b
    simp [SimpleGraph.isNIndepSet_iff]
  · simp [SimpleGraph.isNIndepSet_iff, SimpleGraph.isIndepSet_iff, Set.Pairwise, h, F.adj_comm] <;> tauto

-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma Erdos993G1.sym2_toFinset_injective b6bb80d1fc0be2dc048f714854ea2d7ae9649fbceb0e5bbffbd1fae3d1947acd
lemma sym2_toFinset_injective [DecidableEq V] :
    Function.Injective (Sym2.toFinset : Sym2 V → Finset V) := by
  intro a b h
  apply Sym2.ext
  intro v
  simpa only [Sym2.mem_toFinset] using iff_of_eq (congrArg (v ∈ ·) h)

-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma Erdos993G1.indepSetFinset_two_eq 39a4bb3841ed900d0110289548de64819de9508cc2754cd12dd313c2afe30cc8
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

-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma Erdos993G1.indepCount_two_add_edges a01f026068c216985f79412914a708de863f8d52ac60d7369e2b85a21c58c014
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

-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN lemma Erdos993G1.indepSetFinset_eq_filter_powersetCard ec9d1ede162d82ed94a34a38672bad65fc69ea0b778b5162ae78c5fec73a5628
lemma indepSetFinset_eq_filter_powersetCard [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (k : ℕ) :
    F.indepSetFinset k = ((Finset.univ : Finset V).powersetCard k).filter
      (fun B : Finset V => F.IsIndepSet B) := by
  ext B
  simp [SimpleGraph.mem_indepSetFinset_iff, SimpleGraph.isNIndepSet_iff, and_comm]

-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN lemma Erdos993G1.card_nonindep_pairs 96c84ad8516cd9224be112085b17e6b4dceb988fd19ce9e39ffaad28a4804cbc
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

-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN lemma Erdos993G1.sum_card_filter_swap db506bda8bc6b666134551b5bc0fd50e22daf1b537ec59f21be1da84eb4ffe98
lemma sum_card_filter_swap {A : Type u} {B : Type w}
    (s : Finset A) (t : Finset B) (p : A → B → Prop)
    [DecidableRel p] :
    ∑ a ∈ s, (t.filter (p a)).card =
      ∑ b ∈ t, (s.filter (fun a => p a b)).card := by
  simp only [Finset.card_eq_sum_ones, Finset.sum_filter]
  exact Finset.sum_comm

-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN lemma Erdos993G1.sum_nonindep_pair_incidence da829ee128471804d3016cd47dc81dc700c969ffe760cdfe792d805388f36292
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

-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN lemma Erdos993G1.sum_indep_indicator e8656c5832d89388faa9e5fbe465d97c9212944d86545795e43360d7cf446d54
lemma sum_indep_indicator [Fintype V] [DecidableEq V] [DecidableRel F.Adj]
    (k : ℕ) :
    ∑ B ∈ (Finset.univ : Finset V).powersetCard k,
      (if F.IsIndepSet B then 1 else 0) = (F.indepSetFinset k).card := by
  rw [indepSetFinset_eq_filter_powersetCard]
  simp only [Finset.card_eq_sum_ones, Finset.sum_filter]

end Erdos993G1


namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)

-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN lemma Erdos993G1.triple_local_identity 1987228dfddb76922331fd7897112e6fbb9500d655adc833b004028ebafcd53d
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

-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN lemma Erdos993G1.indepSetFinset_three_incidence 80322d36a50c5f8eedef153e69e935eaf0bebd0f6e842e96267c37f5a18cb932
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

-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN lemma Erdos993G1.indepCount_three_incidence 3adc3e522766311fc9fcd178eccb3be21853afe0f6f45f08e276fee0469da6e6
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

-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN lemma Erdos993G1.sum_triple_centered_neighbor_pairs 5d6d13f96ef2b45f6ff273927629e027fd51f7516517e36611d6551eb587a326
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

-- VERITYOS ENTRY 51 END

-- VERITYOS ENTRY 52 BEGIN lemma Erdos993G1.indepCount_three_add_edge_incidence b398a1f04b7b79977e8c1fc91c4eff3e3af0fec8c9def9962f181c902fe781da
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


-- VERITYOS ENTRY 52 END

-- VERITYOS ENTRY 53 BEGIN lemma Erdos993G1.pathEight_indepCount_three 0e29db059505f864e12c75ec433be8e57e84a96d1e97e6398d27fb771cca9bdd
lemma Erdos993G1.pathEight_indepCount_three :
    Erdos993G1.indepCount (SimpleGraph.pathGraph 8) 3 = 20 := by
  letI : DecidableRel (SimpleGraph.pathGraph 8).Adj := fun v w =>
    decidable_of_iff (v.val + 1 = w.val ∨ w.val + 1 = v.val) SimpleGraph.pathGraph_adj.symm
  rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
  decide

-- VERITYOS ENTRY 53 END

-- VERITYOS ENTRY 54 BEGIN lemma Erdos993G1.pathEight_indepCount_four f9906c059d315b180581ede34ccec23534348d14c27029f28598cc0ccd0cb0c0
lemma Erdos993G1.pathEight_indepCount_four :
    Erdos993G1.indepCount (SimpleGraph.pathGraph 8) 4 = 5 := by
  letI : DecidableRel (SimpleGraph.pathGraph 8).Adj := fun v w =>
    decidable_of_iff (v.val + 1 = w.val ∨ w.val + 1 = v.val) SimpleGraph.pathGraph_adj.symm
  rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
  decide

-- VERITYOS ENTRY 54 END

-- VERITYOS ENTRY 55 BEGIN lemma Erdos993G1.pathEight_delta_three 0c20bb8db1477bcbdfafbf318f9399d38469e5bca9071fe57a29f54b76a338df
lemma Erdos993G1.pathEight_delta_three :
    Erdos993G1.delta (SimpleGraph.pathGraph 8) 3 = -15 := by
  have h := Erdos993G1.delta_nat (SimpleGraph.pathGraph 8) 3
  norm_num [Erdos993G1.pathEight_indepCount_three,
    Erdos993G1.pathEight_indepCount_four] at h
  exact h

namespace Erdos993G1

-- VERITYOS ENTRY 55 END

-- VERITYOS ENTRY 56 BEGIN lemma Erdos993G1.forest_card_edges_add_components 0c2fc141909dd6efa072639e3071ed6f5e6b14787697f3dd2ee2579560bb017f
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

-- VERITYOS ENTRY 56 END

-- VERITYOS ENTRY 57 BEGIN lemma Erdos993G1.components_card_pos_of_card_pos bd55e00b7dabf7179733a98d36feec04246ff14e0711a9213ddea4545442ebba
lemma components_card_pos_of_card_pos {V : Type u} [Finite V]
    (F : SimpleGraph V) (hV : 0 < Nat.card V) :
    0 < Nat.card F.ConnectedComponent := by
  haveI : Nonempty V := (Finite.card_pos_iff).mp hV
  exact Nat.card_pos

-- VERITYOS ENTRY 57 END

-- VERITYOS ENTRY 58 BEGIN lemma Erdos993G1.connected_of_components_card_eq_one d1fa40fce26c4bacfa1c0213caf51f70364e8df2ff028548f79d089919d34f6a
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

-- VERITYOS ENTRY 58 END

-- VERITYOS ENTRY 59 BEGIN lemma Erdos993G1.PathClassification.longestPath_support_closed eb014ed9e3bba006ccd1bfec10b3c8919996695ec39461ac245621e58d2bc87f
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

-- VERITYOS ENTRY 59 END

-- VERITYOS ENTRY 60 BEGIN lemma Erdos993G1.PathClassification.longestPath_spanning 36b63e828d4fb832735cac7939db6767d6c1bda373c2c2e1903de4ee5e0d00bf
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

-- VERITYOS ENTRY 60 END

-- VERITYOS ENTRY 61 BEGIN lemma Erdos993G1.PathClassification.tree_maxDegreeTwo_iso_pathGraph_card 29ac2e202882dce5f177871f54ca5f2de2b04889ab0c3c813bc2c99d6e75d30b
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

-- VERITYOS ENTRY 61 END

-- VERITYOS ENTRY 62 BEGIN lemma Erdos993G1.PathClassification.tree_order_eight_maxDegreeTwo_iso_pathGraph 532fc845394e40f375e4dfd3b0fe4d6cb419a03f6e0ce849a7f2ede4000acc3b
lemma tree_order_eight_maxDegreeTwo_iso_pathGraph {V : Type u} [Finite V]
    {G : SimpleGraph V} (hG : G.IsTree) (horder : Nat.card V = 8)
    (hdeg : ∀ v, Nat.card (G.neighborSet v) ≤ 2) :
    Nonempty (G ≃g SimpleGraph.pathGraph 8) := by
  exact cast (congrArg (fun n => Nonempty (G ≃g SimpleGraph.pathGraph n)) horder)
    (tree_maxDegreeTwo_iso_pathGraph_card hG hdeg)

end Erdos993G1.PathClassification


-- VERITYOS ENTRY 62 END

-- VERITYOS ENTRY 63 BEGIN lemma Erdos993G1.lowRankArithmetic 46e31bf020e3711e0bf5e2bb3f54ba1fbb1136760a2b4b25fab8b5c6c69dfa95
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


-- VERITYOS ENTRY 63 END

-- VERITYOS ENTRY 64 BEGIN lemma Erdos993G1.degreeDefect_nonneg 36d264dd1540fb3c551965bb8704a04e73dffb2748e1497c1638b7d3407c7d8e
lemma Erdos993G1.degreeDefect_nonneg (d : ℕ) :
    (0 : ℤ) ≤ (d.choose 2 : ℤ) - (d : ℤ) + 1 := by
  cases d with
  | zero => norm_num
  | succ n =>
    rw [Nat.choose_succ_succ]
    simp only [Nat.choose_one_right, Nat.cast_add, Nat.cast_succ]
    have h := (Nat.cast_nonneg (n.choose 2) : (0 : ℤ) ≤ n.choose 2)
    omega

-- VERITYOS ENTRY 64 END

-- VERITYOS ENTRY 65 BEGIN lemma Erdos993G1.degreeDefect_eq_zero_iff 53d6ffa1551d55b391d6ca657b12f47e7be6bc8842ecb9e8ae7528700baed7d9
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

-- VERITYOS ENTRY 65 END

-- VERITYOS ENTRY 66 BEGIN lemma Erdos993G1.degreeChoose_sum_lower 32408765453e657cc5f7832829d929966472874f342ca4c81d8899d5d346784e
lemma Erdos993G1.degreeChoose_sum_lower {V : Type*} [Fintype V] (d : V → ℕ) :
    (∑ v, (d v : ℤ)) - Fintype.card V ≤ ∑ v, ((d v).choose 2 : ℤ) := by
  have h : 0 ≤ ∑ v, (((d v).choose 2 : ℤ) - (d v : ℤ) + 1) :=
    Finset.sum_nonneg (fun v _ => Erdos993G1.degreeDefect_nonneg (d v))
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, Finset.sum_const,
    Finset.card_univ, nsmul_eq_mul, mul_one] at h
  omega

-- VERITYOS ENTRY 66 END

-- VERITYOS ENTRY 67 BEGIN lemma Erdos993G1.degreeChoose_sum_equality 69a77469b5e1465d40f99e5c096dad7b2a81bc1de12f0b88b6971afc3ef62763
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


-- VERITYOS ENTRY 67 END

-- VERITYOS ENTRY 68 BEGIN lemma Erdos993G1.scaledChooseTwo c526653f5ce4c90392e252c3e28e6ce164135670fdd12d5664f120646f2671d8
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

-- VERITYOS ENTRY 68 END

-- VERITYOS ENTRY 69 BEGIN lemma Erdos993G1.scaledChooseThree bcef58787034fa165d746e7fa2a863cc1a20b351dafb9951cc1178ad9b01fc1b
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


-- VERITYOS ENTRY 69 END

-- VERITYOS ENTRY 70 BEGIN lemma Erdos993G1.lowRankForestClassification_of_count_identities 220e0b030714563a8724d6ffb5c60b4f9e242de52a313d58cf04fe1d2a8e6bfc
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

-- VERITYOS ENTRY 70 END

-- VERITYOS ENTRY 71 BEGIN lemma Erdos993G1.Deletion.deleteVerts_union_iso 84567459ae6e5bc695dfa19c17afc6bb310c8826f9edac168b186ef817a46594
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

-- VERITYOS ENTRY 71 END

-- VERITYOS ENTRY 72 BEGIN lemma Erdos993G1.Deletion.ambientH_iso_delete_ambientA 769b68f49bb5a60a0b07c05242ca0c137d2384e08b8244b46302a6ebf4c54759
lemma ambientH_iso_delete_ambientA {V : Type u} (T : SimpleGraph V) (v g : V) :
    Nonempty (ambientH T v g ≃g
      deleteVerts (ambientA T v) {a | a.val = g}) := by
  exact deleteVerts_union_iso T (closedNeighborhood T v) {g}

-- VERITYOS ENTRY 72 END

-- VERITYOS ENTRY 73 BEGIN lemma Erdos993G1.Deletion.original_residual_deletion_set_eq 8e7124c437efa47597a6ff309c3511759132571e7f6e12f8c10af4890b741a42
lemma original_residual_deletion_set_eq {V : Type u} (T : SimpleGraph V)
    (v s g : V) (hvs : T.Adj v s) :
    (closedNeighborhood T v ∪ {g}) ∪ {w | T.Adj g w ∧ w ≠ s} =
      closedNeighborhood T v ∪ closedNeighborhood T g := by
  ext w
  simp only [closedNeighborhood, Set.mem_union, Set.mem_singleton_iff, Set.mem_setOf_eq]
  by_cases hws : w = s <;> aesop

-- VERITYOS ENTRY 73 END

-- VERITYOS ENTRY 74 BEGIN lemma Erdos993G1.Deletion.residual_iso_delete_ambientH 36d14d97e9d35db700fda92549e71479c33ef1c5144afedcd7f7c30dafcf9ffd
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

-- VERITYOS ENTRY 74 END

-- VERITYOS ENTRY 75 BEGIN lemma Erdos993G1.Deletion.other_support_neighbor_survives 759d52f4d9f8cfa0ac2ee0493e3e1ff7003954d01a5e8ce54da8fa6bbb7a4dbd
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

-- VERITYOS ENTRY 75 END

-- VERITYOS ENTRY 76 BEGIN lemma Erdos993G1.Deletion.ambientH_iso_delete_typed_survivor ea96d8a8c373dc902349ab1bbe029041639fc399ea5006f88346305fea97a1fe
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

-- VERITYOS ENTRY 76 END

-- VERITYOS ENTRY 77 BEGIN lemma Erdos993G1.Deletion.leaf_ambientH_iso_delete_typed_survivor 5e04878ee268c444211ced7b140695f5d81c75d0207a1892d19938d73463f14a
lemma leaf_ambientH_iso_delete_typed_survivor {V : Type u} [Finite V]
    (T : SimpleGraph V) (v s g : V) (hleaf : vertexDegree T v = 1)
    (hvs : T.Adj v s) (hsg : T.Adj s g) (hgv : g ≠ v) :
    Nonempty (ambientH T v g ≃g deleteVerts (ambientA T v)
      {⟨g, other_support_neighbor_survives T v s g hleaf hvs hsg hgv⟩}) :=
  ambientH_iso_delete_typed_survivor T v g
    (other_support_neighbor_survives T v s g hleaf hvs hsg hgv)

end Erdos993G1.Deletion


-- VERITYOS ENTRY 77 END

-- VERITYOS ENTRY 78 BEGIN lemma Erdos993G1.lowRankForestClassification 87931db520d541292d805b40c26e574756d1edcc5ddecaa17dc0939e6fb593dc
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

-- VERITYOS ENTRY 78 END

-- VERITYOS ENTRY 79 BEGIN lemma Erdos993G1.ordinaryG1_lowRank 6f43a8c7ebe501315351076f7f437f0d0620934a9696bba3efdb0c3a30c2f054
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


-- VERITYOS ENTRY 79 END

-- VERITYOS ENTRY 80 BEGIN theorem Erdos993G1.lowRankForestClassificationAndG1 9ad3ce50b53fbcd53097b6f616c07d6b178cfee02fd2cd58b993e6ffcce42266
theorem Erdos993G1.lowRankForestClassificationAndG1 :
    (∀ (V : Type u) [finiteV : Finite V] (F : SimpleGraph V) (p : ℕ),
      F.IsAcyclic →
      p ≤ 5 →
      2 * p - 3 < Nat.card V →
      Erdos993G1.firstDescent F < p - 2 →
      p = 5 ∧ Nonempty (F ≃g SimpleGraph.pathGraph 8) ∧
        Erdos993G1.delta F 3 = -15) ∧
    (∀ (W : Type u) [finiteW : Finite W] (T : SimpleGraph W) (v s g : W) (pT : ℕ),
      Erdos993G1.ordinaryG1Guards T v s g pT →
      pT ≤ 5 →
      Erdos993G1.delta (Erdos993G1.residual T v g) ((pT : ℤ) - 2) ≤ 0) := by
  constructor
  · intro V finiteV F p hF hp hm hx
    exact Erdos993G1.lowRankForestClassification F p hF hp hm hx
  · intro W finiteW T v s g pT hG hp
    exact Erdos993G1.ordinaryG1_lowRank T v s g pT hG hp
-- VERITYOS ENTRY 80 END

