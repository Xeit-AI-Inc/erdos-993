import R12C6T.Deg2Reduction

/-!
# R14C1-F — `AmbientTargetDeg2`: signature, fence check, residual split, tractable strata

**Route: R14C1-F, stage-3, Opus 5, high, isolated (AMD-9 role/effort line;
exact resolved model identifier `claude-opus-5[1m]`, reported in the
accompanying `.md` deliverable).** Allocation: `control/CYCLE1-ALLOCATION.md`
§`R14C1-F`.

**Digest-verified reads (all checked byte-prefix-correct BEFORE this route
began):** `SOLUTION-CONTRACT.md` `9ecb7e27f11a765a`;
`control/CYCLE1-ALLOCATION.md` `8c902236280630e4`;
`control/C1-DISPATCH-MANIFEST.md` `4e488fd0c663519d`;
`control/REJECTED-MECHANISMS.md` `9f0de9aeb482c718`. Lean cache manifest
`52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` verified
before and after every compile.

**CEILING HONESTY (restated verbatim per contract discipline).**
TREE / FOREST / TRANSFER / COUNTEREXAMPLE are open before this file and remain
open after it. `AmbientTargetDeg2`, `(α)`, `(β)`, `(A)`, `(B)` are PROOF
TARGETS, never asserted true anywhere below. `AmbientTargetDeg2` is NOT proved
here; what is proved is an exact split of it into a per-instance residual, plus
the discharge of the strata on which that residual is forced non-positive by
rank/cardinality degeneracy alone. No bounded zero is evidence of anything.
The forest corollaries are not touched here. Nothing in this file is
`formally_verified`; the grade ladder tops out at `governed`, and this route
claims only `RG`.

## Fence check (per-object, `C1-AMD-11`) — declared BEFORE any measurement

No computation, `#eval`, `decide`, `native_decide`, numerical search, or
sampling occurs anywhere in this file or in this route. Every declaration is
either (a) a pure ingredient-level definition, or (b) a fully mechanized proof.
The falsifiable signatures `AmbientCounterexampleDeg2` and
`ResidualObstruction` are declared FIRST, in §1, before any infrastructure or
strata theorem — satisfying `C1-AMD-11`'s ordering requirement in spirit, and
vacuously (no measurement occurs at all).

**Mechanism audit — every new theorem below uses exactly one of three
techniques, none of which touches F1–F12 of `REJECTED-MECHANISMS.md`:**

1. **The governed deletion-identity layer, CONSUMED not re-derived.** The
   single engine of §3 is `R12C6T.Deg2Reduction.DeltaOn_eq_add_Bgen_on`
   (sealed r12, consumed verbatim through the read-only source path; itself
   documented there as the ambient generalization of the governed
   `Delta_eq_A_add_Bgen`, and documented off F10). This file applies it at
   ONE new instance — ambient `W := T∖N[v]`, deleted vertex `g` — and does
   not restate, re-prove, or vary it.
2. **Pure `Finset` extensionality / cardinality bookkeeping.**
   `otherNbr_mem_ambient`, `residualAmbient_subset_erase`, `ambient_card`,
   `one_le_indepCountOn_one` are `ext`/membership-unfolding/`card` arguments
   on vertex addresses — literal injections, never a generating-function
   argument.
3. **Linear rearrangement of already-established identities** (`omega`),
   exactly as `alphaCounterexample_iff`, `alphaTargetDeg2_iff`, and
   `alphaTargetDeg2_iff_ambientTargetDeg2` already do in the consumed
   modules.

**RESERVED ZONE UNTOUCHED, verified in proof terms.** The Q1–Q6 boundary of
record forbids I/A/B state-split recursion and any inequality carried across
its subtraction. No proof below mentions, unfolds, or invokes
`RTree.Ipoly_node`, `RTree.Apoly_node`, `RTree.Bpoly_node`, `RTree.Ipoly`,
`RTree.Apoly`, `RTree.Bpoly`, `RTree.Fpoly`, `toPieces`, `fromPieces`, or any
`cs : List RTree` child-list decomposition. No claim below carries an
inequality across a `Bpoly_node` difference-of-products. `C7BBgenBound`'s
inequality core is neither used nor approached. The one place an inequality
crosses a subtraction at all is `deltaOnZ_nonpos_of_card_le`, where the
subtraction is `i_{r+1}(V) − i_r(V)` — the DEFINITION of `DeltaOn`, on a
single ambient set, with the leading term proved literally `0` by
cardinality; this is a disjoint-union-free counting fact, explicitly legal
("non-I/A/B derivations are legal") and not the reserved subtraction.

**F1/F2 not approached.** No step invokes, assumes, or concludes
log-concavity, unimodality, or real-rootedness of any sequence or polynomial,
for any tree at any order. In particular §4 deliberately does NOT argue "the
count sequence of `U` is past its mode, hence `Δ ≤ 0`" — that argument is
exactly F1/F2 and is refused; every stratum discharged below is discharged by
rank/cardinality degeneracy alone.

**F10 not approached.** No step decomposes any vertex through its child list;
the `v`/`g`-isolation reasoning is elementary `Finset`/`addrAdjacent`
reasoning on the ambient sets, not a convolution.

**Invariance statements.** `ResidualAmbient` is a function of `(t, v, g)` only,
through `t.vertices` and `t.closedNbhd` (each already documented as a function
of its own arguments only), hence a function of the isomorphism class of the
labelled triple. `AmbientCounterexampleDeg2` and `ResidualObstruction` are
functions of `(t, v, g, p)` only, through already-governed objects.

## A16 two-field scoreboard

- **Field 1 (what is mechanically proved):** the exact residual split of
  `AmbientTargetDeg2` (`ambient_split`, `ambientInstance_iff`); the
  sufficiency of residual non-positivity (`ambientTargetDeg2_of_residual_nonpos`);
  `K_A = 1 ⟹ 2 ≤ p` (`two_le_of_K_A_eq_one`, via `one_le_crossingIndex`);
  the cardinality stratum (`deltaOnZ_nonpos_of_card_le` and its instances);
  the necessity of a strictly positive residual at any counterexample
  (`ambientCounterexampleDeg2_imp_residualObstruction`); and the decisive-event
  transport into the governed `AlphaCounterexample`.
- **Field 2 (what is NOT proved, and remains exactly as open as before):**
  `AmbientTargetDeg2` itself; `AlphaTargetDeg2`; (α), (β), (A), (B); the sign
  of the residual `Δ_{p−2}(T∖N[v]∖N[g])` on the stratum where
  `p − 2 < |T∖N[v]∖N[g]|` — which is the generic stratum and carries the
  entire remaining difficulty.

## Item-6 declaration (Master Ledger digest at consume time)

This route consumed NO Master Ledger digest of its own: its inputs are the four
digest-pinned control artifacts named above plus the sealed r12 Lean sources
consumed by read-only source path. The r12 sources are consumed, never edited
and never copied; the sealed tree is not written to by this build (build
artifacts are written only under this route's own `.lake/`). On any drift
between the consumed sources and their sealed digests, the correct action is
quarantine-and-propose, never reconcile.
-/

open scoped Classical
noncomputable section
namespace RTree

/-! ## §1 — Fresh falsifiable signatures (declared BEFORE any measurement) -/

/-- **The falsifiable signature for `AmbientTargetDeg2`, declared before any
measurement (`C1-AMD-11`).** A single `(t,v,g,p)` instance satisfying this
predicate is a DECISIVE EVENT (`SOLUTION-CONTRACT.md` §1) — and, via
`ambientCounterexampleDeg2_imp_alphaCounterexample` below, automatically ALSO
an unrestricted `AlphaCounterexample`, so a hit here is decisive against the
FULL (α), not merely against this stratum. Horizon: identical to
`AlphaCounterexampleDeg2`'s own (`Deg2Reduction.lean`) — the `EXCEPTIONAL`
population, smallest known witness order `n = 11`, together with the mandatory
Kadrawi–Levit fixtures at orders 26–34.

**NOT ASSERTED to be satisfiable, and NOT asserted to be unsatisfiable.** This
is a signature, not a claim. No search against it is performed by this route
(that is `R14C1-H`'s duty); the absence of a search is recorded here as
absence, never as a status. -/
def AmbientCounterexampleDeg2 (t : RTree) (v g : List ℕ) (p : ℕ) : Prop :=
  v ∈ t.leaves ∧ t.degree (t.support v) = 2 ∧ t.OtherNbr (t.support v) v g ∧
    K_A t p = 1 ∧
    t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 ∧
    ¬ (t.Bgen v (p : ℤ) + t.Bgen v ((p : ℤ) - 1) < 0)

/-- **`ResidualAmbient t v g := (T ∖ N[v]) ∖ N[g]`.** The doubly-deleted
ambient set this route isolates as carrying the whole residual difficulty.
A pure ingredient-level definition: no existence, sign, or cardinality claim
is baked in. Invariance: a function of `(t, v, g)` only, through `t.vertices`
and `t.closedNbhd`. -/
def ResidualAmbient (t : RTree) (v g : List ℕ) : Finset (List ℕ) :=
  (t.vertices \ t.closedNbhd v) \ t.closedNbhd g

/-- **The falsifiable signature for THIS ROUTE'S PROOF STRATEGY (as opposed to
for the target), declared before any measurement.** An instance of
`ResidualObstruction` is an instance where `AmbientTargetDeg2`'s hypothesis
holds but the residual `Δ_{p−2}(ResidualAmbient)` is strictly positive — i.e.
where the split of §3 does not by itself close the target. This is NOT a
counterexample to `AmbientTargetDeg2` (the target may still hold there for
other reasons); it is precisely the falsifier of the *sufficient condition*
this route proves.

`ambientCounterexampleDeg2_imp_residualObstruction` below proves the sharp
containment: every `AmbientCounterexampleDeg2` is a `ResidualObstruction`.
Hence a search for target counterexamples may be restricted, with no loss,
to the `ResidualObstruction` population — a genuine narrowing of the
falsifier's search space, handed to `R14C1-H`. **Not asserted satisfiable or
unsatisfiable; no search performed here.** -/
def ResidualObstruction (t : RTree) (v g : List ℕ) (p : ℕ) : Prop :=
  v ∈ t.leaves ∧ t.degree (t.support v) = 2 ∧ t.OtherNbr (t.support v) v g ∧
    K_A t p = 1 ∧
    t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 ∧
    0 < t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2)

/-- **PROVED: the signature is the exact negation of the target.** Nothing
about whether either side holds. -/
theorem not_ambientTargetDeg2_iff_exists_counterexample :
    ¬ AmbientTargetDeg2 ↔
      ∃ (t : RTree) (v g : List ℕ) (p : ℕ), AmbientCounterexampleDeg2 t v g p := by
  unfold AmbientTargetDeg2 AmbientCounterexampleDeg2
  constructor
  · intro h
    push_neg at h
    obtain ⟨t, v, g, p, h1, h2, h3, h4, h5, h6⟩ := h
    exact ⟨t, v, g, p, h1, h2, h3, h4, h5, by omega⟩
  · rintro ⟨t, v, g, p, h1, h2, h3, h4, h5, h6⟩ hall
    exact h6 (hall t v g p h1 h2 h3 h4 h5)

/-! ## §2 — Elementary well-formedness: `K_A = 1` forces `2 ≤ p` -/

/-- On any ambient set containing a `t`-vertex, there is at least one
independent set of size `1`. Pure `Finset` witness exhibition; the singleton
is independent because no address is `addrAdjacent` to itself (the consumed
`addrAdjacent_irrefl`). -/
theorem one_le_indepCountOn_one (t : RTree) {V : Finset (List ℕ)} {z : List ℕ}
    (hz : z ∈ V) (hzt : z ∈ t.vertices) : 1 ≤ t.indepCountOn V (0 + 1) := by
  unfold RTree.indepCountOn
  apply Finset.card_pos.mpr
  refine ⟨{z}, ?_⟩
  simp only [Finset.mem_filter, Finset.mem_powerset]
  refine ⟨Finset.singleton_subset_iff.mpr hz,
    ⟨Finset.singleton_subset_iff.mpr hzt, ?_⟩, ?_⟩
  · intro u hu w hw
    rw [Finset.mem_singleton] at hu hw
    rw [hu, hw]
    exact addrAdjacent_irrefl z
  · simp

/-- `Δ_0(V) ≥ 0` on any ambient set containing a `t`-vertex: `i_1(V) ≥ 1 =
i_0(V)`. No tree structure used. -/
theorem DeltaOn_zero_nonneg (t : RTree) {V : Finset (List ℕ)} {z : List ℕ}
    (hz : z ∈ V) (hzt : z ∈ t.vertices) : 0 ≤ t.DeltaOn V 0 := by
  unfold RTree.DeltaOn
  have h1 : t.indepCountOn V 0 = 1 := t.indepCountOn_zero V
  have h2 : 1 ≤ t.indepCountOn V (0 + 1) := t.one_le_indepCountOn_one hz hzt
  omega

/-- **PROVED: `1 ≤ x(T)` for every `RTree`.** Every `RTree` has at least the
root as a vertex, so `Δ_0(T) = i_1(T) − 1 ≥ 0`, so rank `0` is not in the set
whose `sInf` defines `crossingIndex`. Elementary, but load-bearing: it is what
rules out the degenerate low ranks in §4 and what makes the residual rank
`p − 2` a genuine natural number. -/
theorem one_le_crossingIndex (t : RTree) : 1 ≤ t.crossingIndex := by
  rcases Nat.eq_zero_or_pos t.crossingIndex with h | h
  · exfalso
    have hspec := t.crossingIndex_spec
    rw [h] at hspec
    have hnn := t.DeltaOn_zero_nonneg t.root_mem_vertices t.root_mem_vertices
    unfold RTree.Delta at hspec
    omega
  · omega

/-- **PROVED: the `k_A = 1` hypothesis of `AmbientTargetDeg2` forces `2 ≤ p`.**
`k_A = p − x(T) = 1` and `x(T) ≥ 1`. Consequently the residual rank `p − 2`
below is a genuine natural number, and the two degenerate ranks `p ∈ {0, 1}`
never arise inside the target — an honest scoping fact, not a bounded zero. -/
theorem two_le_of_K_A_eq_one (t : RTree) {p : ℕ} (hk : K_A t p = 1) : 2 ≤ p := by
  unfold RTree.K_A at hk
  have h := t.one_le_crossingIndex
  omega

/-! ## §3 — The residual split (the deliverable identity)

The single application of the CONSUMED governed deletion identity
`DeltaOn_eq_add_Bgen_on` at ambient `W := T∖N[v]` and deleted vertex `g`. -/

/-- **PROVED: the "other neighbour" `g` lies in `W := T∖N[v]`.** `g ≠ v` by
`OtherNbr`, and `g ≠ s := t.support v` because `g` is `addrAdjacent` to `s`
and no address is adjacent to itself; `N[v] = {v, s}` for a leaf (consumed
`closedNbhd_eq_of_leaf`). Pure membership unfolding. -/
theorem otherNbr_mem_ambient (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) :
    g ∈ t.vertices \ t.closedNbhd v := by
  obtain ⟨hgv, hadj, hgt⟩ := hOther
  rw [Finset.mem_sdiff]
  refine ⟨hgt, ?_⟩
  intro hmem
  rw [t.closedNbhd_eq_of_leaf hv] at hmem
  simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
  rcases hmem with h | h
  · exact hgv h
  · rw [h] at hadj
    exact addrAdjacent_irrefl (t.support v) hadj

/-- **THE RESIDUAL SPLIT (mine, the deliverable identity of this route):**
`Δ_{p−1}(W) = Δ_{p−1}(W∖g) + Δ_{p−2}(W∖N[g])`, where `W := T∖N[v]` is
`Bgen_v`'s own ambient set. A single instantiation of the CONSUMED governed
`DeltaOn_eq_add_Bgen_on` at `(V, z) := (W, g)` — no new mechanism, no
re-derivation, no branch decomposition. Needs only `1 ≤ p` (to convert the
`ℤ`-indexed `Bgen` back to the `ℕ`-indexed `DeltaOn` the consumed identity is
stated at); `2 ≤ p` is supplied automatically inside the target by
`two_le_of_K_A_eq_one`. -/
theorem ambient_split (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) {p : ℕ} (hp : 1 ≤ p) :
    t.Bgen v ((p : ℤ) - 1) =
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1)
        + t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) := by
  obtain ⟨k, rfl⟩ : ∃ k, p = k + 1 := ⟨p - 1, by omega⟩
  have hgW : g ∈ t.vertices \ t.closedNbhd v := t.otherNbr_mem_ambient hv hOther
  have hrec := t.DeltaOn_eq_add_Bgen_on (Finset.sdiff_subset) hgW k
  have hc1 : ((k + 1 : ℕ) : ℤ) - 1 = (k : ℤ) := by push_cast; ring
  have hc2 : ((k + 1 : ℕ) : ℤ) - 2 = (k : ℤ) - 1 := by push_cast; ring
  unfold RTree.Bgen RTree.ResidualAmbient
  rw [hc1, hc2, t.DeltaOnZ_natCast, t.DeltaOnZ_natCast]
  exact hrec

/-- **PROVED: the EXACT per-instance gap.** `AmbientTargetDeg2`'s conclusion at
an instance is EQUIVALENT to its own hypothesis-quantity plus the residual
being negative. This is an equivalence, not a bound: it loses nothing. -/
theorem ambientInstance_iff (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) {p : ℕ} (hp : 1 ≤ p) :
    (t.Bgen v (p : ℤ) + t.Bgen v ((p : ℤ) - 1) < 0) ↔
      (t.Bgen v (p : ℤ) +
        t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1)
          + t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) < 0) := by
  rw [t.ambient_split hv hOther hp]
  constructor <;> intro h <;> omega

/-- **PROVED: residual non-positivity is SUFFICIENT, per instance.** Given
`AmbientTargetDeg2`'s own hypothesis (which is `≤ −1` as an integer), any
residual `≤ 0` closes the instance. -/
theorem ambientInstance_of_residual_nonpos (t : RTree) {v : List ℕ}
    (hv : v ∈ t.leaves) {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g)
    {p : ℕ} (hp : 1 ≤ p)
    (hhyp : t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0)
    (hres : t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) ≤ 0) :
    t.Bgen v (p : ℤ) + t.Bgen v ((p : ℤ) - 1) < 0 := by
  rw [t.ambient_split hv hOther hp]
  omega

/-- **THE EXACT GAP STATEMENT, at the level of the target itself.**
`AmbientTargetDeg2` follows from — and this route reduces it entirely to —
the single residual sign condition `Δ_{p−2}(T∖N[v]∖N[g]) ≤ 0` on the
hypothesis population. **`AmbientTargetDeg2` is NOT asserted**: this theorem
is an implication whose antecedent is itself unproved and, on the generic
stratum, unattempted. -/
theorem ambientTargetDeg2_of_residual_nonpos
    (H : ∀ (t : RTree) (v g : List ℕ) (p : ℕ),
      v ∈ t.leaves → t.degree (t.support v) = 2 → t.OtherNbr (t.support v) v g →
      K_A t p = 1 →
      t.Bgen v (p : ℤ) +
        t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 →
        t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) ≤ 0) :
    AmbientTargetDeg2 := by
  intro t v g p hv hd2 hOther hk hhyp
  have hp : 1 ≤ p := by have h := t.two_le_of_K_A_eq_one hk; omega
  exact t.ambientInstance_of_residual_nonpos hv hOther hp hhyp
    (H t v g p hv hd2 hOther hk hhyp)

/-! ## §4 — The tractable strata

Each stratum is discharged by rank/cardinality degeneracy ALONE. No stratum
below is discharged by a unimodality, log-concavity, or "past the mode"
argument — those are F1/F2 and are refused. -/

/-- **PROVED (the cardinality stratum): if `|V| ≤ p − 2` then
`Δ_{p−2}(V) ≤ 0`.** At rank `p − 2 ≥ |V|` the leading count `i_{p−1}(V)` is
literally `0` (no subset of `V` is that large — the consumed
`indepCountOn_eq_zero_of_card_lt`), so `Δ_{p−2}(V) = −i_{p−2}(V) ≤ 0`.

This is a structural vanishing, not a bounded zero: `i_{p−1}(V) = 0` is proved
for every `V` and every `p` in the stated range, by cardinality, not observed
on any enumerated population. -/
theorem deltaOnZ_nonpos_of_card_le (t : RTree) (V : Finset (List ℕ)) {p : ℕ}
    (hp : 2 ≤ p) (hcard : V.card ≤ p - 2) :
    t.DeltaOnZ V ((p : ℤ) - 2) ≤ 0 := by
  obtain ⟨k, rfl⟩ : ∃ k, p = k + 2 := ⟨p - 2, by omega⟩
  have hc : V.card ≤ k := by omega
  have hcast : ((k + 2 : ℕ) : ℤ) - 2 = (k : ℤ) := by push_cast; ring
  rw [hcast, t.DeltaOnZ_natCast]
  unfold RTree.DeltaOn
  have hzero : t.indepCountOn V (k + 1) = 0 :=
    t.indepCountOn_eq_zero_of_card_lt V (by omega)
  omega

/-- **STRATUM S1 (cardinality/rank degeneracy).** Any instance whose residual
ambient set is no larger than the residual rank is closed outright. -/
theorem ambientInstance_of_card_le (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) {p : ℕ}
    (hk : K_A t p = 1)
    (hhyp : t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0)
    (hcard : (t.ResidualAmbient v g).card ≤ p - 2) :
    t.Bgen v (p : ℤ) + t.Bgen v ((p : ℤ) - 1) < 0 := by
  have hp2 : 2 ≤ p := t.two_le_of_K_A_eq_one hk
  exact t.ambientInstance_of_residual_nonpos hv hOther (by omega) hhyp
    (t.deltaOnZ_nonpos_of_card_le _ hp2 hcard)

/-- **STRATUM S2 (`g` dominates the ambient set — the star/broom remnant).**
If `N[g] ⊇ W`, i.e. the residual ambient set is empty, the instance is closed.
This is the exact stratum in which `T` is a broom/spider whose hub `g` is
adjacent to every surviving vertex — the "star branch remnant" of the
allocation. Immediate from S1, since `2 ≤ p`. -/
theorem ambientInstance_of_residual_empty (t : RTree) {v : List ℕ}
    (hv : v ∈ t.leaves) {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g)
    {p : ℕ} (hk : K_A t p = 1)
    (hhyp : t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0)
    (hempty : t.ResidualAmbient v g = ∅) :
    t.Bgen v (p : ℤ) + t.Bgen v ((p : ℤ) - 1) < 0 := by
  refine t.ambientInstance_of_card_le hv hOther hk hhyp ?_
  rw [hempty]
  simp

/-- **PROVED: the residual ambient set sits inside `W∖g`.** Consequently
`|ResidualAmbient| ≤ |W| − 1`, which is what turns the abstract cardinality
stratum S1 into the concrete order-vs-rank stratum S3 below. -/
theorem residualAmbient_subset_erase (t : RTree) (v : List ℕ) {g : List ℕ}
    (hgt : g ∈ t.vertices) :
    t.ResidualAmbient v g ⊆ (t.vertices \ t.closedNbhd v).erase g := by
  intro w hw
  unfold RTree.ResidualAmbient at hw
  rw [Finset.mem_sdiff] at hw
  refine Finset.mem_erase.mpr ⟨?_, hw.1⟩
  intro hwg
  apply hw.2
  rw [t.mem_closedNbhd_iff]
  refine ⟨?_, Or.inl hwg⟩
  rw [hwg]
  exact hgt

/-- **PROVED: `|W| = n − 2` for `W := T∖N[v]` at a leaf `v`.** `N[v] = {v, s}`
with `v ≠ s`. Pure cardinality bookkeeping; this is what lets the stratum map
be read directly in terms of the tree's order `n` and the crossing index. -/
theorem ambient_card (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves) :
    (t.vertices \ t.closedNbhd v).card = t.vertices.card - 2 := by
  have hvm : v ∈ t.vertices := ((t.mem_leaves_iff v).mp hv).1
  have hsm : t.support v ∈ t.vertices := t.support_mem_vertices hv
  have hne : v ≠ t.support v := by
    intro h
    have hadj := t.support_adjacent hv
    rw [← h] at hadj
    exact addrAdjacent_irrefl v hadj
  rw [t.closedNbhd_eq_of_leaf hv]
  have hsub : (insert v {t.support v} : Finset (List ℕ)) ⊆ t.vertices := by
    intro w hw
    simp only [Finset.mem_insert, Finset.mem_singleton] at hw
    rcases hw with h | h
    · rw [h]; exact hvm
    · rw [h]; exact hsm
  rw [Finset.card_sdiff]
  congr 1
  rw [Finset.inter_eq_left.mpr hsub,
    Finset.card_insert_of_notMem (by simpa using hne), Finset.card_singleton]

/-- **STRATUM S3 (small ambient set, stated in the tree's order).** If the
tree's order `n` satisfies `n ≤ p + 1` — equivalently, by
`two_le_of_K_A_eq_one`, `n ≤ x(T) + 2` — then the residual ambient set has at
most `n − 3 ≤ p − 2` elements and the instance is closed. This is the
allocation's "small `|W|`" stratum, made exact. -/
theorem ambientInstance_of_order_le (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) {p : ℕ}
    (hk : K_A t p = 1)
    (hhyp : t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0)
    (horder : t.vertices.card ≤ p + 1) :
    t.Bgen v (p : ℤ) + t.Bgen v ((p : ℤ) - 1) < 0 := by
  refine t.ambientInstance_of_card_le hv hOther hk hhyp ?_
  have hsub := t.residualAmbient_subset_erase v hOther.2.2
  have hle : (t.ResidualAmbient v g).card
      ≤ ((t.vertices \ t.closedNbhd v).erase g).card := Finset.card_le_card hsub
  have hgW : g ∈ t.vertices \ t.closedNbhd v := t.otherNbr_mem_ambient hv hOther
  have herase : ((t.vertices \ t.closedNbhd v).erase g).card
      = (t.vertices \ t.closedNbhd v).card - 1 := Finset.card_erase_of_mem hgW
  have hW := t.ambient_card hv
  omega

/-! ## §5 — The falsifier narrowing (handed to `R14C1-H`) -/

/-- **PROVED: every `AmbientTargetDeg2` counterexample has a strictly positive
residual.** The containment is sharp in the useful direction: a search for
target counterexamples may be restricted, with NO loss, to instances where
`Δ_{p−2}(T∖N[v]∖N[g]) > 0`. Immediate from the residual split.

This narrows the falsifier's search space without asserting anything about
whether either population is nonempty. -/
theorem ambientCounterexampleDeg2_imp_residualObstruction (t : RTree)
    (v g : List ℕ) (p : ℕ) :
    AmbientCounterexampleDeg2 t v g p → ResidualObstruction t v g p := by
  rintro ⟨hv, hd2, hOther, hk, hhyp, hnot⟩
  have hp2 : 2 ≤ p := t.two_le_of_K_A_eq_one hk
  have hs := t.ambient_split hv hOther (by omega : 1 ≤ p)
  exact ⟨hv, hd2, hOther, hk, hhyp, by omega⟩

/-- **PROVED: the decisive-event transport.** Any `AmbientCounterexampleDeg2`
instance is automatically an unrestricted `AlphaCounterexample` — via the
consumed `a_eq_deltaOn_of_deg2`, `a_support_lt_zero_iff`,
`alphaCounterexampleDeg2_iff`, and
`alphaCounterexampleDeg2_imp_alphaCounterexample`, all sealed r12, all used
unchanged. So a hit on this route's signature is decisive against the FULL
(α), and is a HALT-AND-REPORT event under `SOLUTION-CONTRACT.md` §1. -/
theorem ambientCounterexampleDeg2_imp_alphaCounterexample (t : RTree)
    (v g : List ℕ) (p : ℕ) :
    AmbientCounterexampleDeg2 t v g p → AlphaCounterexample t v p := by
  rintro ⟨hv, hd2, hOther, hk, hhyp, hnot⟩
  have he := t.a_eq_deltaOn_of_deg2 hv hOther hd2 p
  have hav : t.a v p < 0 := by omega
  have hiff := t.a_support_lt_zero_iff hv p
  have hns : ¬ (t.a (t.support v) p < 0) := fun hc => hnot (hiff.mp hc)
  exact t.alphaCounterexampleDeg2_imp_alphaCounterexample v p
    ((t.alphaCounterexampleDeg2_iff hv hd2 hk hav).mpr hns)

end RTree
end
