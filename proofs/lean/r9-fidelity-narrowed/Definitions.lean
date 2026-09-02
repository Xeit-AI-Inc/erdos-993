/-
R9C3-B — Definitions.lean  (the IMPORTED CLOSURE, built against the FROZEN
control/DECODER-CONTRACT-C3.yaml, elements DC-01 … DC-33)

SCOPE. This file is route C3-B's own build of the forty-element imported
closure that D-1 forces into its population: `OB-C10-T1-FIDELITY`'s statements
cannot be written without the decoder objects they quantify over, and D-1 does
not stop at a module boundary.  Definitions and PROVED supporting lemmas only;
the contracted propositions are STATED in Contracts.lean.

EVERY declaration below is built from the frozen contract's `expected_text`
field for its element.  The route did not author these statements and may not
amend them.  In particular `GenState.Equiv` (DC-11) carries the DELTA-S1 repair
in its seventh conjunct, `(g.rootMk ≠ none → g.rootDel = h.rootDel)`, and the
setoid laws below are RE-DERIVED under that guard: the C2 proofs do not
transport, because the relation is strictly coarser.

Pin: Lean 4.32.2, Mathlib 905b95818eb32af7874a58b427f50c1711a5e96c.
No `sorry`, no `admit`, no `native_decide`.
-/
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Logic.Equiv.Basic
import Mathlib.Data.Fintype.Sigma
import Mathlib.Data.Fintype.Card
import Mathlib.Data.Setoid.Basic

namespace Erdos993
namespace QDecoder

/-- DC-01.  The coefficient ring of record: `ℤ[x,y]`. -/
abbrev P : Type := MvPolynomial (Fin 2) ℤ

/-- DC-02.  Root-degree class; S2 §2 item 1 / S3 item 2. -/
inductive RootClass where
  | deg0
  | deg1
  | degGe2
  deriving DecidableEq, Repr

noncomputable section

/-- DC-03.  The indeterminate `x`. -/
def PX : P := MvPolynomial.X 0

/-- DC-04.  The indeterminate `y`.  THE MU-4 TARGET. -/
def PY : P := MvPolynomial.X 1

/-- DC-05.  A root-sector triple `(U, V, W)` = S2 §1's `(A, B̂, C)`. -/
structure Sectors where
  U : P
  V : P
  W : P

/-- DC-06.  `F = U + y·V + W`; S2 eq. (1). -/
def Sectors.F (s : Sectors) : P := s.U + PY * s.V + s.W

/-- DC-07.  A Q-state over an arbitrary marker type `A`. -/
structure GenState (A : Type) where
  cls      : RootClass
  sec      : Sectors
  del      : A → Sectors
  supp     : A → A → Bool
  rootSupp : A → Bool
  rootMk   : Option A
  rootDel  : Option P

/-- DC-08.  The set-sized Σ-record state. -/
structure RawState where
  n    : ℕ
  core : GenState (Fin n)

/-- Set-sizedness receipt: this `example` elaborates only if `RawState : Type 0`. -/
example : Type := RawState

/-- DC-09.  Pull a state back along a tag bijection. -/
def GenState.pullback {A B : Type} (g : GenState A) (σ : B ≃ A) : GenState B where
  cls      := g.cls
  sec      := g.sec
  del      := fun b => g.del (σ b)
  supp     := fun b b' => g.supp (σ b) (σ b')
  rootSupp := fun b => g.rootSupp (σ b)
  rootMk   := g.rootMk.map (fun a => σ.symm a)
  rootDel  := g.rootDel

/-- DC-10.  The pullback on the set-sized record. -/
def RawState.pullback (q : RawState) {m : ℕ} (σ : Fin m ≃ Fin q.n) : RawState :=
  ⟨m, q.core.pullback σ⟩

/-- DC-11.  Tag-equivalence.  **THE DELTA-S1 REPAIR IS IN THIS STATEMENT**:
clause 3 carries S2 §2 item 7's `λ ≠ ρ_Λ` restriction, clause 7 is the C3
root-deletion guard (S2 item 8 / S3 item 9) — the field is compared exactly
where a root marker exists and is unobserved where both authorities store
`none`. -/
def GenState.Equiv {A B : Type} (g : GenState A) (h : GenState B) : Prop :=
  ∃ σ : A ≃ B,
      g.cls = h.cls
    ∧ g.sec = h.sec
    ∧ (∀ a, g.rootMk ≠ some a → g.del a = h.del (σ a))
    ∧ (∀ a a', g.supp a a' = h.supp (σ a) (σ a'))
    ∧ (∀ a, g.rootSupp a = h.rootSupp (σ a))
    ∧ g.rootMk.map (fun a => σ a) = h.rootMk
    ∧ (g.rootMk ≠ none → g.rootDel = h.rootDel)

/-- Root-marker transport under the `rootMk` clause. -/
theorem rootMk_transfer {A B : Type} {rmA : Option A} {rmB : Option B}
    {σ : A ≃ B} (hrm : rmA.map (fun a => σ a) = rmB) (a : A) :
    rmA = some a ↔ rmB = some (σ a) := by
  subst hrm
  cases hA : rmA with
  | none => simp
  | some a' =>
      simp only [Option.map_some, Option.some.injEq]
      exact ⟨fun h => by rw [h], fun h => σ.injective h⟩

/-- Root-marker NONE-transport: the guard's hypothesis transports across the
`rootMk` clause.  This is the lemma the DELTA-S1 guard needs and the C2 package
had no occasion to state. -/
theorem rootMk_none_transfer {A B : Type} {rmA : Option A} {rmB : Option B}
    {σ : A ≃ B} (hrm : rmA.map (fun a => σ a) = rmB) :
    rmA = none ↔ rmB = none := by
  subst hrm
  cases rmA with
  | none => simp
  | some a' => simp

theorem GenState.Equiv.refl {A : Type} (g : GenState A) : g.Equiv g := by
  refine ⟨_root_.Equiv.refl A, rfl, rfl, fun _ _ => rfl, fun _ _ => rfl,
    fun _ => rfl, ?_, fun _ => rfl⟩
  cases g.rootMk <;> rfl

theorem GenState.Equiv.symm {A B : Type} {g : GenState A} {h : GenState B}
    (hgh : g.Equiv h) : h.Equiv g := by
  obtain ⟨σ, hc, hs, hd, hsu, hrs, hrm, hrd⟩ := hgh
  refine ⟨σ.symm, hc.symm, hs.symm, ?_, ?_, ?_, ?_, ?_⟩
  · intro b hb
    have hga : g.rootMk ≠ some (σ.symm b) := by
      intro hcon
      exact hb (by
        have := (rootMk_transfer hrm (σ.symm b)).1 hcon
        simpa using this)
    simpa using (hd (σ.symm b) hga).symm
  · intro b b'; simpa using (hsu (σ.symm b) (σ.symm b')).symm
  · intro b; simpa using (hrs (σ.symm b)).symm
  · rw [← hrm]; cases g.rootMk with
    | none => rfl
    | some a => simp
  · intro hb
    exact (hrd (fun hcon => hb ((rootMk_none_transfer hrm).1 hcon))).symm

theorem GenState.Equiv.trans {A B C : Type} {g : GenState A} {h : GenState B}
    {k : GenState C} (h1 : g.Equiv h) (h2 : h.Equiv k) : g.Equiv k := by
  obtain ⟨σ, hc, hs, hd, hsu, hrs, hrm, hrd⟩ := h1
  obtain ⟨τ, hc', hs', hd', hsu', hrs', hrm', hrd'⟩ := h2
  refine ⟨σ.trans τ, hc.trans hc', hs.trans hs', ?_, ?_, ?_, ?_, ?_⟩
  · intro a ha
    have hb : h.rootMk ≠ some (σ a) := fun hcon =>
      ha ((rootMk_transfer hrm a).2 hcon)
    rw [hd a ha, hd' (σ a) hb]; rfl
  · intro a a'; rw [hsu a a', hsu' (σ a) (σ a')]; rfl
  · intro a; rw [hrs a, hrs' (σ a)]; rfl
  · rw [← hrm', ← hrm]; cases g.rootMk with
    | none => rfl
    | some a => rfl
  · intro hg
    have hh : h.rootMk ≠ none := fun hcon =>
      hg ((rootMk_none_transfer hrm).2 hcon)
    exact (hrd hg).trans (hrd' hh)

/-- DC-12.  Tag-equivalence of set-sized states. -/
def RawEquiv (q q' : RawState) : Prop := q.core.Equiv q'.core

/-- DC-13.  The transport setoid. -/
instance stateSetoid : Setoid RawState where
  r := RawEquiv
  iseqv :=
    { refl  := fun q => GenState.Equiv.refl q.core
      symm  := fun h => GenState.Equiv.symm h
      trans := fun h1 h2 => GenState.Equiv.trans h1 h2 }

/-- DC-14.  The quotient carrier.  **This `Carrier` is NOT S2's `Carrier(Q)`**:
DC-11 removes the finer half, and the WIDER half — no realizability predicate —
survives until it is cut down by `Fidelity.Realizable`. -/
def Carrier : Type := Quotient stateSetoid

theorem pullback_equiv {A B : Type} (g : GenState A) (σ : B ≃ A) :
    (g.pullback σ).Equiv g := by
  refine ⟨σ, rfl, rfl, fun _ _ => rfl, fun _ _ => rfl, fun _ => rfl, ?_,
    fun _ => rfl⟩
  show (g.rootMk.map (fun a => σ.symm a)).map (fun b => σ b) = g.rootMk
  cases g.rootMk with
  | none => rfl
  | some a => simp

theorem RawState.pullback_rawEquiv (q : RawState) {m : ℕ} (σ : Fin m ≃ Fin q.n) :
    RawEquiv (q.pullback σ) q :=
  pullback_equiv q.core σ

/-- DC-15.  Repackage a state over a finite marker type as a set-sized state. -/
def pack {A : Type} [Fintype A] (g : GenState A) : RawState :=
  ⟨Fintype.card A, g.pullback (Fintype.equivFin A).symm⟩

theorem pack_equiv {A : Type} [Fintype A] (g : GenState A) :
    (pack g).core.Equiv g :=
  pullback_equiv g (Fintype.equivFin A).symm

/-- DC-16. -/
structure MarkedFamily where
  n   : ℕ
  fam : Fin n → P

/-- DC-17. -/
def MarkedEquiv (f f' : MarkedFamily) : Prop :=
  ∃ σ : Fin f.n ≃ Fin f'.n, ∀ a, f.fam a = f'.fam (σ a)

/-- DC-18. -/
instance markedSetoid : Setoid MarkedFamily where
  r := MarkedEquiv
  iseqv :=
    { refl := fun f => ⟨Equiv.refl _, fun _ => rfl⟩
      symm := fun {f f'} h => by
        obtain ⟨σ, hf⟩ := h
        exact ⟨σ.symm, fun b => by simpa using (hf (σ.symm b)).symm⟩
      trans := fun {f f' f''} h1 h2 => by
        obtain ⟨σ, hf⟩ := h1
        obtain ⟨τ, hg⟩ := h2
        exact ⟨σ.trans τ, fun a => by rw [hf a, hg (σ a)]; rfl⟩ }

/-- DC-19. -/
def MarkedQuot : Type := Quotient markedSetoid

/-- DC-20.  The marked decoder, S2 eq. (4) in both branches. -/
def GenState.decodeM {A : Type} [DecidableEq A] (g : GenState A) (a : A) : P :=
  if g.rootMk = some a then g.rootDel.getD 0 else (g.del a).F

/-- The decoder is constant on `GenState.Equiv`-classes, marker by marker.
RE-DERIVED under the DELTA-S1 guard: the root branch now consumes the guarded
`rootDel` clause, whose hypothesis is discharged by `g.rootMk = some a`. -/
theorem decodeM_congr {A B : Type} [DecidableEq A] [DecidableEq B]
    {g : GenState A} {h : GenState B} {σ : A ≃ B}
    (hd : ∀ a, g.rootMk ≠ some a → g.del a = h.del (σ a))
    (hrm : g.rootMk.map (fun a => σ a) = h.rootMk)
    (hrd : g.rootMk ≠ none → g.rootDel = h.rootDel) (a : A) :
    g.decodeM a = h.decodeM (σ a) := by
  by_cases hh : g.rootMk = some a
  · rw [GenState.decodeM, GenState.decodeM, if_pos hh,
      if_pos ((rootMk_transfer hrm a).1 hh),
      hrd (by rw [hh]; exact Option.some_ne_none _)]
  · rw [GenState.decodeM, GenState.decodeM, if_neg hh,
      if_neg (fun hcon => hh ((rootMk_transfer hrm a).2 hcon)), hd a hh]

/-- DC-21. -/
def RawState.decodeM (q : RawState) (a : Fin q.n) : P := q.core.decodeM a

/-- DC-22. -/
def RawState.marked (q : RawState) : MarkedFamily := ⟨q.n, q.decodeM⟩

section Attach

variable {I : Type} [Fintype I] [DecidableEq I]

/-- DC-23. -/
abbrev InhMk (q : I → RawState) : Type :=
  {x : Σ i : I, Fin (q i).n // (q x.1).core.rootMk ≠ some x.2}

/-- DC-24. -/
abbrev PromMk (q : I → RawState) : Type :=
  {i : I // (q i).core.cls = RootClass.deg0}

/-- DC-25. -/
abbrev FreshMk (I : Type) [Fintype I] : Type :=
  {_u : Unit // Fintype.card I = 1}

/-- DC-26. -/
abbrev AMk (q : I → RawState) : Type := InhMk q ⊕ PromMk q ⊕ FreshMk I

/-- DC-27. -/
def theBranch (h : Fintype.card I = 1) : I := (Fintype.equivFinOfCardEq h).symm 0

/-- DC-28.  Fresh-root attachment on sector triples — S2 eq. (2). -/
def attachSec {J : Type} [Fintype J] (s : J → Sectors) : Sectors where
  U := PX * Finset.univ.prod (fun j : J => (s j).V + (s j).W)
  V := Finset.univ.prod (fun j : J => PY * (s j).V + (s j).W)
  W := Finset.univ.prod (fun j : J => (s j).F)
         - Finset.univ.prod (fun j : J => PY * (s j).V + (s j).W)

theorem attachSec_F {J : Type} [Fintype J] (s : J → Sectors) :
    (attachSec s).F
      = PX * Finset.univ.prod (fun j : J => (s j).V + (s j).W)
        + Finset.univ.prod (fun j : J => (s j).F)
        + (PY - 1) * Finset.univ.prod (fun j : J => PY * (s j).V + (s j).W) := by
  simp only [attachSec, Sectors.F]
  ring

theorem attachSec_empty (s : PEmpty → Sectors) :
    (attachSec s).U = PX ∧ (attachSec s).V = 1 ∧ (attachSec s).W = 0 := by
  refine ⟨?_, ?_, ?_⟩ <;> simp [attachSec]

theorem attachSec_congr {J J' : Type} [Fintype J] [Fintype J'] (e : J ≃ J')
    (s : J → Sectors) (s' : J' → Sectors) (h : ∀ j, s j = s' (e j)) :
    attachSec s = attachSec s' := by
  have h1 : (Finset.univ.prod fun j : J => (s j).V + (s j).W)
          = (Finset.univ.prod fun j' : J' => (s' j').V + (s' j').W) :=
    Fintype.prod_equiv e _ _ (fun j => by rw [h j])
  have h2 : (Finset.univ.prod fun j : J => PY * (s j).V + (s j).W)
          = (Finset.univ.prod fun j' : J' => PY * (s' j').V + (s' j').W) :=
    Fintype.prod_equiv e _ _ (fun j => by rw [h j])
  have h3 : (Finset.univ.prod fun j : J => (s j).F)
          = (Finset.univ.prod fun j' : J' => (s' j').F) :=
    Fintype.prod_equiv e _ _ (fun j => by rw [h j])
  simp only [attachSec, h1, h2, h3]

/-- DC-29. -/
def attachDel (q : I → RawState) : AMk q → Sectors
  | Sum.inl x =>
      attachSec (fun j : I =>
        if j = x.1.1 then (q x.1.1).core.del x.1.2 else (q j).core.sec)
  | Sum.inr (Sum.inl y) =>
      attachSec (fun j : {j : I // j ≠ y.1} => (q j.1).core.sec)
  | Sum.inr (Sum.inr z) => (q (theBranch z.2)).core.sec

/-- DC-30.  THE MX-1 TARGET. -/
def attachSupp (q : I → RawState) : AMk q → AMk q → Bool
  | Sum.inl x, Sum.inl y =>
      if h : x.1.1 = y.1.1 then
        (q x.1.1).core.supp x.1.2 (Fin.cast (by rw [h]) y.1.2)
      else false
  | Sum.inl x, Sum.inr (Sum.inr _) => (q x.1.1).core.rootSupp x.1.2
  | Sum.inr (Sum.inr _), Sum.inl y => (q y.1.1).core.rootSupp y.1.2
  | Sum.inr (Sum.inl _), Sum.inr (Sum.inl _) => true
  | Sum.inr (Sum.inr _), Sum.inr (Sum.inr _) => true
  | _, _ => false

/-- DC-31. -/
def attachRootSupp (q : I → RawState) : AMk q → Bool
  | Sum.inr (Sum.inl _) => true
  | _ => false

/-- DC-32. -/
def attach (q : I → RawState) : GenState (AMk q) where
  cls :=
    if Fintype.card I = 0 then RootClass.deg0
    else if Fintype.card I = 1 then RootClass.deg1
    else RootClass.degGe2
  sec := attachSec (fun i : I => (q i).core.sec)
  del := attachDel q
  supp := attachSupp q
  rootSupp := attachRootSupp q
  rootMk :=
    if h : Fintype.card I = 1 then some (Sum.inr (Sum.inr ⟨(), h⟩)) else none
  rootDel :=
    if h : Fintype.card I = 1 then some ((q (theBranch h)).core.sec.F) else none

/-- DC-33. -/
def attachR (q : I → RawState) : RawState := pack (attach q)

end Attach

end

end QDecoder
end Erdos993
