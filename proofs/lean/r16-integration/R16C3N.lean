import R16C2Base

/-!
# R16C3N — the world-neutral block-structure layer (r16 Cycle 3, route R16C3-T)

PROTOTYPE (grade `RG` AT BEST after critics and a gate act; nothing here is
`governed`; nothing is ever `formally_verified`).

## Ceiling honesty (undetachable)

TREE / FOREST / TRANSFER / COUNTEREXAMPLE open before and after.
`AmbientTargetDeg2`, (α), (β), (A), (B) are targets never asserted. This file
proves nothing about any tree or forest of either world: it is pure base
combinatorics — lists of naturals, finsets of such lists, and closed abstract
`NNSeq` terms. `AdjacentLogConcave` is never concluded of anything (PREMISE
K's slot; never kernel-imported). NO SHIMS: this module is neutral ground —
it imports NEITHER world's `RTree` (only the abstract base chain through
`R16C2Base`), assumes no cross-world correspondence, and stipulates nothing.

## The neutral adjacency (disclosure on the face)

`nbAdjacent` below is a FRESH base-level predicate whose defining formula is,
symbol for symbol, the parent–child address relation each world's sealed
lineage declares as its own root-level `addrAdjacent`. Each world module of
this route proves, INSIDE ITS OWN import closure, the definitional bridge
`addrAdjacent u w ↔ nbAdjacent u w` (an `Iff.rfl`-level kernel theorem, never
a stipulation). This is the FC-R16-2 head-2 meeting-on-world-neutral-data
pattern, at the adjacency level, exactly as the C2 gate already accepted it
for `R16C2.addrAdjacent_irrefl` (H-STR NOTE-10 resolution: a single-world
twin, not a G-3 re-derivation — here the twin is world-free). The gate note
G-3 still travels for the T-side laws: the laws are about the T-lineage's own
inherited `addrAdjacent`; `nbAdjacent` enters only as the meeting-point data.

## Consume-vs-re-derive

The cons/nil adjacency lemmas below re-author, at the neutral level, the
statement shapes of the sealed T-lineage (`addrAdjacent_cons_cons`,
`not_addrAdjacent_cons_cons_of_ne`, `addrAdjacent_nil_iff`) — the governed
twins live in a T-world module that this neutral base MAY NOT import (the
same class as C2's re-authored `single_card_coeff`, C1 adjudication ruling
§5(a)); their proofs are fresh here, following the sealed proofs as
precedent. Disclosed.

## Invariance

Every definition is a closed term or a function of its stated arguments
only; no vertex ordering, address convention, or index choice enters any
definition. Existential witnesses (the root `r`, the normalized set `Q`)
are exhibited; no concluded property depends on the exhibition (A16).

## Fence check

No computation, `#eval`, `decide`, `native_decide`, search, or sampling.
F1/F2 not approached: no unimodality or log-concavity is CONCLUDED of any
object; no fence row of `REJECTED-MECHANISMS.md` is approached. Reserved
I/A/B zone: not mentioned; the r12 Q1–Q6 boundary travels verbatim and is
not approached.
-/

open scoped Classical
noncomputable section

namespace R16C3

open Erdos993C8U1

/-! ## §1 — The neutral adjacency and its combinatorics -/

/-- **The neutral parent–child address relation** (see the module header
disclosure): one address is obtained from the other by dropping exactly its
last child-index. Pure base content; mentions no world. -/
def nbAdjacent (u w : List ℕ) : Prop :=
  (w ≠ [] ∧ u = w.dropLast) ∨ (u ≠ [] ∧ w = u.dropLast)

theorem nbAdjacent_comm (u w : List ℕ) : nbAdjacent u w ↔ nbAdjacent w u := by
  unfold nbAdjacent; tauto

theorem nbAdjacent_irrefl (x : List ℕ) : ¬ nbAdjacent x x := by
  rintro (⟨hne, he⟩ | ⟨hne, he⟩) <;>
  · have hlen : x.dropLast.length = x.length - 1 := List.length_dropLast
    rw [← he] at hlen
    have hpos : 0 < x.length := List.length_pos_of_ne_nil hne
    omega

theorem nbAdjacent_nil_iff (w : List ℕ) : nbAdjacent ([] : List ℕ) w ↔ w.length = 1 := by
  unfold nbAdjacent
  constructor
  · rintro (⟨hne, he⟩ | ⟨hne, -⟩)
    · have hlen : w.dropLast.length = w.length - 1 := List.length_dropLast
      rw [← he] at hlen
      simp only [List.length_nil] at hlen
      have hpos : 0 < w.length := List.length_pos_of_ne_nil hne
      omega
    · exact absurd rfl hne
  · intro hlen
    left
    have hw : w ≠ [] := by rintro rfl; simp at hlen
    refine ⟨hw, ?_⟩
    have hlen0 : w.dropLast.length = 0 := by rw [List.length_dropLast]; omega
    exact (List.length_eq_zero_iff.mp hlen0).symm

theorem nbAdjacent_cons_cons (i : ℕ) (p q : List ℕ) :
    nbAdjacent (i :: p) (i :: q) ↔ nbAdjacent p q := by
  unfold nbAdjacent
  constructor
  · rintro (⟨hne, he⟩ | ⟨hne, he⟩)
    · rcases eq_or_ne q [] with hq | hq
      · exfalso; rw [hq] at he; simp at he
      · rw [List.dropLast_cons_of_ne_nil hq] at he
        exact Or.inl ⟨hq, (List.cons.inj he).2⟩
    · rcases eq_or_ne p [] with hp | hp
      · exfalso; rw [hp] at he; simp at he
      · rw [List.dropLast_cons_of_ne_nil hp] at he
        exact Or.inr ⟨hp, (List.cons.inj he).2⟩
  · rintro (⟨hne, he⟩ | ⟨hne, he⟩)
    · exact Or.inl ⟨List.cons_ne_nil _ _, by rw [List.dropLast_cons_of_ne_nil hne]; rw [he]⟩
    · exact Or.inr ⟨List.cons_ne_nil _ _, by rw [List.dropLast_cons_of_ne_nil hne]; rw [he]⟩

theorem not_nbAdjacent_cons_cons_of_ne {i j : ℕ} (h : i ≠ j) (p q : List ℕ) :
    ¬ nbAdjacent (i :: p) (j :: q) := by
  unfold nbAdjacent
  rintro (⟨hne, he⟩ | ⟨hne, he⟩)
  · rcases eq_or_ne q [] with hq | hq
    · rw [hq] at he; simp at he
    · rw [List.dropLast_cons_of_ne_nil hq] at he
      exact h (List.cons.inj he).1
  · rcases eq_or_ne p [] with hp | hp
    · rw [hp] at he; simp at he
    · rw [List.dropLast_cons_of_ne_nil hp] at he
      exact h (List.cons.inj he).1.symm

theorem nbAdjacent_append_left (r : List ℕ) (p q : List ℕ) :
    nbAdjacent (r ++ p) (r ++ q) ↔ nbAdjacent p q := by
  induction r with
  | nil => rfl
  | cons a r ih =>
    show nbAdjacent (a :: (r ++ p)) (a :: (r ++ q)) ↔ nbAdjacent p q
    rw [nbAdjacent_cons_cons, ih]

/-! ## §2 — List helpers (fresh; small, name-stable proofs) -/

theorem dropLast_eq_take' : ∀ l : List ℕ, l.dropLast = l.take (l.length - 1)
  | [] => rfl
  | [_] => rfl
  | a :: b :: m => by
    rw [List.dropLast_cons_of_ne_nil (List.cons_ne_nil b m)]
    show a :: (b :: m).dropLast = (a :: b :: m).take (m.length + 2 - 1)
    have h2 : m.length + 2 - 1 = m.length + 1 := rfl
    rw [h2, List.take_succ_cons, dropLast_eq_take' (b :: m)]
    show a :: (b :: m).take ((b :: m).length - 1) = a :: (b :: m).take m.length
    have h3 : (b :: m).length - 1 = m.length := rfl
    rw [h3]

theorem drop_dropLast_comm : ∀ (l : List ℕ) (n : ℕ), (l.drop n).dropLast = l.dropLast.drop n
  | [], n => by simp
  | _ :: _, 0 => by simp
  | a :: l, (n + 1) => by
    show (l.drop n).dropLast = (a :: l).dropLast.drop (n + 1)
    cases l with
    | nil => simp
    | cons b m =>
      rw [List.dropLast_cons_of_ne_nil (List.cons_ne_nil b m)]
      show (( b :: m).drop n).dropLast = ((b :: m).dropLast).drop n
      exact drop_dropLast_comm (b :: m) n

/-- Take-closure of a dropLast-downward-closed finite set of addresses. -/
theorem take_mem_of_downclosed {Q : Finset (List ℕ)}
    (hdc : ∀ p ∈ Q, p ≠ [] → p.dropLast ∈ Q) :
    ∀ u ∈ Q, ∀ k : ℕ, u.take k ∈ Q := by
  have aux : ∀ d : ℕ, ∀ u ∈ Q, ∀ k, u.length ≤ k + d → u.take k ∈ Q := by
    intro d
    induction d with
    | zero =>
      intro u hu k hk
      rw [List.take_of_length_le (by omega)]
      exact hu
    | succ d ihd =>
      intro u hu k hk
      by_cases hlk : u.length ≤ k
      · rw [List.take_of_length_le hlk]; exact hu
      · have h1 : u.take (k + 1) ∈ Q := ihd u hu (k + 1) (by omega)
        have hlen1 : (u.take (k + 1)).length = k + 1 := by
          rw [List.length_take]; omega
        have hne : u.take (k + 1) ≠ [] := by
          intro h; rw [h] at hlen1; simp at hlen1
        have h3 : (u.take (k + 1)).dropLast = u.take k := by
          rw [dropLast_eq_take', hlen1, List.take_take]
          have h4 : k + 1 - 1 = k := rfl
          rw [h4, min_eq_left (by omega : k ≤ k + 1)]
        rw [← h3]
        exact hdc _ h1 hne
  intro u hu k
  exact aux u.length u hu k (by omega)

theorem singleton_headI_of_length_one : ∀ u : List ℕ, u.length = 1 → u = [u.headI]
  | [], h => by simp at h
  | a :: l, h => by
    have : l.length = 0 := by
      simp only [List.length_cons] at h; omega
    rw [List.length_eq_zero_iff.mp this]
    rfl

/-! ## §3 — The neutral evaluation `nbSeqOn` (the general block-evaluation object)

`nbSeqOn V` is the single-card sum over the `nbAdjacent`-free subsets of `V`
— a CLOSED base-level function `Finset (List ℕ) → NNSeq`. It is the general
successor of the C2 closed witnesses `oneVertexSeq`/`twoPathSeq`: each world
of this route proves, inside its own closure, that its own canonical
per-block evaluation equals `nbSeqOn` (T: `seqOn t V = nbSeqOn V` on
`V ⊆ t.vertices`; P: `tr.indepNNSeq = nbSeqOn tr.vertices`). -/

/-- The `nbAdjacent`-free subsets of `V`. -/
def nbIndepFamily (V : Finset (List ℕ)) : Finset (Finset (List ℕ)) :=
  V.powerset.filter (fun S => ∀ u ∈ S, ∀ w ∈ S, ¬ nbAdjacent u w)

theorem mem_nbIndepFamily (V S : Finset (List ℕ)) :
    S ∈ nbIndepFamily V ↔ S ⊆ V ∧ ∀ u ∈ S, ∀ w ∈ S, ¬ nbAdjacent u w := by
  unfold nbIndepFamily
  simp only [Finset.mem_filter, Finset.mem_powerset]

/-- **The neutral per-block count sequence.** -/
def nbSeqOn (V : Finset (List ℕ)) : NNSeq :=
  ∑ S ∈ nbIndepFamily V, AddMonoidAlgebra.single (S.card : ℤ) (1 : NNRat)

theorem nbSeqOn_coeff (V : Finset (List ℕ)) (k : ℤ) :
    (nbSeqOn V).coeff k
      = (((nbIndepFamily V).filter (fun S => (S.card : ℤ) = k)).card : NNRat) := by
  unfold nbSeqOn
  exact R16C2.single_card_coeff _ _ k

/-- **Invariance of `nbSeqOn` under adjacency-preserving relabelling** — the
engine that lets a block's count sequence travel across an exhibited
bijection (never a stipulated one): if `φ` is injective on `V` and preserves
`nbAdjacent` in both directions on `V`, then `nbSeqOn (V.image φ) = nbSeqOn
V`. Proved by the EXPLICIT bijection `T ↦ V.filter (φ · ∈ T)` with inverse
`S ↦ S.image φ`, via `Finset.sum_nbij'` — the frozen L5 proof shape, reused
as precedent; never an algebraic shortcut. -/
theorem nbSeqOn_image {φ : List ℕ → List ℕ} {V : Finset (List ℕ)}
    (hinj : Set.InjOn φ V)
    (hadj : ∀ u ∈ V, ∀ w ∈ V, (nbAdjacent (φ u) (φ w) ↔ nbAdjacent u w)) :
    nbSeqOn (V.image φ) = nbSeqOn V := by
  classical
  unfold nbSeqOn
  apply Finset.sum_nbij'
    (fun T : Finset (List ℕ) => V.filter (fun u => φ u ∈ T))
    (fun S : Finset (List ℕ) => S.image φ)
  · intro T hT
    rw [mem_nbIndepFamily] at hT ⊢
    obtain ⟨hTsub, hTfree⟩ := hT
    refine ⟨Finset.filter_subset _ _, ?_⟩
    intro u hu w hw
    rw [Finset.mem_filter] at hu hw
    intro hadj'
    exact hTfree (φ u) hu.2 (φ w) hw.2 ((hadj u hu.1 w hw.1).mpr hadj')
  · intro S hS
    rw [mem_nbIndepFamily] at hS ⊢
    obtain ⟨hSsub, hSfree⟩ := hS
    refine ⟨Finset.image_subset_image hSsub, ?_⟩
    intro x hx y hy
    rw [Finset.mem_image] at hx hy
    obtain ⟨u, hu, rfl⟩ := hx
    obtain ⟨w, hw, rfl⟩ := hy
    intro hadj'
    exact hSfree u hu w hw ((hadj u (hSsub hu) w (hSsub hw)).mp hadj')
  · intro T hT
    rw [mem_nbIndepFamily] at hT
    ext x
    rw [Finset.mem_image]
    constructor
    · rintro ⟨u, hu, rfl⟩
      rw [Finset.mem_filter] at hu
      exact hu.2
    · intro hx
      have hx' := hT.1 hx
      rw [Finset.mem_image] at hx'
      obtain ⟨u, hu, rfl⟩ := hx'
      exact ⟨u, Finset.mem_filter.mpr ⟨hu, hx⟩, rfl⟩
  · intro S hS
    rw [mem_nbIndepFamily] at hS
    ext u
    rw [Finset.mem_filter]
    constructor
    · rintro ⟨huV, hu⟩
      rw [Finset.mem_image] at hu
      obtain ⟨s, hs, hφ⟩ := hu
      have : s = u := hinj (hS.1 hs) huV hφ
      rw [← this]; exact hs
    · intro hu
      exact ⟨hS.1 hu, Finset.mem_image_of_mem φ hu⟩
  · intro T hT
    rw [mem_nbIndepFamily] at hT
    have himg : (V.filter (fun u => φ u ∈ T)).image φ = T := by
      ext x
      rw [Finset.mem_image]
      constructor
      · rintro ⟨u, hu, rfl⟩
        rw [Finset.mem_filter] at hu
        exact hu.2
      · intro hx
        have hx' := hT.1 hx
        rw [Finset.mem_image] at hx'
        obtain ⟨u, hu, rfl⟩ := hx'
        exact ⟨u, Finset.mem_filter.mpr ⟨hu, hx⟩, rfl⟩
    have hinj' : Set.InjOn φ (V.filter (fun u => φ u ∈ T)) :=
      hinj.mono (fun u hu => (Finset.mem_filter.mp hu).1)
    have hcard : (V.filter (fun u => φ u ∈ T)).card = T.card := by
      calc (V.filter (fun u => φ u ∈ T)).card
          = ((V.filter (fun u => φ u ∈ T)).image φ).card :=
            (Finset.card_image_of_injOn hinj').symm
        _ = T.card := by rw [himg]
    rw [hcard]

/-! ## §4 — Connected blocks and the component extraction (neutral form) -/

/-- The adjacency relation restricted to `U` (both endpoints in `U`). -/
def nbRel (U : Finset (List ℕ)) : List ℕ → List ℕ → Prop :=
  fun a b => a ∈ U ∧ b ∈ U ∧ nbAdjacent a b

theorem nbRel_symm (U : Finset (List ℕ)) : ∀ a b, nbRel U a b → nbRel U b a :=
  fun _ _ h => ⟨h.2.1, h.1, (nbAdjacent_comm _ _).mp h.2.2⟩

/-- Reflexive-transitive closure of a relation with a symmetry rule is
symmetric (fresh helper; the Mathlib form is instance-typed at this pin). -/
theorem reflTransGen_symm_of {α : Type*} {r : α → α → Prop}
    (hsym : ∀ a b, r a b → r b a) {a b : α}
    (h : Relation.ReflTransGen r a b) : Relation.ReflTransGen r b a := by
  induction h with
  | refl => exact Relation.ReflTransGen.refl
  | tail hab hbc ih =>
    exact Relation.ReflTransGen.trans
      (Relation.ReflTransGen.single (hsym _ _ hbc)) ih

/-- Reachability inside `U`. -/
def nbReach (U : Finset (List ℕ)) (u w : List ℕ) : Prop :=
  Relation.ReflTransGen (nbRel U) u w

theorem nbReach_symm {U : Finset (List ℕ)} {u w : List ℕ} (h : nbReach U u w) :
    nbReach U w u :=
  reflTransGen_symm_of (nbRel_symm U) h

theorem nbReach_trans {U : Finset (List ℕ)} {u w x : List ℕ}
    (h1 : nbReach U u w) (h2 : nbReach U w x) : nbReach U u x :=
  Relation.ReflTransGen.trans h1 h2

/-- **The definitional component extraction (W1-general):** the block of `u`
is the set of members of `U` reachable from `u` inside `U`. -/
def nbBlockOf (U : Finset (List ℕ)) (u : List ℕ) : Finset (List ℕ) :=
  U.filter (fun w => nbReach U u w)

/-- **The block family: the connected components of `U` under `nbAdjacent`.** -/
def nbComponents (U : Finset (List ℕ)) : Finset (Finset (List ℕ)) :=
  U.image (nbBlockOf U)

theorem mem_nbBlockOf {U : Finset (List ℕ)} {u w : List ℕ} :
    w ∈ nbBlockOf U u ↔ w ∈ U ∧ nbReach U u w := by
  unfold nbBlockOf
  exact Finset.mem_filter

theorem nbBlockOf_subset (U : Finset (List ℕ)) (u : List ℕ) :
    nbBlockOf U u ⊆ U :=
  Finset.filter_subset _ _

theorem self_mem_nbBlockOf {U : Finset (List ℕ)} {u : List ℕ} (hu : u ∈ U) :
    u ∈ nbBlockOf U u :=
  mem_nbBlockOf.mpr ⟨hu, Relation.ReflTransGen.refl⟩

theorem nbBlockOf_eq_of_reach {U : Finset (List ℕ)} {u w : List ℕ}
    (h : nbReach U u w) : nbBlockOf U u = nbBlockOf U w := by
  ext x
  rw [mem_nbBlockOf, mem_nbBlockOf]
  constructor
  · rintro ⟨hx, hr⟩
    exact ⟨hx, nbReach_trans (nbReach_symm h) hr⟩
  · rintro ⟨hx, hr⟩
    exact ⟨hx, nbReach_trans h hr⟩

theorem nbBlockOf_eq_of_mem_inter {U : Finset (List ℕ)} {u w x : List ℕ}
    (hxu : x ∈ nbBlockOf U u) (hxw : x ∈ nbBlockOf U w) :
    nbBlockOf U u = nbBlockOf U w := by
  rw [mem_nbBlockOf] at hxu hxw
  exact (nbBlockOf_eq_of_reach hxu.2).trans (nbBlockOf_eq_of_reach hxw.2).symm

theorem mem_of_mem_nbComponents {U : Finset (List ℕ)} {C : Finset (List ℕ)}
    (hC : C ∈ nbComponents U) : C ⊆ U := by
  unfold nbComponents at hC
  rw [Finset.mem_image] at hC
  obtain ⟨u, -, rfl⟩ := hC
  exact nbBlockOf_subset U u

/-- L1 engine, cover clause: the components cover `U` exactly. -/
theorem nbComponents_sup (U : Finset (List ℕ)) :
    (nbComponents U).sup id = U := by
  apply Finset.Subset.antisymm
  · intro x hx
    rw [Finset.mem_sup] at hx
    obtain ⟨C, hC, hxC⟩ := hx
    exact mem_of_mem_nbComponents hC hxC
  · intro u hu
    rw [Finset.mem_sup]
    exact ⟨nbBlockOf U u, Finset.mem_image_of_mem _ hu, self_mem_nbBlockOf hu⟩

/-- L1 engine, disjointness clause. -/
theorem nbComponents_disjoint (U : Finset (List ℕ)) :
    ∀ C ∈ nbComponents U, ∀ C' ∈ nbComponents U, C ≠ C' → Disjoint C C' := by
  intro C hC C' hC' hne
  unfold nbComponents at hC hC'
  rw [Finset.mem_image] at hC hC'
  obtain ⟨u, -, rfl⟩ := hC
  obtain ⟨w, -, rfl⟩ := hC'
  by_contra hnd
  obtain ⟨x, hxu, hxw⟩ := Finset.not_disjoint_iff.mp hnd
  exact hne (nbBlockOf_eq_of_mem_inter hxu hxw)

/-- L1 engine, no-empty-block clause. -/
theorem empty_notMem_nbComponents (U : Finset (List ℕ)) :
    ∅ ∉ nbComponents U := by
  intro h
  unfold nbComponents at h
  rw [Finset.mem_image] at h
  obtain ⟨u, hu, he⟩ := h
  have : u ∈ (∅ : Finset (List ℕ)) := he ▸ self_mem_nbBlockOf hu
  exact absurd this (Finset.notMem_empty u)

theorem nbComponents_nonempty {U : Finset (List ℕ)} {C : Finset (List ℕ)}
    (hC : C ∈ nbComponents U) : C.Nonempty := by
  unfold nbComponents at hC
  rw [Finset.mem_image] at hC
  obtain ⟨u, hu, rfl⟩ := hC
  exact ⟨u, self_mem_nbBlockOf hu⟩

/-- L2 engine: no cross-adjacency between distinct components. -/
theorem nbComponents_no_cross (U : Finset (List ℕ)) :
    ∀ C ∈ nbComponents U, ∀ C' ∈ nbComponents U, C ≠ C' →
      ∀ u ∈ C, ∀ w ∈ C', ¬ nbAdjacent u w := by
  intro C hC C' hC' hne u hu w hw hadj
  unfold nbComponents at hC hC'
  rw [Finset.mem_image] at hC hC'
  obtain ⟨a, -, rfl⟩ := hC
  obtain ⟨b, -, rfl⟩ := hC'
  have huU : u ∈ U := nbBlockOf_subset U a hu
  have hwU : w ∈ U := nbBlockOf_subset U b hw
  have hwa : w ∈ nbBlockOf U a := by
    rw [mem_nbBlockOf] at hu ⊢
    exact ⟨hwU, hu.2.tail ⟨huU, hwU, hadj⟩⟩
  exact hne (nbBlockOf_eq_of_mem_inter hwa hw)

/-- Chains inside `U` between members of a block stay inside the block:
the block-restricted reachability transport (the L3 engine's core). -/
theorem reach_within {U : Finset (List ℕ)} {u a b : List ℕ}
    (ha : nbReach U u a) (hab : nbReach U a b) :
    Relation.ReflTransGen
      (fun x y => x ∈ nbBlockOf U u ∧ y ∈ nbBlockOf U u ∧ nbAdjacent x y) a b := by
  induction hab with
  | refl => exact Relation.ReflTransGen.refl
  | @tail c d hac hcd ih =>
    have hcU : c ∈ U := hcd.1
    have hdU : d ∈ U := hcd.2.1
    have hcB : c ∈ nbBlockOf U u :=
      mem_nbBlockOf.mpr ⟨hcU, nbReach_trans ha hac⟩
    have hdB : d ∈ nbBlockOf U u :=
      mem_nbBlockOf.mpr ⟨hdU, (nbReach_trans ha hac).tail hcd⟩
    exact ih.tail ⟨hcB, hdB, hcd.2.2⟩

/-- L3 engine: each component is connected under block-restricted adjacency. -/
theorem nbComponents_connected (U : Finset (List ℕ)) :
    ∀ C ∈ nbComponents U, ∀ a ∈ C, ∀ b ∈ C,
      Relation.ReflTransGen (fun x y => x ∈ C ∧ y ∈ C ∧ nbAdjacent x y) a b := by
  intro C hC a ha b hb
  unfold nbComponents at hC
  rw [Finset.mem_image] at hC
  obtain ⟨u, -, rfl⟩ := hC
  rw [mem_nbBlockOf] at ha hb
  exact reach_within ha.2 (nbReach_trans (nbReach_symm ha.2) hb.2)

/-! ## §5 — Tree blocks: the neutral hypothesis package for LAW IV′ -/

/-- **A tree block**: a nonempty finite address set, connected under
adjacency restricted to itself. (Acyclicity is automatic for the
parent–child address relation — §6 makes it quantitative.) -/
def IsNbTreeBlock (C : Finset (List ℕ)) : Prop :=
  C.Nonempty ∧ ∀ u ∈ C, ∀ w ∈ C,
    Relation.ReflTransGen (fun a b => a ∈ C ∧ b ∈ C ∧ nbAdjacent a b) u w

/-- Every component of every `U` is a tree block. -/
theorem nbComponents_isTreeBlock (U : Finset (List ℕ)) :
    ∀ C ∈ nbComponents U, IsNbTreeBlock C := by
  intro C hC
  exact ⟨nbComponents_nonempty hC, nbComponents_connected U C hC⟩

/-! ## §6 — The structure theorem: root, prefix chain, and the edge count -/

/-- **The root/prefix-chain structure theorem.** A tree block has a
minimal-depth element `r`; every member has `r` as its take-prefix, and all
its truncations down to depth `|r|` lie in the block. -/
theorem treeBlock_root {C : Finset (List ℕ)} (hC : IsNbTreeBlock C) :
    ∃ r ∈ C, (∀ u ∈ C, r.length ≤ u.length) ∧ (∀ u ∈ C, u.take r.length = r) ∧
      (∀ u ∈ C, ∀ k, r.length ≤ k → k ≤ u.length → u.take k ∈ C) := by
  obtain ⟨hne, hconn⟩ := hC
  obtain ⟨r, hr, hmin⟩ := C.exists_min_image List.length hne
  have key : ∀ u : List ℕ,
      Relation.ReflTransGen (fun a b => a ∈ C ∧ b ∈ C ∧ nbAdjacent a b) r u →
      u.take r.length = r ∧ (∀ k, r.length ≤ k → k ≤ u.length → u.take k ∈ C) := by
    intro u h
    induction h with
    | refl =>
      refine ⟨List.take_length, ?_⟩
      intro k hk1 hk2
      have hk : k = r.length := le_antisymm hk2 hk1
      rw [hk, List.take_length]
      exact hr
    | @tail b c hab hbc ih =>
      obtain ⟨hbC, hcC, hadj⟩ := hbc
      rcases hadj with ⟨hcne, hbe⟩ | ⟨hbne, hce⟩
      · -- `b = c.dropLast`: `c` is a child of `b`
        have hlb : b.length = c.length - 1 := by
          rw [hbe, List.length_dropLast]
        have hcpos : 0 < c.length := List.length_pos_of_ne_nil hcne
        have hrb : r.length ≤ b.length := hmin b hbC
        have htk : ∀ k, k ≤ c.length - 1 → c.take k = b.take k := by
          intro k hk
          rw [hbe, dropLast_eq_take', List.take_take, min_eq_left hk]
        constructor
        · rw [htk r.length (by omega)]
          exact ih.1
        · intro k hk1 hk2
          by_cases hkc : k = c.length
          · rw [hkc, List.take_length]; exact hcC
          · have hk' : k ≤ c.length - 1 := by omega
            rw [htk k hk']
            exact ih.2 k hk1 (by omega)
      · -- `c = b.dropLast`: `c` is the parent of `b`
        have hlc : c.length = b.length - 1 := by
          rw [hce, List.length_dropLast]
        have hbpos : 0 < b.length := List.length_pos_of_ne_nil hbne
        have hrc : r.length ≤ c.length := hmin c hcC
        have htk : ∀ k, k ≤ b.length - 1 → c.take k = b.take k := by
          intro k hk
          rw [hce, dropLast_eq_take', List.take_take, min_eq_left hk]
        constructor
        · rw [htk r.length (by omega)]
          exact ih.1
        · intro k hk1 hk2
          rw [htk k (by omega)]
          exact ih.2 k hk1 (by omega)
  refine ⟨r, hr, hmin, fun u hu => (key u (hconn r hr u hu)).1,
    fun u hu => (key u (hconn r hr u hu)).2⟩

/-- **The L3′ engine (neutral form): a tree block satisfies the frozen
edge-count identity** — ordered adjacent pairs number `2·(|C| − 1)`. The
acyclicity is INTRINSIC to the parent–child address relation: every non-root
member contributes exactly its parent edge. -/
theorem treeBlock_edge_count {C : Finset (List ℕ)} (hC : IsNbTreeBlock C) :
    ((C ×ˢ C).filter (fun p => nbAdjacent p.1 p.2)).card = 2 * (C.card - 1) := by
  classical
  obtain ⟨r, hr, hmin, hpre, hchain⟩ := treeBlock_root hC
  -- facts about non-root members
  have hstrict : ∀ u ∈ C, u ≠ r → r.length < u.length := by
    intro u hu hne
    rcases lt_or_eq_of_le (hmin u hu) with h | h
    · exact h
    · exfalso
      apply hne
      have h2 := hpre u hu
      rw [h, List.take_length] at h2
      exact h2
  have hne_nil : ∀ u ∈ C, u ≠ r → u ≠ [] := by
    intro u hu hne h
    have := hstrict u hu hne
    rw [h] at this
    simp at this
  have hparent_mem : ∀ u ∈ C, u ≠ r → u.dropLast ∈ C := by
    intro u hu hne
    have h1 : r.length < u.length := hstrict u hu hne
    rw [dropLast_eq_take']
    exact hchain u hu (u.length - 1) (by omega) (by omega)
  have hparent_ne_or : ∀ a ∈ C, ∀ b ∈ C, nbAdjacent a b →
      (b ≠ r ∧ a = b.dropLast ∧ b ≠ []) ∨ (a ≠ r ∧ b = a.dropLast ∧ a ≠ []) := by
    intro a ha b hb hadj
    rcases hadj with ⟨hbne, hae⟩ | ⟨hane, hbe⟩
    · left
      refine ⟨?_, hae, hbne⟩
      intro hbr
      rw [hbr] at hae hbne
      have h1 : a.length = r.length - 1 := by rw [hae, List.length_dropLast]
      have h2 : 0 < r.length := List.length_pos_of_ne_nil hbne
      have h3 : r.length ≤ a.length := hmin a ha
      omega
    · right
      refine ⟨?_, hbe, hane⟩
      intro har
      rw [har] at hbe hane
      have h1 : b.length = r.length - 1 := by rw [hbe, List.length_dropLast]
      have h2 : 0 < r.length := List.length_pos_of_ne_nil hane
      have h3 : r.length ≤ b.length := hmin b hb
      omega
  set D : Finset (List ℕ) := C.erase r with hD
  have hDmem : ∀ u ∈ D, u ∈ C ∧ u ≠ r := by
    intro u hu
    rw [hD, Finset.mem_erase] at hu
    exact ⟨hu.2, hu.1⟩
  have hsplit : (C ×ˢ C).filter (fun p => nbAdjacent p.1 p.2)
      = D.image (fun u => (u, u.dropLast)) ∪ D.image (fun u => (u.dropLast, u)) := by
    ext ⟨a, b⟩
    rw [Finset.mem_filter, Finset.mem_product, Finset.mem_union,
      Finset.mem_image, Finset.mem_image]
    constructor
    · rintro ⟨⟨ha, hb⟩, hadj⟩
      rcases hparent_ne_or a ha b hb hadj with ⟨hbr, hae, -⟩ | ⟨har, hbe, -⟩
      · right
        refine ⟨b, ?_, ?_⟩
        · rw [hD, Finset.mem_erase]; exact ⟨hbr, hb⟩
        · rw [Prod.mk.injEq]; exact ⟨hae.symm, rfl⟩
      · left
        refine ⟨a, ?_, ?_⟩
        · rw [hD, Finset.mem_erase]; exact ⟨har, ha⟩
        · rw [Prod.mk.injEq]; exact ⟨rfl, hbe.symm⟩
    · rintro (⟨u, hu, he⟩ | ⟨u, hu, he⟩)
      · obtain ⟨huC, hur⟩ := hDmem u hu
        rw [Prod.mk.injEq] at he
        obtain ⟨he1, he2⟩ := he
        rw [← he1, ← he2]
        refine ⟨⟨huC, hparent_mem u huC hur⟩, ?_⟩
        exact Or.inr ⟨hne_nil u huC hur, rfl⟩
      · obtain ⟨huC, hur⟩ := hDmem u hu
        rw [Prod.mk.injEq] at he
        obtain ⟨he1, he2⟩ := he
        rw [← he1, ← he2]
        refine ⟨⟨hparent_mem u huC hur, huC⟩, ?_⟩
        exact Or.inl ⟨hne_nil u huC hur, rfl⟩
  have hinj1 : Function.Injective (fun u : List ℕ => (u, u.dropLast)) := by
    intro a b h
    exact congrArg Prod.fst h
  have hinj2 : Function.Injective (fun u : List ℕ => (u.dropLast, u)) := by
    intro a b h
    exact congrArg Prod.snd h
  have hdisj : Disjoint (D.image (fun u => (u, u.dropLast)))
      (D.image (fun u => (u.dropLast, u))) := by
    rw [Finset.disjoint_left]
    rintro ⟨a, b⟩ h1 h2
    rw [Finset.mem_image] at h1 h2
    obtain ⟨u, hu, heu⟩ := h1
    obtain ⟨w, hw, hew⟩ := h2
    rw [Prod.mk.injEq] at heu hew
    obtain ⟨huC, hur⟩ := hDmem u hu
    obtain ⟨hwC, hwr⟩ := hDmem w hw
    have hu0 : u ≠ [] := hne_nil u huC hur
    have hw0 : w ≠ [] := hne_nil w hwC hwr
    have hupos : 0 < u.length := List.length_pos_of_ne_nil hu0
    have hwpos : 0 < w.length := List.length_pos_of_ne_nil hw0
    -- a = u = w.dropLast; b = u.dropLast = w
    have h1' : u = w.dropLast := heu.1.trans hew.1.symm
    have h2' : u.dropLast = w := heu.2.trans hew.2.symm
    have hl1 : u.length = w.length - 1 := by rw [h1', List.length_dropLast]
    have hl2 : w.length = u.length - 1 := by rw [← h2', List.length_dropLast]
    omega
  rw [hsplit, Finset.card_union_of_disjoint hdisj,
    Finset.card_image_of_injective _ hinj1, Finset.card_image_of_injective _ hinj2,
    hD, Finset.card_erase_of_mem hr]
  omega

/-! ## §7 — Normalization: every tree block is a translated
dropLast-downward-closed set -/

/-- **The normalization theorem.** A tree block `C` with root `r` is the
translate by `r` of a dropLast-downward-closed address set `Q` containing
`[]`. The translate map `(r ++ ·)` is globally injective and preserves
`nbAdjacent` (§1), so `nbSeqOn C = nbSeqOn Q` and `|C| = |Q|` follow from
the invariance engine. -/
theorem treeBlock_normalize {C : Finset (List ℕ)} (hC : IsNbTreeBlock C) :
    ∃ (r : List ℕ) (Q : Finset (List ℕ)),
      [] ∈ Q ∧ (∀ p ∈ Q, p ≠ [] → p.dropLast ∈ Q) ∧
      C = Q.image (fun p => r ++ p) := by
  obtain ⟨r, hr, hmin, hpre, hchain⟩ := treeBlock_root hC
  refine ⟨r, C.image (fun u => u.drop r.length), ?_, ?_, ?_⟩
  · rw [Finset.mem_image]
    exact ⟨r, hr, List.drop_length⟩
  · intro p hp hpne
    rw [Finset.mem_image] at hp
    obtain ⟨u, hu, rfl⟩ := hp
    have hlen : r.length < u.length := by
      by_contra h
      rw [List.drop_eq_nil_of_le (by omega)] at hpne
      exact hpne rfl
    have hd : u.dropLast ∈ C := by
      rw [dropLast_eq_take']
      exact hchain u hu (u.length - 1) (by omega) (by omega)
    rw [Finset.mem_image]
    refine ⟨u.dropLast, hd, ?_⟩
    rw [drop_dropLast_comm]
  · ext u
    rw [Finset.mem_image]
    constructor
    · intro hu
      refine ⟨u.drop r.length, Finset.mem_image_of_mem _ hu, ?_⟩
      have h1 := hpre u hu
      calc r ++ u.drop r.length = u.take r.length ++ u.drop r.length := by rw [h1]
        _ = u := List.take_append_drop _ _
    · rintro ⟨p, hp, rfl⟩
      rw [Finset.mem_image] at hp
      obtain ⟨w, hw, rfl⟩ := hp
      have := hpre w hw
      have heq : r ++ w.drop r.length = w := by
        calc r ++ w.drop r.length = w.take r.length ++ w.drop r.length := by rw [this]
          _ = w := List.take_append_drop _ _
      rw [heq]
      exact hw

/-- The translate map is injective (globally). -/
theorem append_left_injOn (r : List ℕ) :
    Function.Injective (fun p : List ℕ => r ++ p) := by
  intro p q h
  exact List.append_cancel_left h

/-! ## §8 — The σ4 concrete stratum data (order-3 path block) and its
closed sequence -/

/-- The σ4 concrete block: the order-3 path `[0,0] — [0,0,0] — [0,0,0,0]`
(the `P₅`-rooted-at-an-end residual of record, computed T-side). -/
def sSigma4block : Finset (List ℕ) :=
  {([0, 0] : List ℕ), [0, 0, 0], [0, 0, 0, 0]}

/-- The σ4 block family: one order-3 block. -/
def sSigma4 : Finset (Finset (List ℕ)) := {sSigma4block}

/-- The closed order-3-path witness sequence `1 + 3x + x²`. -/
def threePathSeq : NNSeq :=
  AddMonoidAlgebra.single (0 : ℤ) (1 : NNRat)
    + AddMonoidAlgebra.single (1 : ℤ) (3 : NNRat)
    + AddMonoidAlgebra.single (2 : ℤ) (1 : NNRat)

theorem threePathSeq_coeff (k : ℤ) :
    threePathSeq.coeff k
      = (if (0 : ℤ) = k then (1 : NNRat) else 0)
        + (if (1 : ℤ) = k then (3 : NNRat) else 0)
        + (if (2 : ℤ) = k then (1 : NNRat) else 0) := by
  unfold threePathSeq
  rw [AddMonoidAlgebra.coeff_add, Finsupp.add_apply, AddMonoidAlgebra.coeff_add,
    Finsupp.add_apply, AddMonoidAlgebra.coeff_single, AddMonoidAlgebra.coeff_single,
    AddMonoidAlgebra.coeff_single, Finsupp.single_apply, Finsupp.single_apply,
    Finsupp.single_apply]

-- The three σ4 addresses, named for the enumeration.
def a4 : List ℕ := [0, 0]
def b4 : List ℕ := [0, 0, 0]
def c4 : List ℕ := [0, 0, 0, 0]

theorem sigma4_adj_ab : nbAdjacent a4 b4 :=
  Or.inl ⟨List.cons_ne_nil _ _, rfl⟩

theorem sigma4_adj_bc : nbAdjacent b4 c4 :=
  Or.inl ⟨List.cons_ne_nil _ _, rfl⟩

theorem sigma4_nadj_ac : ¬ nbAdjacent a4 c4 := by
  rintro (⟨-, he⟩ | ⟨-, he⟩) <;> simp [a4, c4, List.dropLast] at he

theorem sigma4_ne_ab : a4 ≠ b4 := by simp [a4, b4]
theorem sigma4_ne_bc : b4 ≠ c4 := by simp [b4, c4]
theorem sigma4_ne_ac : a4 ≠ c4 := by simp [a4, c4]

theorem sSigma4block_eq : sSigma4block = {a4, b4, c4} := rfl

/-- Every subset of a three-element set is one of the eight obvious ones.
Pure `Finset` combinatorics (the order-3 sibling of C2's
`subset_pair_cases`). -/
theorem subset_triple_cases {α : Type*} [DecidableEq α] {x y z : α}
    {S : Finset α} (hS : S ⊆ ({x, y, z} : Finset α)) :
    S = ∅ ∨ S = {x} ∨ S = {y} ∨ S = {z} ∨ S = {x, y} ∨ S = {x, z}
      ∨ S = {y, z} ∨ S = ({x, y, z} : Finset α) := by
  have hmem : ∀ w ∈ S, w = x ∨ w = y ∨ w = z := by
    intro w hw
    have := hS hw
    rw [Finset.mem_insert, Finset.mem_insert, Finset.mem_singleton] at this
    exact this
  by_cases hx : x ∈ S <;> by_cases hy : y ∈ S <;> by_cases hz : z ∈ S
  · refine Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr ?_))))))
    apply Finset.Subset.antisymm hS
    intro w hw
    rw [Finset.mem_insert, Finset.mem_insert, Finset.mem_singleton] at hw
    rcases hw with rfl | rfl | rfl
    · exact hx
    · exact hy
    · exact hz
  · refine Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ?_))))
    ext w
    rw [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro hw
      rcases hmem w hw with rfl | rfl | rfl
      · exact Or.inl rfl
      · exact Or.inr rfl
      · exact absurd hw hz
    · rintro (rfl | rfl)
      · exact hx
      · exact hy
  · refine Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ?_)))))
    ext w
    rw [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro hw
      rcases hmem w hw with rfl | rfl | rfl
      · exact Or.inl rfl
      · exact absurd hw hy
      · exact Or.inr rfl
    · rintro (rfl | rfl)
      · exact hx
      · exact hz
  · refine Or.inr (Or.inl ?_)
    ext w
    rw [Finset.mem_singleton]
    constructor
    · intro hw
      rcases hmem w hw with rfl | rfl | rfl
      · rfl
      · exact absurd hw hy
      · exact absurd hw hz
    · rintro rfl
      exact hx
  · refine Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ?_))))))
    ext w
    rw [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro hw
      rcases hmem w hw with rfl | rfl | rfl
      · exact absurd hw hx
      · exact Or.inl rfl
      · exact Or.inr rfl
    · rintro (rfl | rfl)
      · exact hy
      · exact hz
  · refine Or.inr (Or.inr (Or.inl ?_))
    ext w
    rw [Finset.mem_singleton]
    constructor
    · intro hw
      rcases hmem w hw with rfl | rfl | rfl
      · exact absurd hw hx
      · rfl
      · exact absurd hw hz
    · rintro rfl
      exact hy
  · refine Or.inr (Or.inr (Or.inr (Or.inl ?_)))
    ext w
    rw [Finset.mem_singleton]
    constructor
    · intro hw
      rcases hmem w hw with rfl | rfl | rfl
      · exact absurd hw hx
      · exact absurd hw hy
      · rfl
    · rintro rfl
      exact hz
  · refine Or.inl ?_
    rw [Finset.eq_empty_iff_forall_notMem]
    intro w hw
    rcases hmem w hw with rfl | rfl | rfl
    · exact hx hw
    · exact hy hw
    · exact hz hw

/-- The σ4 block is a tree block (nonempty, connected). -/
theorem sigma4_isTreeBlock : IsNbTreeBlock sSigma4block := by
  constructor
  · exact ⟨a4, by rw [sSigma4block_eq]; exact Finset.mem_insert_self _ _⟩
  · rw [sSigma4block_eq]
    have hma : a4 ∈ ({a4, b4, c4} : Finset (List ℕ)) := Finset.mem_insert_self _ _
    have hmb : b4 ∈ ({a4, b4, c4} : Finset (List ℕ)) :=
      Finset.mem_insert_of_mem (Finset.mem_insert_self _ _)
    have hmc : c4 ∈ ({a4, b4, c4} : Finset (List ℕ)) :=
      Finset.mem_insert_of_mem (Finset.mem_insert_of_mem (Finset.mem_singleton_self _))
    set rel := fun x y : List ℕ =>
      x ∈ ({a4, b4, c4} : Finset (List ℕ)) ∧ y ∈ ({a4, b4, c4} : Finset (List ℕ))
        ∧ nbAdjacent x y with hrel
    have hsym : ∀ x y, rel x y → rel y x := by
      rintro x y ⟨h1, h2, h3⟩
      exact ⟨h2, h1, (nbAdjacent_comm x y).mp h3⟩
    have hab : Relation.ReflTransGen rel a4 b4 :=
      Relation.ReflTransGen.single ⟨hma, hmb, sigma4_adj_ab⟩
    have hbc : Relation.ReflTransGen rel b4 c4 :=
      Relation.ReflTransGen.single ⟨hmb, hmc, sigma4_adj_bc⟩
    have hac : Relation.ReflTransGen rel a4 c4 := hab.trans hbc
    have hsymm : ∀ {x y : List ℕ}, Relation.ReflTransGen rel x y →
        Relation.ReflTransGen rel y x := fun h => reflTransGen_symm_of hsym h
    intro u hu w hw
    have hcase : ∀ v, v ∈ ({a4, b4, c4} : Finset (List ℕ)) → v = a4 ∨ v = b4 ∨ v = c4 := by
      intro v hv
      rw [Finset.mem_insert, Finset.mem_insert, Finset.mem_singleton] at hv
      exact hv
    rcases hcase u hu with rfl | rfl | rfl <;> rcases hcase w hw with rfl | rfl | rfl
    · exact Relation.ReflTransGen.refl
    · exact hab
    · exact hac
    · exact hsymm hab
    · exact Relation.ReflTransGen.refl
    · exact hbc
    · exact hsymm hac
    · exact hsymm hbc
    · exact Relation.ReflTransGen.refl

/-- The component extraction, evaluated at the σ4 block: one block, itself. -/
theorem nbComponents_sigma4 : nbComponents sSigma4block = sSigma4 := by
  have hblock : ∀ u ∈ sSigma4block, nbBlockOf sSigma4block u = sSigma4block := by
    intro u hu
    apply Finset.Subset.antisymm (nbBlockOf_subset _ _)
    intro w hw
    rw [mem_nbBlockOf]
    refine ⟨hw, ?_⟩
    exact sigma4_isTreeBlock.2 u hu w hw
  unfold nbComponents sSigma4
  rw [Finset.image_congr (fun u hu => hblock u hu)]
  apply Finset.Subset.antisymm
  · intro C hC
    rw [Finset.mem_image] at hC
    obtain ⟨u, -, rfl⟩ := hC
    exact Finset.mem_singleton_self _
  · intro C hC
    rw [Finset.mem_singleton] at hC
    subst hC
    rw [Finset.mem_image]
    exact ⟨a4, by rw [sSigma4block_eq]; exact Finset.mem_insert_self _ _, rfl⟩

/-- The σ4 `nbAdjacent`-free family, enumerated: `∅`, the three singletons,
and the endpoint pair. -/
theorem nbIndepFamily_sigma4 :
    nbIndepFamily sSigma4block
      = {(∅ : Finset (List ℕ)), {a4}, {b4}, {c4}, {a4, c4}} := by
  ext S
  rw [mem_nbIndepFamily, sSigma4block_eq]
  simp only [Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨hsub, hfree⟩
    rcases subset_triple_cases hsub with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
    · exact Or.inl rfl
    · exact Or.inr (Or.inl rfl)
    · exact Or.inr (Or.inr (Or.inl rfl))
    · exact Or.inr (Or.inr (Or.inr (Or.inl rfl)))
    · exact absurd sigma4_adj_ab
        (hfree a4 (Finset.mem_insert_self _ _)
          b4 (Finset.mem_insert_of_mem (Finset.mem_singleton_self _)))
    · exact Or.inr (Or.inr (Or.inr (Or.inr rfl)))
    · exact absurd sigma4_adj_bc
        (hfree b4 (Finset.mem_insert_self _ _)
          c4 (Finset.mem_insert_of_mem (Finset.mem_singleton_self _)))
    · exact absurd sigma4_adj_ab
        (hfree a4 (Finset.mem_insert_self _ _)
          b4 (Finset.mem_insert_of_mem (Finset.mem_insert_self _ _)))
  · have hma : a4 ∈ ({a4, b4, c4} : Finset (List ℕ)) := Finset.mem_insert_self _ _
    have hmb : b4 ∈ ({a4, b4, c4} : Finset (List ℕ)) :=
      Finset.mem_insert_of_mem (Finset.mem_insert_self _ _)
    have hmc : c4 ∈ ({a4, b4, c4} : Finset (List ℕ)) :=
      Finset.mem_insert_of_mem (Finset.mem_insert_of_mem (Finset.mem_singleton_self _))
    rintro (rfl | rfl | rfl | rfl | rfl)
    · refine ⟨Finset.empty_subset _, ?_⟩
      intro u hu
      exact absurd hu (Finset.notMem_empty u)
    · refine ⟨Finset.singleton_subset_iff.mpr hma, ?_⟩
      intro u hu w hw
      rw [Finset.mem_singleton] at hu hw
      rw [hu, hw]
      exact nbAdjacent_irrefl a4
    · refine ⟨Finset.singleton_subset_iff.mpr hmb, ?_⟩
      intro u hu w hw
      rw [Finset.mem_singleton] at hu hw
      rw [hu, hw]
      exact nbAdjacent_irrefl b4
    · refine ⟨Finset.singleton_subset_iff.mpr hmc, ?_⟩
      intro u hu w hw
      rw [Finset.mem_singleton] at hu hw
      rw [hu, hw]
      exact nbAdjacent_irrefl c4
    · refine ⟨?_, ?_⟩
      · intro w hw
        rw [Finset.mem_insert, Finset.mem_singleton] at hw
        rcases hw with rfl | rfl
        · exact hma
        · exact hmc
      · intro u hu w hw
        rw [Finset.mem_insert, Finset.mem_singleton] at hu hw
        rcases hu with rfl | rfl <;> rcases hw with rfl | rfl
        · exact nbAdjacent_irrefl a4
        · exact sigma4_nadj_ac
        · intro h
          exact sigma4_nadj_ac ((nbAdjacent_comm c4 a4).mp h)
        · exact nbAdjacent_irrefl c4

/-- **The σ4 evaluation:** the order-3 path block's neutral count sequence
is the closed witness `1 + 3x + x²`. -/
theorem nbSeqOn_sigma4 : nbSeqOn sSigma4block = threePathSeq := by
  unfold nbSeqOn
  rw [nbIndepFamily_sigma4]
  have h1 : (∅ : Finset (List ℕ))
      ∉ ({({a4} : Finset (List ℕ)), {b4}, {c4}, {a4, c4}} :
          Finset (Finset (List ℕ))) := by
    simp only [Finset.mem_insert, Finset.mem_singleton]
    rintro (h | h | h | h)
    · exact Finset.singleton_ne_empty _ h.symm
    · exact Finset.singleton_ne_empty _ h.symm
    · exact Finset.singleton_ne_empty _ h.symm
    · exact Finset.insert_ne_empty _ _ h.symm
  have h2 : ({a4} : Finset (List ℕ))
      ∉ ({({b4} : Finset (List ℕ)), {c4}, {a4, c4}} : Finset (Finset (List ℕ))) := by
    simp only [Finset.mem_insert, Finset.mem_singleton]
    rintro (h | h | h)
    · exact sigma4_ne_ab (Finset.singleton_injective h)
    · exact sigma4_ne_ac (Finset.singleton_injective h)
    · have : c4 ∈ ({a4} : Finset (List ℕ)) := by
        rw [h]
        exact Finset.mem_insert_of_mem (Finset.mem_singleton_self _)
      rw [Finset.mem_singleton] at this
      exact sigma4_ne_ac this.symm
  have h3 : ({b4} : Finset (List ℕ))
      ∉ ({({c4} : Finset (List ℕ)), {a4, c4}} : Finset (Finset (List ℕ))) := by
    simp only [Finset.mem_insert, Finset.mem_singleton]
    rintro (h | h)
    · exact sigma4_ne_bc (Finset.singleton_injective h)
    · have : a4 ∈ ({b4} : Finset (List ℕ)) := by
        rw [h]
        exact Finset.mem_insert_self _ _
      rw [Finset.mem_singleton] at this
      exact sigma4_ne_ab this
  have h4 : ({c4} : Finset (List ℕ))
      ∉ ({({a4, c4} : Finset (List ℕ))} : Finset (Finset (List ℕ))) := by
    rw [Finset.mem_singleton]
    intro h
    have : a4 ∈ ({c4} : Finset (List ℕ)) := by
      rw [h]
      exact Finset.mem_insert_self _ _
    rw [Finset.mem_singleton] at this
    exact sigma4_ne_ac this
  have hca : ({a4, c4} : Finset (List ℕ)).card = 2 := by
    rw [Finset.card_insert_of_notMem (by rw [Finset.mem_singleton]; exact sigma4_ne_ac),
      Finset.card_singleton]
  rw [Finset.sum_insert h1, Finset.sum_insert h2, Finset.sum_insert h3,
    Finset.sum_insert h4, Finset.sum_singleton, Finset.card_empty,
    Finset.card_singleton, Finset.card_singleton, Finset.card_singleton, hca,
    Nat.cast_zero, Nat.cast_one, Nat.cast_two]
  unfold threePathSeq
  have hs : AddMonoidAlgebra.single (1 : ℤ) (1 : NNRat)
      + AddMonoidAlgebra.single (1 : ℤ) (1 : NNRat)
      + AddMonoidAlgebra.single (1 : ℤ) (1 : NNRat)
      = AddMonoidAlgebra.single (1 : ℤ) (3 : NNRat) := by
    rw [← AddMonoidAlgebra.single_add, ← AddMonoidAlgebra.single_add]
    norm_num
  rw [← hs]
  abel

end R16C3
