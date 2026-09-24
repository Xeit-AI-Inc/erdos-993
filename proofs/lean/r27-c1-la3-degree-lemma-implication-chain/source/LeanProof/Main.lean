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

-- VERITYOS ENTRY 4 BEGIN definition Erdos993G1.closedNbhdFinset 94a269d595df84d74617c5bad712b622351848eb632da7c34df3684ef321f51b
/-! ### Definition layer (carried byte-identically from carry-list row 9, `C1-U-03`:
`sources/c1-stage7-sources/U3-Extension.lean` lines 16-37,
SHA-256 116b4f313eedfe4210173226c2f5ef877a6e1ee07061888f4106e908ba6b08a6).
Section and namespace wrappers are context, not bodies. -/

namespace Erdos993G1

section Definitions

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The closed neighbourhood of a finite set `J` of vertices: `J` together with every
neighbour of a vertex of `J`. -/
def closedNbhdFinset (J : Finset X) : Finset X :=
  J ∪ J.biUnion (fun u => G.neighborFinset u)

/-- The extension set of `J`: vertices outside the closed neighbourhood of `J`, i.e. those
`v` with `J ∪ {v}` independent whenever `J` is. -/
def extensionFinset (J : Finset X) : Finset X :=
  Finset.univ \ closedNbhdFinset G J

/-- `e(J)`, the number of extensions of `J`. -/
def e (J : Finset X) : ℕ := (extensionFinset G J).card

/-- The incident degree sum `D_k(G) := Σ_{J ∈ I_k(G)} Σ_{v ∈ J} deg_G(v)`. -/
def indepDegreeSum (k : ℕ) : ℕ :=
  ∑ J ∈ G.indepSetFinset k, ∑ v ∈ J, G.degree v

end Definitions

end Erdos993G1
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition Erdos993G1.DlHyp 63dcbc2d778f2315b972038827d393b9c6b903597fbbe54c0b8b04773029b3a6
/-! ### The four target statements of `SOLUTION-CONTRACT.md` §2, as `Prop` abbreviations.

Each body is the §2 statement text verbatim (`indepDegreeSum`, `firstDescent` and
`Erdos993G1.indepCount`/`coeff`/`delta` resolve inside this namespace to the definitions of
record).  Nothing below asserts any of them: they are hypothesis and conclusion TYPES of the
implication chain that is this award. -/

namespace Erdos993G1

/-- **(DL)** — `SOLUTION-CONTRACT.md` §2 `forest_degree_lemma`. -/
def DlHyp : Prop := ∀ {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj],
  G.IsAcyclic → ∀ k : ℕ, (indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k

end Erdos993G1
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition Erdos993G1.ExHyp 004460974bab462adfd9e322599ef271da9dc231ce6065495887208873a41773
namespace Erdos993G1

/-- **(EX)** — `SOLUTION-CONTRACT.md` §2 `forest_extension_inequality`. -/
def ExHyp : Prop := ∀ {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj],
  G.IsAcyclic → ∀ k : ℕ,
    (Fintype.card X : ℤ) * Erdos993G1.indepCount G k
      ≤ (k + 1) * Erdos993G1.indepCount G (k + 1) + 3 * k * Erdos993G1.indepCount G k

end Erdos993G1
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition Erdos993G1.LbHyp 088244b71297f91e3e71d8d88006443e72e90a1a3b60f673243f3ffcf138f46e
namespace Erdos993G1

/-- **(LB)** — `SOLUTION-CONTRACT.md` §2 `forest_descent_linear_bound`. -/
def LbHyp : Prop := ∀ {X : Type u} [Finite X] (G : SimpleGraph X), G.IsAcyclic → ∀ k : ℕ,
  Erdos993G1.delta G (k : ℤ) < 0 → Nat.card X ≤ 4 * k

end Erdos993G1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition Erdos993G1.R5Hyp ffe90940053b05251eeb3a73256a07511f36a2420e334caa8d243ab5ad5bece8
namespace Erdos993G1

/-- **(R5)** — `SOLUTION-CONTRACT.md` §2 `forest_rank5_ceiling_20`. -/
def R5Hyp : Prop := ∀ {X : Type u} [Finite X] (G : SimpleGraph X), G.IsAcyclic →
  21 ≤ Nat.card X → 0 ≤ Erdos993G1.delta G 5

end Erdos993G1
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition Erdos993G1.XrHyp 1597ea21840dc1aec7a7b12e0ae6371a5a7a06d8d3c0d09e8935b5aa58f1615c
/-! ### First strict descent.  The `def` is carried byte-identically from carry-list row 9
(`U3-Extension.lean` lines 292-297); the existence lemma it consumes is re-derived in-run
(see its docstring).  It shares this registrar entry with `XrHyp` — the only §2 statement
that mentions it — because the registrar orders every `definition` before every `lemma`
and matches an entry's headline declaration on `^def <name>`, which row 9's
`noncomputable def firstDescent ...` (one line) does not present. -/

namespace Erdos993G1

section FirstDescent

/-- `∃ k, Δ_k(G) < 0` for every finite graph.  RE-DERIVED IN-RUN (it is not carry-list
row 9's body): row 9's proof of `exists_delta_neg` calls the r25 award's `lemma` layer
(`indepCount_eq_card_indepSetFinset`, `indepSetFinset_card_le_choose`, `delta_nat`), which the
registrar orders AFTER every `definition`, so a definition-layer existence proof cannot use it.
The argument here is self-contained on Mathlib and the three G1 definitions of record:
`i_0 > 0` (the empty set is an independent `0`-set), `i_{n+1} = 0` (no `(n+1)`-subset of an
`n`-element type), and a monotone chain if no `Δ_k` were negative.  By definitional proof
irrelevance `Nat.find` does not depend on which proof of the existential is supplied, so
`firstDescent` below is the SAME function as row 9's and U1's (carry-list row 19 proves the two
equal by `rfl`). -/
lemma exists_delta_neg {X : Type u} [Finite X] (G : SimpleGraph X) :
    ∃ k : ℕ, Erdos993G1.delta G (k : ℤ) < 0 := by
  classical
  letI := Fintype.ofFinite X
  have hcoeff : ∀ j : ℕ, Erdos993G1.coeff G (j : ℤ) = Erdos993G1.indepCount G j := by
    intro j
    simp [Erdos993G1.coeff]
  have hdelta : ∀ j : ℕ, Erdos993G1.delta G (j : ℤ)
      = Erdos993G1.indepCount G (j + 1) - Erdos993G1.indepCount G j := by
    intro j
    simpa only [Erdos993G1.delta, Nat.cast_add, Nat.cast_one] using
      congrArg₂ (· - ·) (hcoeff (j + 1)) (hcoeff j)
  have hzero : Erdos993G1.indepCount G (Fintype.card X + 1) = 0 := by
    haveI hempty : IsEmpty {S : Finset X // G.IsNIndepSet (Fintype.card X + 1) S} := by
      refine ⟨?_⟩
      rintro ⟨S, hS⟩
      have h1 : S.card = Fintype.card X + 1 := hS.card_eq
      have h2 : S.card ≤ Fintype.card X := by
        simpa [Finset.card_univ] using Finset.card_le_univ S
      omega
    unfold Erdos993G1.indepCount
    simp
  have hpos : 0 < Erdos993G1.indepCount G 0 := by
    have hne : Nonempty {S : Finset X // G.IsNIndepSet 0 S} := by
      refine ⟨⟨∅, ?_, ?_⟩⟩
      · rw [SimpleGraph.isIndepSet_iff]
        simp
      · simp
    unfold Erdos993G1.indepCount
    have := Nat.card_pos (α := {S : Finset X // G.IsNIndepSet 0 S})
    exact_mod_cast this
  by_contra hcon
  push Not at hcon
  have hmono : ∀ j : ℕ, Erdos993G1.indepCount G 0 ≤ Erdos993G1.indepCount G j := by
    intro j
    induction j with
    | zero => exact le_refl _
    | succ m ih =>
        have hstep := hcon m
        have hd := hdelta m
        omega
  have hfinal := hmono (Fintype.card X + 1)
  rw [hzero] at hfinal
  omega

/-- **`firstDescent`**, the run-local definition coordinated with U1 through the contract:
the least natural `k` with `Δ_k(G) < 0` (`SEMANTIC-CONTRACT.md` §1: "To be defined in-run as
`Erdos993G1.firstDescent` ... by `Nat.find`"), stated identically here since U3 cannot read
U1's return. -/
noncomputable def firstDescent {X : Type u} [Finite X] (G : SimpleGraph X) : ℕ := by
  classical exact Nat.find (Erdos993G1.exists_delta_neg G)

end FirstDescent

end Erdos993G1

namespace Erdos993G1

/-- **(XR)** — `SOLUTION-CONTRACT.md` §2 `forest_descent_restriction`. -/
def XrHyp : Prop := ∀ {X : Type u} [Finite X] (G : SimpleGraph X), G.IsAcyclic → ∀ r : ℕ,
  firstDescent G < r → Nat.card X ≤ 4 * r - 4

end Erdos993G1
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma Erdos993G1.indepCount_eq_card_indepSetFinset 4463e7eea65f11f69266095e58b54777ea245aa79caee47bf5b6e3ab77aa0eac
namespace Erdos993G1

lemma indepCount_eq_card_indepSetFinset {V : Type u} [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (k : ℕ) :
    Erdos993G1.indepCount F k = ((F.indepSetFinset k).card : ℤ) := by
  simp only [Erdos993G1.indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
    SimpleGraph.indepSetFinset]

end Erdos993G1
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma Erdos993G1.coeff_nat df2c55481b6ddf4fc4fcce445b787573fca53c0f4fb7599f0e1f5b3330f36da1
namespace Erdos993G1

lemma coeff_nat {V : Type u} (F : SimpleGraph V) (k : ℕ) :
    Erdos993G1.coeff F (k : ℤ) = Erdos993G1.indepCount F k := by
  simp [Erdos993G1.coeff]

end Erdos993G1
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma Erdos993G1.delta_nat c063c49584d30c5e9e7761596f1f323212ddb803b56bea9b3fd8b0027ad38077
namespace Erdos993G1

lemma delta_nat {V : Type u} (F : SimpleGraph V) (k : ℕ) :
    Erdos993G1.delta F (k : ℤ) = Erdos993G1.indepCount F (k + 1) - Erdos993G1.indepCount F k := by
  simpa only [Erdos993G1.delta, Nat.cast_add, Nat.cast_one] using
    congrArg₂ (· - ·) (Erdos993G1.coeff_nat F (k + 1)) (Erdos993G1.coeff_nat F k)

end Erdos993G1
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma Erdos993G1.mem_extensionFinset_iff 26e89f0dc369ab7a305ac456f7c6ccfc5d073eb65b4ae2fbedf64395ebba1b92
/-! ### The unconditional counting core and (EX)-from-(DL), carried byte-identically from
carry-list row 9 (`U3-Extension.lean` lines 39-244: sections `MembershipFacts`,
`DoubleCount`, `ExtensionLowerBound`, `ExtensionInequality`; eleven declarations).
Mathematics: Fang-Lu-Nevo-Yao-Zheng 2026 §8; derivation: r27 seat U3. -/

namespace Erdos993G1

section MembershipFacts

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

end MembershipFacts

section DoubleCount

variable {X : Type u} [Fintype X] [DecidableEq X] {G : SimpleGraph X} [DecidableRel G.Adj]

/-- The double count at the level of `Finset` cardinalities, via the bijection
`(J, v) ↦ (insert v J, v)` between `Σ J ∈ I_k, extension(J)` and `Σ J' ∈ I_{k+1}, J'`. -/
theorem sigma_card_double_count (k : ℕ) :
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

/-- The double count as a sum: `Σ_{J' ∈ I_{k+1}} #J' = (k+1) * #(I_{k+1})`, since every
member of `I_{k+1}` has cardinality `k+1`. -/
theorem sum_card_indepSetFinset_succ (k : ℕ) :
    ∑ J' ∈ G.indepSetFinset (k + 1), J'.card = (k + 1) * (G.indepSetFinset (k + 1)).card := by
  rw [Finset.sum_congr rfl (fun J' hJ' =>
    (SimpleGraph.mem_indepSetFinset_iff.mp hJ').card_eq), Finset.sum_const, smul_eq_mul,
    Nat.mul_comm]

/-- **The double count** (ℕ level): `Σ_{J ∈ I_k} e(J) = (k+1) * #(I_{k+1})`. -/
theorem sum_e_eq_succ_mul_card (k : ℕ) :
    ∑ J ∈ G.indepSetFinset k, e G J = (k + 1) * (G.indepSetFinset (k + 1)).card := by
  have h1 : ∑ J ∈ G.indepSetFinset k, e G J
      = ((G.indepSetFinset k).sigma (fun J => extensionFinset G J)).card := by
    rw [Finset.card_sigma]
    rfl
  have h2 : ((G.indepSetFinset (k + 1)).sigma (fun J => J)).card
      = ∑ J' ∈ G.indepSetFinset (k + 1), J'.card := by
    rw [Finset.card_sigma]
  rw [h1, sigma_card_double_count, h2, sum_card_indepSetFinset_succ]

/-- **The double count** (the contract's ℤ form): `(k+1)·i_{k+1}(G) = Σ_{J ∈ I_k(G)} e(J)`. -/
theorem double_count (k : ℕ) :
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

end DoubleCount

section ExtensionLowerBound

variable {X : Type u} [Fintype X] [DecidableEq X] {G : SimpleGraph X} [DecidableRel G.Adj]

/-- `#(closedNbhdFinset G J) ≤ #J + Σ_{v∈J} deg(v)`: every vertex of the closed neighbourhood
of `J` is either in `J` or a neighbour of some `v ∈ J`. -/
theorem card_closedNbhdFinset_le (J : Finset X) :
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

/-- **(b), subtraction-free form**: `e(J) + #J + Σ_{v∈J} deg(v) ≥ n`. -/
theorem e_add_card_add_degreeSum_ge (J : Finset X) :
    e G J + J.card + ∑ v ∈ J, G.degree v ≥ Fintype.card X := by
  have hsub : closedNbhdFinset G J ⊆ (Finset.univ : Finset X) := Finset.subset_univ _
  have hsplit : (extensionFinset G J).card + (closedNbhdFinset G J).card
      = Fintype.card X := by
    have := Finset.card_sdiff_add_card_eq_card hsub
    simpa [extensionFinset, Finset.card_univ] using this
  have hbound := card_closedNbhdFinset_le (G := G) J
  have hecard : e G J = (extensionFinset G J).card := rfl
  omega

/-- **(b), the contract's `ℤ` form**: `e(J) ≥ n − k − Σ_{v∈J} deg(v)` for `J` an independent
`k`-set. -/
theorem e_ge_sub (k : ℕ) {J : Finset X} (hJ : G.IsNIndepSet k J) :
    (e G J : ℤ) ≥ (Fintype.card X : ℤ) - (k : ℤ) - (∑ v ∈ J, G.degree v : ℤ) := by
  have hnat := e_add_card_add_degreeSum_ge (G := G) J
  rw [hJ.card_eq] at hnat
  have hcast : ((e G J + k + ∑ v ∈ J, G.degree v : ℕ) : ℤ) ≥ (Fintype.card X : ℤ) := by
    exact_mod_cast hnat
  push_cast at hcast
  linarith

end ExtensionLowerBound

section ExtensionInequality

variable {X : Type u} [Fintype X] [DecidableEq X] {G : SimpleGraph X} [DecidableRel G.Adj]

/-- **(c) (EX), from (DL) taken as a hypothesis** (subtraction-free `ℤ` form, exactly
`SOLUTION-CONTRACT.md` §2 `forest_extension_inequality`). The (DL) hypothesis is stated
exactly as its §2 `forest_degree_lemma` conclusion at this same `k`, so this composes with a
proof of (DL) supplied elsewhere (T1/U2's route). -/
theorem forest_extension_inequality (k : ℕ)
    (hDL : (indepDegreeSum G k : ℤ) ≤ 2 * (k : ℤ) * Erdos993G1.indepCount G k) :
    (Fintype.card X : ℤ) * Erdos993G1.indepCount G k
      ≤ ((k : ℤ) + 1) * Erdos993G1.indepCount G (k + 1)
        + 3 * (k : ℤ) * Erdos993G1.indepCount G k := by
  have hdc := double_count (G := G) k
  have hsum_ge : ∑ J ∈ G.indepSetFinset k,
        ((Fintype.card X : ℤ) - (k : ℤ) - (∑ v ∈ J, G.degree v : ℤ))
      ≤ ∑ J ∈ G.indepSetFinset k, (e G J : ℤ) := by
    apply Finset.sum_le_sum
    intro J hJ
    exact e_ge_sub (G := G) k (SimpleGraph.mem_indepSetFinset_iff.mp hJ)
  have hexpand : ∑ J ∈ G.indepSetFinset k,
        ((Fintype.card X : ℤ) - (k : ℤ) - (∑ v ∈ J, G.degree v : ℤ))
      = (Fintype.card X : ℤ) * Erdos993G1.indepCount G k - (k : ℤ) * Erdos993G1.indepCount G k
        - (indepDegreeSum G k : ℤ) := by
    simp only [Finset.sum_sub_distrib, Finset.sum_const, nsmul_eq_mul]
    rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
    unfold indepDegreeSum
    push_cast
    ring
  rw [hexpand] at hsum_ge
  linarith [hdc, hsum_ge, hDL]

end ExtensionInequality

end Erdos993G1
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma Erdos993G1.pos_indepCount_of_delta_neg 418beecfd5ca90332c61611e639d3741703da5bb1c8eba21f251b44e15450079
namespace Erdos993G1

/-- `Δ_k(G) < 0 → 0 < i_k(G)`.  RE-DERIVED IN-RUN under the name carry-list row 10's
body calls (`Erdos993G1.pos_indepCount_of_delta_neg`).  That name was first stated in carry-list
row 6 (U1's file, `sources/c1-stage7-sources/U1-Main.lean`, SHA-256
8cc381f413e6b5533995a362f4f38f4930d99119e8eece9a5f1cc323a62dea0d), which IS a member of this
capsule and was read.  Row 6 is NOT on the brief's byte-identical carry list, which names rows
9, 10, 11, 12, 15, 16 and 19, and the synthesis's carry condition (i) admits U1's file as
statements of record only; so the NAME is row 6's and the BODY is written here, from `delta_nat`
and the nonnegativity of `indepCount`.  U1's own body is stated at `{V : Type v}` with no
finiteness binder; this one is stated at the `[Finite X]` carrier that row 10's `critic_lb_of_ex`
works in. -/
lemma pos_indepCount_of_delta_neg {X : Type u} [Finite X] (G : SimpleGraph X) (k : ℕ)
    (hneg : Erdos993G1.delta G (k : ℤ) < 0) : 0 < Erdos993G1.indepCount G k := by
  classical
  letI := Fintype.ofFinite X
  have hd := Erdos993G1.delta_nat G k
  have hge0 : (0 : ℤ) ≤ Erdos993G1.indepCount G (k + 1) := by
    rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
    exact_mod_cast Nat.zero_le _
  omega

/-- `firstDescent` is itself a descent: `Δ_{firstDescent G}(G) < 0`. -/
theorem delta_firstDescent_neg {X : Type u} [Finite X] (G : SimpleGraph X) :
    Erdos993G1.delta G ((Erdos993G1.firstDescent G : ℕ) : ℤ) < 0 := by
  classical exact Nat.find_spec (Erdos993G1.exists_delta_neg G)

/-- `firstDescent_spec`, the name carry-list row 10's `critic_xr_of_lb` calls for the fact that
`firstDescent` is a descent.  The name is again row 6's (U1's file, SHA-256
8cc381f413e6b5533995a362f4f38f4930d99119e8eece9a5f1cc323a62dea0d — a capsule member, read, but
not on the brief's byte-identical carry list).  U1's body there is
`Nat.find_spec (Erdos993G1.firstDescent_exists G)`, against U1's own `firstDescent` and
`firstDescent_exists`, neither of which this run registers (the definition of record here is
carry-list row 9's), so that body could not have been carried in any case.  Re-derived here as an
alias of row 9's `Erdos993G1.delta_firstDescent_neg` above. -/
lemma firstDescent_spec {X : Type u} [Finite X] (G : SimpleGraph X) :
    Erdos993G1.delta G ((Erdos993G1.firstDescent G : ℕ) : ℤ) < 0 :=
  Erdos993G1.delta_firstDescent_neg G

end Erdos993G1
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma Erdos993G1.ex_of_dl 3cbd3336982b00c4039378638121ec74ffa676b308182a0a94d9b19fdee4c723
namespace Erdos993G1

/-- **(DL) ⇒ (EX)**, at the frozen §2 statement types.  Authored in-run; the mathematical
content is carry-list row 9's `forest_extension_inequality` (double count + the `e(J)` bound),
independently re-derived by critic `C-U1-T` (row 10, `critic_ex_of_dl`). -/
lemma ex_of_dl (hDL : DlHyp.{u}) : ExHyp.{u} := by
  intro X _ _ G _ hG k
  exact Erdos993G1.forest_extension_inequality k (hDL G hG k)

end Erdos993G1
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma Erdos993G1.lb_of_ex dcf3652415e5501f3f1f34d93c90f82bcfdcb564298546e0a01cfbd34bf7c5ad
/-! ### (EX) ⇒ (LB), (LB) ⇒ (R5), (LB) ⇒ (XR).  The three deduction bodies are carried
byte-identically from carry-list row 10 (critic `C-U1-T`,
`sources/c1-stage7-sources/C-U1-T-CriticAdvances.lean`, SHA-256
41dae810663a4ae1c680afac7bacc0824351f94858e89f5da32fdd51c112515a): lines 179-209, 211-218,
220-226.  The `Prop`-to-`Prop` wrappers around them are authored in-run. -/

namespace Erdos993G1

universe w

/-- CRITIC ADVANCE 1: (LB) from (EX), across the `Fintype`/`Finite` carrier change. -/
theorem critic_lb_of_ex (hEX : ExHyp.{w}) {X : Type w} [Finite X] (G : SimpleGraph X)
    (hG : G.IsAcyclic) (k : ℕ) (hneg : Erdos993G1.delta G (k : ℤ) < 0) :
    Nat.card X ≤ 4 * k := by
  classical
  letI := Fintype.ofFinite X
  have hpos : 0 < Erdos993G1.indepCount G k := Erdos993G1.pos_indepCount_of_delta_neg G k hneg
  have hd := Erdos993G1.delta_nat G k
  have hlt : Erdos993G1.indepCount G (k + 1) < Erdos993G1.indepCount G k := by omega
  have hex := hEX G hG k
  have hcard : (Nat.card X : ℤ) = (Fintype.card X : ℤ) := by
    rw [Nat.card_eq_fintype_card]
  -- n * i_k ≤ (k+1) * i_{k+1} + 3k * i_k ≤ (k+1) * (i_k - 1) + 3k * i_k < (4k+1) * i_k
  have hstep : ((k : ℤ) + 1) * Erdos993G1.indepCount G (k + 1)
      ≤ ((k : ℤ) + 1) * (Erdos993G1.indepCount G k - 1) := by
    have : Erdos993G1.indepCount G (k + 1) ≤ Erdos993G1.indepCount G k - 1 := by omega
    exact mul_le_mul_of_nonneg_left this (by positivity)
  have hmain : (Nat.card X : ℤ) * Erdos993G1.indepCount G k
      < (4 * (k : ℤ) + 1) * Erdos993G1.indepCount G k := by
    have hk1 : (0:ℤ) < (k : ℤ) + 1 := by positivity
    calc (Nat.card X : ℤ) * Erdos993G1.indepCount G k
        = (Fintype.card X : ℤ) * Erdos993G1.indepCount G k := by rw [hcard]
      _ ≤ ((k:ℤ) + 1) * Erdos993G1.indepCount G (k + 1)
            + 3 * (k:ℤ) * Erdos993G1.indepCount G k := hex
      _ ≤ ((k:ℤ) + 1) * (Erdos993G1.indepCount G k - 1)
            + 3 * (k:ℤ) * Erdos993G1.indepCount G k := by linarith
      _ < (4 * (k:ℤ) + 1) * Erdos993G1.indepCount G k := by nlinarith
  have hfinal : (Nat.card X : ℤ) < 4 * (k : ℤ) + 1 :=
    lt_of_mul_lt_mul_right (by linarith [hmain]) (le_of_lt hpos)
  have : (Nat.card X : ℤ) ≤ 4 * (k : ℤ) := by omega
  exact_mod_cast this

/-- **(EX) ⇒ (LB)** at the frozen §2 statement types. -/
lemma lb_of_ex (hEX : ExHyp.{u}) : LbHyp.{u} := by
  intro X _ G hG k hneg
  exact Erdos993G1.critic_lb_of_ex hEX G hG k hneg

end Erdos993G1
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma Erdos993G1.r5_of_lb e28fb6d6dffd772973e594af4c76dc47db12fe8decaf7a30f95f4d01fb24f502
namespace Erdos993G1

/-- CRITIC ADVANCE 2: (R5) from (LB) at `k = 5` (the `(5 : ℤ)` literal / `((5:ℕ) : ℤ)` cast bridge). -/
theorem critic_r5_of_lb (hLB : LbHyp.{w}) {X : Type w} [Finite X] (G : SimpleGraph X)
    (hG : G.IsAcyclic) (hn : 21 ≤ Nat.card X) : 0 ≤ Erdos993G1.delta G 5 := by
  by_contra hcon
  push_neg at hcon
  have h5 : Erdos993G1.delta G ((5 : ℕ) : ℤ) < 0 := by exact_mod_cast hcon
  have := hLB G hG 5 h5
  omega

/-- **(LB) ⇒ (R5)** at the frozen §2 statement types. -/
lemma r5_of_lb (hLB : LbHyp.{u}) : R5Hyp.{u} := by
  intro X _ G hG hn
  exact Erdos993G1.critic_r5_of_lb hLB G hG hn

end Erdos993G1
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma Erdos993G1.xr_of_lb b125da425dbac191cb0ca31387f2ec06e1a4f3b1ce2e915e17758f021d8386f5
namespace Erdos993G1

/-- CRITIC ADVANCE 3: (XR) from (LB) at `k = firstDescent G`, with the `4 * r - 4`
ℕ-truncation audited (`hx : firstDescent G < r` forces `1 ≤ r`). -/
theorem critic_xr_of_lb (hLB : LbHyp.{w}) {X : Type w} [Finite X] (G : SimpleGraph X)
    (hG : G.IsAcyclic) (r : ℕ) (hx : firstDescent G < r) : Nat.card X ≤ 4 * r - 4 := by
  have hspec := firstDescent_spec G
  have hb := hLB G hG (firstDescent G) hspec
  omega

/-- **(LB) ⇒ (XR)** at the frozen §2 statement types. -/
lemma xr_of_lb (hLB : LbHyp.{u}) : XrHyp.{u} := by
  intro X _ G hG r hx
  exact Erdos993G1.critic_xr_of_lb hLB G hG r hx

end Erdos993G1
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN theorem Erdos993G1.degree_lemma_implies_chain 945e1102202f0559cd45f37664ddef113677b600fd6e1cf5b5ee8fe7e7fcfef3
namespace Erdos993G1

/-! Anti-drift test of record (synthesis carry condition (ii)): each `Prop` abbreviation is
inhabited by the §2 declaration's OWN binder form, written exactly as `SOLUTION-CONTRACT.md` §2
states it.  These `example`s are kernel-checked conversions, so no §2 statement can drift from
its abbreviation without this file failing to compile.  They assert nothing: each takes the §2
declaration as a hypothesis. -/

example (forest_degree_lemma :
    ∀ {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
      [DecidableRel G.Adj] (_hG : G.IsAcyclic) (k : ℕ),
      (indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k) : DlHyp.{u} := by
  intro X _ _ G _ hG k
  exact forest_degree_lemma G hG k

example (forest_extension_inequality :
    ∀ {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
      [DecidableRel G.Adj] (_hG : G.IsAcyclic) (k : ℕ),
      (Fintype.card X : ℤ) * Erdos993G1.indepCount G k
        ≤ (k + 1) * Erdos993G1.indepCount G (k + 1) + 3 * k * Erdos993G1.indepCount G k) :
    ExHyp.{u} := by
  intro X _ _ G _ hG k
  exact forest_extension_inequality G hG k

example (forest_descent_linear_bound :
    ∀ {X : Type u} [Finite X] (G : SimpleGraph X) (_hG : G.IsAcyclic) (k : ℕ)
      (_hneg : Erdos993G1.delta G (k : ℤ) < 0), Nat.card X ≤ 4 * k) : LbHyp.{u} := by
  intro X _ G hG k hneg
  exact forest_descent_linear_bound G hG k hneg

example (forest_rank5_ceiling_20 :
    ∀ {X : Type u} [Finite X] (G : SimpleGraph X) (_hG : G.IsAcyclic)
      (_hn : 21 ≤ Nat.card X), 0 ≤ Erdos993G1.delta G 5) : R5Hyp.{u} := by
  intro X _ G hG hn
  exact forest_rank5_ceiling_20 G hG hn

example (forest_descent_restriction :
    ∀ {X : Type u} [Finite X] (G : SimpleGraph X) (_hG : G.IsAcyclic) (r : ℕ)
      (_hx : firstDescent G < r), Nat.card X ≤ 4 * r - 4) : XrHyp.{u} := by
  intro X _ G hG r hx
  exact forest_descent_restriction G hG r hx

/-- **`C1-LA3` — the implication chain.**  The degree lemma (DL), stated exactly as
`SOLUTION-CONTRACT.md` §2 `forest_degree_lemma`, implies the extension inequality (EX), the
linear descent-order bound (LB), the rank-5 ceiling (R5) and the descent restriction (XR),
each stated exactly as its own §2 declaration.

THIS DECLARATION IS AN IMPLICATION.  It asserts none of (DL), (EX), (LB), (R5), (XR); those
four consequents stay `conditional` until an unconditional (DL) lands (award `C1-LA1`).  The
hypothesis quantifies over `Fintype`/`Finite` INSTANCES (critic `C-U3-F`'s caveat): a (DL)
proved at one fixed `Fintype` instance would not compose here.

Attribution: Fang-Lu-Nevo-Yao-Zheng 2026 §8 for (DL) and (EX); the literature map
(FRESH-LEAD, lane 11) for the conditional deductions (LB), (R5), (XR); r27 critics `C-U1-T`,
`C-U3-T`, `C-U3-F`, `C-U1-F` and seat U3 for the derivations carried here; the U adjudicator
for the `firstDescent` reconciliation.

Fences: no no-recovery reading; (XR) is not a uniform bound on `d`; the `r = 0` truncation of
`4 * r - 4` is vacuous-hypothesis-sound, not arithmetic. -/
theorem degree_lemma_implies_chain :
    DlHyp.{u} → ExHyp.{u} ∧ LbHyp.{u} ∧ R5Hyp.{u} ∧ XrHyp.{u} := by
  intro hDL
  have hEX : ExHyp.{u} := Erdos993G1.ex_of_dl hDL
  have hLB : LbHyp.{u} := Erdos993G1.lb_of_ex hEX
  exact ⟨hEX, hLB, Erdos993G1.r5_of_lb hLB, Erdos993G1.xr_of_lb hLB⟩

end Erdos993G1
-- VERITYOS ENTRY 19 END

