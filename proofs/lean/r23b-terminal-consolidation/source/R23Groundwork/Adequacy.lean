import R23Groundwork.ActualTree

/-!
# C4-T3: the two adequacy lemmas (residual items 2–3, C3 gate / ADJ-F F2-1)

Charge (`control/CYCLE4-ALLOCATION.md` §"C4-T3"): discharge, sorry-free,

1. **Carrier-restriction deletion adequacy** — `H_v` (and every other
   carrier-restricted object of this project) built by carrier restriction
   equals ACTUAL vertex deletion. Per the sealed C4-F2 return's F-6(i)
   (binding supplement to this seat): the comparison object must be
   INDEPENDENT of `IndOn`'s carrier trick. Two comparison objects are
   provided here:

   * **(1a) within-encoding:** a genuine fresh `Graph U.card` value
     (`Graph.induce`) on the surviving vertices under the canonical
     order-preserving relabeling, whose plain `i` counts are proved equal
     to the carrier-restricted `iOn` counts; and
   * **(1b) Mathlib-side (the F-6(i)-named referent):** Mathlib's
     `SimpleGraph.induce` on the carrier, with Mathlib's `IsIndepSet`
     independence notion — an apparatus sharing NO definition with
     `IndOn`. The chain `iOn U r = sgIndepCountOn (toSimpleGraph G) U r
     = sgIndepCount ((toSimpleGraph G).induce ↑U) r` is kernel-checked.

2. **`Graph n` realization adequacy** — every finite tree arises as a
   C1-T6-encoding graph, WITH QUANTITY TRANSPORT (per F-6(ii): a
   statement carrying only edge-set existence or adjacency is
   contentless; the adequate statement produces an encoding graph with an
   equivalence carrying `i_k` for ALL `k` — hence `Δ`, `x(T)`, the
   favorable set, and `S`). "Finite tree" is pinned to Mathlib's
   `SimpleGraph.IsTree` (connected ∧ acyclic) on an arbitrary finite
   vertex type. The realization is `ofSimpleGraph` along
   `Fintype.equivFin`; the transported quantities are stated against
   Mathlib-primitive counting expressions on the abstract side
   (`IsIndepSet`, `degree`, `neighborFinset` — never this project's
   carrier apparatus), and an instance-free corollary
   (`realization_adequacy_abstract`) states the `i_k` transport via
   `Nat.card` with NO decidability hypotheses, for arbitrary `Fintype`
   carriers. (This replaces C2-F4's rooted recursion, which was needed
   only for the `RTree` target; the relabeling construction suffices for
   the `Fin`-indexed encoding.)

**[A1.1] — what these two lemmas discharge, and what remains, stated
exactly (charge clause "\[A1.1\] discharged where these land or its
remaining content stated exactly"; wording per the sealed C4-F2 F-6(iii)
analysis):**

*Discharged here — the ENCODING-ADEQUACY half of the premise family
C3-F2 F2-1 identified, at these exact scopes:* (i) the induced-subgraph
objects the run computes through carriers are provably the actual
vertex-deleted graphs' objects, against BOTH an independent
within-encoding referent and Mathlib's own induced-subgraph apparatus
(Part 1); (ii) the encoding misses no abstract finite tree — every
Mathlib-`IsTree` graph on a finite vertex type is realized, with the
project `IsTree` holding on the realization and with `i_k` (all `k`),
`Δ_k`, `x(T)`, leaf/degree structure, the favorable set, and `S(T,p)`
transported exactly along the realizing equivalence (Part 2). After
(i)+(ii), reading the run's `_actual` theorems as statements about
abstract finite trees (Mathlib `SimpleGraph.IsTree` on a finite vertex
type) rests on no unproved encoding-coverage or quantity-transport
premise.

*Remaining content of A1.1, exactly:* the identification of the
registered `RTree` rows with the now-adequate ordinary-`SimpleGraph`
statements (or the gate's definitions-of-record horn, A1.1's second
branch). The registry's rows are stated on governed `RTree`s
(`RTree.semanticAdequacyTarget`, stated, unproved, source-annotated
unattempted; D9 anchor `CLAIM-IDENTITY.json:217`; A2.3 erratum noted).
No `RTree` term exists in this project, so that premise cannot be a Lean
hypothesis here; no Graph-vs-SimpleGraph lemma can touch it (C3-T1 F-3).
Result lines that carry an actual-tree reading against the REGISTERED
objects therefore still carry `[A1.1]`; their reading against ABSTRACT
finite trees (Mathlib `IsTree`) is covered by Part 2 and carries no
unproved encoding premise. A bare "[A1.1] discharged" is NOT claimed
anywhere in this file. One further modeling note, disclosed: Part 2
proves Mathlib-tree → project-`IsTree` (the coverage direction). The
converse (project-`IsTree` → acyclic) is not needed for coverage — if
the project domain were strictly broader, the universal statements would
only be quantified over MORE graphs — and is not proved here.

Mode convention (standing duty 1): `x(T)` = FIRST STRICT DESCENT,
`min{k ≥ 0 : Δ_k(T) < 0}`; first/last global mode are different objects.
No mode-like quantity is computed under any other convention here; the
abstract-side `sgX` below mirrors `xOf`'s bounded first-strict-descent
search literally, and their equality is proved, not assumed.

The A2.2 DEAD-BRANCH fence is respected: nothing below states, uses, or
re-opens any all-cut Hall or Delete-only universal Hall claim; everything
here is definitional/cardinality adequacy for the surviving objects.

Provenance: the declarations of Part 1a and the adjacency/connectivity/
tree-transport core of Part 2 were recovered from the capacity-killed
first c4-t3 seat's scratch (audited line-by-line by this seat and rebuilt
from source in this fresh project — nothing is certified on the strength
of the prior seat's artifacts); Section 0, Part 1b, the whole
quantity-transport layer of Part 2, and the new controls are this seat's
work.

Nothing in this file is `formally_verified` in the VerityOS sense (no
`lean-proof-workflow` closeout ran). Lean-kernel type-checking is
computation-grade evidence of exactly the declarations checked, on
exactly this encoding — never proof of any claim beyond them.
-/

namespace R23
namespace Graph

variable {n : ℕ} (G : Graph n)

/-! ## Section 0 — the Mathlib bridge (`toSimpleGraph`) and Mathlib-side
counting vocabulary

The F-6(i)-independent referent. `SimpleGraph`, `IsIndepSet`,
`SimpleGraph.induce`, `degree`, `neighborFinset` are Mathlib's; nothing
in this section reuses `IndOn`'s carrier trick on the comparison side. -/

/-- **C5-T2 INTEGRATION DELTA (disclosed):** the sealed C4-T3 `Adequacy.lean`
    (sha256 `dbe4b15b35485520ad84e54f60c02e475e5a35404a3cfea0f72457dee5930bf0`)
    defines its own `toSimpleGraph` here. The grand-merge project (C4-T1,
    `Theorems.lean`) ALREADY carries an identical-adjacency `toSimpleGraph`
    (C3-T2 merge glue, `Theorems.lean:290`), so this copy's own `def` is
    DROPPED to avoid a duplicate-declaration error — a name collision, not a
    mathematical divergence: both bind `Adj := G.Adj` with `symm`/`loopless`
    proof terms that differ only syntactically (`SimpleGraph.symm`/
    `.loopless` are `Prop`-valued, hence proof-irrelevant), so every
    downstream lemma in this file that used ITS OWN `toSimpleGraph` is
    definitionally unaffected by re-pointing at the grand-merge's. No
    statement below is weakened, broadened, or restated. -/
instance instDecidableRelToSimpleGraphAdj :
    DecidableRel (G.toSimpleGraph).Adj := fun u v => G.instDecidableAdj u v

@[simp] theorem toSimpleGraph_adj (u v : Fin n) :
    G.toSimpleGraph.Adj u v ↔ G.Adj u v := Iff.rfl

/-- The project's `IsIndependent` is Mathlib's `IsIndepSet` on
    `toSimpleGraph` (the diagonal case is absorbed by irreflexivity). -/
theorem isIndependent_iff_isIndepSet (A : Finset (Fin n)) :
    G.IsIndependent A ↔ G.toSimpleGraph.IsIndepSet (A : Set (Fin n)) := by
  unfold IsIndependent
  rw [SimpleGraph.isIndepSet_iff]
  constructor
  · intro h u hu v hv _
    exact h u hu v hv
  · intro h u hu v hv hadj
    by_cases huv : u = v
    · exact G.irrefl v (huv ▸ hadj)
    · exact h hu hv huv hadj

end Graph
end R23

namespace R23
namespace SG

open SimpleGraph

variable {V : Type*}

/-- Mathlib-side count: the number of `r`-element subsets of the carrier
    `W` that are `IsIndepSet` in `H`. Stated entirely with Mathlib
    vocabulary; this is the abstract referent all transports below aim
    at. -/
def indepCountOn [DecidableEq V] (H : SimpleGraph V) [DecidableRel H.Adj]
    (W : Finset V) (r : ℕ) : ℕ :=
  ((W.powersetCard r).filter (fun A : Finset V => H.IsIndepSet (A : Set V))).card

/-- Mathlib-side count over the whole vertex set. -/
def indepCount [DecidableEq V] [Fintype V] (H : SimpleGraph V)
    [DecidableRel H.Adj] (r : ℕ) : ℕ :=
  indepCountOn H Finset.univ r

/-- Mathlib-side `Δ_k` (signed, ℤ-valued). -/
def delta [DecidableEq V] [Fintype V] (H : SimpleGraph V)
    [DecidableRel H.Adj] (k : ℕ) : ℤ :=
  (indepCount H (k + 1) : ℤ) - (indepCount H k : ℤ)

/-- Mathlib-side `ΔOn`. -/
def deltaOn [DecidableEq V] (H : SimpleGraph V) [DecidableRel H.Adj]
    (W : Finset V) (k : ℕ) : ℤ :=
  (indepCountOn H W (k + 1) : ℤ) - (indepCountOn H W k : ℤ)

/-- Mathlib-side `x(T)`: FIRST STRICT DESCENT (standing duty 1), the same
    bounded search as the encoding's `xOf`, over the abstract counts. -/
def x [DecidableEq V] [Fintype V] (H : SimpleGraph V)
    [DecidableRel H.Adj] : ℕ :=
  ((List.range (Fintype.card V + 1)).find?
    (fun k => decide (delta H k < 0))).getD (Fintype.card V)

/-- Mathlib-side `a_v = Δ_p(T − v)`. -/
def a [DecidableEq V] [Fintype V] (H : SimpleGraph V) [DecidableRel H.Adj]
    (v : V) (p : ℕ) : ℤ :=
  deltaOn H (Finset.univ.erase v) p

/-- Mathlib-side carrier of `H_v = T − {v, s_v}` for a LEAF `v`, written
    choice-free as `V ∖ N[v]` (for a degree-one `v`, `N[v] = {v, s_v}`
    exactly — proved below, never assumed). Total; only ever consumed
    under a degree-one hypothesis. -/
def bCarrier [DecidableEq V] [Fintype V] (H : SimpleGraph V)
    [DecidableRel H.Adj] (v : V) : Finset V :=
  Finset.univ \ insert v (H.neighborFinset v)

/-- Mathlib-side carrier of `T − N[s_v]` for a LEAF `v`, written
    choice-free through `v`'s neighbor set (for degree-one `v` with
    neighbor `s`, the `biUnion` is exactly `N[s]` — proved below). -/
def BCarrier [DecidableEq V] [Fintype V] (H : SimpleGraph V)
    [DecidableRel H.Adj] (v : V) : Finset V :=
  Finset.univ \ (H.neighborFinset v).biUnion
    (fun s => insert s (H.neighborFinset s))

/-- Mathlib-side `b_v = Δ_{p−1}(H_v)`. -/
def b [DecidableEq V] [Fintype V] (H : SimpleGraph V) [DecidableRel H.Adj]
    (v : V) (p : ℕ) : ℤ :=
  deltaOn H (bCarrier H v) (p - 1)

/-- Mathlib-side `B_{s_v} = Δ_{p−1}(T − N[s_v])`. -/
def B [DecidableEq V] [Fintype V] (H : SimpleGraph V) [DecidableRel H.Adj]
    (v : V) (p : ℕ) : ℤ :=
  deltaOn H (BCarrier H v) (p - 1)

/-- Mathlib-side `g_v = b_v − B_{s_v}`. -/
def gq [DecidableEq V] [Fintype V] (H : SimpleGraph V) [DecidableRel H.Adj]
    (v : V) (p : ℕ) : ℤ :=
  b H v p - B H v p

/-- Mathlib-side favorable set `F_p = {degree-one v : a_v < 0}` (Mathlib
    `degree`). -/
def favorable [DecidableEq V] [Fintype V] (H : SimpleGraph V)
    [DecidableRel H.Adj] (p : ℕ) : Finset V :=
  Finset.univ.filter (fun v => H.degree v = 1 ∧ a H v p < 0)

/-- Mathlib-side complete aggregate `S(T,p) = Σ_{v ∈ F_p} g_v`. -/
def Sq [DecidableEq V] [Fintype V] (H : SimpleGraph V) [DecidableRel H.Adj]
    (p : ℕ) : ℤ :=
  ∑ v ∈ favorable H p, gq H v p

/-- Adjacency in Mathlib's induced subgraph is decidable when the
    ambient adjacency is (`induce_adj` is definitional). -/
instance instDecidableRelInduceAdj (H : SimpleGraph V) [DecidableRel H.Adj]
    (s : Set V) : DecidableRel (H.induce s).Adj :=
  fun a b => inferInstanceAs (Decidable (H.Adj a b))

/-- Independence in Mathlib's INDUCED subgraph is ambient independence of
    the value-image — the carrier↔induced-subgraph equivalence at Mathlib
    level, as a lemma (the `Graph.lean` docstring argument, F2-1(i), in
    Mathlib vocabulary). -/
theorem isIndepSet_induce_iff (H : SimpleGraph V) (s : Set V) (A : Set s) :
    (H.induce s).IsIndepSet A ↔ H.IsIndepSet (Subtype.val '' A) := by
  rw [SimpleGraph.isIndepSet_iff, SimpleGraph.isIndepSet_iff]
  constructor
  · rintro h x ⟨p, hp, rfl⟩ y ⟨q, hq, rfl⟩ hne
    have hpq : p ≠ q := fun e => hne (congrArg Subtype.val e)
    exact h hp hq hpq
  · intro h p hp q hq hne
    have hval : (p : V) ≠ (q : V) := Subtype.coe_ne_coe.mpr hne
    exact h ⟨p, hp, rfl⟩ ⟨q, hq, rfl⟩ hval

/-- **Carrier counting = Mathlib-induced-subgraph counting** (general,
    at `SimpleGraph` level): the number of `r`-subsets of `W` independent
    in `H` equals the number of `r`-subsets of the induced subgraph
    `H.induce ↑W` that are `IsIndepSet` THERE. The right-hand side lives
    entirely in Mathlib's induced-subgraph apparatus. -/
theorem indepCountOn_eq_induce_count [DecidableEq V] (H : SimpleGraph V)
    [DecidableRel H.Adj] (W : Finset V) (r : ℕ) :
    indepCountOn H W r
      = ((Finset.univ.powersetCard r).filter
          (fun A : Finset (W : Set V) =>
            (H.induce (W : Set V)).IsIndepSet (A : Set (W : Set V)))).card := by
  classical
  unfold indepCountOn
  symm
  apply Finset.card_bij
    (fun (A : Finset (W : Set V)) _ => A.map (Function.Embedding.subtype _))
  · -- maps into the target filter
    rintro A hA
    simp only [Finset.mem_filter, Finset.mem_powersetCard] at hA ⊢
    obtain ⟨⟨-, hcard⟩, hind⟩ := hA
    refine ⟨⟨?_, ?_⟩, ?_⟩
    · intro x hx
      obtain ⟨⟨y, hy⟩, -, rfl⟩ := Finset.mem_map.mp hx
      exact hy
    · rw [Finset.card_map]; exact hcard
    · have himg : ((A.map (Function.Embedding.subtype _) : Finset V) : Set V)
          = Subtype.val '' (A : Set (W : Set V)) := by
        ext x
        simp [Finset.mem_map, Function.Embedding.subtype]
      have := (isIndepSet_induce_iff H (W : Set V) (A : Set (W : Set V))).mp hind
      rw [himg]
      exact this
  · -- injective
    intro A₁ h₁ A₂ h₂ heq
    exact Finset.map_injective _ heq
  · -- surjective onto the carrier-filtered sets
    rintro S hS
    simp only [Finset.mem_filter, Finset.mem_powersetCard] at hS
    obtain ⟨⟨hSW, hcard⟩, hind⟩ := hS
    have hmap : (S.subtype (fun x => x ∈ (W : Set V))).map
        (Function.Embedding.subtype _) = S :=
      Finset.subtype_map_of_mem (fun x hx => hSW hx)
    refine ⟨S.subtype (fun x => x ∈ (W : Set V)), ?_, hmap⟩
    simp only [Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨Finset.subset_univ _, ?_⟩, ?_⟩
    · have := congrArg Finset.card hmap
      rw [Finset.card_map] at this
      rw [this]; exact hcard
    · rw [isIndepSet_induce_iff]
      have himg : Subtype.val ''
          ((S.subtype (fun x => x ∈ (W : Set V)) : Finset (W : Set V)) : Set (W : Set V))
          = (S : Set V) := by
        ext x
        constructor
        · rintro ⟨⟨y, hy⟩, hmem, rfl⟩
          simpa using (Finset.mem_subtype.mp hmem)
        · intro hx
          exact ⟨⟨x, hSW hx⟩, Finset.mem_subtype.mpr hx, rfl⟩
      rw [himg]
      exact hind

end SG
end R23

namespace R23
namespace Graph

variable {n : ℕ} (G : Graph n)

/-- The carrier-restricted counts of the encoding are the Mathlib-side
    counts on `toSimpleGraph` (same carrier, Mathlib independence). -/
theorem iOn_eq_sgIndepCountOn (U : Finset (Fin n)) (r : ℕ) :
    G.iOn U r = SG.indepCountOn G.toSimpleGraph U r := by
  unfold iOn IndOn SG.indepCountOn
  congr 1
  exact Finset.filter_congr (fun A _ => G.isIndependent_iff_isIndepSet A)

/-- **Carrier-restriction deletion adequacy, Mathlib form (the F-6(i)
    referent):** the encoding's carrier-restricted count `iOn U r` equals
    the number of `r`-sets that are `IsIndepSet` in Mathlib's INDUCED
    SUBGRAPH `(toSimpleGraph G).induce ↑U` — an independence/counting
    apparatus (Mathlib `SimpleGraph.induce` + `IsIndepSet`) sharing no
    definition with `IndOn`'s carrier trick. Composes
    `iOn_eq_sgIndepCountOn` with the general Mathlib-level equivalence. -/
theorem iOn_eq_mathlib_induce_count (U : Finset (Fin n)) (r : ℕ) :
    G.iOn U r
      = ((Finset.univ.powersetCard r).filter
          (fun A : Finset (U : Set (Fin n)) =>
            (G.toSimpleGraph.induce (U : Set (Fin n))).IsIndepSet
              (A : Set (U : Set (Fin n))))).card := by
  rw [G.iOn_eq_sgIndepCountOn U r]
  exact SG.indepCountOn_eq_induce_count G.toSimpleGraph U r

/-! ## Part 1a — carrier-restriction deletion adequacy, within-encoding
referent

A genuine fresh `Graph` value on the surviving vertices (audited content
of the killed seat's partial, rebuilt and re-verified here). The encoding
computes every induced-subgraph quantity by restricting the CARRIER
(`IndOn U r`), never by building a fresh `Graph` value (`Graph.lean`,
`IndOn` doc). The lemmas below construct the actual vertex-deleted graph
`G.induce U : Graph U.card` — vertex set relabeled along the canonical
order-preserving enumeration of `U`, forced because the encoding indexes
graphs by `Fin` — and prove the carrier-restricted quantities equal ITS
quantities, at every rank. -/

/-- The elements of a carrier `U`, enumerated in the `Fin n` order by a
    STRUCTURALLY RECURSIVE computation (`finRange` + `filter`) so that
    kernel `decide` can evaluate through it (a merge-sort-based
    enumeration such as `Finset.orderIsoOfFin` is well-founded-recursive
    and kernel-opaque — a real constraint on this encoding's control
    discipline, disclosed rather than worked around with
    `native_decide`). -/
def carrierList (U : Finset (Fin n)) : List (Fin n) :=
  (List.finRange n).filter (fun x => decide (x ∈ U))

theorem carrierList_nodup (U : Finset (Fin n)) : (carrierList U).Nodup :=
  (List.nodup_finRange n).filter _

theorem mem_carrierList_iff (U : Finset (Fin n)) (x : Fin n) :
    x ∈ carrierList U ↔ x ∈ U := by
  simp [carrierList, List.mem_filter, List.mem_finRange]

theorem carrierList_toFinset (U : Finset (Fin n)) :
    (carrierList U).toFinset = U := by
  apply Finset.ext
  intro x
  rw [List.mem_toFinset, mem_carrierList_iff]

theorem length_carrierList (U : Finset (Fin n)) :
    (carrierList U).length = U.card := by
  have h := List.toFinset_card_of_nodup (carrierList_nodup U)
  rw [carrierList_toFinset U] at h
  omega

/-- The canonical enumeration of a carrier `U`: `vmap U i` is the `i`-th
    element of `U` in the `Fin n` order. This is the relabeling under
    which "delete the vertices outside `U`" produces a `Graph U.card`
    value. -/
def vmap (U : Finset (Fin n)) (i : Fin U.card) : Fin n :=
  (carrierList U).get (Fin.cast (length_carrierList U).symm i)

theorem vmap_mem (U : Finset (Fin n)) (i : Fin U.card) : vmap U i ∈ U :=
  (mem_carrierList_iff U _).mp (List.get_mem _ _)

theorem vmap_injective (U : Finset (Fin n)) : Function.Injective (vmap U) := by
  intro i j h
  have h2 := ((carrierList_nodup U).get_inj_iff).mp h
  have h3 : (Fin.cast (length_carrierList U).symm i).val
      = (Fin.cast (length_carrierList U).symm j).val := congrArg Fin.val h2
  exact Fin.ext h3

theorem vmap_surj_on (U : Finset (Fin n)) :
    ∀ x ∈ U, ∃ i : Fin U.card, vmap U i = x := by
  intro x hx
  obtain ⟨i, hi⟩ := List.mem_iff_get.mp ((mem_carrierList_iff U x).mpr hx)
  exact ⟨Fin.cast (length_carrierList U) i, hi⟩

/-- **The actual vertex-deleted graph.** `G.induce U` is a genuine `Graph`
    value on the `U.card` surviving vertices: `i ~ j` iff their images
    under the canonical enumeration are adjacent in `G`. Taking
    `U = G.Hcarrier v` this IS `H_v = T − {v, s_v}` as an actual graph;
    taking `U = G.removedClosedNbhdCarrier v` it is `T − N[s_v]`;
    taking `U = Finset.univ.erase v` it is `T − v`. -/
def induce (U : Finset (Fin n)) : Graph U.card where
  edges := Finset.univ.filter
    (fun q : Fin U.card × Fin U.card => G.Adj (vmap U q.1) (vmap U q.2))
  symm := by
    intro u v h
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at h ⊢
    exact G.symm _ _ h
  irrefl := by
    intro u
    simp only [Finset.mem_filter, Finset.mem_univ, true_and]
    exact G.irrefl _

/-- Adjacency characterization: `G.induce U` is EXACTLY `G`'s adjacency on
    the surviving vertices, along the canonical enumeration. Together with
    `vmap_mem`/`vmap_injective`/`vmap_surj_on` (the enumeration is a
    bijection onto `U`), this is the full statement that `G.induce U` IS
    the vertex-deleted graph up to the forced relabeling. -/
theorem induce_adj (U : Finset (Fin n)) (i j : Fin U.card) :
    (G.induce U).Adj i j ↔ G.Adj (vmap U i) (vmap U j) := by
  unfold induce Adj
  simp

/-- Packaged "the induced value is the actual deletion" record: the
    enumeration lands in `U`, is injective, is onto `U`, and transports
    adjacency exactly. -/
theorem induce_is_actual_deletion (U : Finset (Fin n)) :
    (∀ i, vmap U i ∈ U) ∧ Function.Injective (vmap U) ∧
    (∀ x ∈ U, ∃ i, vmap U i = x) ∧
    (∀ i j, (G.induce U).Adj i j ↔ G.Adj (vmap U i) (vmap U j)) :=
  ⟨vmap_mem U, vmap_injective U, vmap_surj_on U, G.induce_adj U⟩

/-- Independence transports along the enumeration: a vertex set of the
    actual deleted graph is independent there iff its image is independent
    in `G`. (This is the `IndOn`-docstring's "independence only ever
    depends on `G`'s edges restricted to `S`", as a lemma.) -/
theorem isIndependent_induce_iff (U : Finset (Fin n))
    (A : Finset (Fin U.card)) :
    (G.induce U).IsIndependent A ↔ G.IsIndependent (A.image (vmap U)) := by
  unfold IsIndependent
  constructor
  · intro h u hu v hv
    obtain ⟨i, hi, rfl⟩ := Finset.mem_image.mp hu
    obtain ⟨j, hj, rfl⟩ := Finset.mem_image.mp hv
    intro hadj
    exact h i hi j hj ((G.induce_adj U i j).mpr hadj)
  · intro h i hi j hj hadj
    exact h _ (Finset.mem_image_of_mem _ hi) _ (Finset.mem_image_of_mem _ hj)
      ((G.induce_adj U i j).mp hadj)

/-- **Set-level adequacy:** the carrier-restricted independent `r`-sets of
    `G` are EXACTLY the images of the actual deleted graph's independent
    `r`-sets under the canonical enumeration. -/
theorem indOn_eq_image_induce_ind (U : Finset (Fin n)) (r : ℕ) :
    G.IndOn U r = ((G.induce U).Ind r).image (fun A => A.image (vmap U)) := by
  apply Finset.ext
  intro S
  simp only [IndOn, Ind, Finset.mem_image, Finset.mem_filter,
    Finset.mem_powersetCard]
  constructor
  · rintro ⟨⟨hSU, hcard⟩, hind⟩
    refine ⟨Finset.univ.filter (fun i => vmap U i ∈ S), ⟨⟨?_, ?_⟩, ?_⟩, ?_⟩
    case _ => exact Finset.subset_univ _
    case _ =>
      -- the image of the pulled-back set is S, so its card is S.card = r
      have himg : (Finset.univ.filter (fun i => vmap U i ∈ S)).image (vmap U) = S := by
        apply Finset.ext
        intro x
        constructor
        · intro hx
          obtain ⟨i, hi, rfl⟩ := Finset.mem_image.mp hx
          exact (Finset.mem_filter.mp hi).2
        · intro hx
          obtain ⟨i, hi⟩ := vmap_surj_on U x (hSU hx)
          exact Finset.mem_image.mpr
            ⟨i, Finset.mem_filter.mpr ⟨Finset.mem_univ i, hi ▸ hx⟩, hi⟩
      have := Finset.card_image_of_injective
        (Finset.univ.filter (fun i => vmap U i ∈ S)) (vmap_injective U)
      rw [himg] at this
      omega
    case _ =>
      rw [G.isIndependent_induce_iff]
      have himg : (Finset.univ.filter (fun i => vmap U i ∈ S)).image (vmap U) = S := by
        apply Finset.ext
        intro x
        constructor
        · intro hx
          obtain ⟨i, hi, rfl⟩ := Finset.mem_image.mp hx
          exact (Finset.mem_filter.mp hi).2
        · intro hx
          obtain ⟨i, hi⟩ := vmap_surj_on U x (hSU hx)
          exact Finset.mem_image.mpr
            ⟨i, Finset.mem_filter.mpr ⟨Finset.mem_univ i, hi ▸ hx⟩, hi⟩
      rw [himg]
      exact hind
    case _ =>
      apply Finset.ext
      intro x
      constructor
      · intro hx
        obtain ⟨i, hi, rfl⟩ := Finset.mem_image.mp hx
        exact (Finset.mem_filter.mp hi).2
      · intro hx
        obtain ⟨i, hi⟩ := vmap_surj_on U x (hSU hx)
        exact Finset.mem_image.mpr
          ⟨i, Finset.mem_filter.mpr ⟨Finset.mem_univ i, hi ▸ hx⟩, hi⟩
  · rintro ⟨A, ⟨⟨-, hcard⟩, hind⟩, rfl⟩
    refine ⟨⟨?_, ?_⟩, ?_⟩
    · intro x hx
      obtain ⟨i, -, rfl⟩ := Finset.mem_image.mp hx
      exact vmap_mem U i
    · rw [Finset.card_image_of_injective A (vmap_injective U)]
      exact hcard
    · exact (G.isIndependent_induce_iff U A).mp hind

/-- **Carrier-restriction deletion adequacy, counting form (within
    encoding):** the carrier-restricted count equals the ACTUAL deleted
    graph's count, at every rank. `Graph.lean`'s docstring argument, now a
    kernel-checked lemma (discharges half (i) of ADJ-F F2-1; the Mathlib
    form is `iOn_eq_mathlib_induce_count` above). -/
theorem iOn_eq_induce_i (U : Finset (Fin n)) (r : ℕ) :
    G.iOn U r = (G.induce U).i r := by
  unfold iOn i
  rw [G.indOn_eq_image_induce_ind U r]
  exact Finset.card_image_of_injective _
    (Finset.image_injective (vmap_injective U))

/-- `Delta` transports: carrier-restricted `Delta` equals the actual
    deleted graph's `Delta`. -/
theorem deltaOn_eq_induce_delta (U : Finset (Fin n)) (k : ℕ) :
    G.DeltaOn U k = (G.induce U).Delta k := by
  unfold DeltaOn Delta
  rw [G.iOn_eq_induce_i, G.iOn_eq_induce_i]

/-- `H_v` adequacy: the run's `H_v` counts (carrier form) are the actual
    graph `T − {v, s_v}`'s counts. -/
theorem hcarrier_deletion_adequacy (v : Fin n) (r : ℕ) :
    G.iOn (G.Hcarrier v) r = (G.induce (G.Hcarrier v)).i r :=
  G.iOn_eq_induce_i _ r

/-- `a_v = Delta_p(T − v)` with `T − v` an ACTUAL graph. -/
theorem a_eq_induce_delta (v : Fin n) (p : ℕ) :
    G.a v p = (G.induce (Finset.univ.erase v)).Delta p :=
  G.deltaOn_eq_induce_delta _ p

/-- `b_v = Delta_{p−1}(H_v)` with `H_v` an ACTUAL graph. -/
theorem b_eq_induce_delta (v : Fin n) (p : ℕ) :
    G.b v p = (G.induce (G.Hcarrier v)).Delta (p - 1) :=
  G.deltaOn_eq_induce_delta _ (p - 1)

/-- `B_{s_v} = Delta_{p−1}(T − N[s_v])` with `T − N[s_v]` an ACTUAL graph. -/
theorem B_eq_induce_delta (v : Fin n) (p : ℕ) :
    G.B v p = (G.induce (G.removedClosedNbhdCarrier v)).Delta (p - 1) :=
  G.deltaOn_eq_induce_delta _ (p - 1)

/-- BRIDGE-1 re-expressed against ACTUAL deletions:
    `|C_r(v)| = i_r(T − {v,s_v}) − i_r(T − N[s_v])` where both right-hand
    graphs are genuine `Graph` values, not carrier restrictions.
    (`bridge1_proof` composed with the adequacy lemmas; same registered
    broadened scope — every `v`, every `r`, no tree hypothesis.) -/
theorem bridge1_actual_deletion (v : Fin n) (r : ℕ) :
    ((G.C v r).card : ℤ)
      = ((G.induce (G.Hcarrier v)).i r : ℤ)
        - ((G.induce (G.removedClosedNbhdCarrier v)).i r : ℤ) := by
  have h := G.bridge1_proof v r
  rw [G.iOn_eq_induce_i, G.iOn_eq_induce_i] at h
  exact h

/-- **Deletion adequacy at actual-tree scope [A1.1 for the REGISTERED
    reading only; the abstract-finite-tree reading is covered by Part 2]:**
    for a finite tree `T`, a leaf `v`, and its unique neighbor `s` (any
    vertex adjacent to `v`; uniqueness is `support_spec_of_isLeaf`), the
    carrier `Finset.univ \ {v, s}` — the contract's `H_v` written against
    the actual `s`, not the `support` stand-in — has, at every rank, the
    same independent-set count as the ACTUAL vertex-deleted graph.
    `_hT` is carried to pin the contract's stated domain and is not
    load-bearing (the adequacy holds on every finite simple graph of the
    encoding; broadening disclosed, consistent with `R23-C1-BRIDGE1`'s). -/
theorem deletion_adequacy_actual (_hT : G.IsTree) {v s : Fin n}
    (hleaf : G.IsLeaf v) (hs : G.Adj v s) (r : ℕ) :
    G.Hcarrier v = Finset.univ \ {v, s} ∧
    G.iOn (Finset.univ \ {v, s}) r
      = (G.induce (Finset.univ \ {v, s})).i r := by
  have hsup : G.support v = s := G.support_eq_of_adj_of_isLeaf hleaf hs
  refine ⟨?_, G.iOn_eq_induce_i _ r⟩
  unfold Hcarrier
  rw [hsup]

/-! ## Part 2 — `Graph n` realization adequacy, with quantity transport

Every finite tree arises as a C1-T6-encoding graph. "Finite tree" is
pinned to Mathlib's `SimpleGraph.IsTree` (connected ∧ acyclic) on a
finite vertex type — the canonical abstract referent available at the
pinned toolchain. "Arises as" is, per the sealed C4-F2 F-6(ii)
requirement: there is an encoding value and a vertex equivalence
transporting adjacency exactly, the encoding value satisfies the
project's `IsTree` (so the run's universal statements apply to it), AND
the equivalence carries `i_k` for all `k` — hence `Δ_k`, `x(T)`, the
degree/leaf structure, the favorable set, and `S(T,p)` — onto
Mathlib-primitive counting expressions on the abstract side. -/

section Realization

open SimpleGraph

variable {V : Type*} (H : SimpleGraph V) [DecidableRel H.Adj]

/-- The C1-T6-encoding value realizing `H` along a vertex equivalence
    `e : V ≃ Fin m`: `i ~ j` iff `e.symm i ~ e.symm j` in `H`. -/
def ofSimpleGraph {m : ℕ} (e : V ≃ Fin m) : Graph m where
  edges := Finset.univ.filter
    (fun q : Fin m × Fin m => H.Adj (e.symm q.1) (e.symm q.2))
  symm := by
    intro u v h
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at h ⊢
    exact H.adj_symm h
  irrefl := by
    intro u
    simp only [Finset.mem_filter, Finset.mem_univ, true_and]
    exact H.irrefl

/-- Adjacency transport, `Fin`-side form. -/
theorem ofSimpleGraph_adj {m : ℕ} (e : V ≃ Fin m) (i j : Fin m) :
    (ofSimpleGraph H e).Adj i j ↔ H.Adj (e.symm i) (e.symm j) := by
  unfold ofSimpleGraph Adj
  simp

/-- Adjacency transport, `V`-side form: the realization preserves
    adjacency exactly. -/
theorem ofSimpleGraph_adj' {m : ℕ} (e : V ≃ Fin m) (u v : V) :
    (ofSimpleGraph H e).Adj (e u) (e v) ↔ H.Adj u v := by
  rw [ofSimpleGraph_adj]
  simp

/-- Walks of `H` transport to `ReflTransGen` chains of the realization. -/
theorem reflTransGen_of_walk {m : ℕ} (e : V ≃ Fin m) {a b : V}
    (w : H.Walk a b) :
    Relation.ReflTransGen (ofSimpleGraph H e).Adj (e a) (e b) := by
  induction w with
  | nil => exact Relation.ReflTransGen.refl
  | cons hadj _ ih =>
    exact Relation.ReflTransGen.head
      ((ofSimpleGraph_adj' H e _ _).mpr hadj) ih

/-- Connectivity transports: a connected `H` realizes to a `Connected`
    encoding value (the project's `Connected`: `ReflTransGen`-joined). -/
theorem connected_ofSimpleGraph {m : ℕ} (e : V ≃ Fin m)
    (h : H.Connected) : (ofSimpleGraph H e).Connected := by
  intro i j
  obtain ⟨w⟩ := h.preconnected (e.symm i) (e.symm j)
  have hchain := reflTransGen_of_walk H e w
  simpa using hchain

variable [Fintype V]

/-- Edge-count transport: the realization's directed edge `Finset` has
    exactly `2 · #edgeFinset H` elements (both orientations of every
    undirected edge — the encoding's storage convention). -/
theorem edges_card_ofSimpleGraph {m : ℕ} (e : V ≃ Fin m) :
    (ofSimpleGraph H e).edges.card = 2 * H.edgeFinset.card := by
  rw [SimpleGraph.two_mul_card_edgeFinset]
  apply Finset.card_bij (fun q _ => (e.symm q.1, e.symm q.2))
  · rintro ⟨i, j⟩ hq
    simp only [ofSimpleGraph, Finset.mem_filter, Finset.mem_univ,
      true_and] at hq
    simpa using hq
  · rintro ⟨i₁, j₁⟩ h₁ ⟨i₂, j₂⟩ h₂ heq
    simp only [Prod.mk.injEq] at heq
    have hi : i₁ = i₂ := e.symm.injective heq.1
    have hj : j₁ = j₂ := e.symm.injective heq.2
    simp [hi, hj]
  · rintro ⟨x, y⟩ hxy
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hxy
    refine ⟨(e x, e y), ?_, by simp⟩
    simp only [ofSimpleGraph, Finset.mem_filter, Finset.mem_univ, true_and]
    simpa using hxy

/-- **A Mathlib tree realizes to a project tree:** if `H` is a tree
    (Mathlib `IsTree`: connected ∧ acyclic) then its realization at
    `m = Fintype.card V` satisfies the project's `IsTree` (connected ∧
    `edges.card = 2·(m−1)`), via Mathlib's `IsTree.card_edgeFinset`. -/
theorem isTree_ofSimpleGraph (e : V ≃ Fin (Fintype.card V))
    (hH : H.IsTree) : (ofSimpleGraph H e).IsTree := by
  -- C5-T2 INTEGRATION DELTA (disclosed): the grand-merge project's `IsTree`
  -- (`Theorems.lean:134`) is the LC-11-repaired THREE-conjunct form
  -- (`0 < n ∧ Connected ∧ edges.card = 2*(n-1)`), whereas the sealed C4-T3
  -- `Adequacy.lean` this theorem is carried from was built against the
  -- TWO-conjunct form (`Connected ∧ edges.card = 2*(n-1)`) — the same delta
  -- class `ActualTree.lean`'s module doc already discloses for
  -- `k13_isTree`/`k16_isTree`. Only the extra `0 < Fintype.card V`
  -- component is new; the other two conjuncts' proof terms are unchanged.
  haveI : Nonempty V := hH.connected.nonempty
  refine ⟨Fintype.card_pos, connected_ofSimpleGraph H e hH.connected, ?_⟩
  rw [edges_card_ofSimpleGraph]
  have h1 : H.edgeFinset.card + 1 = Fintype.card V := hH.card_edgeFinset
  omega

/-! ### Quantity transport (the F-6(ii) content) -/

variable [DecidableEq V]

/-- Independence transports along the realization: the `e`-image of an
    abstract vertex set is independent in the encoding value iff the set
    is Mathlib-`IsIndepSet` in `H`. -/
theorem isIndependent_ofSimpleGraph_image {m : ℕ} (e : V ≃ Fin m)
    (A : Finset V) :
    (ofSimpleGraph H e).IsIndependent (A.image e)
      ↔ H.IsIndepSet (A : Set V) := by
  unfold IsIndependent
  rw [SimpleGraph.isIndepSet_iff]
  constructor
  · intro h u hu v hv hne hadj
    exact h (e u) (Finset.mem_image_of_mem _ hu)
      (e v) (Finset.mem_image_of_mem _ hv)
      ((ofSimpleGraph_adj' H e u v).mpr hadj)
  · intro h x hx y hy hadj
    obtain ⟨u, hu, rfl⟩ := Finset.mem_image.mp hx
    obtain ⟨v, hv, rfl⟩ := Finset.mem_image.mp hy
    by_cases huv : u = v
    · subst huv
      exact H.irrefl ((ofSimpleGraph_adj' H e u u).mp hadj)
    · exact h hu hv huv ((ofSimpleGraph_adj' H e u v).mp hadj)

/-- Carrier-level counting transport: the encoding's `iOn` at the
    `e`-image of any abstract carrier `W` equals the Mathlib-side count
    `indepCountOn H W r`. This single lemma is what carries every
    aggregate quantity (all of them are `iOn`s at various carriers). -/
theorem iOn_ofSimpleGraph_image {m : ℕ} (e : V ≃ Fin m) (W : Finset V)
    (r : ℕ) :
    (ofSimpleGraph H e).iOn (W.image e) r = SG.indepCountOn H W r := by
  unfold iOn IndOn SG.indepCountOn
  symm
  apply Finset.card_bij (fun (A : Finset V) _ => A.image e)
  · intro A hA
    simp only [Finset.mem_filter, Finset.mem_powersetCard] at hA ⊢
    obtain ⟨⟨hAW, hcard⟩, hind⟩ := hA
    refine ⟨⟨Finset.image_subset_image hAW, ?_⟩, ?_⟩
    · rw [Finset.card_image_of_injective A e.injective]; exact hcard
    · exact (isIndependent_ofSimpleGraph_image H e A).mpr hind
  · intro A₁ h₁ A₂ h₂ heq
    exact Finset.image_injective e.injective heq
  · intro S hS
    simp only [Finset.mem_filter, Finset.mem_powersetCard] at hS
    obtain ⟨⟨hSW, hcard⟩, hind⟩ := hS
    have himg : (S.image e.symm).image e = S := by
      rw [Finset.image_image]
      apply Finset.ext
      intro x
      simp
    refine ⟨S.image e.symm, ?_, himg⟩
    simp only [Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨?_, ?_⟩, ?_⟩
    · intro x hx
      obtain ⟨y, hy, rfl⟩ := Finset.mem_image.mp hx
      obtain ⟨w, hw, hwy⟩ := Finset.mem_image.mp (hSW hy)
      rw [← hwy]
      simpa using hw
    · rw [Finset.card_image_of_injective S e.symm.injective]; exact hcard
    · rw [← isIndependent_ofSimpleGraph_image H e (S.image e.symm), himg]
      exact hind

/-- The image of the abstract full carrier is the encoding's full
    carrier. -/
theorem image_univ_eq_univ {m : ℕ} (e : V ≃ Fin m) :
    (Finset.univ : Finset V).image e = Finset.univ := by
  apply Finset.ext
  intro x
  simp only [Finset.mem_image, Finset.mem_univ, true_and, iff_true]
  exact ⟨e.symm x, by simp⟩

/-- **`i_k` transport, all `k` (the F-6(ii) headline):** the realization's
    independence-sequence values are the abstract graph's Mathlib-side
    counts. -/
theorem i_ofSimpleGraph {m : ℕ} (e : V ≃ Fin m) (k : ℕ) :
    (ofSimpleGraph H e).i k = SG.indepCount H k := by
  have h := iOn_ofSimpleGraph_image H e Finset.univ k
  rw [image_univ_eq_univ] at h
  unfold i Ind SG.indepCount
  exact h

/-- `Δ_k` transport, all `k`. -/
theorem delta_ofSimpleGraph {m : ℕ} (e : V ≃ Fin m) (k : ℕ) :
    (ofSimpleGraph H e).Delta k = SG.delta H k := by
  unfold Delta SG.delta
  rw [i_ofSimpleGraph, i_ofSimpleGraph]

/-- `x(T)` transport: the realization's first-strict-descent stand-in
    computes the abstract graph's first strict descent (`SG.x`), because
    the two bounded searches run over the SAME length-`(card V + 1)` range
    with pointwise-equal predicates. Mode convention: first strict
    descent on both sides (standing duty 1). -/
theorem xOf_ofSimpleGraph (e : V ≃ Fin (Fintype.card V)) :
    (ofSimpleGraph H e).xOf = SG.x H := by
  have hfun : (fun k => decide ((ofSimpleGraph H e).Delta k < 0))
      = (fun k => decide (SG.delta H k < 0)) := by
    funext k
    rw [delta_ofSimpleGraph]
  unfold xOf SG.x
  rw [hfun]

/-- Neighbor-set transport: the realization's `nbrs` at `e v` is the
    `e`-image of Mathlib's `neighborFinset`. -/
theorem nbrs_ofSimpleGraph (e : V ≃ Fin (Fintype.card V)) (v : V) :
    (ofSimpleGraph H e).nbrs (e v) = (H.neighborFinset v).image e := by
  apply Finset.ext
  intro x
  simp only [nbrs, Finset.mem_filter, Finset.mem_univ, true_and,
    Finset.mem_image, SimpleGraph.mem_neighborFinset]
  constructor
  · intro hadj
    refine ⟨e.symm x, ?_, by simp⟩
    have := (ofSimpleGraph_adj H e (e v) x).mp hadj
    simpa using this
  · rintro ⟨u, hu, rfl⟩
    exact (ofSimpleGraph_adj' H e v u).mpr hu

/-- Degree transport: the realization's `degree` at `e v` is Mathlib's
    `H.degree v`. -/
theorem degree_ofSimpleGraph (e : V ≃ Fin (Fintype.card V)) (v : V) :
    (ofSimpleGraph H e).degree (e v) = H.degree v := by
  have h : (ofSimpleGraph H e).degree (e v)
      = ((ofSimpleGraph H e).nbrs (e v)).card := rfl
  rw [h, nbrs_ofSimpleGraph,
    Finset.card_image_of_injective _ e.injective,
    SimpleGraph.card_neighborFinset_eq_degree]

/-- Leaf transport: `e v` is a leaf of the realization iff `v` has
    Mathlib-degree 1 in `H`. -/
theorem isLeaf_ofSimpleGraph (e : V ≃ Fin (Fintype.card V)) (v : V) :
    (ofSimpleGraph H e).IsLeaf (e v) ↔ H.degree v = 1 := by
  unfold IsLeaf
  rw [degree_ofSimpleGraph]

/-- Support transport: for an abstract leaf `v` with neighbor `s`, the
    realization's `support` stand-in at `e v` is `e s` (composes the
    sealed C3-T1 identification `support_eq_of_adj_of_isLeaf` with the
    adjacency transport). -/
theorem support_ofSimpleGraph (e : V ≃ Fin (Fintype.card V)) {v s : V}
    (hdeg : H.degree v = 1) (hs : H.Adj v s) :
    (ofSimpleGraph H e).support (e v) = e s :=
  support_eq_of_adj_of_isLeaf _ ((isLeaf_ofSimpleGraph H e v).mpr hdeg)
    ((ofSimpleGraph_adj' H e v s).mpr hs)

/-- Erase-carrier commutation: `univ.erase (e v) = (univ.erase v).image e`. -/
theorem erase_univ_image (e : V ≃ Fin (Fintype.card V)) (v : V) :
    (Finset.univ : Finset (Fin (Fintype.card V))).erase (e v)
      = ((Finset.univ : Finset V).erase v).image e := by
  rw [Finset.image_erase e.injective, image_univ_eq_univ]

/-- `a_v` transport (unconditional — no leaf hypothesis needed): the
    realization's `a` at `e v` is the Mathlib-side `SG.a H v`. -/
theorem a_ofSimpleGraph (e : V ≃ Fin (Fintype.card V)) (v : V) (p : ℕ) :
    (ofSimpleGraph H e).a (e v) p = SG.a H v p := by
  unfold a SG.a DeltaOn SG.deltaOn
  rw [erase_univ_image, iOn_ofSimpleGraph_image, iOn_ofSimpleGraph_image]

/-- For an abstract leaf `v` with neighbor `s`: Mathlib's `neighborFinset`
    is the singleton `{s}`. -/
theorem neighborFinset_eq_singleton {v s : V}
    (hdeg : H.degree v = 1) (hs : H.Adj v s) :
    H.neighborFinset v = {s} := by
  have hcard : (H.neighborFinset v).card = 1 :=
    SimpleGraph.card_neighborFinset_eq_degree H v ▸ hdeg
  obtain ⟨a, ha⟩ := Finset.card_eq_one.mp hcard
  have hmem : s ∈ H.neighborFinset v := (SimpleGraph.mem_neighborFinset H v s).mpr hs
  rw [ha] at hmem ⊢
  rw [Finset.mem_singleton.mp hmem]

/-- `H_v`-carrier transport: the realization's `Hcarrier` at `e v` is the
    `e`-image of the abstract carrier `SG.bCarrier H v = V ∖ N[v]`
    (`= V ∖ {v, s}` for a leaf). -/
theorem hcarrier_ofSimpleGraph (e : V ≃ Fin (Fintype.card V)) {v s : V}
    (hdeg : H.degree v = 1) (hs : H.Adj v s) :
    (ofSimpleGraph H e).Hcarrier (e v) = (SG.bCarrier H v).image e := by
  unfold Hcarrier SG.bCarrier
  rw [support_ofSimpleGraph H e hdeg hs,
    neighborFinset_eq_singleton H hdeg hs,
    Finset.image_sdiff _ _ e.injective, image_univ_eq_univ,
    Finset.image_insert, Finset.image_singleton]

/-- `T − N[s_v]`-carrier transport: the realization's
    `removedClosedNbhdCarrier` at `e v` is the `e`-image of the abstract
    carrier `SG.BCarrier H v` (`= V ∖ N[s]` for a leaf with neighbor `s`). -/
theorem removedClosedNbhdCarrier_ofSimpleGraph
    (e : V ≃ Fin (Fintype.card V)) {v s : V}
    (hdeg : H.degree v = 1) (hs : H.Adj v s) :
    (ofSimpleGraph H e).removedClosedNbhdCarrier (e v)
      = (SG.BCarrier H v).image e := by
  unfold removedClosedNbhdCarrier closedNbhd SG.BCarrier
  rw [support_ofSimpleGraph H e hdeg hs,
    neighborFinset_eq_singleton H hdeg hs,
    Finset.singleton_biUnion, nbrs_ofSimpleGraph,
    Finset.image_sdiff _ _ e.injective, image_univ_eq_univ,
    Finset.image_insert]

/-- `b_v` transport for an abstract leaf. -/
theorem b_ofSimpleGraph (e : V ≃ Fin (Fintype.card V)) {v s : V}
    (hdeg : H.degree v = 1) (hs : H.Adj v s) (p : ℕ) :
    (ofSimpleGraph H e).b (e v) p = SG.b H v p := by
  unfold b SG.b DeltaOn SG.deltaOn
  rw [hcarrier_ofSimpleGraph H e hdeg hs,
    iOn_ofSimpleGraph_image, iOn_ofSimpleGraph_image]

/-- `B_{s_v}` transport for an abstract leaf. -/
theorem B_ofSimpleGraph (e : V ≃ Fin (Fintype.card V)) {v s : V}
    (hdeg : H.degree v = 1) (hs : H.Adj v s) (p : ℕ) :
    (ofSimpleGraph H e).B (e v) p = SG.B H v p := by
  unfold B SG.B DeltaOn SG.deltaOn
  rw [removedClosedNbhdCarrier_ofSimpleGraph H e hdeg hs,
    iOn_ofSimpleGraph_image, iOn_ofSimpleGraph_image]

/-- `g_v` transport for an abstract leaf. -/
theorem g_ofSimpleGraph (e : V ≃ Fin (Fintype.card V)) {v s : V}
    (hdeg : H.degree v = 1) (hs : H.Adj v s) (p : ℕ) :
    (ofSimpleGraph H e).g (e v) p = SG.gq H v p := by
  unfold g SG.gq
  rw [b_ofSimpleGraph H e hdeg hs, B_ofSimpleGraph H e hdeg hs]

/-- Favorable-set transport: the realization's favorable set is exactly
    the `e`-image of the abstract favorable set (Mathlib degrees, abstract
    `a`-values). -/
theorem favorable_ofSimpleGraph (e : V ≃ Fin (Fintype.card V)) (p : ℕ) :
    (ofSimpleGraph H e).Favorable p = (SG.favorable H p).image e := by
  apply Finset.ext
  intro x
  simp only [Favorable, SG.favorable, Finset.mem_filter, Finset.mem_univ,
    true_and, Finset.mem_image]
  constructor
  · rintro ⟨hleaf, ha⟩
    refine ⟨e.symm x, ⟨?_, ?_⟩, by simp⟩
    · have := isLeaf_ofSimpleGraph H e (e.symm x)
      simp only [Equiv.apply_symm_apply] at this
      exact this.mp hleaf
    · have := a_ofSimpleGraph H e (e.symm x) p
      simp only [Equiv.apply_symm_apply] at this
      rw [← this]
      exact ha
  · rintro ⟨v, ⟨hdeg, ha⟩, rfl⟩
    exact ⟨(isLeaf_ofSimpleGraph H e v).mpr hdeg,
      (a_ofSimpleGraph H e v p) ▸ ha⟩

/-- **`S(T,p)` transport:** the realization's complete aggregate equals
    the Mathlib-side aggregate `SG.Sq H p` (favorable leaves counted
    separately on both sides; both sums range over leaf tags, never over
    supports, so shared supports are handled identically by
    construction). -/
theorem S_ofSimpleGraph (e : V ≃ Fin (Fintype.card V)) (p : ℕ) :
    (ofSimpleGraph H e).S p = SG.Sq H p := by
  unfold S SG.Sq
  rw [favorable_ofSimpleGraph H e p,
    Finset.sum_image (fun a _ b _ h => e.injective h)]
  apply Finset.sum_congr rfl
  intro v hv
  simp only [SG.favorable, Finset.mem_filter] at hv
  obtain ⟨-, hdeg, -⟩ := hv
  have hcard : (H.neighborFinset v).card = 1 :=
    SimpleGraph.card_neighborFinset_eq_degree H v ▸ hdeg
  obtain ⟨s, hs⟩ := Finset.card_eq_one.mp hcard
  have hadj : H.Adj v s := by
    have : s ∈ H.neighborFinset v := hs ▸ Finset.mem_singleton_self s
    exact (SimpleGraph.mem_neighborFinset H v s).mp this
  exact g_ofSimpleGraph H e hdeg hadj p

/-- **`Graph n` realization adequacy, quantitative (residual item 3,
    ADJ-F F2-1 half (ii), at the sealed C4-F2 F-6(ii) statement
    strength):** every finite tree arises as a C1-T6-encoding graph WITH
    its quantities. For every finite vertex type `V` (decidability
    instances as stated; any abstract `H` admits them classically) and
    every Mathlib tree `H` on `V`, there exist an encoding value
    `G' : Graph (Fintype.card V)` and a vertex equivalence `e` with:
    (i) `G'` a project tree — so every universal r23 statement over the
    project tree domain applies to `G'`; (ii) adjacency transported
    exactly; (iii) `i_k` carried for ALL `k`; (iv) `Δ_k` carried for all
    `k`; (v) `x(T)` carried (first strict descent both sides); (vi) the
    leaf structure carried; (vii) the favorable set carried; (viii) the
    complete aggregate `S(T,p)` carried, for all `p`. All right-hand
    referents are Mathlib-primitive (`IsIndepSet` counts, `degree`) —
    none route through the encoding's carrier apparatus. -/
theorem realization_adequacy_quantitative (hH : H.IsTree) :
    ∃ (G' : Graph (Fintype.card V)) (e : V ≃ Fin (Fintype.card V)),
      G'.IsTree
      ∧ (∀ u v : V, G'.Adj (e u) (e v) ↔ H.Adj u v)
      ∧ (∀ k, G'.i k = SG.indepCount H k)
      ∧ (∀ k, G'.Delta k = SG.delta H k)
      ∧ G'.xOf = SG.x H
      ∧ (∀ v : V, G'.IsLeaf (e v) ↔ H.degree v = 1)
      ∧ (∀ p, G'.Favorable p = (SG.favorable H p).image e)
      ∧ (∀ p, G'.S p = SG.Sq H p) := by
  classical
  let e : V ≃ Fin (Fintype.card V) := Fintype.equivFin V
  exact ⟨ofSimpleGraph H e, e,
    isTree_ofSimpleGraph H e hH,
    fun u v => ofSimpleGraph_adj' H e u v,
    fun k => i_ofSimpleGraph H e k,
    fun k => delta_ofSimpleGraph H e k,
    xOf_ofSimpleGraph H e,
    fun v => isLeaf_ofSimpleGraph H e v,
    fun p => favorable_ofSimpleGraph H e p,
    fun p => S_ofSimpleGraph H e p⟩

/-- Existence form (retained from the audited partial for continuity of
    citation; strictly weaker than
    `realization_adequacy_quantitative`). -/
theorem realization_adequacy (hH : H.IsTree) :
    ∃ (G' : Graph (Fintype.card V)) (e : V ≃ Fin (Fintype.card V)),
      G'.IsTree ∧ (∀ u v : V, G'.Adj (e u) (e v) ↔ H.Adj u v) := by
  obtain ⟨G', e, hT, hAdj, -⟩ := realization_adequacy_quantitative H hH
  exact ⟨G', e, hT, hAdj⟩

end Realization

/-- **Instance-free abstract form:** for an ARBITRARY finite vertex type
    `V` — no decidability hypotheses anywhere — every Mathlib tree on `V`
    is realized by an encoding value with `i_k` carried onto the
    `Nat.card` of the abstract independent-`k`-set family. This is the
    "arbitrary Fintype carrier" reading of F-6(ii), with the counting
    referent (`Nat.card` of a subtype of `Finset V`) fully
    instance-free. -/
theorem realization_adequacy_abstract {V : Type*} [Fintype V]
    (H : SimpleGraph V) (hH : H.IsTree) :
    ∃ (G' : Graph (Fintype.card V)) (e : V ≃ Fin (Fintype.card V)),
      G'.IsTree
      ∧ (∀ u v : V, G'.Adj (e u) (e v) ↔ H.Adj u v)
      ∧ (∀ k, G'.i k
          = Nat.card {A : Finset V // A.card = k ∧ H.IsIndepSet (A : Set V)}) := by
  classical
  obtain ⟨G', e, hT, hAdj, hi, -⟩ := realization_adequacy_quantitative H hH
  refine ⟨G', e, hT, hAdj, ?_⟩
  intro k
  rw [hi k]
  unfold SG.indepCount SG.indepCountOn
  rw [Nat.card_eq_fintype_card, Fintype.card_subtype]
  congr 1
  apply Finset.ext
  intro A
  simp only [Finset.mem_filter, Finset.mem_powersetCard, Finset.mem_univ,
    Finset.subset_univ, true_and]

/-! ## Non-vacuity controls (SOLUTION-CONTRACT §6 discipline)

Kernel-`decide` witnesses that the hypotheses above are inhabitable on
real instances — no `native_decide`, no custom axioms. Computation-grade
evidence of exactly the named integers/instances on this encoding, never
proof of anything beyond them. -/

/-- Carrier-adequacy control on the sealed `K_{1,6}` fixture, leaf `1`
    (support `0` = the center): `H_1 = K_{1,6} − {1, 0}` is `5·K_1`, so
    both the carrier count and the ACTUAL induced graph's count at rank 2
    are `C(5,2) = 10`, and the induced graph really has no edges. The two
    sides are computed by DIFFERENT code paths (`iOn` filters subsets of a
    carrier inside `k16`; `induce` builds the deleted `Graph 5` value and
    counts there), so their agreement exercises `iOn_eq_induce_i`'s
    subject matter non-vacuously. -/
theorem k16_hcarrier_adequacy_control :
    k16.iOn (k16.Hcarrier 1) 2 = 10
      ∧ (k16.induce (k16.Hcarrier 1)).i 2 = 10
      ∧ (k16.induce (k16.Hcarrier 1)).edges = ∅ := by decide

/-- Carrier-adequacy control with surviving edges: on `K_{1,3}` delete the
    single leaf `3` (`U = univ.erase 3`): the actual induced `Graph 3` is
    `K_{1,2}` (4 directed edge pairs), and carrier vs actual counts agree
    at ranks 1 and 2 (`i_1 = 3`, `i_2 = 1`). -/
theorem k13_erase_adequacy_control :
    k13.iOn (Finset.univ.erase 3) 1 = 3
      ∧ (k13.induce (Finset.univ.erase 3)).i 1 = 3
      ∧ k13.iOn (Finset.univ.erase 3) 2 = 1
      ∧ (k13.induce (Finset.univ.erase 3)).i 2 = 1
      ∧ (k13.induce (Finset.univ.erase 3)).edges.card = 4 := by decide

/-- Mathlib-referent control (Section 0 / Part 1b subject matter): on the
    sealed `k13` fixture, the carrier count `iOn (univ.erase 3) 2` and the
    Mathlib-side count on `toSimpleGraph` agree at the value `1`, and the
    whole-graph Mathlib-side counts reproduce the sealed `i`-vector
    `(1,4,3,1,0)`. Two genuinely different counting paths (project
    `IsIndependent` filter vs Mathlib `IsIndepSet` filter). -/
theorem k13_mathlib_referent_control :
    SG.indepCountOn k13.toSimpleGraph (Finset.univ.erase 3) 2 = 1
      ∧ k13.iOn (Finset.univ.erase 3) 2 = 1
      ∧ (SG.indepCount k13.toSimpleGraph 0,
         SG.indepCount k13.toSimpleGraph 1,
         SG.indepCount k13.toSimpleGraph 2,
         SG.indepCount k13.toSimpleGraph 3,
         SG.indepCount k13.toSimpleGraph 4) = (1, 4, 3, 1, 0) := by decide

/-- The 2-vertex abstract tree (`K_2` as a Mathlib `SimpleGraph`), used to
    instantiate the realization hypotheses non-vacuously WITH an edge. -/
def sgK2 : SimpleGraph (Fin 2) where
  Adj a b := a ≠ b
  symm := ⟨fun _ _ h => Ne.symm h⟩
  loopless := ⟨fun _ h => h rfl⟩

instance : DecidableRel sgK2.Adj := fun a b =>
  inferInstanceAs (Decidable (a ≠ b))

/-- `K_2` is a tree in Mathlib's sense (via
    `isTree_iff_connected_and_card`: connected, and `1 + 1 = 2`). -/
theorem sgK2_isTree : sgK2.IsTree := by
  rw [SimpleGraph.isTree_iff_connected_and_card]
  constructor
  · constructor
    intro u v
    by_cases h : u = v
    · exact h ▸ SimpleGraph.Reachable.refl u
    · exact SimpleGraph.Adj.reachable h
  · have hfin : Nat.card sgK2.edgeSet = sgK2.edgeFinset.card := by
      rw [Nat.card_eq_fintype_card, SimpleGraph.edgeFinset_card]
    rw [hfin]
    have hcard : sgK2.edgeFinset.card = 1 := by decide
    rw [hcard, Nat.card_eq_fintype_card, Fintype.card_fin]

/-- Realization control, end to end: the quantitative realization
    theorem's hypotheses are inhabitable on `K_2` (a real tree WITH an
    edge), and its concrete realization at the identity relabeling has
    exactly the expected encoding data: 2 directed edges, project-`IsTree`,
    and transported adjacency. The first conjunct instantiates
    `realization_adequacy_quantitative` itself; the rest kernel-`decide`
    the concrete witness. -/
theorem realization_control :
    (∃ (G' : Graph (Fintype.card (Fin 2))) (e : Fin 2 ≃ Fin (Fintype.card (Fin 2))),
      G'.IsTree ∧ (∀ u v : Fin 2, G'.Adj (e u) (e v) ↔ sgK2.Adj u v)) ∧
    (ofSimpleGraph sgK2 (Equiv.refl (Fin 2))).edges.card = 2 ∧
    (ofSimpleGraph sgK2 (Equiv.refl (Fin 2))).Adj 0 1 := by
  refine ⟨realization_adequacy sgK2 sgK2_isTree, ?_, ?_⟩ <;> decide

/-- Project-`IsTree` control for the concrete `K_2` realization: connected
    (via the general transport lemma) and the edge-count clause by
    kernel `decide` — the realized value inhabits the project tree domain
    concretely, not only existentially. -/
theorem realization_isTree_control :
    (ofSimpleGraph sgK2 (Equiv.refl (Fin 2))).IsTree :=
  -- C5-T2 INTEGRATION DELTA (disclosed, same class as `isTree_ofSimpleGraph`
  -- above): extra `0 < Fintype.card (Fin 2)` component for the grand-merge's
  -- three-conjunct `IsTree`, decide-trivial.
  ⟨by decide, connected_ofSimpleGraph sgK2 (Equiv.refl (Fin 2)) sgK2_isTree.connected,
   by decide⟩

/-- `K_{1,3}` as an abstract Mathlib `SimpleGraph` (center `0`), for
    quantity-transport controls with NONZERO aggregate content. -/
def sgK13 : SimpleGraph (Fin 4) where
  Adj a b := (a = 0 ∧ b ≠ 0) ∨ (b = 0 ∧ a ≠ 0)
  symm := ⟨fun a b h => by
    rcases h with ⟨ha, hb⟩ | ⟨hb, ha⟩
    · exact Or.inr ⟨ha, hb⟩
    · exact Or.inl ⟨hb, ha⟩⟩
  loopless := ⟨fun a h => by
    rcases h with ⟨h1, h2⟩ | ⟨h1, h2⟩ <;> exact h2 h1⟩

instance : DecidableRel sgK13.Adj := fun a b =>
  inferInstanceAs (Decidable (_ ∨ _))

/-- **Quantity-transport control with NONZERO values (kernel `decide`,
    both code paths):** the identity-relabeled realization of the
    abstract `K_{1,3}` has, at the UNGOVERNED rank `p = 1`, aggregate
    `S = +6` on the encoding path, and the abstract Mathlib-side
    aggregate `SG.Sq` computes the SAME `+6` — the registered
    `R23-C1-ELIGIBILITY-HAZARD` row's positive value (`S(K_{1,3},1) = +6`,
    BRIDGE-2 holding, rank ungoverned: `x(K_{1,3}) = 1`, so governed
    means `p ≥ 3`; both `x` values also agree at `1`). This exercises the
    `S`/`x` transport subject matter non-vacuously with nonzero data; the
    positive value is evidence of NOTHING about O14 (ungoverned rank —
    the sealed C1 hazard row's own scoping, reproduced here as a
    control). -/
theorem sgK13_quantity_transport_control :
    (ofSimpleGraph sgK13 (Equiv.refl (Fin 4))).S 1 = 6
      ∧ SG.Sq sgK13 1 = 6
      ∧ (ofSimpleGraph sgK13 (Equiv.refl (Fin 4))).xOf = 1
      ∧ SG.x sgK13 = 1
      ∧ (ofSimpleGraph sgK13 (Equiv.refl (Fin 4))).S 3 = 0
      ∧ SG.Sq sgK13 3 = 0 := by decide

end Graph
end R23
