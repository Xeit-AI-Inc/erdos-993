import R16C2P
import R16C3N

/-!
# R16C3P — LAW IV′ AT GENERAL BLOCK SHAPES: the identification proper
# (r16 Cycle 3, route R16C3-T; the RES-12 content)

PROTOTYPE (grade `RG` AT BEST after critics and a gate act; nothing here is
`governed`; nothing is ever `formally_verified`).

## Ceiling honesty (undetachable)

TREE / FOREST / TRANSFER / COUNTEREXAMPLE open before and after.
`AmbientTargetDeg2`, (α), (β), (A), (B) are targets never asserted. This
file compiles the discharge of the frozen LAW IV′ (per-index
order-realizability) at GENERAL block shapes, over abstract base-typed data
— nothing more. No unimodality, log-concavity, or sign fact is concluded of
anything (F1/F2 not approached); PREMISE K is not mentioned, let alone
imported.

## The r10 claim-C6 model-adequacy citation (F-c; routing rider honored)

Per F-c of record and the C3 allocation's routing rider: LAW IV′ is an
existence statement INSIDE the P-world formal model. Every realizing tree
below is CONSTRUCTED as a formal `RTree` term by explicit induction; no
step appeals to, re-derives, strengthens, or otherwise brushes the r10
claim-C6 model-adequacy citation — the citation stays a citation, and the
question of what the citation covers is untouched (it remains the
interlude-dossier item R16-RES-7). Nothing here upgrades Premise K or its
scope.

## NO SHIMS (restated and honored)

Nothing here assumes a cross-world correspondence. This module cannot even
see the T-world (the clash of record); it imports the P-lineage (through
the sealed `R16C2P`, consumed READ-ONLY) + the world-neutral `R16C3N`
ONLY (F-a as frozen: IV′'s module may import WORLD-P's `RTree` half — that
is its home — but never both worlds). LAW IV′ is stated on bare base-typed
data; the general discharge below quantifies over ALL base-typed block
families whose blocks are neutral tree blocks — so the T-side's general
pack data `(nbComponents U, nbSeqOn, ordCard)` is covered for EVERY base
value `U`, with no T-world value ever crossing into this module. The
definitional bridge `addrAdjacent u w ↔ nbAdjacent u w` is an
`Iff.rfl`-level kernel theorem inside this world's closure (the head-2
meeting-on-neutral-data pattern; see the R16C3N header disclosure).

## What this module contributes (the C2-AMD-1 remainder (ii))

1. `indepNNSeq_eq_nbSeqOn`: every P-world tree's independence sequence IS
   the neutral `nbSeqOn` of its vertex set (the P-side general evaluation
   bridge).
2. **The realization theorem** (`exists_tree_of_downclosed` →
   `exists_realizer`): for EVERY neutral tree block `C` — any order, any
   shape — an explicitly constructed P-world tree of order `|C|` whose
   independence sequence is `nbSeqOn C`. Method: normalize the block to a
   dropLast-downward-closed address set (neutral structure theorem);
   realize that set by strong induction on cardinality, assembling child
   realizers under an order-isomorphic re-indexing of the child labels;
   transport the count sequence across the exhibited
   adjacency-preserving injections (the neutral invariance engine — the
   explicit-bijection proof shape, never an algebraic shortcut).
3. **LAW IV′ at general block shapes**: `lawIVPrime_of_treeBlocks` (any
   family of tree blocks, `f := nbSeqOn`, frozen `ord` binding) and its
   instantiation `lawIVPrime_components : ∀ U, LawIVPrime (nbComponents U)
   nbSeqOn ordCard` — the RES-12 identification content at any size.
4. σ4 concrete non-vacuity (C1-AMD-4): `lawIVPrime_sigma4` on the literal
   closed triple the T-world σ4 pack carries, and an order-3 realizer for
   the closed witness `threePathSeq`.

## Reserved zone

`Ipoly`/`Apoly`/`Bpoly`/`Fpoly` exist in this world's vocabulary but no
proof below mentions, unfolds, or invokes them, nor any availability
recursion or blocked-root state; the r12 Q1–Q6 boundary is not approached.
Consumed from the sealed lineage: `RTree.vertices`,
`RTree.mem_vertices_node`, `RTree.IndepSet`, `RTree.indepNNSeq`,
`R16C2.LawIVPrime`, `R16C2.ordCard` — at their ruled standings, never
re-derived.

## Invariance (A16)

Every theorem is a proposition about its stated arguments only. The
realizing trees and relabelling maps are EXHIBITED existential witnesses;
the child re-indexing uses the canonical order-isomorphism of the child
label set, and no concluded property depends on the choice (the concluded
properties — sequence equality and order equality — are invariant under
any adjacency-preserving relabelling, which is exactly what the neutral
invariance engine proves).

## Fence check

No computation, `#eval`, `decide`, `native_decide`, search, or sampling;
no fence row of `REJECTED-MECHANISMS.md` is approached.
-/

open scoped Classical
open Erdos993C8U1
noncomputable section

namespace R16C3

open R16C2

/-! ## §1 — The definitional bridge (P-world half; `Iff.rfl`-level) -/

/-- The P-lineage's own `addrAdjacent` IS the neutral `nbAdjacent`, formula
for formula — a definitional-unfolding kernel theorem inside the P-world
closure (never a stipulation). -/
theorem addrP_iff_nb (u w : List ℕ) : addrAdjacent u w ↔ nbAdjacent u w :=
  Iff.rfl

/-! ## §2 — The P-side general evaluation bridge -/

/-- **Every P-world tree's independence sequence is the neutral `nbSeqOn`
of its vertex set.** The membership half of `IndepSet` is absorbed by the
powerset; what remains is neutral adjacency-freeness. -/
theorem indepNNSeq_eq_nbSeqOn (tr : RTree) :
    tr.indepNNSeq = nbSeqOn tr.vertices := by
  unfold RTree.indepNNSeq nbSeqOn
  congr 1
  unfold nbIndepFamily
  apply Finset.filter_congr
  intro S hS
  rw [Finset.mem_powerset] at hS
  constructor
  · intro h
    exact h.2
  · intro h
    exact ⟨hS, h⟩

/-! ## §3 — The realization theorem, step 1: downward-closed address sets
are realized by explicit `RTree` terms -/

/-- **Realization of dropLast-downward-closed address sets.** For every
finite `Q ∋ []` closed under `dropLast`, there is an explicitly constructed
P-world tree and a relabelling `φ` with `tr.vertices = Q.image φ`, `φ`
injective, length-preserving, and `nbAdjacent`-preserving in both
directions on `Q`. Strong induction on `|Q|`; the children of the root are
the realizers of the child sets `{p | i :: p ∈ Q}`, re-indexed by the
canonical order-isomorphism of the child label set. -/
theorem exists_tree_of_downclosed :
    ∀ (n : ℕ) (Q : Finset (List ℕ)), Q.card ≤ n → [] ∈ Q →
      (∀ p ∈ Q, p ≠ [] → p.dropLast ∈ Q) →
      ∃ (tr : RTree) (φ : List ℕ → List ℕ),
        tr.vertices = Q.image φ ∧ Set.InjOn φ Q ∧
        (∀ u ∈ Q, (φ u).length = u.length) ∧
        (∀ u ∈ Q, ∀ w ∈ Q, (nbAdjacent (φ u) (φ w) ↔ nbAdjacent u w)) := by
  intro n
  induction n with
  | zero =>
    intro Q hcard hnil _
    exfalso
    have hpos : 0 < Q.card := Finset.card_pos.mpr ⟨[], hnil⟩
    omega
  | succ n ih =>
    intro Q hcard hnil hdc
    have htake := take_mem_of_downclosed hdc
    -- the child label set
    set J : Finset ℕ := (Q.filter (fun u => u.length = 1)).image (fun u => u.headI)
      with hJdef
    have hmemJ : ∀ i : ℕ, i ∈ J ↔ [i] ∈ Q := by
      intro i
      rw [hJdef, Finset.mem_image]
      constructor
      · rintro ⟨u, hu, rfl⟩
        rw [Finset.mem_filter] at hu
        have h := singleton_headI_of_length_one u hu.2
        rw [← h]
        exact hu.1
      · intro h
        exact ⟨[i], Finset.mem_filter.mpr ⟨h, rfl⟩, rfl⟩
    -- the child sets
    set Qc : ℕ → Finset (List ℕ) :=
      fun i => (Q.filter (fun u => u.take 1 = [i])).image (fun u => u.drop 1)
      with hQcdef
    have hmemQc : ∀ (i : ℕ) (p : List ℕ), p ∈ Qc i ↔ (i :: p) ∈ Q := by
      intro i p
      simp only [hQcdef]
      rw [Finset.mem_image]
      constructor
      · rintro ⟨u, hu, rfl⟩
        rw [Finset.mem_filter] at hu
        have h0 := List.take_append_drop 1 u
        rw [hu.2] at h0
        have h1 : u = i :: u.drop 1 := h0.symm
        rw [← h1]
        exact hu.1
      · intro h
        exact ⟨i :: p, Finset.mem_filter.mpr ⟨h, rfl⟩, rfl⟩
    have hQcnil : ∀ i : ℕ, [i] ∈ Q → [] ∈ Qc i := fun i h => (hmemQc i []).mpr h
    have hQcdc : ∀ (i : ℕ), ∀ p ∈ Qc i, p ≠ [] → p.dropLast ∈ Qc i := by
      intro i p hp hpne
      have h1 : (i :: p) ∈ Q := (hmemQc i p).mp hp
      have h2 : (i :: p).dropLast ∈ Q := hdc _ h1 (List.cons_ne_nil _ _)
      rw [List.dropLast_cons_of_ne_nil hpne] at h2
      exact (hmemQc i p.dropLast).mpr h2
    have hQccard : ∀ i : ℕ, [i] ∈ Q → (Qc i).card ≤ n := by
      intro i hi
      have hinj : Function.Injective (fun p : List ℕ => i :: p) := by
        intro a b h
        exact (List.cons.inj h).2
      have hsub : (Qc i).image (fun p => i :: p) ⊆ Q.erase [] := by
        intro x hx
        rw [Finset.mem_image] at hx
        obtain ⟨p, hp, rfl⟩ := hx
        rw [Finset.mem_erase]
        exact ⟨List.cons_ne_nil _ _, (hmemQc i p).mp hp⟩
      have h1 : (Qc i).card = ((Qc i).image (fun p => i :: p)).card :=
        (Finset.card_image_of_injective _ hinj).symm
      have h2 : ((Qc i).image (fun p => i :: p)).card ≤ (Q.erase []).card :=
        Finset.card_le_card hsub
      have h3 : (Q.erase []).card = Q.card - 1 := Finset.card_erase_of_mem hnil
      have h4 : 0 < Q.card := Finset.card_pos.mpr ⟨[], hnil⟩
      omega
    -- child realizers by the induction hypothesis (totalized for choice)
    have Hex : ∀ i : ℕ, ∃ (tr : RTree) (φi : List ℕ → List ℕ),
        [i] ∈ Q →
        (tr.vertices = (Qc i).image φi ∧ Set.InjOn φi (Qc i) ∧
         (∀ p ∈ Qc i, (φi p).length = p.length) ∧
         (∀ p ∈ Qc i, ∀ q ∈ Qc i, (nbAdjacent (φi p) (φi q) ↔ nbAdjacent p q))) := by
      intro i
      by_cases hi : [i] ∈ Q
      · obtain ⟨tr, φi, h⟩ := ih (Qc i) (hQccard i hi) (hQcnil i hi) (hQcdc i)
        exact ⟨tr, φi, fun _ => h⟩
      · exact ⟨RTree.node [], id, fun h => absurd h hi⟩
    choose trc φc hprops using Hex
    have hPvert : ∀ i : ℕ, [i] ∈ Q → (trc i).vertices = (Qc i).image (φc i) :=
      fun i h => (hprops i h).1
    have hPinj : ∀ i : ℕ, [i] ∈ Q → Set.InjOn (φc i) (Qc i) :=
      fun i h => (hprops i h).2.1
    have hPlen : ∀ i : ℕ, [i] ∈ Q → ∀ p ∈ Qc i, (φc i p).length = p.length :=
      fun i h => (hprops i h).2.2.1
    have hPadj : ∀ i : ℕ, [i] ∈ Q → ∀ p ∈ Qc i, ∀ q ∈ Qc i,
        (nbAdjacent (φc i p) (φc i q) ↔ nbAdjacent p q) :=
      fun i h => (hprops i h).2.2.2
    -- the canonical child re-indexing
    set m : ℕ := J.card with hm
    set eIso := J.orderIsoOfFin hm.symm with heIso
    obtain ⟨cs, hcslen, hcsget⟩ :
        ∃ cs : List RTree, cs.length = m ∧
          ∀ (j : ℕ) (h1 : j < cs.length) (h2 : j < m),
            cs.get ⟨j, h1⟩ = trc ((eIso ⟨j, h2⟩ : {x // x ∈ J}) : ℕ) := by
      refine ⟨List.ofFn (fun k : Fin m => trc ((eIso k : {x // x ∈ J}) : ℕ)),
        List.length_ofFn, ?_⟩
      intro j h1 h2
      rw [List.get_ofFn]
      rfl
    -- vertices of the assembled node, re-expressed over `Fin m`
    have hvert : ∀ v : List ℕ, v ∈ (RTree.node cs).vertices ↔
        v = [] ∨ ∃ k : Fin m,
          ∃ p ∈ (trc ((eIso k : {x // x ∈ J}) : ℕ)).vertices, v = (k : ℕ) :: p := by
      intro v
      rw [RTree.mem_vertices_node]
      constructor
      · rintro (rfl | ⟨i, p, hp, rfl⟩)
        · exact Or.inl rfl
        · have hi2 : (i : ℕ) < m := by
            rw [← hcslen]
            exact i.2
          refine Or.inr ⟨⟨(i : ℕ), hi2⟩, p, ?_, rfl⟩
          rw [← hcsget (i : ℕ) i.2 hi2]
          exact hp
      · rintro (rfl | ⟨k, p, hp, rfl⟩)
        · exact Or.inl rfl
        · have hk1 : (k : ℕ) < cs.length := by
            rw [hcslen]
            exact k.2
          refine Or.inr ⟨⟨(k : ℕ), hk1⟩, p, ?_, rfl⟩
          rw [hcsget (k : ℕ) hk1 k.2]
          exact hp
    -- the global relabelling
    set φ : List ℕ → List ℕ := fun u =>
      match u with
      | [] => []
      | i :: p =>
          if h : i ∈ J then ((eIso.symm ⟨i, h⟩ : Fin m) : ℕ) :: φc i p else []
      with hφdef
    have hφnil : φ [] = [] := rfl
    have hφcons : ∀ (i : ℕ) (p : List ℕ) (h : i ∈ J),
        φ (i :: p) = ((eIso.symm ⟨i, h⟩ : Fin m) : ℕ) :: φc i p := by
      intro i p h
      show (if h' : i ∈ J then ((eIso.symm ⟨i, h'⟩ : Fin m) : ℕ) :: φc i p else []) = _
      rw [dif_pos h]
    have hJmem_of_mem : ∀ (i : ℕ) (p : List ℕ), (i :: p) ∈ Q → i ∈ J := by
      intro i p h
      have h1 : (i :: p).take 1 ∈ Q := htake _ h 1
      have h2 : (i :: p).take 1 = [i] := rfl
      rw [h2] at h1
      exact (hmemJ i).mpr h1
    have hQc_of_mem : ∀ (i : ℕ) (p : List ℕ), (i :: p) ∈ Q → p ∈ Qc i :=
      fun i p h => (hmemQc i p).mpr h
    have hval_inj : ∀ (i j : ℕ) (hi : i ∈ J) (hj : j ∈ J),
        ((eIso.symm ⟨i, hi⟩ : Fin m) : ℕ) = ((eIso.symm ⟨j, hj⟩ : Fin m) : ℕ) → i = j := by
      intro i j hi hj h
      have hfin : (eIso.symm ⟨i, hi⟩ : Fin m) = eIso.symm ⟨j, hj⟩ := Fin.ext h
      have h2 := congrArg eIso hfin
      rw [OrderIso.apply_symm_apply, OrderIso.apply_symm_apply] at h2
      exact congrArg Subtype.val h2
    -- (A) vertices
    have hvertQ : (RTree.node cs).vertices = Q.image φ := by
      ext v
      rw [hvert v, Finset.mem_image]
      constructor
      · rintro (rfl | ⟨k, p, hp, rfl⟩)
        · exact ⟨[], hnil, rfl⟩
        · have hiJ : ((eIso k : {x // x ∈ J}) : ℕ) ∈ J := (eIso k).2
          have hiQ : [((eIso k : {x // x ∈ J}) : ℕ)] ∈ Q := (hmemJ _).mp hiJ
          rw [hPvert _ hiQ, Finset.mem_image] at hp
          obtain ⟨q, hq, rfl⟩ := hp
          refine ⟨((eIso k : {x // x ∈ J}) : ℕ) :: q, (hmemQc _ q).mp hq, ?_⟩
          rw [hφcons _ q hiJ]
          congr 1
          have h1 : (⟨((eIso k : {x // x ∈ J}) : ℕ), hiJ⟩ : {x // x ∈ J}) = eIso k := by
            apply Subtype.ext
            rfl
          rw [h1, OrderIso.symm_apply_apply]
      · rintro ⟨u, hu, rfl⟩
        cases u with
        | nil => exact Or.inl hφnil
        | cons i p =>
          have hiJ : i ∈ J := hJmem_of_mem i p hu
          have hiQ : [i] ∈ Q := (hmemJ i).mp hiJ
          have hpQc : p ∈ Qc i := hQc_of_mem i p hu
          rw [hφcons i p hiJ]
          refine Or.inr ⟨eIso.symm ⟨i, hiJ⟩, φc i p, ?_, rfl⟩
          have h1 : ((eIso (eIso.symm ⟨i, hiJ⟩) : {x // x ∈ J}) : ℕ) = i := by
            rw [OrderIso.apply_symm_apply]
          rw [h1, hPvert i hiQ, Finset.mem_image]
          exact ⟨p, hpQc, rfl⟩
    -- (B) injectivity on `Q`
    have hinjQ : Set.InjOn φ Q := by
      intro u hu w hw heq
      have hu' : u ∈ Q := hu
      have hw' : w ∈ Q := hw
      cases u with
      | nil =>
        cases w with
        | nil => rfl
        | cons j q =>
          exfalso
          have hjJ : j ∈ J := hJmem_of_mem j q hw'
          rw [hφnil, hφcons j q hjJ] at heq
          exact List.cons_ne_nil _ _ heq.symm
      | cons i p =>
        cases w with
        | nil =>
          exfalso
          have hiJ : i ∈ J := hJmem_of_mem i p hu'
          rw [hφnil, hφcons i p hiJ] at heq
          exact List.cons_ne_nil _ _ heq
        | cons j q =>
          have hiJ : i ∈ J := hJmem_of_mem i p hu'
          have hjJ : j ∈ J := hJmem_of_mem j q hw'
          have hiQ : [i] ∈ Q := (hmemJ i).mp hiJ
          rw [hφcons i p hiJ, hφcons j q hjJ] at heq
          have h1 := (List.cons.inj heq).1
          have h2 := (List.cons.inj heq).2
          have hij : i = j := hval_inj i j hiJ hjJ h1
          subst hij
          have hp : p ∈ Qc i := hQc_of_mem i p hu'
          have hq : q ∈ Qc i := hQc_of_mem i q hw'
          have h3 : p = q := hPinj i hiQ hp hq h2
          rw [h3]
    -- (C) length preservation
    have hlenQ : ∀ u ∈ Q, (φ u).length = u.length := by
      intro u hu
      cases u with
      | nil => rw [hφnil]
      | cons i p =>
        have hiJ : i ∈ J := hJmem_of_mem i p hu
        have hiQ : [i] ∈ Q := (hmemJ i).mp hiJ
        have hp : p ∈ Qc i := hQc_of_mem i p hu
        rw [hφcons i p hiJ]
        simp only [List.length_cons]
        rw [hPlen i hiQ p hp]
    -- (D) adjacency preservation
    have hadjQ : ∀ u ∈ Q, ∀ w ∈ Q, (nbAdjacent (φ u) (φ w) ↔ nbAdjacent u w) := by
      intro u hu w hw
      cases u with
      | nil =>
        cases w with
        | nil =>
          rw [hφnil]
        | cons j q =>
          have hjJ : j ∈ J := hJmem_of_mem j q hw
          have hjQ : [j] ∈ Q := (hmemJ j).mp hjJ
          have hq : q ∈ Qc j := hQc_of_mem j q hw
          rw [hφnil, hφcons j q hjJ, nbAdjacent_nil_iff, nbAdjacent_nil_iff]
          simp only [List.length_cons]
          rw [hPlen j hjQ q hq]
      | cons i p =>
        cases w with
        | nil =>
          have hiJ : i ∈ J := hJmem_of_mem i p hu
          have hiQ : [i] ∈ Q := (hmemJ i).mp hiJ
          have hp : p ∈ Qc i := hQc_of_mem i p hu
          rw [hφnil, hφcons i p hiJ,
            nbAdjacent_comm (((eIso.symm ⟨i, hiJ⟩ : Fin m) : ℕ) :: φc i p) [],
            nbAdjacent_comm (i :: p) [], nbAdjacent_nil_iff, nbAdjacent_nil_iff]
          simp only [List.length_cons]
          rw [hPlen i hiQ p hp]
        | cons j q =>
          have hiJ : i ∈ J := hJmem_of_mem i p hu
          have hjJ : j ∈ J := hJmem_of_mem j q hw
          have hiQ : [i] ∈ Q := (hmemJ i).mp hiJ
          have hp : p ∈ Qc i := hQc_of_mem i p hu
          have hq' : q ∈ Qc j := hQc_of_mem j q hw
          rw [hφcons i p hiJ, hφcons j q hjJ]
          by_cases hij : i = j
          · subst hij
            rw [nbAdjacent_cons_cons, nbAdjacent_cons_cons]
            exact hPadj i hiQ p hp q hq'
          · have hne : ((eIso.symm ⟨i, hiJ⟩ : Fin m) : ℕ)
                ≠ ((eIso.symm ⟨j, hjJ⟩ : Fin m) : ℕ) := by
              intro h
              exact hij (hval_inj i j hiJ hjJ h)
            constructor
            · intro h
              exact absurd h (not_nbAdjacent_cons_cons_of_ne hne _ _)
            · intro h
              exact absurd h (not_nbAdjacent_cons_cons_of_ne hij _ _)
    exact ⟨RTree.node cs, φ, hvertQ, hinjQ, hlenQ, hadjQ⟩

/-! ## §4 — The realization theorem, step 2: every tree block is realized -/

/-- **The realizer.** For every neutral tree block `C` — any order, any
shape — an explicit P-world tree of order `|C|` whose independence sequence
is `nbSeqOn C`. Normalization (neutral structure theorem) + realization of
the normalized set (§3) + the neutral invariance engine across both
exhibited relabellings. -/
theorem exists_realizer {C : Finset (List ℕ)} (hC : IsNbTreeBlock C) :
    ∃ tr : RTree, tr.indepNNSeq = nbSeqOn C ∧ tr.vertices.card = C.card := by
  obtain ⟨r, Q, hnil, hdc, hCeq⟩ := treeBlock_normalize hC
  obtain ⟨tr, φ, hvert, hinj, hlen, hadj⟩ :=
    exists_tree_of_downclosed Q.card Q le_rfl hnil hdc
  have hinjApp : Set.InjOn (fun p : List ℕ => r ++ p) Q :=
    (append_left_injOn r).injOn
  have hadjApp : ∀ u ∈ Q, ∀ w ∈ Q,
      (nbAdjacent ((fun p : List ℕ => r ++ p) u) ((fun p : List ℕ => r ++ p) w)
        ↔ nbAdjacent u w) :=
    fun u _ w _ => nbAdjacent_append_left r u w
  refine ⟨tr, ?_, ?_⟩
  · calc tr.indepNNSeq = nbSeqOn tr.vertices := indepNNSeq_eq_nbSeqOn tr
      _ = nbSeqOn (Q.image φ) := by rw [hvert]
      _ = nbSeqOn Q := nbSeqOn_image hinj hadj
      _ = nbSeqOn (Q.image (fun p => r ++ p)) := (nbSeqOn_image hinjApp hadjApp).symm
      _ = nbSeqOn C := by rw [← hCeq]
  · calc tr.vertices.card = (Q.image φ).card := by rw [hvert]
      _ = Q.card := Finset.card_image_of_injOn hinj
      _ = (Q.image (fun p => r ++ p)).card :=
          (Finset.card_image_of_injOn hinjApp).symm
      _ = C.card := by rw [← hCeq]

/-! ## §5 — LAW IV′ AT GENERAL BLOCK SHAPES (the RES-12 content) -/

/-- **LAW IV′ discharged for ANY family of tree blocks, at any size** —
`f := nbSeqOn` (the same closed neutral term the T-side general pack
carries), `ord` the frozen binding. Remainder (ii) of the C2-AMD-1 scope
statement, over abstract base data. -/
theorem lawIVPrime_of_treeBlocks (s : Finset (Finset (List ℕ)))
    (ord : Finset (List ℕ) → ℕ)
    (hblocks : ∀ C ∈ s, IsNbTreeBlock C) (hord : ∀ C ∈ s, ord C = C.card) :
    LawIVPrime s nbSeqOn ord := by
  intro C hC
  obtain ⟨tr, htr, hcard⟩ := exists_realizer (hblocks C hC)
  refine ⟨tr, htr.symm, ?_⟩
  rw [hcard, hord C hC]

/-- **LAW IV′ at the definitional component extraction of ANY base value
`U`** — in particular, at the T-side general pack's data triple
`(nbComponents U, nbSeqOn, ordCard)` for every `t.ResidualAmbient v g`
(quantified here over ALL `U : Finset (List ℕ)`, so no T-world value ever
crosses into this module). -/
theorem lawIVPrime_components (U : Finset (List ℕ)) :
    LawIVPrime (nbComponents U) nbSeqOn ordCard :=
  lawIVPrime_of_treeBlocks _ _ (nbComponents_isTreeBlock U) (fun _ _ => rfl)

/-! ## §6 — σ4 concrete non-vacuity (C1-AMD-4) -/

/-- IV′ at the literal σ4 closed data triple (the same terms the T-world
σ4 pack carries). -/
theorem lawIVPrime_sigma4 : LawIVPrime sSigma4 nbSeqOn ordCard := by
  rw [← nbComponents_sigma4]
  exact lawIVPrime_components sSigma4block

/-- The σ4 realizer, concretely: a P-world tree of order 3 realizing the
closed order-3-path witness `1 + 3x + x²`. -/
theorem sigma4_realizer :
    ∃ tr : RTree, tr.indepNNSeq = threePathSeq ∧ tr.vertices.card = 3 := by
  obtain ⟨tr, htr, hcard⟩ := exists_realizer sigma4_isTreeBlock
  have h1 : a4 ∉ ({b4, c4} : Finset (List ℕ)) := by
    rw [Finset.mem_insert, Finset.mem_singleton]
    rintro (h | h)
    · exact sigma4_ne_ab h
    · exact sigma4_ne_ac h
  have h2 : b4 ∉ ({c4} : Finset (List ℕ)) := by
    rw [Finset.mem_singleton]
    exact sigma4_ne_bc
  refine ⟨tr, ?_, ?_⟩
  · rw [htr, nbSeqOn_sigma4]
  · rw [hcard, sSigma4block_eq, Finset.card_insert_of_notMem h1,
      Finset.card_insert_of_notMem h2, Finset.card_singleton]

end R16C3
