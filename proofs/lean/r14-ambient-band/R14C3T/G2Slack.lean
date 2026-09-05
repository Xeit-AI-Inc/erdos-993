import R14C2T.StratumG

/-!
# R14C3-T — the corrected reduction of record attacked at full strength:
the R-5 probe re-issue (repair C2-R1(a)), the S5 boundary closure, and the
deficit-location theorem

**Route: `R14C3-T`, r14 Cycle 3, stage-3, isolated (AMD-9 role/effort line;
alias `fable` effort `high`; exact resolved model identifier
`claude-fable-5` — the alias resolved to Fable 5, NOT Fable 5.1, disclosed
per the CYCLE3-ALLOCATION model-schedule clause and reported in the
accompanying `.md` deliverable).** Allocation:
`control/CYCLE3-ALLOCATION.md` §`R14C3-T` (W1). Frames of record:
`control/FC-R14-4.md` (the R-5 S1-folded reduction), `control/FC-R14-5.md`
(the corrected handle-scope statement + premise set incl. K-SCOPE),
`control/FC-R14-6.md` (record corrections, where they bind this route).

**Digest-verified reads (all eight `C3-DISPATCH-MANIFEST.md` pins checked
byte-prefix-correct BEFORE this route began; table in
`cycles/cycle-3/stage3/R14C3-T-SIGNATURE.md` §0).** `SOLUTION-CONTRACT.md`
`88e77864704fc028`; `C3-DISPATCH-MANIFEST.md` `9bc3e0d299f264e0`;
`CYCLE3-ALLOCATION.md` `5026b453c207ceac`; `FC-R14-4.md` `b5e44f722860be20`;
`FC-R14-5.md` `5d23cb07ff7e2876`; `FC-R14-6.md` `359114ae52772888`;
`cycles/cycle-2/C2-GATES.md` `81843c011b310622`; `REJECTED-MECHANISMS.md`
`9f0de9aeb482c718`. Lean cache manifest (contract §4 pin)
`52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` verified
before and after every compile; receipts in
`cycles/cycle-3/lean/R14C3-T/receipts/` and the `.md` deliverable §8.

**SIGNATURE BEFORE MEASUREMENT.** `C1-AMD-11` binds unconditionally; the C1
R5 dash ruling binds; the C3 manifest's T-row tautology-screen dash is under
C2-R4(a) correction and this route screened anyway. This route's falsifiable
signatures were registered, with digest and timestamp, in
`cycles/cycle-3/stage3/R14C3-T-SIGNATURE.md` (sha256 `5a561bbba301e183…`,
sealed 2026-09-05T19:27:57Z) BEFORE any instrument existed on disk and
before any measurement of any kind. `S5Violation` and `DLViolation` below
are the Lean transcriptions of registry rows SIG-C3-3 and SIG-C3-4;
`G2UnimodalPos` and `NonUnimodalU` transcribe SIG-C3-1 and SIG-C3-2.

**CEILING HONESTY (restated verbatim per contract discipline).**
TREE / FOREST / TRANSFER / COUNTEREXAMPLE are open before this file and
remain open after it. `AmbientTargetDeg2`, `(α)`, `(β)`, `(A)`, `(B)` are
PROOF TARGETS, never asserted true anywhere below; `AmbientTargetDeg2` is
NOT proved here. Every statement mentioning unimodality of an ambient set's
count sequence carries PREMISE K (Kadrawi–Levit / Radcliffe-via-K–L, ≤ 25
exhaustive log-concavity; cited, never reproduced, never upgraded) **and
K-SCOPE (every component of `U` has order ≤ 25 — a third, non-structural,
undischarged scope hypothesis, per FC-R14-5) on its face**, never
discharged, never dischargeable inside the kernel. No bounded zero is
evidence of anything; atlas margins are evidence of nothing; F12 applies
with full force. Route ceiling `RG`; nothing here is `formally_verified`.

## Fence check (per-object)

No computation, `#eval`, `decide`, `native_decide`, numerical search, or
sampling occurs anywhere in this file. **Every new theorem below uses
exactly one of five techniques, none of which touches F1–F12:**

1. **The governed deletion-identity layer, CONSUMED not re-derived**
   (`DeltaOn_eq_add_Bgen_on`, sealed r12): applied at ONE new instance —
   ambient `W := T∖N[v]`, deleted vertex `g`, rank `p` (the C1 artifact
   applied it at rank `p−1`; this file adds the rank-`p` instance and
   nothing else).
2. **The governed crossing-index layer, CONSUMED** (`crossingIndexOn_spec`,
   `DeltaOn_nonneg_of_lt_crossingIndexOn`, sealed r12), plus one new
   *elementary* consequence pair proved here from `indepCountOn_zero` and
   `indepCountOn_eq_zero_of_card_lt` alone: the count sequence is ≥ 1 up to
   the crossing index, hence `x(V) ≤ |V|`.
3. **A literal `Finset` injection** (the erase map `z ↦ V.erase z`,
   injective on `V`) and **`Finset` uniqueness at full cardinality**
   (`eq_of_subset_of_card_le`) — combinatorial injections, expressly
   fence-legal per the contract's Q1–Q6 boundary; never a
   generating-function argument.
4. **Pure cardinality bookkeeping** (consumed `indepCountOn_eq_zero_of_card_lt`).
5. **Linear rearrangement of already-established identities** (`omega`).

**F1/F2 NOT APPROACHED.** No step invokes, assumes, or concludes
log-concavity, unimodality, or real-rootedness of any tree or forest.
`SeqUnimodalOn` (consumed from the C2 module as a HYPOTHESIS FORM) is never
proved of any object here, never instantiated, never discharged; it appears
only inside the *statements* of the transcribed signature rows. The S5
closure below is discharged by injection + cardinality + the governed
crossing layer — NOT by any "past the mode" argument. The natural
continuation past S5 (bounding `D` via a tree sequence's behaviour past its
crossing index) is exactly F1/F2 and is REFUSED; the `.md` deliverable §7
records the refusal and the honest failure on the remaining region.

**F10 NOT APPROACHED.** No step decomposes any vertex through its child
list; no convolution, no branch recursion.

**F3–F9, F11, F12; r12/r13 transitive additions; killed candidates; r13's
unguarded one-move charge:** none invoked, reopened, or relied on. No
reopening is requested. The refuted universal `D ≤ 0` appears nowhere as a
claim.

**RESERVED ZONE UNTOUCHED, verified in proof terms.** No proof below
mentions, unfolds, or invokes `RTree.Ipoly`, `RTree.Apoly`, `RTree.Bpoly`,
`RTree.Fpoly`, `Ipoly_node`, `Apoly_node`, `Bpoly_node`, `toPieces`,
`fromPieces`, or any `cs : List RTree` child-list decomposition — the only
occurrences of those names in this file are in this docstring, naming them
as forbidden. `C7BBgenBound`'s inequality core is neither used nor
approached. The only subtractions any inequality crosses are
`i_{r+1}(V) − i_r(V)` (the DEFINITION of `DeltaOn` on a single ambient set)
and `Finset` cardinality differences — non-I/A/B derivations, expressly
legal under the RESERVED zone's own carve-out.

**INVARIANCE (every new object).** `G2UnimodalPos`, `NonUnimodalU`,
`S5Violation`, `DLViolation` are functions of `(t, v, g, p)` only, through
already-governed objects (`leaves`, `degree`, `support`, `OtherNbr`, `K_A`,
`Bgen`, `DeltaOnZ`, `closedNbhd`, `vertices`, `crossingIndexOn`,
`Finset.card`) and the consumed `ResidualAmbient` and `SeqUnimodalOn` (each
a function of its own arguments only, with the unimodality witness
existentially bound). No vertex ordering, no component ordering, no address
convention enters any statement. Every theorem is a proposition about those
objects only; the erase-injection inside one proof is proof-internal and
does not appear in any statement.

## Repairs folded in (per the C3 dispatch)

* **C2-R1(a) — the probe re-issue**: `ambientTargetDeg2_of_G1restricted_G2`
  below is the compiled reduction of record (FC-R14-4's R-5, S1-folded
  form), re-issued VERBATIM under this route's namespace — statement
  identical, token for token, to the adjudicator-verified
  `OPP_ambientTargetDeg2_of_G1restricted_G2` (C2 stage-4 rebuild tree),
  with fresh receipts and unfiltered raw logs. The deferred R-5 gate act
  completes on this artifact at the C3 gate.
* **The C1-AMD-6 transcript cure (C2-R1(f))**: both cold legs of this
  module are re-run with UNFILTERED raw transcripts — the complete `lake
  build` output, no `grep`, no `tail`, no curation —
  `cycles/cycle-3/lean/R14C3-T/receipts/legA-raw-full.log`,
  `legB-raw-full.log`.

## Item-6 declaration

This route consumed NO Master Ledger digest of its own. Inputs: the eight
digest-pinned control artifacts above; the sealed r12 Lean sources; the
sealed-cycle C1 (`R14C1F`) and C2 (`R14C2T`) Lean artifacts — all consumed
by READ-ONLY source path, digests recorded before and after every compile.
None copied, none edited; build artifacts written only under this route's
own `.lake/`. On any drift: quarantine-and-propose, never reconcile.
-/

open scoped Classical
noncomputable section
namespace RTree

/-! ## §1 — Lean transcriptions of the pre-registered signature rows
(the registration file is the authority; nothing here rescopes it) -/

/-- **SIG-C3-1 `G2-UNIMODAL-POS-EXHIBIT`.** A G2 hypothesis instance whose
residual forest's count sequence IS unimodal while `D > 0`. A verified
firing is a MODEL of the conjunction FC-R14-5 marks NOT DETERMINED, and
settles that consistency row affirmatively BY EXHIBITION. Carries
`SeqUnimodalOn` in its statement as a *measured coordinate*, not as a
premise to be granted — nothing is discharged. NOT asserted satisfiable or
unsatisfiable here. -/
def G2UnimodalPos (t : RTree) (v g : List ℕ) (p : ℕ) : Prop :=
  v ∈ t.leaves ∧ t.degree (t.support v) = 2 ∧ t.OtherNbr (t.support v) v g ∧
    K_A t p = 1 ∧
    t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 ∧
    p - 2 < t.crossingIndexOn (t.ResidualAmbient v g) ∧
    t.SeqUnimodalOn (t.ResidualAmbient v g) ∧
    0 < t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2)

/-- **SIG-C3-2 `NONUNIMODAL-U`.** A hypothesis instance whose residual
forest's count sequence is NOT unimodal. On the enumerated population every
component of `U` has order ≤ 13, so a verified firing is a
source-reconciliation event against the Premise-K citation (instrument
indicted first). NOT asserted satisfiable or unsatisfiable. -/
def NonUnimodalU (t : RTree) (v g : List ℕ) (p : ℕ) : Prop :=
  v ∈ t.leaves ∧ t.degree (t.support v) = 2 ∧ t.OtherNbr (t.support v) v g ∧
    K_A t p = 1 ∧
    t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 ∧
    ¬ t.SeqUnimodalOn (t.ResidualAmbient v g)

/-- **SIG-C3-3 `S5-VIOLATION`.** Registered as a planted fault: the cell is
proved EMPTY below (`not_s5Violation`), so any firing indicts the
instrument, not the theorem. -/
def S5Violation (t : RTree) (v g : List ℕ) (p : ℕ) : Prop :=
  v ∈ t.leaves ∧ t.degree (t.support v) = 2 ∧ t.OtherNbr (t.support v) v g ∧
    K_A t p = 1 ∧
    t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 ∧
    (t.ResidualAmbient v g).card = p - 1 ∧
    p - 2 < t.crossingIndexOn (t.ResidualAmbient v g) ∧
    0 < t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2)

/-- **SIG-C3-4 `DEFICIT-LOCATION-VIOLATION`.** Registered as a planted
fault: the cell is proved EMPTY below (`not_dlViolation`), so any firing
indicts the instrument, not the theorem. -/
def DLViolation (t : RTree) (v g : List ℕ) (p : ℕ) : Prop :=
  v ∈ t.leaves ∧ t.degree (t.support v) = 2 ∧ t.OtherNbr (t.support v) v g ∧
    K_A t p = 1 ∧
    t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 ∧
    p - 1 < t.crossingIndexOn (t.ResidualAmbient v g) ∧
    p < t.crossingIndexOn ((t.vertices \ t.closedNbhd v).erase g)

/-! ## §2 — New governed-vocabulary facts about the crossing index
(CLAIM-C3-2, CLAIM-C3-3; elementary, premise-free, fence technique 2) -/

/-- **PROVED (CLAIM-C3-2): the count sequence is ≥ 1 all the way up to the
crossing index.** `i_0(V) = 1`, and below `x(V)` every step is
non-decreasing, so by a plain chain of `≤`s every rank `r ≤ x(V)` has
`i_r(V) ≥ 1`. Elementary, but load-bearing: it is what turns a crossing
bound into an EXISTENCE statement (an independent set of size `r` exists),
which is what the S5 injection argument consumes. -/
theorem one_le_indepCountOn_of_le_crossingIndexOn (t : RTree) (V : Finset (List ℕ)) :
    ∀ {r : ℕ}, r ≤ t.crossingIndexOn V → 1 ≤ t.indepCountOn V r := by
  intro r
  induction r with
  | zero => intro _; exact (t.indepCountOn_zero V).ge
  | succ k ih =>
    intro h
    have h1 : 1 ≤ t.indepCountOn V k := ih (by omega)
    have h2 : 0 ≤ t.DeltaOn V k :=
      t.DeltaOn_nonneg_of_lt_crossingIndexOn V (by omega)
    unfold RTree.DeltaOn at h2
    omega

/-- **PROVED (CLAIM-C3-3): `x(V) ≤ |V|` for every ambient set.** If
`x(V) > |V|` the chain lemma would force `i_{|V|+1}(V) ≥ 1`, contradicting
the cardinality vanishing. So the crossing index is a LOWER BOUND on the
independence number of `V` (via the chain lemma, `V` contains an
independent set of every size up to `x(V)`). -/
theorem crossingIndexOn_le_card (t : RTree) (V : Finset (List ℕ)) :
    t.crossingIndexOn V ≤ V.card := by
  by_contra h
  push_neg at h
  have h1 : 1 ≤ t.indepCountOn V (V.card + 1) :=
    t.one_le_indepCountOn_of_le_crossingIndexOn V (by omega)
  have h2 : t.indepCountOn V (V.card + 1) = 0 :=
    t.indepCountOn_eq_zero_of_card_lt V (by omega)
  omega

/-- **PROVED (CLAIM-C3-4): G2 needs no cardinality conjunct — S1 ∩ G2 = ∅
as a THEOREM.** `x(U) > p−2` forces `|U| ≥ x(U) ≥ p−1`. This tightens the
partition sentence of record (FC-R14-4): `G2 = {x(U) > p−2}` unconditionally
was already registered; it is now proved that this cell cannot meet S1, so
the four-way stamp is provably exclusive without a G2-side conjunct. -/
theorem residual_card_ge_of_G2 (t : RTree) (v g : List ℕ) {p : ℕ}
    (hx : p - 2 < t.crossingIndexOn (t.ResidualAmbient v g)) :
    p - 1 ≤ (t.ResidualAmbient v g).card := by
  have h := t.crossingIndexOn_le_card (t.ResidualAmbient v g)
  omega

/-! ## §3 — Full-cardinality bookkeeping (fence technique 3: the literal
injection and the uniqueness argument; helpers for S5) -/

/-- **PROVED (helper): a full-size independent subset forces the whole
ambient set independent.** Any witness in the size-`|V|` filter is a subset
of `V` with `V`'s own cardinality, hence IS `V`
(`Finset.eq_of_subset_of_card_le`). -/
theorem indepSet_of_full_indepCount (t : RTree) (V : Finset (List ℕ))
    (h : 1 ≤ t.indepCountOn V V.card) : t.IndepSet V := by
  unfold RTree.indepCountOn at h
  have hpos : (V.powerset.filter (fun S => t.IndepSet S ∧ S.card = V.card)).Nonempty :=
    Finset.card_pos.mp (by omega)
  obtain ⟨S, hS⟩ := hpos
  rw [Finset.mem_filter, Finset.mem_powerset] at hS
  obtain ⟨hsub, hind, hcard⟩ := hS
  have hSV : S = V := Finset.eq_of_subset_of_card_le hsub (by omega)
  rwa [← hSV]

/-- **PROVED (helper): at most one independent subset of full size** — the
size-`|V|` filter is contained in `{V}`. -/
theorem indepCountOn_card_le_one (t : RTree) (V : Finset (List ℕ)) :
    t.indepCountOn V V.card ≤ 1 := by
  unfold RTree.indepCountOn
  have hsub : V.powerset.filter (fun S => t.IndepSet S ∧ S.card = V.card)
      ⊆ {V} := by
    intro S hS
    rw [Finset.mem_filter, Finset.mem_powerset] at hS
    rw [Finset.mem_singleton]
    exact Finset.eq_of_subset_of_card_le hS.1 (by omega)
  calc (V.powerset.filter (fun S => t.IndepSet S ∧ S.card = V.card)).card
      ≤ ({V} : Finset (Finset (List ℕ))).card := Finset.card_le_card hsub
    _ = 1 := Finset.card_singleton V

/-- **PROVED (helper — THE INJECTION): an independent set of size `m` has
at least `m` independent subsets of size `m − 1`.** The erase map
`z ↦ V.erase z` is injective on `V` and lands in the size-`(m−1)`
independent filter. A literal combinatorial injection — fence-legal by the
contract's own Q1–Q6 vocabulary. -/
theorem card_le_indepCountOn_pred_of_indepSet (t : RTree) {V : Finset (List ℕ)}
    (hV : t.IndepSet V) : V.card ≤ t.indepCountOn V (V.card - 1) := by
  rcases Finset.eq_empty_or_nonempty V with rfl | hne
  · simp
  unfold RTree.indepCountOn
  have himg : V.image (fun z => V.erase z)
      ⊆ V.powerset.filter (fun S => t.IndepSet S ∧ S.card = V.card - 1) := by
    intro S hS
    rw [Finset.mem_image] at hS
    obtain ⟨z, hz, rfl⟩ := hS
    rw [Finset.mem_filter, Finset.mem_powerset]
    refine ⟨Finset.erase_subset z V,
      ⟨(Finset.erase_subset z V).trans hV.1,
       fun u hu w hw => hV.2 u (Finset.mem_of_mem_erase hu) w (Finset.mem_of_mem_erase hw)⟩,
      Finset.card_erase_of_mem hz⟩
  have hinj : Set.InjOn (fun z => V.erase z) V := by
    intro a ha b hb hab
    have hab' : V.erase a = V.erase b := hab
    by_contra hne'
    have hmem : b ∈ V.erase a := Finset.mem_erase.mpr ⟨fun h => hne' h.symm, hb⟩
    rw [hab'] at hmem
    exact (Finset.mem_erase.mp hmem).1 rfl
  have hcard : (V.image (fun z => V.erase z)).card = V.card :=
    Finset.card_image_of_injOn hinj
  calc V.card = (V.image (fun z => V.erase z)).card := hcard.symm
    _ ≤ _ := Finset.card_le_card himg

/-! ## §4 — STRATUM S5: the G2 cardinality boundary closes, PREMISE-FREE
(CLAIM-C3-5 — new this cycle) -/

/-- **PROVED — S5, THE SIGN PART, PREMISE-FREE, NEW THIS CYCLE.** On
`x(U) > p−2` with `|U| = p−1` exactly (the G2 cardinality boundary — the
smallest `|U|` the previous theorem permits on G2):

* the chain lemma reaches rank `p−1 = |U|`, so `U` contains an independent
  set of FULL size — `U` itself is independent;
* uniqueness gives `i_{p−1}(U) ≤ 1`; the erase injection gives
  `i_{p−2}(U) ≥ p−1`;
* so `D = i_{p−1}(U) − i_{p−2}(U) ≤ 1 − (p−1) = 2 − p ≤ 0`.

No unimodality, no log-concavity, no external premise, no Premise K, no
K-SCOPE: injection + cardinality + the governed crossing layer only. This
is the first G2 sub-stratum closed in this lineage, and the first stratum
anywhere in it closed by an INJECTION rather than by counting degeneracy or
the crossing spec alone. -/
theorem residual_nonpos_of_card_eq_on_G2 (t : RTree) (v g : List ℕ) {p : ℕ}
    (hp : 2 ≤ p) (hcard : (t.ResidualAmbient v g).card = p - 1)
    (hx : p - 2 < t.crossingIndexOn (t.ResidualAmbient v g)) :
    t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) ≤ 0 := by
  obtain ⟨k, rfl⟩ : ∃ k, p = k + 2 := ⟨p - 2, by omega⟩
  have hc : ((k + 2 : ℕ) : ℤ) - 2 = (k : ℤ) := by push_cast; ring
  rw [hc, t.DeltaOnZ_natCast]
  unfold RTree.DeltaOn
  have hcard' : (t.ResidualAmbient v g).card = k + 1 := by omega
  have hxk : k < t.crossingIndexOn (t.ResidualAmbient v g) := by simpa using hx
  have hch : 1 ≤ t.indepCountOn (t.ResidualAmbient v g) (k + 1) :=
    t.one_le_indepCountOn_of_le_crossingIndexOn (t.ResidualAmbient v g) (by omega)
  have hUind : t.IndepSet (t.ResidualAmbient v g) := by
    apply t.indepSet_of_full_indepCount
    rwa [hcard']
  have hup : t.indepCountOn (t.ResidualAmbient v g) (k + 1) ≤ 1 := by
    have h := t.indepCountOn_card_le_one (t.ResidualAmbient v g)
    rwa [hcard'] at h
  have hlow : k + 1 ≤ t.indepCountOn (t.ResidualAmbient v g) k := by
    have h := t.card_le_indepCountOn_pred_of_indepSet hUind
    rw [hcard'] at h
    simpa using h
  omega

/-- **STRATUM S5 CLOSES THE INSTANCE, premise-free.** With the antecedent
in hand, `D ≤ 0` closes via the consumed C1 sufficiency. -/
theorem ambientInstance_of_card_eq_on_G2 (t : RTree) {v : List ℕ}
    (hv : v ∈ t.leaves) {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g)
    {p : ℕ} (hk : K_A t p = 1)
    (hhyp : t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0)
    (hcard : (t.ResidualAmbient v g).card = p - 1)
    (hx : p - 2 < t.crossingIndexOn (t.ResidualAmbient v g)) :
    t.Bgen v (p : ℤ) + t.Bgen v ((p : ℤ) - 1) < 0 := by
  have hp2 := t.two_le_of_K_A_eq_one hk
  exact t.ambientInstance_of_residual_nonpos hv hOther (by omega) hhyp
    (t.residual_nonpos_of_card_eq_on_G2 v g hp2 hcard hx)

/-- **PROVED: SIG-C3-3's cell is EMPTY.** A firing of `S5Violation`
contradicts `residual_nonpos_of_card_eq_on_G2` and therefore indicts the
instrument, never the theorem. -/
theorem not_s5Violation (t : RTree) (v g : List ℕ) (p : ℕ) :
    ¬ t.S5Violation v g p := by
  rintro ⟨hv, -, hOther, hk, -, hcard, hx, hpos⟩
  have hp2 := t.two_le_of_K_A_eq_one hk
  have h := t.residual_nonpos_of_card_eq_on_G2 v g hp2 hcard hx
  omega

/-! ## §5 — The second deletion split and the pair normal form
(CLAIM-C3-6, CLAIM-C3-7) -/

/-- **PROVED (CLAIM-C3-6): the deletion identity at rank `p`** —
`Δ_p(W) = Δ_p(W∖g) + Δ_{p−1}(U)`. The ONE new instantiation of the consumed
governed `DeltaOn_eq_add_Bgen_on` this file adds (the C1 artifact
instantiated it at rank `p−1`; same ambient `W`, same deleted vertex `g`,
one rank higher). Not restated, not re-proved, not varied. -/
theorem ambient_split_p (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) (p : ℕ) :
    t.Bgen v (p : ℤ) =
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ))
        + t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 1) := by
  have hgW : g ∈ t.vertices \ t.closedNbhd v := t.otherNbr_mem_ambient hv hOther
  have hrec := t.DeltaOn_eq_add_Bgen_on (Finset.sdiff_subset) hgW p
  unfold RTree.Bgen RTree.ResidualAmbient
  rw [t.DeltaOnZ_natCast, t.DeltaOnZ_natCast]
  exact hrec

/-- **PROVED (CLAIM-C3-7): the pair normal form.** The conclusion decomposes
as a two-step on the single TREE `W∖g = T∖N[s]` at rank `p−1` plus a
two-step on the single FOREST `U` at rank `p−2`:
`C = [Δ_p + Δ_{p−1}](W∖g) + [Δ_{p−1} + Δ_{p−2}](U)`.

**Screened DEAD BY CONSTRUCTION as a cross-check, in advance** (registration
file §4, CLAIM-C3-7): this is an algebraic identity in its inputs with the
target's own conclusion. It is retained as a NORMAL FORM only — the exact
localization of the G2 slack onto the pair `(W∖g, U)` — and is never
reported as an independent confirmation. -/
theorem ambientInstance_iff_pair (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) {p : ℕ} (hp : 1 ≤ p) :
    (t.Bgen v (p : ℤ) + t.Bgen v ((p : ℤ) - 1) < 0) ↔
      (t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ))
        + t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1)
        + t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 1)
        + t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) < 0) := by
  rw [t.ambient_split_p hv hOther p, t.ambient_split hv hOther hp]
  constructor <;> intro h <;> omega

/-! ## §6 — THE DEFICIT-LOCATION THEOREM (CLAIM-C3-8 — new this cycle) -/

/-- **PROVED — DEFICIT LOCATION, PREMISE-FREE, NEW THIS CYCLE.** On every
hypothesis instance, the antecedent's deficit must be borne somewhere: it is
IMPOSSIBLE that both `x(U) > p−1` and `x(W∖g) > p`. For if both crossing
indices were that deep, the rank-`p` split would make the antecedent
quantity a sum of three governed-nonnegative deltas — contradiction with
`A < 0`.

Reading: **either the residual forest `U` crosses by rank `p−1`** (so on G2
its crossing index is PINNED to the window `(p−2, p−1]`, i.e. `x(U) = p−1`
exactly), **or the deleted tree `W∖g = T∖N[s]` crosses by rank `p`.** The
deep-G2 region `x(U) ≥ p` therefore forces `x(W∖g) ≤ p` — a premise-free
structural constraint on where the remaining difficulty can live, in
governed crossing-index vocabulary only. -/
theorem deficit_location (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {g : List ℕ} (hOther : t.OtherNbr (t.support v) v g) {p : ℕ} (hp : 2 ≤ p)
    (hhyp : t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0) :
    t.crossingIndexOn (t.ResidualAmbient v g) ≤ p - 1 ∨
      t.crossingIndexOn ((t.vertices \ t.closedNbhd v).erase g) ≤ p := by
  by_contra h
  push_neg at h
  obtain ⟨hU, hWg⟩ := h
  obtain ⟨k, rfl⟩ : ∃ k, p = k + 2 := ⟨p - 2, by omega⟩
  have e1 : ((k + 2 : ℕ) : ℤ) - 1 = ((k + 1 : ℕ) : ℤ) := by push_cast; ring
  have hnU : 0 ≤ t.DeltaOn (t.ResidualAmbient v g) (k + 1) :=
    t.DeltaOn_nonneg_of_lt_crossingIndexOn _ (by omega)
  have hnW1 : 0 ≤ t.DeltaOn ((t.vertices \ t.closedNbhd v).erase g) (k + 2) :=
    t.DeltaOn_nonneg_of_lt_crossingIndexOn _ (by omega)
  have hnW2 : 0 ≤ t.DeltaOn ((t.vertices \ t.closedNbhd v).erase g) (k + 1) :=
    t.DeltaOn_nonneg_of_lt_crossingIndexOn _ (by omega)
  rw [t.ambient_split_p hv hOther (k + 2)] at hhyp
  rw [e1] at hhyp
  rw [t.DeltaOnZ_natCast, t.DeltaOnZ_natCast, t.DeltaOnZ_natCast] at hhyp
  omega

/-- **PROVED: SIG-C3-4's cell is EMPTY.** A firing of `DLViolation`
contradicts `deficit_location` and therefore indicts the instrument, never
the theorem. -/
theorem not_dlViolation (t : RTree) (v g : List ℕ) (p : ℕ) :
    ¬ t.DLViolation v g p := by
  rintro ⟨hv, -, hOther, hk, hhyp, hU, hWg⟩
  have hp2 := t.two_le_of_K_A_eq_one hk
  rcases t.deficit_location hv hOther hp2 hhyp with h | h <;> omega

/-! ## §7 — THE PROBE RE-ISSUE (repair C2-R1(a)) and the sharpened
reduction (CLAIM-C3-9) -/

/-- **THE REDUCTION OF RECORD, RE-ISSUED UNDER THE ROUTE NAMESPACE (repair
C2-R1(a); FC-R14-4 R-5, the S1-folded form).** Statement identical, token
for token, to the adjudicator-verified C2 stage-4 probe
`OPP_ambientTargetDeg2_of_G1restricted_G2`: `AmbientTargetDeg2` follows
from (i) `HG1` on **G1 := (p−2 < |U|) ∧ (x(U) < p−2)** — the per-instance
hypothesis `D ≤ 0`; and (ii) `HG2` — the slack `D ≤ H−1` — on
**G2 := (x(U) > p−2)**. S1 and S4 are discharged inside, needing neither.

The antecedents carry their own premises: the only known discharge path for
`HG1` is the P1-onto-`U` composition, which carries **PREMISE K + K-SCOPE +
the unbuilt RES-12 bridge** on its face (FC-R14-5); `HG2` is open, and per
the corrected negative of record the handle's demonstrated reach does not
extend to it. **`AmbientTargetDeg2` is NOT asserted.** With this compiled
artifact the as-compiled `ambientTargetDeg2_of_G1_G2` (C2) is superseded of
record and MUST NOT be quoted as economizing the premise. -/
theorem ambientTargetDeg2_of_G1restricted_G2
    (HG1 : ∀ (t : RTree) (v g : List ℕ) (p : ℕ),
      v ∈ t.leaves → t.degree (t.support v) = 2 → t.OtherNbr (t.support v) v g →
      K_A t p = 1 →
      t.Bgen v (p : ℤ) +
        t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 →
      p - 2 < (t.ResidualAmbient v g).card →
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
  by_cases hcard : (t.ResidualAmbient v g).card ≤ p - 2
  · exact t.ambientInstance_of_card_le hv hOther hk hhyp hcard
  · push_neg at hcard
    rcases lt_trichotomy (t.crossingIndexOn (t.ResidualAmbient v g)) (p - 2) with h | h | h
    · exact t.ambientInstance_of_residual_nonpos hv hOther (by omega) hhyp
        (HG1 t v g p hv hd2 hOther hk hhyp hcard h)
    · exact t.ambientInstance_of_crossing_eq hv hOther hk hhyp h
    · rw [t.ambientInstance_iff_slack hv hOther (by omega)]
      exact HG2 t v g p hv hd2 hOther hk hhyp h

/-- **PROVED (CLAIM-C3-9): THE SHARPENED REDUCTION — S5 folded into the
guard.** Same `HG1` as the re-issued R-5; `HG2` further restricted to
`|U| ≥ p` (i.e. `p − 1 < |U|`). S1, S4, AND S5 are discharged inside. By
`residual_card_ge_of_G2` the G2 cell only ever has `|U| ≥ p−1`, and the
boundary `|U| = p−1` is S5 — so this reduction's `HG2` quantifies over
exactly the G2 instances that remain genuinely open after this cycle.
**`AmbientTargetDeg2` is NOT asserted; the antecedents carry their own
premises (K-SCOPE rides the `HG1` discharge path).** -/
theorem ambientTargetDeg2_of_G1restricted_G2sharp
    (HG1 : ∀ (t : RTree) (v g : List ℕ) (p : ℕ),
      v ∈ t.leaves → t.degree (t.support v) = 2 → t.OtherNbr (t.support v) v g →
      K_A t p = 1 →
      t.Bgen v (p : ℤ) +
        t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 →
      p - 2 < (t.ResidualAmbient v g).card →
      t.crossingIndexOn (t.ResidualAmbient v g) < p - 2 →
        t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) ≤ 0)
    (HG2 : ∀ (t : RTree) (v g : List ℕ) (p : ℕ),
      v ∈ t.leaves → t.degree (t.support v) = 2 → t.OtherNbr (t.support v) v g →
      K_A t p = 1 →
      t.Bgen v (p : ℤ) +
        t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 →
      p - 1 < (t.ResidualAmbient v g).card →
      p - 2 < t.crossingIndexOn (t.ResidualAmbient v g) →
        t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2)
          ≤ -(t.Bgen v (p : ℤ) +
              t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1)) - 1) :
    AmbientTargetDeg2 := by
  intro t v g p hv hd2 hOther hk hhyp
  have hp2 := t.two_le_of_K_A_eq_one hk
  by_cases hcard : (t.ResidualAmbient v g).card ≤ p - 2
  · exact t.ambientInstance_of_card_le hv hOther hk hhyp hcard
  · push_neg at hcard
    rcases lt_trichotomy (t.crossingIndexOn (t.ResidualAmbient v g)) (p - 2) with h | h | h
    · exact t.ambientInstance_of_residual_nonpos hv hOther (by omega) hhyp
        (HG1 t v g p hv hd2 hOther hk hhyp hcard h)
    · exact t.ambientInstance_of_crossing_eq hv hOther hk hhyp h
    · by_cases hc2 : (t.ResidualAmbient v g).card = p - 1
      · exact t.ambientInstance_of_card_eq_on_G2 hv hOther hk hhyp hc2 h
      · rw [t.ambientInstance_iff_slack hv hOther (by omega)]
        exact HG2 t v g p hv hd2 hOther hk hhyp (by omega) h

/-- **PROVED (sanity direction): the R-5 `HG2` implies the sharpened one**,
so the sharpened reduction is strictly more general — anything discharging
R-5's antecedents discharges these, not conversely. -/
theorem sharpHG2_of_HG2
    (HG2 : ∀ (t : RTree) (v g : List ℕ) (p : ℕ),
      v ∈ t.leaves → t.degree (t.support v) = 2 → t.OtherNbr (t.support v) v g →
      K_A t p = 1 →
      t.Bgen v (p : ℤ) +
        t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 →
      p - 2 < t.crossingIndexOn (t.ResidualAmbient v g) →
        t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2)
          ≤ -(t.Bgen v (p : ℤ) +
              t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1)) - 1) :
    ∀ (t : RTree) (v g : List ℕ) (p : ℕ),
      v ∈ t.leaves → t.degree (t.support v) = 2 → t.OtherNbr (t.support v) v g →
      K_A t p = 1 →
      t.Bgen v (p : ℤ) +
        t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 →
      p - 1 < (t.ResidualAmbient v g).card →
      p - 2 < t.crossingIndexOn (t.ResidualAmbient v g) →
        t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2)
          ≤ -(t.Bgen v (p : ℤ) +
              t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1)) - 1 :=
  fun t v g p hv hd2 hO hk hh _ hx => HG2 t v g p hv hd2 hO hk hh hx

end RTree
end
