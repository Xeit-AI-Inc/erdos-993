import Mathlib
import Mathlib.Data.Fintype.Powerset
import Mathlib.Data.Fintype.Pi

open scoped BigOperators
open Finset Polynomial SimpleGraph

namespace C8U2BoundaryFactorization

variable {V ι : Type*} [Fintype V] [DecidableEq V]
  [Fintype ι] [DecidableEq ι]

/-- A finite weight enumerator, used to keep the combinatorial bijection
separate from polynomial algebra. -/
noncomputable def weightEnumerator (α : Type*) [Fintype α] (w : α → ℕ) :
    Polynomial ℤ := by
  classical
  exact ∑ a, X ^ w a

lemma weightEnumerator_equiv {α β : Type*} [Fintype α] [Fintype β]
    (w : α → ℕ) (v : β → ℕ) (e : α ≃ β)
    (hw : ∀ a, w a = v (e a)) :
    weightEnumerator α w = weightEnumerator β v := by
  classical
  unfold weightEnumerator
  rw [← e.sum_comp]
  exact Fintype.sum_congr _ _ fun a => by rw [hw]

lemma weightEnumerator_sigma {α : Type*} (β : α → Type*)
    [Fintype α] [∀ a, Fintype (β a)] (w : ∀ a, β a → ℕ) :
    weightEnumerator (Σ a, β a) (fun z => w z.1 z.2) =
      ∑ a, weightEnumerator (β a) (w a) := by
  classical
  simp [weightEnumerator, Fintype.sum_sigma]

lemma weightEnumerator_prod {α β : Type*} [Fintype α] [Fintype β]
    (w : α → ℕ) (v : β → ℕ) :
    weightEnumerator (α × β) (fun z => w z.1 + v z.2) =
      weightEnumerator α w * weightEnumerator β v := by
  classical
  unfold weightEnumerator
  rw [Fintype.sum_prod_type, Finset.sum_mul]
  simp [Finset.mul_sum, pow_add]

lemma weightEnumerator_pi {α : Type*} (β : α → Type*)
    [Fintype α] [DecidableEq α] [∀ a, Fintype (β a)] (w : ∀ a, β a → ℕ) :
    weightEnumerator ((a : α) → β a) (fun f => ∑ a, w a (f a)) =
      ∏ a, weightEnumerator (β a) (w a) := by
  classical
  unfold weightEnumerator
  rw [Fintype.prod_sum]
  exact Fintype.sum_congr _ _ fun f => by
    simpa using
      (Finset.prod_pow_eq_pow_sum (Finset.univ : Finset α)
        (fun a => w a (f a)) (X : Polynomial ℤ)).symm

/-- Independent vertex sets contained in a labelled vertex set `U`. -/
abbrev IndependentSetOn (T : SimpleGraph V) (U : Finset V) :=
  {A : Finset V // A ⊆ U ∧ T.IsIndepSet (A : Set V)}

noncomputable instance (T : SimpleGraph V) (U : Finset V) :
    Fintype (IndependentSetOn T U) := by
  classical
  letI : Fintype (Finset V) := Finset.fintype
  letI : Finite (IndependentSetOn T U) :=
    Finite.of_injective Subtype.val Subtype.val_injective
  exact Fintype.ofFinite _

/-- The independence polynomial of the induced graph on `U`, over `ℤ`. -/
noncomputable def independencePolynomialOn (T : SimpleGraph V) (U : Finset V) :
    Polynomial ℤ :=
  by
    classical
    exact ∑ A : IndependentSetOn T U, X ^ A.1.card

lemma independencePolynomialOn_eq_weightEnumerator (T : SimpleGraph V)
    (U : Finset V) :
    independencePolynomialOn T U =
      weightEnumerator (IndependentSetOn T U) (fun A => A.1.card) := by
  classical
  unfold independencePolynomialOn weightEnumerator
  apply Fintype.sum_congr
  intro A
  rfl

/-- Integer-rank zero extension of independent-set coefficients. -/
noncomputable def independentSetCountOn (T : SimpleGraph V) (U : Finset V)
    (r : ℤ) : ℤ :=
  if 0 ≤ r then (independencePolynomialOn T U).coeff r.toNat else 0

/-- A finite family exactly presents the connected components of `T[V \ S]`.
The clauses say that the blocks are nonempty connected residual sets, every
residual vertex belongs to exactly one block, and distinct blocks have no edge. -/
structure ResidualComponents (T : SimpleGraph V) (S : Finset V)
    (C : ι → Finset V) : Prop where
  nonempty : ∀ j, (C j).Nonempty
  outside : ∀ j, C j ⊆ Sᶜ
  coverUnique : ∀ v, v ∉ S → ∃! j, v ∈ C j
  connected : ∀ j, (T.induce (C j : Set V)).Connected
  noAdj : ∀ {j k}, j ≠ k → ∀ {x y}, x ∈ C j → y ∈ C k → ¬T.Adj x y

/-- The boundary-edge predicate, oriented from a residual component to `S`. -/
def IsBoundaryPair (T : SimpleGraph V) (S : Finset V) (C : ι → Finset V)
    (j : ι) (p : V × V) : Prop :=
  p.1 ∈ C j ∧ p.2 ∈ S ∧ T.Adj p.1 p.2

lemma exists_boundary_pair (T : SimpleGraph V) (S : Finset V)
    (C : ι → Finset V) (hT : T.Connected) (hS : S.Nonempty)
    (hC : ResidualComponents T S C) (j : ι) :
    ∃ p : V × V, IsBoundaryPair T S C j p := by
  classical
  by_contra hnone
  have hnone' : ∀ p : V × V, ¬IsBoundaryPair T S C j p := by
    simpa only [not_exists] using hnone
  obtain ⟨x, hxC⟩ := hC.nonempty j
  obtain ⟨s, hsS⟩ := hS
  have closed : ∀ {u v : V}, u ∈ C j → T.Adj u v → v ∈ C j := by
    intro u v huC huv
    by_cases hvS : v ∈ S
    · exact (hnone' (u, v) ⟨huC, hvS, huv⟩).elim
    · obtain ⟨k, hvCk, -⟩ := hC.coverUnique v hvS
      by_cases hkj : k = j
      · simpa [hkj] using hvCk
      · exact (hC.noAdj (Ne.symm hkj) huC hvCk huv).elim
  have walk_closed : ∀ {u v : V} (p : T.Walk u v), u ∈ C j → v ∈ C j := by
    intro u v p
    induction p with
    | nil => intro hu; exact hu
    | cons hadj p ih =>
        intro hu
        exact ih (closed hu hadj)
  obtain ⟨p⟩ := hT x s
  have hsC : s ∈ C j := walk_closed p hxC
  exact (Finset.mem_compl.mp (hC.outside j hsC)) hsS

lemma mem_of_mem_support_map_induce (T : SimpleGraph V) (U : Set V)
    {a b : U} (p : (T.induce U).Walk a b) {v : V}
    (hv : v ∈ (p.map (SimpleGraph.Embedding.induce (G := T) U).toHom).support) :
    v ∈ U := by
  rw [Walk.support_map, List.mem_map] at hv
  obtain ⟨z, -, hz⟩ := hv
  rw [← hz]
  exact z.property

lemma boundary_pair_unique (T : SimpleGraph V) (S : Finset V)
    (C : ι → Finset V) (hAcyc : T.IsAcyclic)
    (hSconn : (T.induce (S : Set V)).Connected)
    (hC : ResidualComponents T S C) (j : ι)
    (p q : V × V) (hp : IsBoundaryPair T S C j p)
    (hq : IsBoundaryPair T S C j q) : p = q := by
  classical
  rcases p with ⟨x, h⟩
  rcases q with ⟨y, k⟩
  rcases hp with ⟨hxC, hhS, hxh⟩
  rcases hq with ⟨hyC, hkS, hyk⟩
  by_contra hpq
  let xC : {v // v ∈ (C j : Set V)} := ⟨x, hxC⟩
  let yC : {v // v ∈ (C j : Set V)} := ⟨y, hyC⟩
  obtain ⟨wCsub⟩ := (hC.connected j) xC yC
  let wC :=
    wCsub.map (SimpleGraph.Embedding.induce (G := T) (C j : Set V)).toHom
  let kS : {v // v ∈ (S : Set V)} := ⟨k, hkS⟩
  let hS : {v // v ∈ (S : Set V)} := ⟨h, hhS⟩
  obtain ⟨wSsub⟩ := hSconn kS hS
  let wS :=
    wSsub.map (SimpleGraph.Embedding.induce (G := T) (S : Set V)).toHom
  let w := (wC.concat hyk).append wS
  have hyval :
      (SimpleGraph.Embedding.induce (G := T) (C j : Set V)).toHom yC = y := rfl
  have hedge : s(x, h) ∈ w.edges :=
    (isBridge_iff_forall_walk_mem_edges.mp
      (isAcyclic_iff_forall_adj_isBridge.mp hAcyc hxh)) w
  have hedge' : (s(x, h) ∈ wC.edges ∨ s(x, h) = s(y, k)) ∨
      s(x, h) ∈ wS.edges := by
    dsimp only [w] at hedge
    rw [Walk.edges_append, Walk.edges_concat] at hedge
    simp only [List.mem_append, List.concat_eq_append, List.mem_singleton, hyval] at hedge
    exact hedge
  rcases hedge' with ((hwC | heq) | hwS)
  · have hhmem : h ∈ wC.support := wC.snd_mem_support_of_mem_edges hwC
    dsimp only [wC] at hhmem
    have hhC : h ∈ C j := mem_of_mem_support_map_induce T (C j : Set V) wCsub hhmem
    exact (Finset.mem_compl.mp (hC.outside j hhC)) hhS
  · rcases Sym2.eq_iff.mp heq with (⟨hxy, hhk⟩ | ⟨hxk, hhy⟩)
    · exact hpq (Prod.ext hxy hhk)
    · subst k
      exact (Finset.mem_compl.mp (hC.outside j hxC)) hkS
  · have hxmem : x ∈ wS.support := wS.fst_mem_support_of_mem_edges hwS
    dsimp only [wS] at hxmem
    have hxS : x ∈ S := mem_of_mem_support_map_induce T (S : Set V) wSsub hxmem
    exact (Finset.mem_compl.mp (hC.outside j hxC)) hxS

theorem existsUnique_boundary_pair (T : SimpleGraph V) (S : Finset V)
    (C : ι → Finset V) (hT : T.Connected) (hAcyc : T.IsAcyclic)
    (hS : S.Nonempty) (hSconn : (T.induce (S : Set V)).Connected)
    (hC : ResidualComponents T S C) (j : ι) :
    ∃! p : V × V, IsBoundaryPair T S C j p := by
  obtain ⟨p, hp⟩ := exists_boundary_pair T S C hT hS hC j
  exact ⟨p, hp, fun q hq => boundary_pair_unique T S C hAcyc hSconn hC j q p hq hp⟩

lemma ResidualComponents.component_index_unique {T : SimpleGraph V} {S : Finset V}
    {C : ι → Finset V} (hC : ResidualComponents T S C)
    {j k : ι} {v : V} (hvj : v ∈ C j) (hvk : v ∈ C k) : j = k := by
  have hvS : v ∉ S := Finset.mem_compl.mp (hC.outside j hvj)
  obtain ⟨m, hm, huniq⟩ := hC.coverUnique v hvS
  exact (huniq j hvj).trans (huniq k hvk).symm

lemma ResidualComponents.cover_all {T : SimpleGraph V} {S : Finset V}
    {C : ι → Finset V} (hC : ResidualComponents T S C) (v : V) :
    v ∈ S ∨ ∃ j, v ∈ C j := by
  by_cases hvS : v ∈ S
  · exact Or.inl hvS
  · obtain ⟨j, hvj, -⟩ := hC.coverUnique v hvS
    exact Or.inr ⟨j, hvj⟩

/-- Independent carrier sets with the complete attachment-membership pattern. -/
abbrev CarrierPatternSet (T : SimpleGraph V) (S : Finset V) (h : ι → V)
    (σ : ι → Bool) :=
  {A : IndependentSetOn T S // ∀ j, (h j ∈ A.1) = (σ j = true)}

noncomputable instance (T : SimpleGraph V) (S : Finset V) (h : ι → V)
    (σ : ι → Bool) : Fintype (CarrierPatternSet T S h σ) := by
  classical
  letI : Finite (CarrierPatternSet T S h σ) :=
    Finite.of_injective Subtype.val Subtype.val_injective
  exact Fintype.ofFinite _

/-- The frozen carrier-pattern polynomial `H_σ`. -/
noncomputable def carrierPatternPolynomial (T : SimpleGraph V) (S : Finset V)
    (h : ι → V) (σ : ι → Bool) : Polynomial ℤ :=
  by
    classical
    exact ∑ A : CarrierPatternSet T S h σ, X ^ A.1.1.card

/-- Residual independent sets allowed by one boundary bit. -/
abbrev ResidualPatternSet (T : SimpleGraph V) (C : ι → Finset V) (x : ι → V)
    (σ : ι → Bool) (j : ι) :=
  IndependentSetOn T (if σ j then (C j).erase (x j) else C j)

/-- The residual factor `R_{j,σ_j}`. -/
noncomputable def residualFactor (T : SimpleGraph V) (C : ι → Finset V)
    (x : ι → V) (j : ι) (b : Bool) : Polynomial ℤ :=
  if b then independencePolynomialOn T ((C j).erase (x j))
  else independencePolynomialOn T (C j)

/-- One carrier set and one compatible independent set in every residual component. -/
abbrev Decomposition (T : SimpleGraph V) (S : Finset V) (C : ι → Finset V)
    (x h : ι → V) (σ : ι → Bool) :=
  CarrierPatternSet T S h σ × ((j : ι) → ResidualPatternSet T C x σ j)

noncomputable def splitIndependentSet (T : SimpleGraph V) (S : Finset V)
    (C : ι → Finset V) (x h : ι → V)
    (hx : ∀ j, x j ∈ C j) (hh : ∀ j, h j ∈ S)
    (ha : ∀ j, T.Adj (x j) (h j))
    (I : IndependentSetOn T (Finset.univ : Finset V)) :
    Σ σ, Decomposition T S C x h σ := by
  classical
  let σ : ι → Bool := fun j => decide (h j ∈ I.1)
  let A : CarrierPatternSet T S h σ :=
    ⟨⟨I.1 ∩ S, Finset.inter_subset_right, I.2.2.mono (by
      intro v hv
      exact Finset.inter_subset_left hv)⟩, by
      intro j
      simp [σ, hh j]⟩
  let B : (j : ι) → ResidualPatternSet T C x σ j := fun j => by
    refine ⟨I.1 ∩ C j, ?_, I.2.2.mono (by
      intro v hv
      exact Finset.inter_subset_left hv)⟩
    by_cases hjI : h j ∈ I.1
    · have hxI : x j ∉ I.1 := by
        intro hxI
        exact I.2.2 hxI hjI (ha j).ne (ha j)
      simp only [ResidualPatternSet, σ, hjI, decide_true, Bool.true_eq, ite_true]
      intro v hv
      have hvI : v ∈ I.1 := Finset.inter_subset_left hv
      have hvC : v ∈ C j := Finset.inter_subset_right hv
      exact Finset.mem_erase.mpr ⟨fun hvx => hxI (hvx ▸ hvI), hvC⟩
    · simp only [ResidualPatternSet, σ, hjI, decide_false, Bool.false_eq,
        Bool.false_eq_true, ite_false]
      exact Finset.inter_subset_right
  exact ⟨σ, A, B⟩

noncomputable def joinDecomposition (T : SimpleGraph V) (S : Finset V)
    (C : ι → Finset V) (x h : ι → V)
    (hC : ResidualComponents T S C)
    (hb : ∀ j {u v}, u ∈ C j → v ∈ S → T.Adj u v → u = x j ∧ v = h j)
    {σ : ι → Bool} (d : Decomposition T S C x h σ) :
    IndependentSetOn T (Finset.univ : Finset V) := by
  classical
  let U : Finset V := d.1.1.1 ∪ Finset.univ.biUnion (fun j => (d.2 j).1)
  have hBC : ∀ j, (d.2 j).1 ⊆ C j := by
    intro j v hv
    have hv' := (d.2 j).2.1 hv
    cases hσj : σ j with
    | false => simpa [ResidualPatternSet, hσj] using hv'
    | true =>
        simp only [hσj, Bool.true_eq, ite_true] at hv'
        exact Finset.erase_subset (x j) (C j) hv'
  refine ⟨U, Finset.subset_univ _, ?_⟩
  rw [SimpleGraph.isIndepSet_iff]
  intro u hu v hv huv
  change u ∈ U at hu
  change v ∈ U at hv
  simp only [U, Finset.mem_union, Finset.mem_biUnion, Finset.mem_univ,
    true_and] at hu hv
  rcases hu with huA | ⟨j, huBj⟩
  · rcases hv with hvA | ⟨k, hvBk⟩
    · exact d.1.1.2.2 huA hvA huv
    · intro huvAdj
      have huS : u ∈ S := d.1.1.2.1 huA
      have hvC : v ∈ C k := hBC k hvBk
      obtain ⟨hveq, hueq⟩ := hb k hvC huS huvAdj.symm
      cases hσk : σ k with
      | false =>
          have huH : h k ∈ d.1.1.1 := by simpa [hueq] using huA
          have hpatt := d.1.2 k
          rw [hpatt] at huH
          simpa [hσk] using huH
      | true =>
          have hvErase := (d.2 k).2.1 hvBk
          have hxErase : x k ∈ (C k).erase (x k) := by
            simpa [ResidualPatternSet, hσk, hveq] using hvErase
          exact (Finset.mem_erase.mp hxErase).1 rfl
  · rcases hv with hvA | ⟨k, hvBk⟩
    · intro huvAdj
      have hvS : v ∈ S := d.1.1.2.1 hvA
      have huC : u ∈ C j := hBC j huBj
      obtain ⟨hueq, hveq⟩ := hb j huC hvS huvAdj
      cases hσj : σ j with
      | false =>
          have hvH : h j ∈ d.1.1.1 := by simpa [hveq] using hvA
          have hpatt := d.1.2 j
          rw [hpatt] at hvH
          simpa [hσj] using hvH
      | true =>
          have huErase := (d.2 j).2.1 huBj
          have hxErase : x j ∈ (C j).erase (x j) := by
            simpa [ResidualPatternSet, hσj, hueq] using huErase
          exact (Finset.mem_erase.mp hxErase).1 rfl
    · by_cases hjk : j = k
      · subst k
        exact (d.2 j).2.2 huBj hvBk huv
      · exact hC.noAdj hjk (hBC j huBj) (hBC k hvBk)

lemma join_split (T : SimpleGraph V) (S : Finset V) (C : ι → Finset V)
    (x h : ι → V) (hC : ResidualComponents T S C)
    (hx : ∀ j, x j ∈ C j) (hh : ∀ j, h j ∈ S)
    (ha : ∀ j, T.Adj (x j) (h j))
    (hb : ∀ j {u v}, u ∈ C j → v ∈ S → T.Adj u v → u = x j ∧ v = h j)
    (I : IndependentSetOn T (Finset.univ : Finset V)) :
    joinDecomposition T S C x h hC hb (splitIndependentSet T S C x h hx hh ha I).2 = I := by
  classical
  apply Subtype.ext
  ext v
  change v ∈ (I.1 ∩ S ∪ Finset.univ.biUnion (fun j => I.1 ∩ C j)) ↔ v ∈ I.1
  constructor
  · simp only [Finset.mem_union, Finset.mem_inter, Finset.mem_biUnion,
      Finset.mem_univ, true_and]
    rintro (⟨hvI, -⟩ | ⟨j, hvI, -⟩) <;> exact hvI
  · intro hvI
    simp only [Finset.mem_union, Finset.mem_inter, Finset.mem_biUnion,
      Finset.mem_univ, true_and]
    rcases hC.cover_all v with hvS | ⟨j, hvC⟩
    · exact Or.inl ⟨hvI, hvS⟩
    · exact Or.inr ⟨j, hvI, hvC⟩

lemma residualPattern_subset_component (T : SimpleGraph V) (C : ι → Finset V)
    (x : ι → V) (σ : ι → Bool) (j : ι)
    (B : ResidualPatternSet T C x σ j) : B.1 ⊆ C j := by
  intro v hv
  have hv' := B.2.1 hv
  cases hσj : σ j with
  | false => simpa [ResidualPatternSet, hσj] using hv'
  | true =>
      simp only [hσj, ite_true] at hv'
      exact Finset.erase_subset _ _ hv'

lemma join_inter_carrier (T : SimpleGraph V) (S : Finset V)
    (C : ι → Finset V) (x h : ι → V) (hC : ResidualComponents T S C)
    (hb : ∀ j {u v}, u ∈ C j → v ∈ S → T.Adj u v → u = x j ∧ v = h j)
    {σ : ι → Bool} (d : Decomposition T S C x h σ) :
    (joinDecomposition T S C x h hC hb d).1 ∩ S = d.1.1.1 := by
  classical
  ext v
  constructor
  · intro hv
    have hvU := Finset.inter_subset_left hv
    have hvS := Finset.inter_subset_right hv
    change v ∈ d.1.1.1 ∪ Finset.univ.biUnion (fun j => (d.2 j).1) at hvU
    simp only [Finset.mem_union, Finset.mem_biUnion, Finset.mem_univ, true_and] at hvU
    rcases hvU with hvA | ⟨j, hvB⟩
    · exact hvA
    · have hvC := residualPattern_subset_component T C x σ j (d.2 j) hvB
      exact (Finset.mem_compl.mp (hC.outside j hvC) hvS).elim
  · intro hvA
    apply Finset.mem_inter.mpr
    refine ⟨?_, d.1.1.2.1 hvA⟩
    change v ∈ d.1.1.1 ∪ Finset.univ.biUnion (fun j => (d.2 j).1)
    exact Finset.mem_union_left _ hvA

lemma join_inter_component (T : SimpleGraph V) (S : Finset V)
    (C : ι → Finset V) (x h : ι → V) (hC : ResidualComponents T S C)
    (hb : ∀ j {u v}, u ∈ C j → v ∈ S → T.Adj u v → u = x j ∧ v = h j)
    {σ : ι → Bool} (d : Decomposition T S C x h σ) (j : ι) :
    (joinDecomposition T S C x h hC hb d).1 ∩ C j = (d.2 j).1 := by
  classical
  ext v
  constructor
  · intro hv
    have hvU := Finset.inter_subset_left hv
    have hvCj := Finset.inter_subset_right hv
    change v ∈ d.1.1.1 ∪ Finset.univ.biUnion (fun k => (d.2 k).1) at hvU
    simp only [Finset.mem_union, Finset.mem_biUnion, Finset.mem_univ, true_and] at hvU
    rcases hvU with hvA | ⟨k, hvBk⟩
    · have hvS := d.1.1.2.1 hvA
      exact (Finset.mem_compl.mp (hC.outside j hvCj) hvS).elim
    · have hvCk := residualPattern_subset_component T C x σ k (d.2 k) hvBk
      have hkj : k = j := hC.component_index_unique hvCk hvCj
      subst k
      exact hvBk
  · intro hvB
    apply Finset.mem_inter.mpr
    refine ⟨?_, residualPattern_subset_component T C x σ j (d.2 j) hvB⟩
    change v ∈ d.1.1.1 ∪ Finset.univ.biUnion (fun k => (d.2 k).1)
    exact Finset.mem_union_right _ (Finset.mem_biUnion.mpr ⟨j, by simp [hvB]⟩)

lemma joinDecomposition_injective (T : SimpleGraph V) (S : Finset V)
    (C : ι → Finset V) (x h : ι → V) (hC : ResidualComponents T S C)
    (hb : ∀ j {u v}, u ∈ C j → v ∈ S → T.Adj u v → u = x j ∧ v = h j) :
    Function.Injective (fun z : Σ σ, Decomposition T S C x h σ =>
      joinDecomposition T S C x h hC hb z.2) := by
  classical
  rintro ⟨σ, d⟩ ⟨τ, e⟩ heq
  have hcarrier : d.1.1.1 = e.1.1.1 := by
    calc
      d.1.1.1 = (joinDecomposition T S C x h hC hb d).1 ∩ S :=
        (join_inter_carrier T S C x h hC hb d).symm
      _ = (joinDecomposition T S C x h hC hb e).1 ∩ S :=
        congrArg (fun I => I.1 ∩ S) heq
      _ = e.1.1.1 := join_inter_carrier T S C x h hC hb e
  have hστ : σ = τ := by
    funext j
    have hd := d.1.2 j
    have he := e.1.2 j
    cases hσj : σ j <;> cases hτj : τ j <;> simp_all
  subst τ
  have hA : d.1 = e.1 := by
    apply Subtype.ext
    apply Subtype.ext
    exact hcarrier
  have hB : d.2 = e.2 := by
    funext j
    apply Subtype.ext
    calc
      (d.2 j).1 = (joinDecomposition T S C x h hC hb d).1 ∩ C j :=
        (join_inter_component T S C x h hC hb d j).symm
      _ = (joinDecomposition T S C x h hC hb e).1 ∩ C j :=
        congrArg (fun I => I.1 ∩ C j) heq
      _ = (e.2 j).1 := join_inter_component T S C x h hC hb e j
  have hde : d = e := Prod.ext hA hB
  subst e
  rfl

noncomputable def decompositionEquiv (T : SimpleGraph V) (S : Finset V)
    (C : ι → Finset V) (x h : ι → V) (hC : ResidualComponents T S C)
    (hx : ∀ j, x j ∈ C j) (hh : ∀ j, h j ∈ S)
    (ha : ∀ j, T.Adj (x j) (h j))
    (hb : ∀ j {u v}, u ∈ C j → v ∈ S → T.Adj u v → u = x j ∧ v = h j) :
    (Σ σ, Decomposition T S C x h σ) ≃
      IndependentSetOn T (Finset.univ : Finset V) where
  toFun z := joinDecomposition T S C x h hC hb z.2
  invFun I := splitIndependentSet T S C x h hx hh ha I
  left_inv z := by
    apply joinDecomposition_injective T S C x h hC hb
    exact join_split T S C x h hC hx hh ha hb
      (joinDecomposition T S C x h hC hb z.2)
  right_inv I := join_split T S C x h hC hx hh ha hb I

lemma joinDecomposition_card (T : SimpleGraph V) (S : Finset V)
    (C : ι → Finset V) (x h : ι → V) (hC : ResidualComponents T S C)
    (hb : ∀ j {u v}, u ∈ C j → v ∈ S → T.Adj u v → u = x j ∧ v = h j)
    {σ : ι → Bool} (d : Decomposition T S C x h σ) :
    (joinDecomposition T S C x h hC hb d).1.card =
      d.1.1.1.card + ∑ j, (d.2 j).1.card := by
  classical
  have hpair : ((Finset.univ : Finset ι) : Set ι).PairwiseDisjoint
      (fun j => (d.2 j).1) := by
    intro j _ k _ hjk
    change Disjoint (d.2 j).1 (d.2 k).1
    rw [Finset.disjoint_left]
    intro v hvj hvk
    have hvCj := residualPattern_subset_component T C x σ j (d.2 j) hvj
    have hvCk := residualPattern_subset_component T C x σ k (d.2 k) hvk
    exact hjk (hC.component_index_unique hvCj hvCk)
  have hdis : Disjoint d.1.1.1 (Finset.univ.biUnion fun j => (d.2 j).1) := by
    rw [Finset.disjoint_left]
    intro v hvA hvB
    obtain ⟨j, -, hvBj⟩ := Finset.mem_biUnion.mp hvB
    have hvS := d.1.1.2.1 hvA
    have hvC := residualPattern_subset_component T C x σ j (d.2 j) hvBj
    exact Finset.mem_compl.mp (hC.outside j hvC) hvS
  change #(d.1.1.1 ∪ Finset.univ.biUnion (fun j => (d.2 j).1)) = _
  rw [Finset.card_union_of_disjoint hdis, Finset.card_biUnion hpair]

lemma residualFactor_eq_weightEnumerator (T : SimpleGraph V)
    (C : ι → Finset V) (x : ι → V) (σ : ι → Bool) (j : ι) :
    residualFactor T C x j (σ j) =
      weightEnumerator (ResidualPatternSet T C x σ j) (fun B => B.1.card) := by
  classical
  calc
    residualFactor T C x j (σ j) =
        independencePolynomialOn T
          (if σ j then (C j).erase (x j) else C j) := by
            cases hσj : σ j <;> simp [residualFactor, hσj]
    _ = weightEnumerator (ResidualPatternSet T C x σ j)
        (fun B => B.1.card) := by
          exact independencePolynomialOn_eq_weightEnumerator T
            (if σ j then (C j).erase (x j) else C j)

lemma decomposition_weightEnumerator (T : SimpleGraph V) (S : Finset V)
    (C : ι → Finset V) (x h : ι → V) (σ : ι → Bool) :
    weightEnumerator (Decomposition T S C x h σ)
      (fun d => d.1.1.1.card + ∑ j, (d.2 j).1.card) =
    carrierPatternPolynomial T S h σ * ∏ j, residualFactor T C x j (σ j) := by
  classical
  calc
    weightEnumerator (Decomposition T S C x h σ)
        (fun d => d.1.1.1.card + ∑ j, (d.2 j).1.card) =
      weightEnumerator (CarrierPatternSet T S h σ) (fun A => A.1.1.card) *
        weightEnumerator ((j : ι) → ResidualPatternSet T C x σ j)
          (fun B => ∑ j, (B j).1.card) := by
            exact weightEnumerator_prod
              (fun A : CarrierPatternSet T S h σ => A.1.1.card)
              (fun B : (j : ι) → ResidualPatternSet T C x σ j =>
                ∑ j, (B j).1.card)
    _ = weightEnumerator (CarrierPatternSet T S h σ) (fun A => A.1.1.card) *
        ∏ j, weightEnumerator (ResidualPatternSet T C x σ j)
          (fun B => B.1.card) := by
            exact congrArg
              (fun q => weightEnumerator (CarrierPatternSet T S h σ)
                (fun A => A.1.1.card) * q)
              (weightEnumerator_pi
                (β := fun j => ResidualPatternSet T C x σ j)
                (fun j B => B.1.card))
    _ = carrierPatternPolynomial T S h σ *
        ∏ j, residualFactor T C x j (σ j) := by
          have hcarrier : weightEnumerator (CarrierPatternSet T S h σ)
              (fun A => A.1.1.card) = carrierPatternPolynomial T S h σ := rfl
          rw [hcarrier]
          congr 1
          apply Finset.prod_congr rfl
          intro j _
          exact (residualFactor_eq_weightEnumerator T C x σ j).symm

lemma polynomial_factorization_of_boundary (T : SimpleGraph V) (S : Finset V)
    (C : ι → Finset V) (x h : ι → V) (hC : ResidualComponents T S C)
    (hx : ∀ j, x j ∈ C j) (hh : ∀ j, h j ∈ S)
    (ha : ∀ j, T.Adj (x j) (h j))
    (hb : ∀ j {u v}, u ∈ C j → v ∈ S → T.Adj u v →
      u = x j ∧ v = h j) :
    independencePolynomialOn T (Finset.univ : Finset V) =
      ∑ σ : ι → Bool,
        carrierPatternPolynomial T S h σ *
          ∏ j, residualFactor T C x j (σ j) := by
  classical
  calc
    independencePolynomialOn T (Finset.univ : Finset V) =
        weightEnumerator (IndependentSetOn T (Finset.univ : Finset V))
          (fun I => I.1.card) :=
      independencePolynomialOn_eq_weightEnumerator T Finset.univ
    _ = weightEnumerator (Σ σ, Decomposition T S C x h σ)
        (fun z => z.2.1.1.1.card + ∑ j, (z.2.2 j).1.card) := by
          symm
          exact weightEnumerator_equiv
            (fun z : Σ σ, Decomposition T S C x h σ =>
              z.2.1.1.1.card + ∑ j, (z.2.2 j).1.card)
            (fun I : IndependentSetOn T (Finset.univ : Finset V) => I.1.card)
            (decompositionEquiv T S C x h hC hx hh ha hb)
            (fun z => (joinDecomposition_card T S C x h hC hb z.2).symm)
    _ = ∑ σ : ι → Bool,
        weightEnumerator (Decomposition T S C x h σ)
          (fun d => d.1.1.1.card + ∑ j, (d.2 j).1.card) := by
            exact weightEnumerator_sigma
              (fun σ : ι → Bool => Decomposition T S C x h σ)
              (fun σ d => d.1.1.1.card + ∑ j, (d.2 j).1.card)
    _ = ∑ σ : ι → Bool,
        carrierPatternPolynomial T S h σ *
          ∏ j, residualFactor T C x j (σ j) := by
            apply Fintype.sum_congr
            intro σ
            exact decomposition_weightEnumerator T S C x h σ

noncomputable def coefficientTruncation (p : Polynomial ℤ) (n : ℕ) :
    Polynomial ℤ :=
  ∑ k : Fin (n + 1), C (p.coeff k.val) * X ^ k.val

lemma coefficientTruncation_coeff (p : Polynomial ℤ) (n m : ℕ) (hm : m ≤ n) :
    (coefficientTruncation p n).coeff m = p.coeff m := by
  classical
  simp only [coefficientTruncation, map_sum, Polynomial.coeff_C_mul,
    Polynomial.coeff_X_pow]
  let k : Fin (n + 1) := ⟨m, by omega⟩
  have hiff : ∀ b : Fin (n + 1), m = b.val ↔ b = k := by
    intro b
    constructor
    · intro hmb
      apply Fin.ext
      simpa [k] using hmb.symm
    · intro hbk
      subst b
      simp [k]
  have hiff' : ∀ b : Fin (n + 1), b.val = m ↔ b = k := by
    intro b
    rw [eq_comm]
    exact hiff b
  simp [hiff, hiff', k]

lemma coeff_mul_congr_up_to (p p' q q' : Polynomial ℤ) (n : ℕ)
    (hp : ∀ m, m ≤ n → p.coeff m = p'.coeff m)
    (hq : ∀ m, m ≤ n → q.coeff m = q'.coeff m) :
    (p * q).coeff n = (p' * q').coeff n := by
  classical
  simp only [Polynomial.coeff_mul]
  apply Finset.sum_congr rfl
  intro ab hab
  have hab' : ab.1 + ab.2 = n :=
    Finset.HasAntidiagonal.mem_antidiagonal.mp hab
  rw [hp ab.1 (by omega), hq ab.2 (by omega)]

lemma coeff_finset_prod_congr_up_to {κ : Type*} [DecidableEq κ]
    (s : Finset κ) (f g : κ → Polynomial ℤ) (n : ℕ)
    (h : ∀ k ∈ s, ∀ m, m ≤ n → (f k).coeff m = (g k).coeff m) :
    ∀ m, m ≤ n → (∏ k ∈ s, f k).coeff m = (∏ k ∈ s, g k).coeff m := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | @insert a s ha ih =>
      intro m hm
      rw [Finset.prod_insert ha, Finset.prod_insert ha]
      apply coeff_mul_congr_up_to
      · intro k hk
        exact h a (Finset.mem_insert_self a s) k (hk.trans hm)
      · intro k hk
        exact ih (fun j hj => h j (Finset.mem_insert_of_mem hj)) k (hk.trans hm)

lemma coeff_fintype_prod {κ : Type*} [Fintype κ] [DecidableEq κ]
    (f : κ → Polynomial ℤ) (n : ℕ) :
    (∏ k, f k).coeff n =
      ∑ d : κ → Fin (n + 1),
        if (∑ k, (d k).val) = n then
          ∏ k, (f k).coeff (d k).val
        else 0 := by
  classical
  have htruncate : (∏ k, f k).coeff n =
      (∏ k, coefficientTruncation (f k) n).coeff n := by
    exact coeff_finset_prod_congr_up_to Finset.univ f
      (fun k => coefficientTruncation (f k) n) n
      (fun k _ m hm => (coefficientTruncation_coeff (f k) n m hm).symm) n le_rfl
  rw [htruncate]
  simp only [coefficientTruncation]
  rw [Fintype.prod_sum]
  change (lcoeff ℤ n) (∑ d : κ → Fin (n + 1),
      ∏ k, C ((f k).coeff (d k).val) * X ^ (d k).val) = _
  rw [map_sum]
  apply Fintype.sum_congr
  intro d
  have hterm :
      (∏ k, C ((f k).coeff (d k).val) * X ^ (d k).val) =
        C (∏ k, (f k).coeff (d k).val) * X ^ (∑ k, (d k).val) := by
    rw [Finset.prod_mul_distrib, ← map_prod]
    congr 1
    exact Finset.prod_pow_eq_pow_sum Finset.univ (fun k => (d k).val) X
  rw [hterm]
  symm
  rw [C_mul_X_pow_eq_monomial]
  change (if (∑ k, (d k).val) = n then
      ∏ k, (f k).coeff (d k).val else 0) =
    (monomial (∑ k, (d k).val) (∏ k, (f k).coeff (d k).val)).coeff n
  rw [coeff_monomial]

/-- A bounded, exact version of the coefficient convolution.  Every summand
has nonnegative degree at most `n`; this is equivalent to the integer-indexed
formula because polynomial coefficients vanish in negative degrees. -/
noncomputable def coefficientConvolution (p : Polynomial ℤ)
    (q : ι → Polynomial ℤ) (n : ℕ) : ℤ :=
  by
    classical
    exact
      ∑ d : Option ι → Fin (n + 1),
        if (∑ k, (d k).val) = n then
          p.coeff (d none).val * ∏ j, (q j).coeff (d (some j)).val
        else 0

lemma coeff_mul_prod_eq_coefficientConvolution (p : Polynomial ℤ)
    (q : ι → Polynomial ℤ) (n : ℕ) :
    (p * ∏ j, q j).coeff n = coefficientConvolution p q n := by
  classical
  let f : Option ι → Polynomial ℤ
    | none => p
    | some j => q j
  have hprod := coeff_fintype_prod f n
  simpa [f, coefficientConvolution, Fintype.prod_option] using hprod

lemma coefficient_formula_of_boundary (T : SimpleGraph V) (S : Finset V)
    (C : ι → Finset V) (x h : ι → V) (hC : ResidualComponents T S C)
    (hx : ∀ j, x j ∈ C j) (hh : ∀ j, h j ∈ S)
    (ha : ∀ j, T.Adj (x j) (h j))
    (hb : ∀ j {u v}, u ∈ C j → v ∈ S → T.Adj u v →
      u = x j ∧ v = h j) (n : ℕ) :
    (independencePolynomialOn T (Finset.univ : Finset V)).coeff n =
      ∑ σ : ι → Bool,
        coefficientConvolution (carrierPatternPolynomial T S h σ)
          (fun j => residualFactor T C x j (σ j)) n := by
  classical
  calc
    (independencePolynomialOn T (Finset.univ : Finset V)).coeff n =
        (∑ σ : ι → Bool,
          carrierPatternPolynomial T S h σ *
            ∏ j, residualFactor T C x j (σ j)).coeff n :=
      congrArg (fun p : Polynomial ℤ => p.coeff n)
        (polynomial_factorization_of_boundary T S C x h hC hx hh ha hb)
    _ = ∑ σ : ι → Bool,
        (carrierPatternPolynomial T S h σ *
          ∏ j, residualFactor T C x j (σ j)).coeff n := by
            change (lcoeff ℤ n) (∑ σ : ι → Bool,
              carrierPatternPolynomial T S h σ *
                ∏ j, residualFactor T C x j (σ j)) = _
            rw [map_sum]
            apply Fintype.sum_congr
            intro σ
            rfl
    _ = ∑ σ : ι → Bool,
        coefficientConvolution (carrierPatternPolynomial T S h σ)
          (fun j => residualFactor T C x j (σ j)) n := by
            apply Fintype.sum_congr
            intro σ
            exact coeff_mul_prod_eq_coefficientConvolution
              (carrierPatternPolynomial T S h σ)
              (fun j => residualFactor T C x j (σ j)) n

/-- Componentwise boundary uniqueness and the exact carrier/residual
factorization, including its integer-rank coefficient consequence. -/
theorem componentwise_boundary_factorization (T : SimpleGraph V) (S : Finset V)
    (C : ι → Finset V) (hT : T.Connected) (hAcyc : T.IsAcyclic)
    (hS : S.Nonempty) (hSproper : S ≠ Finset.univ)
    (hSconn : (T.induce (S : Set V)).Connected)
    (hC : ResidualComponents T S C) :
    Nonempty ι ∧
      ∃ x h : ι → V,
        (∀ j, IsBoundaryPair T S C j (x j, h j) ∧
          ∀ p : V × V, IsBoundaryPair T S C j p → p = (x j, h j)) ∧
        independencePolynomialOn T (Finset.univ : Finset V) =
          ∑ σ : ι → Bool,
            carrierPatternPolynomial T S h σ *
              ∏ j, residualFactor T C x j (σ j) ∧
        ∀ r : ℤ,
          independentSetCountOn T (Finset.univ : Finset V) r =
            if 0 ≤ r then
              ∑ σ : ι → Bool,
                coefficientConvolution (carrierPatternPolynomial T S h σ)
                  (fun j => residualFactor T C x j (σ j)) r.toNat
            else 0 := by
  classical
  have hvOutside : ∃ v : V, v ∉ S := by
    by_contra hnone
    push_neg at hnone
    apply hSproper
    exact Finset.eq_univ_iff_forall.mpr hnone
  obtain ⟨v, hvS⟩ := hvOutside
  obtain ⟨j0, -, -⟩ := hC.coverUnique v hvS
  have hnonempty : Nonempty ι := ⟨j0⟩
  let p : ι → V × V := fun j =>
    Classical.choose (existsUnique_boundary_pair T S C hT hAcyc hS hSconn hC j)
  let x : ι → V := fun j => (p j).1
  let h : ι → V := fun j => (p j).2
  have hp : ∀ j, IsBoundaryPair T S C j (x j, h j) := by
    intro j
    change IsBoundaryPair T S C j (p j)
    exact (Classical.choose_spec
      (existsUnique_boundary_pair T S C hT hAcyc hS hSconn hC j)).1
  have hunique : ∀ j (q : V × V), IsBoundaryPair T S C j q →
      q = (x j, h j) := by
    intro j q hq
    exact boundary_pair_unique T S C hAcyc hSconn hC j q (x j, h j) hq (hp j)
  have hx : ∀ j, x j ∈ C j := fun j => (hp j).1
  have hh : ∀ j, h j ∈ S := fun j => (hp j).2.1
  have ha : ∀ j, T.Adj (x j) (h j) := fun j => (hp j).2.2
  have hb : ∀ j {u v}, u ∈ C j → v ∈ S → T.Adj u v →
      u = x j ∧ v = h j := by
    intro j u v huC hvS huv
    have huvPair : IsBoundaryPair T S C j (u, v) := ⟨huC, hvS, huv⟩
    have heq := hunique j (u, v) huvPair
    exact ⟨congrArg Prod.fst heq, congrArg Prod.snd heq⟩
  refine ⟨hnonempty, x, h, ?_, ?_, ?_⟩
  · intro j
    exact ⟨hp j, hunique j⟩
  · exact polynomial_factorization_of_boundary T S C x h hC hx hh ha hb
  · intro r
    unfold independentSetCountOn
    by_cases hr : 0 ≤ r
    · simp only [hr, if_pos]
      exact coefficient_formula_of_boundary T S C x h hC hx hh ha hb r.toNat
    · simp [hr]

end C8U2BoundaryFactorization
