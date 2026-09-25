import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition Erdos993G1.indepCount 5484fc21ffce7bf707240da15858d7d82289f8e6f286a8fa9837cd9a0c474ccb
universe u


namespace Erdos993G1

noncomputable
def indepCount {V : Type u} (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)

end Erdos993G1
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition Erdos993G1.coeff 211900436b28e4a685af60df26a20e8fe254fd4c9479c12ba2863fa180c1a639
namespace Erdos993G1

noncomputable
def coeff {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0

end Erdos993G1
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition Erdos993G1.delta bdb46014d98507a7c85cc8de0b806f80c04496479795e28677dde024e216b9ee
namespace Erdos993G1

noncomputable
def delta {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k

end Erdos993G1
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition Erdos993G1.closedNbhdFinset dec12eac260570fafea80bebca4b45f3b4f875a5e486a975adfdc6beb882f4cc
namespace Erdos993G1

section

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The closed neighbourhood of a finite set `J` of vertices: `J` together with every
neighbour of a vertex of `J`. -/
def closedNbhdFinset (J : Finset X) : Finset X :=
  J ∪ J.biUnion (fun u => G.neighborFinset u)

end

end Erdos993G1
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition Erdos993G1.extensionFinset a90756266a574cb4811cb7750aa112bc0efedbad69cb55139b7c582ff37f9460
namespace Erdos993G1

section

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The extension set of `J`: vertices outside the closed neighbourhood of `J`, i.e. those
`v` with `J ∪ {v}` independent whenever `J` is. -/
def extensionFinset (J : Finset X) : Finset X :=
  Finset.univ \ closedNbhdFinset G J

end

end Erdos993G1
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition Erdos993G1.e 9e7ac4873c80945c9d6e9176683b368c5128e01906504f0387b923d1ac34a807
namespace Erdos993G1

section

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- `e(J)`, the number of extensions of `J`. -/
def e (J : Finset X) : ℕ := (extensionFinset G J).card

end

end Erdos993G1
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition Erdos993G1.indepDegreeSum a1ed32eb12b137ac5915bf15255c1173593296f3eb22127e2dcf0fab2ea9f38e
namespace Erdos993G1

section

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The incident degree sum `D_k(G) := Σ_{J ∈ I_k(G)} Σ_{v ∈ J} deg_G(v)`. -/
def indepDegreeSum (k : ℕ) : ℕ :=
  ∑ J ∈ G.indepSetFinset k, ∑ v ∈ J, G.degree v

end

end Erdos993G1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition Erdos993G1.rootRep 374f2db4b0725371fc7b9f1060aa66bb2ee6182316320f36933da3dcacd8b010
namespace Erdos993G1

/-- A distinguished vertex of the connected component of `v`: the root of `v`'s component.
It depends only on the component, so adjacent vertices share it. -/
noncomputable
def rootRep {X : Type u} (G : SimpleGraph X) (v : X) : X :=
  (G.connectedComponentMk v).out

end Erdos993G1
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition Erdos993G1.rootPath b6ac72e3cf4e210f171972fb26aca81603e373798eb259d808db8aa75aacb31e
namespace Erdos993G1

/-- A path from `v` to the root of its component. In a forest it is *the* path, by
`SimpleGraph.IsAcyclic.path_unique`; the definition itself needs no acyclicity. -/
noncomputable
def rootPath {X : Type u} [DecidableEq X] (G : SimpleGraph X) (v : X) :
    G.Walk v (rootRep G v) :=
  (Nonempty.some
    (show G.Reachable v (rootRep G v) from
      (SimpleGraph.ConnectedComponent.exact
        (Quot.out_eq (G.connectedComponentMk v))).symm)).toPath.1

end Erdos993G1
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN definition Erdos993G1.par 343cffbe7fb26014882200669829a8ed589677c966093c8d55545f6d9ec7f9af
namespace Erdos993G1

/-- The parent of `v`: the second vertex of `v`'s root path. `par G v = v` exactly when that
path is trivial, i.e. when `v` is its component's root. -/
noncomputable
def par {X : Type u} [DecidableEq X] (G : SimpleGraph X) (v : X) : X :=
  (rootPath G v).snd

end Erdos993G1
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN definition Erdos993G1.rk 3284c2e8847d1d708b56f32f654f7b587db761611e9af3c46acf3dabffdb56f5
namespace Erdos993G1

/-- The rank of `v`: the length of its root path. The parent strictly decreases it, which is
what forbids two-cycles in the parent map. -/
noncomputable
def rk {X : Type u} [DecidableEq X] (G : SimpleGraph X) (v : X) : ℕ :=
  (rootPath G v).length

end Erdos993G1
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN definition Erdos993G1.childrenFinset 9f1a449c71f2a47a1579c6dcf35d9d2a5daf3ae82e3e62d8b4c49f9b1238ae85
namespace Erdos993G1

/-- The children of `v`: the non-root vertices whose parent is `v`. -/
noncomputable
def childrenFinset {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    (v : X) : Finset X :=
  Finset.univ.filter (fun u => par G u = v ∧ par G u ≠ u)

end Erdos993G1
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN definition Erdos993G1.upPairs b1c56b649cc550f6919d78d588a6a25cbbaf0ed0f3266d86279b191aafe3526b
namespace Erdos993G1

/-- The "up" incidences: pairs `(J, v)` with `J` an independent `k`-set and `v ∈ J` a non-root.
Each such pair is the incidence of `v ∈ J` with the edge `{v, par v}`. -/
noncomputable
def upPairs {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ) : Finset ((_ : Finset X) × X) :=
  (G.indepSetFinset k).sigma (fun J => J.filter (fun v => par G v ≠ v))

end Erdos993G1
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN definition Erdos993G1.downPairs 497207784a63c4f3b62b86688a69ada3e1b48391222439ed5b6afdc690691173
namespace Erdos993G1

/-- The "down" incidences: pairs `(J, u)` with `J` an independent `k`-set, `u` a non-root and
`par u ∈ J`. Each such pair is the incidence of `par u ∈ J` with the edge `{u, par u}`. -/
noncomputable
def downPairs {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ) : Finset ((_ : Finset X) × X) :=
  (G.indepSetFinset k).sigma
    (fun J => Finset.univ.filter (fun u => par G u ≠ u ∧ par G u ∈ J))

end Erdos993G1
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN definition Erdos993G1.rootPairs 27966a15b92cb630c846b62aaaeeeca64126088f23ebc75561365de929344b70
namespace Erdos993G1

/-- The root incidences: pairs `(J, r)` with `J` an independent `k`-set and `r ∈ J` a root.
This is the root correction term of the root-corrected degree lemma. -/
noncomputable
def rootPairs {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ) : Finset ((_ : Finset X) × X) :=
  (G.indepSetFinset k).sigma (fun J => J.filter (fun v => par G v = v))

end Erdos993G1
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN definition Erdos993G1.swapMap 6acc44c9ec8d91ab5b04315da037334f5e820b6940be43b0077c6b80a13c1ab9
namespace Erdos993G1

/-- The injection witnessing `#downPairs ≤ #upPairs`. On a down incidence `(J, u)` (so
`par u ∈ J` and `u ∉ J`): if `u` has a child in `J`, keep `J` and move to that child; otherwise
swap `u` for its parent inside `J`. The two branches are told apart by whether the image's
grandparent lies in the image's set. -/
noncomputable
def swapMap {X : Type u} [DecidableEq X] (G : SimpleGraph X)
    (a : (_ : Finset X) × X) : (_ : Finset X) × X :=
  if h : (a.1.filter (fun c => par G c = a.2)).Nonempty then ⟨a.1, h.choose⟩
  else ⟨insert a.2 (a.1.erase (par G a.2)), a.2⟩

end Erdos993G1
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma Erdos993G1.indepCount_eq_card_indepSetFinset 4463e7eea65f11f69266095e58b54777ea245aa79caee47bf5b6e3ab77aa0eac
namespace Erdos993G1

lemma indepCount_eq_card_indepSetFinset {V : Type u} [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (k : ℕ) :
    Erdos993G1.indepCount F k = ((F.indepSetFinset k).card : ℤ) := by
  simp only [Erdos993G1.indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
    SimpleGraph.indepSetFinset]

end Erdos993G1
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma Erdos993G1.mem_extensionFinset_iff 2d2c86bc4260c15708f5231faf0ecc154efae179f01fb9bc0665f36f0ce947e0
namespace Erdos993G1

section

variable {X : Type u} [Fintype X] [DecidableEq X] {G : SimpleGraph X} [DecidableRel G.Adj]

/-- `v ∈ extensionFinset G J ↔ v ∉ J ∧ ∀ u ∈ J, ¬ G.Adj v u`. -/
lemma mem_extensionFinset_iff {J : Finset X} {v : X} :
    v ∈ extensionFinset G J ↔ v ∉ J ∧ ∀ u ∈ J, ¬ G.Adj v u := by
  unfold extensionFinset closedNbhdFinset
  simp only [Finset.mem_sdiff, Finset.mem_univ, true_and, Finset.mem_union,
    Finset.mem_biUnion, SimpleGraph.mem_neighborFinset]
  push Not
  constructor
  · rintro ⟨hnJ, hforall⟩
    exact ⟨hnJ, fun u hu => (not_congr (G.adj_comm v u)).mpr (hforall u hu)⟩
  · rintro ⟨hnJ, hforall⟩
    exact ⟨hnJ, fun u hu => (not_congr (G.adj_comm u v)).mpr (hforall u hu)⟩

end

end Erdos993G1
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma Erdos993G1.isNIndepSet_insert_of_mem_extensionFinset 6e93855ffde0aba8402ed757360ee6254c13667e69b1e3ab3a4b48908ce393b5
namespace Erdos993G1

section

variable {X : Type u} [Fintype X] [DecidableEq X] {G : SimpleGraph X} [DecidableRel G.Adj]

/-- Inserting an extension into an independent `k`-set gives an independent `(k+1)`-set. -/
lemma isNIndepSet_insert_of_mem_extensionFinset {J : Finset X} {v : X} {k : ℕ}
    (hJ : G.IsNIndepSet k J) (hv : v ∈ extensionFinset G J) :
    G.IsNIndepSet (k + 1) (insert v J) := by
  obtain ⟨hnJ, hadjfree⟩ := mem_extensionFinset_iff.mp hv
  have hnJ' : v ∉ (↑J : Set X) := by simpa using hnJ
  have hindepJ : G.IsIndepSet (↑J : Set X) := hJ.isIndepSet
  have hpairJ : (↑J : Set X).Pairwise (fun a b => ¬ G.Adj a b) := hindepJ
  have hindep : (insert v (↑J : Set X)).Pairwise (fun a b => ¬ G.Adj a b) := by
    apply hpairJ.insert_of_notMem hnJ'
    intro b hb
    have hbJ : b ∈ J := by simpa using hb
    exact ⟨hadjfree b hbJ, fun hadj => hadjfree b hbJ hadj.symm⟩
  have hcoe : (↑(insert v J) : Set X) = insert v (↑J : Set X) := by simp
  refine ⟨?_, ?_⟩
  · rw [SimpleGraph.isIndepSet_iff, hcoe]
    exact hindep
  · rw [Finset.card_insert_of_notMem hnJ, hJ.card_eq]

end

end Erdos993G1
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma Erdos993G1.isNIndepSet_erase_and_mem_extensionFinset 63c83f650a0cac2ad0b02fcabfa81bdcbb8c0a98d99820c9725f61d6aeee5a6e
namespace Erdos993G1

section

variable {X : Type u} [Fintype X] [DecidableEq X] {G : SimpleGraph X} [DecidableRel G.Adj]

/-- Removing a member of an independent `(k+1)`-set gives an independent `k`-set, and the
removed vertex becomes an extension of the smaller set. -/
lemma isNIndepSet_erase_and_mem_extensionFinset {J' : Finset X} {u : X} {k : ℕ}
    (hJ' : G.IsNIndepSet (k + 1) J') (hu : u ∈ J') :
    G.IsNIndepSet k (J'.erase u) ∧ u ∈ extensionFinset G (J'.erase u) := by
  have hindepJ' : G.IsIndepSet (↑J' : Set X) := hJ'.isIndepSet
  have hpairJ' : (↑J' : Set X).Pairwise (fun a b => ¬ G.Adj a b) := hindepJ'
  have hsub : (↑(J'.erase u) : Set X) ⊆ (↑J' : Set X) := by
    intro x hx
    simp only [Finset.coe_erase, Set.mem_sdiff] at hx
    exact hx.1
  have hindep : G.IsIndepSet (↑(J'.erase u) : Set X) := hpairJ'.mono hsub
  have hcard : (J'.erase u).card = k := by
    have heq := Finset.card_erase_of_mem hu
    rw [hJ'.card_eq] at heq
    omega
  refine ⟨⟨hindep, hcard⟩, ?_⟩
  rw [mem_extensionFinset_iff]
  refine ⟨Finset.notMem_erase u J', fun w hw hadj => ?_⟩
  have hwJ' : w ∈ J' := Finset.mem_of_mem_erase hw
  have hwu : w ≠ u := Finset.ne_of_mem_erase hw
  exact hpairJ' hu hwJ' (Ne.symm hwu) hadj

end

end Erdos993G1
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma Erdos993G1.sigma_card_double_count 3dbdbb33a7e478730a2facdd66fc897568217ab4db9f41e93131c3439f36e0cf
namespace Erdos993G1

section

variable {X : Type u} [Fintype X] [DecidableEq X] {G : SimpleGraph X} [DecidableRel G.Adj]

/-- The double count at the level of `Finset` cardinalities, via the bijection
`(J, v) ↦ (insert v J, v)` between `Σ J ∈ I_k, extension(J)` and `Σ J' ∈ I_{k+1}, J'`. -/
lemma sigma_card_double_count (k : ℕ) :
    ((G.indepSetFinset k).sigma (fun J => extensionFinset G J)).card
      = ((G.indepSetFinset (k + 1)).sigma (fun J => J)).card := by
  apply Finset.card_bij' (fun a _ => (⟨insert a.2 a.1, a.2⟩ : Σ _ : Finset X, X))
    (fun b _ => (⟨b.1.erase b.2, b.2⟩ : Σ _ : Finset X, X))
  · intro a ha
    obtain ⟨haJ, hav⟩ := Finset.mem_sigma.mp ha
    rw [Finset.mem_sigma]
    have hins := isNIndepSet_insert_of_mem_extensionFinset
      (SimpleGraph.mem_indepSetFinset_iff.mp haJ) hav
    exact ⟨SimpleGraph.mem_indepSetFinset_iff.mpr hins, Finset.mem_insert_self _ _⟩
  · intro b hb
    obtain ⟨hbJ, hbu⟩ := Finset.mem_sigma.mp hb
    rw [Finset.mem_sigma]
    obtain ⟨herase, hext⟩ :=
      isNIndepSet_erase_and_mem_extensionFinset (SimpleGraph.mem_indepSetFinset_iff.mp hbJ) hbu
    exact ⟨SimpleGraph.mem_indepSetFinset_iff.mpr herase, hext⟩
  · intro a ha
    obtain ⟨_, hav⟩ := Finset.mem_sigma.mp ha
    have hnotmem : a.2 ∉ a.1 := (mem_extensionFinset_iff.mp hav).1
    have hfst : (insert a.2 a.1).erase a.2 = a.1 := Finset.erase_insert hnotmem
    simp [hfst]
  · intro b hb
    obtain ⟨_, hbu⟩ := Finset.mem_sigma.mp hb
    have hfst : insert b.2 (b.1.erase b.2) = b.1 := Finset.insert_erase hbu
    simp [hfst]

end

end Erdos993G1
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma Erdos993G1.sum_card_indepSetFinset_succ 36c1178b3743443cdcc68c7d937d44bb1d325792f07bef26b56dbe83214d236a
namespace Erdos993G1

section

variable {X : Type u} [Fintype X] [DecidableEq X] {G : SimpleGraph X} [DecidableRel G.Adj]

/-- The double count as a sum: `Σ_{J' ∈ I_{k+1}} #J' = (k+1) * #(I_{k+1})`, since every
member of `I_{k+1}` has cardinality `k+1`. -/
lemma sum_card_indepSetFinset_succ (k : ℕ) :
    ∑ J' ∈ G.indepSetFinset (k + 1), J'.card = (k + 1) * (G.indepSetFinset (k + 1)).card := by
  rw [Finset.sum_congr rfl (fun J' hJ' =>
    (SimpleGraph.mem_indepSetFinset_iff.mp hJ').card_eq), Finset.sum_const, smul_eq_mul,
    Nat.mul_comm]

end

end Erdos993G1
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma Erdos993G1.sum_e_eq_succ_mul_card 11ea489ae3170380dccf1e8baef3b1fa2eb4bb03d994ed6ba77c8f739035752e
namespace Erdos993G1

section

variable {X : Type u} [Fintype X] [DecidableEq X] {G : SimpleGraph X} [DecidableRel G.Adj]

/-- **The double count** (ℕ level): `Σ_{J ∈ I_k} e(J) = (k+1) * #(I_{k+1})`. -/
lemma sum_e_eq_succ_mul_card (k : ℕ) :
    ∑ J ∈ G.indepSetFinset k, e G J = (k + 1) * (G.indepSetFinset (k + 1)).card := by
  have h1 : ∑ J ∈ G.indepSetFinset k, e G J
      = ((G.indepSetFinset k).sigma (fun J => extensionFinset G J)).card := by
    rw [Finset.card_sigma]
    rfl
  have h2 : ((G.indepSetFinset (k + 1)).sigma (fun J => J)).card
      = ∑ J' ∈ G.indepSetFinset (k + 1), J'.card := by
    rw [Finset.card_sigma]
  rw [h1, sigma_card_double_count, h2, sum_card_indepSetFinset_succ]

end

end Erdos993G1
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma Erdos993G1.double_count 6cad038aebaff81cd3a6e45c9462bde139d139017513d191d513a1daedf9417b
namespace Erdos993G1

section

variable {X : Type u} [Fintype X] [DecidableEq X] {G : SimpleGraph X} [DecidableRel G.Adj]

/-- **The double count** (the contract's ℤ form): `(k+1)·i_{k+1}(G) = Σ_{J ∈ I_k(G)} e(J)`. -/
lemma double_count (k : ℕ) :
    ((k : ℤ) + 1) * Erdos993G1.indepCount G (k + 1)
      = ∑ J ∈ G.indepSetFinset k, (e G J : ℤ) := by
  have hnat := sum_e_eq_succ_mul_card (G := G) k
  have hcast : ((∑ J ∈ G.indepSetFinset k, e G J : ℕ) : ℤ)
      = ∑ J ∈ G.indepSetFinset k, (e G J : ℤ) := by
    push_cast
    rfl
  rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
  have := congrArg (fun n : ℕ => (n : ℤ)) hnat
  push_cast at this
  linarith [this, hcast]

end

end Erdos993G1
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma Erdos993G1.card_closedNbhdFinset_le 92b171b2812a61cf696a2aa86d993660811ed739f2d4eb719fdcea8ba6003255
namespace Erdos993G1

section

variable {X : Type u} [Fintype X] [DecidableEq X] {G : SimpleGraph X} [DecidableRel G.Adj]

/-- `#(closedNbhdFinset G J) ≤ #J + Σ_{v∈J} deg(v)`: every vertex of the closed neighbourhood
of `J` is either in `J` or a neighbour of some `v ∈ J`. -/
lemma card_closedNbhdFinset_le (J : Finset X) :
    (closedNbhdFinset G J).card ≤ J.card + ∑ v ∈ J, G.degree v := by
  unfold closedNbhdFinset
  calc
    (J ∪ J.biUnion (fun u => G.neighborFinset u)).card
        ≤ J.card + (J.biUnion (fun u => G.neighborFinset u)).card := Finset.card_union_le _ _
    _ ≤ J.card + ∑ v ∈ J, (G.neighborFinset v).card := by
        gcongr
        exact Finset.card_biUnion_le
    _ = J.card + ∑ v ∈ J, G.degree v := by
        simp only [SimpleGraph.card_neighborFinset_eq_degree]

end

end Erdos993G1
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma Erdos993G1.e_add_card_add_degreeSum_ge 5c20e841bcd4ee0f483d315f9169dadb6bbb27c54e45526c11aa588d7d4b3c5a
namespace Erdos993G1

section

variable {X : Type u} [Fintype X] [DecidableEq X] {G : SimpleGraph X} [DecidableRel G.Adj]

/-- **(b), subtraction-free form**: `e(J) + #J + Σ_{v∈J} deg(v) ≥ n`. -/
lemma e_add_card_add_degreeSum_ge (J : Finset X) :
    e G J + J.card + ∑ v ∈ J, G.degree v ≥ Fintype.card X := by
  have hsub : closedNbhdFinset G J ⊆ (Finset.univ : Finset X) := Finset.subset_univ _
  have hsplit : (extensionFinset G J).card + (closedNbhdFinset G J).card
      = Fintype.card X := by
    have := Finset.card_sdiff_add_card_eq_card hsub
    simpa [extensionFinset, Finset.card_univ] using this
  have hbound := card_closedNbhdFinset_le (G := G) J
  have hecard : e G J = (extensionFinset G J).card := rfl
  omega

end

end Erdos993G1
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma Erdos993G1.e_ge_sub 93a19ab344bf2a2290ebeac6d1a2f44a89b78720d1ded68be3c540f9ad167a1f
namespace Erdos993G1

section

variable {X : Type u} [Fintype X] [DecidableEq X] {G : SimpleGraph X} [DecidableRel G.Adj]

/-- **(b), the contract's `ℤ` form**: `e(J) ≥ n − k − Σ_{v∈J} deg(v)` for `J` an independent
`k`-set. -/
lemma e_ge_sub (k : ℕ) {J : Finset X} (hJ : G.IsNIndepSet k J) :
    (e G J : ℤ) ≥ (Fintype.card X : ℤ) - (k : ℤ) - (∑ v ∈ J, G.degree v : ℤ) := by
  have hnat := e_add_card_add_degreeSum_ge (G := G) J
  rw [hJ.card_eq] at hnat
  have hcast : ((e G J + k + ∑ v ∈ J, G.degree v : ℕ) : ℤ) ≥ (Fintype.card X : ℤ) := by
    exact_mod_cast hnat
  push_cast at hcast
  linarith

end

end Erdos993G1
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma Erdos993G1.rootPath_isPath 5bbc24574b2399a8e2d992f1e01a41fd7c5d2495660ef94cffe48f33703780d2
namespace Erdos993G1

lemma rootPath_isPath {X : Type u} [DecidableEq X] (G : SimpleGraph X) (v : X) :
    (rootPath G v).IsPath := Subtype.property _

end Erdos993G1
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma Erdos993G1.rootRep_eq_of_adj e0ad6bc2af15870b0ebe15afa9b9c76a0718b92538c4b104f094bf91acf3cbc0
namespace Erdos993G1

lemma rootRep_eq_of_adj {X : Type u} (G : SimpleGraph X) {u v : X} (h : G.Adj u v) :
    rootRep G u = rootRep G v := by
  unfold rootRep
  rw [SimpleGraph.ConnectedComponent.sound h.reachable]

end Erdos993G1
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma Erdos993G1.par_eq_self_of_nil 3fb75813d8ce5ceb5a0b0d0fe22beb147e02186f8983f7c36ecff69c4f6049f2
namespace Erdos993G1

lemma par_eq_self_of_nil {X : Type u} [DecidableEq X] (G : SimpleGraph X) {v : X}
    (h : (rootPath G v).Nil) : par G v = v := by
  have hlen : (rootPath G v).length = 0 := SimpleGraph.Walk.length_eq_zero_iff.mpr h
  have h1 : (rootPath G v).getVert 1 = rootRep G v :=
    SimpleGraph.Walk.getVert_of_length_le _ (by omega)
  have h2 : v = rootRep G v := h.eq
  show (rootPath G v).getVert 1 = v
  rw [h1, ← h2]

end Erdos993G1
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma Erdos993G1.not_nil_rootPath_of_par_ne 014b607c9e8472d93a48fb38746b615b5579240079b5c95ec65ba150b8a1b9ee
namespace Erdos993G1

lemma not_nil_rootPath_of_par_ne {X : Type u} [DecidableEq X] (G : SimpleGraph X) {v : X}
    (h : par G v ≠ v) : ¬ (rootPath G v).Nil :=
  fun hnil => h (par_eq_self_of_nil G hnil)

end Erdos993G1
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma Erdos993G1.adj_par 26f24650ca416da56f96bf89bf737f0cb6c2d2bbd43ab38fb286e8a3d36e830b
namespace Erdos993G1

lemma adj_par {X : Type u} [DecidableEq X] (G : SimpleGraph X) {v : X} (h : par G v ≠ v) :
    G.Adj v (par G v) :=
  SimpleGraph.Walk.adj_snd (not_nil_rootPath_of_par_ne G h)

end Erdos993G1
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma Erdos993G1.rootPath_unique 140b2b08a64f5887c87b000d29f8fb3f60068f62ba0dde91313eb46d438bb8c0
namespace Erdos993G1

/-- Every path from `v` to `v`'s root is *the* root path. **Acyclicity enters the rooting API
here and nowhere else.** The endpoint is a bound variable so the lemma also applies to walks
typed at a propositionally-equal root. -/
lemma rootPath_unique {X : Type u} [DecidableEq X] (G : SimpleGraph X) (hG : G.IsAcyclic)
    {v w : X} (hw : w = rootRep G v) (P : G.Walk v w) (hP : P.IsPath) :
    P.length = rk G v ∧ P.snd = par G v := by
  subst hw
  have hEq : P = rootPath G v :=
    congrArg Subtype.val (hG.path_unique ⟨P, hP⟩ ⟨rootPath G v, rootPath_isPath G v⟩)
  subst hEq
  exact ⟨rfl, rfl⟩

end Erdos993G1
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma Erdos993G1.par_or 7aaca43eb99db6e13221e4774788863ed55d8a457e3b72d3fb89a1dd490d1c5c
namespace Erdos993G1

/-- In a finite forest every edge joins a vertex to its parent, in one direction or the other.
This is the neighbourhood decomposition `N(v) = {par v} ∪ children(v)` in relational form. -/
lemma par_or {X : Type u} [DecidableEq X] (G : SimpleGraph X) (hG : G.IsAcyclic) {u v : X}
    (h : G.Adj u v) : par G u = v ∨ par G v = u := by
  by_cases hu : u ∈ (rootPath G v).support
  · exact Or.inr (hG.eq_snd_of_adj_start (rootPath_isPath G v) h.symm hu).symm
  · left
    have hW : (SimpleGraph.Walk.cons h (rootPath G v)).IsPath :=
      (rootPath_isPath G v).cons hu
    have hkey := (rootPath_unique G hG (v := u) (w := rootRep G v)
      (rootRep_eq_of_adj G h).symm (SimpleGraph.Walk.cons h (rootPath G v)) hW).2
    rw [SimpleGraph.Walk.snd_cons] at hkey
    exact hkey.symm

end Erdos993G1
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma Erdos993G1.rk_par_lt 53a32b6e1f9147a406547085abf4901e7e0c8251c9c5901bc99918c60e570772
namespace Erdos993G1

lemma rk_par_lt {X : Type u} [DecidableEq X] (G : SimpleGraph X) (hG : G.IsAcyclic) {v : X}
    (h : par G v ≠ v) : rk G (par G v) < rk G v := by
  have hnil : ¬ (rootPath G v).Nil := not_nil_rootPath_of_par_ne G h
  have htail : ((rootPath G v).tail).IsPath := (rootPath_isPath G v).tail
  have hlen : ((rootPath G v).tail).length + 1 = (rootPath G v).length :=
    SimpleGraph.Walk.length_tail_add_one hnil
  have hroot : rootRep G v = rootRep G (par G v) := rootRep_eq_of_adj G (adj_par G h)
  have hkey := (rootPath_unique G hG (v := par G v) (w := rootRep G v) hroot
    ((rootPath G v).tail) htail).1
  rw [← hkey]
  show ((rootPath G v).tail).length < (rootPath G v).length
  omega

end Erdos993G1
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma Erdos993G1.par_par_ne b935ab74a0ffd7cfcbbcf897aeb559faad11e64ae7e2275679dc44f5a38a4c99
namespace Erdos993G1

/-- The parent map has no two-cycles. -/
lemma par_par_ne {X : Type u} [DecidableEq X] (G : SimpleGraph X) (hG : G.IsAcyclic) {u : X}
    (h : par G u ≠ u) : par G (par G u) ≠ u := by
  intro hcon
  have h1 : rk G (par G u) < rk G u := rk_par_lt G hG h
  have h2 : par G (par G u) ≠ par G u := by
    rw [hcon]; exact fun hc => h hc.symm
  have h3 : rk G (par G (par G u)) < rk G (par G u) := rk_par_lt G hG h2
  rw [hcon] at h3
  omega

end Erdos993G1
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma Erdos993G1.not_adj_of_indep db396d8cb181e3ff478ee3b71834d877749539f0a2bf76fba526ce72c5488269
namespace Erdos993G1

lemma not_adj_of_indep {X : Type u} {G : SimpleGraph X} {J : Finset X} {k : ℕ}
    (hJ : G.IsNIndepSet k J) {x y : X} (hx : x ∈ J) (hy : y ∈ J) (hxy : x ≠ y) :
    ¬ G.Adj x y := by
  have hpair : (↑J : Set X).Pairwise (fun p q => ¬ G.Adj p q) := hJ.isIndepSet
  exact hpair (Finset.mem_coe.mpr hx) (Finset.mem_coe.mpr hy) hxy

end Erdos993G1
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma Erdos993G1.notMem_of_par_mem 395178d04af9139c07ef15979fd610b290c7f719f3ada7b44044efcaf1a402ca
namespace Erdos993G1

lemma notMem_of_par_mem {X : Type u} [DecidableEq X] (G : SimpleGraph X) {J : Finset X} {u : X}
    {k : ℕ} (hJ : G.IsNIndepSet k J) (h1 : par G u ≠ u) (h2 : par G u ∈ J) : u ∉ J :=
  fun hu => not_adj_of_indep hJ hu h2 h1.symm (adj_par G h1)

end Erdos993G1
-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma Erdos993G1.mem_childrenFinset 6aeb7c0e8f060620768939897a64c3de700ffc2f78aa40829ed9b78b212a820f
namespace Erdos993G1

lemma mem_childrenFinset {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    {u v : X} : u ∈ childrenFinset G v ↔ par G u = v ∧ par G u ≠ u := by
  simp [childrenFinset]

end Erdos993G1
-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma Erdos993G1.neighborFinset_eq_of_root 4095dc32553bc3a4b66d6e7534394e339306d5fc2e95047b64c9c9b7c2b5205f
namespace Erdos993G1

lemma neighborFinset_eq_of_root {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) {v : X} (h : par G v = v) :
    G.neighborFinset v = childrenFinset G v := by
  ext u
  rw [SimpleGraph.mem_neighborFinset, mem_childrenFinset]
  constructor
  · intro hadj
    rcases par_or G hG hadj with h1 | h2
    · exact absurd (h.symm.trans h1) (G.ne_of_adj hadj)
    · exact ⟨h2, by rw [h2]; exact G.ne_of_adj hadj⟩
  · rintro ⟨h1, h2⟩
    have hA := adj_par G h2
    rw [h1] at hA
    exact hA.symm

end Erdos993G1
-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma Erdos993G1.par_notMem_childrenFinset 646494eb8d480bcac331e08372bc40b7c6b0e2fb7b3d44c41922b1c26e6cd093
namespace Erdos993G1

lemma par_notMem_childrenFinset {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    (hG : G.IsAcyclic) {v : X} (h : par G v ≠ v) : par G v ∉ childrenFinset G v := by
  rw [mem_childrenFinset]
  rintro ⟨h1, -⟩
  exact par_par_ne G hG h h1

end Erdos993G1
-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma Erdos993G1.neighborFinset_eq_of_nonroot 4abee80c104e6de8c01900522e4bba76166a7d4384f3925ca59065393b1f7c42
namespace Erdos993G1

lemma neighborFinset_eq_of_nonroot {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) {v : X} (h : par G v ≠ v) :
    G.neighborFinset v = insert (par G v) (childrenFinset G v) := by
  ext u
  rw [SimpleGraph.mem_neighborFinset, Finset.mem_insert, mem_childrenFinset]
  constructor
  · intro hadj
    rcases par_or G hG hadj with h1 | h2
    · exact Or.inl h1.symm
    · exact Or.inr ⟨h2, by rw [h2]; exact G.ne_of_adj hadj⟩
  · rintro (rfl | ⟨h1, h2⟩)
    · exact adj_par G h
    · have hA := adj_par G h2
      rw [h1] at hA
      exact hA.symm

end Erdos993G1
-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN lemma Erdos993G1.degree_eq_card_childrenFinset_add c05a83fb1e99533f4889d9168e3b4fc2e757b522d6735665d63e518b0ae8ff38
namespace Erdos993G1

/-- The degree decomposition of a finite forest along the parent map: a vertex's neighbours are
its children together with its parent, and the parent contributes exactly when `v` is not a
root. -/
lemma degree_eq_card_childrenFinset_add {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (hG : G.IsAcyclic) (v : X) :
    G.degree v = (childrenFinset G v).card + (if par G v = v then 0 else 1) := by
  have hd : G.degree v = (G.neighborFinset v).card := rfl
  by_cases h : par G v = v
  · rw [if_pos h, hd, neighborFinset_eq_of_root G hG h, Nat.add_zero]
  · rw [if_neg h, hd, neighborFinset_eq_of_nonroot G hG h,
      Finset.card_insert_of_notMem (par_notMem_childrenFinset G hG h)]

end Erdos993G1
-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN lemma Erdos993G1.sum_card_childrenFinset a252b13068235f079d7948fdbd316b7c234ae2d4bbfaf965e9b3abb69f9e13f8
namespace Erdos993G1

/-- Summing children counts over a set `J` counts the non-root vertices whose parent lies in
`J`: distinct vertices have disjoint child sets. -/
lemma sum_card_childrenFinset {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    (J : Finset X) :
    ∑ v ∈ J, (childrenFinset G v).card
      = (Finset.univ.filter (fun u => par G u ≠ u ∧ par G u ∈ J)).card := by
  have hmaps : Set.MapsTo (par G)
      ↑(Finset.univ.filter (fun u => par G u ≠ u ∧ par G u ∈ J)) ↑J := by
    intro a ha
    simp only [Finset.coe_filter, Set.mem_setOf_eq, Finset.mem_univ, true_and] at ha
    exact Finset.mem_coe.mpr ha.2
  rw [Finset.card_eq_sum_card_fiberwise hmaps]
  refine Finset.sum_congr rfl (fun b hb => ?_)
  congr 1
  ext a
  simp only [Finset.mem_filter, Finset.mem_univ, true_and, mem_childrenFinset]
  constructor
  · rintro ⟨h1, h2⟩
    exact ⟨⟨h2, by rw [h1]; exact hb⟩, h1⟩
  · rintro ⟨⟨h1, h2⟩, h3⟩
    exact ⟨h3, h1⟩

end Erdos993G1
-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN lemma Erdos993G1.card_downPairs_add_card_upPairs f8c4bcb1d28b68f15feb75570a49f3deafbac22b3f46f82a7e5999bc7d96c52f
namespace Erdos993G1

/-- `D_k` splits as the down incidences plus the up incidences. -/
lemma card_downPairs_add_card_upPairs {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) :
    (downPairs G k).card + (upPairs G k).card = indepDegreeSum G k := by
  rw [downPairs, upPairs, Finset.card_sigma, Finset.card_sigma, ← Finset.sum_add_distrib,
    indepDegreeSum]
  refine Finset.sum_congr rfl (fun J hJ => ?_)
  rw [← sum_card_childrenFinset G J, Finset.card_filter, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl (fun v hv => ?_)
  rw [degree_eq_card_childrenFinset_add G hG v]
  by_cases h : par G v = v <;> simp [h]

end Erdos993G1
-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN lemma Erdos993G1.card_upPairs_add_card_rootPairs 5fb92a46fa20b0ec347be306936e45a71a568f6e81349385fd149e0f0814b96e
namespace Erdos993G1

/-- The up incidences and the root incidences partition the `k * i_k` membership pairs. -/
lemma card_upPairs_add_card_rootPairs {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (k : ℕ) :
    (upPairs G k).card + (rootPairs G k).card = k * (G.indepSetFinset k).card := by
  rw [upPairs, rootPairs, Finset.card_sigma, Finset.card_sigma, ← Finset.sum_add_distrib]
  have hstep : ∀ J ∈ G.indepSetFinset k,
      (J.filter (fun v => par G v ≠ v)).card + (J.filter (fun v => par G v = v)).card = k := by
    intro J hJ
    have hcard : J.card = k := (SimpleGraph.mem_indepSetFinset_iff.mp hJ).card_eq
    rw [← hcard, add_comm]
    exact Finset.card_filter_add_card_filter_not (s := J) (fun v => par G v = v)
  rw [Finset.sum_congr rfl hstep, Finset.sum_const, smul_eq_mul, mul_comm]

end Erdos993G1
-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN lemma Erdos993G1.swapMap_mem_upPairs 2e34e8627e6726b3cb5ca504a57b8ae7f6d3dd634e4ed9a30b08824a96fa8599
namespace Erdos993G1

/-- The swap map sends down incidences to up incidences. -/
lemma swapMap_mem_upPairs {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) {J : Finset X} {u : X}
    (ha : (⟨J, u⟩ : (_ : Finset X) × X) ∈ downPairs G k) :
    swapMap G ⟨J, u⟩ ∈ upPairs G k := by
  rw [downPairs, Finset.mem_sigma] at ha
  obtain ⟨haJ, hau⟩ := ha
  simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hau
  obtain ⟨hu1, hu2⟩ := hau
  have hJ : G.IsNIndepSet k J := SimpleGraph.mem_indepSetFinset_iff.mp haJ
  have huJ : u ∉ J := notMem_of_par_mem G hJ hu1 hu2
  rw [upPairs, Finset.mem_sigma]
  unfold swapMap
  by_cases h : (J.filter (fun c => par G c = u)).Nonempty
  · rw [dif_pos h]
    have hc := h.choose_spec
    rw [Finset.mem_filter] at hc
    have hne : par G h.choose ≠ h.choose := by
      intro hcon
      have hEq : u = h.choose := hc.2.symm.trans hcon
      rw [hEq] at huJ
      exact huJ hc.1
    exact ⟨haJ, by rw [Finset.mem_filter]; exact ⟨hc.1, hne⟩⟩
  · rw [dif_neg h]
    have hkNe : ∀ x ∈ J, x ≠ par G u → ¬ G.Adj u x := by
      intro x hx hxne hadj
      rcases par_or G hG hadj with h1 | h2
      · exact hxne h1.symm
      · exact h ⟨x, by rw [Finset.mem_filter]; exact ⟨hx, h2⟩⟩
    have hnotmem : u ∉ J.erase (par G u) := fun hc => huJ (Finset.mem_of_mem_erase hc)
    refine ⟨?_, ?_⟩
    · rw [SimpleGraph.mem_indepSetFinset_iff]
      have hsub : ((J.erase (par G u) : Finset X) : Set X) ⊆ (↑J : Set X) := by
        intro x hx
        simp only [Finset.coe_erase, Set.mem_sdiff] at hx
        exact hx.1
      have hpairJ : (↑J : Set X).Pairwise (fun p q => ¬ G.Adj p q) := hJ.isIndepSet
      have hnotS : u ∉ ((J.erase (par G u) : Finset X) : Set X) := by
        rw [Finset.mem_coe]
        exact hnotmem
      have hins : (insert u ((J.erase (par G u) : Finset X) : Set X)).Pairwise
          (fun p q => ¬ G.Adj p q) := by
        refine (hpairJ.mono hsub).insert_of_notMem hnotS ?_
        intro b hb
        have hbE : b ∈ J.erase (par G u) := Finset.mem_coe.mp hb
        have hbJ : b ∈ J := Finset.mem_of_mem_erase hbE
        have hbne : b ≠ par G u := Finset.ne_of_mem_erase hbE
        exact ⟨hkNe b hbJ hbne, fun hadj => hkNe b hbJ hbne hadj.symm⟩
      refine ⟨?_, ?_⟩
      · rw [SimpleGraph.isIndepSet_iff]
        have hcoe : (↑(insert u (J.erase (par G u))) : Set X)
            = insert u ((J.erase (par G u) : Finset X) : Set X) := by simp
        rw [hcoe]
        exact hins
      · have hcardJ : J.card = k := hJ.card_eq
        have hk1 : 1 ≤ k := by
          rw [← hcardJ]
          exact Finset.card_pos.mpr ⟨_, hu2⟩
        rw [Finset.card_insert_of_notMem hnotmem, Finset.card_erase_of_mem hu2, hcardJ]
        omega
    · rw [Finset.mem_filter]
      exact ⟨Finset.mem_insert_self _ _, hu1⟩

end Erdos993G1
-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN lemma Erdos993G1.swapMap_grandparent_pos 5532a3bccfb979f4a54ef231771962fa30821b0bcbba42782576ba9e2b09742a
namespace Erdos993G1

/-- Branch invariant (child branch): the image's grandparent lies in the image's set. -/
lemma swapMap_grandparent_pos {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ) {J : Finset X} {u : X}
    (ha : (⟨J, u⟩ : (_ : Finset X) × X) ∈ downPairs G k)
    (h : (J.filter (fun c => par G c = u)).Nonempty) :
    par G (par G (swapMap G ⟨J, u⟩).2) ∈ (swapMap G ⟨J, u⟩).1 := by
  rw [downPairs, Finset.mem_sigma] at ha
  obtain ⟨-, hau⟩ := ha
  simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hau
  have hc := h.choose_spec
  rw [Finset.mem_filter] at hc
  have hswap : swapMap G ⟨J, u⟩ = ⟨J, h.choose⟩ := by
    unfold swapMap; rw [dif_pos h]
  rw [hswap]
  show par G (par G h.choose) ∈ J
  rw [hc.2]
  exact hau.2

end Erdos993G1
-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN lemma Erdos993G1.swapMap_grandparent_neg 7f722159cb6724633932bb6a6d3d2e06a017be93b4653bfcb78115d938536be5
namespace Erdos993G1

/-- Branch invariant (swap branch): the image's grandparent does **not** lie in the image's set.
This is where `par_par_ne` and independence of `J` are used, and it is what separates the two
branches and makes the map injective. -/
lemma swapMap_grandparent_neg {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) {J : Finset X} {u : X}
    (ha : (⟨J, u⟩ : (_ : Finset X) × X) ∈ downPairs G k)
    (h : ¬ (J.filter (fun c => par G c = u)).Nonempty) :
    par G (par G (swapMap G ⟨J, u⟩).2) ∉ (swapMap G ⟨J, u⟩).1 := by
  rw [downPairs, Finset.mem_sigma] at ha
  obtain ⟨haJ, hau⟩ := ha
  simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hau
  obtain ⟨hu1, hu2⟩ := hau
  have hJ : G.IsNIndepSet k J := SimpleGraph.mem_indepSetFinset_iff.mp haJ
  have hswap : swapMap G ⟨J, u⟩ = ⟨insert u (J.erase (par G u)), u⟩ := by
    unfold swapMap; rw [dif_neg h]
  rw [hswap]
  show par G (par G u) ∉ insert u (J.erase (par G u))
  rw [Finset.mem_insert]
  push Not
  constructor
  · exact par_par_ne G hG hu1
  · intro hcon
    have hmem : par G (par G u) ∈ J := Finset.mem_of_mem_erase hcon
    have hne : par G (par G u) ≠ par G u := Finset.ne_of_mem_erase hcon
    exact not_adj_of_indep hJ hu2 hmem hne.symm (adj_par G (fun hc => hne hc))

end Erdos993G1
-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN lemma Erdos993G1.swapMap_injOn feb0207296ba2c5e1c71aff87cc12db6aa7bbe666309c8b8541421996a74d30b
namespace Erdos993G1

/-- The swap map is injective on the down incidences. -/
lemma swapMap_injOn {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) :
    Set.InjOn (swapMap G) ↑(downPairs G k) := by
  rintro ⟨J₁, u₁⟩ ha ⟨J₂, u₂⟩ hb hab
  rw [Finset.mem_coe] at ha hb
  by_cases hA : (J₁.filter (fun c => par G c = u₁)).Nonempty <;>
    by_cases hB : (J₂.filter (fun c => par G c = u₂)).Nonempty
  · have ea : swapMap G ⟨J₁, u₁⟩ = ⟨J₁, hA.choose⟩ := by unfold swapMap; rw [dif_pos hA]
    have eb : swapMap G ⟨J₂, u₂⟩ = ⟨J₂, hB.choose⟩ := by unfold swapMap; rw [dif_pos hB]
    rw [ea, eb] at hab
    simp only [Sigma.mk.injEq, heq_eq_eq] at hab
    obtain ⟨hJ, hc⟩ := hab
    have sa := hA.choose_spec
    have sb := hB.choose_spec
    rw [Finset.mem_filter] at sa sb
    have hu : u₁ = u₂ := by rw [← sa.2, ← sb.2, hc]
    rw [hJ, hu]
  · exact absurd (hab ▸ swapMap_grandparent_pos G k ha hA)
      (swapMap_grandparent_neg G hG k hb hB)
  · exact absurd (swapMap_grandparent_pos G k hb hB)
      (hab ▸ swapMap_grandparent_neg G hG k ha hA)
  · have ea : swapMap G ⟨J₁, u₁⟩ = ⟨insert u₁ (J₁.erase (par G u₁)), u₁⟩ := by
      unfold swapMap; rw [dif_neg hA]
    have eb : swapMap G ⟨J₂, u₂⟩ = ⟨insert u₂ (J₂.erase (par G u₂)), u₂⟩ := by
      unfold swapMap; rw [dif_neg hB]
    rw [ea, eb] at hab
    simp only [Sigma.mk.injEq, heq_eq_eq] at hab
    obtain ⟨hS, hu⟩ := hab
    subst hu
    rw [downPairs, Finset.mem_sigma] at ha hb
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at ha hb
    have hJ₁ : G.IsNIndepSet k J₁ := SimpleGraph.mem_indepSetFinset_iff.mp ha.1
    have hJ₂ : G.IsNIndepSet k J₂ := SimpleGraph.mem_indepSetFinset_iff.mp hb.1
    have hn₁ : u₁ ∉ J₁ := notMem_of_par_mem G hJ₁ ha.2.1 ha.2.2
    have hn₂ : u₁ ∉ J₂ := notMem_of_par_mem G hJ₂ hb.2.1 hb.2.2
    have he₁ : (insert u₁ (J₁.erase (par G u₁))).erase u₁ = J₁.erase (par G u₁) :=
      Finset.erase_insert (fun hc => hn₁ (Finset.mem_of_mem_erase hc))
    have he₂ : (insert u₁ (J₂.erase (par G u₁))).erase u₁ = J₂.erase (par G u₁) :=
      Finset.erase_insert (fun hc => hn₂ (Finset.mem_of_mem_erase hc))
    have hEr : J₁.erase (par G u₁) = J₂.erase (par G u₁) := by
      rw [← he₁, ← he₂, hS]
    have hJeq : J₁ = J₂ := by
      rw [← Finset.insert_erase ha.2.2, ← Finset.insert_erase hb.2.2, hEr]
    rw [hJeq]

end Erdos993G1
-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN lemma Erdos993G1.card_downPairs_le_card_upPairs 06b29cdca2821b7c3e842249a3414c4856774bbe9899bef8e3cacde64f2d2e6d
namespace Erdos993G1

/-- **The injection**: there are at most as many down incidences as up incidences. -/
lemma card_downPairs_le_card_upPairs {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) :
    (downPairs G k).card ≤ (upPairs G k).card := by
  refine Finset.card_le_card_of_injOn (swapMap G) ?_ (swapMap_injOn G hG k)
  rintro ⟨J, u⟩ ha
  rw [Finset.mem_coe] at ha
  exact Finset.mem_coe.mpr (swapMap_mem_upPairs G hG k ha)

end Erdos993G1
-- VERITYOS ENTRY 51 END

-- VERITYOS ENTRY 52 BEGIN lemma Erdos993G1.forest_root_corrected_degree_bound fdb9f93df438bde5358dc4fa3e3d7f8adaa8ea7cdcb0dc77cdf7285f02266f90
namespace Erdos993G1

/-- **(RC), the root-corrected degree lemma**, in incidence form: for every choice of one root
per component (the one supplied by `rootRep`), `D_k + 2·(root incidences) ≤ 2·k·i_k`. -/
lemma forest_root_corrected_degree_bound {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) :
    indepDegreeSum G k + 2 * (rootPairs G k).card
      ≤ 2 * (k * (G.indepSetFinset k).card) := by
  have h1 := card_downPairs_add_card_upPairs G hG k
  have h2 := card_upPairs_add_card_rootPairs G k
  have h3 := card_downPairs_le_card_upPairs G hG k
  omega

end Erdos993G1
-- VERITYOS ENTRY 52 END

-- VERITYOS ENTRY 53 BEGIN lemma Erdos993G1.forest_degree_lemma_nat 82f5db118bc3a13dafa232d50df9092fc50716775d75e53f2e5e9517fd6e3392
namespace Erdos993G1

/-- (DL) at the `ℕ` level, obtained from (RC) by dropping the nonnegative root term. -/
lemma forest_degree_lemma_nat {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) :
    indepDegreeSum G k ≤ 2 * k * (G.indepSetFinset k).card := by
  have h := forest_root_corrected_degree_bound G hG k
  rw [mul_assoc]
  omega

end Erdos993G1
-- VERITYOS ENTRY 53 END

-- VERITYOS ENTRY 54 BEGIN lemma Erdos993G1.forest_degree_lemma b58c762dd29f98aff0861dd8d8b5e1a802d044c223a97ad20dee6ad7afdd7cb3
namespace Erdos993G1

/-- **(DL), the forest degree lemma.** For every finite forest `G` and every `k`, the total
incident degree over independent `k`-sets is at most `2k·i_k(G)`. This is an AVERAGE statement
over `I_k(G)`; it bounds no individual independent set's incident degree.
Mathematics: Fang–Lu–Nevo–Yao–Zheng 2026, §8 (Lemma 8.1, consequence (8.3)). -/
lemma forest_degree_lemma {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) :
    (indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k := by
  have hnat := forest_degree_lemma_nat G hG k
  rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
  exact_mod_cast hnat

end Erdos993G1
-- VERITYOS ENTRY 54 END

-- VERITYOS ENTRY 55 BEGIN theorem Erdos993G1.forest_extension_inequality 9a2d591f475b2f44a5fbf8240b4f603aba15d336cbf04244f28c3e9f628218be
namespace Erdos993G1

/-- **(EX), the forest extension inequality.** For every finite forest `G` and every `k`,
`n · i_k ≤ (k+1) · i_{k+1} + 3k · i_k` in `ℤ`. Acyclicity enters exactly once, through (DL);
the double count and the per-set extension bound are unconditional.
Mathematics: Fang–Lu–Nevo–Yao–Zheng 2026, §8 (the displayed step of Proposition 8.2). -/
theorem forest_extension_inequality {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) :
    (Fintype.card X : ℤ) * Erdos993G1.indepCount G k
      ≤ (k + 1) * Erdos993G1.indepCount G (k + 1) + 3 * k * Erdos993G1.indepCount G k := by
  have hdc := Erdos993G1.double_count (G := G) k
  have hDL := Erdos993G1.forest_degree_lemma G hG k
  have hsum_ge : ∑ J ∈ G.indepSetFinset k,
        ((Fintype.card X : ℤ) - (k : ℤ) - (∑ v ∈ J, G.degree v : ℤ))
      ≤ ∑ J ∈ G.indepSetFinset k, (Erdos993G1.e G J : ℤ) := by
    refine Finset.sum_le_sum (fun J hJ => ?_)
    exact Erdos993G1.e_ge_sub (G := G) k (SimpleGraph.mem_indepSetFinset_iff.mp hJ)
  have hexpand : ∑ J ∈ G.indepSetFinset k,
        ((Fintype.card X : ℤ) - (k : ℤ) - (∑ v ∈ J, G.degree v : ℤ))
      = (Fintype.card X : ℤ) * Erdos993G1.indepCount G k
        - (k : ℤ) * Erdos993G1.indepCount G k - (Erdos993G1.indepDegreeSum G k : ℤ) := by
    simp only [Finset.sum_sub_distrib, Finset.sum_const, nsmul_eq_mul]
    rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
    unfold Erdos993G1.indepDegreeSum
    push_cast
    ring
  rw [hexpand] at hsum_ge
  linarith [hdc, hsum_ge, hDL]

end Erdos993G1
-- VERITYOS ENTRY 55 END

