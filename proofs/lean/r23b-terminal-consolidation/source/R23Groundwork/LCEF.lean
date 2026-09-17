import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.SDiff
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

set_option linter.style.header false
-- Not a Mathlib contribution file; the `linter.style.header` copyright-line
-- format check does not apply here, so it is turned off for this file only.

/-!
# C3-T4 — the small-lemma sweep (LC-E + LC-F)

**C4-T1 GRAND-MERGE note.** This file is C3-T4's sealed
`lcef/LCEF/Basic.lean` (sha256
`e8c7c9bd7617da4cdb262676aba60681066854f1fab12606fb0759557383977f`)
carried into the merged project as module `R23Groundwork.LCEF`
(namespace `ErdosR23C3T4` unchanged), with docstring-currency deltas
marked `(C4-T1)` and NO statement/proof change. Canonicity in this
merged project: the COMPLETED LC-5 package (`lc5_dom_delete_complete`
and its two named ingredient lemmas; C3-LEDGER `R23B-C3-T4-01`, `-02`) and
the LC-7 tags-of-N instantiation (`lc7_tags_of_N(_pairs)`;
`R23B-C3-T4-03`) live HERE; the C2-era registered antecedents (with the
then-unused `hq`, and the abstract hypothesis-carrying LC-7 forms) are
retained in `LC4567.lean` (namespace `ErdosR23C2T3`) as the sealed
adjudicated C2 rows. The duplicated abstract `lc7_*` bodies across the
two namespaces are the two sealed adjudicated artifacts, kept under
their registered names — disclosed, not hidden.

**Adjudication currency (C4-T1, binding — C3-LEDGER `R23B-C3-T4-04`):**
the "certification receipt" this file's sealed header cites below
(`lc7-tags-of-n-certification-receipt.json`, "103 rows / 30 non-vacuous
/ all_identities_hold: true") was REJECTED as a certification of the
tags-of-N instantiation ι (CRITICAL: the instrument re-reads the key it
filed under, so its hypothesis check is a tautology — a NULL CONTROL).
Exact surviving scope: the receipt certifies (i) inclusion–exclusion on
the constructed Delete/Retag images and (ii) BRIDGE-2 row consistency
on 103 governed rows (30 non-vacuous) — and NOTHING about the tags-of-N
grouping. What carries `R23B-C3-T4-03` is the Lean proof
(`lc7_tags_of_N`, hypotheses discharged from the tagging alone), which
replayed sorry-free byte-identically on both critic seats. The sealed
header text below is retained as history; read its certification
sentences under this note.

Charge: `control/CYCLE3-ALLOCATION.md`, section C3-T4:
LC-5 completed (downward-closure + rank decrement named and proved);
LC-7 re-landed at ι := the tags of N, with a matching docstring and a
≥15-non-vacuous-row certification receipt (in this route's evidence).

Provenance: builds on the sealed C2-T3 evidence file
`cycles/cycle-2/stage3/routes/T3/evidence/LC4567/Basic.lean` (copy-out-first;
no sealed byte edited). Carried declarations are marked; new declarations are
marked NEW (C3-T4).

Mode convention (standing duty 1): x(T) = first strict descent
(first k ≥ 0 with Δ_k(T) < 0); first global mode / last global mode are
distinct objects. No declaration in this file mentions x(T); the convention
is named because the certification receipt's governed rows use it
(p ≥ x(T)+2).

A1.1 (standing duty 6): nothing in this file is an actual-tree result line;
these are abstract Finset/SimpleGraph facts. The certification receipt's rows
are literal ordinary-tree rows and carry the RTree-transfer premise [A1.1].

THE DEAD BRANCH (standing duty 7, SEMANTIC-CONTRACT A2.2): nothing here
re-opens, tests, or hands onward the literal all-cut Hall mechanism or
Delete-only universal Hall at literal scope. LC-7 is a counting identity for
|Γ(X)|, retained live; it asserts no Hall inequality.
-/

open Finset

namespace ErdosR23C3T4

/-!
### LC-5 (R23-C2-05 → completed): the Delete-domain package

C2 adjudicated state (`cycles/cycle-2/C2-LEDGER.csv`, row R23-C2-05):
`lc5_delete_domain` retained NARROWED to "the activity characterization
(A\{q}) ∩ W = ∅ ↔ A ∩ W = {q} given (A ∩ W).Nonempty" — the registered
"Dom(Delete) exact" additionally needs downward-closure of independence and
the rank decrement, both then unformalized and unnamed; and the hypothesis
`hq : q ∈ A` was unused.

This section completes the package:
* `lc5_delete_domain` / `lc5_delete_domain_exact` — carried from sealed C2-T3
  with the unused `hq` hypothesis REMOVED (the iff needs only activity of A:
  if A ∩ W = {q} then q ∈ A automatically; if q ∉ A the deletion is the
  identity and both sides are false under `hact`). The signature now matches
  the adjudicated narrowed clause verbatim.
* `lc5_independence_downward_closed` — NEW, named: downward-closure of
  independence (any subset of an independent set is independent).
* `lc5_rank_decrement` — NEW, named: deleting a present element drops the
  cardinality by exactly one. THIS is where `q ∈ A` genuinely bears.
* `lc5_dom_delete_complete` — NEW: the completed "Dom(Delete) exact"
  statement. For A independent of rank p, active (A ∩ W ≠ ∅), and q ∈ A:
  A\{q} is independent, has rank p−1, and is active iff A ∩ W ≠ {q}. That is:
  Delete(q) lands in C_{p−1}(v) exactly when A ∩ W ≠ {q}.
-/

/-- LC-5 activity characterization (carried from sealed C2-T3, row R23-C2-05,
with the unused `hq : q ∈ A` hypothesis removed — the adjudicated narrowed
clause needs only `(A ∩ W).Nonempty`). -/
theorem lc5_delete_domain {α : Type*} [DecidableEq α] {A W : Finset α} {q : α}
    (hact : (A ∩ W).Nonempty) :
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

/-- Contrapositive form (carried, `hq` likewise removed): `q` stays active
after deletion iff `A ∩ W ≠ {q}`. -/
theorem lc5_delete_domain_exact {α : Type*} [DecidableEq α] {A W : Finset α} {q : α}
    (hact : (A ∩ W).Nonempty) :
    ((A \ {q}) ∩ W).Nonempty ↔ A ∩ W ≠ {q} := by
  rw [Finset.nonempty_iff_ne_empty, not_iff_not]
  exact lc5_delete_domain hact

#print axioms lc5_delete_domain_exact

/-- NEW (C3-T4), LC-5 completion, named lemma 1: **downward-closure of
independence** — every subset of an independent set is independent. Stated,
like the sealed `lc4_retag_domain`, for an arbitrary `SimpleGraph` with
independence spelled out elementwise. -/
theorem lc5_independence_downward_closed {V : Type*} {G : SimpleGraph V}
    {A B : Finset V} (hInd : ∀ x ∈ A, ∀ y ∈ A, ¬ G.Adj x y) (hBA : B ⊆ A) :
    ∀ x ∈ B, ∀ y ∈ B, ¬ G.Adj x y :=
  fun x hx y hy => hInd x (hBA hx) y (hBA hy)

#print axioms lc5_independence_downward_closed

/-- NEW (C3-T4), LC-5 completion, named lemma 2: **rank decrement** —
deleting a PRESENT element drops the cardinality by exactly one. This is the
place where the hypothesis `q ∈ A` (unused in the C2 activity clause)
genuinely bears. -/
theorem lc5_rank_decrement {α : Type*} [DecidableEq α] {A : Finset α} {q : α}
    (hq : q ∈ A) : (A \ {q}).card = A.card - 1 := by
  rw [Finset.card_sdiff, Finset.singleton_inter_of_mem hq, Finset.card_singleton]

#print axioms lc5_rank_decrement

/-- NEW (C3-T4): the COMPLETED "Dom(Delete) exact" statement
(R23-C1-DELETE-DOMAIN as registered, now with all three clauses named and
proved). For `A` independent of rank `p`, active for `W`, and `q ∈ A`:
`A \ {q}` is independent (downward closure), has rank `p − 1` (rank
decrement), and is active iff `A ∩ W ≠ {q}` (activity characterization).
Hence `Delete(q)` produces a member of `C_{p−1}` precisely when
`A ∩ W ≠ {q}`. -/
theorem lc5_dom_delete_complete {V : Type*} [DecidableEq V] {G : SimpleGraph V}
    {A W : Finset V} {q : V} {p : ℕ}
    (hInd : ∀ x ∈ A, ∀ y ∈ A, ¬ G.Adj x y)
    (hcard : A.card = p)
    (hact : (A ∩ W).Nonempty) (hq : q ∈ A) :
    (∀ x ∈ A \ {q}, ∀ y ∈ A \ {q}, ¬ G.Adj x y)
      ∧ (A \ {q}).card = p - 1
      ∧ (((A \ {q}) ∩ W).Nonempty ↔ A ∩ W ≠ {q}) :=
  ⟨lc5_independence_downward_closed hInd Finset.sdiff_subset,
   by rw [lc5_rank_decrement hq, hcard],
   lc5_delete_domain_exact hact⟩

#print axioms lc5_dom_delete_complete

/-!
### LC-7 (R23-C2-07 → re-landed): the compensation identity at ι := the tags of N

C2 adjudicated state (CR-T-1; C2-LEDGER rows R23-C2-07 / R23-C2-08): the two
Lean propositions `lc7_compensation_cross_family_only(_add)` are sound and
machine-checked, and the identification with R23-C1-COMPENSATION holds ONLY
at **ι := the tags of N** — the index runs over TARGET tags w, `D w` / `R w`
are the Delete- and Retag-images landing IN tag w, the three disjointness
hypotheses `hDD`/`hRR`/`hDR` are discharged by the targets' first coordinate,
and `C(X) = Σ_w |D(w) ∩ R(w)|` is the per-target-tag cross-family collision
count. The former source-indexed gloss (ι := sources of P) and its
certification "the REGISTERED form (registrar-verified 203/203 rows)" are
adjudicated-REJECTED (CR-T-1 (iii)): under the source reading hDR fails on
8,681/8,681 governed rows (orders 3–8), hDD on 336, and the identity itself
on 8,681/8,681 (smallest hDD witness n=8, p=5, K_{1,6}+pendant). Neither that
gloss nor T3's "cross-source structural debt" is cited here.

Certification for THIS re-landing: the tags-of-N instantiation
(`lc7_tags_of_N` below, hypotheses discharged) is numerically certified on
literal ordinary-tree rows [A1.1] by this route's fresh instrument —
`evidence/lc7-tags-of-n-certification-receipt.json`, deterministic, exact
integers, with ≥ 15 non-vacuous rows (non-vacuous := P ≠ ∅, the C2
adjudication's vacuity criterion, declared in the receipt). Computation is
evidence, never proof; the general identity is the theorem, the receipt
certifies the instantiation on actual rows.
-/

/-- LC-7 addition form (carried verbatim from sealed C2-T3; docstring
corrected per CR-T-1 — see the section header above). Abstract identity: for
pairwise-disjoint-by-hypothesis families `D R : ι → Finset β`,
`|Γ(X)| + Σ|D∩R| = Σ|D| + Σ|R|`. Sound at ANY instantiation whose hypotheses
are proved; the r23-registered instantiation is ι := the tags of N ONLY. -/
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

/-- LC-7 subtraction form (carried verbatim from sealed C2-T3; docstring
corrected per CR-T-1): the literal ledger shape
`|Γ(X)| = Σ|D| + Σ|R| − C(X)`, immediate from the addition form
(ℕ-subtraction safe: the addition form supplies the exact equation). -/
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

/-- NEW (C3-T4): **LC-7 at ι := the tags of N** — the adjudicated-retained
instantiation, with the disjointness hypotheses DISCHARGED. `tag : τ → ι`
reads off a target's tag (for the literal relation, targets are pairs
`(w, B) ∈ N` and `tag = Prod.fst`); `X` ranges over target tags; `D w` / `R w`
are the Delete- and Retag-images landing in tag `w`, so every element of `D w`
and `R w` has tag `w` (`hD`, `hR`). Distinct tags then never share a target —
`hDD`/`hRR`/`hDR` hold with no further structural input — and the
compensation identity holds unconditionally with
`C(X) = Σ_w |D(w) ∩ R(w)|`. -/
theorem lc7_tags_of_N {ι τ : Type*} [DecidableEq τ]
    (X : Finset ι) (tag : τ → ι) (D R : ι → Finset τ)
    (hD : ∀ w ∈ X, ∀ t ∈ D w, tag t = w)
    (hR : ∀ w ∈ X, ∀ t ∈ R w, tag t = w) :
    (X.biUnion fun w => D w ∪ R w).card + (∑ w ∈ X, (D w ∩ R w).card)
      = (∑ w ∈ X, (D w).card) + (∑ w ∈ X, (R w).card) := by
  refine lc7_compensation_cross_family_only_add X D R ?_ ?_ ?_
  · intro x hx x' hx' hne
    rw [Finset.disjoint_left]
    intro t ht ht'
    exact hne ((hD x hx t ht).symm.trans (hD x' hx' t ht'))
  · intro x hx x' hx' hne
    rw [Finset.disjoint_left]
    intro t ht ht'
    exact hne ((hR x hx t ht).symm.trans (hR x' hx' t ht'))
  · intro x hx x' hx' hne
    rw [Finset.disjoint_left]
    intro t ht ht'
    exact hne ((hD x hx t ht).symm.trans (hR x' hx' t ht'))

#print axioms lc7_tags_of_N

/-- NEW (C3-T4): the pair-typed corollary matching the literal relation,
where targets ARE tagged pairs `(w, B)` and the tag is the first coordinate
(`N = ⊔_{w∈F} {w} × C_{p−1}(w)`, SEMANTIC-CONTRACT §3). -/
theorem lc7_tags_of_N_pairs {ι σ : Type*} [DecidableEq ι] [DecidableEq σ]
    (X : Finset ι) (D R : ι → Finset (ι × σ))
    (hD : ∀ w ∈ X, ∀ t ∈ D w, t.1 = w)
    (hR : ∀ w ∈ X, ∀ t ∈ R w, t.1 = w) :
    (X.biUnion fun w => D w ∪ R w).card + (∑ w ∈ X, (D w ∩ R w).card)
      = (∑ w ∈ X, (D w).card) + (∑ w ∈ X, (R w).card) :=
  lc7_tags_of_N X Prod.fst D R hD hR

#print axioms lc7_tags_of_N_pairs

end ErdosR23C3T4
