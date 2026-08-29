import Mathlib

namespace Erdos993C8U1

open Finset
open scoped BigOperators

variable {V : Type*} [DecidableEq V]

/-- The occurrence side of the interface-level map `Phi_t`. -/
def occurrenceRecords
    (N : Finset (Finset V))
    (extension : Finset V -> Finset V)
    (load : Finset V -> Nat)
    (t : Nat) : Finset (Sigma fun _ : Finset V => V) :=
  N.sigma fun S => (extension S).filter fun v => t <= load (insert v S)

/-- The marked-tail side of the interface-level map `Phi_t`. -/
def markedTailRecords (X : Finset (Finset V)) :
    Finset (Sigma fun _ : Finset V => V) :=
  X.sigma fun A => A

/--
The unannotated finite-set bijection underlying `(OCC)`. The hypotheses are
exactly the two directions needed to identify tail extensions with marked
members, plus the extension-outside-set fact needed by the displayed inverse.
-/
theorem occurrenceRecords_card_eq
    (X N : Finset (Finset V))
    (extension : Finset V -> Finset V)
    (load : Finset V -> Nat)
    (t : Nat)
    (hforward : ∀ S, S ∈ N -> ∀ v, v ∈ extension S ->
      t <= load (insert v S) -> insert v S ∈ X)
    (hbackward : ∀ A, A ∈ X -> ∀ v, v ∈ A ->
      A.erase v ∈ N /\ v ∈ extension (A.erase v) /\ t <= load A)
    (houtside : ∀ S, S ∈ N -> ∀ v, v ∈ extension S -> v ∉ S) :
    (occurrenceRecords N extension load t).card =
      (markedTailRecords X).card := by
  classical
  refine Finset.card_bij'
    (fun z _ => Sigma.mk (insert z.2 z.1) z.2)
    (fun z _ => Sigma.mk (z.1.erase z.2) z.2) ?_ ?_ ?_ ?_
  · rintro z hz
    rw [occurrenceRecords, Finset.mem_sigma] at hz
    obtain ⟨S, v⟩ := z
    obtain ⟨hSN, hv⟩ := hz
    rw [Finset.mem_filter] at hv
    rw [markedTailRecords, Finset.mem_sigma]
    exact ⟨hforward S hSN v hv.1 hv.2, Finset.mem_insert_self v S⟩
  · rintro z hz
    rw [markedTailRecords, Finset.mem_sigma] at hz
    obtain ⟨A, v⟩ := z
    obtain ⟨hAX, hvA⟩ := hz
    obtain ⟨hN, hvExt, htail⟩ := hbackward A hAX v hvA
    rw [occurrenceRecords, Finset.mem_sigma]
    refine ⟨hN, Finset.mem_filter.mpr ⟨hvExt, ?_⟩⟩
    simpa [Finset.insert_erase hvA] using htail
  · rintro z hz
    rw [occurrenceRecords, Finset.mem_sigma] at hz
    obtain ⟨S, v⟩ := z
    obtain ⟨hSN, hv⟩ := hz
    rw [Finset.mem_filter] at hv
    apply Sigma.ext
    · exact Finset.erase_insert (houtside S hSN v hv.1)
    · rfl
  · rintro z hz
    rw [markedTailRecords, Finset.mem_sigma] at hz
    obtain ⟨A, v⟩ := z
    apply Sigma.ext
    · exact Finset.insert_erase hz.2
    · rfl

/-- The interface-level marked-extension double count `(OCC)`. -/
theorem occurrence_count
    (q t : Nat)
    (X N : Finset (Finset V))
    (extension : Finset V -> Finset V)
    (load : Finset V -> Nat)
    (hXcard : ∀ A, A ∈ X -> A.card = q)
    (hforward : ∀ S, S ∈ N -> ∀ v, v ∈ extension S ->
      t <= load (insert v S) -> insert v S ∈ X)
    (hbackward : ∀ A, A ∈ X -> ∀ v, v ∈ A ->
      A.erase v ∈ N /\ v ∈ extension (A.erase v) /\ t <= load A)
    (houtside : ∀ S, S ∈ N -> ∀ v, v ∈ extension S -> v ∉ S) :
    q * X.card =
      ∑ S ∈ N, ((extension S).filter fun v => t <= load (insert v S)).card := by
  classical
  have hcard := occurrenceRecords_card_eq X N extension load t hforward hbackward houtside
  rw [occurrenceRecords, markedTailRecords, Finset.card_sigma, Finset.card_sigma] at hcard
  calc
    q * X.card = ∑ A ∈ X, A.card := by
      rw [Finset.sum_congr rfl (fun A hA => hXcard A hA)]
      simp [Nat.mul_comm]
    _ = ∑ S ∈ N, ((extension S).filter fun v => t <= load (insert v S)).card :=
      hcard.symm

/--
Conditional tail contradiction. `hMult` is precisely the open `H-MULT*`
capacity inequality after substituting `(OCC)`; it is a hypothesis, not a proof.
-/
theorem tail_contradiction
    {W : Type*} [DecidableEq W]
    (q a b : Nat)
    (X Y N : Finset W)
    (m : W -> Nat)
    (hq : 0 < q)
    (hNY : N ⊆ Y)
    (hOcc : q * X.card = ∑ S ∈ N, m S)
    (hMult : a * (∑ S ∈ N, m S) <= q * b * N.card)
    (hDeficit : b * Y.card < a * X.card) : False := by
  have hscaled : q * (a * X.card) <= q * (b * N.card) := by
    calc
      q * (a * X.card) = a * (q * X.card) := by ac_rfl
      _ = a * (∑ S ∈ N, m S) := by rw [hOcc]
      _ <= q * b * N.card := hMult
      _ = q * (b * N.card) := by ac_rfl
  have hcapacity : a * X.card <= b * N.card :=
    Nat.le_of_mul_le_mul_left hscaled hq
  have hNcard : N.card <= Y.card := Finset.card_le_card hNY
  have htoY : a * X.card <= b * Y.card :=
    hcapacity.trans (Nat.mul_le_mul_left b hNcard)
  exact (Nat.not_lt_of_ge htoY) hDeficit

/--
The contracted interface theorem. The finite-set `Phi_t` hypotheses prove
`(OCC)` internally. The only capacity input is `hMult`, the open `H-MULT*`
inequality specialized to these occurrence multiplicities.
-/
theorem tail_contradiction_from_occurrence_interface
    (q t a b : Nat)
    (X Y N : Finset (Finset V))
    (extension : Finset V -> Finset V)
    (load : Finset V -> Nat)
    (hq : 0 < q)
    (hNY : N ⊆ Y)
    (hXcard : ∀ A, A ∈ X -> A.card = q)
    (hforward : ∀ S, S ∈ N -> ∀ v, v ∈ extension S ->
      t <= load (insert v S) -> insert v S ∈ X)
    (hbackward : ∀ A, A ∈ X -> ∀ v, v ∈ A ->
      A.erase v ∈ N /\ v ∈ extension (A.erase v) /\ t <= load A)
    (houtside : ∀ S, S ∈ N -> ∀ v, v ∈ extension S -> v ∉ S)
    (hMult :
      a * (∑ S ∈ N,
        ((extension S).filter fun v => t <= load (insert v S)).card)
        <= q * b * N.card)
    (hDeficit : b * Y.card < a * X.card) : False := by
  have hOcc :=
    occurrence_count q t X N extension load hXcard hforward hbackward houtside
  exact
    tail_contradiction q a b X Y N
      (fun S => ((extension S).filter fun v => t <= load (insert v S)).card)
      hq hNY hOcc hMult hDeficit

end Erdos993C8U1
