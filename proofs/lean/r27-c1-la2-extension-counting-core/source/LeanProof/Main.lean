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

-- VERITYOS ENTRY 4 BEGIN definition Erdos993G1.closedNbhdFinset cd7b02bbb9e1f54197bb4393f553dc9356c77804c15dc5eb7f07fe0792b1ddff
namespace Erdos993G1

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The closed neighbourhood of a finite set `J` of vertices: `J` together with every
neighbour of a vertex of `J`. -/
def closedNbhdFinset (J : Finset X) : Finset X :=
  J ∪ J.biUnion (fun u => G.neighborFinset u)

end Erdos993G1
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition Erdos993G1.extensionFinset 98167bde3acb58689604d2b5d11f32e099963b6a6d847bef7d1e31c0232f5707
namespace Erdos993G1

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The extension set of `J`: vertices outside the closed neighbourhood of `J`, i.e. those
`v` with `J ∪ {v}` independent whenever `J` is. -/
def extensionFinset (J : Finset X) : Finset X :=
  Finset.univ \ closedNbhdFinset G J

end Erdos993G1
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition Erdos993G1.e c3576e8aafb3ad1ecac91b193eb2ece93cade71ee367c2f0f18a8ac166e51481
namespace Erdos993G1

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- `e(J)`, the number of extensions of `J`. -/
def e (J : Finset X) : ℕ := (extensionFinset G J).card

end Erdos993G1
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition Erdos993G1.indepDegreeSum 54bedd8a2a64d672f14837e8e96231d575a7b9cd93a42453130a3fa1d04bc9ec
namespace Erdos993G1

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The incident degree sum `D_k(G) := Σ_{J ∈ I_k(G)} Σ_{v ∈ J} deg_G(v)`. -/
def indepDegreeSum (k : ℕ) : ℕ :=
  ∑ J ∈ G.indepSetFinset k, ∑ v ∈ J, G.degree v

end Erdos993G1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition Erdos993G1.firstDescent 0ccd1036c077f1c40df3a2c1e2260b25f49f65a6fde2063d2bdd96fce103ec8d
namespace Erdos993G1

/-- `x(G)`, the **first strict descent** of a finite graph: the least natural `k` with
`Δ_k(G) < 0` (`SEMANTIC-CONTRACT.md` §1). Written here as the infimum of the set of strict
descents; on `ℕ` that infimum is `Nat.find` applied to a proof that the set is nonempty
(`Nat.sInf_def`), which is the form the semantic contract names. This run-local definition is
recorded for the contract's definition layer only: no declaration of this award depends on it
and nothing is claimed about it beyond the definition itself. -/
noncomputable
def firstDescent {X : Type u} [Finite X] (G : SimpleGraph X) : ℕ :=
  sInf {k : ℕ | Erdos993G1.delta G (k : ℤ) < 0}

end Erdos993G1
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN lemma Erdos993G1.indepCount_eq_card_indepSetFinset 4463e7eea65f11f69266095e58b54777ea245aa79caee47bf5b6e3ab77aa0eac
namespace Erdos993G1

lemma indepCount_eq_card_indepSetFinset {V : Type u} [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (k : ℕ) :
    Erdos993G1.indepCount F k = ((F.indepSetFinset k).card : ℤ) := by
  simp only [Erdos993G1.indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
    SimpleGraph.indepSetFinset]

end Erdos993G1
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma Erdos993G1.mem_extensionFinset_iff b2b5d06c64d10d0251bffd5e17b2fdaa18b46804b1e7b35bb0b1078cf6d56fc1
namespace Erdos993G1

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

end Erdos993G1
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma Erdos993G1.isNIndepSet_insert_of_mem_extensionFinset 29cadf3157ff850df750399b7c20b73ad0c0fc573cadb41246d50937c8988c9f
namespace Erdos993G1

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

end Erdos993G1
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma Erdos993G1.isNIndepSet_erase_and_mem_extensionFinset f272e215c6c3ff23ea45de1cb4d97fd46e6a5e5846872f99733556e6a54a9667
namespace Erdos993G1

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

end Erdos993G1
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma Erdos993G1.sigma_card_double_count 4890fab635992e65b4f611b740729d4cf26554eb3874d3fa68d3bba224bb63cb
namespace Erdos993G1

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

end Erdos993G1
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma Erdos993G1.sum_card_indepSetFinset_succ f2e5389c2b1a7df187b58422d6f56be5fd12943ebf9ce709b78bc4294264b728
namespace Erdos993G1

variable {X : Type u} [Fintype X] [DecidableEq X] {G : SimpleGraph X} [DecidableRel G.Adj]

/-- The double count as a sum: `Σ_{J' ∈ I_{k+1}} #J' = (k+1) * #(I_{k+1})`, since every
member of `I_{k+1}` has cardinality `k+1`. -/
lemma sum_card_indepSetFinset_succ (k : ℕ) :
    ∑ J' ∈ G.indepSetFinset (k + 1), J'.card = (k + 1) * (G.indepSetFinset (k + 1)).card := by
  rw [Finset.sum_congr rfl (fun J' hJ' =>
    (SimpleGraph.mem_indepSetFinset_iff.mp hJ').card_eq), Finset.sum_const, smul_eq_mul,
    Nat.mul_comm]

end Erdos993G1
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma Erdos993G1.sum_e_eq_succ_mul_card 16966da037614ae543e50d10e19aa30152f9991cc8d0cce7ea982bb0481a75a9
namespace Erdos993G1

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

end Erdos993G1
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma Erdos993G1.double_count f123431dbbf223ed714d031ab21d11dfc85c45c362794f02bf001ff352a24351
namespace Erdos993G1

/-- **The double count** (`C1-LA2`, first award-face declaration; the synthesis `## Lean awards`
statement of record): `(k+1)·i_{k+1}(G) = Σ_{J ∈ I_k(G)} e(J)` in `ℤ`, for every finite graph.
Hypotheses are `[Fintype X] [DecidableEq X] [DecidableRel G.Adj]` only: there is **no acyclicity
hypothesis**. Mathematics: Fang–Lu–Nevo–Yao–Zheng 2026, §8 (8.1), the extension method (classical).
Derivation in this run: seat `U3` (compiled), independently re-derived by critic `C-U1-T`, replayed
by the `U` adjudicator. The binders are written out on the face so that the statement is exactly the
synthesis's, with `G` explicit. -/
lemma double_count {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ) :
    ((k : ℤ) + 1) * Erdos993G1.indepCount G (k + 1) = ∑ J ∈ G.indepSetFinset k, (Erdos993G1.e G J : ℤ) := by
  have hnat := sum_e_eq_succ_mul_card (G := G) k
  have hcast : ((∑ J ∈ G.indepSetFinset k, e G J : ℕ) : ℤ)
      = ∑ J ∈ G.indepSetFinset k, (e G J : ℤ) := by
    push_cast
    rfl
  rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
  have := congrArg (fun n : ℕ => (n : ℤ)) hnat
  push_cast at this
  linarith [this, hcast]

end Erdos993G1
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma Erdos993G1.card_closedNbhdFinset_le 1872734f778eec5c7536cef4e49d7302e263d312120b5a1152b492b4ea9cb325
namespace Erdos993G1

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

end Erdos993G1
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma Erdos993G1.e_add_card_add_degreeSum_ge ef02ff2f0e526b6afd3d5ff092f776491b3c0b1a30041a399050aa8b2548e720
namespace Erdos993G1

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

end Erdos993G1
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN theorem Erdos993G1.e_ge_sub e3eec15eac5c8e9b6de24a81537a8daeb7e6a39e2e96a1058f29d28d1f602a09
namespace Erdos993G1

/-- **The extension lower bound** (`C1-LA2`, terminal award-face declaration; the synthesis
`## Lean awards` statement of record): for an independent `k`-set `J` in a finite graph,
`e(J) ≥ n − k − Σ_{v ∈ J} deg(v)` in `ℤ`. Hypotheses are `[Fintype X] [DecidableEq X]
[DecidableRel G.Adj]` and `hJ` only: there is **no acyclicity hypothesis**. Mathematics:
Fang–Lu–Nevo–Yao–Zheng 2026, §8 (the step `|N[J]| ≤ k + Σ deg`). Derivation in this run: seat
`U3` (compiled), independently re-derived by critic `C-U1-T`, replayed by the `U` adjudicator.
This is a graph-general fact: it is not a forest statement, it transfers no status, and it is not
evidence for (DL) or (EX). -/
theorem e_ge_sub {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ) {J : Finset X} (hJ : G.IsNIndepSet k J) :
    (Erdos993G1.e G J : ℤ) ≥ (Fintype.card X : ℤ) - (k : ℤ) - (∑ v ∈ J, G.degree v : ℤ) := by
  have hnat := e_add_card_add_degreeSum_ge (G := G) J
  rw [hJ.card_eq] at hnat
  have hcast : ((e G J + k + ∑ v ∈ J, G.degree v : ℕ) : ℤ) ≥ (Fintype.card X : ℤ) := by
    exact_mod_cast hnat
  push_cast at hcast
  linarith

end Erdos993G1
-- VERITYOS ENTRY 19 END

