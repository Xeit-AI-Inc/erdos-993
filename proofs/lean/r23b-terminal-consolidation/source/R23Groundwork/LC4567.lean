import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.SDiff
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

set_option linter.style.header false
-- Not a Mathlib contribution file; the `linter.style.header` copyright-line
-- format check does not apply here, so it is turned off for this file only.

/-!
# C2-T3 — LC-4/5/6/7 in Lean

**C4-T1 GRAND-MERGE canonicity note (docstring-only delta).** In this
merged project: LC-4 (`lc4_retag_domain`) and LC-6 (`lc6_simple`) are
canonical HERE (LC-4 is the form `Theorems.lean` cites via
`toSimpleGraph`, replacing the deleted `local_L1`). For LC-5 and LC-7
the CANONICAL COMPLETED forms live in `LCEF.lean` (namespace
`ErdosR23C3T4`, C3-T4's sealed sweep): `lc5_dom_delete_complete` (with
the adjudicated-verbatim `hq`-free activity clause) and
`lc7_tags_of_N(_pairs)` (the retained ι := tags-of-N instantiation,
hypotheses discharged). The `lc5_*`/`lc7_*` declarations below remain
the sealed, registered C2 rows (`R23-C2-05/07/08`) under their
registered names — retained for provenance, superseded for citation by
the `ErdosR23C3T4` completions.

Charge: `CYCLE2-ALLOCATION.md`, section C2-T3.

Source claims (verbatim tier/scope, `cycles/cycle-1/C1-LEDGER.csv`):
* LC-4 = `R23-C1-RETAG-DOMAIN` (Lemma L1)
* LC-5 = `R23-C1-DELETE-DOMAIN` (Delete characterization)
* LC-6 = `R23-C1-SIMPLE` (relation simplicity)
* LC-7 = `R23-C1-COMPENSATION` (repaired compensation identity, CROSS-FAMILY
  term ONLY)

Mode convention (RUL-R23-C1-3): not applicable to this file, none of LC-4/5/6/7
mention `x(T)` or any mode-like quantity, so no convention choice arises here.

## Scope note (honesty label, matches how BRIDGE-1/2 were themselves registered)

`C1-LEDGER` registers all four claims at BROADENED scope ("every finite simple
graph", "as BRIDGE1 scope", "every governed tuple") rather than tied to a
specific RTree Lean encoding. AMENDMENT A1.1 records that the RTree-to-ordinary
tree transfer (`RTree.semanticAdequacyTarget`) is UNPROVED, and that no C2 seat
may run a formalization campaign on it (LC-12 needs Ashton's ruling). This file
therefore formalizes LC-4/5/6/7 as abstract statements about finite simple
graphs / Finsets that are faithful to the *English content* of the C1-LEDGER
rows, with every non-trivial structural hypothesis stated EXPLICITLY as a
hypothesis rather than silently assumed. Nothing here claims to discharge the
RTree premise, nothing here is `formally_verified` for O14 or any governed row:
these are small standalone Lean facts, not a correspondence proof.
-/

open Finset

namespace ErdosR23C2T3

/-!
### LC-4 (R23-C1-RETAG-DOMAIN, "Lemma L1")

C1-LEDGER text: "A independent, w in A, {w,s_w} in E(T) => s_w notin A; hence
Dom(Retag) exact and the two r19 readings extensionally identical."

Formalized for an arbitrary `SimpleGraph`, `A` an independent finite vertex
set (no two `A`-members adjacent): if `w ∈ A` and `s` is a neighbour of `w`
in `G`, then `s ∉ A`. This is exactly the fact that makes the Retag domain
question CLOSED (A1.3): a favorable leaf's support can never itself lie in
the same active independent set.
-/
theorem lc4_retag_domain {V : Type*} (G : SimpleGraph V) {A : Finset V} {w s : V}
    (hInd : ∀ x ∈ A, ∀ y ∈ A, ¬ G.Adj x y) (hw : w ∈ A) (hadj : G.Adj w s) :
    s ∉ A := fun hs => hInd w hw s hs hadj

#print axioms lc4_retag_domain

/-!
### LC-5 (R23-C1-DELETE-DOMAIN, "Delete characterization")

C1-LEDGER text: "Delete(q) fails activity iff A intersect W_v = {q};
Dom(Delete) exact."

`A` plays the role of an active set (`A ∩ W ≠ ∅`, `W` the reduced
neighbourhood `W_v`), `q ∈ A` the deleted element. Deleting `q` produces an
INACTIVE set (`(A \ {q}) ∩ W = ∅`) exactly when `A ∩ W = {q}` — i.e. `q` was
the unique witness of activity. This exactly characterises `Dom(Delete)`:
`q` may be deleted while staying active iff `A ∩ W ≠ {q}` (the contrapositive,
recorded as the corollary below).
-/
theorem lc5_delete_domain {α : Type*} [DecidableEq α] {A W : Finset α} {q : α}
    (hact : (A ∩ W).Nonempty) (hq : q ∈ A) :
    (A \ {q}) ∩ W = ∅ ↔ A ∩ W = {q} := by
  constructor
  · intro hfail
    have key : ∀ y ∈ A ∩ W, y = q := by
      intro y hyAW
      have hyA : y ∈ A := (Finset.mem_inter.mp hyAW).1
      have hyW : y ∈ W := (Finset.mem_inter.mp hyAW).2
      by_contra hyq
      have hyDel : y ∈ A \ ({q} : Finset α) := Finset.mem_sdiff.mpr ⟨hyA, by simpa using hyq⟩
      have hymem : y ∈ (A \ ({q} : Finset α)) ∩ W := Finset.mem_inter.mpr ⟨hyDel, hyW⟩
      rw [hfail] at hymem
      exact absurd hymem (Finset.notMem_empty y)
    obtain ⟨x, hxAW⟩ := hact
    have hxq : x = q := key x hxAW
    subst hxq
    exact Finset.eq_singleton_iff_unique_mem.mpr ⟨hxAW, key⟩
  · intro heq
    apply Finset.eq_empty_iff_forall_notMem.mpr
    intro y hy
    have hyDel : y ∈ A \ ({q} : Finset α) := (Finset.mem_inter.mp hy).1
    have hyW : y ∈ W := (Finset.mem_inter.mp hy).2
    have hyA : y ∈ A := (Finset.mem_sdiff.mp hyDel).1
    have hyneq : y ≠ q := (Finset.mem_sdiff.mp hyDel).2 ∘ (by simp [·])
    have hyAW : y ∈ A ∩ W := Finset.mem_inter.mpr ⟨hyA, hyW⟩
    rw [heq] at hyAW
    exact hyneq (Finset.mem_singleton.mp hyAW)

#print axioms lc5_delete_domain

/-- Corollary: `Dom(Delete)` exactly, contrapositive form — `q` stays active
after deletion iff `A ∩ W ≠ {q}`. -/
theorem lc5_delete_domain_exact {α : Type*} [DecidableEq α] {A W : Finset α} {q : α}
    (hact : (A ∩ W).Nonempty) (hq : q ∈ A) :
    ((A \ {q}) ∩ W).Nonempty ↔ A ∩ W ≠ {q} := by
  rw [Finset.nonempty_iff_ne_empty, not_iff_not]
  exact lc5_delete_domain hact hq

/-!
### LC-6 (R23-C1-SIMPLE, relation simplicity)

C1-LEDGER text: "(P,N,Delete union Retag) is a plain bipartite graph - no
multi-edges, every governed tuple."

Fixing a single source node `(v, A)` (tag `v`, active set `A`, with `v ∉ A` —
true by construction since `A ⊆ Ind(H_v)` and `v ∉ V(H_v)`), this packages the
three facts that together say "no multi-edges out of `(v,A)`":
  1. two Delete-labels `q ≠ q'` (both in `A`) never reach the same target;
  2. two Retag-labels `w ≠ w'` never reach the same target (immediate: the
     target's own tag is `w`, resp. `w'`);
  3. a Delete-edge and a Retag-edge out of the same source never coincide,
     since a Delete-target keeps tag `v` while every Retag-target's tag lies
     in `A`, and `v ∉ A`.
-/
theorem lc6_simple {α : Type*} [DecidableEq α] {A : Finset α} {v : α} (hv : v ∉ A) :
    (∀ q ∈ A, ∀ q' ∈ A, A \ ({q} : Finset α) = A \ {q'} → q = q') ∧
    (∀ w ∈ A, ∀ w' ∈ A,
        ((w : α), A \ ({w} : Finset α)) = (w', A \ {w'}) → w = w') ∧
    (∀ q ∈ A, ∀ w ∈ A, ((v : α), A \ ({q} : Finset α)) ≠ (w, A \ {w})) := by
  refine ⟨?_, ?_, ?_⟩
  · intro q hq q' hq' h
    by_contra hne
    have h1 : q ∈ A \ ({q'} : Finset α) := Finset.mem_sdiff.mpr ⟨hq, by simpa using hne⟩
    have h2 : q ∉ A \ ({q} : Finset α) := by simp
    rw [← h] at h1
    exact h2 h1
  · intro w _ w' _ h
    exact congrArg Prod.fst h
  · intro q hq w hw hcontra
    have hvw : v = w := congrArg Prod.fst hcontra
    exact hv (hvw ▸ hw)

#print axioms lc6_simple

/-!
### LC-7 (R23-C1-COMPENSATION, repaired identity — CROSS-FAMILY term ONLY)

C1-LEDGER text: "|Gamma(X)| = Sum|Delete-img| + Sum|Retag-img| - C(X) with
C(X) the CROSS-FAMILY collision count ... (U4 sec6 form and CRIT-6 primary
repair both REFUTED)."

Abstracted over an index set `X : Finset ι` of active sources, with
`D R : ι → Finset β` the per-source Delete- and Retag-image sets. The three
disjointness hypotheses below are exactly the structural content that keeps
`C(X)` to a purely PER-SOURCE ("for its tag") cross-family term — no
same-family cross-source term, matching the fenced-refuted forms:
  * `hDD` — distinct sources never share a Delete-target (same-family,
    cross-source disjointness for D);
  * `hRR` — distinct sources never share a Retag-target (same-family,
    cross-source disjointness for R);
  * `hDR` — a Delete-target of one source is never a Retag-target of a
    DIFFERENT source (cross-family collisions are confined to the same
    source, i.e. "for its tag").
Under these, `C(X) := ∑ x ∈ X, |D x ∩ R x|` (the per-source, cross-family
term only) makes the identity an equality; this file proves it as a general
Finset fact.

**Instantiation scope (docstring repaired C3-T2 per ADJ-T CR-T-1;
`cycles/cycle-2/C2-LEDGER.csv` rows R23-C2-07/08).** The two `lc7_*`
propositions are sound and machine-checked, and their identification with
`R23-C1-COMPENSATION` holds ONLY at `ι := the tags of N` — where
`hDD`/`hRR`/`hDR` are discharged by the targets' first coordinate and
`C(X) = Σ_v |D(v) ∩ R(v)|`. The C2-T3 docstring's stated SOURCE
instantiation (`ι := the sources of P`) and its certification as "the
REGISTERED form (registrar-verified 203/203 rows)" are REJECTED
(R23-C2-08): under the source reading `hDR` fails on 8,681/8,681 governed
rows (orders 3–8), `hDD` on 336, and the identity itself on 8,681/8,681
(smallest `hDD` witness `n=8, p=5`, `K_{1,6}`+pendant); the "203/203" was
restated to 15 non-vacuous rows of 203. Establishing `hDD`/`hRR`/`hDR` for
the actual (P,N,Delete∪Retag) construction under the tags-of-N reading is
NOT re-derived here; the cross-source/block-disjointness half remains open
(R23-C2-06; C3-T3's charge).
-/
theorem lc7_compensation_cross_family_only_add
    {ι β : Type*} [DecidableEq β]
    (X : Finset ι) (D R : ι → Finset β)
    (hDD : ∀ x ∈ X, ∀ x' ∈ X, x ≠ x' → Disjoint (D x) (D x'))
    (hRR : ∀ x ∈ X, ∀ x' ∈ X, x ≠ x' → Disjoint (R x) (R x'))
    (hDR : ∀ x ∈ X, ∀ x' ∈ X, x ≠ x' → Disjoint (D x) (R x')) :
    (X.biUnion fun x => D x ∪ R x).card + (∑ x ∈ X, (D x ∩ R x).card)
      = (∑ x ∈ X, (D x).card) + (∑ x ∈ X, (R x).card) := by
  have hblock : (X : Set ι).PairwiseDisjoint (fun x => D x ∪ R x) := by
    intro x hx x' hx' hne
    simp only [Function.onFun]
    apply Finset.disjoint_union_left.mpr
    refine ⟨Finset.disjoint_union_right.mpr ⟨hDD x hx x' hx' hne, hDR x hx x' hx' hne⟩,
      Finset.disjoint_union_right.mpr ⟨(hDR x' hx' x hx (Ne.symm hne)).symm, hRR x hx x' hx' hne⟩⟩
  have hcard : (X.biUnion fun x => D x ∪ R x).card = ∑ x ∈ X, (D x ∪ R x).card :=
    Finset.card_biUnion hblock
  rw [hcard, ← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun x _ => ?_
  exact Finset.card_union_add_card_inter (D x) (R x)

#print axioms lc7_compensation_cross_family_only_add

/-- Subtraction-form restatement of LC-7 (the literal C1-LEDGER shape
`|Γ(X)| = Σ|D| + Σ|R| − C(X)`), an immediate corollary of the addition form
above (ℕ-subtraction is safe here since the addition form supplies the exact
equation `|Γ(X)| + C(X) = Σ|D| + Σ|R|`). -/
theorem lc7_compensation_cross_family_only
    {ι β : Type*} [DecidableEq β]
    (X : Finset ι) (D R : ι → Finset β)
    (hDD : ∀ x ∈ X, ∀ x' ∈ X, x ≠ x' → Disjoint (D x) (D x'))
    (hRR : ∀ x ∈ X, ∀ x' ∈ X, x ≠ x' → Disjoint (R x) (R x'))
    (hDR : ∀ x ∈ X, ∀ x' ∈ X, x ≠ x' → Disjoint (D x) (R x')) :
    (X.biUnion fun x => D x ∪ R x).card
      = (∑ x ∈ X, (D x).card) + (∑ x ∈ X, (R x).card) - (∑ x ∈ X, (D x ∩ R x).card) := by
  have h := lc7_compensation_cross_family_only_add X D R hDD hRR hDR
  omega

#print axioms lc7_compensation_cross_family_only

end ErdosR23C2T3
