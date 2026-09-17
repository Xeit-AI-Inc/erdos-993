import R23Groundwork.Adequacy
import R23Groundwork.Relation

/-!
# C5-T2: the relation-family transport lemma (`OB-R23-CORRESPOND`'s residual)

Charge (`control/CYCLE5-ALLOCATION.md` §"C5-T2"): close `OB-R23-CORRESPOND`'s
last residual — prove transport of `C`, `P`, `N` (via `Graph.induce` / the
realization equivalence) along the C4-T3 adequacy machinery, sorry-free at the
pin; per-declaration axioms; integrate against the grand-merge project
(copy-out; sealed bytes untouched). The sealed `Adequacy.lean` (C4-T3,
`R23Groundwork/Adequacy.lean` here; carried from sealed
`dbe4b15b35485520ad84e54f60c02e475e5a35404a3cfea0f72457dee5930bf0`,
this copy is `2eda1bb4f91df07c2b1995291c75d5420f3499004f8b5d530c2c44c3d6017bbf`
after two disclosed deltas — **C6-T3 duty-18 correction, of record**:
the sealed C5-T2 module doc here said "byte-identical carry" and
quoted the C4-T3 digest for this copy — FALSE, adjudicated MAJOR
(upgraded) at `R23B-C5-T2-03`/CRIT-T2-F Finding F-3: this file is NOT
a byte-identical carry, it differs from the sealed C4-T3 original in
exactly three hunks across the two disclosed delta classes; the C4-T3
original at its own sealed location (`cycles/cycle-4/stage3/routes/T3/…`)
is unmutated and verified separately. Not carried forward per duty 18)
— two
disclosed C5-T2 integration deltas noted in-file: the `toSimpleGraph`
name-collision re-point and the two/three-conjunct `IsTree` arity fix) already
transports every AGGREGATE quantity (`i_k`, `Δ_k`, `x(T)`, the leaf structure,
`Favorable`, `S(T,p)`) along both `Graph.induce` (Part 1a, within-encoding)
and the realization equivalence `ofSimpleGraph` (Part 2, Mathlib-tree side).
What it does NOT transport is the RELATION family itself — `C`, `P`, `N`
(`Relation.lean`, C1-T6) — `Finset`-of-`Finset`s- and `Finset`-of-pairs-valued
objects, not scalars. This file closes exactly that residual.

**[A1.1]**: every actual-tree reading below (any statement about a genuine
`v : Fin n` leaf of a concrete `Graph n` / its realization) carries the same
`[A1.1]` premise as every other actual-tree line in this project (the
`RTree.semanticAdequacyTarget` transfer is stated, unproved, and cannot be a
Lean hypothesis here — see `ActualTree.lean`, `Adequacy.lean` module docs).
Nothing here discharges, weakens, or re-opens A1.1. The A2.2 dead-branch
fence is respected: no Hall cut, matching, or deficiency is stated, used, or
computed anywhere in this file.

Nothing in this file is `formally_verified` in the VerityOS sense. Lean-kernel
type-checking is computation-grade evidence of exactly the declarations
checked, on exactly this encoding — never proof of any claim beyond them.
-/

namespace R23
namespace SG

open SimpleGraph

variable {V : Type*}

/-! ## Abstract-side relation-family vocabulary (Mathlib-primitive)

Mirrors `Relation.lean`'s `C` exactly, but stated with Mathlib's `IsIndepSet`
independence and an EXPLICIT witness `s` of the leaf `v`'s unique neighbor
(rather than a derived `support`) — the same discipline `Adequacy.lean`
already uses everywhere a leaf's neighbor is needed
(`support_ofSimpleGraph`, `hcarrier_ofSimpleGraph`, `S_ofSimpleGraph`'s proof).
No new abstract "canonical support" function is introduced: on an arbitrary
`Fintype` there is no canonical order to pick one from, unlike the encoding's
`Fin n`-indexed `support` (`Tree.lean`), and none of `Relation.lean`'s
consumers need one — every actual-tree use supplies `v` and its neighbor `s`
together (`THM_R23_B_bridge1_actual`, `bridge1_actual_deletion`, etc.). -/

/-- Abstract-side `Ind_r(H)` restricted to a carrier `W`, as a `Finset` of
    `Finset`s (not merely its cardinality). Mirrors `SG.indepCountOn`'s body
    verbatim, one level before `.card`; `indepCountOn` is definitionally its
    cardinality (`indepCountOn_eq_card_indepSetsOn` below). -/
def indepSetsOn [DecidableEq V] (H : SimpleGraph V) [DecidableRel H.Adj]
    (W : Finset V) (r : ℕ) : Finset (Finset V) :=
  (W.powersetCard r).filter (fun A : Finset V => H.IsIndepSet (A : Set V))

theorem indepCountOn_eq_card_indepSetsOn [DecidableEq V] (H : SimpleGraph V)
    [DecidableRel H.Adj] (W : Finset V) (r : ℕ) :
    indepCountOn H W r = (indepSetsOn H W r).card := rfl

/-- Abstract-side `W_v` at an explicit neighbor witness `s` of the support of
    a leaf `v`: `N(s) \ {v}` (`SEMANTIC-CONTRACT.md` §3's `W_v = N_T(s_v) \
    {v}`, Mathlib form). -/
def W [DecidableEq V] [Fintype V] (H : SimpleGraph V) [DecidableRel H.Adj]
    (v s : V) : Finset V :=
  (H.neighborFinset s).erase v

/-- Abstract-side `C_r(v)` at an explicit neighbor witness `s`: the
    `r`-element independent subsets of `H_v = V \ {v,s}` meeting `W_v`.
    Mirrors `Graph.C`'s definition exactly, one Mathlib translation away. -/
def C [DecidableEq V] [Fintype V] (H : SimpleGraph V) [DecidableRel H.Adj]
    (v s : V) (r : ℕ) : Finset (Finset V) :=
  (indepSetsOn H (bCarrier H v) r).filter (fun A => (A ∩ SG.W H v s).Nonempty)

/-- A total (classically chosen) neighbor-selector: for a degree-one vertex
    this returns THE unique neighbor; off that hypothesis its value is
    unconstrained and never consumed elsewhere. A bookkeeping device only,
    needed to state `P`/`N` transport as ordinary total `Finset.biUnion`s —
    on the encoding side the analogous role is played by `Graph.support`
    (`Tree.lean`), which is total FOR FREE because `Fin n` is linearly
    ordered (`Finset.min'`); an arbitrary `Fintype V` carries no such
    canonical order, so classical choice stands in. `C_ofSimpleGraph` already
    proves the transport is independent of WHICH valid neighbor witness is
    supplied, since a degree-one vertex has a UNIQUE neighbor
    (`neighborFinset_eq_singleton`, sealed C4-T3) — so this choice is
    immaterial to any statement built on top of it. Noncomputable; never
    evaluated. -/
noncomputable def nbrOf [DecidableEq V] [Fintype V] (H : SimpleGraph V)
    [DecidableRel H.Adj] (v : V) : V :=
  if h : (H.neighborFinset v).Nonempty then Classical.choose h else v

theorem adj_nbrOf [DecidableEq V] [Fintype V] (H : SimpleGraph V)
    [DecidableRel H.Adj] {v : V} (hdeg : H.degree v = 1) :
    H.Adj v (nbrOf H v) := by
  have hne : (H.neighborFinset v).Nonempty := by
    rw [← Finset.card_pos, SimpleGraph.card_neighborFinset_eq_degree, hdeg]
    norm_num
  unfold nbrOf
  rw [dif_pos hne]
  exact (SimpleGraph.mem_neighborFinset H v _).mp (Classical.choose_spec hne)

end SG
end R23

namespace R23
namespace Graph

open SimpleGraph

variable {n : ℕ} (G : Graph n)

/-! ## Part 1a extension — `C` transports along `Graph.induce`

The within-encoding half: `G.C v r`, expressed against the ACTUAL deleted
graph `G.induce (G.Hcarrier v)` rather than the carrier-restricted `IndOn`,
exactly as `bridge1_actual_deletion` re-expressed BRIDGE-1's cardinality
identity — but here for the raw relation `C` itself, at the `Finset`-of-sets
level (the identity `iOn_eq_induce_i` alone is not enough to move a `filter`
predicate that mentions `W v`, since that predicate is stated against actual
elements of `Fin n`, not against the induced graph's own relabeled vertex
type). -/

/-- **`C` via `Graph.induce` (set-level, within-encoding):** every element of
    `G.C v r` is the `vmap`-image of an independent `r`-set of the actual
    deleted graph `G.induce (G.Hcarrier v)` that meets `W v` after
    re-imaging, and conversely. Generalizes `indOn_eq_image_induce_ind`
    (which only tracks the carrier-restricted independent-set FAMILY) by the
    extra `∩ W v` filter that defines `C`. No tree hypothesis; every `v`,
    every `r` (same broadened scope as `bridge1_actual_deletion`). -/
theorem C_eq_image_induce_C (v : Fin n) (r : ℕ) :
    G.C v r
      = (((G.induce (G.Hcarrier v)).Ind r).filter
          (fun A => (A.image (vmap (G.Hcarrier v)) ∩ G.W v).Nonempty)).image
          (fun A => A.image (vmap (G.Hcarrier v))) := by
  unfold Graph.C
  rw [G.indOn_eq_image_induce_ind (G.Hcarrier v) r]
  apply Finset.ext
  intro A'
  simp only [Finset.mem_filter, Finset.mem_image]
  constructor
  · rintro ⟨⟨A, hA, rfl⟩, hne⟩
    exact ⟨A, ⟨hA, hne⟩, rfl⟩
  · rintro ⟨A, ⟨hA, hne⟩, rfl⟩
    exact ⟨⟨A, hA, rfl⟩, hne⟩

end Graph
end R23

namespace R23
namespace Graph

open SimpleGraph R23.SG

variable {n : ℕ} (G : Graph n)

/-! ## Part 2 extension — `C`, `P`, `N` transport along the realization
equivalence

The abstract-tree half: `Adequacy.lean`'s Part 2 transports every AGGREGATE
quantity along `ofSimpleGraph`, but only ever at the level of cardinalities
or of `Favorable`/leaf-structure `Finset`s built from Mathlib primitives
directly. It never transports a `Finset` built through `IndOn`'s carrier
apparatus (i.e. through `iOn`'s underlying set, not just its `.card`) — the
gap this file closes. `indOn_ofSimpleGraph_image` below is the set-level
generalization of `iOn_ofSimpleGraph_image` (`Adequacy.lean`) needed to move
`C`'s `∩ W v` filter across the realization equivalence, exactly mirroring
how `C_eq_image_induce_C` needed `indOn_eq_image_induce_ind` (the set-level
generalization of `iOn_eq_induce_i`) on the induce side above. -/

section Realization

open SimpleGraph

variable {V : Type*} (H : SimpleGraph V) [DecidableRel H.Adj] [Fintype V]
  [DecidableEq V]

/-- **Set-level independence transport at a carrier `W`** (generalizes
    `iOn_ofSimpleGraph_image`'s cardinality identity to the underlying
    `Finset`s themselves): the encoding's carrier-restricted independent
    `r`-sets at the `e`-image of an abstract carrier `W` are EXACTLY the
    `e`-images of the abstract Mathlib-side independent `r`-sets on `W`. -/
theorem indOn_ofSimpleGraph_image {m : ℕ} (e : V ≃ Fin m)
    (W : Finset V) (r : ℕ) :
    (ofSimpleGraph H e).IndOn (W.image e) r
      = (SG.indepSetsOn H W r).image (Finset.image e) := by
  have hsub : (SG.indepSetsOn H W r).image (Finset.image e)
      ⊆ (ofSimpleGraph H e).IndOn (W.image e) r := by
    intro A' hA'
    obtain ⟨S, hS, rfl⟩ := Finset.mem_image.mp hA'
    simp only [SG.indepSetsOn, Finset.mem_filter, Finset.mem_powersetCard] at hS
    obtain ⟨⟨hSW, hcard⟩, hind⟩ := hS
    simp only [IndOn, Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨Finset.image_subset_image hSW, ?_⟩, ?_⟩
    · rw [Finset.card_image_of_injective S e.injective]; exact hcard
    · exact (isIndependent_ofSimpleGraph_image H e S).mpr hind
  have h1 : ((ofSimpleGraph H e).IndOn (W.image e) r).card
      = SG.indepCountOn H W r := by
    have h := iOn_ofSimpleGraph_image H e W r
    unfold Graph.iOn at h
    exact h
  have h2 : ((SG.indepSetsOn H W r).image (Finset.image e)).card
      = SG.indepCountOn H W r := by
    rw [Finset.card_image_of_injective _ (Finset.image_injective e.injective),
      SG.indepCountOn_eq_card_indepSetsOn]
  exact (Finset.eq_of_subset_of_card_le hsub (le_of_eq (h1.trans h2.symm))).symm

/-- **`W` transport at an explicit leaf witness:** the realization's `W` at
    `e v` is the `e`-image of the abstract `SG.W H v s`. -/
theorem W_ofSimpleGraph (e : V ≃ Fin (Fintype.card V)) {v s : V}
    (hdeg : H.degree v = 1) (hs : H.Adj v s) :
    (ofSimpleGraph H e).W (e v) = (SG.W H v s).image e := by
  unfold Graph.W SG.W
  rw [support_ofSimpleGraph H e hdeg hs, nbrs_ofSimpleGraph,
    Finset.image_erase e.injective]

/-- **`C` transport (the headline relation-family lemma), at an explicit leaf
    witness:** the realization's `C_r` at `e v` is the `e`-image of the
    abstract `SG.C H v s r`. Together with `favorable_ofSimpleGraph` (sealed
    C4-T3) this is everything `P`/`N` need. -/
theorem C_ofSimpleGraph (e : V ≃ Fin (Fintype.card V)) {v s : V}
    (hdeg : H.degree v = 1) (hs : H.Adj v s) (r : ℕ) :
    (ofSimpleGraph H e).C (e v) r = (SG.C H v s r).image (Finset.image e) := by
  unfold Graph.C SG.C
  rw [hcarrier_ofSimpleGraph H e hdeg hs, indOn_ofSimpleGraph_image]
  apply Finset.ext
  intro A'
  simp only [Finset.mem_filter, Finset.mem_image]
  constructor
  · rintro ⟨⟨A, hA, rfl⟩, hne⟩
    refine ⟨A, ⟨hA, ?_⟩, rfl⟩
    rw [W_ofSimpleGraph H e hdeg hs] at hne
    rwa [← Finset.image_inter A (SG.W H v s) e.injective, Finset.image_nonempty]
      at hne
  · rintro ⟨A, ⟨hA, hne⟩, rfl⟩
    refine ⟨⟨A, hA, rfl⟩, ?_⟩
    rw [W_ofSimpleGraph H e hdeg hs, ← Finset.image_inter A (SG.W H v s) e.injective,
      Finset.image_nonempty]
    exact hne

/-! ### `P`, `N` transport

`P p = (Favorable p).biUnion (fun v => (C v p).image (fun A => (v, A)))`, and
`Favorable` already transports as `(SG.favorable H p).image e`
(`favorable_ofSimpleGraph`, sealed C4-T3). Every `v` reached by that
`biUnion` IS a leaf of the realization (by construction of `Favorable`),
hence has a neighbor (`SG.adj_nbrOf`); `C_ofSimpleGraph` applies there. -/

/-- **`P` transport:** the realization's `P p` is the image, under
    `(v, A) ↦ (e v, A.image e)`, of the abstract tagged union built from
    `SG.C` at each favorable vertex's classically-selected neighbor
    (`SG.nbrOf`). -/
theorem P_ofSimpleGraph (e : V ≃ Fin (Fintype.card V)) (p : ℕ) :
    (ofSimpleGraph H e).P p
      = ((SG.favorable H p).biUnion
          (fun v => (SG.C H v (SG.nbrOf H v) p).image (fun A => (v, A)))).image
          (fun q => (e q.1, q.2.image e)) := by
  apply Finset.ext
  rintro ⟨a, B⟩
  simp only [Graph.P, Finset.mem_biUnion, Finset.mem_image, favorable_ofSimpleGraph]
  constructor
  · rintro ⟨v', ⟨v, hv, rfl⟩, A, hA, hpair⟩
    rw [Prod.mk.injEq] at hpair
    obtain ⟨rfl, rfl⟩ := hpair
    have hdeg : H.degree v = 1 := by
      simp only [SG.favorable, Finset.mem_filter] at hv
      exact hv.2.1
    rw [C_ofSimpleGraph H e hdeg (SG.adj_nbrOf H hdeg)] at hA
    obtain ⟨A₀, hA₀, rfl⟩ := Finset.mem_image.mp hA
    exact ⟨(v, A₀), ⟨v, hv, A₀, hA₀, rfl⟩, rfl⟩
  · rintro ⟨q, ⟨v, hv, A₀, hA₀, hqeq⟩, hfinal⟩
    have hdeg : H.degree v = 1 := by
      simp only [SG.favorable, Finset.mem_filter] at hv
      exact hv.2.1
    subst hqeq
    refine ⟨e v, ⟨v, hv, rfl⟩, A₀.image e, ?_, ?_⟩
    · rw [C_ofSimpleGraph H e hdeg (SG.adj_nbrOf H hdeg)]
      exact Finset.mem_image.mpr ⟨A₀, hA₀, rfl⟩
    · simpa using hfinal

/-- **`N` transport:** identical to `P_ofSimpleGraph` at rank `p - 1`. -/
theorem N_ofSimpleGraph (e : V ≃ Fin (Fintype.card V)) (p : ℕ) :
    (ofSimpleGraph H e).N p
      = ((SG.favorable H p).biUnion
          (fun v => (SG.C H v (SG.nbrOf H v) (p - 1)).image (fun A => (v, A)))).image
          (fun q => (e q.1, q.2.image e)) := by
  apply Finset.ext
  rintro ⟨a, B⟩
  simp only [Graph.N, Finset.mem_biUnion, Finset.mem_image, favorable_ofSimpleGraph]
  constructor
  · rintro ⟨v', ⟨v, hv, rfl⟩, A, hA, hpair⟩
    rw [Prod.mk.injEq] at hpair
    obtain ⟨rfl, rfl⟩ := hpair
    have hdeg : H.degree v = 1 := by
      simp only [SG.favorable, Finset.mem_filter] at hv
      exact hv.2.1
    rw [C_ofSimpleGraph H e hdeg (SG.adj_nbrOf H hdeg)] at hA
    obtain ⟨A₀, hA₀, rfl⟩ := Finset.mem_image.mp hA
    exact ⟨(v, A₀), ⟨v, hv, A₀, hA₀, rfl⟩, rfl⟩
  · rintro ⟨q, ⟨v, hv, A₀, hA₀, hqeq⟩, hfinal⟩
    have hdeg : H.degree v = 1 := by
      simp only [SG.favorable, Finset.mem_filter] at hv
      exact hv.2.1
    subst hqeq
    refine ⟨e v, ⟨v, hv, rfl⟩, A₀.image e, ?_, ?_⟩
    · rw [C_ofSimpleGraph H e hdeg (SG.adj_nbrOf H hdeg)]
      exact Finset.mem_image.mpr ⟨A₀, hA₀, rfl⟩
    · simpa using hfinal

end Realization
end Graph
end R23

/-! ## Non-vacuity control (`SOLUTION-CONTRACT.md` §6 discipline)

A REAL, nonzero instantiation of `C_ofSimpleGraph` — not merely a
type-check. Kernel `decide` only, no `native_decide`, no custom axioms. -/

namespace R23
namespace Graph

/-- `C_ofSimpleGraph` instantiated on the sealed `K_{1,6}` fixture's Mathlib
    view (`k16.toSimpleGraph`, C2-LEDGER `R23-C2-02`'s adjudicated
    non-vacuous graph) at its leaf `1` (support/center `0`), realized at the
    IDENTITY relabeling, rank `5`: the transport equation holds, and the
    abstract-side count is the real, nonzero value `1` — reached through a
    code path (Mathlib `IsIndepSet` filtering on `bCarrier`) sharing no
    definition with the encoding's own `IndOn`/`C` filter that
    `k16_row_nonvacuous` (`ActualTree.lean`) exercises. -/
theorem k16_C_transport_nonvacuous_control :
    (ofSimpleGraph k16.toSimpleGraph (Equiv.refl (Fin 7))).C 1 5
      = (SG.C k16.toSimpleGraph 1 0 5).image (Finset.image (Equiv.refl (Fin 7)))
    ∧ (SG.C k16.toSimpleGraph 1 0 5).card = 1 := by
  refine ⟨?_, by decide⟩
  exact C_ofSimpleGraph k16.toSimpleGraph (Equiv.refl (Fin 7))
    (v := (1 : Fin 7)) (s := (0 : Fin 7)) (by decide) (by decide) 5

end Graph
end R23
