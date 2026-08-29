/-
  Erdos993R2C3.bipartite_extension_ratio_bound  and  Erdos993R2C3.all_forest_terminal_band
  ---------------------------------------------------------------------------------------
  Governed DRE run: erdos-993-math-dre-20260826-r2, Cycle 3 Lean gate.

  FROZEN TARGETS (see THEOREM-CONTRACT.md):

  (1) `bipartite_extension_ratio_bound`.  Let `G` be a finite simple graph on a
      finite vertex type `V` which is BIPARTITE (`G.Colorable 2`).  Let
      `i_k(G)` be the number of independent vertex sets of `G` of cardinality
      `k`, and `α(G)` the maximum cardinality of an independent set of `G`.
      Then for every `k` with `0 ≤ k ≤ α(G) - 1`:

          (k + 1) * i_(k+1)(G)  ≤  2 * (α(G) - k) * i_k(G).

      Degenerate cases included and required: `α(G) = 0` (range vacuous);
      `k = 0` (reduces to `|V| ≤ 2 α(G)`); `G` disconnected; `G` edgeless;
      `V` empty.  Plateaus and zero coefficients are ordinary instances of a
      non-strict `≤`.

  (2) `all_forest_terminal_band`.  For every finite forest `F` (a finite simple
      graph with no cycle, `F.IsAcyclic`) with `D := α(F)`:
        (a) `i_(k+1)(F) ≤ i_k(F)` for every `k` with `k < D` and `2*D ≤ 3*k+1`;
        (b) `i_(k+1)(F) < i_k(F)` whenever `k < D`, `2*D ≤ 3*k` and `i_k(F) > 0`.
      This is (1) composed with the already-governed
      `Erdos993R2C2.cbg_terminal_band` at `a_k := i_k(F)`, `D := α(F)`, using
      `SimpleGraph.IsAcyclic.colorable_two` for the forest ⟹ bipartite bridge.
      The `k < D` guard of `cbg_terminal_band` is carried EXACTLY.

  PRIORITY FLAG.  NO NOVELTY IS CLAIMED.  The underlying mathematical fact of
  declaration (1) is Basit–Galvin 2021 at König–Egerváry scope; what is
  formalized here is the run's from-scratch, self-contained re-derivation at
  bipartite scope.  Formalizing possibly-known mathematics with a
  self-contained proof is admissible; claiming novelty is NOT.  Nothing in this
  file asserts priority.  `novelty_claimed: false`.  (E993-O8 retrieval item.)

  ENCODING (binding notes of the sealed Cycle-3 synthesis, §6).

    * `i_k` and `α` are defined IN-FILE (`ind`, `alpha`) in the house style, so
      that `a_k := ind G k` and `D := alpha F` instantiate
      `Erdos993R2C2.CBG` / `Erdos993R2C2.cbg_terminal_band` WITHOUT reindexing.
    * Everything is stated over `ℕ` with multiplication on BOTH sides.  No
      subtraction and no division occurs in the statement of either frozen
      declaration: the coefficient `α(G) - k` is named by a witness `r` through
      the equation `k + r + 1 = α(G)`, exactly as `Erdos993R2C2.CBG` encodes
      `p - k`.  `bipartite_extension_ratio_bound_literal` records that this is
      exactly the guarded truncation-free `α(G) - k` reading.
    * `alpha_ge_half_of_bipartite` (step iii) is the MATCHING-FREE colour-class
      argument: the larger of the two colour classes is independent.  No
      Gallai/König `α + μ = n` route and no matching API is used anywhere.
    * `bipartite_induced` (step i) is the restriction of the colouring witness:
      a 2-colouring of `G` restricts to a proper 2-colouring of every induced
      subgraph `G[W]`.  Induced subgraphs are handled RELATIVELY, by the
      vertex-subset-indexed `alphaOn` / `BipartiteOn`, so no quotient vertex
      type is constructed.
    * `double_count` (step iv) is the pair bijection `(S, v) ↔ (T, v)` between
      (independent `(k+1)`-set, distinguished element) and (independent
      `k`-set, admissible extension vertex), discharged by `Finset.card_bij'`.
      The empty-`T` case and `k = 0` are GENUINE instances: they are excluded
      by no hypothesis (`ext G ∅ = univ`, `ind G 0 = 1`).
    * The band thresholds are the subtraction- and division-free linear forms
      `2*D ≤ 3*k + 1` (WEAK) and `2*D ≤ 3*k` (STRICT), reusing the Cycle-2
      gate's `ceilBand` / `ceilBand_le_iff` / `strictBand_iff` machinery
      verbatim.  `weak_strict_threshold_*` record the BINDING correction that
      `K(D) = ⌈(2D-1)/3⌉` (weak) and `L_F(D) = ⌈2D/3⌉` (strict) differ exactly
      at `D ≡ 2 (mod 3)`; they are NOT conflated anywhere.

  COMPOSITION.  Both prior in-run gate sources are carried byte-identically in
  this project (`LeanProof/Cycle1.lean`, sha256 `dd9e0ef6…`;
  `LeanProof/Cycle2.lean`, sha256 `b493f2f5…`) and imported.  The definitional
  equalities `conv_eq_cycle1`, `conv_eq_cycle2`, `WeaklyUnimodal_eq_cycle1`,
  `CBG_eq_cycle2`, `ceilBand_eq_cycle2` are discharged BY `rfl`, so every prior
  governed declaration applies here without re-proof.

  PROOF (informal, four steps, all proved in-run this cycle).
    (i)   A 2-colouring of `G` restricts to any vertex subset `W`.
    (ii)  For independent `T` with `|T| = k`, `α(G[V ∖ N[T]]) + k ≤ α(G)`:
          an independent set of `G[V ∖ N[T]]` is disjoint from and non-adjacent
          to `T`, so its union with `T` is independent in `G`.
    (iii) For bipartite `H`, `|V(H)| ≤ 2 α(H)`: the two colour classes are
          independent and partition `V(H)`.
    (iv)  `(k+1) · i_(k+1)(G) = Σ_{T ∈ I_k(G)} |V(G) ∖ N[T]|`.
    Chaining (i)+(iii) at `W := V ∖ N[T]` and then (ii) gives the POINTWISE
    bound `|V ∖ N[T]| ≤ 2 α(G[V ∖ N[T]]) ≤ 2 (α(G) − k)` at every
    `T ∈ I_k(G)`; (iv) sums it.

  No `sorry`, no `admit`, no `native_decide`, no new axioms.
-/

import LeanProof.Cycle2
import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Combinatorics.SimpleGraph.Coloring.Vertex
import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Finset.Lattice.Fold
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Tactic.Ring

namespace Erdos993R2C3

open Finset

/-! ## Composition layer: the two prior gates' definitions, carried verbatim -/

/-- `WeaklyUnimodal n f` — VERBATIM copy of the Cycle-1 gate's definition. -/
def WeaklyUnimodal (n : ℕ) (f : ℕ → ℕ) : Prop :=
  ∃ m, m ≤ n ∧ (∀ k, k < m → f k ≤ f (k + 1)) ∧ (∀ k, m ≤ k → k < n → f (k + 1) ≤ f k)

/-- The discrete convolution — VERBATIM copy of the Cycle-1/Cycle-2 gates'
definition. -/
def conv (p q : ℕ) (a b : ℕ → ℕ) (k : ℕ) : ℕ :=
  ∑ i ∈ range (p + 1), ∑ j ∈ range (q + 1), if i + j = k then a i * b j else 0

/-- The Basit–Galvin ratio condition — VERBATIM copy of the Cycle-2 gate's
`CBG`.  The coefficient `p - k` is named `r + 1` through `k + r + 1 = p`,
which simultaneously encodes the index range `0 ≤ k ≤ p - 1`. -/
def CBG (p : ℕ) (a : ℕ → ℕ) : Prop :=
  ∀ k r : ℕ, k + r + 1 = p → (k + 1) * a (k + 1) ≤ 2 * (r + 1) * a k

/-- `ceilBand D = ⌈(2D-1)/3⌉` — VERBATIM copy of the Cycle-2 gate's
definition. -/
def ceilBand (D : ℕ) : ℕ := (2 * D + 1) / 3

/-- **Composition receipt (Cycle 1).** -/
theorem conv_eq_cycle1 : @conv = @Erdos993R2C1.conv := rfl

/-- **Composition receipt (Cycle 2).** -/
theorem conv_eq_cycle2 : @conv = @Erdos993R2C2.conv := rfl

/-- **Composition receipt (Cycle 1).** -/
theorem WeaklyUnimodal_eq_cycle1 : @WeaklyUnimodal = @Erdos993R2C1.WeaklyUnimodal := rfl

/-- **Composition receipt (Cycle 2).**  The ratio condition proved here for
independence vectors of bipartite graphs is *definitionally identical* to the
hypothesis of the governed `Erdos993R2C2.cbg_conv_closed` and
`Erdos993R2C2.cbg_terminal_band`. -/
theorem CBG_eq_cycle2 : @CBG = @Erdos993R2C2.CBG := rfl

/-- **Composition receipt (Cycle 2).** -/
theorem ceilBand_eq_cycle2 : @ceilBand = @Erdos993R2C2.ceilBand := rfl

/-- **Binding threshold correction (`C3:R1-C8`).**  The WEAK-decrease threshold
`K(D) = ⌈(2D-1)/3⌉ = (2D+1)/3` and the STRICT-decrease threshold
`L_F(D) = ⌈2D/3⌉ = (2D+2)/3` differ EXACTLY at `D ≡ 2 (mod 3)`.  They are not
conflated anywhere in this development: the weak band is `2*D ≤ 3*k + 1`, the
strict band is `2*D ≤ 3*k`. -/
theorem weak_strict_threshold_eq_of_mod_zero (q : ℕ) :
    (2 * (3 * q) + 1) / 3 = (2 * (3 * q) + 2) / 3 := by omega

/-- `D ≡ 1 (mod 3)`: the weak and strict thresholds coincide. -/
theorem weak_strict_threshold_eq_of_mod_one (q : ℕ) :
    (2 * (3 * q + 1) + 1) / 3 = (2 * (3 * q + 1) + 2) / 3 := by omega

/-- `D ≡ 2 (mod 3)`: the weak and strict thresholds DIFFER.  This is the
binding correction: `K(D)` and `L_F(D)` must not be conflated. -/
theorem weak_strict_threshold_ne_of_mod_two (q : ℕ) :
    (2 * (3 * q + 2) + 1) / 3 ≠ (2 * (3 * q + 2) + 2) / 3 := by omega

/-- The weak band `2*D ≤ 3*k+1` is exactly `K(D) ≤ k`. -/
theorem weakBand_iff (D k : ℕ) : ceilBand D ≤ k ↔ 2 * D ≤ 3 * k + 1 := by
  unfold ceilBand; omega

/-- The strict band `2*D ≤ 3*k` is exactly `L_F(D) ≤ k`. -/
theorem strictBand_iff (D k : ℕ) : (2 * D + 2) / 3 ≤ k ↔ 2 * D ≤ 3 * k := by
  omega

/-! ## Graph-side definitions (self-contained, in-file)

`G : SimpleGraph V` with `[Fintype V]` is a *finite simple graph*: `G.Adj` is
irreflexive and symmetric by the `SimpleGraph` structure, and `V` is finite.
All independence notions below are Finset-based and defined here. -/

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `IsIndep G S` : the finite vertex set `S` is independent in `G`, i.e. no
two of its members (equal or not) are adjacent.  Since `G.Adj` is irreflexive
this is the usual notion. -/
def IsIndep (G : SimpleGraph V) (S : Finset V) : Prop :=
  ∀ u ∈ S, ∀ v ∈ S, ¬ G.Adj u v

instance decidableIsIndep (G : SimpleGraph V) [DecidableRel G.Adj] (S : Finset V) :
    Decidable (IsIndep G S) :=
  inferInstanceAs (Decidable (∀ u ∈ S, ∀ v ∈ S, ¬ G.Adj u v))

/-- `I_k(G)` : the family of independent vertex sets of `G` of cardinality `k`. -/
def indepSets (G : SimpleGraph V) [DecidableRel G.Adj] (k : ℕ) : Finset (Finset V) :=
  (Finset.powersetCard k (Finset.univ : Finset V)).filter (IsIndep G)

/-- `i_k(G)` : the NUMBER of independent vertex sets of `G` of cardinality `k`. -/
def ind (G : SimpleGraph V) [DecidableRel G.Adj] (k : ℕ) : ℕ := (indepSets G k).card

/-- `α(G[W])` : the independence number of the subgraph of `G` induced on the
vertex subset `W`, i.e. the largest cardinality of an independent set of `G`
contained in `W`. -/
def alphaOn (G : SimpleGraph V) [DecidableRel G.Adj] (W : Finset V) : ℕ :=
  (W.powerset.filter (IsIndep G)).sup Finset.card

/-- `α(G)` : the independence number of `G`. -/
def alpha (G : SimpleGraph V) [DecidableRel G.Adj] : ℕ := alphaOn G Finset.univ

section Basic

variable {G : SimpleGraph V} [DecidableRel G.Adj]

theorem mem_indepSets {k : ℕ} {S : Finset V} :
    S ∈ indepSets G k ↔ S.card = k ∧ IsIndep G S := by
  unfold indepSets
  rw [Finset.mem_filter, Finset.mem_powersetCard]
  exact ⟨fun h => ⟨h.1.2, h.2⟩, fun h => ⟨⟨Finset.subset_univ _, h.1⟩, h.2⟩⟩

omit [Fintype V] [DecidableEq V] in
theorem isIndep_empty (G : SimpleGraph V) : IsIndep G (∅ : Finset V) := by
  intro u hu
  exact absurd hu (Finset.notMem_empty u)

/-- Every independent subset of `W` is at most as large as `α(G[W])`. -/
theorem card_le_alphaOn {W S : Finset V} (hSW : S ⊆ W) (hS : IsIndep G S) :
    S.card ≤ alphaOn G W :=
  Finset.le_sup (f := Finset.card)
    (Finset.mem_filter.mpr ⟨Finset.mem_powerset.mpr hSW, hS⟩)

/-- `α(G[W])` is attained. -/
theorem exists_alphaOn (G : SimpleGraph V) [DecidableRel G.Adj] (W : Finset V) :
    ∃ S, S ⊆ W ∧ IsIndep G S ∧ S.card = alphaOn G W := by
  have hne : (W.powerset.filter (IsIndep G)).Nonempty :=
    ⟨∅, Finset.mem_filter.mpr
      ⟨Finset.mem_powerset.mpr (Finset.empty_subset W), isIndep_empty G⟩⟩
  obtain ⟨S, hS, hsup⟩ := Finset.exists_mem_eq_sup _ hne Finset.card
  rw [Finset.mem_filter, Finset.mem_powerset] at hS
  exact ⟨S, hS.1, hS.2, hsup.symm⟩

/-- `i_0(G) = 1`: the empty set is the unique independent set of size `0`.
(`k = 0` is a genuine instance of the frozen statement, not an excluded case.) -/
theorem ind_zero (G : SimpleGraph V) [DecidableRel G.Adj] : ind G 0 = 1 := by
  have : indepSets G 0 = {∅} := by
    ext S
    rw [mem_indepSets, Finset.mem_singleton]
    constructor
    · rintro ⟨hc, -⟩
      exact Finset.card_eq_zero.mp hc
    · rintro rfl
      exact ⟨rfl, isIndep_empty G⟩
  rw [ind, this, Finset.card_singleton]

end Basic

/-! ## Step (i) — an induced subgraph of a bipartite graph is bipartite -/

/-- `BipartiteOn G W` : the subgraph of `G` induced on `W` admits a proper
`2`-colouring, presented as a `Bool`-valued colouring of `V` that is proper on
`W`. -/
def BipartiteOn (G : SimpleGraph V) (W : Finset V) : Prop :=
  ∃ c : V → Bool, ∀ u ∈ W, ∀ v ∈ W, G.Adj u v → c u ≠ c v

omit [Fintype V] [DecidableEq V] in
/-- **Step (i) (`C3:R1-C3`).**  A `2`-colouring of `G` restricts to a proper
`2`-colouring of the subgraph induced on any vertex subset `W`: an induced
subgraph of a bipartite graph is bipartite.  The proof is exactly the
restriction of the colouring witness. -/
theorem bipartite_induced {G : SimpleGraph V} (hG : G.Colorable 2) (W : Finset V) :
    BipartiteOn G W := by
  obtain ⟨C⟩ := hG
  refine ⟨fun v => decide ((C v).val = 1), fun u _ v _ hadj => ?_⟩
  have hne : C u ≠ C v := C.valid hadj
  have hne' : (C u).val ≠ (C v).val := fun h => hne (Fin.ext h)
  have hu2 : (C u).val < 2 := (C u).isLt
  have hv2 : (C v).val < 2 := (C v).isLt
  simp only [ne_eq, decide_eq_decide]
  omega

/-! ## Step (iii) — a bipartite graph on `W` has `|W| ≤ 2 α(G[W])` -/

/-- **Step (iii) (`C3:R1-C2`).**  MATCHING-FREE colour-class argument: the two
colour classes of a proper `2`-colouring of `G[W]` are independent and
partition `W`, so the larger one has at least `|W|/2` vertices.  Stated
division-free as `|W| ≤ 2 α(G[W])`.  No Gallai/König identity and no matching
API is used. -/
theorem card_le_two_mul_alphaOn {G : SimpleGraph V} [DecidableRel G.Adj]
    {W : Finset V} (hW : BipartiteOn G W) : W.card ≤ 2 * alphaOn G W := by
  classical
  obtain ⟨c, hc⟩ := hW
  have hsplit : (W.filter (fun v => c v = true)).card
      + (W.filter (fun v => ¬ (c v = true))).card = W.card :=
    Finset.card_filter_add_card_filter_not _
  have hA : IsIndep G (W.filter (fun v => c v = true)) := by
    intro u hu v hv hadj
    rw [Finset.mem_filter] at hu hv
    exact hc u hu.1 v hv.1 hadj (by rw [hu.2, hv.2])
  have hB : IsIndep G (W.filter (fun v => ¬ (c v = true))) := by
    intro u hu v hv hadj
    rw [Finset.mem_filter] at hu hv
    have : c u = c v := by
      cases hcu : c u <;> cases hcv : c v <;> simp_all
    exact hc u hu.1 v hv.1 hadj this
  have h1 := card_le_alphaOn (Finset.filter_subset _ W) hA
  have h2 := card_le_alphaOn (Finset.filter_subset _ W) hB
  omega

/-! ## Step (ii) — `α(G − N[T]) + |T| ≤ α(G)` for independent `T` -/

/-- `ext G T = V(G) ∖ N[T]` : the admissible extension vertices of `T`, i.e.
the vertices outside `T` with no neighbour in `T`. -/
def ext (G : SimpleGraph V) [DecidableRel G.Adj] (T : Finset V) : Finset V :=
  (Finset.univ : Finset V).filter (fun v => v ∉ T ∧ ∀ t ∈ T, ¬ G.Adj t v)

theorem mem_ext {G : SimpleGraph V} [DecidableRel G.Adj] {T : Finset V} {v : V} :
    v ∈ ext G T ↔ v ∉ T ∧ ∀ t ∈ T, ¬ G.Adj t v := by
  unfold ext
  rw [Finset.mem_filter]
  exact ⟨fun h => h.2, fun h => ⟨Finset.mem_univ v, h⟩⟩

/-- `ext G ∅ = V(G)`: the empty-`T` case is a genuine instance. -/
theorem ext_empty (G : SimpleGraph V) [DecidableRel G.Adj] :
    ext G (∅ : Finset V) = Finset.univ := by
  ext v
  rw [mem_ext]
  simp

/-- **Step (ii) (`C3:R1-C1`).**  For an independent set `T`, every independent
set of the induced subgraph on `V ∖ N[T]` is disjoint from and non-adjacent to
`T`, so its union with `T` is independent in `G`.  Hence
`α(G − N[T]) + |T| ≤ α(G)`.  This holds for ALL finite simple graphs; no
bipartiteness is used. -/
theorem alphaOn_ext_add_card_le {G : SimpleGraph V} [DecidableRel G.Adj]
    {T : Finset V} (hT : IsIndep G T) : alphaOn G (ext G T) + T.card ≤ alpha G := by
  obtain ⟨S, hSsub, hSind, hScard⟩ := exists_alphaOn G (ext G T)
  have hdisj : Disjoint S T := by
    rw [Finset.disjoint_left]
    intro a haS haT
    exact (mem_ext.mp (hSsub haS)).1 haT
  have hunion : IsIndep G (S ∪ T) := by
    intro u hu v hv
    rcases Finset.mem_union.mp hu with hu' | hu' <;>
      rcases Finset.mem_union.mp hv with hv' | hv'
    · exact hSind u hu' v hv'
    · intro hadj
      exact (mem_ext.mp (hSsub hu')).2 v hv' hadj.symm
    · intro hadj
      exact (mem_ext.mp (hSsub hv')).2 u hu' hadj
    · exact hT u hu' v hv'
  have hcard : (S ∪ T).card = S.card + T.card := Finset.card_union_of_disjoint hdisj
  have hle : (S ∪ T).card ≤ alpha G :=
    card_le_alphaOn (Finset.subset_univ _) hunion
  omega

/-! ## The pointwise bound: `|V ∖ N[T]| ≤ 2 (α(G) − k)` at every `T ∈ I_k(G)` -/

/-- **Pointwise bound.**  Chaining steps (i), (iii), (ii): at every independent
`T` of size `k`, with `k + r + 1 = α(G)`,

  `|V ∖ N[T]| ≤ 2 α(G[V ∖ N[T]]) ≤ 2 (r + 1)`.

This is a bound at EVERY `T`, not merely on average.  Subtraction-free: the
quantity `α(G) − k` is named `r + 1`. -/
theorem ext_card_le {G : SimpleGraph V} [DecidableRel G.Adj] (hG : G.Colorable 2)
    {T : Finset V} (hT : IsIndep G T) {k r : ℕ} (hcard : T.card = k)
    (hkr : k + r + 1 = alpha G) : (ext G T).card ≤ 2 * (r + 1) := by
  have h1 : (ext G T).card ≤ 2 * alphaOn G (ext G T) :=
    card_le_two_mul_alphaOn (bipartite_induced hG (ext G T))
  have h2 := alphaOn_ext_add_card_le hT
  omega

/-! ## Step (iv) — the double count -/

section DoubleCount

variable {G : SimpleGraph V} [DecidableRel G.Adj]

/-- The set of pairs `(S, v)` with `S` an independent `(k+1)`-set and `v ∈ S`. -/
def pairsUp (G : SimpleGraph V) [DecidableRel G.Adj] (k : ℕ) : Finset (Finset V × V) :=
  (indepSets G (k + 1)).biUnion (fun S => S.image (fun v => (S, v)))

/-- The set of pairs `(T, v)` with `T` an independent `k`-set and `v` an
admissible extension vertex of `T`. -/
def pairsDown (G : SimpleGraph V) [DecidableRel G.Adj] (k : ℕ) : Finset (Finset V × V) :=
  (indepSets G k).biUnion (fun T => (ext G T).image (fun v => (T, v)))

omit [Fintype V] in
private lemma card_biUnion_image (A : Finset (Finset V)) (f : Finset V → Finset V) :
    (A.biUnion (fun S => (f S).image (fun v => (S, v)))).card = ∑ S ∈ A, (f S).card := by
  classical
  rw [Finset.card_biUnion]
  · refine Finset.sum_congr rfl fun S _ => ?_
    exact Finset.card_image_of_injective _ (fun a b h => by simpa using h)
  · intro x _ y _ hxy
    simp only [Function.onFun]
    rw [Finset.disjoint_left]
    intro a ha hb
    rw [Finset.mem_image] at ha hb
    obtain ⟨u, -, hu⟩ := ha
    obtain ⟨w, -, hw⟩ := hb
    have h := hu.trans hw.symm
    simp only [Prod.mk.injEq] at h
    exact hxy h.1

omit [Fintype V] in
private lemma mem_biUnion_image (A : Finset (Finset V)) (f : Finset V → Finset V)
    (x : Finset V × V) :
    x ∈ A.biUnion (fun S => (f S).image (fun v => (S, v))) ↔ x.1 ∈ A ∧ x.2 ∈ f x.1 := by
  classical
  constructor
  · intro h
    rw [Finset.mem_biUnion] at h
    obtain ⟨S, hS, hx⟩ := h
    rw [Finset.mem_image] at hx
    obtain ⟨v, hv, hvx⟩ := hx
    have h1 : x.1 = S := by rw [← hvx]
    have h2 : x.2 = v := by rw [← hvx]
    rw [h1, h2]
    exact ⟨hS, hv⟩
  · rintro ⟨h1, h2⟩
    rw [Finset.mem_biUnion]
    exact ⟨x.1, h1, Finset.mem_image.mpr ⟨x.2, h2, rfl⟩⟩

theorem mem_pairsUp {k : ℕ} {x : Finset V × V} :
    x ∈ pairsUp G k ↔ x.1 ∈ indepSets G (k + 1) ∧ x.2 ∈ x.1 :=
  mem_biUnion_image _ _ x

theorem mem_pairsDown {k : ℕ} {x : Finset V × V} :
    x ∈ pairsDown G k ↔ x.1 ∈ indepSets G k ∧ x.2 ∈ ext G x.1 :=
  mem_biUnion_image _ _ x

/-- **Step (iv) (`C3:R1-C4`).**  The double count

  `(k+1) * i_(k+1)(G) = Σ_{T ∈ I_k(G)} |V(G) ∖ N[T]|`,

via the mutually inverse bijection `(S, v) ↔ (T, v) = (S ∖ {v}, v)` between
pairs (independent `(k+1)`-set, distinguished element) and pairs (independent
`k`-set, admissible extension vertex).  `k = 0` and the empty `T` are genuine
instances. -/
theorem double_count (G : SimpleGraph V) [DecidableRel G.Adj] (k : ℕ) :
    (k + 1) * ind G (k + 1) = ∑ T ∈ indepSets G k, (ext G T).card := by
  classical
  have hUp : (pairsUp G k).card = ∑ S ∈ indepSets G (k + 1), S.card :=
    card_biUnion_image _ _
  have hDown : (pairsDown G k).card = ∑ T ∈ indepSets G k, (ext G T).card :=
    card_biUnion_image _ _
  have hconst : ∑ S ∈ indepSets G (k + 1), S.card = (k + 1) * ind G (k + 1) := by
    have hc : ∑ S ∈ indepSets G (k + 1), S.card
        = ∑ _S ∈ indepSets G (k + 1), (k + 1) :=
      Finset.sum_congr rfl (fun S hS => (mem_indepSets.mp hS).1)
    rw [hc, Finset.sum_const, smul_eq_mul, ind, mul_comm]
  have hbij : (pairsUp G k).card = (pairsDown G k).card := by
    refine Finset.card_bij'
      (fun x _ => (x.1.erase x.2, x.2)) (fun y _ => (insert y.2 y.1, y.2)) ?_ ?_ ?_ ?_
    · rintro ⟨S, v⟩ hx
      rw [mem_pairsUp] at hx
      obtain ⟨hS, hv⟩ := hx
      obtain ⟨hScard, hSind⟩ := mem_indepSets.mp hS
      rw [mem_pairsDown]
      refine ⟨mem_indepSets.mpr ⟨?_, ?_⟩, ?_⟩
      · rw [Finset.card_erase_of_mem hv, hScard]
        omega
      · intro u hu w hw
        exact hSind u (Finset.mem_of_mem_erase hu) w (Finset.mem_of_mem_erase hw)
      · rw [mem_ext]
        refine ⟨Finset.notMem_erase v S, ?_⟩
        intro t ht
        exact hSind t (Finset.mem_of_mem_erase ht) v hv
    · rintro ⟨T, v⟩ hy
      rw [mem_pairsDown] at hy
      obtain ⟨hT, hv⟩ := hy
      obtain ⟨hTcard, hTind⟩ := mem_indepSets.mp hT
      obtain ⟨hvT, hvadj⟩ := mem_ext.mp hv
      rw [mem_pairsUp]
      refine ⟨mem_indepSets.mpr ⟨?_, ?_⟩, ?_⟩
      · rw [Finset.card_insert_of_notMem hvT, hTcard]
      · intro u hu w hw
        rcases Finset.mem_insert.mp hu with rfl | hu' <;>
          rcases Finset.mem_insert.mp hw with rfl | hw'
        · exact G.irrefl
        · exact fun hadj => hvadj w hw' hadj.symm
        · exact hvadj u hu'
        · exact hTind u hu' w hw'
      · exact Finset.mem_insert_self v T
    · rintro ⟨S, v⟩ hx
      rw [mem_pairsUp] at hx
      simp [Finset.insert_erase hx.2]
    · rintro ⟨T, v⟩ hy
      rw [mem_pairsDown] at hy
      simp [Finset.erase_insert (mem_ext.mp hy.2).1]
  omega

end DoubleCount

/-! ## Declaration 1 : the bipartite extension ratio bound -/

/--
**Erdos993R2C3.bipartite_extension_ratio_bound.**

Let `G` be a finite simple graph on a finite vertex type `V` which is
**bipartite** (`G.Colorable 2`).  Write `i_k(G) = ind G k` for the number of
independent vertex sets of `G` of cardinality `k` and `α(G) = alpha G` for its
independence number.  Then for every `k` with `0 ≤ k ≤ α(G) − 1`:

  `(k + 1) * i_(k+1)(G) ≤ 2 * (α(G) − k) * i_k(G)`.

The statement is **subtraction-free and division-free**: `α(G) − k` is named
`r + 1` through the witness equation `k + r + 1 = α(G)`, which simultaneously
encodes the index range.  See `bipartite_extension_ratio_bound_literal` for the
equivalent guarded `α(G) − k` reading.

Every degenerate case is a genuine instance, excluded by no hypothesis:
`α(G) = 0` (the range is vacuous), `k = 0` (the bound reads `|V| ≤ 2 α(G)`),
`G` disconnected, `G` edgeless, `V` empty.  Plateaus and zero coefficients are
ordinary instances of the non-strict `≤`.

Bipartiteness is **load-bearing**, not decorative: the identical inequality
fails on `K_3` and on `C_5` (machine-checked in `check/Check.lean`).

NO NOVELTY IS CLAIMED for this statement: the underlying fact is Basit–Galvin
2021 at König–Egerváry scope.
-/
theorem bipartite_extension_ratio_bound (G : SimpleGraph V) [DecidableRel G.Adj]
    (hG : G.Colorable 2) (k r : ℕ) (hkr : k + r + 1 = alpha G) :
    (k + 1) * ind G (k + 1) ≤ 2 * (r + 1) * ind G k := by
  rw [double_count]
  calc ∑ T ∈ indepSets G k, (ext G T).card
      ≤ ∑ _T ∈ indepSets G k, 2 * (r + 1) := by
        refine Finset.sum_le_sum fun T hT => ?_
        obtain ⟨hcard, hindep⟩ := mem_indepSets.mp hT
        exact ext_card_le hG hindep hcard hkr
    _ = 2 * (r + 1) * ind G k := by
        rw [Finset.sum_const, smul_eq_mul, ind, mul_comm]

/-- **Encoding audit.**  The witness form is exactly the literal (guarded,
truncation-free) `α(G) − k` reading of the frozen statement. -/
theorem bipartite_extension_ratio_bound_literal (G : SimpleGraph V) [DecidableRel G.Adj]
    (hG : G.Colorable 2) (k : ℕ) (hk : k < alpha G) :
    (k + 1) * ind G (k + 1) ≤ 2 * (alpha G - k) * ind G k := by
  have h := bipartite_extension_ratio_bound G hG k (alpha G - k - 1) (by omega)
  have h2 : alpha G - k - 1 + 1 = alpha G - k := by omega
  rwa [h2] at h

/-- **Composition bridge.**  The independence vector of a finite bipartite
graph satisfies the Cycle-2 gate's `CBG` condition at `p := α(G)`, so every
governed Cycle-2 declaration applies to it verbatim, with `a_k := i_k(G)` and
no reindexing. -/
theorem bipartite_CBG (G : SimpleGraph V) [DecidableRel G.Adj] (hG : G.Colorable 2) :
    CBG (alpha G) (ind G) :=
  fun k r hkr => bipartite_extension_ratio_bound G hG k r hkr

/-! ## Declaration 2 : the all-forest terminal band -/

/--
**Erdos993R2C3.all_forest_terminal_band.**

Let `F` be a finite **forest**: a finite simple graph with no cycle
(`F.IsAcyclic`).  Put `D := α(F)`.  Then, writing `i_k(F) = ind F k`:

* (a) `i_(k+1)(F) ≤ i_k(F)` for every `k` with `k < D` and `2*D ≤ 3*k + 1`
      (equivalently `k ≥ K(D) = ⌈(2D−1)/3⌉`, the **weak** threshold);
* (b) `i_(k+1)(F) < i_k(F)` whenever `k < D`, `2*D ≤ 3*k` (equivalently
      `k ≥ L_F(D) = ⌈2D/3⌉`, the **strict** threshold) and `i_k(F) > 0`.

The two thresholds are NOT conflated: they differ exactly at `D ≡ 2 (mod 3)`,
see `weak_strict_threshold_ne_of_mod_two`.

The index guard `k < D` is `Erdos993R2C2.cbg_terminal_band`'s disclosed guard,
carried here EXACTLY.  Informally it is harmless (`i_k(F) = 0` for `k > D`) but
in Lean it is load-bearing.

This is `bipartite_extension_ratio_bound` composed with the already-governed
`Erdos993R2C2.cbg_terminal_band` at `a_k := i_k(F)`, `D := α(F)`, using
`SimpleGraph.IsAcyclic.colorable_two` (present in the pinned Mathlib) for the
forest ⟹ bipartite bridge.

NO NOVELTY IS CLAIMED for this statement.
-/
theorem all_forest_terminal_band (F : SimpleGraph V) [DecidableRel F.Adj]
    (hF : F.IsAcyclic) :
    (∀ k, k < alpha F → 2 * alpha F ≤ 3 * k + 1 → ind F (k + 1) ≤ ind F k)
      ∧ (∀ k, k < alpha F → 2 * alpha F ≤ 3 * k → 0 < ind F k → ind F (k + 1) < ind F k) :=
  Erdos993R2C2.cbg_terminal_band (alpha F) (ind F) (bipartite_CBG F hF.colorable_two)

/-- The `ceilBand` presentation of clause (a) of `all_forest_terminal_band`:
`i_(k+1)(F) ≤ i_k(F)` for every `k < D` with `K(D) ≤ k`. -/
theorem all_forest_terminal_band_ceil (F : SimpleGraph V) [DecidableRel F.Adj]
    (hF : F.IsAcyclic) (k : ℕ) (hk : k < alpha F) (hband : ceilBand (alpha F) ≤ k) :
    ind F (k + 1) ≤ ind F k :=
  (all_forest_terminal_band F hF).1 k hk ((weakBand_iff _ _).mp hband)

/-- The `L_F` presentation of clause (b) of `all_forest_terminal_band`. -/
theorem all_forest_terminal_band_strict_ceil (F : SimpleGraph V) [DecidableRel F.Adj]
    (hF : F.IsAcyclic) (k : ℕ) (hk : k < alpha F)
    (hband : (2 * alpha F + 2) / 3 ≤ k) (hpos : 0 < ind F k) :
    ind F (k + 1) < ind F k :=
  (all_forest_terminal_band F hF).2 k hk ((strictBand_iff _ _).mp hband) hpos

/-! ## A self-contained acyclicity criterion for the non-vacuity witnesses

A graph in which every vertex has at most one neighbour is a forest: a cycle at
`v` supplies two DISTINCT neighbours of `v`, namely `p.snd` and
`p.penultimate`. -/

/-- If no vertex of `G` has two distinct neighbours (i.e. `G` has maximum
degree at most one) then `G` is acyclic. -/
theorem isAcyclic_of_adj_unique {W : Type*} {G : SimpleGraph W}
    (h : ∀ v w x : W, G.Adj v w → G.Adj v x → w = x) : G.IsAcyclic := by
  intro v p hp
  exact hp.snd_ne_penultimate
    (h v _ _ (p.adj_snd hp.not_nil) ((p.adj_penultimate hp.not_nil).symm))

end Erdos993R2C3
