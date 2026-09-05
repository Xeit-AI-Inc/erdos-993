import R12C6T.Targets

/-!
# R12C6-T — the `deg(s)=2` stratum attempt (bounded), under the Q6 ruling

**Route: R12C6-T, stage-3, Sonnet 5, xhigh, isolated (H-1-AMD-9 role/effort
line).** Allocation: `control/STUDY-INTERLUDE-2.md` §5, `R12C6-T` — attempt,
in Lean at the pin, (α) restricted to `deg(s) = 2` (equivalently the `C_g`
vs `C_g∖{g}` count-sequence inequality at `k_A = 1`), by FENCE-LEGAL MEANS
ONLY: combinatorial injection and/or the governed deletion-identity layer;
the I/A/B extension-profile split and any subtraction arising from it
UNTOUCHED, checked in proof terms below.

**Digest-verified reads (H-1-AMD-9):** `SOLUTION-CONTRACT.md` 32073203c9df7d07;
`STUDY-INTERLUDE-2.md` a8851e5e6fc5f22a; `C6-DISPATCH-MANIFEST.md`
9bc1e941cc59f096; `FC-R12-12.md` 7f52dd0809fabf91; `REJECTED-MECHANISMS.md`
cf6bd4ea5663f63e; `cycles/cycle-5/C5-GATES.md` 7727fea6ad4efb93 — all
verified byte-prefix-correct before this route began.

**CEILING HONESTY (restated verbatim per contract discipline).**
TREE / FOREST / TRANSFER / COUNTEREXAMPLE are open before this file and
remain open after it. `(α)`, `(β)`, `(A)`, `(B)` are PROOF TARGETS, never
asserted true anywhere below. No bounded zero is evidence of anything.
Nothing in this file is `formally_verified`; the grade ladder tops out at
`governed`, and even that requires the independent dual-rebuild discipline
this single route does not by itself satisfy.

## Fence check (per-object, `C1-AMD-11`) — declared BEFORE any measurement

Nothing below performs, or is preceded by, any computation, `#eval`,
`decide`, or numerical/sampled search: every definition and theorem in
this file is either (a) a pure ingredient-level restatement (no proof
attempted of its truth), or (b) a genuine, fully mechanized Lean proof.
The falsifiable signatures `AlphaTargetDeg2` / `AlphaCounterexampleDeg2`
are declared FIRST, immediately below, before any of the new
infrastructure or reduction theorems that follow — satisfying `C1-AMD-11`'s
ordering requirement vacuously (no measurement occurs in this file at all)
and in spirit (signature before any exploration of the target's truth).

**Mechanism audit.** Every new theorem below is proved by one of exactly
three techniques, none of which touches F1–F12:
1. **The governed deletion-identity layer, generalized.** `indepCountOn_succ`
   and `Delta_eq_A_add_Bgen` (`CorridorIngredients.lean:1294,1411`, both
   consumed, both already documented there as off F10 — "no tree-recursive
   structure … holds for the root or any internal vertex") are stated only
   for the AMBIENT SET `t.vertices`. This file generalizes them, by the
   IDENTICAL bijection/case-split proof, to an ARBITRARY ambient Finset `V`
   (`indepCountOn_succ_on`, `DeltaOn_eq_add_Bgen_on` below) — same
   mechanism, wider domain. This is squarely "the governed deletion-identity
   layer" of the Q6 ruling, not a new mechanism.
2. **Pure combinatorial injection / `Finset` extensionality.** Every
   structural fact about `deg(s)=2` (`OtherNbr`, `closedNbhd_eq_of_deg2`,
   the ambient-set identities) is proved by `ext` + membership unfolding +
   `tauto`/direct case analysis — literal injections/bijections on vertex
   addresses, never a generating-function argument.
3. **Linear rearrangement of already-governed or already-established
   identities** (`omega`), exactly as `alphaCounterexample_iff` and
   `alphaTarget_iff_stmtA_leafWitnessed_kA_eq_one` already do in
   `Targets.lean`.

**F10 not approached anywhere in this file.** No step decomposes any
vertex through its CHILD list (`cs : List RTree`); `RTree.Ipoly_node`,
`RTree.Apoly_node`, `RTree.Bpoly_node` (the I/A/B branch-recursion, F10's
exact locus) are never invoked, never unfolded, and no new claim carries an
inequality across the difference-of-products those recursions produce. The
`v`-isolation argument used throughout (a leaf's ONLY neighbour is its
support, so `v` contributes no adjacency once its support is also removed)
is elementary `Finset`/`addrAdjacent` reasoning, not a generating-function
convolution.

**F1/F2 not approached.** No step invokes, assumes, or concludes
log-concavity, unimodality, or real-rootedness of any sequence or
polynomial, for any tree at any order.

**Q6 boundary check.** No step below relates `C_g` (this file's `W :=
T∖N[v]`, `Bgen_v`'s own ambient set) to `C_g∖{g}` (`W.erase g`) THROUGH the
I/A/B state decomposition, and no inequality is carried across the
`Bpoly_node` difference-of-products. Every relation used is either an
EQUALITY (an identity, proved, not assumed) or, where an inequality finally
appears (`AmbientTargetDeg2`, NOT proved here), it is stated directly
between `Delta`-values of `W` and `W.erase g` with no branch-decomposition
step in between.
-/

open scoped Classical
noncomputable section
namespace RTree

/-! ## §1 — Fresh falsifiable signatures (declared before any measurement) -/

/-- **`AlphaTargetDeg2`: `AlphaTarget` (`Targets.lean`) restricted to
`deg(t.support v) = 2`.** A bare `Prop`, matching `AlphaTarget`'s own
recording convention — NOT ASSERTED, no proof of it is attempted anywhere
in this file. This is `STUDY-INTERLUDE-2.md` §5's `R12C6-T` scope, made
literal: the SAME per-instance conclusion as `AlphaTarget`, with the extra
hypothesis singling out the stratum the Q6 ruling opened. -/
def AlphaTargetDeg2 : Prop :=
  ∀ (t : RTree) (v : List ℕ) (p : ℕ),
    v ∈ t.leaves → t.degree (t.support v) = 2 → K_A t p = 1 → t.a v p < 0 →
      t.a v p + (t.b v p - t.Bgen (t.support v) ((p : ℤ) - 1)) < 0

/-- **The falsifiable signature for `AlphaTargetDeg2`, declared before any
measurement (`C1-AMD-11`).** A single `(t,v,p)` instance satisfying this
predicate is a DECISIVE EVENT (`SOLUTION-CONTRACT.md` §1) — and, via
`alphaCounterexampleDeg2_imp_alphaCounterexample` below, automatically ALSO
an unrestricted `AlphaCounterexample`, so a hit here is decisive against
the FULL target, not merely this stratum. Horizon: identical to
`AlphaCounterexample`'s own (`Targets.lean`) — `EXCEPTIONAL(T,v,p)`'s
smallest known witness order, `n = 11`; `≥ 99.3%` of every such instance
found in this run lies in exactly this stratum
(`C4-ADJUDICATION §4.2`/`REJECTED-MECHANISMS`-adjacent `N3`), so this
signature's natural horizon is the SAME populations already searched, not
a fresh one. -/
def AlphaCounterexampleDeg2 (t : RTree) (v : List ℕ) (p : ℕ) : Prop :=
  v ∈ t.leaves ∧ t.degree (t.support v) = 2 ∧ K_A t p = 1 ∧ t.a v p < 0 ∧
    ¬ (t.a v p + (t.b v p - t.Bgen (t.support v) ((p : ℤ) - 1)) < 0)

/-- **PROVED: `AlphaCounterexampleDeg2` is exactly `AlphaTargetDeg2`'s
per-instance negation, transported to `a_s(p) ≥ 0` terms via the governed
`T1`** — the same content and the same proof shape as `Targets.lean`'s
`alphaCounterexample_iff`, restricted. -/
theorem alphaCounterexampleDeg2_iff (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    (hd2 : t.degree (t.support v) = 2) {p : ℕ} (hk : K_A t p = 1) (ha : t.a v p < 0) :
    AlphaCounterexampleDeg2 t v p ↔ ¬ (t.a (t.support v) p < 0) := by
  have hid := t.a_support_eq_a_add_b_sub_Bgen hv p
  unfold AlphaCounterexampleDeg2
  constructor
  · rintro ⟨-, -, -, -, hslack⟩; omega
  · intro hnot; exact ⟨hv, hd2, hk, ha, by omega⟩

/-- **PROVED: any `AlphaCounterexampleDeg2` instance is in particular an
`AlphaCounterexample`** (dropping the `deg(s)=2` restriction is a pure
weakening of the antecedent). So a counterexample search restricted to
this stratum, had it fired, would have been decisive against the FULL,
unrestricted (α) — not merely against `AlphaTargetDeg2`. -/
theorem alphaCounterexampleDeg2_imp_alphaCounterexample (t : RTree) (v : List ℕ) (p : ℕ) :
    AlphaCounterexampleDeg2 t v p → AlphaCounterexample t v p := by
  rintro ⟨h1, -, h3, h4, h5⟩
  exact ⟨h1, h3, h4, h5⟩

/-- **PROVED: `AlphaTargetDeg2 ↔` its `T1`-transported form.** Identical
proof shape to `Targets.lean`'s `alphaTarget_iff_stmtA_leafWitnessed_kA_eq_one`,
restricted to the extra `deg(s)=2` hypothesis (carried through unchanged on
both sides, since `T1` needs nothing about `s`'s degree). -/
theorem alphaTargetDeg2_iff :
    AlphaTargetDeg2 ↔
      ∀ (t : RTree) (v : List ℕ) (p : ℕ),
        v ∈ t.leaves → t.degree (t.support v) = 2 → K_A t p = 1 → t.a v p < 0 →
          t.a (t.support v) p < 0 := by
  unfold AlphaTargetDeg2
  constructor
  · intro h t v p hv hd2 hk ha
    have hid := t.a_support_eq_a_add_b_sub_Bgen hv p
    have hslack := h t v p hv hd2 hk ha
    omega
  · intro h t v p hv hd2 hk ha
    have hid := t.a_support_eq_a_add_b_sub_Bgen hv p
    have hconcl := h t v p hv hd2 hk ha
    omega

/-- **`OtherNbr t s v g`: `g` is `s`'s neighbour other than `v`.** A pure
ingredient-level relation — no existence or degree claim baked in; existence
and uniqueness under `deg(s)=2` are proved separately
(`exists_unique_otherNbr`). Invariance: a function of `(t,s,v,g)` only,
through `addrAdjacent` and `t.vertices`. -/
def OtherNbr (t : RTree) (s v g : List ℕ) : Prop :=
  g ≠ v ∧ addrAdjacent s g ∧ g ∈ t.vertices

/-- **`AmbientTargetDeg2`: the `deg(s)=2` stratum's own residual target,
stated PURELY in terms of the single ambient `W := T∖N[v]` (`Bgen_v`'s own
domain, identical to `b_v`'s) and its single-vertex deletion at the "other
neighbour" `g`.** No second branch, no `a`, `b`, or `Bgen_s` object
appears. This is the sharpened form `alphaTargetDeg2_iff_ambientTargetDeg2`
(§3 below) proves EQUIVALENT to `AlphaTargetDeg2` — genuinely new content,
not asserted true here, not a target this file discharges. -/
def AmbientTargetDeg2 : Prop :=
  ∀ (t : RTree) (v g : List ℕ) (p : ℕ),
    v ∈ t.leaves → t.degree (t.support v) = 2 → t.OtherNbr (t.support v) v g →
    K_A t p = 1 →
    t.Bgen v (p : ℤ) + t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 →
      t.Bgen v (p : ℤ) + t.Bgen v ((p : ℤ) - 1) < 0

/-! ## §2 — The generalized deletion-identity layer (new infrastructure,
fence-legal per the mechanism audit above: item 1) -/

/-- **Generalized single-vertex-deletion recursion, ambient-set version of
the governed `indepCountOn_succ`.** For ANY ambient `V ⊆ t.vertices` and
`z ∈ V`: `i_{r+1}(V) = i_{r+1}(V∖z) + i_r(V∖N[z])`. Proof: the IDENTICAL
bijection argument as `indepCountOn_succ` (`CorridorIngredients.lean:1294`),
with the ambient generalized from `t.vertices` to `V`. No tree-recursive
(`node cs`) structure is used anywhere in this proof, exactly as in the
consumed original; F10 not approached. -/
theorem indepCountOn_succ_on (t : RTree) {V : Finset (List ℕ)} (hV : V ⊆ t.vertices)
    {z : List ℕ} (hz : z ∈ V) (r : ℕ) :
    t.indepCountOn V (r + 1) =
      t.indepCountOn (V.erase z) (r + 1) + t.indepCountOn (V \ t.closedNbhd z) r := by
  have hzt : z ∈ t.vertices := hV hz
  unfold RTree.indepCountOn
  have hRight :
      (V.powerset.filter (fun S => t.IndepSet S ∧ S.card = r + 1)).filter
          (fun S => z ∉ S) =
        (V.erase z).powerset.filter (fun S => t.IndepSet S ∧ S.card = r + 1) := by
    ext S
    simp only [Finset.mem_filter, Finset.mem_powerset]
    constructor
    · rintro ⟨⟨hsub, hI⟩, hz'⟩
      exact ⟨Finset.subset_erase.mpr ⟨hsub, hz'⟩, hI⟩
    · rintro ⟨hsub, hI⟩
      have hsub' : S ⊆ V := hsub.trans (Finset.erase_subset _ _)
      exact ⟨⟨hsub', hI⟩, (Finset.subset_erase.mp hsub).2⟩
  have hzcn : z ∈ t.closedNbhd z := (mem_closedNbhd_iff t z z).mpr ⟨hzt, Or.inl rfl⟩
  have hLeft :
      ((V.powerset.filter (fun S => t.IndepSet S ∧ S.card = r + 1)).filter
          (fun S => z ∈ S)).card =
        ((V \ t.closedNbhd z).powerset.filter (fun S => t.IndepSet S ∧ S.card = r)).card := by
    apply Finset.card_bij' (fun S _ => S.erase z) (fun S' _ => insert z S')
    · intro S hS
      simp only [Finset.mem_filter, Finset.mem_powerset] at hS
      obtain ⟨⟨-, -, -⟩, hzS⟩ := hS
      exact Finset.insert_erase hzS
    · intro S' hS'
      simp only [Finset.mem_filter, Finset.mem_powerset] at hS'
      obtain ⟨hsub, -, -⟩ := hS'
      have hzS' : z ∉ S' := fun hmem => (Finset.mem_sdiff.mp (hsub hmem)).2 hzcn
      exact Finset.erase_insert hzS'
    · intro S hS
      simp only [Finset.mem_filter, Finset.mem_powerset] at hS
      obtain ⟨⟨hsub, hI, hcardS⟩, hzS⟩ := hS
      have hsubT : S.erase z ⊆ V \ t.closedNbhd z := by
        intro w hw
        have hwS : w ∈ S := Finset.mem_of_mem_erase hw
        have hwz : w ≠ z := Finset.ne_of_mem_erase hw
        have hwv : w ∈ V := hsub hwS
        rw [Finset.mem_sdiff, mem_closedNbhd_iff]
        refine ⟨hwv, ?_⟩
        rintro ⟨-, rfl | hadj⟩
        · exact hwz rfl
        · exact hI.2 z hzS w hwS hadj
      have hIndep : t.IndepSet (S.erase z) := hI.mono (Finset.erase_subset _ _)
      have hcardE : (S.erase z).card = r := by
        rw [Finset.card_erase_of_mem hzS]; omega
      simp only [Finset.mem_filter, Finset.mem_powerset]
      exact ⟨hsubT, hIndep, hcardE⟩
    · intro S' hS'
      simp only [Finset.mem_filter, Finset.mem_powerset] at hS'
      obtain ⟨hsub, hI, hcard⟩ := hS'
      have hzS' : z ∉ S' := fun hmem => (Finset.mem_sdiff.mp (hsub hmem)).2 hzcn
      have hsubV : insert z S' ⊆ V :=
        Finset.insert_subset hz (hsub.trans Finset.sdiff_subset)
      have hIndep : t.IndepSet (insert z S') := by
        refine ⟨hsubV.trans hV, ?_⟩
        intro u hu w hw hadj
        rcases Finset.mem_insert.mp hu with hu0 | hu'
        · rcases Finset.mem_insert.mp hw with hw0 | hw'
          · rw [hu0, hw0] at hadj
            exact absurd hadj (addrAdjacent_irrefl z)
          · have hwmem := Finset.mem_sdiff.mp (hsub hw')
            rw [hu0] at hadj
            exact hwmem.2 ((mem_closedNbhd_iff t z w).mpr ⟨hV hwmem.1, Or.inr hadj⟩)
        · rcases Finset.mem_insert.mp hw with hw0 | hw'
          · have humem := Finset.mem_sdiff.mp (hsub hu')
            rw [hw0] at hadj
            exact humem.2 ((mem_closedNbhd_iff t z u).mpr
              ⟨hV humem.1, Or.inr ((addrAdjacent_comm u z).mp hadj)⟩)
          · exact hI.2 u hu' w hw' hadj
      have hcardI : (insert z S').card = r + 1 := by
        rw [Finset.card_insert_of_notMem hzS', hcard]
      simp only [Finset.mem_filter, Finset.mem_powerset]
      exact ⟨⟨hsubV, hIndep, hcardI⟩, Finset.mem_insert_self z S'⟩
  have hsplit :=
    Finset.card_filter_add_card_filter_not
      (s := V.powerset.filter (fun S => t.IndepSet S ∧ S.card = r + 1))
      (fun S => z ∈ S)
  rw [hRight] at hsplit
  rw [hLeft] at hsplit
  omega

/-- **Generalized single-vertex-deletion recursion, `Delta` form —
ambient-set version of the governed `Delta_eq_A_add_Bgen`.** For ANY
ambient `V ⊆ t.vertices` and `z ∈ V`: `Delta_r(V) = Delta_r(V∖z) +
Delta_{r-1}(V∖N[z])`. Proof: the IDENTICAL case split (`r=0` vs `r=k+1`) as
`Delta_eq_A_add_Bgen`, using `indepCountOn_succ_on` and the already-governed
`indepCountOn_zero` (itself already stated for an arbitrary ambient
`Finset`, needing no generalization). F10 not approached. -/
theorem DeltaOn_eq_add_Bgen_on (t : RTree) {V : Finset (List ℕ)} (hV : V ⊆ t.vertices)
    {z : List ℕ} (hz : z ∈ V) (r : ℕ) :
    t.DeltaOn V r = t.DeltaOn (V.erase z) r + t.DeltaOnZ (V \ t.closedNbhd z) ((r : ℤ) - 1) := by
  unfold RTree.DeltaOn
  rcases r with _ | k
  · have hsucc0 := t.indepCountOn_succ_on hV hz 0
    have hz0V : t.indepCountOn V 0 = 1 := t.indepCountOn_zero V
    have hz0Ve : t.indepCountOn (V.erase z) 0 = 1 := t.indepCountOn_zero (V.erase z)
    have e1 : ((0 : ℕ) : ℤ) - 1 + 1 = (0 : ℤ) := by norm_num
    have e2 : ((0 : ℕ) : ℤ) - 1 < 0 := by norm_num
    unfold RTree.DeltaOnZ
    rw [e1, indepCountOnZ_of_neg _ _ e2]
    have e3 : t.indepCountOnZ (V \ t.closedNbhd z) 0 = t.indepCountOn (V \ t.closedNbhd z) 0 :=
      indepCountOnZ_natCast t (V \ t.closedNbhd z) 0
    rw [e3]
    push_cast [hsucc0, hz0V, hz0Ve]
    ring
  · have hsucc1 := t.indepCountOn_succ_on hV hz (k + 1)
    have hsucc0 := t.indepCountOn_succ_on hV hz k
    have e1 : (((k : ℕ) + 1 : ℕ) : ℤ) - 1 = (k : ℤ) := by push_cast; ring
    rw [e1, DeltaOnZ_natCast]
    unfold RTree.DeltaOn
    push_cast [hsucc1, hsucc0]
    ring

/-! ## §3 — The two general identities, and the `deg(s)=2`-specific
ambient identification (fence-legal per items 1–3 of the mechanism audit) -/

/-- **PROVED (mine, general — no `deg(s)=2` needed): `a_v(p) = Bgen_v(p) +
Bgen_s(p−1)`, for EVERY leaf `v`.** Applies `DeltaOn_eq_add_Bgen_on` at the
ambient `V = T∖v` and the vertex `z = s := t.support v` (well-defined since
`s ≠ v`, from `addrAdjacent_irrefl` applied to `support_adjacent`). Both
resulting ambient sets are identified with the ALREADY-GOVERNED `Bgen_v`
and `Bgen_s` domains by direct `Finset` extensionality — genuinely new
content, but pure deletion-identity/injection reasoning, F10 not
approached. -/
theorem a_eq_Bgen_add_Bgen_support (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves) (p : ℕ) :
    t.a v p = t.Bgen v (p : ℤ) + t.Bgen (t.support v) ((p : ℤ) - 1) := by
  have hvmem : v ∈ t.vertices := (t.mem_leaves_iff v).mp hv |>.1
  have hsmem : t.support v ∈ t.vertices := t.support_mem_vertices hv
  have hadj : addrAdjacent v (t.support v) := t.support_adjacent hv
  have hne : t.support v ≠ v := by
    intro h; rw [h] at hadj; exact addrAdjacent_irrefl v hadj
  have hsV : t.support v ∈ t.vertices.erase v := Finset.mem_erase.mpr ⟨hne, hsmem⟩
  have hrec := t.DeltaOn_eq_add_Bgen_on (Finset.erase_subset v t.vertices) hsV p
  have hFirst : (t.vertices.erase v).erase (t.support v) = t.vertices \ t.closedNbhd v := by
    rw [t.closedNbhd_eq_of_leaf hv]
    ext w
    simp only [Finset.mem_erase, Finset.mem_sdiff, Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hvcns : v ∈ t.closedNbhd (t.support v) := by
    rw [mem_closedNbhd_iff]
    exact ⟨hvmem, Or.inr ((addrAdjacent_comm v (t.support v)).mp hadj)⟩
  have hSecond : (t.vertices.erase v) \ t.closedNbhd (t.support v)
      = t.vertices \ t.closedNbhd (t.support v) := by
    ext w
    simp only [Finset.mem_sdiff, Finset.mem_erase]
    constructor
    · rintro ⟨⟨-, hwt⟩, hns⟩
      exact ⟨hwt, hns⟩
    · rintro ⟨hwt, hns⟩
      refine ⟨⟨?_, hwt⟩, hns⟩
      rintro rfl
      exact hns hvcns
  have hB1 : t.DeltaOn (t.vertices \ t.closedNbhd v) p = t.Bgen v (p : ℤ) :=
    (t.DeltaOnZ_natCast (t.vertices \ t.closedNbhd v) p).symm
  have hLHS : t.a v p = t.DeltaOn (t.vertices.erase v) p := rfl
  have hRHS : t.Bgen (t.support v) ((p : ℤ) - 1)
      = t.DeltaOnZ (t.vertices \ t.closedNbhd (t.support v)) ((p : ℤ) - 1) := rfl
  rw [hFirst, hSecond, hB1] at hrec
  rw [hLHS, hRHS]
  exact hrec

/-- **PROVED (mine, general — no `deg(s)=2` needed): `a_s(p) < 0 ↔
Bgen_v(p) + Bgen_v(p−1) < 0`, for EVERY leaf `v`.** A one-line corollary of
`a_eq_Bgen_add_Bgen_support` composed with the GOVERNED `T1`
(`a_support_eq_a_add_b_sub_Bgen`) and `b_eq_Bgen_of_leaf`: the two
`Bgen_s(p−1)` occurrences cancel by pure linear arithmetic (`omega`). This
shows `a_s(p)<0` is ALWAYS a two-consecutive-rank self-comparison of
`Bgen_v` alone — it is only the HYPOTHESIS `a_v(p)<0` (via
`a_eq_Bgen_add_Bgen_support` again) that, absent `deg(s)=2`, still
references the possibly-multi-branch `Bgen_s(p−1)`. -/
theorem a_support_lt_zero_iff (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves) (p : ℕ) :
    t.a (t.support v) p < 0 ↔ t.Bgen v (p : ℤ) + t.Bgen v ((p : ℤ) - 1) < 0 := by
  have hT1 := t.a_support_eq_a_add_b_sub_Bgen hv p
  have hi := t.a_eq_Bgen_add_Bgen_support hv p
  have hb : t.b v p = t.Bgen v ((p : ℤ) - 1) := t.b_eq_Bgen_of_leaf hv ((p : ℤ) - 1)
  omega

/-- **PROVED: existence and uniqueness of the "other neighbour" `g` of `s`
when `deg(s)=2` and `v` is one known neighbour.** Pure `Finset.card`
bookkeeping: `s`'s neighbour-set has card `2` and contains `v`, so erasing
`v` leaves a card-`1` (hence singleton) set. Combinatorial injection only;
F10 not approached. -/
theorem exists_unique_otherNbr (t : RTree) {s v : List ℕ}
    (hv : v ∈ t.vertices) (hsv : addrAdjacent s v) (hdeg2 : t.degree s = 2) :
    ∃! g, t.OtherNbr s v g := by
  unfold RTree.degree at hdeg2
  have hvNs : v ∈ t.vertices.filter (fun w => addrAdjacent s w) :=
    Finset.mem_filter.mpr ⟨hv, hsv⟩
  have hcard1 : ((t.vertices.filter (fun w => addrAdjacent s w)).erase v).card = 1 := by
    rw [Finset.card_erase_of_mem hvNs, hdeg2]
  obtain ⟨g, hg⟩ := Finset.card_eq_one.mp hcard1
  have hgmem : g ∈ (t.vertices.filter (fun w => addrAdjacent s w)).erase v := by
    rw [hg]; exact Finset.mem_singleton_self g
  have hgNs : g ∈ t.vertices.filter (fun w => addrAdjacent s w) :=
    Finset.mem_of_mem_erase hgmem
  refine ⟨g, ⟨(Finset.mem_erase.mp hgmem).1, (Finset.mem_filter.mp hgNs).2,
      (Finset.mem_filter.mp hgNs).1⟩, ?_⟩
  rintro g' ⟨hne, hadj, hmemv⟩
  have hg'mem : g' ∈ (t.vertices.filter (fun w => addrAdjacent s w)).erase v :=
    Finset.mem_erase.mpr ⟨hne, Finset.mem_filter.mpr ⟨hmemv, hadj⟩⟩
  rw [hg] at hg'mem
  exact Finset.mem_singleton.mp hg'mem

/-- **PROVED: at `deg(s)=2`, `s`'s closed neighbourhood is exactly `{s,v,g}`.**
Pure `Finset` extensionality using the uniqueness half of
`exists_unique_otherNbr`. -/
theorem closedNbhd_eq_of_deg2 (t : RTree) {s v g : List ℕ}
    (hs : s ∈ t.vertices) (hv : v ∈ t.vertices) (hsv : addrAdjacent s v)
    (hOther : t.OtherNbr s v g) (hdeg2 : t.degree s = 2) :
    t.closedNbhd s = {s, v, g} := by
  have huniq := t.exists_unique_otherNbr hv hsv hdeg2
  ext w
  rw [mem_closedNbhd_iff]
  simp only [Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨hwt, rfl | hadj⟩
    · exact Or.inl rfl
    · by_cases hwv : w = v
      · exact Or.inr (Or.inl hwv)
      · exact Or.inr (Or.inr (huniq.unique ⟨hwv, hadj, hwt⟩ hOther))
  · rintro (rfl | rfl | rfl)
    · exact ⟨hs, Or.inl rfl⟩
    · exact ⟨hv, Or.inr hsv⟩
    · exact ⟨hOther.2.2, Or.inr hOther.2.1⟩

/-- **PROVED: at `deg(s)=2`, `T∖N[s] = W∖{g}` where `W := T∖N[v]`** (the
SAME ambient `Bgen_v`/`b_v` already use). This mechanizes the
`[ADJ-VERIFIED]` receipt fact (`C1-ADJUDICATION §1.3`, previously checked
only on `60,340` + `26,018` sampled/enumerated instances) as a genuine
proof, for every tree, not a further bounded zero. Pure `Finset`
extensionality; F10 not approached. -/
theorem vertices_sdiff_closedNbhd_support_eq_of_deg2 (t : RTree) {v : List ℕ}
    (hv : v ∈ t.leaves) {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g)
    (hdeg2 : t.degree (t.support v) = 2) :
    t.vertices \ t.closedNbhd (t.support v) = (t.vertices \ t.closedNbhd v).erase g := by
  have hvmem : v ∈ t.vertices := (t.mem_leaves_iff v).mp hv |>.1
  have hsmem : t.support v ∈ t.vertices := t.support_mem_vertices hv
  have hsv : addrAdjacent (t.support v) v :=
    (addrAdjacent_comm v (t.support v)).mp (t.support_adjacent hv)
  rw [t.closedNbhd_eq_of_deg2 hsmem hvmem hsv hOther hdeg2, t.closedNbhd_eq_of_leaf hv]
  ext w
  simp only [Finset.mem_sdiff, Finset.mem_insert, Finset.mem_singleton, Finset.mem_erase]
  tauto

/-- **PROVED (mine, the `deg(s)=2`-specific reduction): `a_v(p) = Bgen_v(p)
+ Delta_{p−1}(W∖g)`, where `W := T∖N[v]`.** Combines
`a_eq_Bgen_add_Bgen_support` (general) with
`vertices_sdiff_closedNbhd_support_eq_of_deg2` (`deg(s)=2`-specific): the
ONLY place `deg(s)=2` enters this file's identities, since only there does
`T∖N[s]` collapse to a SINGLE-vertex deletion of `W` rather than a
multi-branch one. This is the precise mechanization of `N3`'s "(α) reduces
exactly to [a] count-sequence [relation]" (`C4-ADJUDICATION §1.5`),
now fully explicit and eliminating `s`/`Bgen_s` as separate objects. -/
theorem a_eq_deltaOn_of_deg2 (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g)
    (hdeg2 : t.degree (t.support v) = 2) (p : ℕ) :
    t.a v p = t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) := by
  have h1 := t.a_eq_Bgen_add_Bgen_support hv p
  have h2 : t.Bgen (t.support v) ((p : ℤ) - 1)
      = t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) := by
    unfold RTree.Bgen
    rw [t.vertices_sdiff_closedNbhd_support_eq_of_deg2 hv hOther hdeg2]
  rw [h1, h2]

/-! ## §4 — The main reduction theorem -/

/-- **THE `deg(s)=2` REDUCTION THEOREM (mine, the deliverable of this
route): `AlphaTargetDeg2 ↔ AmbientTargetDeg2`.** Every occurrence of `s`,
`a_v`, `b_v`, and `Bgen_s` is eliminated in favour of `Bgen_v` (`= Delta`
of `W := T∖N[v]`) and `Delta` of `W∖{g}` alone. Genuinely new,
mechanically verified content: it shows the `deg(s)=2` stratum's entire
difficulty is a statement about ONE tree-derived object (`W`) and a single
distinguished vertex within it (`g`), not a THREE-way relation among `s`,
`v`, and a separately-tracked branch. Proved by pure substitution
(`a_eq_deltaOn_of_deg2`, `a_support_lt_zero_iff`) and linear rearrangement
(`omega`); F10 not approached anywhere; the I/A/B split is never unfolded.

**NOT ASSERTED: neither `AlphaTargetDeg2` nor `AmbientTargetDeg2` is
claimed true.** `AmbientTargetDeg2` remains exactly as open as
`AlphaTargetDeg2` was before this theorem — this is a REFORMULATION, not a
proof, of the residual target. The genuinely hard case (where the naive
bound `Delta_{p-1}(W) ≤ Delta_{p-1}(W∖g)` fails, i.e. exactly the
`EXCEPTIONAL` population) is exactly `AmbientTargetDeg2`'s non-vacuous
content; this file does not attempt it further. -/
theorem alphaTargetDeg2_iff_ambientTargetDeg2 : AlphaTargetDeg2 ↔ AmbientTargetDeg2 := by
  rw [alphaTargetDeg2_iff]
  constructor
  · intro hA t v g p hv hdeg2 hOther hk hlt
    have he := t.a_eq_deltaOn_of_deg2 hv hOther hdeg2 p
    have hav : t.a v p < 0 := by omega
    have hconcl := hA t v p hv hdeg2 hk hav
    have hiff := t.a_support_lt_zero_iff hv p
    omega
  · intro hR t v p hv hdeg2 hk hav
    obtain ⟨g, hOther, -⟩ :=
      t.exists_unique_otherNbr ((t.mem_leaves_iff v).mp hv).1
        ((addrAdjacent_comm v (t.support v)).mp (t.support_adjacent hv)) hdeg2
    have he := t.a_eq_deltaOn_of_deg2 hv hOther hdeg2 p
    have hlt : t.Bgen v (p : ℤ) +
        t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 := by omega
    have hres := hR t v g p hv hdeg2 hOther hk hlt
    have hiff := t.a_support_lt_zero_iff hv p
    omega

end RTree
end
