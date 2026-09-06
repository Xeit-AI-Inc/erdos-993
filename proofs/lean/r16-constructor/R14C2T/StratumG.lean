import R14C1F.AmbientStrata

/-!
# R14C2-T — stratum `G`: the crossing-index trichotomy, and the exact scope of
the P1-onto-`U` handle

**Route: `R14C2-T`, r14 Cycle 2, stage-3, isolated (AMD-9 role/effort line;
exact resolved model identifier `claude-opus-5[1m]`, effort `high`, reported in
the accompanying `.md` deliverable).** Allocation:
`control/CYCLE2-ALLOCATION.md` §`R14C2-T`. Frame of record: `control/FC-R14-1.md`.

**Digest-verified reads (all nine `C2-DISPATCH-MANIFEST.md` pins checked
byte-prefix-correct BEFORE this route began; table in the `.md` deliverable).**
`SOLUTION-CONTRACT.md` `88e77864704fc028`; `C2-DISPATCH-MANIFEST.md`
`c376ad30df3374a7`; `CYCLE2-ALLOCATION.md` `2930adad10f7fa93`; `FC-R14-1.md`
`be80978fff3998e1`; `FC-R14-2.md` `0397dd5c7e0d48b4`; `FC-R14-3.md`
`0719246893710b3c`; `C1-R5-CONTROLLER-RULINGS.md` `ab123908a69cb5eb`;
`C1-CONTROLLER-RECONCILIATION.md` `cefea0f2fbc5aadb`; `REJECTED-MECHANISMS.md`
`9f0de9aeb482c718`; `cycles/cycle-1/C1-GATES.md` `0169adac1e5e000d`. Lean cache
manifest `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
verified before and after every compile.

**SIGNATURE BEFORE MEASUREMENT.** `C1-AMD-11` binds unconditionally and the
C1 R5 controller ruling on the manifest dash binds. This route's falsifiable
signatures were registered, with digest and timestamp, in
`cycles/cycle-2/stage3/R14C2-T-SIGNATURE.md` (sha256 `d19db64f612bbb17…`,
sealed `2026-09-05T17:39:59Z`) BEFORE any instrument existed on disk and before
any measurement of any kind. `CDObstruction` and `G2SlackViolation` below are
the Lean transcriptions of registry rows SIG-1 and SIG-5 of that file.

**CEILING HONESTY (restated verbatim per contract discipline).**
TREE / FOREST / TRANSFER / COUNTEREXAMPLE are open before this file and remain
open after it. `AmbientTargetDeg2`, `(α)`, `(β)`, `(A)`, `(B)` are PROOF
TARGETS, never asserted true anywhere below; `AmbientTargetDeg2` is NOT proved
here. Every statement mentioning unimodality of an ambient set's count sequence
carries PREMISE K (Kadrawi–Levit / Radcliffe-via-K–L, ≤ 25 exhaustive
log-concavity; cited, never reproduced, never upgraded) **on its face**, as a
Lean hypothesis that is never discharged and may never be discharged inside the
kernel. No bounded zero is evidence of anything; atlas margins are evidence of
nothing and F12 applies with full force. Route ceiling `RG`; nothing here is
`formally_verified`; the ladder tops out at `governed`.

## Fence check (per-object, `C1-AMD-11`)

No computation, `#eval`, `decide`, `native_decide`, numerical search, or
sampling occurs anywhere in this file. Every declaration is either a pure
ingredient-level definition or a fully mechanized proof.

**Mechanism audit — every new theorem below uses exactly one of four
techniques, none of which touches F1–F12 of `REJECTED-MECHANISMS.md`:**

1. **The governed deletion-identity layer, CONSUMED not re-derived.** The
   split `Δ_{p−1}(W) = Δ_{p−1}(W∖g) + Δ_{p−2}(U)` is consumed from the C1
   artifact `R14C1F.AmbientStrata` (`ambient_split`, `ambientInstance_iff`),
   itself one instantiation of the sealed r12 `DeltaOn_eq_add_Bgen_on`. This
   file does not restate, re-prove, or vary it.
2. **The governed crossing-index layer, CONSUMED.** `crossingIndexOn_spec`
   and `DeltaOn_nonneg_of_lt_crossingIndexOn` (sealed r12
   `CorridorIngredients.lean:2251,2254`) are used unchanged. Everything new
   about stratum `G` below is a case split on `x(U)` against the rank `p−2`
   using exactly these two governed facts.
3. **Pure `Finset` extensionality / cardinality bookkeeping** on vertex
   addresses (`closedNbhd_card`, `residualAmbient_card`,
   `v_notMem_closedNbhd_otherNbr`, `support_mem_closedNbhd_otherNbr`) —
   literal membership unfolding, never a generating-function argument.
4. **Linear rearrangement of already-established identities** (`omega`),
   exactly as the consumed modules already do.

**F1/F2 NOT APPROACHED.** No step invokes, assumes, or concludes
log-concavity, unimodality, or real-rootedness of any tree or forest. The
predicate `SeqUnimodalOn` is a *hypothesis form*: it is never proved of any
object in this file, never instantiated, and never discharged. Where it
appears it is a premise carrying PREMISE K on its face. In particular this
file does NOT argue "the count sequence of `U` is past its mode, hence
`Δ ≤ 0`" as a theorem — that argument is exactly F1/F2 and is refused; it is
only ever stated as an implication with the unimodality premise visible in the
statement.

**F10 NOT APPROACHED.** No step decomposes any vertex through its child list
(`cs : List RTree`); no convolution or branch recursion occurs.

**F3–F9, F11, F12; the r12/r13 transitive additions; the r12 killed
candidates; r13's unguarded one-move charge:** none is invoked, reopened, or
relied on. No reopening is requested. **The refuted universal `Δ_{p−2}(U) ≤ 0`
is off the board** and appears nowhere below as a claim; `ambientInstance_iff_slack`
replaces it with the exact per-instance requirement `D ≤ H − 1` of record
(FC-R14-1 §1.1a).

**RESERVED ZONE UNTOUCHED, verified in proof terms.** The Q1–Q6 boundary of
record forbids the I/A/B state-split recursion and any inequality carried
across its subtraction. No proof below mentions, unfolds, or invokes
`RTree.Ipoly`, `RTree.Apoly`, `RTree.Bpoly`, `RTree.Fpoly`, `Ipoly_node`,
`Apoly_node`, `Bpoly_node`, `toPieces`, `fromPieces`, or any `cs : List RTree`
child-list decomposition; the only occurrences of those names in this file are
in this docstring, naming them as forbidden. `C7BBgenBound`'s inequality core
is neither used nor approached. The only subtractions any inequality crosses
are `i_{r+1}(V) − i_r(V)` — the DEFINITION of `DeltaOn` on a single ambient
set — and `Finset` cardinality differences; both are non-I/A/B derivations and
explicitly legal under the RESERVED zone's own carve-out.

**INVARIANCE (every new object).** `SeqUnimodalOn t V` is a function of
`(t, V)` only, through `DeltaOn` (itself documented as a function of
`(t, V, r)` only). `CDObstruction t v g p` and `G2SlackViolation t v g p` are
functions of `(t, v, g, p)` only, through already-governed objects
(`leaves`, `degree`, `support`, `OtherNbr`, `K_A`, `Bgen`, `DeltaOnZ`,
`closedNbhd`, `vertices`, `crossingIndexOn`) and the C1 object
`ResidualAmbient` (a function of `(t, v, g)` only). No vertex ordering, no
address convention, and no choice of unimodality witness `m` enters any
statement: `SeqUnimodalOn` existentially quantifies the witness, so the
property does not depend on which witness is exhibited. Every theorem is a
proposition about those objects only.

## A16 two-field scoreboard (vocabulary per C1-AMD-7(r14))

- **Field 1 — CONFIRMED / DETERMINED (mechanically proved, sorry-free, axioms
  clean, dual cold elaboration, grade `RG`):** the exact gap of record
  `C < 0 ↔ D ≤ H − 1`; the two-step normal form
  `C = i_{p+1}(W) − i_{p−1}(W)`; the vacuity of stratum S3 on the target's
  hypothesis population; `|U| = n − 2 − deg(g)`; the NEW premise-free stratum
  **S4** (`x(U) = p−2 ⟹ D < 0`); the forced sign `0 ≤ D` on **G2**
  (`p−2 < x(U)`); the premise-carrying **G1** closure; the inertness of the
  unimodality premise on G2; the reduction of `AmbientTargetDeg2` to the pair
  (G1 bound, G2 slack) with S4 discharged inside; and that a `G2SlackViolation`
  is an `AmbientCounterexampleDeg2`.
- **Field 2 — NOT DETERMINED (exactly as open as before):**
  `AmbientTargetDeg2`; `AlphaTargetDeg2`; (α), (β), (A), (B); TREE, FOREST,
  TRANSFER, COUNTEREXAMPLE; the G2 slack `D ≤ H − 1` on `p−2 < x(U)`, which
  after this file carries the entire remaining difficulty; whether
  `SeqUnimodalOn (ResidualAmbient v g)` ever holds (never proved here, and its
  universal form is a restatement of the open problem for forests); and the
  RTree↔NNSeq bridge (RES-12) without which the P1 composition cannot even be
  stated in this vocabulary.

## Item-6 declaration (Master Ledger digest at consume time)

This route consumed NO Master Ledger digest of its own. Its inputs are the
nine digest-pinned control artifacts named above, the sealed r12 Lean sources,
and the C1 Lean artifact `R14C1-F` — the latter two consumed by READ-ONLY
source path, digests recorded before and after every compile. Neither is
copied or edited; build artifacts are written only under this route's own
`.lake/`. On any drift between a consumed source and its recorded digest the
required action is quarantine-and-propose, never reconcile (r13's precedent
binds). No drift was observed at any point.
-/

open scoped Classical
noncomputable section
namespace RTree

/-! ## §1 — Falsifiable signatures (Lean transcriptions of the pre-registered
rows SIG-1 and SIG-5; the registration file is the authority) -/

/-- **SIG-1 `CD-OBSTRUCTION`.** A stratum-`G` hypothesis instance at which the
crossing index fails to drop: `x(U) > p − 2 = x(T) − 1`. A firing exhibits an
instance the P1-onto-`U` handle cannot close even with PREMISE K granted, since
unimodality of `U` yields `D ≤ 0` only where `x(U) ≤ p − 2`.

**NOT ASSERTED satisfiable and NOT asserted unsatisfiable.** The registration
file records the prediction that it fires, together with the certificate that
no monotonicity theorem is available: the crossing index is not monotone under
vertex deletion (`K₁,₃` has `x = 1`; its centre-deleted three-vertex empty
graph has `x = 2`). -/
def CDObstruction (t : RTree) (v g : List ℕ) (p : ℕ) : Prop :=
  v ∈ t.leaves ∧ t.degree (t.support v) = 2 ∧ t.OtherNbr (t.support v) v g ∧
    K_A t p = 1 ∧
    t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 ∧
    p - 2 < (t.ResidualAmbient v g).card ∧
    ¬ (t.crossingIndexOn (t.ResidualAmbient v g) ≤ p - 2)

/-- **SIG-5 `G2-SLACK-VIOLATION`.** A hypothesis instance on `G2`
(`p − 2 < x(U)`, where `0 ≤ D` is forced) at which the exact per-instance
requirement `D ≤ H − 1` fails. By `g2SlackViolation_imp_counterexample` below
this is exactly an `AmbientCounterexampleDeg2` located on `G2`, and it inherits
FC-R14-1's decisive-event discipline verbatim: at order ≥ 22 a DECISIVE EVENT
(halt, report, reconcile); at order ≤ 21 an INSTRUMENT INDICTMENT first.

**NOT ASSERTED satisfiable and NOT asserted unsatisfiable.** A non-firing is a
BOUNDED ZERO and is evidence of nothing. -/
def G2SlackViolation (t : RTree) (v g : List ℕ) (p : ℕ) : Prop :=
  v ∈ t.leaves ∧ t.degree (t.support v) = 2 ∧ t.OtherNbr (t.support v) v g ∧
    K_A t p = 1 ∧
    t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 ∧
    p - 2 < t.crossingIndexOn (t.ResidualAmbient v g) ∧
    ¬ (t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2)
        ≤ -(t.Bgen v (p : ℤ) +
            t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1)) - 1)

/-! ## §2 — The exact gap of record (repair R1, item 1: FC-R14-1 §1.1a in Lean)

The C1 artifact proved the *sufficiency* of `D ≤ 0`, and the adjudicated
correction of record struck that as the open question: `D ≤ 0` is FALSE as a
universal premise (order-11 witness, F-OPP Receipt A, adjudicator-verified).
The theorem below carries the EXACT per-instance requirement instead, as an
equivalence, so nothing is lost and no slack is introduced in any direction. -/

/-- **PROVED — THE GAP OF RECORD, mechanized.** At any hypothesis instance,
the target's conclusion holds **iff** `D ≤ H − 1`, where
`H := −[Δ_p(W) + Δ_{p−1}(W∖g)]` is the antecedent slack and
`D := Δ_{p−2}(U)`. This is FC-R14-1 §1.1a's statement, and it REPLACES the C1
deliverable's §5.1 "GAP" (which reduced the target to the refuted universal
`D ≤ 0`). An equivalence, not a bound: no strength is lost, and there is no
"slack in the safe direction" — the discarded slack is exactly where the
reduction lives. -/
theorem ambientInstance_iff_slack (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) {p : ℕ} (hp : 1 ≤ p) :
    (t.Bgen v (p : ℤ) + t.Bgen v ((p : ℤ) - 1) < 0) ↔
      t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2)
        ≤ -(t.Bgen v (p : ℤ) +
            t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1)) - 1 := by
  rw [t.ambientInstance_iff hv hOther hp]
  omega

/-- **PROVED — the two-step normal form.** The target's conclusion quantity
telescopes: `Δ_p(W) + Δ_{p−1}(W) = i_{p+1}(W) − i_{p−1}(W)`. So the conclusion
is exactly `i_{p+1}(W) < i_{p−1}(W)` — a two-rank strict descent on the single
ambient set `W = T∖N[v]`, at ranks `x(T)` and `x(T)+2`.

**Screened DEAD BY CONSTRUCTION as a cross-check, in advance** (registration
file, row SIG-3, under `C1-AMD-1(r14)`): the comparison is an algebraic
identity in its inputs with the target's own conclusion, so it is retained as a
NORMAL FORM only and is never reported as an independent confirmation. -/
theorem ambient_twoStep (t : RTree) (v : List ℕ) {p : ℕ} (hp : 1 ≤ p) :
    t.Bgen v (p : ℤ) + t.Bgen v ((p : ℤ) - 1) =
      (t.indepCountOn (t.vertices \ t.closedNbhd v) (p + 1) : ℤ)
        - (t.indepCountOn (t.vertices \ t.closedNbhd v) (p - 1) : ℤ) := by
  obtain ⟨k, rfl⟩ : ∃ k, p = k + 1 := ⟨p - 1, by omega⟩
  have hc : ((k + 1 : ℕ) : ℤ) - 1 = (k : ℤ) := by push_cast; ring
  unfold RTree.Bgen
  rw [hc, t.DeltaOnZ_natCast, t.DeltaOnZ_natCast]
  unfold RTree.DeltaOn
  simp only [Nat.add_sub_cancel]
  ring

/-! ## §3 — Repair R1, items 3 and 5: S3 is vacuous, and `|U| = n − 2 − deg(g)` -/

/-- **PROVED: on stratum S3 the target's antecedent quantity is identically
zero.** If `n ≤ p + 1` then `|W| = n − 2 ≤ p − 1 < p` and `|W∖g| = n − 3 < p − 1`,
so all four counts `i_p(W)`, `i_{p+1}(W)`, `i_{p−1}(W∖g)`, `i_p(W∖g)` vanish by
cardinality (consumed `indepCountOn_eq_zero_of_card_lt`), whence
`Δ_p(W) + Δ_{p−1}(W∖g) = 0`.

This is a structural vanishing proved for every instance in the stated range —
NOT a bounded zero and NOT an observation on any enumerated population. -/
theorem antecedent_eq_zero_of_order_le (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) {p : ℕ} (hp : 2 ≤ p)
    (horder : t.vertices.card ≤ p + 1) :
    t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) = 0 := by
  have hgW : g ∈ t.vertices \ t.closedNbhd v := t.otherNbr_mem_ambient hv hOther
  have hW : (t.vertices \ t.closedNbhd v).card = t.vertices.card - 2 := t.ambient_card hv
  have hE : ((t.vertices \ t.closedNbhd v).erase g).card
      = (t.vertices \ t.closedNbhd v).card - 1 := Finset.card_erase_of_mem hgW
  obtain ⟨k, rfl⟩ : ∃ k, p = k + 1 := ⟨p - 1, by omega⟩
  have hc : ((k + 1 : ℕ) : ℤ) - 1 = (k : ℤ) := by push_cast; ring
  have h1 : t.indepCountOn (t.vertices \ t.closedNbhd v) (k + 1) = 0 :=
    t.indepCountOn_eq_zero_of_card_lt _ (by omega)
  have h2 : t.indepCountOn (t.vertices \ t.closedNbhd v) (k + 1 + 1) = 0 :=
    t.indepCountOn_eq_zero_of_card_lt _ (by omega)
  have h3 : t.indepCountOn ((t.vertices \ t.closedNbhd v).erase g) k = 0 :=
    t.indepCountOn_eq_zero_of_card_lt _ (by omega)
  have h4 : t.indepCountOn ((t.vertices \ t.closedNbhd v).erase g) (k + 1) = 0 :=
    t.indepCountOn_eq_zero_of_card_lt _ (by omega)
  unfold RTree.Bgen
  rw [hc, t.DeltaOnZ_natCast, t.DeltaOnZ_natCast]
  unfold RTree.DeltaOn
  rw [h1, h2, h3, h4]
  ring

/-- **PROVED (repair R1, item 3): STRATUM S3 IS VACUOUS.** No instance of the
target's hypothesis population satisfies `n ≤ p + 1`, because the antecedent
quantity is then identically `0` and the antecedent demands it be `< 0`.

The C1 deliverable listed S3 alongside S1 and S2 as one of "three strata it
discharges"; the adjudicated correction is that S3 discharges nothing. This
result below is the correction of record, mechanized. It is strictly stronger
and strictly cheaper than the route through `x(T) ≤ n − 3` (which needs `n ≥ 4`
and a 2-vertex-cover counting lemma): no crossing-index bound is used at all. -/
theorem stratum_S3_vacuous (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) {p : ℕ} (hk : K_A t p = 1)
    (hhyp : t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0) :
    ¬ (t.vertices.card ≤ p + 1) := by
  intro horder
  have h := t.antecedent_eq_zero_of_order_le hv hOther (t.two_le_of_K_A_eq_one hk) horder
  omega

/-- **PROVED: `|N[z]| = deg(z) + 1` for any vertex `z`.** Pure `Finset`
bookkeeping: `N[z] = insert z {w ∈ V : addrAdjacent z w}`, and `z` is not in the
inserted set because no address is adjacent to itself. -/
theorem closedNbhd_card (t : RTree) {z : List ℕ} (hz : z ∈ t.vertices) :
    (t.closedNbhd z).card = t.degree z + 1 := by
  have h : t.closedNbhd z = insert z (t.vertices.filter (fun w => addrAdjacent z w)) := by
    ext w
    simp only [Finset.mem_insert, Finset.mem_filter, mem_closedNbhd_iff]
    constructor
    · rintro ⟨hw, h | h⟩
      · exact Or.inl h
      · exact Or.inr ⟨hw, h⟩
    · rintro (rfl | ⟨hw, h⟩)
      · exact ⟨hz, Or.inl rfl⟩
      · exact ⟨hw, Or.inr h⟩
  have hnot : z ∉ t.vertices.filter (fun w => addrAdjacent z w) := by
    simp only [Finset.mem_filter]
    rintro ⟨-, hadj⟩
    exact addrAdjacent_irrefl z hadj
  rw [h, Finset.card_insert_of_notMem hnot]
  unfold RTree.degree
  omega

/-- **PROVED: the leaf `v` is not in `N[g]`.** `v ≠ g` by `OtherNbr`; and `v`
cannot be adjacent to `g`, since a leaf's only neighbour is its support
(consumed `eq_support_of_adjacent`), which would force `g = s` and hence
`addrAdjacent s s`. -/
theorem v_notMem_closedNbhd_otherNbr (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) : v ∉ t.closedNbhd g := by
  obtain ⟨hgv, hadj, hgt⟩ := hOther
  rw [mem_closedNbhd_iff]
  rintro ⟨-, h | h⟩
  · exact hgv h.symm
  · have hvg : addrAdjacent v g := (addrAdjacent_comm g v).mp h
    have hgs : g = t.support v := t.eq_support_of_adjacent hv hgt hvg
    rw [hgs] at hadj
    exact addrAdjacent_irrefl (t.support v) hadj

/-- **PROVED: the support `s` IS in `N[g]`** (it is `g`'s neighbour, by
`OtherNbr` and the symmetry of `addrAdjacent`). -/
theorem support_mem_closedNbhd_otherNbr (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) :
    t.support v ∈ t.closedNbhd g := by
  obtain ⟨-, hadj, -⟩ := hOther
  rw [mem_closedNbhd_iff]
  exact ⟨t.support_mem_vertices hv, Or.inr ((addrAdjacent_comm (t.support v) g).mp hadj)⟩

/-- **PROVED (repair R1, item 5): `|U| = n − 2 − deg(g)`.** The C1 deliverable
carried this as `proved_informal`, unmechanized; the F-OPP critic verified it
numerically (0 violations in 3,831 instances) and sustained it as correct. It is
now mechanized. `N[g] ∩ W = N[g] ∖ {s}` exactly — `v ∉ N[g]` and `s ∈ N[g]` —
so `|N[g] ∩ W| = deg(g)` and `|U| = |W| − deg(g) = (n − 2) − deg(g)`.

Consequence recorded for the stratum map: S1 (`|U| ≤ p − 2`) is exactly the
high-degree-hub stratum `deg(g) ≥ n − x(T) − 1`, the brooms and spiders whose
surviving hub dominates nearly everything. -/
theorem residualAmbient_card (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) :
    (t.ResidualAmbient v g).card = t.vertices.card - 2 - t.degree g := by
  have hvn := t.v_notMem_closedNbhd_otherNbr hv hOther
  have hsm := t.support_mem_closedNbhd_otherNbr hv hOther
  have hgt : g ∈ t.vertices := hOther.2.2
  have hinter : t.closedNbhd g ∩ (t.vertices \ t.closedNbhd v)
      = (t.closedNbhd g).erase (t.support v) := by
    ext w
    simp only [Finset.mem_inter, Finset.mem_sdiff, Finset.mem_erase,
      t.closedNbhd_eq_of_leaf hv, Finset.mem_insert, Finset.mem_singleton]
    constructor
    · rintro ⟨hwg, -, hnv⟩
      exact ⟨fun hws => hnv (Or.inr hws), hwg⟩
    · rintro ⟨hws, hwg⟩
      refine ⟨hwg, ?_, ?_⟩
      · rw [mem_closedNbhd_iff] at hwg; exact hwg.1
      · rintro (rfl | rfl)
        · exact hvn hwg
        · exact hws rfl
  have hcardNg : (t.closedNbhd g).card = t.degree g + 1 := t.closedNbhd_card hgt
  have hcardE : ((t.closedNbhd g).erase (t.support v)).card = (t.closedNbhd g).card - 1 :=
    Finset.card_erase_of_mem hsm
  have hW : (t.vertices \ t.closedNbhd v).card = t.vertices.card - 2 := t.ambient_card hv
  unfold RTree.ResidualAmbient
  rw [Finset.card_sdiff, hinter, hcardE, hcardNg, hW]
  omega

/-! ## §4 — The antecedent, located in the governed crossing-index vocabulary

`a_v(p) := Δ_p(T∖v)` is the r8 interface's own central per-vertex quantity, and
`crossingIndexAt v := x(T∖v)` is already governed. The identity below is a
PRESENTATIONAL confirmation, not new content: it is the ambient-side reading of
the sealed r12 `alphaTargetDeg2_iff_ambientTargetDeg2`. The scoping corollary
that follows it IS new, and is modest. -/

/-- **PROVED (presentational, not novel): the target's antecedent quantity is
exactly `a_v(p) = Δ_p(T∖v)`.** Composed from the sealed r12
`a_eq_Bgen_add_Bgen_support` and `vertices_sdiff_closedNbhd_support_eq_of_deg2`.
Recorded because it is what makes the corollary below expressible; the C1
lineage already contains its content through the sealed equivalence. -/
theorem antecedent_eq_a (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) (hd2 : t.degree (t.support v) = 2)
    (p : ℕ) :
    t.a v p = t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) := by
  have h := t.a_eq_Bgen_add_Bgen_support hv p
  have he := t.vertices_sdiff_closedNbhd_support_eq_of_deg2 hv hOther hd2
  rw [h]
  congr 1
  show t.DeltaOnZ (t.vertices \ t.closedNbhd (t.support v)) ((p : ℤ) - 1) = _
  rw [he]

/-- **PROVED (new, modest): the hypothesis population satisfies
`x(T∖v) ≤ p = x(T) + 1`.** The antecedent says `Δ_p(T∖v) < 0`, so `p` belongs to
the set whose `sInf` defines `crossingIndexAt v`. A scoping fact about where the
hypothesis population sits in crossing-index terms; it is not a bound on `x(U)`
and does not bear on stratum G. -/
theorem crossingIndexAt_le_of_antecedent (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) (hd2 : t.degree (t.support v) = 2)
    {p : ℕ}
    (hhyp : t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0) :
    t.crossingIndexAt v ≤ p := by
  have h := t.antecedent_eq_a hv hOther hd2 p
  have hneg : t.DeltaOn (t.vertices.erase v) p < 0 := by
    have hrfl : t.a v p = t.DeltaOn (t.vertices.erase v) p := rfl
    omega
  unfold RTree.crossingIndexAt RTree.crossingIndexOn
  exact Nat.sInf_le hneg

/-! ## §5 — THE CROSSING-INDEX TRICHOTOMY ON STRATUM `G`

Stratum `G` (`|U| ≥ p − 1`) is where the whole remaining difficulty lives. It
splits, by the governed crossing index of the residual forest `U` against the
residual rank `p − 2 = x(T) − 1`, into three regions with genuinely different
status:

* **G1** `x(U) < p − 2` — the sign of `D` is unforced; PREMISE-K unimodality of
  `U` would give `D ≤ 0`;
* **S4** `x(U) = p − 2` — **CLOSED PREMISE-FREE**, below;
* **G2** `x(U) > p − 2` — `0 ≤ D` is FORCED by the governed
  `DeltaOn_nonneg_of_lt_crossingIndexOn`, and the requirement is the
  quantitative `D ≤ H − 1`. -/

/-- **The unimodality hypothesis form, native to an ambient set's count
sequence.** `SeqUnimodalOn t V` says the sequence `i_r(V)` rises then falls:
some rank `m` has `Δ_r(V) ≥ 0` below it and `Δ_r(V) ≤ 0` from it on.

**THIS IS A PREMISE FORM, NEVER A THEOREM HERE.** It is never proved of any
object in this file and is never discharged. It is the native transcription of
what the P1-onto-`U` composition would deliver: `P1_NNSeq` (TRS2 × Unimodal ⟹
Unimodal) composed with `trs2_finset_prod` over the components of the forest
`U`, given (i) PREMISE K — the cited external ≤ 25 log-concavity computation,
never reproduced, never upgraded — for every component of order ≤ 25, and
(ii) the `RTree`↔`NNSeq` bridge, which is RES-12 and is NOT BUILT. Its
universal form is a restatement of the open problem for forests and is not
claimed anywhere. Invariance: a function of `(t, V)` only; the witness `m` is
existentially bound, so the property does not depend on which witness is
exhibited. -/
def SeqUnimodalOn (t : RTree) (V : Finset (List ℕ)) : Prop :=
  ∃ m : ℕ, (∀ r : ℕ, r < m → 0 ≤ t.DeltaOn V r) ∧ (∀ r : ℕ, m ≤ r → t.DeltaOn V r ≤ 0)

/-- **PROVED — STRATUM S4, PREMISE-FREE, NEW THIS CYCLE.** If the residual
forest's crossing index sits exactly at the residual rank, `x(U) = p − 2`, then
`D = Δ_{x(U)}(U) < 0` outright, by the governed `crossingIndexOn_spec` alone.

This closes a slice of stratum `G` with no external premise, no unimodality, no
log-concavity, and no cardinality degeneracy. It is the first stratum in this
lineage discharged by the crossing-index layer rather than by counting. -/
theorem residual_neg_of_crossing_eq (t : RTree) (v g : List ℕ) {p : ℕ} (hp : 2 ≤ p)
    (hx : t.crossingIndexOn (t.ResidualAmbient v g) = p - 2) :
    t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) < 0 := by
  obtain ⟨k, rfl⟩ : ∃ k, p = k + 2 := ⟨p - 2, by omega⟩
  have hc : ((k + 2 : ℕ) : ℤ) - 2 = (k : ℤ) := by push_cast; ring
  have hk : t.crossingIndexOn (t.ResidualAmbient v g) = k := by simpa using hx
  rw [hc, t.DeltaOnZ_natCast, ← hk]
  exact t.crossingIndexOn_spec _

/-- **PROVED — G2's forced sign, premise-free.** Where `p − 2 < x(U)`, the
governed `DeltaOn_nonneg_of_lt_crossingIndexOn` forces `0 ≤ D`. So on G2 the
residual can never be negative, and the requirement `D ≤ H − 1` is a genuine
quantitative comparison, not a sign question. -/
theorem residual_nonneg_of_lt_crossing (t : RTree) (v g : List ℕ) {p : ℕ} (hp : 2 ≤ p)
    (hx : p - 2 < t.crossingIndexOn (t.ResidualAmbient v g)) :
    0 ≤ t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) := by
  obtain ⟨k, rfl⟩ : ∃ k, p = k + 2 := ⟨p - 2, by omega⟩
  have hc : ((k + 2 : ℕ) : ℤ) - 2 = (k : ℤ) := by push_cast; ring
  have hk : k < t.crossingIndexOn (t.ResidualAmbient v g) := by simpa using hx
  rw [hc, t.DeltaOnZ_natCast]
  exact t.DeltaOn_nonneg_of_lt_crossingIndexOn _ hk

/-- **PROVED — what the P1-onto-`U` handle buys, PREMISE ON ITS FACE.** If
`U`'s count sequence is unimodal (the premise; PREMISE K + RES-12) and
`x(U) ≤ p − 2`, then `D ≤ 0` and the instance closes.

The proof is the descent-persistence argument: if some unimodality witness `m`
satisfies `m ≤ p − 2` we are done directly; otherwise `x(U) ≤ p − 2 < m` puts
the crossing rank strictly below the mode, where unimodality asserts
`Δ_{x(U)}(U) ≥ 0` — contradicting `crossingIndexOn_spec`. So the handle covers
exactly `G1 ∪ S4`, and S4 needs it not at all. -/
theorem residual_nonpos_of_unimodal_of_crossing_le (t : RTree) (v g : List ℕ) {p : ℕ}
    (hp : 2 ≤ p) (hu : t.SeqUnimodalOn (t.ResidualAmbient v g))
    (hx : t.crossingIndexOn (t.ResidualAmbient v g) ≤ p - 2) :
    t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) ≤ 0 := by
  obtain ⟨m, hup, hdown⟩ := hu
  obtain ⟨k, rfl⟩ : ∃ k, p = k + 2 := ⟨p - 2, by omega⟩
  have hc : ((k + 2 : ℕ) : ℤ) - 2 = (k : ℤ) := by push_cast; ring
  have hxk : t.crossingIndexOn (t.ResidualAmbient v g) ≤ k := by simpa using hx
  rw [hc, t.DeltaOnZ_natCast]
  by_cases h : m ≤ k
  · exact hdown k h
  · exfalso
    have hlt : t.crossingIndexOn (t.ResidualAmbient v g) < m := by omega
    have h1 := hup _ hlt
    have h2 := t.crossingIndexOn_spec (t.ResidualAmbient v g)
    omega

/-! ### The negative result: the handle cannot reach G2

Two theorems, both premise-free in their own right, jointly bound what
unimodality of `U` can contribute on G2. -/

/-- **PROVED: on G2 the unimodality premise is INERT for the sign question.**
Both conjuncts assert `0 ≤ Δ_r0(V)`; the premise-carrying one is proved by a
term that DISCARDS the premise (`fun _ => …`), which is the mechanized evidence
that `SeqUnimodalOn` contributes nothing there that
`DeltaOn_nonneg_of_lt_crossingIndexOn` does not already give. -/
theorem unimodal_inert_on_G2 (t : RTree) (V : Finset (List ℕ)) {r0 : ℕ}
    (hG2 : r0 < t.crossingIndexOn V) :
    (t.SeqUnimodalOn V → 0 ≤ t.DeltaOn V r0) ∧ 0 ≤ t.DeltaOn V r0 :=
  ⟨fun _ => t.DeltaOn_nonneg_of_lt_crossingIndexOn V hG2,
   t.DeltaOn_nonneg_of_lt_crossingIndexOn V hG2⟩

/-- **PROVED: a strictly positive residual merely relocates the mode.** Under
any unimodality witness `m`, `0 < Δ_r0(V)` forces `r0 < m` — and nothing more.
So `SeqUnimodalOn V` is CONSISTENT with `Δ_r0(V) > 0`: it yields no
contradiction there, hence cannot close an instance whose residual is positive.
Together with `unimodal_inert_on_G2` this is the precise sense in which the
P1-onto-`U` handle cannot reach the region `p − 2 < x(U) ∧ 0 < D`. -/
theorem pos_residual_forces_mode_above (t : RTree) (V : Finset (List ℕ)) {m r0 : ℕ}
    (hdown : ∀ r : ℕ, m ≤ r → t.DeltaOn V r ≤ 0) (hpos : 0 < t.DeltaOn V r0) : r0 < m := by
  by_contra h
  have := hdown r0 (by omega)
  omega

/-- **PROVED: the one place unimodality still helps on G2.** If some witness
`m` satisfies `m ≤ r0` while `r0 < x(V)`, the two bounds pinch `Δ_r0(V)` to
exactly `0`. Since the antecedent gives `H ≥ 1`, `D = 0 ≤ H − 1` closes the
instance. Hence, under the premise, the OPEN residue on G2 is exactly
`0 < D` — which is precisely the region the previous theorem shows unimodality
is consistent with. This is the cross-link to O13's `Δ_{p−2}(U) = 0` boundary
bucket: under PREMISE K those boundary instances are the closing ones. -/
theorem residual_eq_zero_of_mode_le_on_G2 (t : RTree) (V : Finset (List ℕ)) {m r0 : ℕ}
    (hdown : ∀ r : ℕ, m ≤ r → t.DeltaOn V r ≤ 0) (hm : m ≤ r0)
    (hG2 : r0 < t.crossingIndexOn V) : t.DeltaOn V r0 = 0 := by
  have h1 := hdown r0 hm
  have h2 := t.DeltaOn_nonneg_of_lt_crossingIndexOn V hG2
  omega

/-! ## §6 — Instance-level closures and the reduction of record -/

/-- **STRATUM S4 closes the instance, premise-free.** -/
theorem ambientInstance_of_crossing_eq (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) {p : ℕ} (hk : K_A t p = 1)
    (hhyp : t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0)
    (hx : t.crossingIndexOn (t.ResidualAmbient v g) = p - 2) :
    t.Bgen v (p : ℤ) + t.Bgen v ((p : ℤ) - 1) < 0 := by
  have hp2 := t.two_le_of_K_A_eq_one hk
  exact t.ambientInstance_of_residual_nonpos hv hOther (by omega) hhyp
    (le_of_lt (t.residual_neg_of_crossing_eq v g hp2 hx))

/-- **THE REDUCTION OF RECORD FOR C3.** `AmbientTargetDeg2` follows from
exactly two per-instance hypotheses — and stratum **S4** is discharged inside,
needing neither:

* `HG1` on `x(U) < p − 2`: the residual is non-positive. **This is what the
  P1-onto-`U` composition would supply, under PREMISE K (every component of `U`
  of order ≤ 25) plus the unbuilt RES-12 bridge**
  (`residual_nonpos_of_unimodal_of_crossing_le`).
* `HG2` on `p − 2 < x(U)`: the quantitative slack `D ≤ H − 1`. **The handle
  cannot supply this** — see `unimodal_inert_on_G2` and
  `pos_residual_forces_mode_above`.

`AmbientTargetDeg2` is NOT asserted: this is an implication whose antecedents
are unproved, one of them premise-carrying and the other open. -/
theorem ambientTargetDeg2_of_G1_G2
    (HG1 : ∀ (t : RTree) (v g : List ℕ) (p : ℕ),
      v ∈ t.leaves → t.degree (t.support v) = 2 → t.OtherNbr (t.support v) v g →
      K_A t p = 1 →
      t.Bgen v (p : ℤ) +
        t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 →
      t.crossingIndexOn (t.ResidualAmbient v g) < p - 2 →
        t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) ≤ 0)
    (HG2 : ∀ (t : RTree) (v g : List ℕ) (p : ℕ),
      v ∈ t.leaves → t.degree (t.support v) = 2 → t.OtherNbr (t.support v) v g →
      K_A t p = 1 →
      t.Bgen v (p : ℤ) +
        t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 →
      p - 2 < t.crossingIndexOn (t.ResidualAmbient v g) →
        t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2)
          ≤ -(t.Bgen v (p : ℤ) +
              t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1)) - 1) :
    AmbientTargetDeg2 := by
  intro t v g p hv hd2 hOther hk hhyp
  have hp2 := t.two_le_of_K_A_eq_one hk
  rcases lt_trichotomy (t.crossingIndexOn (t.ResidualAmbient v g)) (p - 2) with h | h | h
  · exact t.ambientInstance_of_residual_nonpos hv hOther (by omega) hhyp
      (HG1 t v g p hv hd2 hOther hk hhyp h)
  · exact t.ambientInstance_of_crossing_eq hv hOther hk hhyp h
  · rw [t.ambientInstance_iff_slack hv hOther (by omega)]
    exact HG2 t v g p hv hd2 hOther hk hhyp h

/-! ## §7 — Signature transport (handed to `R14C2-H`) -/

/-- **PROVED: a SIG-5 firing IS a target counterexample.** So `G2SlackViolation`
inherits FC-R14-1's decisive-event discipline verbatim. Nothing is asserted
about whether the population is nonempty. -/
theorem g2SlackViolation_imp_counterexample (t : RTree) (v g : List ℕ) (p : ℕ) :
    t.G2SlackViolation v g p → AmbientCounterexampleDeg2 t v g p := by
  rintro ⟨hv, hd2, hOther, hk, hhyp, -, hviol⟩
  have hp2 := t.two_le_of_K_A_eq_one hk
  refine ⟨hv, hd2, hOther, hk, hhyp, ?_⟩
  rw [t.ambientInstance_iff_slack hv hOther (by omega)]
  exact hviol

/-- **PROVED: a SIG-1 firing sits where the residual sign is forced
non-negative.** A `CDObstruction` instance is on G2, so `0 ≤ D` there. -/
theorem cdObstruction_imp_residual_nonneg (t : RTree) (v g : List ℕ) (p : ℕ) :
    t.CDObstruction v g p → 0 ≤ t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) := by
  rintro ⟨-, -, -, hk, -, -, hx⟩
  have hp2 := t.two_le_of_K_A_eq_one hk
  exact t.residual_nonneg_of_lt_crossing v g hp2 (by omega)

/-- **PROVED (falsifier narrowing, premise-carrying; handed to `R14C2-H`):
under the P1-onto-`U` premise, EVERY target counterexample lies on G2.** So a
search may be restricted, with no loss under that premise, from C1's
`ResidualObstruction` population to `ResidualObstruction ∩ G2`. The premise is
on the face and is never discharged; without it the narrowing does not hold. -/
theorem counterexample_imp_G2_of_unimodal (t : RTree) (v g : List ℕ) (p : ℕ)
    (hu : t.SeqUnimodalOn (t.ResidualAmbient v g)) :
    AmbientCounterexampleDeg2 t v g p → p - 2 < t.crossingIndexOn (t.ResidualAmbient v g) := by
  intro hc
  obtain ⟨hv, hd2, hOther, hk, hhyp, hnot⟩ := hc
  have hp2 := t.two_le_of_K_A_eq_one hk
  by_contra hle
  exact hnot (t.ambientInstance_of_residual_nonpos hv hOther (by omega) hhyp
    (t.residual_nonpos_of_unimodal_of_crossing_le v g hp2 hu (by omega)))

end RTree
end
