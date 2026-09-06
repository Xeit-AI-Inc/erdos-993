import R14C3P.AmbientBridge
import R16C2Base

/-!
# R16C2T — the FROZEN canonical target (FC-R16-1) and the constructor's
# T-world half, stratum by stratum (r16 Cycle 2, route R16C2-T)

PROTOTYPE (grade `RG` AT BEST after critics and a gate act; nothing here is
`governed`; nothing is ever `formally_verified`).

## Ceiling honesty (undetachable)

TREE / FOREST / TRANSFER / COUNTEREXAMPLE open before and after.
`AmbientTargetDeg2`, (α), (β), (A), (B) are targets never asserted; nothing
below proves, or claims to prove, any of them, and nothing below closes G1
in general: the payoff `G1_closure_of_lawful` is a conditional whose
PREMISE-K slot (`hKL`), K-SCOPE slot (`hKSCOPE`) and crossing slot (`hx`)
are live and undischarged — `hKL`/`hKSCOPE`/`hx` are NEVER discharged
(F-b of record). The constructor work below discharges the IDENTIFICATION
premise only, at the strata stated. PREMISE K is never kernel-imported. No
bounded zero is cited; no measurement is run. This file makes NO claim on
G2 and does not mention the open `HG2` region.

## NO SHIMS (restated and honored)

The r14 Interlude-1 ruling-3 prohibition stands; the criterion of record is
FC-R16-2 (five heads). Nothing here assumes or axiomatizes a cross-world
correspondence. Every law below is proved inside the T-world import closure
from the governed definitions; LAW IV′ lives in the P-world module
`R16C2P` on the SAME base-typed data (the pack fields are base types per
FC-R16-1's rider); the two halves meet only on world-neutral terms.

## The frozen target (FC-R16-1, symbol-for-symbol)

`ResidualIdentification` below IS the frozen type: index type
`ι := Finset (List ℕ)`, `s` = the blocks themselves. The laws L1–L7 are
compiled here exactly as frozen; the ONE compiled-form ELECTION FC-R16-1
leaves to C2 is L3's connectedness predicate, elected here as
`Relation.ReflTransGen` of `addrAdjacent` restricted to the block C (with
L1 giving `C ⊆ U`, every C-walk is a U-walk; with L2, U-walks between
members of C cannot leave C — the components-of-U reading of the freeze).
L3′ is compiled in the freeze's own offered edge-count form.

## Fence check (per-object)

No computation, `#eval`, `decide`, `native_decide`, search, or sampling.
F1/F2: unimodality/log-concavity appear ONLY as hypotheses (`hKL`, and the
hypotheses inside the consumed sealed `G1_closure_of_identification`); no
statement concludes either of any concrete object. F3–F12, the r12/r13
transitive kills, the r13 one-move charge: none invoked. The refuted
universal `Δ_{p−2}(U) ≤ 0` appears nowhere; the payoff's conclusion is
scoped by its own live hypotheses exactly as the consumed bridge theorem
scopes it.

## Reserved zone (verified in proof terms)

No proof below mentions, unfolds, or invokes `Ipoly`/`Apoly`/`Bpoly`/
`Fpoly`, the availability recursion, any blocked-root state, or any
subtraction carrying an inequality across the I/A/B split. The r12 Q1–Q6
boundary travels verbatim and is not approached. Of the T-lineage this file
uses exactly: `RTree.IndepSet`, `RTree.indepCountOn`, `RTree.vertices`,
`RTree.ResidualAmbient`, `RTree.closedNbhd`, `RTree.crossingIndexOn`,
`RTree.DeltaOnZ`, `RTree.addrAdjacent_irrefl`, `addrAdjacent_comm`,
`addrAdjacent_nil_iff`, `RTree.vertices_node`, `RTree.mem_vertices_node`,
`RTree.vertices_leaf`, and the consumed sealed
`R14C3P.IdentifiesResidualCounts` / `R14C3P.G1_closure_of_identification`
(consumed at their ruled standings, never quoted as more).

## Consumed vs fresh (per the C1 adjudication's ruling §5(a))

The T-world multiplicativity engine (`seqOn_union`, `seqOn_sup`) and the
L4/L6 analogues (`seqOn_coeff_eq_indepCountOn`, `seqOn_ne_zero`,
`seqOn_positiveIntervalSupport`) are proved FRESH — approved by the C1 gate
as WORLD-T statements no governed module states; the r10 `sum_nbij'` shape
is followed as precedent, and NOTHING cites WORLD-P's
`RForest.indepNNSeq_eq_prod` about WORLD-P's objects. `indepFamilyOn` is
the NEW-TO-BUILD vocabulary of the freeze.

## Invariance (one line per new object class)

`ResidualIdentification t v g` is data `(s, f, ord)` at base types with
laws that are propositions about `(t, v, g, s, f, ord)` alone. `seqOn` is a
function of `(t, V)` only; no vertex ordering or address convention enters.
The strata constructors are functions of their stated arguments only; block
sets are the residual's own components, never representative-indexed.
Every existential witness below is exhibited and no concluded property
depends on the exhibition (A16).
-/

open scoped Classical
open Erdos993C8U1
noncomputable section

namespace R16C2

/-! ## §1 — Small T-world counting lemmas (new; about the governed definitions) -/

/-- The empty set is independent in any `t`. -/
theorem indepSet_empty (t : RTree) : t.IndepSet (∅ : Finset (List ℕ)) := by
  refine ⟨Finset.empty_subset _, ?_⟩
  intro u hu
  exact absurd hu (Finset.notMem_empty u)

/-- Independence is hereditary: any subset of an independent set is
independent. -/
theorem indepSet_mono (t : RTree) {S A : Finset (List ℕ)} (hA : A ⊆ S)
    (hS : t.IndepSet S) : t.IndepSet A :=
  ⟨hA.trans hS.1, fun u hu w hw => hS.2 u (hA hu) w (hA hw)⟩

/-- A singleton `{z}` with `z ∈ t.vertices` is independent (consumed
`RTree.addrAdjacent_irrefl`). -/
theorem indepSet_singleton (t : RTree) {z : List ℕ} (hz : z ∈ t.vertices) :
    t.IndepSet ({z} : Finset (List ℕ)) := by
  refine ⟨Finset.singleton_subset_iff.mpr hz, ?_⟩
  intro u hu w hw
  rw [Finset.mem_singleton] at hu hw
  rw [hu, hw]
  exact RTree.addrAdjacent_irrefl z

/-- Membership in the residual forces membership in `t.vertices`. -/
theorem mem_vertices_of_mem_residual (t : RTree) (v g z : List ℕ)
    (hz : z ∈ t.ResidualAmbient v g) : z ∈ t.vertices := by
  unfold RTree.ResidualAmbient at hz
  exact (Finset.mem_sdiff.mp (Finset.mem_sdiff.mp hz).1).1

/-! ## §2 — S-1: THE FROZEN TYPE AND LAWS (FC-R16-1, symbol-for-symbol) -/

/-- **THE CANONICAL TARGET'S TYPE (FC-R16-1; frozen).** Index type
`ι := Finset (List ℕ)`; `s` = the blocks themselves; all three fields at
BASE TYPES so the same terms feed both worlds (the freeze's rider). With
`U := t.ResidualAmbient v g`, the laws L1–L7 (below) + LAW IV′ (P-world
module `R16C2P`, on the same data) govern. -/
structure ResidualIdentification (t : RTree) (v g : List ℕ) : Type where
  s    : Finset (Finset (List ℕ))      -- the blocks (components of U)
  f    : Finset (List ℕ) → NNSeq       -- per-block count sequence
  ord  : Finset (List ℕ) → ℕ           -- ord C := C.card

/-- **L1 (partition — frozen in conjunction form).** -/
def LawL1 (t : RTree) (v g : List ℕ) (s : Finset (Finset (List ℕ))) : Prop :=
  s.sup id = t.ResidualAmbient v g
    ∧ (∀ C ∈ s, ∀ C' ∈ s, C ≠ C' → Disjoint C C') ∧ ∅ ∉ s

/-- **L2 (no cross-adjacency).** -/
def LawL2 (s : Finset (Finset (List ℕ))) : Prop :=
  ∀ C ∈ s, ∀ C' ∈ s, C ≠ C' → ∀ u ∈ C, ∀ w ∈ C', ¬ addrAdjacent u w

/-- **L3 (connectedness — the C2-elected compiled form).** Each block is
connected under `addrAdjacent` restricted to the block: any two members are
joined by a reflexive-transitive `addrAdjacent`-chain lying inside `C`.
With L1 (`C ⊆ U`) each such chain is a chain inside `U`; with L2 no chain
inside `U` between members of `C` can leave `C`; so, jointly with L1+L2,
the blocks are exactly the connected components of the induced forest on
`U` — the frozen reading. [Gate note G-3 travels: adjacency is the
inherited `addrAdjacent`, never a re-derived adjacency.] -/
def LawL3 (s : Finset (Finset (List ℕ))) : Prop :=
  ∀ C ∈ s, ∀ u ∈ C, ∀ w ∈ C,
    Relation.ReflTransGen (fun a b => a ∈ C ∧ b ∈ C ∧ addrAdjacent a b) u w

/-- **L3′ (acyclicity — the freeze's own offered edge-count form).** Blocks
are TREES under inherited adjacency: the ordered-pair adjacency count inside
`C` is `2·(|C| − 1)`. -/
def LawL3' (s : Finset (Finset (List ℕ))) : Prop :=
  ∀ C ∈ s,
    ((C ×ˢ C).filter (fun p => addrAdjacent p.1 p.2)).card = 2 * (C.card - 1)

/-- **L4 (per-block coefficient characterization).** -/
def LawL4 (t : RTree) (s : Finset (Finset (List ℕ)))
    (f : Finset (List ℕ) → NNSeq) : Prop :=
  ∀ C ∈ s, ∀ r : ℕ, (f C).coeff (r : ℤ) = (t.indepCountOn C r : NNRat)

/-- **L5 (THE IDENTIFICATION — keystone).** Exactly the consumed sealed
premise name, at the frozen index type. -/
def LawL5 (t : RTree) (v g : List ℕ) (s : Finset (Finset (List ℕ)))
    (f : Finset (List ℕ) → NNSeq) : Prop :=
  R14C3P.IdentifiesResidualCounts t v g s f

/-- **L6 (admissibility).** -/
def LawL6 (s : Finset (Finset (List ℕ))) (f : Finset (List ℕ) → NNSeq) : Prop :=
  ∀ C ∈ s, f C ≠ 0 ∧ PositiveIntervalSupport (f C)

/-- **L7 (`ord` binding).** -/
def LawL7 (s : Finset (Finset (List ℕ))) (ord : Finset (List ℕ) → ℕ) : Prop :=
  ∀ C ∈ s, ord C = C.card

/-- The T-world law bundle: L1–L7 for a pack. (LAW IV′ is P-world, module
`R16C2P`, on the same base-typed data — no module may see both worlds.) -/
structure LawfulT (t : RTree) (v g : List ℕ)
    (R : ResidualIdentification t v g) : Prop where
  l1  : LawL1 t v g R.s
  l2  : LawL2 R.s
  l3  : LawL3 R.s
  l3' : LawL3' R.s
  l4  : LawL4 t R.s R.f
  l5  : LawL5 t v g R.s R.f
  l6  : LawL6 R.s R.f
  l7  : LawL7 R.s R.ord

/-! ## §3 — The fresh T-world engine: `indepFamilyOn`, `seqOn`, and the
multiplicativity over a lawful partition (W1/W2/W3 engine; ruling §5(a)) -/

/-- **`indepFamilyOn` (NEW-TO-BUILD, per the freeze):** the independent
subsets of a vertex finset `V`, in `t`'s inherited adjacency. -/
def indepFamilyOn (t : RTree) (V : Finset (List ℕ)) : Finset (Finset (List ℕ)) :=
  V.powerset.filter (fun S => t.IndepSet S)

theorem mem_indepFamilyOn (t : RTree) (V S : Finset (List ℕ)) :
    S ∈ indepFamilyOn t V ↔ S ⊆ V ∧ t.IndepSet S := by
  unfold indepFamilyOn
  simp only [Finset.mem_filter, Finset.mem_powerset]

theorem empty_mem_indepFamilyOn (t : RTree) (V : Finset (List ℕ)) :
    (∅ : Finset (List ℕ)) ∈ indepFamilyOn t V := by
  rw [mem_indepFamilyOn]
  exact ⟨Finset.empty_subset _, indepSet_empty t⟩

/-- The canonical per-block count sequence: the single-card sum over
`indepFamilyOn`. A WORLD-T object; the same construction shape as the
governed P-side admission map, built fresh here (ruling §5(a)). -/
def seqOn (t : RTree) (V : Finset (List ℕ)) : NNSeq :=
  ∑ S ∈ indepFamilyOn t V, AddMonoidAlgebra.single (S.card : ℤ) (1 : NNRat)

theorem seqOn_coeff (t : RTree) (V : Finset (List ℕ)) (k : ℤ) :
    (seqOn t V).coeff k
      = (((indepFamilyOn t V).filter (fun S => (S.card : ℤ) = k)).card : NNRat) := by
  unfold seqOn
  exact single_card_coeff _ _ k

/-- **The L4 engine:** `seqOn`'s coefficients ARE the governed
`indepCountOn` counts, rank for rank. -/
theorem seqOn_coeff_eq_indepCountOn (t : RTree) (V : Finset (List ℕ)) (r : ℕ) :
    (seqOn t V).coeff (r : ℤ) = (t.indepCountOn V r : NNRat) := by
  rw [seqOn_coeff]
  unfold indepFamilyOn RTree.indepCountOn
  rw [Finset.filter_filter]
  simp only [Nat.cast_inj]

/-- **L6 engine, part 1:** `seqOn` is never zero (the empty independent set
always contributes at rank 0). -/
theorem seqOn_ne_zero (t : RTree) (V : Finset (List ℕ)) : seqOn t V ≠ 0 := by
  intro h
  have h0 : (seqOn t V).coeff (0 : ℤ) = 0 := by rw [h]; rfl
  rw [seqOn_coeff] at h0
  have hz : ((indepFamilyOn t V).filter (fun S => (S.card : ℤ) = 0)).card = 0 := by
    exact_mod_cast h0
  have hmem : (∅ : Finset (List ℕ))
      ∈ (indepFamilyOn t V).filter (fun S => (S.card : ℤ) = 0) := by
    rw [Finset.mem_filter]
    exact ⟨empty_mem_indepFamilyOn t V, by simp⟩
  have hpos : 0 < ((indepFamilyOn t V).filter (fun S => (S.card : ℤ) = 0)).card :=
    Finset.card_pos.mpr ⟨∅, hmem⟩
  omega

/-- **L6 engine, part 2:** `seqOn` has positive-interval support on
`[0, m]`, `m` the largest independent-set size in `V` — hereditary
downward closure exhibits every intermediate rank. The witness interval is
exhibited; the property does not depend on the exhibition (A16). -/
theorem seqOn_positiveIntervalSupport (t : RTree) (V : Finset (List ℕ)) :
    PositiveIntervalSupport (seqOn t V) := by
  classical
  have hne : (indepFamilyOn t V).Nonempty := ⟨∅, empty_mem_indepFamilyOn t V⟩
  have hsne : ((indepFamilyOn t V).image Finset.card).Nonempty := hne.image _
  obtain ⟨Smax, hSmaxMem, hSmaxCard⟩ :=
    Finset.mem_image.mp (Finset.max'_mem _ hsne)
  set u : ℕ := ((indepFamilyOn t V).image Finset.card).max' hsne with hu
  refine ⟨0, (u : ℤ), by exact_mod_cast Nat.zero_le u, ?_⟩
  intro k
  rw [seqOn_coeff]
  constructor
  · intro hpos
    have hcard : 0 < ((indepFamilyOn t V).filter (fun S => (S.card : ℤ) = k)).card := by
      exact_mod_cast hpos
    obtain ⟨S, hS⟩ := Finset.card_pos.mp hcard
    rw [Finset.mem_filter] at hS
    obtain ⟨hSfam, hSk⟩ := hS
    have hle : S.card ≤ u :=
      Finset.le_max' _ _ (Finset.mem_image_of_mem _ hSfam)
    constructor
    · rw [← hSk]
      exact_mod_cast Nat.zero_le S.card
    · rw [← hSk]
      exact_mod_cast hle
  · rintro ⟨hk0, hku⟩
    set n : ℕ := k.toNat with hn
    have hkn : (n : ℤ) = k := Int.toNat_of_nonneg hk0
    have hnu : n ≤ u := by
      have : (n : ℤ) ≤ (u : ℤ) := by rw [hkn]; exact hku
      exact_mod_cast this
    have hnc : n ≤ Smax.card := by rw [hSmaxCard]; exact hnu
    obtain ⟨A, hAsub, hAcard⟩ := Finset.exists_subset_card_eq hnc
    rw [mem_indepFamilyOn] at hSmaxMem
    have hAmem : A ∈ indepFamilyOn t V := by
      rw [mem_indepFamilyOn]
      exact ⟨hAsub.trans hSmaxMem.1, indepSet_mono t hAsub hSmaxMem.2⟩
    have hmem : A ∈ (indepFamilyOn t V).filter (fun S => (S.card : ℤ) = k) := by
      rw [Finset.mem_filter]
      exact ⟨hAmem, by rw [hAcard, hkn]⟩
    have hpos : 0 < ((indepFamilyOn t V).filter (fun S => (S.card : ℤ) = k)).card :=
      Finset.card_pos.mpr ⟨A, hmem⟩
    exact_mod_cast hpos

/-- `seqOn` on the empty vertex set is the unit sequence. -/
theorem seqOn_empty (t : RTree) : seqOn t (∅ : Finset (List ℕ)) = 1 := by
  unfold seqOn indepFamilyOn
  rw [Finset.powerset_empty, Finset.filter_singleton, if_pos (indepSet_empty t),
    Finset.sum_singleton, Finset.card_empty, Nat.cast_zero]
  exact AddMonoidAlgebra.one_def.symm

/-- **THE EXPLICIT COUNTING BIJECTION (the frozen L5 shape, binary step):**
for disjoint, non-cross-adjacent `V` and `W`, the independent sets of
`V ∪ W` are exactly the pairs — `S ↦ (S ∩ V, S ∩ W)`, inverse
`(A, B) ↦ A ∪ B` — via `Finset.sum_nbij'` (the r10 shape as precedent, the
T-world instance proved FRESH; ruling §5(a)). NEVER an algebraic shortcut;
NEVER a citation of WORLD-P's product theorem. -/
theorem seqOn_union (t : RTree) {V W : Finset (List ℕ)}
    (hdisj : Disjoint V W)
    (hcross : ∀ u ∈ V, ∀ w ∈ W, ¬ addrAdjacent u w) :
    seqOn t (V ∪ W) = seqOn t V * seqOn t W := by
  classical
  unfold seqOn
  rw [Finset.sum_mul_sum, ← Finset.sum_product']
  simp only [AddMonoidAlgebra.single_mul_single, mul_one]
  apply Finset.sum_nbij'
    (fun S : Finset (List ℕ) => (S ∩ V, S ∩ W))
    (fun p : Finset (List ℕ) × Finset (List ℕ) => p.1 ∪ p.2)
  · intro S hS
    rw [mem_indepFamilyOn] at hS
    obtain ⟨hsub, hind⟩ := hS
    rw [Finset.mem_product, mem_indepFamilyOn, mem_indepFamilyOn]
    exact ⟨⟨Finset.inter_subset_right, indepSet_mono t Finset.inter_subset_left hind⟩,
           ⟨Finset.inter_subset_right, indepSet_mono t Finset.inter_subset_left hind⟩⟩
  · intro p hp
    rw [Finset.mem_product, mem_indepFamilyOn, mem_indepFamilyOn] at hp
    obtain ⟨⟨hA, hAind⟩, hB, hBind⟩ := hp
    rw [mem_indepFamilyOn]
    refine ⟨Finset.union_subset_union hA hB, ?_, ?_⟩
    · exact Finset.union_subset hAind.1 hBind.1
    · intro x hx y hy
      rcases Finset.mem_union.mp hx with hxA | hxB <;>
        rcases Finset.mem_union.mp hy with hyA | hyB
      · exact hAind.2 x hxA y hyA
      · exact hcross x (hA hxA) y (hB hyB)
      · intro hadj
        exact hcross y (hA hyA) x (hB hxB) ((addrAdjacent_comm x y).mp hadj)
      · exact hBind.2 x hxB y hyB
  · intro S hS
    rw [mem_indepFamilyOn] at hS
    rw [← Finset.inter_union_distrib_left]
    exact Finset.inter_eq_left.mpr hS.1
  · intro p hp
    rw [Finset.mem_product, mem_indepFamilyOn, mem_indepFamilyOn] at hp
    obtain ⟨⟨hA, _⟩, hB, _⟩ := hp
    have h1 : (p.1 ∪ p.2) ∩ V = p.1 := by
      rw [Finset.union_inter_distrib_right, Finset.inter_eq_left.mpr hA,
        Finset.disjoint_iff_inter_eq_empty.mp
          (Finset.disjoint_of_subset_left hB hdisj.symm),
        Finset.union_empty]
    have h2 : (p.1 ∪ p.2) ∩ W = p.2 := by
      rw [Finset.union_inter_distrib_right, Finset.inter_eq_left.mpr hB,
        Finset.disjoint_iff_inter_eq_empty.mp
          (Finset.disjoint_of_subset_left hA hdisj),
        Finset.empty_union]
    exact Prod.ext h1 h2
  · intro S hS
    rw [mem_indepFamilyOn] at hS
    have hSdecomp : (S ∩ V) ∪ (S ∩ W) = S := by
      rw [← Finset.inter_union_distrib_left]
      exact Finset.inter_eq_left.mpr hS.1
    have hdisj' : Disjoint (S ∩ V) (S ∩ W) :=
      Finset.disjoint_of_subset_left Finset.inter_subset_right
        (Finset.disjoint_of_subset_right Finset.inter_subset_right hdisj)
    have hcard : (S ∩ V).card + (S ∩ W).card = S.card := by
      rw [← Finset.card_union_of_disjoint hdisj', hSdecomp]
    congr 1
    rw [← hcard, Nat.cast_add]

/-- **The multiplicativity over a lawful family (W3 keystone engine):** for
pairwise disjoint, pairwise non-cross-adjacent blocks, `seqOn` of the union
is the product of the per-block `seqOn`s. Induction on the block family
through the binary bijection step — the frozen L5 shape at every step. -/
theorem seqOn_sup (t : RTree) (s : Finset (Finset (List ℕ))) :
    (∀ C ∈ s, ∀ C' ∈ s, C ≠ C' → Disjoint C C') →
    (∀ C ∈ s, ∀ C' ∈ s, C ≠ C' → ∀ u ∈ C, ∀ w ∈ C', ¬ addrAdjacent u w) →
    seqOn t (s.sup id) = ∏ C ∈ s, seqOn t C := by
  classical
  induction s using Finset.cons_induction with
  | empty =>
    intro _ _
    rw [Finset.sup_empty, Finset.prod_empty, Finset.bot_eq_empty]
    exact seqOn_empty t
  | cons C s' hCs ih =>
    intro hdisj hcross
    have hne : ∀ C' ∈ s', C ≠ C' := fun C' hC' h => hCs (h ▸ hC')
    have hdisj' : ∀ A ∈ s', ∀ B ∈ s', A ≠ B → Disjoint A B := fun A hA B hB hAB =>
      hdisj A (Finset.mem_cons_of_mem hA) B (Finset.mem_cons_of_mem hB) hAB
    have hcross' : ∀ A ∈ s', ∀ B ∈ s', A ≠ B → ∀ u ∈ A, ∀ w ∈ B, ¬ addrAdjacent u w :=
      fun A hA B hB hAB =>
        hcross A (Finset.mem_cons_of_mem hA) B (Finset.mem_cons_of_mem hB) hAB
    have hd : Disjoint C (s'.sup id) := by
      rw [Finset.disjoint_sup_right]
      intro A hA
      exact hdisj C (Finset.mem_cons_self C s') A (Finset.mem_cons_of_mem hA) (hne A hA)
    have hc : ∀ u ∈ C, ∀ w ∈ s'.sup id, ¬ addrAdjacent u w := by
      intro u hu w hw
      obtain ⟨A, hA, hwA⟩ := Finset.mem_sup.mp hw
      exact hcross C (Finset.mem_cons_self C s') A (Finset.mem_cons_of_mem hA)
        (hne A hA) u hu w hwA
    rw [Finset.sup_cons, Finset.prod_cons, ← ih hdisj' hcross', id_eq,
      Finset.sup_eq_union]
    exact seqOn_union t hd hc

/-- **L5 FROM L1+L2 AND PER-BLOCK EVALUATION (the general keystone):**
whenever the family satisfies the partition law and the no-cross-adjacency
law and every `f C` evaluates to `seqOn t C`, the product's coefficients
identify the residual's counts. Proved through the explicit counting
bijection above, exactly as the freeze mandates. -/
theorem lawL5_of_partition (t : RTree) (v g : List ℕ)
    (s : Finset (Finset (List ℕ))) (f : Finset (List ℕ) → NNSeq)
    (h1 : LawL1 t v g s) (h2 : LawL2 s)
    (hf : ∀ C ∈ s, f C = seqOn t C) :
    LawL5 t v g s f := by
  intro r
  rw [Finset.prod_congr rfl hf, ← seqOn_sup t s h1.2.1 h2, h1.1]
  exact seqOn_coeff_eq_indepCountOn t _ r

/-- **The T-side constructor reduction (the C2 finding of record):** the
FULL T-world law bundle follows from the four s-laws (L1, L2, L3, L3′)
plus per-block evaluation and the `ord` binding. Producing `s` with
L1–L3′ is ALL that remains of the T-side at any stratum. -/
theorem lawfulT_mk (t : RTree) (v g : List ℕ)
    (s : Finset (Finset (List ℕ))) (f : Finset (List ℕ) → NNSeq)
    (ord : Finset (List ℕ) → ℕ)
    (h1 : LawL1 t v g s) (h2 : LawL2 s) (h3 : LawL3 s) (h3' : LawL3' s)
    (hf : ∀ C ∈ s, f C = seqOn t C) (hord : ∀ C ∈ s, ord C = C.card) :
    LawfulT t v g ⟨s, f, ord⟩ := by
  refine ⟨h1, h2, h3, h3', ?_, ?_, ?_, hord⟩
  · intro C hC r
    show (f C).coeff (r : ℤ) = (t.indepCountOn C r : NNRat)
    rw [hf C hC]
    exact seqOn_coeff_eq_indepCountOn t C r
  · exact lawL5_of_partition t v g s f h1 h2 hf
  · intro C hC
    show f C ≠ 0 ∧ PositiveIntervalSupport (f C)
    rw [hf C hC]
    exact ⟨seqOn_ne_zero t C, seqOn_positiveIntervalSupport t C⟩

/-! ## §4 — Per-block evaluations to the shared abstract witnesses -/

/-- The order-1 block evaluates to the shared base witness `1 + x`. -/
theorem seqOn_singleton (t : RTree) {z : List ℕ} (hz : z ∈ t.vertices) :
    seqOn t ({z} : Finset (List ℕ)) = oneVertexSeq := by
  unfold seqOn
  have hfam : indepFamilyOn t ({z} : Finset (List ℕ))
      = {(∅ : Finset (List ℕ)), ({z} : Finset (List ℕ))} := by
    ext S
    rw [mem_indepFamilyOn, Finset.mem_insert, Finset.mem_singleton]
    constructor
    · rintro ⟨hsub, _⟩
      exact Finset.subset_singleton_iff.mp hsub
    · rintro (rfl | rfl)
      · exact ⟨Finset.empty_subset _, indepSet_empty t⟩
      · exact ⟨Finset.Subset.refl _, indepSet_singleton t hz⟩
  have hnotmem : (∅ : Finset (List ℕ))
      ∉ ({({z} : Finset (List ℕ))} : Finset (Finset (List ℕ))) := by
    rw [Finset.mem_singleton]
    exact fun h => Finset.singleton_ne_empty z h.symm
  rw [hfam, Finset.sum_insert hnotmem, Finset.sum_singleton,
    Finset.card_empty, Finset.card_singleton]
  unfold oneVertexSeq
  norm_num

/-- The adjacent-pair (order-2 path) block evaluates to the shared base
witness `1 + 2x`: three independent sets (∅, the two singletons), no
independent pair. -/
theorem seqOn_pair_adj (t : RTree) {a b : List ℕ} (ha : a ∈ t.vertices)
    (hb : b ∈ t.vertices) (hne : a ≠ b) (hadj : addrAdjacent a b) :
    seqOn t ({a, b} : Finset (List ℕ)) = twoPathSeq := by
  unfold seqOn
  have hfam : indepFamilyOn t ({a, b} : Finset (List ℕ))
      = {(∅ : Finset (List ℕ)), ({a} : Finset (List ℕ)), ({b} : Finset (List ℕ))} := by
    ext S
    rw [mem_indepFamilyOn, Finset.mem_insert, Finset.mem_insert, Finset.mem_singleton]
    constructor
    · rintro ⟨hsub, hind⟩
      rcases subset_pair_cases hsub with rfl | rfl | rfl | rfl
      · exact Or.inl rfl
      · exact Or.inr (Or.inl rfl)
      · exact Or.inr (Or.inr rfl)
      · exact absurd hadj
          (hind.2 a (Finset.mem_insert_self a _)
            b (Finset.mem_insert_of_mem (Finset.mem_singleton_self b)))
    · rintro (rfl | rfl | rfl)
      · exact ⟨Finset.empty_subset _, indepSet_empty t⟩
      · exact ⟨Finset.singleton_subset_iff.mpr (Finset.mem_insert_self a _),
               indepSet_singleton t ha⟩
      · exact ⟨Finset.singleton_subset_iff.mpr
                 (Finset.mem_insert_of_mem (Finset.mem_singleton_self b)),
               indepSet_singleton t hb⟩
  have h1 : (∅ : Finset (List ℕ))
      ∉ ({({a} : Finset (List ℕ)), ({b} : Finset (List ℕ))} :
          Finset (Finset (List ℕ))) := by
    rw [Finset.mem_insert, Finset.mem_singleton]
    rintro (h | h) <;> exact Finset.singleton_ne_empty _ h.symm
  have h2 : ({a} : Finset (List ℕ))
      ∉ ({({b} : Finset (List ℕ))} : Finset (Finset (List ℕ))) := by
    rw [Finset.mem_singleton]
    intro h
    exact hne (Finset.singleton_injective h)
  rw [hfam, Finset.sum_insert h1, Finset.sum_insert h2, Finset.sum_singleton,
    Finset.card_empty, Finset.card_singleton, Finset.card_singleton,
    Nat.cast_zero, Nat.cast_one, ← AddMonoidAlgebra.single_add]
  unfold twoPathSeq
  have e11 : (1 : NNRat) + 1 = 2 := by norm_num
  rw [e11]

/-! ## §5 — Per-shape s-laws (L3, L3′ for singleton and adjacent-pair blocks) -/

/-- L3 holds for any family of singleton blocks. -/
theorem lawL3_of_singletons {s : Finset (Finset (List ℕ))}
    (h : ∀ C ∈ s, ∃ z : List ℕ, C = ({z} : Finset (List ℕ))) : LawL3 s := by
  intro C hC u hu w hw
  obtain ⟨z, rfl⟩ := h C hC
  rw [Finset.mem_singleton] at hu hw
  subst hu
  subst hw
  exact Relation.ReflTransGen.refl

/-- L3′ holds for any family of singleton blocks (no self-adjacency:
consumed `RTree.addrAdjacent_irrefl`). -/
theorem lawL3'_of_singletons {s : Finset (Finset (List ℕ))}
    (h : ∀ C ∈ s, ∃ z : List ℕ, C = ({z} : Finset (List ℕ))) : LawL3' s := by
  intro C hC
  obtain ⟨z, rfl⟩ := h C hC
  have hempty : ((({z} : Finset (List ℕ)) ×ˢ ({z} : Finset (List ℕ))).filter
      (fun p => addrAdjacent p.1 p.2)) = ∅ := by
    rw [Finset.filter_eq_empty_iff]
    intro p hp
    rw [Finset.mem_product, Finset.mem_singleton, Finset.mem_singleton] at hp
    rw [hp.1, hp.2]
    exact RTree.addrAdjacent_irrefl z
  rw [hempty, Finset.card_empty, Finset.card_singleton]

/-- L3 holds for any family whose every block is the fixed adjacent pair
`{a, b}`. -/
theorem lawL3_of_pair {a b : List ℕ} (hadj : addrAdjacent a b)
    {s : Finset (Finset (List ℕ))}
    (h : ∀ C ∈ s, C = ({a, b} : Finset (List ℕ))) : LawL3 s := by
  intro C hC u hu w hw
  rw [h C hC] at hu hw ⊢
  have hma : a ∈ ({a, b} : Finset (List ℕ)) := Finset.mem_insert_self a _
  have hmb : b ∈ ({a, b} : Finset (List ℕ)) :=
    Finset.mem_insert_of_mem (Finset.mem_singleton_self b)
  have hu' : u = a ∨ u = b := by
    rcases Finset.mem_insert.mp hu with h' | h'
    · exact Or.inl h'
    · exact Or.inr (Finset.mem_singleton.mp h')
  have hw' : w = a ∨ w = b := by
    rcases Finset.mem_insert.mp hw with h' | h'
    · exact Or.inl h'
    · exact Or.inr (Finset.mem_singleton.mp h')
  rcases hu' with h1 | h1 <;> rcases hw' with h2 | h2 <;> rw [h1, h2]
  -- the two diagonal cases close by `rw`'s reflexivity step
  -- (`Relation.ReflTransGen.refl` is `@[refl]`); the cross cases remain:
  · exact Relation.ReflTransGen.single ⟨hma, hmb, hadj⟩
  · exact Relation.ReflTransGen.single ⟨hmb, hma, (addrAdjacent_comm a b).mp hadj⟩

/-- L3′ holds for any family whose every block is the fixed adjacent pair
`{a, b}`, `a ≠ b`: exactly the two ordered pairs `(a,b)`, `(b,a)` are
adjacent, and `2 = 2·(2−1)`. -/
theorem lawL3'_of_pair {a b : List ℕ} (hne : a ≠ b) (hadj : addrAdjacent a b)
    {s : Finset (Finset (List ℕ))}
    (h : ∀ C ∈ s, C = ({a, b} : Finset (List ℕ))) : LawL3' s := by
  intro C hC
  rw [h C hC]
  have hma : a ∈ ({a, b} : Finset (List ℕ)) := Finset.mem_insert_self a _
  have hmb : b ∈ ({a, b} : Finset (List ℕ)) :=
    Finset.mem_insert_of_mem (Finset.mem_singleton_self b)
  have hfilter : ((({a, b} : Finset (List ℕ)) ×ˢ ({a, b} : Finset (List ℕ))).filter
      (fun p => addrAdjacent p.1 p.2))
      = {((a, b) : List ℕ × List ℕ), ((b, a) : List ℕ × List ℕ)} := by
    ext p
    obtain ⟨x, y⟩ := p
    constructor
    · intro hp
      rw [Finset.mem_filter, Finset.mem_product] at hp
      obtain ⟨⟨hx, hy⟩, hpadj⟩ := hp
      have hx' : x = a ∨ x = b := by
        rcases Finset.mem_insert.mp hx with h' | h'
        · exact Or.inl h'
        · exact Or.inr (Finset.mem_singleton.mp h')
      have hy' : y = a ∨ y = b := by
        rcases Finset.mem_insert.mp hy with h' | h'
        · exact Or.inl h'
        · exact Or.inr (Finset.mem_singleton.mp h')
      rw [Finset.mem_insert, Finset.mem_singleton]
      rcases hx' with h1 | h1 <;> rcases hy' with h2 | h2 <;>
        rw [h1, h2] at hpadj ⊢
      · exact absurd hpadj (RTree.addrAdjacent_irrefl a)
      · exact Or.inl rfl
      · exact Or.inr rfl
      · exact absurd hpadj (RTree.addrAdjacent_irrefl b)
    · intro hp
      rw [Finset.mem_insert, Finset.mem_singleton] at hp
      rw [Finset.mem_filter, Finset.mem_product]
      rcases hp with h' | h' <;> rw [Prod.mk.injEq] at h'
      · rw [h'.1, h'.2]
        exact ⟨⟨hma, hmb⟩, hadj⟩
      · rw [h'.1, h'.2]
        exact ⟨⟨hmb, hma⟩, (addrAdjacent_comm a b).mp hadj⟩
  have hpairne : ((a, b) : List ℕ × List ℕ) ≠ ((b, a) : List ℕ × List ℕ) := by
    intro h'
    exact hne (congrArg Prod.fst h')
  have hcardC : ({a, b} : Finset (List ℕ)).card = 2 := by
    rw [Finset.card_insert_of_notMem (by rw [Finset.mem_singleton]; exact hne),
      Finset.card_singleton]
  rw [hfilter, Finset.card_insert_of_notMem
      (by rw [Finset.mem_singleton]; exact hpairne),
    Finset.card_singleton, hcardC]

/-! ## §6 — THE STRATA (σ0 → σ1 → σ2 → σ3), parameterized then concrete -/

/-- **σ0 (empty residual): the pack.** Fields at base types; the closed
data triple is `(∅, fOne, ordCard)`. -/
def packEmpty (t : RTree) (v g : List ℕ) : ResidualIdentification t v g :=
  ⟨(∅ : Finset (Finset (List ℕ))), fOne, ordCard⟩

theorem packEmpty_lawful (t : RTree) (v g : List ℕ)
    (h : t.ResidualAmbient v g = ∅) : LawfulT t v g (packEmpty t v g) := by
  apply lawfulT_mk
  · refine ⟨?_, ?_, ?_⟩
    · rw [h, Finset.sup_empty]
      exact Finset.bot_eq_empty
    · intro C hC
      exact absurd hC (Finset.notMem_empty C)
    · exact Finset.notMem_empty ∅
  · intro C hC
    exact absurd hC (Finset.notMem_empty C)
  · intro C hC
    exact absurd hC (Finset.notMem_empty C)
  · intro C hC
    exact absurd hC (Finset.notMem_empty C)
  · intro C hC
    exact absurd hC (Finset.notMem_empty C)
  · intro C hC
    exact absurd hC (Finset.notMem_empty C)

/-- **σ1 (singleton residual): the pack.** One order-1 block; the family
map is the CLOSED base witness `fOne` (so the P-world IV′ module speaks
about the same terms). -/
def packSingleton (t : RTree) (v g z : List ℕ) : ResidualIdentification t v g :=
  ⟨{({z} : Finset (List ℕ))}, fOne, ordCard⟩

theorem packSingleton_lawful (t : RTree) (v g z : List ℕ)
    (hz : t.ResidualAmbient v g = {z}) :
    LawfulT t v g (packSingleton t v g z) := by
  have hzt : z ∈ t.vertices := by
    refine mem_vertices_of_mem_residual t v g z ?_
    rw [hz]
    exact Finset.mem_singleton_self z
  apply lawfulT_mk
  · refine ⟨?_, ?_, ?_⟩
    · rw [Finset.sup_singleton, id_eq, hz]
    · intro C hC C' hC' hne
      rw [Finset.mem_singleton] at hC hC'
      exact absurd (hC.trans hC'.symm) hne
    · rw [Finset.mem_singleton]
      intro h'
      exact Finset.singleton_ne_empty z h'.symm
  · intro C hC C' hC' hne
    rw [Finset.mem_singleton] at hC hC'
    exact absurd (hC.trans hC'.symm) hne
  · exact lawL3_of_singletons fun C hC =>
      ⟨z, Finset.mem_singleton.mp hC⟩
  · exact lawL3'_of_singletons fun C hC =>
      ⟨z, Finset.mem_singleton.mp hC⟩
  · intro C hC
    rw [Finset.mem_singleton] at hC
    subst hC
    exact (seqOn_singleton t hzt).symm
  · intro C hC
    rfl

/-- **σ2 (two isolated order-1 components): the pack.** Two order-1 blocks;
family map the CLOSED base witness `fOne`. -/
def packTwoSingletons (t : RTree) (v g z₁ z₂ : List ℕ) :
    ResidualIdentification t v g :=
  ⟨{({z₁} : Finset (List ℕ)), ({z₂} : Finset (List ℕ))}, fOne, ordCard⟩

theorem packTwoSingletons_lawful (t : RTree) (v g z₁ z₂ : List ℕ)
    (hz : t.ResidualAmbient v g = {z₁, z₂}) (hne : z₁ ≠ z₂)
    (hnadj : ¬ addrAdjacent z₁ z₂) :
    LawfulT t v g (packTwoSingletons t v g z₁ z₂) := by
  have hz₁t : z₁ ∈ t.vertices := by
    refine mem_vertices_of_mem_residual t v g z₁ ?_
    rw [hz]
    exact Finset.mem_insert_self z₁ _
  have hz₂t : z₂ ∈ t.vertices := by
    refine mem_vertices_of_mem_residual t v g z₂ ?_
    rw [hz]
    exact Finset.mem_insert_of_mem (Finset.mem_singleton_self z₂)
  have hblockne : ({z₁} : Finset (List ℕ)) ≠ ({z₂} : Finset (List ℕ)) := by
    intro h'
    exact hne (Finset.singleton_injective h')
  have hmemcase : ∀ C ∈ ({({z₁} : Finset (List ℕ)), ({z₂} : Finset (List ℕ))} :
      Finset (Finset (List ℕ))),
      C = ({z₁} : Finset (List ℕ)) ∨ C = ({z₂} : Finset (List ℕ)) := by
    intro C hC
    rcases Finset.mem_insert.mp hC with h' | h'
    · exact Or.inl h'
    · exact Or.inr (Finset.mem_singleton.mp h')
  apply lawfulT_mk
  · refine ⟨?_, ?_, ?_⟩
    · rw [Finset.sup_insert, Finset.sup_singleton, id_eq, id_eq,
        Finset.sup_eq_union, Finset.singleton_union, hz]
    · intro C hC C' hC' hne'
      rcases hmemcase C hC with rfl | rfl <;> rcases hmemcase C' hC' with rfl | rfl
      · exact absurd rfl hne'
      · exact Finset.disjoint_singleton.mpr hne
      · exact Finset.disjoint_singleton.mpr hne.symm
      · exact absurd rfl hne'
    · intro h'
      rcases hmemcase ∅ h' with h'' | h'' <;>
        exact Finset.singleton_ne_empty _ h''.symm
  · intro C hC C' hC' hne' u hu w hw
    rcases hmemcase C hC with rfl | rfl <;> rcases hmemcase C' hC' with rfl | rfl
    · exact absurd rfl hne'
    · rw [Finset.mem_singleton] at hu hw
      rw [hu, hw]
      exact hnadj
    · rw [Finset.mem_singleton] at hu hw
      rw [hu, hw]
      intro hadj
      exact hnadj ((addrAdjacent_comm z₂ z₁).mp hadj)
    · exact absurd rfl hne'
  · exact lawL3_of_singletons fun C hC => by
      rcases hmemcase C hC with rfl | rfl
      · exact ⟨z₁, rfl⟩
      · exact ⟨z₂, rfl⟩
  · exact lawL3'_of_singletons fun C hC => by
      rcases hmemcase C hC with rfl | rfl
      · exact ⟨z₁, rfl⟩
      · exact ⟨z₂, rfl⟩
  · intro C hC
    rcases hmemcase C hC with rfl | rfl
    · exact (seqOn_singleton t hz₁t).symm
    · exact (seqOn_singleton t hz₂t).symm
  · intro C hC
    rfl

/-- **σ3 (one order-2 path component): the pack.** One adjacent-pair block;
family map the CLOSED base witness `fTwo`. -/
def packPair (t : RTree) (v g a b : List ℕ) : ResidualIdentification t v g :=
  ⟨{({a, b} : Finset (List ℕ))}, fTwo, ordCard⟩

theorem packPair_lawful (t : RTree) (v g a b : List ℕ)
    (hz : t.ResidualAmbient v g = {a, b}) (hne : a ≠ b)
    (hadj : addrAdjacent a b) :
    LawfulT t v g (packPair t v g a b) := by
  have hat : a ∈ t.vertices := by
    refine mem_vertices_of_mem_residual t v g a ?_
    rw [hz]
    exact Finset.mem_insert_self a _
  have hbt : b ∈ t.vertices := by
    refine mem_vertices_of_mem_residual t v g b ?_
    rw [hz]
    exact Finset.mem_insert_of_mem (Finset.mem_singleton_self b)
  apply lawfulT_mk
  · refine ⟨?_, ?_, ?_⟩
    · rw [Finset.sup_singleton, id_eq, hz]
    · intro C hC C' hC' hne'
      rw [Finset.mem_singleton] at hC hC'
      exact absurd (hC.trans hC'.symm) hne'
    · rw [Finset.mem_singleton]
      intro h'
      exact Finset.insert_ne_empty a {b} h'.symm
  · intro C hC C' hC' hne'
    rw [Finset.mem_singleton] at hC hC'
    exact absurd (hC.trans hC'.symm) hne'
  · exact lawL3_of_pair hadj fun C hC => Finset.mem_singleton.mp hC
  · exact lawL3'_of_pair hne hadj fun C hC => Finset.mem_singleton.mp hC
  · intro C hC
    rw [Finset.mem_singleton] at hC
    subst hC
    exact (seqOn_pair_adj t hat hbt hne hadj).symm
  · intro C hC
    rfl

/-! ## §7 — Concrete non-vacuity witnesses (C1-AMD-4 duty), one per stratum -/

/-- The one-vertex T-world tree. -/
def tLeaf : RTree := RTree.node []

/-- `P₃` rooted at an end. -/
def tPath3 : RTree := RTree.node [RTree.node [RTree.node []]]

/-- `P₄` rooted at an end. -/
def tPath4 : RTree := RTree.node [RTree.node [RTree.node [RTree.node []]]]

/-- The two-legged spider (two `P₂` legs on a root). -/
def tSpider : RTree := RTree.node [RTree.node [RTree.node []], RTree.node [RTree.node []]]

theorem vertices_p2 :
    (RTree.node [RTree.node ([] : List RTree)]).vertices
      = {([] : List ℕ), [0]} := by
  ext w
  rw [RTree.mem_vertices_node]
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

theorem vertices_p3 : tPath3.vertices = {([] : List ℕ), [0], [0, 0]} := by
  ext w
  rw [tPath3, RTree.mem_vertices_node]
  constructor
  · rintro (rfl | ⟨i, p, hp, rfl⟩)
    · simp
    · fin_cases i
      simp only [List.get] at hp ⊢
      rw [vertices_p2, Finset.mem_insert, Finset.mem_singleton] at hp
      rcases hp with rfl | rfl <;> simp
  · intro hw
    simp only [Finset.mem_insert, Finset.mem_singleton] at hw
    rcases hw with rfl | rfl | rfl
    · exact Or.inl rfl
    · refine Or.inr ⟨⟨0, by simp⟩, [], ?_, rfl⟩
      simp only [List.get]
      rw [vertices_p2]
      simp
    · refine Or.inr ⟨⟨0, by simp⟩, [0], ?_, rfl⟩
      simp only [List.get]
      rw [vertices_p2]
      simp

theorem vertices_p4 : tPath4.vertices = {([] : List ℕ), [0], [0, 0], [0, 0, 0]} := by
  ext w
  rw [tPath4, RTree.mem_vertices_node]
  constructor
  · rintro (rfl | ⟨i, p, hp, rfl⟩)
    · simp
    · fin_cases i
      simp only [List.get] at hp ⊢
      have : RTree.node [RTree.node [RTree.node []]] = tPath3 := rfl
      rw [this, vertices_p3] at hp
      simp only [Finset.mem_insert, Finset.mem_singleton] at hp
      rcases hp with rfl | rfl | rfl <;> simp
  · intro hw
    simp only [Finset.mem_insert, Finset.mem_singleton] at hw
    rcases hw with rfl | rfl | rfl | rfl
    · exact Or.inl rfl
    · refine Or.inr ⟨⟨0, by simp⟩, [], ?_, rfl⟩
      simp only [List.get]
      have : RTree.node [RTree.node [RTree.node []]] = tPath3 := rfl
      rw [this, vertices_p3]
      simp
    · refine Or.inr ⟨⟨0, by simp⟩, [0], ?_, rfl⟩
      simp only [List.get]
      have : RTree.node [RTree.node [RTree.node []]] = tPath3 := rfl
      rw [this, vertices_p3]
      simp
    · refine Or.inr ⟨⟨0, by simp⟩, [0, 0], ?_, rfl⟩
      simp only [List.get]
      have : RTree.node [RTree.node [RTree.node []]] = tPath3 := rfl
      rw [this, vertices_p3]
      simp

theorem vertices_spider :
    tSpider.vertices = {([] : List ℕ), [0], [0, 0], [1], [1, 0]} := by
  ext w
  rw [tSpider, RTree.mem_vertices_node]
  constructor
  · rintro (rfl | ⟨i, p, hp, rfl⟩)
    · simp
    · fin_cases i <;>
      · simp only [List.get] at hp ⊢
        rw [vertices_p2, Finset.mem_insert, Finset.mem_singleton] at hp
        rcases hp with rfl | rfl <;> simp
  · intro hw
    simp only [Finset.mem_insert, Finset.mem_singleton] at hw
    rcases hw with rfl | rfl | rfl | rfl | rfl
    · exact Or.inl rfl
    · refine Or.inr ⟨⟨0, by simp⟩, [], ?_, rfl⟩
      simp only [List.get]
      rw [vertices_p2]
      simp
    · refine Or.inr ⟨⟨0, by simp⟩, [0], ?_, rfl⟩
      simp only [List.get]
      rw [vertices_p2]
      simp
    · refine Or.inr ⟨⟨1, by simp⟩, [], ?_, rfl⟩
      simp only [List.get]
      rw [vertices_p2]
      simp
    · refine Or.inr ⟨⟨1, by simp⟩, [0], ?_, rfl⟩
      simp only [List.get]
      rw [vertices_p2]
      simp

/-- Generic closed-neighbourhood computation at the root: the root plus the
depth-1 addresses (consumed `addrAdjacent_nil_iff`). -/
theorem closedNbhd_root_eq (t : RTree) :
    t.closedNbhd [] = t.vertices.filter (fun w => w = [] ∨ w.length = 1) := by
  unfold RTree.closedNbhd
  apply Finset.filter_congr
  intro w _
  rw [addrAdjacent_nil_iff]

theorem residual_tLeaf : tLeaf.ResidualAmbient [] [] = ∅ := by
  unfold RTree.ResidualAmbient
  have hsub : tLeaf.vertices ⊆ tLeaf.closedNbhd [] := by
    intro w hw
    rw [closedNbhd_root_eq, Finset.mem_filter]
    refine ⟨hw, ?_⟩
    rw [tLeaf, RTree.vertices_leaf, Finset.mem_singleton] at hw
    exact Or.inl hw
  rw [Finset.sdiff_eq_empty_iff_subset.mpr hsub, Finset.empty_sdiff]

theorem residual_tPath3 : tPath3.ResidualAmbient [] [] = {([0, 0] : List ℕ)} := by
  unfold RTree.ResidualAmbient
  rw [closedNbhd_root_eq, vertices_p3]
  ext w
  simp only [Finset.mem_sdiff, Finset.mem_filter, Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨⟨hv, hn⟩, _⟩
    rcases hv with rfl | rfl | rfl
    · exact absurd ⟨Or.inl rfl, Or.inl rfl⟩ hn
    · exact absurd ⟨Or.inr (Or.inl rfl), Or.inr rfl⟩ hn
    · rfl
  · rintro rfl
    refine ⟨⟨Or.inr (Or.inr rfl), ?_⟩, ?_⟩ <;>
    · rintro ⟨-, (h | h)⟩ <;> simp at h

theorem residual_tPath4 :
    tPath4.ResidualAmbient [] [] = {([0, 0] : List ℕ), [0, 0, 0]} := by
  unfold RTree.ResidualAmbient
  rw [closedNbhd_root_eq, vertices_p4]
  ext w
  simp only [Finset.mem_sdiff, Finset.mem_filter, Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨⟨hv, hn⟩, _⟩
    rcases hv with rfl | rfl | rfl | rfl
    · exact absurd ⟨Or.inl rfl, Or.inl rfl⟩ hn
    · exact absurd ⟨Or.inr (Or.inl rfl), Or.inr rfl⟩ hn
    · exact Or.inl rfl
    · exact Or.inr rfl
  · rintro (rfl | rfl)
    · refine ⟨⟨Or.inr (Or.inr (Or.inl rfl)), ?_⟩, ?_⟩ <;>
      · rintro ⟨-, (h | h)⟩ <;> simp at h
    · refine ⟨⟨Or.inr (Or.inr (Or.inr rfl)), ?_⟩, ?_⟩ <;>
      · rintro ⟨-, (h | h)⟩ <;> simp at h

theorem residual_tSpider :
    tSpider.ResidualAmbient [] [] = {([0, 0] : List ℕ), [1, 0]} := by
  unfold RTree.ResidualAmbient
  rw [closedNbhd_root_eq, vertices_spider]
  ext w
  simp only [Finset.mem_sdiff, Finset.mem_filter, Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨⟨hv, hn⟩, _⟩
    rcases hv with rfl | rfl | rfl | rfl | rfl
    · exact absurd ⟨Or.inl rfl, Or.inl rfl⟩ hn
    · exact absurd ⟨Or.inr (Or.inl rfl), Or.inr rfl⟩ hn
    · exact Or.inl rfl
    · exact absurd ⟨Or.inr (Or.inr (Or.inr (Or.inl rfl))), Or.inr rfl⟩ hn
    · exact Or.inr rfl
  · rintro (rfl | rfl)
    · refine ⟨⟨Or.inr (Or.inr (Or.inl rfl)), ?_⟩, ?_⟩ <;>
      · rintro ⟨-, (h | h)⟩ <;> simp at h
    · refine ⟨⟨Or.inr (Or.inr (Or.inr (Or.inr rfl))), ?_⟩, ?_⟩ <;>
      · rintro ⟨-, (h | h)⟩ <;> simp at h

/-- The σ3 witness block really is an adjacent pair. -/
theorem adj_p4_pair : addrAdjacent ([0, 0] : List ℕ) [0, 0, 0] :=
  Or.inl ⟨by simp, by simp [List.dropLast]⟩

/-- The σ2 witness blocks really are non-adjacent. -/
theorem nadj_spider_pair : ¬ addrAdjacent ([0, 0] : List ℕ) [1, 0] := by
  rintro (⟨-, h⟩ | ⟨-, h⟩) <;> simp [List.dropLast] at h

/-- **σ0 CONCRETE (C1-AMD-4):** the empty-residual pack, inhabited at
`(tLeaf, [], [])`; its data triple IS the closed base triple
`(sSigma0, fOne, ordCard)` (definitional). -/
def packC0 : ResidualIdentification tLeaf [] [] := packEmpty tLeaf [] []

theorem packC0_lawful : LawfulT tLeaf [] [] packC0 :=
  packEmpty_lawful tLeaf [] [] residual_tLeaf

theorem packC0_data : packC0 = ⟨sSigma0, fOne, ordCard⟩ := rfl

/-- **σ1 CONCRETE (C1-AMD-4):** the singleton pack at `(tPath3, [], [])`;
data triple `(sSigma1, fOne, ordCard)` (definitional). -/
def packC1 : ResidualIdentification tPath3 [] [] :=
  packSingleton tPath3 [] [] [0, 0]

theorem packC1_lawful : LawfulT tPath3 [] [] packC1 :=
  packSingleton_lawful tPath3 [] [] [0, 0] residual_tPath3

theorem packC1_data : packC1 = ⟨sSigma1, fOne, ordCard⟩ := rfl

/-- **σ2 CONCRETE (C1-AMD-4):** the two-singleton pack at
`(tSpider, [], [])`; data triple `(sSigma2, fOne, ordCard)` (definitional). -/
def packC2 : ResidualIdentification tSpider [] [] :=
  packTwoSingletons tSpider [] [] [0, 0] [1, 0]

theorem packC2_lawful : LawfulT tSpider [] [] packC2 :=
  packTwoSingletons_lawful tSpider [] [] [0, 0] [1, 0] residual_tSpider
    (by simp) nadj_spider_pair

theorem packC2_data : packC2 = ⟨sSigma2, fOne, ordCard⟩ := rfl

/-- **σ3 CONCRETE (C1-AMD-4):** the order-2-path pack at
`(tPath4, [], [])`; data triple `(sSigma3, fTwo, ordCard)` (definitional). -/
def packC3 : ResidualIdentification tPath4 [] [] :=
  packPair tPath4 [] [] [0, 0] [0, 0, 0]

theorem packC3_lawful : LawfulT tPath4 [] [] packC3 :=
  packPair_lawful tPath4 [] [] [0, 0] [0, 0, 0] residual_tPath4
    (by simp) adj_p4_pair

theorem packC3_data : packC3 = ⟨sSigma3, fTwo, ordCard⟩ := rfl

/-! ## §8 — W5: the kernel anchor equalities (the H-bridge cure)

Concrete, non-degenerate `indepCountOn` values the fidelity instrument also
computes, extracted from the σ2/σ3 packs' compiled L5 through the closed
witnesses' coefficient arithmetic. -/

/-- W5 anchor 1 (rank 1, non-adjacent pair): on the spider's residual
`{[0,0],[1,0]}` there are exactly TWO independent sets of size 1. -/
theorem anchor_spider_rank1 :
    tSpider.indepCountOn (tSpider.ResidualAmbient [] []) 1 = 2 := by
  have h := packC2_lawful.l5 1
  have hprod : (∏ C ∈ packC2.s, packC2.f C) = oneVertexSeq * oneVertexSeq := by
    show (∏ C ∈ ({({([0, 0] : List ℕ)} : Finset (List ℕ)),
        ({([1, 0] : List ℕ)} : Finset (List ℕ))} : Finset (Finset (List ℕ))),
      fOne C) = _
    rw [Finset.prod_insert (by
      rw [Finset.mem_singleton]
      intro h'
      have := Finset.singleton_injective h'
      simp at this), Finset.prod_singleton]
    rfl
  rw [hprod] at h
  rw [oneVertexSeq_sq_coeff] at h
  norm_num at h
  exact_mod_cast h.symm

/-- W5 anchor 2 (rank 2, non-adjacent pair): on the spider's residual there
is exactly ONE independent set of size 2. -/
theorem anchor_spider_rank2 :
    tSpider.indepCountOn (tSpider.ResidualAmbient [] []) 2 = 1 := by
  have h := packC2_lawful.l5 2
  have hprod : (∏ C ∈ packC2.s, packC2.f C) = oneVertexSeq * oneVertexSeq := by
    show (∏ C ∈ ({({([0, 0] : List ℕ)} : Finset (List ℕ)),
        ({([1, 0] : List ℕ)} : Finset (List ℕ))} : Finset (Finset (List ℕ))),
      fOne C) = _
    rw [Finset.prod_insert (by
      rw [Finset.mem_singleton]
      intro h'
      have := Finset.singleton_injective h'
      simp at this), Finset.prod_singleton]
    rfl
  rw [hprod] at h
  rw [oneVertexSeq_sq_coeff] at h
  norm_num at h
  exact_mod_cast h.symm

/-- W5 anchor 3 (rank 1, adjacent pair): on `P₄`'s residual
`{[0,0],[0,0,0]}` there are exactly TWO independent sets of size 1. -/
theorem anchor_path4_rank1 :
    tPath4.indepCountOn (tPath4.ResidualAmbient [] []) 1 = 2 := by
  have h := packC3_lawful.l5 1
  have hprod : (∏ C ∈ packC3.s, packC3.f C) = twoPathSeq := by
    show (∏ C ∈ ({({([0, 0] : List ℕ), ([0, 0, 0] : List ℕ)} : Finset (List ℕ))} :
        Finset (Finset (List ℕ))), fTwo C) = _
    rw [Finset.prod_singleton]
    rfl
  rw [hprod, twoPathSeq_coeff] at h
  norm_num at h
  exact_mod_cast h.symm

/-- W5 anchor 4 (rank 2, adjacent pair — the adjacency-sensitive zero): on
`P₄`'s residual there is NO independent set of size 2. This anchor
separates the adjacent from the non-adjacent pair (anchor 2's value 1),
which is exactly the semantic content a numerical mirror must reproduce. -/
theorem anchor_path4_rank2 :
    tPath4.indepCountOn (tPath4.ResidualAmbient [] []) 2 = 0 := by
  have h := packC3_lawful.l5 2
  have hprod : (∏ C ∈ packC3.s, packC3.f C) = twoPathSeq := by
    show (∏ C ∈ ({({([0, 0] : List ℕ), ([0, 0, 0] : List ℕ)} : Finset (List ℕ))} :
        Finset (Finset (List ℕ))), fTwo C) = _
    rw [Finset.prod_singleton]
    rfl
  rw [hprod, twoPathSeq_coeff] at h
  norm_num at h
  exact_mod_cast h.symm

/-! ## §9 — The end-to-end payoff on any lawful pack (F-b wiring) -/

/-- **The sealed r14 closure at any LAWFUL pack.** `hID`/`hadm` are
DISCHARGED BY CONSTRUCTION from the law bundle; with L3+L3′+L7 compiled in
`hL`, the instantiated `hKSCOPE` says exactly "every connected component of
`U` — a tree under inherited adjacency — has order ≤ 25" (the K-SCOPE of
record, F-b as reworded at the freeze). **PREMISE K (`hKL`), K-SCOPE
(`hKSCOPE`) and the crossing bound (`hx`) stay on the face — NEVER
discharged here.** Closes nothing beyond its stated scope; asserts no
target. -/
theorem G1_closure_of_lawful (t : RTree) (v g : List ℕ) {p : ℕ} (hp : 2 ≤ p)
    (R : ResidualIdentification t v g) (hL : LawfulT t v g R)
    (hKL : ∀ C ∈ R.s, R.ord C ≤ 25 → AdjacentLogConcave (R.f C))
    (hKSCOPE : ∀ C ∈ R.s, R.ord C ≤ 25)
    (hx : t.crossingIndexOn (t.ResidualAmbient v g) ≤ p - 2) :
    t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) ≤ 0 :=
  R14C3P.G1_closure_of_identification t v g hp R.s R.f R.ord
    hL.l5 hL.l6 hKL hKSCOPE hx

end R16C2
