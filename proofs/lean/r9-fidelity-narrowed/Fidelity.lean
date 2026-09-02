/-
R9C3-B — Fidelity.lean  (NEW at C3; route C3-B's charge)

`OB-C10-T1-FIDELITY`, first half: the REALIZABILITY predicate and the ENCODER,
built on genuine finite rooted trees and genuine independent-set sums.

Sources of record (byte copies under source-copies/, digests verified by the
route's anchor before any comparison):
  S2 = C10-T1 Defense, cf6dfe08…69c3   S3 = C11-T1 Defense, a532d80e…1eb3

What "genuine" means here, stated so it can be checked rather than believed:
`sectorU/V/W` are the sums S2 §1 and S3 Definitions write down — `x^{|S|}
y^{e}` over independent sets — with `e^r_R(S) = |Ext_R(S) \ {r}|` (S3), NOT
opaque elements of `ℤ[x,y]`.  Equation (1) of S2 is therefore a THEOREM here
(`sectors_F`), not a definition.

Pin: Lean 4.32.2, Mathlib 905b95818eb32af7874a58b427f50c1711a5e96c.
No `sorry`, no `admit`, no `native_decide`.
-/
import Definitions
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Algebra.Polynomial.Coeff
import Mathlib.Algebra.MvPolynomial.Eval

namespace Erdos993
namespace QDecoder
namespace Fidelity

/-- A finite rooted tree, presented by its parent map.

The root is its own parent; every other vertex has strictly smaller `depth` at
its parent.  That is exactly a rooted tree: the parent map is a functional
graph whose only cycle is the root's fixed point, and `reachesRoot` below
PROVES the ascent rather than assuming it.

`depth` is a well-foundedness CERTIFICATE carried as data.  No source of record
carries one; it is declared route-added structure (PRESEAL §5, C-13).  It is
not observed by adjacency, by any sector, or by any encoded field. -/
--@@BEGIN EL-N01
structure RootedTree (V : Type) where
  root : V
  parent : V → V
  depth : V → ℕ
  parent_root : parent root = root
  parent_depth : ∀ v, v ≠ root → depth (parent v) < depth v
--@@END EL-N01

namespace RootedTree

variable {V : Type} [Fintype V] [DecidableEq V]

/-- Every vertex ascends to the root in finitely many parent steps.  This is the
treehood receipt: it is proved, not assumed. -/
theorem reachesRoot (T : RootedTree V) (v : V) : ∃ k : ℕ, T.parent^[k] v = T.root := by
  have key : ∀ n : ℕ, ∀ v : V, T.depth v ≤ n → ∃ k : ℕ, T.parent^[k] v = T.root := by
    intro n
    induction n with
    | zero =>
        intro v hv
        by_cases hr : v = T.root
        · exact ⟨0, by simpa using hr⟩
        · exact absurd (T.parent_depth v hr) (by omega)
    | succ m ih =>
        intro v hv
        by_cases hr : v = T.root
        · exact ⟨0, by simpa using hr⟩
        · have hlt := T.parent_depth v hr
          obtain ⟨k, hk⟩ := ih (T.parent v) (by omega)
          exact ⟨k + 1, by rw [Function.iterate_succ_apply]; exact hk⟩
  exact key (T.depth v) v le_rfl

/-- Adjacency: `u ~ v` when one is the other's parent and is not the root's own
fixed-point self-loop. -/
--@@BEGIN EL-D01
def adjB (T : RootedTree V) (u v : V) : Bool :=
  decide ((u ≠ T.root ∧ T.parent u = v) ∨ (v ≠ T.root ∧ T.parent v = u))
--@@END EL-D01

theorem adjB_symm (T : RootedTree V) (u v : V) : T.adjB u v = T.adjB v u := by
  simp only [adjB, decide_eq_decide]
  constructor <;> (rintro (h | h)) <;> [exact Or.inr h; exact Or.inl h;
    exact Or.inr h; exact Or.inl h]

/-- Independence of a vertex set. -/
--@@BEGIN EL-D02
def indepB (T : RootedTree V) (S : Finset V) : Bool :=
  decide (∀ u ∈ S, ∀ v ∈ S, T.adjB u v = false)
--@@END EL-D02

/-- The independent sets of `T`. -/
--@@BEGIN EL-D03
def indepSets (T : RootedTree V) : Finset (Finset V) :=
  (Finset.univ : Finset V).powerset.filter (fun S => T.indepB S = true)
--@@END EL-D03

/-- `Ext_R(S)`: the vertices extendable over `S`. -/
--@@BEGIN EL-D04
def extSet (T : RootedTree V) (S : Finset V) : Finset V :=
  Finset.univ.filter (fun v => v ∉ S ∧ ∀ u ∈ S, T.adjB v u = false)
--@@END EL-D04

/-- `ext_R(S) = |Ext_R(S)|`. -/
--@@BEGIN EL-D05
def extCount (T : RootedTree V) (S : Finset V) : ℕ := (T.extSet S).card
--@@END EL-D05

/-- `e^r_R(S) = |Ext_R(S) \ {r}|` — S3 Definitions, the grading of record. -/
--@@BEGIN EL-D06
def extCountR (T : RootedTree V) (S : Finset V) : ℕ :=
  ((T.extSet S).erase T.root).card
--@@END EL-D06

noncomputable section

/-- The `e^r`-graded monomial weight `x^{|S|} y^{e^r_R(S)}`. -/
--@@BEGIN EL-D07
def wt (T : RootedTree V) (S : Finset V) : P :=
  PX ^ S.card * PY ^ (T.extCountR S)
--@@END EL-D07

/-- `U_R` — S3; `A_R` — S2 §1: root selected. -/
--@@BEGIN EL-D08
def sectorU (T : RootedTree V) : P :=
  ∑ S ∈ T.indepSets.filter (fun S => T.root ∈ S), T.wt S
--@@END EL-D08

/-- `V_R` — S3; `B̂_R` — S2 §1: root unselected but extendable. -/
--@@BEGIN EL-D09
def sectorV (T : RootedTree V) : P :=
  ∑ S ∈ T.indepSets.filter (fun S => T.root ∉ S ∧ T.root ∈ T.extSet S), T.wt S
--@@END EL-D09

/-- `W_R` — S3; `C_R` — S2 §1: root unselected and blocked. -/
--@@BEGIN EL-D10
def sectorW (T : RootedTree V) : P :=
  ∑ S ∈ T.indepSets.filter (fun S => T.root ∉ S ∧ T.root ∉ T.extSet S), T.wt S
--@@END EL-D10

/-- `P(R,r) = (A_R, B̂_R, C_R) = (U_R, V_R, W_R)`. -/
--@@BEGIN EL-D11
def sectors (T : RootedTree V) : Sectors :=
  ⟨T.sectorU, T.sectorV, T.sectorW⟩
--@@END EL-D11

/-- `F_R = ∑_S x^{|S|} y^{ext_R(S)}`, the UNGRADED total, defined independently
of the sector split.  S2 eq. (1) is the theorem that these agree. -/
--@@BEGIN EL-D12
def FTot (T : RootedTree V) : P :=
  ∑ S ∈ T.indepSets, PX ^ S.card * PY ^ (T.extCount S)
--@@END EL-D12

end

theorem mem_extSet {T : RootedTree V} {S : Finset V} {v : V} :
    v ∈ T.extSet S ↔ (v ∉ S ∧ ∀ u ∈ S, T.adjB v u = false) := by
  simp [extSet]

theorem root_notMem_extSet_of_mem {T : RootedTree V} {S : Finset V}
    (h : T.root ∈ S) : T.root ∉ T.extSet S := by
  intro hc
  exact (mem_extSet.mp hc).1 h

theorem extCountR_eq_of_notMem {T : RootedTree V} {S : Finset V}
    (h : T.root ∉ T.extSet S) : T.extCountR S = T.extCount S := by
  unfold extCountR extCount
  rw [Finset.erase_eq_of_notMem h]

theorem extCount_eq_of_mem {T : RootedTree V} {S : Finset V}
    (h : T.root ∈ T.extSet S) : T.extCount S = T.extCountR S + 1 := by
  unfold extCountR extCount
  exact (Finset.card_erase_add_one h).symm

/-- **S2 equation (1), PROVED from the sums**: `F_R = A_R + y·B̂_R + C_R`.

The three sector classes are disjoint and exhaustive, and the `y`-exponents
differ from `ext` exactly on the middle class, which is the class that contains
the root in its extension set. -/
theorem sectors_F (T : RootedTree V) : (T.sectors).F = T.FTot := by
  classical
  have hsplit :
      T.FTot
        = (∑ S ∈ T.indepSets.filter (fun S => T.root ∈ S),
            PX ^ S.card * PY ^ (T.extCount S))
          + ∑ S ∈ T.indepSets.filter (fun S => ¬ (T.root ∈ S)),
              PX ^ S.card * PY ^ (T.extCount S) :=
    (Finset.sum_filter_add_sum_filter_not _ _ _).symm
  have hsplit2 :
      (∑ S ∈ T.indepSets.filter (fun S => ¬ (T.root ∈ S)),
          PX ^ S.card * PY ^ (T.extCount S))
        = (∑ S ∈ (T.indepSets.filter (fun S => ¬ (T.root ∈ S))).filter
              (fun S => T.root ∈ T.extSet S),
            PX ^ S.card * PY ^ (T.extCount S))
          + ∑ S ∈ (T.indepSets.filter (fun S => ¬ (T.root ∈ S))).filter
              (fun S => ¬ (T.root ∈ T.extSet S)),
              PX ^ S.card * PY ^ (T.extCount S) :=
    (Finset.sum_filter_add_sum_filter_not _ _ _).symm
  have hU : (∑ S ∈ T.indepSets.filter (fun S => T.root ∈ S),
              PX ^ S.card * PY ^ (T.extCount S)) = T.sectorU := by
    refine Finset.sum_congr rfl ?_
    intro S hS
    have hmem : T.root ∈ S := (Finset.mem_filter.mp hS).2
    have := extCountR_eq_of_notMem (root_notMem_extSet_of_mem (T := T) hmem)
    unfold wt
    rw [this]
  have hV : (∑ S ∈ (T.indepSets.filter (fun S => ¬ (T.root ∈ S))).filter
              (fun S => T.root ∈ T.extSet S),
              PX ^ S.card * PY ^ (T.extCount S)) = PY * T.sectorV := by
    unfold sectorV
    rw [Finset.mul_sum, Finset.filter_filter]
    refine Finset.sum_congr rfl ?_
    intro S hS
    have hin : T.root ∈ T.extSet S := (Finset.mem_filter.mp hS).2.2
    unfold wt
    rw [extCount_eq_of_mem hin, pow_succ]
    ring
  have hW : (∑ S ∈ (T.indepSets.filter (fun S => ¬ (T.root ∈ S))).filter
              (fun S => ¬ (T.root ∈ T.extSet S)),
              PX ^ S.card * PY ^ (T.extCount S)) = T.sectorW := by
    unfold sectorW
    rw [Finset.filter_filter]
    refine Finset.sum_congr rfl ?_
    intro S hS
    have hnin : T.root ∉ T.extSet S := (Finset.mem_filter.mp hS).2.2
    unfold wt
    rw [extCountR_eq_of_notMem hnin]
  rw [hsplit, hsplit2, hU, hV, hW]
  simp [sectors, Sectors.F]
  ring

/-! ### Leaves, the support map, and leaf deletion (S2 §2, S3 items 3, 7, 8, 9) -/

/-- The children of `v`: the non-root vertices whose parent is `v`. -/
--@@BEGIN EL-D13
def children (T : RootedTree V) (v : V) : Finset V :=
  Finset.univ.filter (fun u => u ≠ T.root ∧ T.parent u = v)
--@@END EL-D13

theorem mem_children {T : RootedTree V} {v u : V} :
    u ∈ T.children v ↔ (u ≠ T.root ∧ T.parent u = v) := by
  simp [children]

/-- Graph degree of `v`: its children, plus its own parent edge unless it is the
root. -/
--@@BEGIN EL-D14
def degree (T : RootedTree V) (v : V) : ℕ :=
  (T.children v).card + (if v = T.root then 0 else 1)
--@@END EL-D14

/-- `L(R)` as an index type: the leaves of `T`, i.e. the vertices of degree one.
The root is a leaf exactly when it has one child — S2 §2 item 3's "present
exactly when `d = 1`". -/
--@@BEGIN EL-N02
def leafIndex (T : RootedTree V) : Type := {v : V // T.degree v = 1}
--@@END EL-N02

instance instFintypeLeafIndex (T : RootedTree V) : Fintype (leafIndex T) :=
  Subtype.fintype _

instance instDecidableEqLeafIndex (T : RootedTree V) : DecidableEq (leafIndex T) :=
  Subtype.instDecidableEq

theorem children_eq_empty_of_leaf {T : RootedTree V} {v : V} (hv : v ≠ T.root)
    (h : T.degree v = 1) : T.children v = ∅ := by
  have : (T.children v).card = 0 := by
    unfold degree at h; rw [if_neg hv] at h; omega
  exact Finset.card_eq_zero.mp this

theorem children_root_card_of_leaf {T : RootedTree V} (h : T.degree T.root = 1) :
    (T.children T.root).card = 1 := by
  unfold degree at h; rw [if_pos rfl] at h; omega

/-- The chosen child of `v`, used only where `v` has exactly one. -/
--@@BEGIN EL-D15
noncomputable def someChild (T : RootedTree V) (v : V) : V :=
  if h : (T.children v).Nonempty then h.choose else v
--@@END EL-D15

theorem someChild_mem {T : RootedTree V} {v : V} (h : (T.children v).Nonempty) :
    T.someChild v ∈ T.children v := by
  unfold someChild; rw [dif_pos h]; exact h.choose_spec

/-- `s(a)`: the unique neighbour of the leaf `a` — S3 item 7.  For a non-root
leaf that is its parent; for the root as a leaf it is its unique child. -/
--@@BEGIN EL-D16
noncomputable def support (T : RootedTree V) (v : V) : V :=
  if v = T.root then T.someChild T.root else T.parent v
--@@END EL-D16

/-- The root of `R − a`: unchanged unless `a` is the root itself, in which case
it is the root's unique child. -/
--@@BEGIN EL-D17
noncomputable def newRoot (T : RootedTree V) (a : V) : V :=
  if a = T.root then T.someChild T.root else T.root
--@@END EL-D17

theorem newRoot_ne (T : RootedTree V) (a : V) (ha : T.degree a = 1) :
    T.newRoot a ≠ a := by
  unfold newRoot
  by_cases h : a = T.root
  · rw [if_pos h]
    have hne : (T.children T.root).Nonempty := by
      rw [← Finset.card_pos, children_root_card_of_leaf (h ▸ ha)]; omega
    have := (mem_children.mp (someChild_mem hne)).1
    rw [h]; exact this
  · rw [if_neg h]; exact fun hc => h hc.symm

/-- `R − a` for a LEAF `a`, as a rooted tree on `{u // u ≠ a}`.

Both cases of S2 §2 are covered by one definition: deleting a non-root leaf
keeps the root, and deleting the root when it is a leaf re-roots at its unique
child — which is what makes the stored `U_λ = F_{R−r}` of item 8 the `F` of an
honest rooted tree rather than a special case. -/
--@@BEGIN EL-D18
noncomputable def delLeaf (T : RootedTree V) (a : V) (ha : T.degree a = 1) :
    RootedTree {u : V // u ≠ a} where
  root := ⟨T.newRoot a, T.newRoot_ne a ha⟩
  parent := fun u =>
    if h : T.parent u.1 = a then ⟨T.newRoot a, T.newRoot_ne a ha⟩
    else ⟨T.parent u.1, h⟩
  depth := fun u => T.depth u.1
--@@END EL-D18
  parent_root := by
    by_cases h : a = T.root
    · have hne : (T.children T.root).Nonempty := by
        rw [← Finset.card_pos, children_root_card_of_leaf (h ▸ ha)]; omega
      have hc := mem_children.mp (someChild_mem hne)
      have : T.newRoot a = T.someChild T.root := by unfold newRoot; rw [if_pos h]
      simp only [this]
      rw [dif_pos (by rw [hc.2, h])]
    · have hnr : T.newRoot a = T.root := by unfold newRoot; rw [if_neg h]
      simp only [hnr]
      rw [dif_neg (by rw [T.parent_root]; exact fun hc => h hc.symm)]
      simp [T.parent_root, hnr]
  parent_depth := by
    intro u hu
    have hune : u.1 ≠ T.root := by
      by_cases h : a = T.root
      · rw [← h]; exact u.2
      · intro hc
        apply hu
        have hnr : T.newRoot a = T.root := by unfold newRoot; rw [if_neg h]
        refine Subtype.ext ?_
        show (u : V) = T.newRoot a
        rw [hc, hnr]
    by_cases hp : T.parent u.1 = a
    · exfalso
      by_cases h : a = T.root
      · -- u.1 is a child of the root, and the root has exactly one child
        have hne : (T.children T.root).Nonempty := by
          rw [← Finset.card_pos, children_root_card_of_leaf (h ▸ ha)]; omega
        have hcard := children_root_card_of_leaf (T := T) (h ▸ ha)
        have h1 : u.1 ∈ T.children T.root := mem_children.mpr ⟨hune, by rw [hp, h]⟩
        have h2 : T.someChild T.root ∈ T.children T.root := someChild_mem hne
        have : u.1 = T.someChild T.root :=
          Finset.card_le_one.mp (le_of_eq hcard) _ h1 _ h2
        apply hu
        refine Subtype.ext ?_
        show (u : V) = T.newRoot a
        rw [this]
        unfold newRoot; rw [if_pos h]
      · -- a is a non-root leaf, so it has no children at all
        have : u.1 ∈ T.children a := mem_children.mpr ⟨hune, hp⟩
        rw [children_eq_empty_of_leaf h ha] at this
        exact absurd this (Finset.notMem_empty _)
    · simp only [dif_neg hp]
      exact T.parent_depth u.1 hune

/-- The root-degree class `d ∈ {0, 1, 2+}` — S2 §2 item 1, S3 item 2. -/
--@@BEGIN EL-D19
def clsOf (T : RootedTree V) : RootClass :=
  if (T.children T.root).card = 0 then RootClass.deg0
  else if (T.children T.root).card = 1 then RootClass.deg1
  else RootClass.degGe2
--@@END EL-D19

/-- The optional root marker: `some(λ⁻¹(r))` exactly when the root is a leaf —
S2 §2 item 3, S3 item 4. -/
--@@BEGIN EL-D20
noncomputable def encRootMk (T : RootedTree V) : Option (leafIndex T) :=
  if h : T.degree T.root = 1 then some ⟨T.root, h⟩ else none
--@@END EL-D20

/-- The optional root-deletion polynomial `U_λ = F_{R−r}` — S2 §2 item 8,
S3 item 9. -/
--@@BEGIN EL-D21
noncomputable def encRootDel (T : RootedTree V) : Option P :=
  if h : T.degree T.root = 1 then some ((T.delLeaf T.root h).FTot) else none
--@@END EL-D21

end RootedTree

/-- A finite rooted tree with its finiteness instances bundled, so that
realizability can quantify over "a rooted finite labelled tree `(R,r)`" (S2 §2)
without carrying instance arguments through every existential. -/
--@@BEGIN EL-D23
structure FinRootedTree where
  V : Type
  fintypeV : Fintype V
  decEqV : DecidableEq V
  tree : RootedTree V
--@@END EL-D23

attribute [instance] FinRootedTree.fintypeV FinRootedTree.decEqV

namespace RootedTree

variable {V : Type} [Fintype V] [DecidableEq V]

/-- `encode_Q(R,r)` at the level of the tree's own leaf index — S2 §2's "the
class of the raw data above", before the set-sizing pack. -/
--@@BEGIN EL-D22
noncomputable def encodeGen (T : RootedTree V) : GenState (leafIndex T) where
  cls      := T.clsOf
  sec      := T.sectors
  del      := fun a => (T.delLeaf a.1 a.2).sectors
  supp     := fun a b => decide (T.support a.1 = T.support b.1)
  rootSupp := fun a => decide (T.support a.1 = T.root)
  rootMk   := T.encRootMk
  rootDel  := T.encRootDel
--@@END EL-D22

end RootedTree

/-- **The encoder** `encode_Q(R,r)`, S2 §2, as a set-sized raw state. -/
--@@BEGIN EL-N05
noncomputable def encodeQ {V : Type} [Fintype V] [DecidableEq V]
    (T : RootedTree V) : RawState :=
  pack T.encodeGen
--@@END EL-N05

/-- **Realizability**, S2 §2's clause list, one conjunct per bullet:

"A raw state is realized when there are a rooted finite labelled tree `(R,r)`
and a bijection `η : Λ → L(R)` such that: `d` is the degree class of `r`;
`ρ_Λ` maps to `r` exactly when `r ∈ L(R)`; `λ ∼ μ` exactly when the leaves have
the same support; `λ ∈ σ` exactly when the support of `η(λ)` is `r`;
`P_0 = P(R,r)`; if `η(λ) ≠ r` then `P_λ = P(R−η(λ), r)`; if `η(λ) = r` then
`U_λ = F_{R−r}`."

The deletion clause is guarded at the root marker exactly as DC-11 guards it,
because that is where S2 stores `U_λ` instead of a profile. -/
--@@BEGIN EL-N03
def Realizable (q : RawState) : Prop :=
  ∃ (R : FinRootedTree) (η : Fin q.n ≃ RootedTree.leafIndex R.tree),
      q.core.cls = R.tree.clsOf
    ∧ q.core.sec = R.tree.sectors
    ∧ (∀ a, q.core.rootMk ≠ some a →
        q.core.del a = (R.tree.delLeaf (η a).1 (η a).2).sectors)
    ∧ (∀ a b, q.core.supp a b
        = decide (R.tree.support (η a).1 = R.tree.support (η b).1))
    ∧ (∀ a, q.core.rootSupp a = decide (R.tree.support (η a).1 = R.tree.root))
    ∧ q.core.rootMk = (R.tree.encRootMk).map η.symm
    ∧ (q.core.rootMk ≠ none → q.core.rootDel = R.tree.encRootDel)
--@@END EL-N03

/-- The realized raw states — the domain S2's `Carrier(Q)` is a quotient OF, as
opposed to the whole of `RawState`, which the C2 package quotiented. -/
--@@BEGIN EL-N04
def RealizedState : Type := {q : RawState // Realizable q}
--@@END EL-N04

/-- Fresh-root attachment at the level of TREES: add a root joined to each
branch root (S2 §3, S3 "Attachment and derivations"). -/
--@@BEGIN EL-D24
noncomputable def attachTree (I : Type) [Fintype I] [DecidableEq I]
    (B : I → FinRootedTree) : RootedTree (Option (Σ i : I, (B i).V)) where
  root := none
  parent := fun x =>
    match x with
    | none => none
    | some y => if y.2 = (B y.1).tree.root then none
                else some ⟨y.1, (B y.1).tree.parent y.2⟩
  depth := fun x =>
    match x with
    | none => 0
    | some y => (B y.1).tree.depth y.2 + 1
--@@END EL-D24
  parent_root := rfl
  parent_depth := by
    rintro (_ | ⟨i, v⟩) hx
    · exact absurd rfl hx
    · by_cases h : v = (B i).tree.root
      · simp [h]
      · simp only [h, if_neg]
        exact Nat.succ_lt_succ ((B i).tree.parent_depth v h)

/-- The attached tree, bundled. -/
--@@BEGIN EL-D25
noncomputable def attachFin (I : Type) [Fintype I] [DecidableEq I]
    (B : I → FinRootedTree) : FinRootedTree :=
  ⟨Option (Σ i : I, (B i).V), inferInstance, inferInstance, attachTree I B⟩
--@@END EL-D25

/-! ### The realized carrier — S2 §2's `Carrier(Q)` (the C2A-G3 dividend) -/

/-- `equiv_Q` restricted to realized states. -/
--@@BEGIN EL-D26
instance realizedSetoid : Setoid RealizedState where
  r := fun x y => RawEquiv x.1 y.1
--@@END EL-D26
  iseqv :=
    { refl  := fun x => GenState.Equiv.refl x.1.core
      symm  := fun h => GenState.Equiv.symm h
      trans := fun h1 h2 => GenState.Equiv.trans h1 h2 }

/-- S2 §2: "Define `Carrier(Q)` as REALIZED raw states modulo `equiv_Q`." -/
--@@BEGIN EL-D27
def RealizedCarrier : Type := Quotient realizedSetoid
--@@END EL-D27

/-- The comparison map into the C2/C3 built `Carrier`, which quotients ALL raw
states. -/
--@@BEGIN EL-D28
def realizedToCarrier : RealizedCarrier → Carrier :=
  Quotient.lift (fun x : RealizedState => Quotient.mk stateSetoid x.1)
    (fun _ _ h => Quotient.sound h)
--@@END EL-D28

/-! ### Endpoint data — S2 §7's zero-extended `a_k(v)` -/

/-- `p(x,1)`: the `y := 1` specialization S2 §7 writes as `Dec_M(q)(v)(x,1)`.
This is an EVALUATION of a decoded polynomial, never a compression of a state
(PRESEAL §9). -/
--@@BEGIN EL-D29
noncomputable def specY1 (p : P) : Polynomial ℤ :=
  MvPolynomial.aeval (fun i : Fin 2 => if i = 0 then (Polynomial.X : Polynomial ℤ) else 1) p
--@@END EL-D29

/-- Coefficient extraction, ZERO-EXTENDED TO NEGATIVE RANK, ℤ-valued. -/
--@@BEGIN EL-D30
def coeffZ (p : Polynomial ℤ) (k : ℤ) : ℤ := if 0 ≤ k then p.coeff k.toNat else 0
--@@END EL-D30

namespace RootedTree

variable {V : Type} [Fintype V] [DecidableEq V]

/-- The number of independent sets of size `k`, ℤ-valued and ZERO-EXTENDED TO
NEGATIVE RANK. -/
--@@BEGIN EL-D31
def indepCountZ (T : RootedTree V) (k : ℤ) : ℤ :=
  if 0 ≤ k then ((T.indepSets.filter (fun S => S.card = k.toNat)).card : ℤ) else 0
--@@END EL-D31

/-- `a_k(v)` of S2 §7, on the tree side, with the explicit ℤ-valued
negative-rank zero extension. -/
--@@BEGIN EL-D32
def endpointA (T : RootedTree V) (k : ℤ) : ℤ :=
  T.indepCountZ (k + 1) - T.indepCountZ k
--@@END EL-D32

end RootedTree

/-! ### The one-vertex base state -/

/-- The one-vertex rooted tree, S2 §3's "correct one-vertex base state". -/
--@@BEGIN EL-D33
def oneVertex : RootedTree Unit where
  root := ()
  parent := fun _ => ()
  depth := fun _ => 0
--@@END EL-D33
  parent_root := rfl
  parent_depth := by intro v hv; exact absurd (Subsingleton.elim v ()) hv

end Fidelity
end QDecoder
end Erdos993
