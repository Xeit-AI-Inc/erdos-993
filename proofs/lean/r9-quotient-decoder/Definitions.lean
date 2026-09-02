/-
R9C3-A — Definitions.lean  (C3 definitional package, built against the FROZEN
control/DECODER-CONTRACT-C3.yaml, sha256 1f0664b5c761beae2190b408228ecc4b9f24295602d7e04d4885effbc169a452).

SCOPE. Definitions and PROVED supporting lemmas only. The contracted
propositions are STATED in Contracts.lean and PROVED in Proofs.lean.

THIS IS A NEW C3 FILE AGAINST THE FROZEN CONTRACT. It carries a C3 header
(C2A-G6: the C2 deliverable's C1 header is a recorded deviation of record).

WHAT IS ENACTED HERE AT C3 — the C2A-G1 election (i) guard form, FROZEN in the
contract's `delta_s1_repair` block:

  DC-11's final conjunct is `∧ (g.rootMk ≠ none → g.rootDel = h.rootDel)`.

The field is compared exactly where S2 §2 item 8 stores it and where S3
Definitions item 9 makes it `some` — that is, exactly when a root marker
exists — and is unobserved where both authorities store `none`. Under the
C2 unguarded conjunct the built relation separated states S2's `equiv_Q` does
not distinguish, on the subclass {q : rootDel ≠ none ∧ rootMk = none}
(divergence class SCOPE-NARROWING). The guard makes DELTA-S1 EMPTY ON THE
RELATION rather than merely named; `Contracts.DeltaS1Discharged` is the kernel
receipt for that and is FALSE against the C2 relation.

Carried from C2 and unchanged:
  * the deletion-profile clause is guarded at the root marker
    (`g.rootMk ≠ some a → …`), S2 §2 item 7's `λ ≠ ρ_Λ`;
  * `GenState.decodeM` carries S2 eq. (4)'s ROOT BRANCH.

C2A-G6, ENACTED: the C2 header sentence asserting that repair (a) alone makes
`Contracts.RepIndependence` FALSE is STRUCK from this nominated file. The claim
is true and both C2 critics confirmed it, but its only support is an
unregistered post-seal artifact; it is carried in CARRIED-ANNOTATION.md, which
is not a nominated source file.

PROPERTY CLAIMS ABOUT THIS FILE (machine-checked at seal by
scripts/statement_diff.py and by the build's axiom extraction):
  * this file contains no `sorry`, no `admit`, no `native_decide`;
  * every declaration below is either a definition or a lemma with a complete
    proof;
  * `RawState` inhabits `Type 0` — witnessed in-file by the anonymous
    `example : Type := RawState` below.

Registered spans are delimited by `--@@BEGIN <id>` / `--@@END <id>` markers.
The whitespace-collapse of each span is compared BYTE-EXACTLY against the
frozen contract's `expected_text` for that id. Markers cannot hide content:
every declaration head in this file is either inside a marked span or a member
of the sealed `unregistered_declarations` list in ELEMENT-MAP.json.

Pin: Lean 4.32.2, Mathlib 905b95818eb32af7874a58b427f50c1711a5e96c.
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

/-- The coefficient ring of record: `ℤ[x,y]`. -/
--@@BEGIN DC-01
abbrev P : Type := MvPolynomial (Fin 2) ℤ
--@@END DC-01

/-- Root-degree class of a rooted tree, source of record C10-T1 §2 item 1 and
C11-T1 Definitions item 2. -/
--@@BEGIN DC-02
inductive RootClass where
  | deg0
  | deg1
  | degGe2
  deriving DecidableEq, Repr
--@@END DC-02

noncomputable section

/-- The indeterminate `x`. -/
--@@BEGIN DC-03
def PX : P := MvPolynomial.X 0
--@@END DC-03

/-- The indeterminate `y`.  REGISTERED WITH ITS OWN TEXT AND HASH: at C2 this
declaration was unregistered, and `MvPolynomial.X 1 → MvPolynomial.X 0`
compiled at the pin producing a byte-identical `Proofs.olean` and a
byte-identical `BUILT-STATEMENTS.txt`.  Registration is what makes that
falsification visible (contract note on DC-04). -/
--@@BEGIN DC-04
def PY : P := MvPolynomial.X 1
--@@END DC-04

/-- A root-sector triple `(U, V, W)`.  C11-T1's `U/V/W` and C10-T1's
`(A, B̂, C)` are the same triple in the same order. -/
--@@BEGIN DC-05
structure Sectors where
  U : P
  V : P
  W : P
--@@END DC-05

/-- `F = U + y·V + W` (C11-T1) `= A + y·B̂ + C` (C10-T1 eq. (1)).  The SOLE
carrier of `PY` into every decoded value. -/
--@@BEGIN DC-06
def Sectors.F (s : Sectors) : P := s.U + PY * s.V + s.W
--@@END DC-06

/-! ### The set-sized Σ-record state -/

/-- A Q-state carried over an arbitrary marker type `A`.

Fields, against the source of record (S2 §2 items 1,4,5,3,7,8; S3 Definitions
items 2,5,7,8,4,6,9):
* `cls`      root-degree class;
* `sec`      the root-sector triple of the whole rooted tree;
* `del`      the marker-indexed deletion PROFILE — a full sector triple, not a
             single polynomial (S2 item 7).  Its value AT the root marker is
             not constrained by the source of record and is not observed by
             `GenState.Equiv` or by `decodeM`;
* `supp`     the support-sharing relation on markers;
* `rootSupp` the root-support fibre `σ`;
* `rootMk`   the optional root marker;
* `rootDel`  the optional unrooted root-deletion polynomial `U_λ` (S2 item 8).

`rootDel` remains a FREE FIELD: the coupling to `cls` is enacted in DC-11's
guard, not in the type.  The type-coupling form is admissible mathematics and
is NOT this contract (`delta_s1_repair.election`).

No graph witness and no realizability proof is carried; see the declared
coverage complement in PRESEAL.md §5. -/
--@@BEGIN DC-07
structure GenState (A : Type) where
  cls      : RootClass
  sec      : Sectors
  del      : A → Sectors
  supp     : A → A → Bool
  rootSupp : A → Bool
  rootMk   : Option A
  rootDel  : Option P
--@@END DC-07

/-- The SET-SIZED Σ-record state: `Σ n : ℕ, GenState (Fin n)`, which inhabits
`Type 0`; the unrestricted `Σ A : Type, GenState A` does not. -/
--@@BEGIN DC-08
structure RawState where
  n    : ℕ
  core : GenState (Fin n)
--@@END DC-08

/-- Set-sizedness receipt.  This `example` elaborates only if
`RawState : Type 0`. -/
example : Type := RawState

/-! ### The tag-bijection pullback -/

/-- Pull a state back along a tag bijection `σ : B ≃ A`. -/
--@@BEGIN DC-09
def GenState.pullback {A B : Type} (g : GenState A) (σ : B ≃ A) : GenState B where
  cls      := g.cls
  sec      := g.sec
  del      := fun b => g.del (σ b)
  supp     := fun b b' => g.supp (σ b) (σ b')
  rootSupp := fun b => g.rootSupp (σ b)
  rootMk   := g.rootMk.map (fun a => σ.symm a)
  rootDel  := g.rootDel
--@@END DC-09

/-- The pullback on the set-sized record. -/
--@@BEGIN DC-10
def RawState.pullback (q : RawState) {m : ℕ} (σ : Fin m ≃ Fin q.n) : RawState :=
  ⟨m, q.core.pullback σ⟩
--@@END DC-10

/-! ### The transport setoid -/

/-- Two states are tag-equivalent when some marker bijection carries every field
of the first onto the corresponding field of the second.  Stated field-wise so
that no field equality is dependent on a marker-count equality.

Clause 3 is C2's REPAIR (a): S2 §2 item 7 defines `P_λ` only for `λ ≠ ρ_Λ`.

**Clause 7 IS THE DELTA-S1 REPAIR, NEW AT C3.**  `(g.rootMk ≠ none →
g.rootDel = h.rootDel)`: S2 item 8 stores `U_λ` only when `ρ_Λ = λ`, and S3
item 9 makes the field `some` exactly when `c = 1`.  Comparing it
unconditionally — the C2 form — separates two root-marker-free states that
`equiv_Q` identifies.  The guard composes: the `rootMk` clause plus
`rootMk_transfer`/`rootMk_none_transfer` give `g.rootMk ≠ none ↔ h.rootMk ≠
none`, so refl/symm/trans go through, and `decodeM`'s root branch fires only
under `g.rootMk = some a`, which entails the guard. -/
--@@BEGIN DC-11
def GenState.Equiv {A B : Type} (g : GenState A) (h : GenState B) : Prop :=
  ∃ σ : A ≃ B,
      g.cls = h.cls
    ∧ g.sec = h.sec
    ∧ (∀ a, g.rootMk ≠ some a → g.del a = h.del (σ a))
    ∧ (∀ a a', g.supp a a' = h.supp (σ a) (σ a'))
    ∧ (∀ a, g.rootSupp a = h.rootSupp (σ a))
    ∧ g.rootMk.map (fun a => σ a) = h.rootMk
    ∧ (g.rootMk ≠ none → g.rootDel = h.rootDel)
--@@END DC-11

/-- Root-marker transport: under the `rootMk` clause, a marker is the root
marker on the left exactly when its image is the root marker on the right. -/
--@@BEGIN PS-09
theorem rootMk_transfer {A B : Type} {rmA : Option A} {rmB : Option B}
    {σ : A ≃ B} (hrm : rmA.map (fun a => σ a) = rmB) (a : A) :
    rmA = some a ↔ rmB = some (σ a) := by
  subst hrm
  cases hA : rmA with
  | none => simp
  | some a' =>
      simp only [Option.map_some, Option.some.injEq]
      exact ⟨fun h => by rw [h], fun h => σ.injective h⟩
--@@END PS-09

/-- Root-marker PRESENCE transport.  This is the lemma that makes DELTA-S1's
guard compose: the guard's hypothesis is a presence condition, and presence is
carried across the `rootMk` clause in BOTH directions. -/
theorem rootMk_none_transfer {A B : Type} {rmA : Option A} {rmB : Option B}
    {σ : A ≃ B} (hrm : rmA.map (fun a => σ a) = rmB) :
    rmA = none ↔ rmB = none := by
  subst hrm
  cases rmA with
  | none => simp
  | some a => simp

--@@BEGIN PS-11
theorem GenState.Equiv.refl {A : Type} (g : GenState A) : g.Equiv g := by
  refine ⟨_root_.Equiv.refl A, rfl, rfl, fun _ _ => rfl, fun _ _ => rfl,
    fun _ => rfl, ?_, fun _ => rfl⟩
  cases g.rootMk <;> rfl
--@@END PS-11

--@@BEGIN PS-12
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
  · intro hne
    exact (hrd (fun hcon => hne ((rootMk_none_transfer hrm).1 hcon))).symm
--@@END PS-12

--@@BEGIN PS-13
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
  · intro hne
    exact (hrd hne).trans (hrd' (fun hcon => hne ((rootMk_none_transfer hrm).2 hcon)))
--@@END PS-13

/-- Tag-equivalence of set-sized states. -/
--@@BEGIN DC-12
def RawEquiv (q q' : RawState) : Prop := q.core.Equiv q'.core
--@@END DC-12

/-- The TRANSPORT SETOID on the set-sized state.  The contract registers the
RELATION FIELD only (DC-13); `iseqv` is proved, and its span is marked
separately and reported. -/
--@@BEGIN DC-13
instance stateSetoid : Setoid RawState where
  r := RawEquiv
--@@END DC-13
--@@IFIELD DC-13
  iseqv :=
    { refl  := fun q => GenState.Equiv.refl q.core
      symm  := fun h => GenState.Equiv.symm h
      trans := fun h1 h2 => GenState.Equiv.trans h1 h2 }
--@@ENDIFIELD DC-13

/-- The quotient carrier `Q = RawState / ≡_Q`.

C2A-G3, CARRIED AND STATED ON THE FACE: this `Carrier` is NOT S2's
`Carrier(Q)`.  At C2 it was FINER by DELTA-S1 and WIDER by coverage item C-1.
DC-11's guard removes the finer half.  The WIDER half — no realizability
predicate, no graph witness — survives here and closes only when C3-B lands
realizability. -/
--@@BEGIN DC-14
def Carrier : Type := Quotient stateSetoid
--@@END DC-14

/-- The pullback realises tag-equivalence. -/
--@@BEGIN PS-14
theorem pullback_equiv {A B : Type} (g : GenState A) (σ : B ≃ A) :
    (g.pullback σ).Equiv g := by
  refine ⟨σ, rfl, rfl, fun _ _ => rfl, fun _ _ => rfl, fun _ => rfl, ?_,
    fun _ => rfl⟩
  show (g.rootMk.map (fun a => σ.symm a)).map (fun b => σ b) = g.rootMk
  cases g.rootMk with
  | none => rfl
  | some a => simp
--@@END PS-14

theorem RawState.pullback_rawEquiv (q : RawState) {m : ℕ} (σ : Fin m ≃ Fin q.n) :
    RawEquiv (q.pullback σ) q :=
  pullback_equiv q.core σ

/-- Repackage a state over an arbitrary FINITE marker type as a set-sized state,
along the canonical enumeration of that marker type. -/
--@@BEGIN DC-15
def pack {A : Type} [Fintype A] (g : GenState A) : RawState :=
  ⟨Fintype.card A, g.pullback (Fintype.equivFin A).symm⟩
--@@END DC-15

/-- Packing changes nothing up to tag-equivalence. -/
--@@BEGIN PS-15
theorem pack_equiv {A : Type} [Fintype A] (g : GenState A) :
    (pack g).core.Equiv g :=
  pullback_equiv g (Fintype.equivFin A).symm
--@@END PS-15

/-! ### The dependent codomain: marker-indexed families modulo tag bijection -/

/-- A marker-indexed family of polynomials, set-sized. -/
--@@BEGIN DC-16
structure MarkedFamily where
  n   : ℕ
  fam : Fin n → P
--@@END DC-16

/-- Tag-equivalence of marked families.  This is the codomain setoid the
r8 ledger records as missing. -/
--@@BEGIN DC-17
def MarkedEquiv (f f' : MarkedFamily) : Prop :=
  ∃ σ : Fin f.n ≃ Fin f'.n, ∀ a, f.fam a = f'.fam (σ a)
--@@END DC-17

--@@BEGIN DC-18
instance markedSetoid : Setoid MarkedFamily where
  r := MarkedEquiv
--@@END DC-18
--@@IFIELD DC-18
  iseqv :=
    { refl := fun f => ⟨Equiv.refl _, fun _ => rfl⟩
      symm := fun {f f'} h => by
        obtain ⟨σ, hf⟩ := h
        exact ⟨σ.symm, fun b => by simpa using (hf (σ.symm b)).symm⟩
      trans := fun {f f' f''} h1 h2 => by
        obtain ⟨σ, hf⟩ := h1
        obtain ⟨τ, hg⟩ := h2
        exact ⟨σ.trans τ, fun a => by rw [hf a, hg (σ a)]; rfl⟩ }
--@@ENDIFIELD DC-18

/-- The quotient codomain of the decoder. -/
--@@BEGIN DC-19
def MarkedQuot : Type := Quotient markedSetoid
--@@END DC-19

/-! ### The decoder (S2 eq. (4)) -/

/-- The marked decoder, S2 eq. (4) in BOTH branches:

  `Dec_M(q)(λ) = A_λ + y·B̂_λ + C_λ`  for `λ ≠ ρ_Λ`,
  `Dec_M(q)(λ) = U_λ`                for `λ = ρ_Λ`.

The `getD 0` residue on non-realizable states is an ENUMERATED COVERAGE ITEM
(PRESEAL §5, C-2), not a fall-through; it disappears when C3-B lands
realizability. -/
--@@BEGIN DC-20
def GenState.decodeM {A : Type} [DecidableEq A] (g : GenState A) (a : A) : P :=
  if g.rootMk = some a then g.rootDel.getD 0 else (g.del a).F
--@@END DC-20

/-- The decoder is constant on `GenState.Equiv`-classes, marker by marker.
The root branch is carried by the GUARDED `rootDel` clause — the guard's
hypothesis is discharged at exactly the point the branch is taken, because
`g.rootMk = some a` entails `g.rootMk ≠ none`.  The non-root branch is carried
by the guarded deletion-profile clause. -/
--@@BEGIN PS-10
theorem decodeM_congr {A B : Type} [DecidableEq A] [DecidableEq B]
    {g : GenState A} {h : GenState B} {σ : A ≃ B}
    (hd : ∀ a, g.rootMk ≠ some a → g.del a = h.del (σ a))
    (hrm : g.rootMk.map (fun a => σ a) = h.rootMk)
    (hrd : g.rootMk ≠ none → g.rootDel = h.rootDel) (a : A) :
    g.decodeM a = h.decodeM (σ a) := by
  by_cases hh : g.rootMk = some a
  · have hne : g.rootMk ≠ none := by simp [hh]
    rw [GenState.decodeM, GenState.decodeM, if_pos hh,
      if_pos ((rootMk_transfer hrm a).1 hh), hrd hne]
  · rw [GenState.decodeM, GenState.decodeM, if_neg hh,
      if_neg (fun hcon => hh ((rootMk_transfer hrm a).2 hcon)), hd a hh]
--@@END PS-10

/-- The decoder on the set-sized state: DEPENDENT codomain `Fin q.n → P`. -/
--@@BEGIN DC-21
def RawState.decodeM (q : RawState) (a : Fin q.n) : P := q.core.decodeM a
--@@END DC-21

/-- The decoder's output packaged into the set-sized total space. -/
--@@BEGIN DC-22
def RawState.marked (q : RawState) : MarkedFamily := ⟨q.n, q.decodeM⟩
--@@END DC-22

/-! ### `Rec_I` — fresh-root attachment of a finite tagged family -/

section Attach

variable {I : Type} [Fintype I] [DecidableEq I]

/-- Inherited output markers (S3 first marker summand).  The subtype condition
is what makes DC-11's `del` guard compose through attachment. -/
--@@BEGIN DC-23
abbrev InhMk (q : I → RawState) : Type :=
  {x : Σ i : I, Fin (q i).n // (q x.1).core.rootMk ≠ some x.2}
--@@END DC-23

/-- Promoted output markers: the roots of degree-0 branches. -/
--@@BEGIN DC-24
abbrev PromMk (q : I → RawState) : Type :=
  {i : I // (q i).core.cls = RootClass.deg0}
--@@END DC-24

/-- The fresh-root output marker, present exactly when `|I| = 1`. -/
--@@BEGIN DC-25
abbrev FreshMk (I : Type) [Fintype I] : Type :=
  {_u : Unit // Fintype.card I = 1}
--@@END DC-25

/-- The output marker type of `Rec_I`. -/
--@@BEGIN DC-26
abbrev AMk (q : I → RawState) : Type := InhMk q ⊕ PromMk q ⊕ FreshMk I
--@@END DC-26

/-- The unique branch of a singleton family. -/
--@@BEGIN DC-27
def theBranch (h : Fintype.card I = 1) : I := (Fintype.equivFinOfCardEq h).symm 0
--@@END DC-27

/-- Fresh-root attachment on sector triples — S2 eq. (2). -/
--@@BEGIN DC-28
def attachSec {J : Type} [Fintype J] (s : J → Sectors) : Sectors where
  U := PX * Finset.univ.prod (fun j : J => (s j).V + (s j).W)
  V := Finset.univ.prod (fun j : J => PY * (s j).V + (s j).W)
  W := Finset.univ.prod (fun j : J => (s j).F)
         - Finset.univ.prod (fun j : J => PY * (s j).V + (s j).W)
--@@END DC-28

/-- CROSS-CHECK, proved: the `F` of S2's attached sector triple is exactly
S3's fresh-root profile `𝓕`.  The two sealed r8 defenses agree. -/
--@@BEGIN PS-16
theorem attachSec_F {J : Type} [Fintype J] (s : J → Sectors) :
    (attachSec s).F
      = PX * Finset.univ.prod (fun j : J => (s j).V + (s j).W)
        + Finset.univ.prod (fun j : J => (s j).F)
        + (PY - 1) * Finset.univ.prod (fun j : J => PY * (s j).V + (s j).W) := by
  simp only [attachSec, Sectors.F]
  ring
--@@END PS-16

/-- BOUNDARY, proved: the empty family gives the one-vertex base state
`(x, 1, 0)`, whose `F` is `x + y`. -/
--@@BEGIN PS-17
theorem attachSec_empty (s : PEmpty → Sectors) :
    (attachSec s).U = PX ∧ (attachSec s).V = 1 ∧ (attachSec s).W = 0 := by
  refine ⟨?_, ?_, ?_⟩ <;> simp [attachSec]
--@@END PS-17

/-- Reindexing invariance of `attachSec` — S2 §6's "finite products in (2) are
invariant under branch reindexing", proved. -/
--@@BEGIN PS-18
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
--@@END PS-18

/-- The output deletion profiles (S2 §5, including "omit branch `i`" for the
promoted marker).  The whole arm multiset is registered text. -/
--@@BEGIN DC-29
def attachDel (q : I → RawState) : AMk q → Sectors
  | Sum.inl x =>
      attachSec (fun j : I =>
        if j = x.1.1 then (q x.1.1).core.del x.1.2 else (q j).core.sec)
  | Sum.inr (Sum.inl y) =>
      attachSec (fun j : {j : I // j ≠ y.1} => (q j.1).core.sec)
  | Sum.inr (Sum.inr z) => (q (theBranch z.2)).core.sec
--@@END DC-29

/-- The output support relation (S2 §4 rules 1-4).

KNOWN LIMITATION OF RECORD (C2A-G4, contract note on DC-30): S2 §4's rules
constrain an EQUIVALENCE RELATION, while `supp`/`attachSupp` are `Bool`-valued
with no symmetry constraint, so arm enumeration cannot express rule 4 at all.
This route registers that as a DECLARED COVERAGE-COMPLEMENT ITEM (PRESEAL §5,
C-11), not as a match. -/
--@@BEGIN DC-30
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
--@@END DC-30

/-- The output root-support fibre: exactly the promoted markers (S2 §4). -/
--@@BEGIN DC-31
def attachRootSupp (q : I → RawState) : AMk q → Bool
  | Sum.inr (Sum.inl _) => true
  | _ => false
--@@END DC-31

/-- `Rec_I` at the level of an arbitrary output marker type.

`attach`'s OUTPUT already satisfies the S2/S3 coupling: `rootMk` and `rootDel`
are `some` on exactly the same condition (`card I = 1`).  DELTA-S1 is a defect
of the RELATION, not of the constructor, which is why the guard form costs no
mathematics. -/
--@@BEGIN DC-32
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
--@@END DC-32

/-- `Rec_I` as an endo-operation on set-sized states. -/
--@@BEGIN DC-33
def attachR (q : I → RawState) : RawState := pack (attach q)
--@@END DC-33

end Attach

end

end QDecoder
end Erdos993
