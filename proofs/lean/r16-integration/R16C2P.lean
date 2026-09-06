import NNSeqAdmission
import R16C2Base

/-!
# R16C2P — LAW IV′, compiled P-side on the world-neutral data
# (r16 Cycle 2, route R16C2-T; W4 of the C2 allocation)

PROTOTYPE (grade `RG` AT BEST after critics and a gate act; nothing here is
`governed`; nothing is ever `formally_verified`).

## Ceiling honesty (undetachable)

TREE / FOREST / TRANSFER / COUNTEREXAMPLE open before and after.
`AmbientTargetDeg2`, (α), (β), (A), (B) are targets never asserted. This
file compiles LAW IV′ (per-index order-realizability) over abstract
base-typed data and discharges it at the C2 strata's data shapes — nothing
more. No unimodality, log-concavity, or sign fact is concluded of anything
(F1/F2 not approached); PREMISE K is not mentioned, let alone imported.
Per F-c of record: IV′ is an existence statement INSIDE the P-world formal
model; it neither re-derives nor upgrades the r10 claim-C6 model-adequacy
citation, which STAYS A CITATION.

## NO SHIMS (restated and honored)

Nothing here assumes a cross-world correspondence. This module cannot even
see the T-world (the clash of record); it imports the P-lineage + the
abstract base ONLY (F-a as frozen: IV′'s module may import WORLD-P's
`RTree` half — that is its home — but never both worlds). LAW IV′ is
stated on bare base-typed data `(s, f, ord)`; the T-world packs carry
their data at exactly these base types (FC-R16-1's rider), and at the four
concrete stratum witnesses the data triples below are LITERALLY the same
closed terms the T-world packs carry — the two halves meet on world-neutral
terms, each half kernel-proved inside its own world.

## Re-authoring note (W4)

The C1 adjudicator's compiled `LawIVPrime` form is the SEED; this module
re-authors it (per the allocation: "to be re-authored by the route, not
consumed from adjudicator-receipts/"). The general
rank-1-coefficient-equals-order lemma (R16-RES-3, carried to C2) is
compiled below as `indepNNSeq_coeff_one`.

## Reserved zone

`Ipoly`/`Apoly`/`Bpoly`/`Fpoly` exist in this world's vocabulary but no
proof below mentions, unfolds, or invokes them, nor any availability
recursion or blocked-root state; the r12 Q1–Q6 boundary is not approached.
Used exactly: `RTree.vertices_leaf`, `RTree.mem_vertices_node`,
`RTree.indep_leaf_empty`, `RTree.indep_leaf_singleton`, `RTree.IndepSet`,
`RTree.indepNNSeq`, `RTree.indepNNSeq_coeff` (all consumed from the sealed
r10/r14-C2P lineage, never re-derived).

## Invariance

`LawIVPrime` is a proposition about `(s, f, ord)` alone. Every stratum
discharge below is a proposition about its stated arguments only; every
existential witness (the realizing trees) is exhibited and no concluded
property depends on the exhibition (A16).

## Fence check

No computation, `#eval`, `decide`, `native_decide`, search, or sampling; no
fence row of `REJECTED-MECHANISMS.md` is approached.
-/

open scoped Classical
open Erdos993C8U1
noncomputable section

namespace R16C2

/-! ## §1 — LAW IV′ (FC-R16-1, symbol-for-symbol; P-world home) -/

/-- **LAW IV′ (per-index order-realizability; frozen).** Every block's
sequence is the independence sequence of an ACTUAL P-world tree of the
block's constructed order — inside Premise K's population. `RTree` here is
the P-world root inductive; the data is world-neutral. -/
def LawIVPrime (s : Finset (Finset (List ℕ))) (f : Finset (List ℕ) → NNSeq)
    (ord : Finset (List ℕ) → ℕ) : Prop :=
  ∀ C ∈ s, ∃ tr : RTree, f C = tr.indepNNSeq ∧ tr.vertices.card = ord C

/-! ## §2 — Small P-world lemmas (new; about the governed definitions) -/

/-- No vertex-address is adjacent to itself (P-world instance; the T-world
twin is the consumed `RTree.addrAdjacent_irrefl` — each world proves its
own, neither cites the other's). -/
theorem addrAdjacent_irrefl (x : List ℕ) : ¬ addrAdjacent x x := by
  rintro (⟨hne, he⟩ | ⟨hne, he⟩) <;>
  · have hlen : x.dropLast.length = x.length - 1 := List.length_dropLast
    rw [← he] at hlen
    have hpos : 0 < x.length := List.length_pos_of_ne_nil hne
    omega

/-- A singleton of a vertex is independent (P-world). -/
theorem indepSet_singleton_P (tr : RTree) {z : List ℕ} (hz : z ∈ tr.vertices) :
    tr.IndepSet ({z} : Finset (List ℕ)) := by
  refine ⟨Finset.singleton_subset_iff.mpr hz, ?_⟩
  intro u hu w hw
  rw [Finset.mem_singleton] at hu hw
  rw [hu, hw]
  exact addrAdjacent_irrefl z

/-! ## §3 — The general rank-1 lemma (R16-RES-3 discharge at general scope)

The at-scale anti-laundering lemma: the rank-1 coefficient of ANY P-world
tree's independence sequence IS its order, so no fabricated index can carry
order mass its sequence does not exhibit. -/

/-- **The general rank-1-coefficient-equals-order lemma.** For every
P-world tree, `(indepNNSeq).coeff 1 = |vertices|`: the size-1 independent
sets are exactly the vertex singletons. -/
theorem indepNNSeq_coeff_one (tr : RTree) :
    tr.indepNNSeq.coeff (1 : ℤ) = (tr.vertices.card : NNRat) := by
  rw [RTree.indepNNSeq_coeff]
  congr 1
  have himage : (tr.vertices.powerset.filter
      (fun S => tr.IndepSet S ∧ (S.card : ℤ) = 1))
      = tr.vertices.image (fun z => ({z} : Finset (List ℕ))) := by
    ext S
    rw [Finset.mem_filter, Finset.mem_powerset, Finset.mem_image]
    constructor
    · rintro ⟨hsub, _, hcard⟩
      have hc1 : S.card = 1 := by exact_mod_cast hcard
      obtain ⟨z, rfl⟩ := Finset.card_eq_one.mp hc1
      exact ⟨z, hsub (Finset.mem_singleton_self z), rfl⟩
    · rintro ⟨z, hz, rfl⟩
      exact ⟨Finset.singleton_subset_iff.mpr hz, indepSet_singleton_P tr hz,
        by rw [Finset.card_singleton]; norm_num⟩
  rw [himage, Finset.card_image_of_injective _ Finset.singleton_injective]

/-! ## §4 — The realizing trees for the C2 strata -/

/-- The P-world one-vertex tree. -/
def trOne : RTree := RTree.node []

/-- The P-world two-vertex path. -/
def trTwo : RTree := RTree.node [RTree.node []]

/-- **The P-world anchor of the order-1 witness** (re-authored from the C1
S-4 pair at the C2 witness term): the one-vertex tree's independence
sequence IS the shared base witness `1 + x`. -/
theorem oneVertex_indepNNSeq : trOne.indepNNSeq = oneVertexSeq := by
  unfold RTree.indepNNSeq trOne
  have hset : ((RTree.node ([] : List RTree)).vertices.powerset.filter
      (fun S => (RTree.node ([] : List RTree)).IndepSet S))
      = {(∅ : Finset (List ℕ)), ({([] : List ℕ)} : Finset (List ℕ))} := by
    rw [RTree.vertices_leaf]
    ext S
    simp only [Finset.mem_filter, Finset.mem_powerset, Finset.mem_insert,
      Finset.mem_singleton, Finset.subset_singleton_iff]
    constructor
    · rintro ⟨hsub, _⟩
      exact hsub
    · rintro (rfl | rfl)
      · exact ⟨Or.inl rfl, RTree.indep_leaf_empty⟩
      · exact ⟨Or.inr rfl, RTree.indep_leaf_singleton⟩
  have hne : (∅ : Finset (List ℕ)) ∉ ({({([] : List ℕ)} : Finset (List ℕ))} :
      Finset (Finset (List ℕ))) := by
    rw [Finset.mem_singleton]
    exact fun h => Finset.singleton_ne_empty _ h.symm
  rw [hset, Finset.sum_insert hne, Finset.sum_singleton,
    Finset.card_empty, Finset.card_singleton]
  unfold oneVertexSeq
  norm_num

/-- Order fidelity anchor: the one-vertex tree has order 1. -/
theorem oneVertex_order : trOne.vertices.card = 1 := by
  unfold trOne
  rw [RTree.vertices_leaf]
  exact Finset.card_singleton _

/-- The two-vertex path's vertex set (P-world computation). -/
theorem trTwo_vertices : trTwo.vertices = {([] : List ℕ), [0]} := by
  ext w
  rw [trTwo, RTree.mem_vertices_node]
  constructor
  · rintro (rfl | ⟨i, p, hp, rfl⟩)
    · simp
    · fin_cases i
      simp only [List.get] at hp ⊢
      rw [RTree.vertices_leaf, Finset.mem_singleton] at hp
      subst hp
      simp
  · intro hw
    rw [Finset.mem_insert, Finset.mem_singleton] at hw
    rcases hw with rfl | rfl
    · exact Or.inl rfl
    · refine Or.inr ⟨⟨0, by simp⟩, [], ?_, rfl⟩
      simp only [List.get]
      rw [RTree.vertices_leaf]
      exact Finset.mem_singleton_self _

/-- The root and its child are adjacent in the two-vertex path. -/
theorem trTwo_adj : addrAdjacent ([] : List ℕ) [0] :=
  Or.inl ⟨by simp, by simp [List.dropLast]⟩

/-- **The P-world anchor of the order-2 witness**: the two-vertex path's
independence sequence IS the shared base witness `1 + 2x` — three
independent sets (∅ and the two singletons), no independent pair. -/
theorem twoPath_indepNNSeq : trTwo.indepNNSeq = twoPathSeq := by
  unfold RTree.indepNNSeq
  have hset : (trTwo.vertices.powerset.filter (fun S => trTwo.IndepSet S))
      = {(∅ : Finset (List ℕ)), ({([] : List ℕ)} : Finset (List ℕ)),
         ({([0] : List ℕ)} : Finset (List ℕ))} := by
    rw [trTwo_vertices]
    ext S
    rw [Finset.mem_filter, Finset.mem_powerset, Finset.mem_insert,
      Finset.mem_insert, Finset.mem_singleton]
    constructor
    · rintro ⟨hsub, hind⟩
      rcases subset_pair_cases hsub with rfl | rfl | rfl | rfl
      · exact Or.inl rfl
      · exact Or.inr (Or.inl rfl)
      · exact Or.inr (Or.inr rfl)
      · exact absurd trTwo_adj
          (hind.2 [] (Finset.mem_insert_self _ _)
            [0] (Finset.mem_insert_of_mem (Finset.mem_singleton_self _)))
    · have hmr : ([] : List ℕ) ∈ trTwo.vertices := by
        rw [trTwo_vertices]
        exact Finset.mem_insert_self _ _
      have hmc : ([0] : List ℕ) ∈ trTwo.vertices := by
        rw [trTwo_vertices]
        exact Finset.mem_insert_of_mem (Finset.mem_singleton_self _)
      rintro (rfl | rfl | rfl)
      · refine ⟨Finset.empty_subset _, Finset.empty_subset _, ?_⟩
        intro u hu
        exact absurd hu (Finset.notMem_empty u)
      · refine ⟨?_, indepSet_singleton_P trTwo hmr⟩
        intro x hx
        rw [Finset.mem_singleton] at hx
        subst hx
        exact Finset.mem_insert_self _ _
      · refine ⟨?_, indepSet_singleton_P trTwo hmc⟩
        intro x hx
        rw [Finset.mem_singleton] at hx
        subst hx
        exact Finset.mem_insert_of_mem (Finset.mem_singleton_self _)
  have h1 : (∅ : Finset (List ℕ))
      ∉ ({({([] : List ℕ)} : Finset (List ℕ)), ({([0] : List ℕ)} : Finset (List ℕ))} :
          Finset (Finset (List ℕ))) := by
    rw [Finset.mem_insert, Finset.mem_singleton]
    rintro (h | h) <;> exact Finset.singleton_ne_empty _ h.symm
  have h2 : ({([] : List ℕ)} : Finset (List ℕ))
      ∉ ({({([0] : List ℕ)} : Finset (List ℕ))} : Finset (Finset (List ℕ))) := by
    rw [Finset.mem_singleton]
    intro h
    have := Finset.singleton_injective h
    simp at this
  rw [hset, Finset.sum_insert h1, Finset.sum_insert h2, Finset.sum_singleton,
    Finset.card_empty, Finset.card_singleton, Finset.card_singleton,
    Nat.cast_zero, Nat.cast_one, ← AddMonoidAlgebra.single_add]
  unfold twoPathSeq
  have e11 : (1 : NNRat) + 1 = 2 := by norm_num
  rw [e11]

/-- Order fidelity anchor: the two-vertex path has order 2. -/
theorem twoPath_order : trTwo.vertices.card = 2 := by
  rw [trTwo_vertices]
  rw [Finset.card_insert_of_notMem (by rw [Finset.mem_singleton]; simp),
    Finset.card_singleton]

/-! ## §5 — LAW IV′ discharged at the C2 strata's data shapes

Each theorem below is FULLY COMPILED in this P-world module over base-typed
data. At the four concrete stratum witnesses the instantiating triples are
LITERALLY the closed terms the T-world packs carry (`sSigma0`…`sSigma3`,
`fOne`/`fTwo`, `ordCard`); the parameterized forms quantify over base-typed
addresses only, so every T-side stratum's data shape is covered. -/

/-- IV′ at stratum σ0: the empty family (vacuous, compiled). -/
theorem lawIVPrime_empty (f : Finset (List ℕ) → NNSeq)
    (ord : Finset (List ℕ) → ℕ) : LawIVPrime ∅ f ord := by
  intro C hC
  exact absurd hC (Finset.notMem_empty C)

/-- IV′ at the σ1 data shape: one singleton block, the order-1 witness,
the frozen `ord` binding — realized by `trOne`. -/
theorem lawIVPrime_singleton (z : List ℕ) :
    LawIVPrime {({z} : Finset (List ℕ))} fOne ordCard := by
  intro C hC
  rw [Finset.mem_singleton] at hC
  subst hC
  refine ⟨trOne, oneVertex_indepNNSeq.symm, ?_⟩
  rw [oneVertex_order]
  unfold ordCard
  rw [Finset.card_singleton]

/-- IV′ at the σ2 data shape: two singleton blocks, the order-1 witness on
each, the frozen `ord` binding — each realized by `trOne`. -/
theorem lawIVPrime_twoSingletons (z₁ z₂ : List ℕ) :
    LawIVPrime {({z₁} : Finset (List ℕ)), ({z₂} : Finset (List ℕ))} fOne ordCard := by
  intro C hC
  have hcase : C = ({z₁} : Finset (List ℕ)) ∨ C = ({z₂} : Finset (List ℕ)) := by
    rcases Finset.mem_insert.mp hC with h | h
    · exact Or.inl h
    · exact Or.inr (Finset.mem_singleton.mp h)
  rcases hcase with rfl | rfl <;>
  · refine ⟨trOne, oneVertex_indepNNSeq.symm, ?_⟩
    rw [oneVertex_order]
    unfold ordCard
    rw [Finset.card_singleton]

/-- IV′ at the σ3 data shape: one two-element block, the order-2 witness,
the frozen `ord` binding — realized by `trTwo` (needs `a ≠ b` so that the
block's cardinality is genuinely 2). -/
theorem lawIVPrime_pair {a b : List ℕ} (hne : a ≠ b) :
    LawIVPrime {({a, b} : Finset (List ℕ))} fTwo ordCard := by
  intro C hC
  rw [Finset.mem_singleton] at hC
  subst hC
  refine ⟨trTwo, twoPath_indepNNSeq.symm, ?_⟩
  rw [twoPath_order]
  unfold ordCard
  rw [Finset.card_insert_of_notMem (by rw [Finset.mem_singleton]; exact hne),
    Finset.card_singleton]

/-! ## §6 — IV′ at the four CONCRETE stratum witnesses (literally the
T-side packs' closed data triples; C1-AMD-4 companions) -/

theorem lawIVPrime_sigma0 : LawIVPrime sSigma0 fOne ordCard :=
  lawIVPrime_empty fOne ordCard

theorem lawIVPrime_sigma1 : LawIVPrime sSigma1 fOne ordCard :=
  lawIVPrime_singleton [0, 0]

theorem lawIVPrime_sigma2 : LawIVPrime sSigma2 fOne ordCard :=
  lawIVPrime_twoSingletons [0, 0] [1, 0]

theorem lawIVPrime_sigma3 : LawIVPrime sSigma3 fTwo ordCard :=
  lawIVPrime_pair (by simp)

end R16C2
