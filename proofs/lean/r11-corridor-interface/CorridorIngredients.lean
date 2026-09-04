-- R11C1-F additional import (new; the consumed block's own imports begin
-- immediately below, byte-identical to the source of record).
import Mathlib.Algebra.Polynomial.Coeff

import Mathlib.Data.Finset.Image
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Data.Fintype.Pi
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Algebra.MvPolynomial.Eval

open scoped Classical
noncomputable section

inductive RTree : Type
  | node : List RTree → RTree

def RTree.vertices : RTree → Finset (List ℕ)
  | node cs =>
      insert ([] : List ℕ)
        (Finset.univ.biUnion (fun i : Fin cs.length => (cs.get i).vertices.image (fun p => (i : ℕ) :: p)))
termination_by t => sizeOf t
decreasing_by
  simp_wf
  have h : cs[(i:ℕ)] ∈ cs := List.getElem_mem _
  have := List.sizeOf_lt_of_mem h
  omega

theorem RTree.vertices_node (cs : List RTree) :
    (RTree.node cs).vertices =
      insert ([] : List ℕ)
        (Finset.univ.biUnion (fun i : Fin cs.length => (cs.get i).vertices.image (fun p => (i : ℕ) :: p))) := by
  simp [RTree.vertices]

theorem RTree.mem_vertices_node (cs : List RTree) (v : List ℕ) :
    v ∈ (RTree.node cs).vertices ↔
      v = [] ∨ ∃ i : Fin cs.length, ∃ p ∈ (cs.get i).vertices, v = (i : ℕ) :: p := by
  rw [RTree.vertices_node]
  simp only [Finset.mem_insert, Finset.mem_biUnion, Finset.mem_univ, true_and,
    Finset.mem_image, eq_comm (a := v)]

/-- Two vertex addresses are adjacent iff one is obtained from the other by
appending exactly one more child-index: this is the parent–child relation,
and it is the *only* edge relation a rooted tree has. It does not reference
any particular tree; a tree's own vertex Finset restricts attention to the
addresses that are genuine vertices of it. -/
def addrAdjacent (u w : List ℕ) : Prop :=
  (w ≠ [] ∧ u = w.dropLast) ∨ (u ≠ [] ∧ w = u.dropLast)

/-- A finite set of vertex-addresses is independent (in the graph-theoretic
sense) exactly when it consists of actual vertices of `t`, no two of which
are adjacent. This is the ground-truth notion: no assumption about `x`, `y`,
or any generating-function recurrence enters here. -/
def RTree.IndepSet (t : RTree) (S : Finset (List ℕ)) : Prop :=
  S ⊆ t.vertices ∧ ∀ u ∈ S, ∀ w ∈ S, ¬ addrAdjacent u w

/-- A non-member vertex `v` is *available* relative to `S` when it has no
neighbour already in `S` — the standard notion of an extendable vertex. -/
def RTree.avail (t : RTree) (S : Finset (List ℕ)) (v : List ℕ) : Prop :=
  v ∉ S ∧ ∀ w ∈ S, ¬ addrAdjacent v w

/-- The extension count: the number of available vertices of `t` other than
the root itself. -/
def RTree.availCount (t : RTree) (S : Finset (List ℕ)) : ℕ :=
  ((t.vertices.erase ([] : List ℕ)).filter (fun v => t.avail S v)).card

/-- "No child of the root is in `S`": phrased purely via addresses (depth-one
vertices), so it applies uniformly without matching on the constructor. -/
def RTree.noChildRoot (t : RTree) (S : Finset (List ℕ)) : Prop :=
  ∀ v ∈ t.vertices, v.length = 1 → v ∉ S

open MvPolynomial

/-- The monomial `x^|S| y^{availCount}` contributed by one independent set. -/
def RTree.genTerm (t : RTree) (S : Finset (List ℕ)) : MvPolynomial (Fin 2) ℤ :=
  (X (0 : Fin 2)) ^ S.card * (X (1 : Fin 2)) ^ (t.availCount S)

def RTree.Ipoly (t : RTree) : MvPolynomial (Fin 2) ℤ :=
  ∑ S ∈ t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∈ S), t.genTerm S

def RTree.Apoly (t : RTree) : MvPolynomial (Fin 2) ℤ :=
  ∑ S ∈ t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S ∧ t.noChildRoot S), t.genTerm S

def RTree.Bpoly (t : RTree) : MvPolynomial (Fin 2) ℤ :=
  ∑ S ∈ t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S ∧ ¬ t.noChildRoot S), t.genTerm S

def RTree.Fpoly (t : RTree) : MvPolynomial (Fin 2) ℤ :=
  t.Ipoly + t.Bpoly + (X (1 : Fin 2)) * t.Apoly

/-! ### Base case: the one-vertex rooted tree -/

theorem RTree.vertices_leaf : (RTree.node ([] : List RTree)).vertices = {([] : List ℕ)} := by
  rw [RTree.vertices_node]; simp

theorem RTree.availCount_leaf (S : Finset (List ℕ)) :
    (RTree.node ([] : List RTree)).availCount S = 0 := by
  unfold RTree.availCount
  rw [RTree.vertices_leaf]
  simp

theorem RTree.indep_leaf_singleton :
    (RTree.node ([] : List RTree)).IndepSet {([] : List ℕ)} := by
  refine ⟨?_, ?_⟩
  · rw [RTree.vertices_leaf]
  · intro u hu w hw h
    simp only [Finset.mem_singleton] at hu hw
    subst hu; subst hw
    unfold addrAdjacent at h
    simp at h

theorem RTree.indep_leaf_empty :
    (RTree.node ([] : List RTree)).IndepSet (∅ : Finset (List ℕ)) := by
  refine ⟨?_, ?_⟩
  · simp
  · intro u hu; simp at hu

theorem RTree.noChildRoot_leaf_empty :
    (RTree.node ([] : List RTree)).noChildRoot (∅ : Finset (List ℕ)) := by
  intro v _ _
  simp

theorem RTree.filter_I_leaf :
    (RTree.node ([] : List RTree)).vertices.powerset.filter
        (fun S => (RTree.node ([] : List RTree)).IndepSet S ∧ [] ∈ S)
      = {({[]} : Finset (List ℕ))} := by
  rw [RTree.vertices_leaf]
  ext S
  simp only [Finset.mem_filter, Finset.mem_powerset, Finset.mem_singleton]
  constructor
  · rintro ⟨hsub, -, hmem⟩
    exact Finset.eq_singleton_iff_unique_mem.mpr ⟨hmem, fun x hx => Finset.mem_singleton.mp (hsub hx)⟩
  · rintro rfl
    exact ⟨le_refl _, RTree.indep_leaf_singleton, Finset.mem_singleton_self _⟩

theorem RTree.filter_A_leaf :
    (RTree.node ([] : List RTree)).vertices.powerset.filter
        (fun S => (RTree.node ([] : List RTree)).IndepSet S ∧ [] ∉ S ∧
          (RTree.node ([] : List RTree)).noChildRoot S)
      = {(∅ : Finset (List ℕ))} := by
  rw [RTree.vertices_leaf]
  ext S
  simp only [Finset.mem_filter, Finset.mem_powerset, Finset.mem_singleton]
  constructor
  · rintro ⟨hsub, -, hnot, -⟩
    apply Finset.eq_empty_iff_forall_notMem.mpr
    intro x hx
    have hx0 : x = [] := Finset.mem_singleton.mp (hsub hx)
    subst hx0
    exact hnot hx
  · rintro rfl
    exact ⟨Finset.empty_subset _, RTree.indep_leaf_empty, by simp, RTree.noChildRoot_leaf_empty⟩

theorem RTree.filter_B_leaf :
    (RTree.node ([] : List RTree)).vertices.powerset.filter
        (fun S => (RTree.node ([] : List RTree)).IndepSet S ∧ [] ∉ S ∧
          ¬ (RTree.node ([] : List RTree)).noChildRoot S)
      = (∅ : Finset (Finset (List ℕ))) := by
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro S hS
  simp only [Finset.mem_filter, Finset.mem_powerset] at hS
  obtain ⟨-, -, -, hnc⟩ := hS
  apply hnc
  intro v hv hlen
  rw [RTree.vertices_leaf] at hv
  have hv0 : v = [] := Finset.mem_singleton.mp hv
  rw [hv0] at hlen
  simp at hlen

theorem RTree.Ipoly_leaf : (RTree.node ([] : List RTree)).Ipoly = X (0 : Fin 2) := by
  unfold RTree.Ipoly
  rw [RTree.filter_I_leaf, Finset.sum_singleton]
  unfold RTree.genTerm
  rw [RTree.availCount_leaf]
  simp

theorem RTree.Apoly_leaf : (RTree.node ([] : List RTree)).Apoly = 1 := by
  unfold RTree.Apoly
  rw [RTree.filter_A_leaf, Finset.sum_singleton]
  unfold RTree.genTerm
  rw [RTree.availCount_leaf]
  simp

theorem RTree.Bpoly_leaf : (RTree.node ([] : List RTree)).Bpoly = 0 := by
  unfold RTree.Bpoly
  rw [RTree.filter_B_leaf, Finset.sum_empty]

/-! ### The child decomposition -/

variable (cs : List RTree)

/-- The piece of `S` living under child `i`, with the leading index stripped. -/
def toPieces (S : Finset (List ℕ)) (i : Fin cs.length) : Finset (List ℕ) :=
  (cs.get i).vertices.filter (fun p => (i : ℕ) :: p ∈ S)

/-- Re-assemble a per-child family of pieces into a single set of addresses. -/
def fromPieces (g : Fin cs.length → Finset (List ℕ)) : Finset (List ℕ) :=
  Finset.univ.biUnion (fun i => (g i).image (fun p => (i : ℕ) :: p))

theorem mem_fromPieces (g : Fin cs.length → Finset (List ℕ)) (v : List ℕ) :
    v ∈ fromPieces cs g ↔ ∃ i : Fin cs.length, ∃ p ∈ g i, v = (i : ℕ) :: p := by
  unfold fromPieces
  simp only [Finset.mem_biUnion, Finset.mem_univ, true_and, Finset.mem_image, eq_comm (a := v)]

theorem cons_ne_of_ne {i j : ℕ} (h : i ≠ j) (p q : List ℕ) : i :: p ≠ j :: q := by
  intro he; exact h (List.cons.inj he).1

theorem fromPieces_subset (g : Fin cs.length → Finset (List ℕ))
    (hg : ∀ i, g i ⊆ (cs.get i).vertices) :
    fromPieces cs g ⊆ (RTree.node cs).vertices := by
  intro v hv
  rw [mem_fromPieces] at hv
  obtain ⟨i, p, hp, rfl⟩ := hv
  rw [RTree.mem_vertices_node]
  exact Or.inr ⟨i, p, hg i hp, rfl⟩

theorem root_notMem_fromPieces (g : Fin cs.length → Finset (List ℕ)) :
    ([] : List ℕ) ∉ fromPieces cs g := by
  rw [mem_fromPieces]
  rintro ⟨i, p, -, he⟩
  exact List.cons_ne_nil _ _ he.symm

theorem toPieces_fromPieces (g : Fin cs.length → Finset (List ℕ))
    (hg : ∀ i, g i ⊆ (cs.get i).vertices) (i : Fin cs.length) :
    toPieces cs (fromPieces cs g) i = g i := by
  ext p
  unfold toPieces
  simp only [Finset.mem_filter, mem_fromPieces]
  constructor
  · rintro ⟨-, j, q, hq, he⟩
    have : (i : ℕ) = (j : ℕ) ∧ p = q := List.cons.inj he
    have hij : i = j := Fin.ext this.1
    rw [hij, this.2]; exact hq
  · intro hp
    exact ⟨hg i hp, i, p, hp, rfl⟩

theorem fromPieces_toPieces (S : Finset (List ℕ)) (hS : S ⊆ (RTree.node cs).vertices)
    (hroot : ([] : List ℕ) ∉ S) :
    fromPieces cs (toPieces cs S) = S := by
  ext v
  rw [mem_fromPieces]
  unfold toPieces
  simp only [Finset.mem_filter]
  constructor
  · rintro ⟨i, p, ⟨-, hmem⟩, rfl⟩; exact hmem
  · intro hv
    have hv' := hS hv
    rw [RTree.mem_vertices_node] at hv'
    rcases hv' with h0 | ⟨i, p, hp, rfl⟩
    · exact absurd (h0 ▸ hv) hroot
    · exact ⟨i, p, ⟨hp, hv⟩, rfl⟩

theorem card_fromPieces (g : Fin cs.length → Finset (List ℕ)) :
    (fromPieces cs g).card = ∑ i : Fin cs.length, (g i).card := by
  unfold fromPieces
  rw [Finset.card_biUnion]
  · congr 1; ext i
    rw [Finset.card_image_of_injective]
    intro p q h
    exact (List.cons.inj h).2
  · intro i _ j _ hij
    apply Finset.disjoint_left.mpr
    rintro v hvi hvj
    simp only [Finset.mem_image] at hvi hvj
    obtain ⟨p, -, hp⟩ := hvi
    obtain ⟨q, -, hq⟩ := hvj
    rw [← hp] at hq
    exact cons_ne_of_ne (fun h => hij (Fin.ext h)) p q hq.symm

/-! ### Adjacency and prefixing -/

theorem addrAdjacent_cons_cons (i : ℕ) (p q : List ℕ) :
    addrAdjacent ((i : ℕ) :: p) (i :: q) ↔ addrAdjacent p q := by
  unfold addrAdjacent
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

theorem not_addrAdjacent_cons_cons_of_ne {i j : ℕ} (h : i ≠ j) (p q : List ℕ) :
    ¬ addrAdjacent (i :: p) (j :: q) := by
  unfold addrAdjacent
  rintro (⟨hne, he⟩ | ⟨hne, he⟩)
  · rcases eq_or_ne q [] with hq | hq
    · rw [hq] at he; simp at he
    · rw [List.dropLast_cons_of_ne_nil hq] at he
      exact h (List.cons.inj he).1
  · rcases eq_or_ne p [] with hp | hp
    · rw [hp] at he; simp at he
    · rw [List.dropLast_cons_of_ne_nil hp] at he
      exact h (List.cons.inj he).1.symm

/-- The child decomposition of independence: a compatible family of
per-child pieces reassembles into an independent set of `node cs` iff each
piece is independent in its own child — cross-child pairs are never
adjacent, and within a child the prefix is transparent to adjacency. -/
theorem indepSet_fromPieces_iff (g : Fin cs.length → Finset (List ℕ))
    (hg : ∀ i, g i ⊆ (cs.get i).vertices) :
    (RTree.node cs).IndepSet (fromPieces cs g) ↔ ∀ i, (cs.get i).IndepSet (g i) := by
  constructor
  · intro hI i
    refine ⟨hg i, ?_⟩
    intro u hu w hw hadj
    have hu' : (i : ℕ) :: u ∈ fromPieces cs g := (mem_fromPieces cs g _).mpr ⟨i, u, hu, rfl⟩
    have hw' : (i : ℕ) :: w ∈ fromPieces cs g := (mem_fromPieces cs g _).mpr ⟨i, w, hw, rfl⟩
    exact hI.2 _ hu' _ hw' ((addrAdjacent_cons_cons i u w).mpr hadj)
  · intro hloc
    refine ⟨fromPieces_subset cs g hg, ?_⟩
    intro u hu w hw hadj
    rw [mem_fromPieces] at hu hw
    obtain ⟨i, p, hp, rfl⟩ := hu
    obtain ⟨j, q, hq, rfl⟩ := hw
    rcases eq_or_ne i j with hij | hij
    · subst hij
      exact (hloc i).2 _ hp _ hq ((addrAdjacent_cons_cons i p q).mp hadj)
    · exact not_addrAdjacent_cons_cons_of_ne (fun h => hij (Fin.ext h)) p q hadj

/-! ### Cardinality of a filtered decomposition -/

theorem filter_fromPieces (g : Fin cs.length → Finset (List ℕ)) (P : List ℕ → Prop)
    [DecidablePred P] :
    (fromPieces cs g).filter P = fromPieces cs (fun i => (g i).filter (fun p => P ((i : ℕ) :: p))) := by
  ext v
  simp only [Finset.mem_filter, mem_fromPieces]
  constructor
  · rintro ⟨⟨i, p, hp, rfl⟩, hPv⟩; exact ⟨i, p, ⟨hp, hPv⟩, rfl⟩
  · rintro ⟨i, p, ⟨hp, hPv⟩, rfl⟩; exact ⟨⟨i, p, hp, rfl⟩, hPv⟩

theorem card_filter_fromPieces (g : Fin cs.length → Finset (List ℕ)) (P : List ℕ → Prop)
    [DecidablePred P] :
    ((fromPieces cs g).filter P).card = ∑ i : Fin cs.length, ((g i).filter (fun p => P ((i : ℕ) :: p))).card := by
  rw [filter_fromPieces]; exact card_fromPieces cs _

theorem RTree.root_mem_vertices (t : RTree) : ([] : List ℕ) ∈ t.vertices := by
  cases t with
  | node cs => rw [RTree.mem_vertices_node]; exact Or.inl rfl

theorem vertices_erase_root :
    (RTree.node cs).vertices.erase ([] : List ℕ) = fromPieces cs (fun i => (cs.get i).vertices) := by
  ext v
  rw [Finset.mem_erase, RTree.mem_vertices_node, mem_fromPieces]
  constructor
  · rintro ⟨hne, h0 | h1⟩
    · exact absurd h0 hne
    · exact h1
  · rintro h1
    refine ⟨?_, Or.inr h1⟩
    obtain ⟨i, p, -, rfl⟩ := h1
    exact List.cons_ne_nil _ _

/-- The per-vertex availability correspondence with the root excluded from
`S` (the `[] ∉ S` branches, used for `A` and `B`). -/
theorem avail_fromPieces_cons (g : Fin cs.length → Finset (List ℕ))
    (i : Fin cs.length) (p : List ℕ) :
    (RTree.node cs).avail (fromPieces cs g) ((i : ℕ) :: p) ↔ (cs.get i).avail (g i) p := by
  unfold RTree.avail
  constructor
  · rintro ⟨hnot, hadj⟩
    refine ⟨fun hp => hnot ((mem_fromPieces cs g _).mpr ⟨i, p, hp, rfl⟩), ?_⟩
    intro w hw hwadj
    exact hadj ((i : ℕ) :: w) ((mem_fromPieces cs g _).mpr ⟨i, w, hw, rfl⟩)
      ((addrAdjacent_cons_cons i p w).mpr hwadj)
  · rintro ⟨hnot, hadj⟩
    refine ⟨?_, ?_⟩
    · rw [mem_fromPieces]
      rintro ⟨j, q, hq, he⟩
      have hij : i = j := Fin.ext (List.cons.inj he).1
      subst hij
      exact hnot ((List.cons.inj he).2 ▸ hq)
    · intro w hw hwadj
      rw [mem_fromPieces] at hw
      obtain ⟨j, q, hq, rfl⟩ := hw
      rcases eq_or_ne i j with hij | hij
      · subst hij
        exact hadj q hq ((addrAdjacent_cons_cons i p q).mp hwadj)
      · exact not_addrAdjacent_cons_cons_of_ne (fun h => hij (Fin.ext h)) p q hwadj

/-- The full availability count of a tree: every available vertex,
including the root itself if it happens to be available. Only relevant as
a bookkeeping device when a subtree's root becomes a *child* of a larger
tree; `RTree.availCount` (excluding the root) is the quantity that actually
appears in the extension-profile polynomials. -/
def RTree.fullAvailCount (t : RTree) (S : Finset (List ℕ)) : ℕ :=
  (t.vertices.filter (fun v => t.avail S v)).card

theorem RTree.fullAvailCount_eq (t : RTree) (S : Finset (List ℕ)) :
    t.fullAvailCount S = t.availCount S + (if t.avail S [] then 1 else 0) := by
  unfold RTree.fullAvailCount RTree.availCount
  conv_lhs => rw [← Finset.insert_erase t.root_mem_vertices]
  rw [Finset.filter_insert]
  split_ifs with h
  · rw [Finset.card_insert_of_notMem (by simp)]
  · rfl

theorem availCount_fromPieces (g : Fin cs.length → Finset (List ℕ)) :
    (RTree.node cs).availCount (fromPieces cs g) =
      ∑ i : Fin cs.length, (cs.get i).fullAvailCount (g i) := by
  unfold RTree.availCount RTree.fullAvailCount
  rw [vertices_erase_root, card_filter_fromPieces]
  apply Finset.sum_congr rfl
  intro i _
  congr 1; ext p
  simp only [Finset.mem_filter]
  constructor
  · rintro ⟨hp, hav⟩; exact ⟨hp, (avail_fromPieces_cons cs g i p).mp hav⟩
  · rintro ⟨hp, hav⟩; exact ⟨hp, (avail_fromPieces_cons cs g i p).mpr hav⟩

/-! ### The root-included case -/

theorem addrAdjacent_singleton_nil (i : ℕ) : addrAdjacent ([i] : List ℕ) [] := by
  unfold addrAdjacent
  exact Or.inr ⟨List.cons_ne_nil _ _, rfl⟩

theorem not_addrAdjacent_cons_nil_of_ne_nil {i : ℕ} {p : List ℕ} (hp : p ≠ []) :
    ¬ addrAdjacent ((i : ℕ) :: p) [] := by
  unfold addrAdjacent
  rintro (⟨h, -⟩ | ⟨-, h⟩)
  · exact h rfl
  · rw [List.dropLast_cons_of_ne_nil hp] at h
    exact List.cons_ne_nil _ _ h.symm

theorem RTree.not_avail_singleton_of_root_mem {S : Finset (List ℕ)} (hS : ([] : List ℕ) ∈ S)
    (i : ℕ) : ¬ (RTree.node cs).avail S [i] := by
  intro h; exact h.2 [] hS (addrAdjacent_singleton_nil i)

theorem avail_insertRoot_fromPieces_cons (g : Fin cs.length → Finset (List ℕ))
    (i : Fin cs.length) (p : List ℕ) (hp : p ≠ []) :
    (RTree.node cs).avail (insert ([] : List ℕ) (fromPieces cs g)) ((i : ℕ) :: p) ↔
      (cs.get i).avail (g i) p := by
  unfold RTree.avail
  simp only [Finset.mem_insert]
  constructor
  · rintro ⟨hnot, hadj⟩
    refine ⟨fun hmem => hnot (Or.inr ((mem_fromPieces cs g _).mpr ⟨i, p, hmem, rfl⟩)), ?_⟩
    intro w hw hwadj
    exact hadj ((i : ℕ) :: w) (Or.inr ((mem_fromPieces cs g _).mpr ⟨i, w, hw, rfl⟩))
      ((addrAdjacent_cons_cons i p w).mpr hwadj)
  · rintro ⟨hnot, hadj⟩
    refine ⟨?_, ?_⟩
    · rintro (h0 | hmem)
      · exact (List.cons_ne_nil _ _ h0)
      · rw [mem_fromPieces] at hmem
        obtain ⟨j, q, hq, he⟩ := hmem
        have hij : i = j := Fin.ext (List.cons.inj he).1
        subst hij
        exact hnot ((List.cons.inj he).2 ▸ hq)
    · intro w hw hwadj
      rcases hw with h0 | hw
      · exact not_addrAdjacent_cons_nil_of_ne_nil hp (h0 ▸ hwadj)
      · rw [mem_fromPieces] at hw
        obtain ⟨j, q, hq, rfl⟩ := hw
        rcases eq_or_ne i j with hij | hij
        · subst hij; exact hadj q hq ((addrAdjacent_cons_cons i p q).mp hwadj)
        · exact not_addrAdjacent_cons_cons_of_ne (fun h => hij (Fin.ext h)) p q hwadj

theorem availCount_insertRoot_fromPieces (g : Fin cs.length → Finset (List ℕ))
    (hg : ∀ i, g i ⊆ (cs.get i).vertices) :
    (RTree.node cs).availCount (insert ([] : List ℕ) (fromPieces cs g)) =
      ∑ i : Fin cs.length, (cs.get i).availCount (g i) := by
  unfold RTree.availCount
  rw [vertices_erase_root, card_filter_fromPieces]
  apply Finset.sum_congr rfl
  intro i _
  congr 1; ext p
  simp only [Finset.mem_filter, Finset.mem_erase]
  by_cases hp : p = []
  · subst hp
    simp only [ne_eq, not_true_eq_false, false_and, iff_false, not_and]
    intro _
    exact RTree.not_avail_singleton_of_root_mem cs (Finset.mem_insert_self _ _) i
  · constructor
    · rintro ⟨hmem, hav⟩
      exact ⟨⟨hp, hmem⟩, (avail_insertRoot_fromPieces_cons cs g i p hp).mp hav⟩
    · rintro ⟨⟨-, hmem⟩, hav⟩
      exact ⟨hmem, (avail_insertRoot_fromPieces_cons cs g i p hp).mpr hav⟩

/-! ### The `genTerm` decomposition -/

theorem addrAdjacent_nil_iff (w : List ℕ) : addrAdjacent ([] : List ℕ) w ↔ w.length = 1 := by
  unfold addrAdjacent
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

theorem RTree.avail_nil_iff (t : RTree) (S : Finset (List ℕ)) (hS : S ⊆ t.vertices) :
    t.avail S [] ↔ [] ∉ S ∧ t.noChildRoot S := by
  unfold RTree.avail RTree.noChildRoot
  constructor
  · rintro ⟨hnot, hadj⟩
    exact ⟨hnot, fun v _ hlen hvS => hadj v hvS ((addrAdjacent_nil_iff v).mpr hlen)⟩
  · rintro ⟨hnot, hnc⟩
    refine ⟨hnot, fun w hw hadj => ?_⟩
    exact hnc w (hS hw) ((addrAdjacent_nil_iff w).mp hadj) hw

theorem genTerm_insertRoot_fromPieces (g : Fin cs.length → Finset (List ℕ))
    (hg : ∀ i, g i ⊆ (cs.get i).vertices) :
    (RTree.node cs).genTerm (insert ([] : List ℕ) (fromPieces cs g)) =
      MvPolynomial.X (0 : Fin 2) * ∏ i : Fin cs.length, (cs.get i).genTerm (g i) := by
  unfold RTree.genTerm
  rw [Finset.card_insert_of_notMem (root_notMem_fromPieces cs g), card_fromPieces,
    availCount_insertRoot_fromPieces cs g hg, Finset.prod_mul_distrib, Finset.prod_pow_eq_pow_sum,
    Finset.prod_pow_eq_pow_sum]
  ring

theorem genTerm_fromPieces (g : Fin cs.length → Finset (List ℕ))
    (hg : ∀ i, g i ⊆ (cs.get i).vertices) :
    (RTree.node cs).genTerm (fromPieces cs g) =
      ∏ i : Fin cs.length,
        (if (cs.get i).avail (g i) [] then MvPolynomial.X (1 : Fin 2) else 1) * (cs.get i).genTerm (g i) := by
  unfold RTree.genTerm
  rw [card_fromPieces, availCount_fromPieces]
  have hstep : ∀ i : Fin cs.length,
      (cs.get i).fullAvailCount (g i) = (cs.get i).availCount (g i) +
        (if (cs.get i).avail (g i) [] then 1 else 0) := fun i => (cs.get i).fullAvailCount_eq (g i)
  simp only [hstep, Finset.sum_add_distrib, pow_add]
  have hterm : ∀ i : Fin cs.length,
      (if (cs.get i).avail (g i) [] then (MvPolynomial.X (1 : Fin 2)) else (1 : MvPolynomial (Fin 2) ℤ)) *
          (MvPolynomial.X (0 : Fin 2) ^ (g i).card * MvPolynomial.X (1 : Fin 2) ^ (cs.get i).availCount (g i))
        = MvPolynomial.X (0 : Fin 2) ^ (g i).card *
            (MvPolynomial.X (1 : Fin 2) ^ (if (cs.get i).avail (g i) [] then 1 else 0) *
              MvPolynomial.X (1 : Fin 2) ^ (cs.get i).availCount (g i)) := by
    intro i; split_ifs <;> ring
  simp only [hterm, Finset.prod_mul_distrib, Finset.prod_pow_eq_pow_sum]
  ring

/-! ### Root-agnostic child-piece facts -/

theorem toPieces_erase_root (S : Finset (List ℕ)) (i : Fin cs.length) :
    toPieces cs (S.erase []) i = toPieces cs S i := by
  unfold toPieces
  congr 1
  ext p
  simp only [Finset.mem_erase, List.cons_ne_nil, ne_eq, not_false_eq_true, true_and]

theorem addrAdjacent_comm (u w : List ℕ) : addrAdjacent u w ↔ addrAdjacent w u := by
  unfold addrAdjacent; tauto

theorem toPieces_indepSet {S : Finset (List ℕ)} (hS : S ⊆ (RTree.node cs).vertices)
    (hindep : (RTree.node cs).IndepSet S) (i : Fin cs.length) :
    (cs.get i).IndepSet (toPieces cs S i) := by
  have heq : toPieces cs S = toPieces cs (S.erase []) := funext fun j => (toPieces_erase_root cs S j).symm
  have hindep' : (RTree.node cs).IndepSet (S.erase []) :=
    ⟨(Finset.erase_subset _ _).trans hS,
      fun u hu w hw => hindep.2 u (Finset.mem_of_mem_erase hu) w (Finset.mem_of_mem_erase hw)⟩
  have hSeq : fromPieces cs (toPieces cs (S.erase [])) = S.erase [] :=
    fromPieces_toPieces cs (S.erase []) ((Finset.erase_subset _ _).trans hS) (Finset.notMem_erase _ _)
  rw [← hSeq] at hindep'
  have hind2 := (indepSet_fromPieces_iff cs (toPieces cs (S.erase []))
    (fun j => Finset.filter_subset _ _)).mp hindep' i
  rwa [heq]

theorem toPieces_notMem_root_of_root_mem {S : Finset (List ℕ)} (hindep : (RTree.node cs).IndepSet S)
    (hroot : ([] : List ℕ) ∈ S) (i : Fin cs.length) : ([] : List ℕ) ∉ toPieces cs S i := by
  intro hmem
  have hin : ((i : ℕ) :: ([] : List ℕ)) ∈ S := (Finset.mem_filter.mp hmem).2
  exact hindep.2 [] hroot _ hin ((addrAdjacent_comm _ _).mp (addrAdjacent_singleton_nil i))

theorem toPieces_notMem_root_of_noChildRoot {S : Finset (List ℕ)} (hnc : (RTree.node cs).noChildRoot S)
    (i : Fin cs.length) : ([] : List ℕ) ∉ toPieces cs S i := by
  intro hmem
  have hin : ((i : ℕ) :: ([] : List ℕ)) ∈ S := (Finset.mem_filter.mp hmem).2
  have hv : ((i : ℕ) :: ([] : List ℕ) : List ℕ) ∈ (RTree.node cs).vertices := by
    rw [RTree.mem_vertices_node]; exact Or.inr ⟨i, [], (cs.get i).root_mem_vertices, rfl⟩
  exact hnc _ hv rfl hin

theorem RTree.Apoly_add_Bpoly (t : RTree) :
    t.Apoly + t.Bpoly = ∑ S ∈ t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S), t.genTerm S := by
  unfold RTree.Apoly RTree.Bpoly
  have e1 : t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S ∧ t.noChildRoot S)
      = (t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S)).filter (fun S => t.noChildRoot S) := by
    rw [Finset.filter_filter]; ext S; simp [and_assoc]
  have e2 : t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S ∧ ¬ t.noChildRoot S)
      = (t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S)).filter (fun S => ¬ t.noChildRoot S) := by
    rw [Finset.filter_filter]; ext S; simp [and_assoc]
  rw [e1, e2, Finset.sum_filter_add_sum_filter_not]

theorem RTree.IndepSet.mono {t : RTree} {S S' : Finset (List ℕ)} (h : t.IndepSet S) (hsub : S' ⊆ S) :
    t.IndepSet S' :=
  ⟨hsub.trans h.1, fun u hu w hw => h.2 u (hsub hu) w (hsub hw)⟩

theorem indepSet_insertRoot_fromPieces_iff (g : Fin cs.length → Finset (List ℕ))
    (hg : ∀ i, g i ⊆ (cs.get i).vertices) (hgr : ∀ i, ([] : List ℕ) ∉ g i) :
    (RTree.node cs).IndepSet (insert ([] : List ℕ) (fromPieces cs g)) ↔ ∀ i, (cs.get i).IndepSet (g i) := by
  constructor
  · intro hI i
    exact (indepSet_fromPieces_iff cs g hg).mp (hI.mono (Finset.subset_insert _ _)) i
  · intro hloc
    have hfp : (RTree.node cs).IndepSet (fromPieces cs g) := (indepSet_fromPieces_iff cs g hg).mpr hloc
    refine ⟨Finset.insert_subset (RTree.root_mem_vertices _) (fromPieces_subset cs g hg), ?_⟩
    intro u hu w hw hadj
    rcases Finset.mem_insert.mp hu with rfl | hu'
    · rcases Finset.mem_insert.mp hw with rfl | hw'
      · exact absurd hadj (by rintro (⟨h, -⟩ | ⟨h, -⟩) <;> exact h rfl)
      · rw [mem_fromPieces] at hw'
        obtain ⟨j, q, hq, rfl⟩ := hw'
        have hlen : ((j : ℕ) :: q).length = 1 := (addrAdjacent_nil_iff _).mp hadj
        have hq0 : q = [] := by simpa using hlen
        exact hgr j (hq0 ▸ hq)
    · rcases Finset.mem_insert.mp hw with rfl | hw'
      · rw [mem_fromPieces] at hu'
        obtain ⟨j, q, hq, rfl⟩ := hu'
        have hlen : ((j : ℕ) :: q).length = 1 := (addrAdjacent_nil_iff _).mp ((addrAdjacent_comm _ _).mp hadj)
        have hq0 : q = [] := by simpa using hlen
        exact hgr j (hq0 ▸ hq)
      · exact hfp.2 u hu' w hw' hadj

theorem eq_insert_root_fromPieces_toPieces {S : Finset (List ℕ)}
    (hsub : S ⊆ (RTree.node cs).vertices) (hroot : ([] : List ℕ) ∈ S) :
    S = insert ([] : List ℕ) (fromPieces cs (toPieces cs S)) := by
  have heq : toPieces cs S = toPieces cs (S.erase []) := funext fun j => (toPieces_erase_root cs S j).symm
  rw [heq, fromPieces_toPieces cs (S.erase []) ((Finset.erase_subset _ _).trans hsub) (Finset.notMem_erase _ _)]
  exact (Finset.insert_erase hroot).symm

theorem RTree.Ipoly_node (cs : List RTree) :
    (RTree.node cs).Ipoly =
      MvPolynomial.X (0 : Fin 2) * ∏ i : Fin cs.length, ((cs.get i).Apoly + (cs.get i).Bpoly) := by
  have hprod : (∏ i : Fin cs.length, ((cs.get i).Apoly + (cs.get i).Bpoly))
      = ∑ g ∈ Fintype.piFinset (fun i : Fin cs.length =>
            (cs.get i).vertices.powerset.filter (fun S => (cs.get i).IndepSet S ∧ [] ∉ S)),
          ∏ i : Fin cs.length, (cs.get i).genTerm (g i) := by
    simp only [RTree.Apoly_add_Bpoly]
    exact Finset.prod_univ_sum _ _
  rw [hprod, Finset.mul_sum]
  unfold RTree.Ipoly
  apply Finset.sum_nbij' (fun S : Finset (List ℕ) => fun i : Fin cs.length => toPieces cs S i)
    (fun g : Fin cs.length → Finset (List ℕ) => insert ([] : List ℕ) (fromPieces cs g))
  · intro S hS
    simp only [Finset.mem_filter, Finset.mem_powerset] at hS
    obtain ⟨hsub, hindep, hroot⟩ := hS
    rw [Fintype.mem_piFinset]
    intro i
    simp only [Finset.mem_filter, Finset.mem_powerset]
    exact ⟨Finset.filter_subset _ _, toPieces_indepSet cs hsub hindep i,
      toPieces_notMem_root_of_root_mem cs hindep hroot i⟩
  · intro g hg
    rw [Fintype.mem_piFinset] at hg
    have hg' : ∀ i, g i ⊆ (cs.get i).vertices := fun i => Finset.mem_powerset.mp (Finset.mem_filter.mp (hg i)).1
    have hgI : ∀ i, (cs.get i).IndepSet (g i) := fun i => (Finset.mem_filter.mp (hg i)).2.1
    have hgR : ∀ i, ([] : List ℕ) ∉ g i := fun i => (Finset.mem_filter.mp (hg i)).2.2
    simp only [Finset.mem_filter, Finset.mem_powerset]
    exact ⟨Finset.insert_subset (RTree.root_mem_vertices _) (fromPieces_subset cs g hg'),
      (indepSet_insertRoot_fromPieces_iff cs g hg' hgR).mpr hgI, Finset.mem_insert_self _ _⟩
  · intro S hS
    simp only [Finset.mem_filter, Finset.mem_powerset] at hS
    obtain ⟨hsub, -, hroot⟩ := hS
    exact (eq_insert_root_fromPieces_toPieces cs hsub hroot).symm
  · intro g hg
    rw [Fintype.mem_piFinset] at hg
    have hg' : ∀ i, g i ⊆ (cs.get i).vertices := fun i => Finset.mem_powerset.mp (Finset.mem_filter.mp (hg i)).1
    funext i
    rw [← toPieces_erase_root cs (insert ([] : List ℕ) (fromPieces cs g)) i,
      Finset.erase_insert (root_notMem_fromPieces cs g)]
    exact toPieces_fromPieces cs g hg' i
  · intro S hS
    simp only [Finset.mem_filter, Finset.mem_powerset] at hS
    obtain ⟨hsub, -, hroot⟩ := hS
    conv_lhs => rw [eq_insert_root_fromPieces_toPieces cs hsub hroot]
    exact genTerm_insertRoot_fromPieces cs (toPieces cs S) (fun i => Finset.filter_subset _ _)

theorem noChildRoot_fromPieces (g : Fin cs.length → Finset (List ℕ)) (hgr : ∀ i, ([] : List ℕ) ∉ g i) :
    (RTree.node cs).noChildRoot (fromPieces cs g) := by
  intro v hv hlen
  rw [RTree.mem_vertices_node] at hv
  rcases hv with h0 | ⟨i, p, hp, rfl⟩
  · rw [h0] at hlen; simp at hlen
  · have hp0 : p = [] := by
      have hl : ((i : ℕ) :: p).length = 1 := hlen
      simpa using hl
    rw [hp0]
    intro hmem
    rw [mem_fromPieces] at hmem
    obtain ⟨j, q, hq, he⟩ := hmem
    have hij : i = j := Fin.ext (List.cons.inj he).1
    subst hij
    exact hgr i ((List.cons.inj he).2 ▸ hq)

theorem RTree.Apoly_eq_weighted_sum (t : RTree) :
    MvPolynomial.X (1 : Fin 2) * t.Apoly + t.Bpoly
      = ∑ S ∈ t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S),
          (if t.noChildRoot S then MvPolynomial.X (1 : Fin 2) else 1) * t.genTerm S := by
  unfold RTree.Apoly RTree.Bpoly
  have e1 : t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S ∧ t.noChildRoot S)
      = (t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S)).filter (fun S => t.noChildRoot S) := by
    rw [Finset.filter_filter]; ext S; simp [and_assoc]
  have e2 : t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S ∧ ¬ t.noChildRoot S)
      = (t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S)).filter (fun S => ¬ t.noChildRoot S) := by
    rw [Finset.filter_filter]; ext S; simp [and_assoc]
  rw [e1, e2, Finset.mul_sum,
    ← Finset.sum_filter_add_sum_filter_not (t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S))
      (fun S => t.noChildRoot S) (fun S => (if t.noChildRoot S then MvPolynomial.X (1 : Fin 2) else 1) * t.genTerm S)]
  congr 1
  · apply Finset.sum_congr rfl
    intro S hS
    rw [Finset.mem_filter] at hS
    rw [if_pos hS.2]
  · apply Finset.sum_congr rfl
    intro S hS
    rw [Finset.mem_filter] at hS
    rw [if_neg hS.2]; ring

theorem RTree.Apoly_node (cs : List RTree) :
    (RTree.node cs).Apoly =
      ∏ i : Fin cs.length, (MvPolynomial.X (1 : Fin 2) * (cs.get i).Apoly + (cs.get i).Bpoly) := by
  have hprod : (∏ i : Fin cs.length, (MvPolynomial.X (1 : Fin 2) * (cs.get i).Apoly + (cs.get i).Bpoly))
      = ∑ g ∈ Fintype.piFinset (fun i : Fin cs.length =>
            (cs.get i).vertices.powerset.filter (fun S => (cs.get i).IndepSet S ∧ [] ∉ S)),
          ∏ i : Fin cs.length,
            (if (cs.get i).noChildRoot (g i) then MvPolynomial.X (1 : Fin 2) else 1) * (cs.get i).genTerm (g i) := by
    simp only [RTree.Apoly_eq_weighted_sum]
    exact Finset.prod_univ_sum _ _
  rw [hprod]
  unfold RTree.Apoly
  apply Finset.sum_nbij' (fun S : Finset (List ℕ) => fun i : Fin cs.length => toPieces cs S i)
    (fun g : Fin cs.length → Finset (List ℕ) => fromPieces cs g)
  · intro S hS
    simp only [Finset.mem_filter, Finset.mem_powerset] at hS
    obtain ⟨hsub, hindep, -, hnc⟩ := hS
    rw [Fintype.mem_piFinset]
    intro i
    simp only [Finset.mem_filter, Finset.mem_powerset]
    exact ⟨Finset.filter_subset _ _, toPieces_indepSet cs hsub hindep i,
      toPieces_notMem_root_of_noChildRoot cs hnc i⟩
  · intro g hg
    rw [Fintype.mem_piFinset] at hg
    have hg' : ∀ i, g i ⊆ (cs.get i).vertices := fun i => Finset.mem_powerset.mp (Finset.mem_filter.mp (hg i)).1
    have hgI : ∀ i, (cs.get i).IndepSet (g i) := fun i => (Finset.mem_filter.mp (hg i)).2.1
    have hgR : ∀ i, ([] : List ℕ) ∉ g i := fun i => (Finset.mem_filter.mp (hg i)).2.2
    simp only [Finset.mem_filter, Finset.mem_powerset]
    exact ⟨fromPieces_subset cs g hg', (indepSet_fromPieces_iff cs g hg').mpr hgI,
      root_notMem_fromPieces cs g, noChildRoot_fromPieces cs g hgR⟩
  · intro S hS
    simp only [Finset.mem_filter, Finset.mem_powerset] at hS
    obtain ⟨hsub, -, hroot, -⟩ := hS
    exact fromPieces_toPieces cs S hsub hroot
  · intro g hg
    rw [Fintype.mem_piFinset] at hg
    have hg' : ∀ i, g i ⊆ (cs.get i).vertices := fun i => Finset.mem_powerset.mp (Finset.mem_filter.mp (hg i)).1
    funext i
    exact toPieces_fromPieces cs g hg' i
  · intro S hS
    simp only [Finset.mem_filter, Finset.mem_powerset] at hS
    obtain ⟨hsub, -, hroot, hnc⟩ := hS
    have hg' : ∀ i, toPieces cs S i ⊆ (cs.get i).vertices := fun i => Finset.filter_subset _ _
    have hnil : ∀ i, ([] : List ℕ) ∉ toPieces cs S i := fun i => toPieces_notMem_root_of_noChildRoot cs hnc i
    conv_lhs => rw [← fromPieces_toPieces cs S hsub hroot]
    rw [genTerm_fromPieces cs (toPieces cs S) hg']
    apply Finset.prod_congr rfl
    intro i _
    have hiff : (cs.get i).avail (toPieces cs S i) [] ↔ (cs.get i).noChildRoot (toPieces cs S i) := by
      rw [RTree.avail_nil_iff (cs.get i) (toPieces cs S i) (hg' i)]
      simp [hnil i]
    simp only [hiff]

theorem RTree.IABpoly_eq_sum (t : RTree) :
    t.Ipoly + MvPolynomial.X (1 : Fin 2) * t.Apoly + t.Bpoly
      = ∑ S ∈ t.vertices.powerset.filter (fun S => t.IndepSet S),
          (if ([] ∉ S ∧ t.noChildRoot S) then MvPolynomial.X (1 : Fin 2) else 1) * t.genTerm S := by
  have hsplit := Finset.sum_filter_add_sum_filter_not (t.vertices.powerset.filter (fun S => t.IndepSet S))
      (fun S => [] ∈ S) (fun S => (if ([] ∉ S ∧ t.noChildRoot S) then MvPolynomial.X (1 : Fin 2) else 1) * t.genTerm S)
  rw [← hsplit]
  have e1 : (t.vertices.powerset.filter (fun S => t.IndepSet S)).filter (fun S => [] ∈ S)
      = t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∈ S) := by
    rw [Finset.filter_filter]
  have e2 : (t.vertices.powerset.filter (fun S => t.IndepSet S)).filter (fun S => ¬ ([] ∈ S))
      = t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S) := by
    rw [Finset.filter_filter]
  rw [e1, e2]
  have hL : ∑ S ∈ t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∈ S),
        (if ([] ∉ S ∧ t.noChildRoot S) then MvPolynomial.X (1 : Fin 2) else 1) * t.genTerm S
      = t.Ipoly := by
    unfold RTree.Ipoly
    apply Finset.sum_congr rfl
    intro S hS
    rw [Finset.mem_filter] at hS
    rw [if_neg (fun h => h.1 hS.2.2), one_mul]
  have hR : ∑ S ∈ t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S),
        (if ([] ∉ S ∧ t.noChildRoot S) then MvPolynomial.X (1 : Fin 2) else 1) * t.genTerm S
      = MvPolynomial.X (1 : Fin 2) * t.Apoly + t.Bpoly := by
    rw [RTree.Apoly_eq_weighted_sum]
    apply Finset.sum_congr rfl
    intro S hS
    rw [Finset.mem_filter] at hS
    have : (if ([] ∉ S ∧ t.noChildRoot S) then MvPolynomial.X (1 : Fin 2) else (1 : MvPolynomial (Fin 2) ℤ))
         = (if t.noChildRoot S then MvPolynomial.X (1 : Fin 2) else (1 : MvPolynomial (Fin 2) ℤ)) := by
      by_cases hnc : t.noChildRoot S
      · rw [if_pos ⟨hS.2.2, hnc⟩, if_pos hnc]
      · rw [if_neg (fun h => hnc h.2), if_neg hnc]
    rw [this]
  rw [hL, hR, add_assoc]

theorem RTree.IABpoly_node (cs : List RTree) :
    (RTree.node cs).Apoly + (RTree.node cs).Bpoly =
      ∏ i : Fin cs.length,
        ((cs.get i).Ipoly + MvPolynomial.X (1 : Fin 2) * (cs.get i).Apoly + (cs.get i).Bpoly) := by
  have hprod : (∏ i : Fin cs.length,
        ((cs.get i).Ipoly + MvPolynomial.X (1 : Fin 2) * (cs.get i).Apoly + (cs.get i).Bpoly))
      = ∑ g ∈ Fintype.piFinset (fun i : Fin cs.length =>
            (cs.get i).vertices.powerset.filter (fun S => (cs.get i).IndepSet S)),
          ∏ i : Fin cs.length,
            (if ([] ∉ g i ∧ (cs.get i).noChildRoot (g i)) then MvPolynomial.X (1 : Fin 2) else 1) *
              (cs.get i).genTerm (g i) := by
    have hstep : ∀ i : Fin cs.length,
        (cs.get i).Ipoly + MvPolynomial.X (1 : Fin 2) * (cs.get i).Apoly + (cs.get i).Bpoly
          = ∑ S ∈ (cs.get i).vertices.powerset.filter (fun S => (cs.get i).IndepSet S),
              (if ([] ∉ S ∧ (cs.get i).noChildRoot S) then MvPolynomial.X (1 : Fin 2) else 1) *
                (cs.get i).genTerm S := fun i => (cs.get i).IABpoly_eq_sum
    simp only [hstep]
    exact Finset.prod_univ_sum _ _
  rw [RTree.Apoly_add_Bpoly, hprod]
  apply Finset.sum_nbij' (fun S : Finset (List ℕ) => fun i : Fin cs.length => toPieces cs S i)
    (fun g : Fin cs.length → Finset (List ℕ) => fromPieces cs g)
  · intro S hS
    simp only [Finset.mem_filter, Finset.mem_powerset] at hS
    obtain ⟨hsub, hindep, -⟩ := hS
    rw [Fintype.mem_piFinset]
    intro i
    simp only [Finset.mem_filter, Finset.mem_powerset]
    exact ⟨Finset.filter_subset _ _, toPieces_indepSet cs hsub hindep i⟩
  · intro g hg
    rw [Fintype.mem_piFinset] at hg
    have hg' : ∀ i, g i ⊆ (cs.get i).vertices := fun i => Finset.mem_powerset.mp (Finset.mem_filter.mp (hg i)).1
    have hgI : ∀ i, (cs.get i).IndepSet (g i) := fun i => (Finset.mem_filter.mp (hg i)).2
    simp only [Finset.mem_filter, Finset.mem_powerset]
    exact ⟨fromPieces_subset cs g hg', (indepSet_fromPieces_iff cs g hg').mpr hgI, root_notMem_fromPieces cs g⟩
  · intro S hS
    simp only [Finset.mem_filter, Finset.mem_powerset] at hS
    obtain ⟨hsub, -, hroot⟩ := hS
    exact fromPieces_toPieces cs S hsub hroot
  · intro g hg
    rw [Fintype.mem_piFinset] at hg
    have hg' : ∀ i, g i ⊆ (cs.get i).vertices := fun i => Finset.mem_powerset.mp (Finset.mem_filter.mp (hg i)).1
    funext i
    exact toPieces_fromPieces cs g hg' i
  · intro S hS
    simp only [Finset.mem_filter, Finset.mem_powerset] at hS
    obtain ⟨hsub, -, hroot⟩ := hS
    have hg' : ∀ i, toPieces cs S i ⊆ (cs.get i).vertices := fun i => Finset.filter_subset _ _
    conv_lhs => rw [← fromPieces_toPieces cs S hsub hroot]
    rw [genTerm_fromPieces cs (toPieces cs S) hg']
    apply Finset.prod_congr rfl
    intro i _
    dsimp only
    simp only [RTree.avail_nil_iff (cs.get i) (toPieces cs S i) (hg' i)]

theorem RTree.Bpoly_node (cs : List RTree) :
    (RTree.node cs).Bpoly =
      (∏ i : Fin cs.length,
          ((cs.get i).Ipoly + MvPolynomial.X (1 : Fin 2) * (cs.get i).Apoly + (cs.get i).Bpoly))
        - ∏ i : Fin cs.length, (MvPolynomial.X (1 : Fin 2) * (cs.get i).Apoly + (cs.get i).Bpoly) := by
  rw [← RTree.IABpoly_node, ← RTree.Apoly_node]
  ring

/-! ### F and the y = 1 specialization -/

/-- The ordinary independence polynomial of `t`, as a ground-truth count of
independent sets by size (no root-state bookkeeping). -/
def RTree.indepPoly (t : RTree) : Polynomial ℤ :=
  ∑ S ∈ t.vertices.powerset.filter (fun S => t.IndepSet S), Polynomial.X ^ S.card

/-- The ring homomorphism specializing `y ↦ 1`, keeping `x` symbolic. -/
def yto1RingHom : MvPolynomial (Fin 2) ℤ →+* Polynomial ℤ :=
  MvPolynomial.eval₂Hom (Int.castRingHom (Polynomial ℤ)) (fun i => if i = 0 then Polynomial.X else 1)

theorem yto1_X0 : yto1RingHom (MvPolynomial.X (0 : Fin 2)) = Polynomial.X := by
  unfold yto1RingHom; simp

theorem yto1_X1 : yto1RingHom (MvPolynomial.X (1 : Fin 2)) = 1 := by
  unfold yto1RingHom; simp

theorem yto1_genTerm (t : RTree) (S : Finset (List ℕ)) :
    yto1RingHom (t.genTerm S) = Polynomial.X ^ S.card := by
  unfold RTree.genTerm
  rw [map_mul, map_pow, map_pow, yto1_X0, yto1_X1, one_pow, mul_one]

theorem RTree.Fpoly_eval_one (t : RTree) : yto1RingHom t.Fpoly = t.indepPoly := by
  unfold RTree.Fpoly RTree.indepPoly
  rw [map_add, map_add, map_mul, yto1_X1, one_mul]
  unfold RTree.Ipoly RTree.Apoly RTree.Bpoly
  simp only [map_sum, yto1_genTerm]
  have e1 : t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∈ S)
      = (t.vertices.powerset.filter (fun S => t.IndepSet S)).filter (fun S => [] ∈ S) := by
    rw [Finset.filter_filter]
  have e2 : t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S ∧ ¬ t.noChildRoot S)
      = ((t.vertices.powerset.filter (fun S => t.IndepSet S)).filter (fun S => ¬ ([] ∈ S))).filter
          (fun S => ¬ t.noChildRoot S) := by
    rw [Finset.filter_filter, Finset.filter_filter]
  have e3 : t.vertices.powerset.filter (fun S => t.IndepSet S ∧ [] ∉ S ∧ t.noChildRoot S)
      = ((t.vertices.powerset.filter (fun S => t.IndepSet S)).filter (fun S => ¬ ([] ∈ S))).filter
          (fun S => t.noChildRoot S) := by
    rw [Finset.filter_filter, Finset.filter_filter]
  rw [e1, e2, e3]
  have hsplit1 := Finset.sum_filter_add_sum_filter_not
      ((t.vertices.powerset.filter (fun S => t.IndepSet S)).filter (fun S => ¬ ([] ∈ S)))
      (fun S => t.noChildRoot S) (fun S => (Polynomial.X : Polynomial ℤ) ^ S.card)
  have hsplit2 := Finset.sum_filter_add_sum_filter_not (t.vertices.powerset.filter (fun S => t.IndepSet S))
      (fun S => [] ∈ S) (fun S => (Polynomial.X : Polynomial ℤ) ^ S.card)
  rw [← hsplit2, ← hsplit1]
  ring

end

/-! ### R11C1-F ingredient-level additions begin here.

Everything above this comment (aside from the single extra import at the
top of the file) is the R10C1-F `ExtensionProfile.lean` module, CONSUMED
verbatim — source digest
`740370914fae08e77197edd5f8fa7216d0e02110a7b2facd78ceb0a4181534aa`,
verified byte-identical before this file was assembled (see
`receipts/source_copy_verify.log`) — and never re-derived or edited.

Everything below defines, against that governed `RTree` ground-truth
model, the R11 corridor-transport ingredient-level objects CYCLE1-ALLOCATION
names for route R11C1-F: leaf deletion, the Delta sequence, the leaf
profile `a_r(v)`, the crossing-leaf predicate, the favorable-support
notions the corridor theorem's statement needs, and their basic
well-formedness lemmas. Nothing below asserts the transport lemma, any
endpoint guard, `Q = 0`, or any strict-unit fact; every definition is
documented with its own invariance statement (what it is a function of).
-/

noncomputable section
namespace RTree

/-- Graph-degree of a vertex-address in `t`: the number of `t`-vertices
adjacent to it under the SAME ground-truth `addrAdjacent` relation the
copied block above defines. Invariance: a function of `(t, v)` only,
through `t.vertices` and `addrAdjacent`; invariant under any relabelling
that is compatible with `addrAdjacent` (in particular, does not
distinguish root from non-root). -/
def degree (t : RTree) (v : List ℕ) : ℕ :=
  (t.vertices.filter (fun w => addrAdjacent v w)).card

/-- The leaf set `L(T) = {v ∈ V(T) : degree_T(v) = 1}`, the r8
THEOREM-INTERFACE definition verbatim, phrased purely via adjacency (no
reference to the constructor, the root, or any recursive structure).
Invariance: a function of `t` only. -/
def leaves (t : RTree) : Finset (List ℕ) :=
  t.vertices.filter (fun v => t.degree v = 1)

theorem leaves_subset_vertices (t : RTree) : t.leaves ⊆ t.vertices :=
  Finset.filter_subset _ _

theorem mem_leaves_iff (t : RTree) (v : List ℕ) :
    v ∈ t.leaves ↔ v ∈ t.vertices ∧ t.degree v = 1 :=
  Finset.mem_filter

/-- The independent-set-of-size-`r` count restricted to an ARBITRARY finset
`V` of vertex-addresses, reusing the governed `RTree.IndepSet` predicate
UNCHANGED (never re-derived: `t.IndepSet S` already forces `S ⊆ t.vertices`,
so this is well-behaved for any `V`, in particular for `V ⊆ t.vertices`).
This is the vehicle for "deletion": per the r8 THEOREM-INTERFACE's
"inherited labels" convention, `T − X`'s independent sets are exactly `T`'s
own independent sets that avoid `X`, i.e. `RTree.IndepSet` restricted to
`V = t.vertices \ X` — never a fresh, independently re-derived adjacency or
independence notion. Invariance: a function of `(t, V, r)`; for `V = t.vertices`
it is the whole-tree count, and for `V = t.vertices.erase v` it is the
count on the leaf-deleted tree `T − v`. -/
def indepCountOn (t : RTree) (V : Finset (List ℕ)) (r : ℕ) : ℕ :=
  (V.powerset.filter (fun S => t.IndepSet S ∧ S.card = r)).card

/-- `i_r(T)`, the r8 THEOREM-INTERFACE's ground-truth independent-set-count
sequence, against `t`'s own vertex set. Invariance: a function of `(t, r)`
only. -/
def i_ (t : RTree) (r : ℕ) : ℕ := t.indepCountOn t.vertices r

/-- `i_r(T − v)`: the same count on the induced deletion of `v`. Invariance:
a function of `(t, v, r)` only; well-defined for every vertex-address `v`,
not only for `v ∈ L(T)` (matching the interface's own unrestricted
definitions of `A_v`/`Delta_r(A_v)`). -/
def iDel (t : RTree) (v : List ℕ) (r : ℕ) : ℕ := t.indepCountOn (t.vertices.erase v) r

/-- `Delta_r(G) = i_{r+1}(G) - i_r(G)`, the r8 THEOREM-INTERFACE definition
verbatim, over an arbitrary vertex finset so the SAME definition serves both
`t` itself and any deletion of `t`. Invariance: a function of `(t, V, r)`
only. -/
def DeltaOn (t : RTree) (V : Finset (List ℕ)) (r : ℕ) : ℤ :=
  (t.indepCountOn V (r + 1) : ℤ) - (t.indepCountOn V r : ℤ)

/-- `Delta_r(T)` for the whole tree (`d_r` in the interface's notation).
Invariance: a function of `(t, r)` only. -/
def Delta (t : RTree) (r : ℕ) : ℤ := t.DeltaOn t.vertices r

/-- The leaf profile `a_r(v) = Delta_r(T − v)`, the r8 THEOREM-INTERFACE's
central per-vertex quantity. Invariance: a function of `(t, v, r)` only;
defined for every vertex-address, matching both the interface's own
`a_r : L(T) → ℤ` reading extended to all of `V(T)` and the corridor
theorem's unrestricted `aP aQ : L → ℤ` endpoint-value functions. -/
def a (t : RTree) (v : List ℕ) (r : ℕ) : ℤ := t.DeltaOn (t.vertices.erase v) r

/-- The crossing-leaf predicate of record, SOLUTION-CONTRACT item 1's
disjunct (1): a single original leaf `v` with `a_p(v) < 0 < a_q(v)`.
Invariance: a function of `(t, p, q, v)` only. Not asserted of any `v`
here — a pure ingredient-level definition, no existence claim. -/
def CrossingLeaf (t : RTree) (p q : ℕ) (v : List ℕ) : Prop :=
  v ∈ t.leaves ∧ t.a v p < 0 ∧ 0 < t.a v q

theorem crossingLeaf_mem_leaves {t : RTree} {p q : ℕ} {v : List ℕ}
    (h : t.CrossingLeaf p q v) : v ∈ t.leaves := h.1

/-! ### Basic well-formedness -/

/-- `i_` is not a parallel, unverified notion: its value is exactly the
`r`-th coefficient of the `r10`-governed `RTree.indepPoly`, so this new
object is a literal restatement of the consumed one at the coefficient
level, not an independent re-derivation. -/
theorem i_eq_indepPoly_coeff (t : RTree) (r : ℕ) :
    t.indepPoly.coeff r = (t.i_ r : ℤ) := by
  unfold RTree.indepPoly RTree.i_ RTree.indepCountOn
  rw [Polynomial.finsetSum_coeff]
  have hterm : ∀ S ∈ t.vertices.powerset.filter (fun S => t.IndepSet S),
      (Polynomial.X ^ S.card : Polynomial ℤ).coeff r = if r = S.card then (1 : ℤ) else 0 := by
    intro S _
    exact Polynomial.coeff_X_pow S.card r
  rw [Finset.sum_congr rfl hterm, Finset.sum_boole]
  have hfilter : (t.vertices.powerset.filter (fun S => t.IndepSet S)).filter (fun S => r = S.card)
      = t.vertices.powerset.filter (fun S => t.IndepSet S ∧ S.card = r) := by
    rw [Finset.filter_filter]
    congr 1
    ext S
    exact ⟨fun ⟨hI, hc⟩ => ⟨hI, hc.symm⟩, fun ⟨hI, hc⟩ => ⟨hI, hc.symm⟩⟩
  rw [hfilter]

/-- Deletion never increases the independent-set count at any rank: a
genuinely combinatorial well-formedness fact (every independent set on the
smaller vertex set is one on the larger), proved directly from the
consumed `IndepSet`/`vertices` machinery. -/
theorem indepCountOn_mono (t : RTree) {V W : Finset (List ℕ)} (h : V ⊆ W) (r : ℕ) :
    t.indepCountOn V r ≤ t.indepCountOn W r := by
  unfold RTree.indepCountOn
  exact Finset.card_le_card (Finset.filter_subset_filter _ (Finset.powerset_mono.mpr h))

theorem iDel_le_i_ (t : RTree) (v : List ℕ) (r : ℕ) : t.iDel v r ≤ t.i_ r :=
  t.indepCountOn_mono (Finset.erase_subset v t.vertices) r

/-! ### Support and favorable-support notions -/

/-- A degree-one vertex has a UNIQUE adjacent vertex among `t.vertices` —
the well-formedness fact that makes `support` below a genuine function, not
merely a choice among several candidates. -/
theorem exists_unique_adjacent_of_degree_eq_one (t : RTree) {v : List ℕ}
    (h : t.degree v = 1) : ∃! w, w ∈ t.vertices ∧ addrAdjacent v w := by
  unfold RTree.degree at h
  rw [Finset.card_eq_one] at h
  obtain ⟨w, hw⟩ := h
  refine ⟨w, ?_, ?_⟩
  · have hmem : w ∈ t.vertices.filter (fun w => addrAdjacent v w) := by
      rw [hw]; exact Finset.mem_singleton_self w
    exact Finset.mem_filter.mp hmem
  · intro y hy
    have hyf : y ∈ t.vertices.filter (fun w => addrAdjacent v w) := Finset.mem_filter.mpr hy
    rw [hw] at hyf
    exact Finset.mem_singleton.mp hyf

/-- The unique support of a leaf: the r8 THEOREM-INTERFACE's `w_v`, obtained
from `degree_T(v) = 1` via `Finset.choose` against the uniqueness fact just
proved (never a bare, unspecified `Classical.choice` witness). Off
`leaves` the value is junk (`v` itself), never inspected by any lemma
below. Invariance: a function of `(t, v)` only. -/
def support (t : RTree) (v : List ℕ) : List ℕ :=
  if h : t.degree v = 1 then
    t.vertices.choose (fun w => addrAdjacent v w) (t.exists_unique_adjacent_of_degree_eq_one h)
  else v

theorem support_eq_choose (t : RTree) {v : List ℕ} (h : t.degree v = 1) :
    t.support v =
      t.vertices.choose (fun w => addrAdjacent v w)
        (t.exists_unique_adjacent_of_degree_eq_one h) := by
  unfold RTree.support
  rw [dif_pos h]

/-- The support of a leaf is genuinely adjacent to it — the specification
that makes `support` the actual `w_v` of the r8 THEOREM-INTERFACE, not an
arbitrary placeholder. -/
theorem support_adjacent (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves) :
    addrAdjacent v (t.support v) := by
  have hdeg : t.degree v = 1 := (t.mem_leaves_iff v).mp hv |>.2
  rw [t.support_eq_choose hdeg]
  exact Finset.choose_property _ _ _

theorem support_mem_vertices (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves) :
    t.support v ∈ t.vertices := by
  have hdeg : t.degree v = 1 := (t.mem_leaves_iff v).mp hv |>.2
  rw [t.support_eq_choose hdeg]
  exact Finset.choose_mem _ _ _

/-- The concrete `p`-favorable-support predicate at ingredient level: the
governed `RTree` instantiation of the frozen Codex
`C16U204.PFavorable support aP s` (`∃ u, support u = s ∧ aP u < 0`), with
the abstract leaf-label type `L` realized concretely as `t.leaves`, the
abstract `support : L → V` realized as `RTree.support`, and the abstract
`aP : L → ℤ` realized as `fun v => t.a v p`. This makes disjunct (1) of
SOLUTION-CONTRACT item 1 and the corridor theorem's own hypotheses
statable over the SAME governed objects. Invariance: a function of
`(t, p, s)` only. Not asserted true of any `s` here — no favorable support
is claimed to exist, no guard, no `Q = 0`; a pure ingredient-level
definition. -/
def PFavorableAt (t : RTree) (p : ℕ) (s : List ℕ) : Prop :=
  ∃ v ∈ t.leaves, t.support v = s ∧ t.a v p < 0

/-- The concrete `q`-favorable-support predicate at ingredient level,
the governed instantiation of `C16U204.QFavorable`, symmetric to
`PFavorableAt`. Invariance: a function of `(t, q, s)` only. -/
def QFavorableAt (t : RTree) (q : ℕ) (s : List ℕ) : Prop :=
  ∃ v ∈ t.leaves, t.support v = s ∧ 0 < t.a v q

/-- Basic well-formedness bridge: a crossing leaf's OWN support is
simultaneously `p`-favorable and `q`-favorable AT THAT SAME VERTEX. This
exposes disjunct (1) of SOLUTION-CONTRACT item 1 (`∃ v ∈ L(T), a_p(v) < 0 <
a_q(v)`) as exactly the degenerate case of the corridor apparatus where the
chosen `p`-favorable and `q`-favorable supports COINCIDE — the case
`C16U204`'s own conclusion (`s ≠ t`) rules out at its scope. Nothing here
asserts a crossing leaf exists, nor references any endpoint guard or
`Q = 0`; it is a pure identity between two ingredient-level predicates. -/
theorem crossingLeaf_favorable {t : RTree} {p q : ℕ} {v : List ℕ}
    (h : t.CrossingLeaf p q v) :
    t.PFavorableAt p (t.support v) ∧ t.QFavorableAt q (t.support v) := by
  obtain ⟨hv, hp, hq⟩ := h
  exact ⟨⟨v, hv, rfl, hp⟩, ⟨v, hv, rfl, hq⟩⟩

/-- `Delta_r(T)` also restates the `r10`-governed `indepPoly` directly, as a
coefficient difference — the whole-tree specialization of
`i_eq_indepPoly_coeff`, making explicit that nothing about the NEW `Delta`
object is independent of the CONSUMED one. -/
theorem Delta_eq_indepPoly_coeff_sub (t : RTree) (r : ℕ) :
    t.Delta r = t.indepPoly.coeff (r + 1) - t.indepPoly.coeff r := by
  show (t.i_ (r + 1) : ℤ) - (t.i_ r : ℤ) = t.indepPoly.coeff (r + 1) - t.indepPoly.coeff r
  rw [t.i_eq_indepPoly_coeff (r + 1), t.i_eq_indepPoly_coeff r]

end RTree
end
