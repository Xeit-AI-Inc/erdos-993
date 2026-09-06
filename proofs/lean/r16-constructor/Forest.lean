import ExtensionProfile
import Erdos993C8U1Base
import NNSeqAdmission
import Convolution

/-!
R10C4-CA -- THE CEILING ASSEMBLY.

Elements E1, E2, E4 of the controller-issued element list
(`control/CYCLE4-ALLOCATION.md`). Element E3 (import `trs2_convolutionClosure`
at the pin, consumed from the r8 governed record) lives in `Convolution.lean`,
imported above. E5 (THE FACE) and E6 (invariance statements) are discharged
inline as doc comments on each new object and repeated in this route's
stage-3 return; nothing here asserts TREE, FOREST, TRANSFER, or
COUNTEREXAMPLE beyond the conditional this file states and proves.
-/

open Erdos993C8U1 (NNSeq TRS2 trs2_convolutionClosure delta0)
open scoped Classical
noncomputable section

/-! ## E1 -- the forest object and its `NNSeq`-valued independence sum

INVARIANCE (`C3 F-2` / interlude `F-2`): every definition below is a function
of `cs : List RTree` alone -- the ordered list of component trees -- and of
nothing else: no address convention beyond `toPieces`/`fromPieces`'s own
(itself already governed in `ExtensionProfile.lean`), no ordering of
independent sets, no auxiliary state. A forest here is exactly the list of
children `RTree.node` would attach a fresh super-root to, minus that root:
`RForest.vertices cs = (RTree.node cs).vertices.erase []`
(`RForest.vertices_eq_erase_root`, proved from FC-1's own `vertices_erase_root`,
not re-derived). -/

/-- Forest vertex addresses: FC-1's own `(i : ℕ) :: p` prefixing convention
(`fromPieces`), with no super-root vertex `[]` added. -/
def RForest.vertices (cs : List RTree) : Finset (List ℕ) :=
  fromPieces cs (fun i => (cs.get i).vertices)

theorem RForest.vertices_eq_erase_root (cs : List RTree) :
    RForest.vertices cs = (RTree.node cs).vertices.erase ([] : List ℕ) :=
  (vertices_erase_root cs).symm

/-- Independence for a forest: the same purely address-based predicate as
`RTree.IndepSet` (no tree-specific bookkeeping), restricted to the forest's
own vertex set. -/
def RForest.IndepSet (cs : List RTree) (S : Finset (List ℕ)) : Prop :=
  S ⊆ RForest.vertices cs ∧ ∀ u ∈ S, ∀ w ∈ S, ¬ addrAdjacent u w

/-- A forest's independent sets are exactly `(RTree.node cs)`'s independent
sets that avoid the super-root -- i.e. the forest is `node cs` with the
gluing root removed, nothing more and nothing less. -/
theorem RForest.indepSet_iff (cs : List RTree) (S : Finset (List ℕ)) :
    RForest.IndepSet cs S ↔ (RTree.node cs).IndepSet S ∧ [] ∉ S := by
  unfold RForest.IndepSet RTree.IndepSet
  rw [RForest.vertices_eq_erase_root]
  constructor
  · rintro ⟨hsub, hadj⟩
    refine ⟨⟨hsub.trans (Finset.erase_subset _ _), hadj⟩, ?_⟩
    intro hroot
    exact (Finset.mem_erase.mp (hsub hroot)).1 rfl
  · rintro ⟨⟨hsub, hadj⟩, hroot⟩
    refine ⟨fun v hv => Finset.mem_erase.mpr ⟨fun h => hroot (h ▸ hv), hsub hv⟩, hadj⟩

/-- The forest's family of independent vertex sets. -/
def RForest.indepFamily (cs : List RTree) : Finset (Finset (List ℕ)) :=
  (RForest.vertices cs).powerset.filter (fun S => RForest.IndepSet cs S)

/-- **E1, the deliverable.** The forest's `NNSeq`-valued independence sum,
built the same way FC-6 builds `RTree.indepNNSeq`: the sum, over every
independent vertex set of the forest, of the single-term `NNSeq` recording
that set's cardinality. -/
def RForest.indepNNSeq (cs : List RTree) : NNSeq :=
  ∑ S ∈ RForest.indepFamily cs, AddMonoidAlgebra.single (S.card : ℤ) (1 : NNRat)

/-! ## E2 -- the disjoint-union product decomposition -/

/-- General transport fact for `NNSeq`'s `AddMonoidAlgebra` multiplication:
a finite product of single-support terms is the single-support term at the
summed exponent. Pure algebra, no tree content. -/
theorem single_prod_eq_single_sum {ι : Type*} (s : Finset ι) (f : ι → ℤ) :
    (∏ i ∈ s, AddMonoidAlgebra.single (f i : ℤ) (1 : NNRat)) =
      AddMonoidAlgebra.single (∑ i ∈ s, f i) (1 : NNRat) := by
  classical
  induction s using Finset.induction with
  | empty => simp
  | @insert a s' hx ih =>
    rw [Finset.prod_insert hx, Finset.sum_insert hx, ih, AddMonoidAlgebra.single_mul_single, mul_one]

/-- **E2, the deliverable.** The forest's `indepNNSeq` is the product of its
components' `indepNNSeq`. Proved via `Finset.sum_nbij'` on FC-1's own
`toPieces`/`fromPieces` bijection (`indepSet_fromPieces_iff`,
`fromPieces_toPieces`, `toPieces_fromPieces`, `card_fromPieces`,
`toPieces_indepSet`, `fromPieces_subset`, `root_notMem_fromPieces` --
all governed, none re-derived) together with `single_prod_eq_single_sum`
above; no fact about `Ipoly`/`Apoly`/`Bpoly` (the availability/`y`
bookkeeping FC-1-2..4 needs) is used, because a forest's independence
count never needs it: components share no edges, so there is no super-root
availability state to track. -/
theorem RForest.indepNNSeq_eq_prod (cs : List RTree) :
    RForest.indepNNSeq cs = ∏ i : Fin cs.length, (cs.get i).indepNNSeq := by
  have hprod : (∏ i : Fin cs.length, (cs.get i).indepNNSeq)
      = ∑ g ∈ Fintype.piFinset (fun i : Fin cs.length =>
            (cs.get i).vertices.powerset.filter (fun S => (cs.get i).IndepSet S)),
          ∏ i : Fin cs.length, AddMonoidAlgebra.single (((g i).card : ℤ)) (1 : NNRat) := by
    have hstep : ∀ i : Fin cs.length, (cs.get i).indepNNSeq
        = ∑ S ∈ (cs.get i).vertices.powerset.filter (fun S => (cs.get i).IndepSet S),
            AddMonoidAlgebra.single (S.card : ℤ) (1 : NNRat) := fun i => rfl
    simp only [hstep]
    exact Finset.prod_univ_sum _ _
  rw [hprod]
  unfold RForest.indepNNSeq RForest.indepFamily
  apply Finset.sum_nbij' (fun S : Finset (List ℕ) => fun i : Fin cs.length => toPieces cs S i)
    (fun g : Fin cs.length → Finset (List ℕ) => fromPieces cs g)
  · intro S hS
    simp only [Finset.mem_filter, Finset.mem_powerset] at hS
    obtain ⟨hsub, hindep⟩ := hS
    rw [RForest.indepSet_iff] at hindep
    obtain ⟨hindep', hroot⟩ := hindep
    rw [Fintype.mem_piFinset]
    intro i
    simp only [Finset.mem_filter, Finset.mem_powerset]
    exact ⟨Finset.filter_subset _ _, toPieces_indepSet cs hindep'.1 hindep' i⟩
  · intro g hg
    rw [Fintype.mem_piFinset] at hg
    have hg' : ∀ i, g i ⊆ (cs.get i).vertices :=
      fun i => Finset.mem_powerset.mp (Finset.mem_filter.mp (hg i)).1
    have hgI : ∀ i, (cs.get i).IndepSet (g i) := fun i => (Finset.mem_filter.mp (hg i)).2
    have hsubset : fromPieces cs g ⊆ RForest.vertices cs := by
      rw [RForest.vertices_eq_erase_root]
      exact Finset.subset_erase.mpr ⟨fromPieces_subset cs g hg', root_notMem_fromPieces cs g⟩
    simp only [Finset.mem_filter, Finset.mem_powerset]
    refine ⟨hsubset, ?_⟩
    rw [RForest.indepSet_iff]
    exact ⟨(indepSet_fromPieces_iff cs g hg').mpr hgI, root_notMem_fromPieces cs g⟩
  · intro S hS
    simp only [Finset.mem_filter, Finset.mem_powerset] at hS
    obtain ⟨hsub, hindep⟩ := hS
    rw [RForest.indepSet_iff] at hindep
    obtain ⟨hindep', hroot⟩ := hindep
    exact fromPieces_toPieces cs S hindep'.1 hroot
  · intro g hg
    rw [Fintype.mem_piFinset] at hg
    have hg' : ∀ i, g i ⊆ (cs.get i).vertices :=
      fun i => Finset.mem_powerset.mp (Finset.mem_filter.mp (hg i)).1
    funext i
    exact toPieces_fromPieces cs g hg' i
  · intro S hS
    simp only [Finset.mem_filter, Finset.mem_powerset] at hS
    obtain ⟨hsub, hindep⟩ := hS
    rw [RForest.indepSet_iff] at hindep
    obtain ⟨hindep', hroot⟩ := hindep
    rw [single_prod_eq_single_sum, ← Nat.cast_sum]
    congr 1
    rw [← card_fromPieces cs (fun i => toPieces cs S i), fromPieces_toPieces cs S hindep'.1 hroot]

/-! ## E3 (consumed from `Convolution.lean`) + E4 -- the conditional composition -/

theorem one_eq_delta0 : (1 : NNSeq) = delta0 := AddMonoidAlgebra.one_def

theorem trs2_one : TRS2 (1 : NNSeq) := by
  rw [one_eq_delta0]; exact trs2_convolutionClosure.2.1

/-- TRS2 is closed under an arbitrary FINITE product, not only the binary
product `trs2_convolutionClosure` states -- an immediate induction on the
governed binary closure and the governed base case `TRS2 delta0`. Pure
algebra; no tree content, and hence no re-derivation of anything about
convolution closure. -/
theorem trs2_finset_prod {ι : Type*} (s : Finset ι) (f : ι → NNSeq)
    (hf : ∀ i ∈ s, TRS2 (f i)) : TRS2 (∏ i ∈ s, f i) := by
  classical
  induction s using Finset.induction with
  | empty => simpa using trs2_one
  | @insert a s' hx ih =>
    rw [Finset.prod_insert hx]
    exact trs2_convolutionClosure.2.2 (f a) (∏ i ∈ s', f i)
      (hf a (Finset.mem_insert_self a s'))
      (ih (fun i hi => hf i (Finset.mem_insert_of_mem hi)))

/-- **E4, THE DELIVERABLE (`R10C4-CA-E4`), and E5 (THE FACE) stated in its
own hypothesis.** IF every component tree's `indepNNSeq` is `TRS2`, THEN the
forest's `indepNNSeq` is `TRS2`. A CONDITIONAL theorem about CONSTRUCTED
`NNSeq` terms: it closes no headline obligation, asserts TRS2 of no
particular tree, and its hypothesis -- `∀ t : RTree, TRS2 t.indepNNSeq` --
is exactly `OB-C8-U1`'s open universal branch (per `C3-ADJ-7.3`, restated in
this route's stage-3 return). INVARIANCE: a function of `cs : List RTree`
and the hypothesis function `h` alone; nothing else. -/
theorem transfer_to_forest (cs : List RTree)
    (h : ∀ i : Fin cs.length, TRS2 ((cs.get i).indepNNSeq)) :
    TRS2 (RForest.indepNNSeq cs) := by
  rw [RForest.indepNNSeq_eq_prod]
  exact trs2_finset_prod Finset.univ (fun i : Fin cs.length => (cs.get i).indepNNSeq)
    (fun i _ => h i)

end
