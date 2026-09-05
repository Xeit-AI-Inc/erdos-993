import R12C4T.Targets

/-!
# R12C4-T, SECOND ELEMENT — `BR-FACT-1`, the root-support stratum

**Route: R12C4-T, stage-3, Sonnet 5, xhigh, isolated.** Allocation:
`STUDY-INTERLUDE-1.md` §4, second element: "formalize `BR-FACT-1` (the
released disjoint-union convolution identity) under the Q3 distinction — a
routine lemma against governed objects; state it, prove it, axioms in
set."

**Scope of what is formalized here, and why it is scoped this way.** The
`ALIAS-REGISTRY.md` entry of record for `BR-FACT-1` (Interlude-1 entries,
2026-09-04) states its content precisely: *"the exact disjoint-union
convolution decomposition of `Bgen_s`'s count sequence over the branch
remnants of `T∖N[s] = ⨆_{g∈G}(C_g∖{g})`."* That registry entry — not the
fuller narrative elsewhere in `FC-R12-9`'s dossier, which also discusses a
second product (`T∖{v,s}`'s full-branch decomposition) and a
difference-of-products "gap sequence" — is the controller's own
registered statement of what Q5 released, and it names only the
`Bgen_s`/`T∖N[s]` decomposition. This file formalizes exactly that object,
and only that object: no gap-sequence claim, no second product, no
subtraction, no inequality, no monotonicity. Where a genuine open question
remains about extending the registered object's SCOPE (not its content),
it is stated as an explicit unruled interpretive question below, per
`C1-AMD-4`'s halt-and-file discipline, rather than acted on.

**Stratum:** `s = []`, the tree's own root address. This is a genuine,
non-trivial instance — `[]` is a legitimate `SupportBearing` vertex
whenever some leaf's support is the root — but it is a proper subset of
"every vertex `s`," and general `s` is NOT attempted here (see the
closing remark). This is exactly the kind of "scoped stratum, honestly
bounded" deliverable `STUDY-INTERLUDE-1.md` §4 and `SOLUTION-CONTRACT.md`
§1 both name as acceptable in place of a claim beyond what was built.

**Why the root stratum, mechanically.** For `t = RTree.node cs`,
`t.closedNbhd []` is exactly `{[]}` together with each immediate child's
own address `[i]` (`i : Fin cs.length`) — proved below,
`vertices_sdiff_closedNbhd_root_eq`. So `t.vertices \ t.closedNbhd []` is
*already* a disjoint union of per-child pieces in the governed
`fromPieces`/`toPieces` sense the CONSUMED file's own
`indepPolyOn_eraseRoot_eq_prod` (`:1612`) uses for the plain `T − root`
case — the only new work is generalizing that proof from "every subset of
each child's full vertex set" to "every subset of a FIXED per-child piece"
(here, each child's own erase-root set), which is a direct parametrization
of the SAME bijection, not a new mechanism. This is why the allocation's
"routine lemma against governed objects" description is accurate for this
stratum: no new combinatorial idea is introduced, only a one-parameter
generalization of an already-governed proof.

**Fence check (per object, C1-AMD-11).** F1/F2 not approached: no
log-concavity, unimodality, or `TRS2`/`PIS` hypothesis anywhere below.
F10 not approached: every declaration below is a STATIC exact identity
about one fixed finite object (`RTree.node cs` and its children), proved
by a single explicit bijection — not an induction scheme over a recursive
family, not a comparison of two such schemes, and no inequality is stated
or used anywhere in this file. In particular this file does NOT attempt
`Bpoly_node`-shaped recursion and does NOT relate any `C_g∖{g}` remnant to
its branch `C_g` through the I/A/B state split — it relates `T∖N[s]`
directly to the children's OWN erase-root vertex sets, which is the
released Q3 object exactly, not the reserved one.
-/

open scoped Classical
noncomputable section
namespace RTree

variable (cs : List RTree)

/-- If `S ⊆ fromPieces cs g`, then each of `S`'s own pieces lies inside the
corresponding piece of `g` — the one direction `toPieces_fromPieces` does
not itself supply (that lemma recovers `g` from `fromPieces cs g` itself,
not from an arbitrary subset of it). Pure address bookkeeping: `i :: p ∈ S
⊆ fromPieces cs g` forces, via `mem_fromPieces` and injectivity of `cons`
on the leading index, `p ∈ g i`. -/
theorem toPieces_subset_of_subset_fromPieces {S : Finset (List ℕ)}
    (g : Fin cs.length → Finset (List ℕ)) (hS : S ⊆ fromPieces cs g) (i : Fin cs.length) :
    toPieces cs S i ⊆ g i := by
  intro p hp
  have hp' : (i : ℕ) :: p ∈ S := (Finset.mem_filter.mp hp).2
  have hp'' : (i : ℕ) :: p ∈ fromPieces cs g := hS hp'
  rw [mem_fromPieces] at hp''
  obtain ⟨j, q, hq, he⟩ := hp''
  have hcons : (i : ℕ) = (j : ℕ) ∧ p = q := List.cons.inj he
  rwa [Fin.ext hcons.1, hcons.2]

/-- `fromPieces` is monotone in its per-child argument: pointwise
containment of pieces gives containment of the assembled sets. Direct from
`mem_fromPieces`. -/
theorem fromPieces_mono {g g' : Fin cs.length → Finset (List ℕ)} (h : ∀ i, g' i ⊆ g i) :
    fromPieces cs g' ⊆ fromPieces cs g := by
  intro v hv
  rw [mem_fromPieces] at hv ⊢
  obtain ⟨i, p, hp, rfl⟩ := hv
  exact ⟨i, p, h i hp, rfl⟩

/-- **The generalized branch-product identity, one parameter beyond the
CONSUMED `indepPolyOn_eraseRoot_eq_prod` (`:1612`).** For any per-child
bound `g` (each `g i` a subset of child `i`'s own vertex set, not
necessarily the whole thing), the independent-set generating function of
`fromPieces cs g` — a fixed, explicit finite set, no recursion — is the
product of the children's OWN generating functions restricted to their
`g i`. Proof: literally `indepPolyOn_eraseRoot_eq_prod`'s own bijection
(`toPieces`/`fromPieces` via `Finset.sum_nbij'`), with `(cs.get i).vertices`
narrowed to `g i` throughout via `hg`; every cited lemma
(`fromPieces_subset`, `toPieces_indepSet`, `indepSet_fromPieces_iff`,
`fromPieces_toPieces`, `toPieces_fromPieces`, `card_fromPieces`) is
ALREADY governed and general enough to apply unchanged at this
generality — only the two new bookkeeping facts just above
(`toPieces_subset_of_subset_fromPieces`, `fromPieces_mono`) are new. -/
theorem indepPolyOn_fromPieces_eq_prod (g : Fin cs.length → Finset (List ℕ))
    (hg : ∀ i, g i ⊆ (cs.get i).vertices) :
    ∑ S ∈ (fromPieces cs g).powerset.filter (fun S => (RTree.node cs).IndepSet S),
        (Polynomial.X : Polynomial ℤ) ^ S.card
      = ∏ i : Fin cs.length,
          ∑ Si ∈ (g i).powerset.filter (fun Si => (cs.get i).IndepSet Si),
            (Polynomial.X : Polynomial ℤ) ^ Si.card := by
  have hprod : (∏ i : Fin cs.length,
        ∑ Si ∈ (g i).powerset.filter (fun Si => (cs.get i).IndepSet Si),
          (Polynomial.X : Polynomial ℤ) ^ Si.card)
      = ∑ g' ∈ Fintype.piFinset (fun i : Fin cs.length =>
            (g i).powerset.filter (fun Si => (cs.get i).IndepSet Si)),
          ∏ i : Fin cs.length, (Polynomial.X : Polynomial ℤ) ^ (g' i).card :=
    Finset.prod_univ_sum _ _
  rw [hprod]
  apply Finset.sum_nbij' (fun S : Finset (List ℕ) => fun i : Fin cs.length => toPieces cs S i)
    (fun g' : Fin cs.length → Finset (List ℕ) => fromPieces cs g')
  · intro S hS
    simp only [Finset.mem_filter, Finset.mem_powerset] at hS
    obtain ⟨hsub, hindep⟩ := hS
    have hsubV : S ⊆ (RTree.node cs).vertices := hsub.trans (fromPieces_subset cs g hg)
    rw [Fintype.mem_piFinset]
    intro i
    simp only [Finset.mem_filter, Finset.mem_powerset]
    exact ⟨toPieces_subset_of_subset_fromPieces cs g hsub i, toPieces_indepSet cs hsubV hindep i⟩
  · intro g' hg'
    rw [Fintype.mem_piFinset] at hg'
    have hg'' : ∀ i, g' i ⊆ g i :=
      fun i => Finset.mem_powerset.mp (Finset.mem_filter.mp (hg' i)).1
    have hgI : ∀ i, (cs.get i).IndepSet (g' i) := fun i => (Finset.mem_filter.mp (hg' i)).2
    have hg'sub : ∀ i, g' i ⊆ (cs.get i).vertices := fun i => (hg'' i).trans (hg i)
    simp only [Finset.mem_filter, Finset.mem_powerset]
    exact ⟨fromPieces_mono cs hg'', (indepSet_fromPieces_iff cs g' hg'sub).mpr hgI⟩
  · intro S hS
    simp only [Finset.mem_filter, Finset.mem_powerset] at hS
    obtain ⟨hsub, -⟩ := hS
    have hsubV : S ⊆ (RTree.node cs).vertices := hsub.trans (fromPieces_subset cs g hg)
    have hrootS : ([] : List ℕ) ∉ S := fun hmem => root_notMem_fromPieces cs g (hsub hmem)
    exact fromPieces_toPieces cs S hsubV hrootS
  · intro g' hg'
    rw [Fintype.mem_piFinset] at hg'
    have hg'' : ∀ i, g' i ⊆ g i :=
      fun i => Finset.mem_powerset.mp (Finset.mem_filter.mp (hg' i)).1
    have hg'sub : ∀ i, g' i ⊆ (cs.get i).vertices := fun i => (hg'' i).trans (hg i)
    funext i
    exact toPieces_fromPieces cs g' hg'sub i
  · intro S hS
    simp only [Finset.mem_filter, Finset.mem_powerset] at hS
    obtain ⟨hsub, -⟩ := hS
    have hsubV : S ⊆ (RTree.node cs).vertices := hsub.trans (fromPieces_subset cs g hg)
    have hrootS : ([] : List ℕ) ∉ S := fun hmem => root_notMem_fromPieces cs g (hsub hmem)
    have heq : fromPieces cs (toPieces cs S) = S := fromPieces_toPieces cs S hsubV hrootS
    conv_lhs => rw [← heq]
    rw [card_fromPieces, Finset.prod_pow_eq_pow_sum]

/-- **`N[[]]` in `node cs` is `{[]}` together with each child's own
address `[i]`, and so `T ∖ N[[]]` is exactly `fromPieces cs (fun i ↦
(cs.get i).vertices.erase [])`** — the address-level statement of "`T∖N[s]
= ⨆_{g∈G}(C_g∖{g})`" at `s = []`: `G` is the child index set
`Fin cs.length`, and each `C_g ∖ {g}` is child `g`'s own vertices with its
own root erased (a child's root address, from the WHOLE tree's point of
view, is `[i]`; from the child's OWN point of view as an `RTree`, it is
`[]` — the same vertex, addressed two ways, exactly as
`indepPolyOn_eraseRoot_eq_prod`'s own child-indexing convention already
uses throughout). Proved by direct address unfolding: `w ∈ vertices \
closedNbhd [] ↔ w ∈ vertices ∧ w ≠ [] ∧ ¬addrAdjacent [] w`, and
`addrAdjacent [] w ↔ w.length = 1` (`addrAdjacent_nil_iff`, governed) —
combined with `mem_vertices_node`, a length-1 non-root vertex is exactly
`i :: []` for some `i`, i.e. exactly the case excluded from
`fromPieces cs (fun i ↦ (cs.get i).vertices.erase [])`. -/
theorem vertices_sdiff_closedNbhd_root_eq :
    (RTree.node cs).vertices \ (RTree.node cs).closedNbhd []
      = fromPieces cs (fun i => (cs.get i).vertices.erase []) := by
  ext w
  constructor
  · intro hw
    have hwv : w ∈ (RTree.node cs).vertices := (Finset.mem_sdiff.mp hw).1
    have hwnc : w ∉ (RTree.node cs).closedNbhd [] := (Finset.mem_sdiff.mp hw).2
    have hwne : w ≠ [] := by
      intro h; exact hwnc ((mem_closedNbhd_iff _ _ _).mpr ⟨hwv, Or.inl h⟩)
    have hwadj : ¬ addrAdjacent [] w := by
      intro h; exact hwnc ((mem_closedNbhd_iff _ _ _).mpr ⟨hwv, Or.inr h⟩)
    rw [RTree.mem_vertices_node] at hwv
    rcases hwv with h0 | ⟨i, p, hp, rfl⟩
    · exact absurd h0 hwne
    · rw [mem_fromPieces]
      refine ⟨i, p, Finset.mem_erase.mpr ⟨?_, hp⟩, rfl⟩
      intro hp0
      apply hwadj
      simp [addrAdjacent_nil_iff, hp0]
  · intro hw
    rw [mem_fromPieces] at hw
    obtain ⟨i, p, hp, rfl⟩ := hw
    have hpne : p ≠ [] := (Finset.mem_erase.mp hp).1
    have hpmem : p ∈ (cs.get i).vertices := (Finset.mem_erase.mp hp).2
    have hwv : ((i : ℕ) :: p : List ℕ) ∈ (RTree.node cs).vertices := by
      rw [RTree.mem_vertices_node]; exact Or.inr ⟨i, p, hpmem, rfl⟩
    rw [Finset.mem_sdiff]
    refine ⟨hwv, ?_⟩
    intro hmem
    rw [mem_closedNbhd_iff] at hmem
    rcases hmem.2 with h0 | hadj
    · exact List.cons_ne_nil _ _ h0
    · rw [addrAdjacent_nil_iff, List.length_cons] at hadj
      have hpos := List.length_pos_of_ne_nil hpne
      omega

/-- **`BR-FACT-1`, root stratum: the generating-function form.** For `t =
RTree.node cs`, `s := []` (assumed `SupportBearing`, i.e. some leaf's
support — not asserted here, this identity holds regardless), the
independent-set generating function of `t.vertices \ t.closedNbhd s` (the
ambient set `Bgen_s`'s count sequence is built from) is the product, over
`t`'s own immediate children, of each child's OWN "erase own root"
generating function. Exactly `ALIAS-REGISTRY.md`'s `BR-FACT-1` row, at
`s = []`, and nothing beyond it: no gap sequence, no second product, no
subtraction, no comparison. -/
theorem indepPolyOn_Bgen_root_eq_prod :
    ∑ S ∈ ((RTree.node cs).vertices \ (RTree.node cs).closedNbhd []).powerset.filter
        (fun S => (RTree.node cs).IndepSet S), (Polynomial.X : Polynomial ℤ) ^ S.card
      = ∏ i : Fin cs.length,
          ∑ Si ∈ ((cs.get i).vertices.erase []).powerset.filter
              (fun Si => (cs.get i).IndepSet Si), (Polynomial.X : Polynomial ℤ) ^ Si.card := by
  rw [vertices_sdiff_closedNbhd_root_eq]
  exact indepPolyOn_fromPieces_eq_prod cs _ (fun i => Finset.erase_subset _ _)

/-- **`BR-FACT-1`, root stratum: the count-sequence (`j_r`) form.** The
same identity, one coefficient at a time, phrased directly against
`indepCountOn` — the form closest to `ALIAS-REGISTRY.md`'s own "count
sequence" wording and to `Bgen`'s own definition (`Bgen t z r =
DeltaOnZ (t.vertices \ t.closedNbhd z) r`, itself built from
`indepCountOnZ`/`indepCountOn`). -/
theorem indepCountOn_Bgen_root_eq_coeff (r : ℕ) :
    (((RTree.node cs).indepCountOn
        ((RTree.node cs).vertices \ (RTree.node cs).closedNbhd []) r : ℕ) : ℤ)
      = (∏ i : Fin cs.length,
          ∑ Si ∈ ((cs.get i).vertices.erase []).powerset.filter
              (fun Si => (cs.get i).IndepSet Si), (Polynomial.X : Polynomial ℤ) ^ Si.card).coeff r := by
  rw [indepCountOn_coeff, indepPolyOn_Bgen_root_eq_prod]

end RTree
end

/-!
## Honest closing remark: what this file does NOT do

**General `s` is open, and here is exactly what would be needed.** For
`s ≠ []`, `s`'s neighbors split into an "upward" one (`s.dropLast`, if
`s ≠ []`) and its own children (`s ++ [k]` for various `k`); the children
side is a direct re-application of the SAME `fromPieces`-at-a-vertex
technique this file uses at the root, but the upward side requires a
"prune the subtree rooted at `s` out of `t`, keep everything else" object
that does **not exist anywhere in the governed `CorridorIngredients.lean`
corpus** — a genuinely new piece of tree-structural infrastructure (an
address-indexed "subtree extraction" and its complement, plus the lemmas
connecting their vertex sets and independence structure back to `t`'s
own), not a restatement of anything already governed. Building it is a
strictly larger undertaking than the "routine lemma" the allocation
described, and `SOLUTION-CONTRACT.md` §4's "consume, never re-derive"
duty does not settle whether building genuinely NEW infrastructure of
this shape is itself within the Q3 release (which is stated in terms of
already-admitting ambient sets, not in terms of authorizing new
definitions) — this is exactly a `C1-AMD-4` halt-and-file situation, not
a green light, and it is filed as an open interpretive question in this
route's `.md` report rather than acted on. The root stratum above is
therefore offered as a genuine, complete, sorry-free partial result, not
as a reduced form of the general claim.
-/
