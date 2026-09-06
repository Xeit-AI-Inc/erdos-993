import R14C2T.StratumG
import R14C1P.ForestCorollaries

/-!
# R14C3P.AmbientBridge — RES-12, the ambient-identification half: the
# TRANSPORT sub-half compiled; the IDENTIFICATION sub-half stated as a named,
# undischarged premise (r14 Cycle 3, route R14C3-P, work item W2(ii))

PROTOTYPE (grade `RG` AT BEST, and only after two critic legs and a controller
gate act; NOTHING here is `governed` and nothing is `formally_verified`).

## Ceiling honesty (undetachable)

TREE / FOREST / TRANSFER / COUNTEREXAMPLE are open before and after this file.
`AmbientTargetDeg2`, (α), (β), (A), (B) are targets, never asserted; nothing
below proves, or claims to prove, any of them, and nothing below closes G1:
every theorem is a conditional whose hypotheses are live and displayed. No
bounded zero and no atlas margin is cited; no measurement is run.

## What this file is, exactly

The C2 adjudication (§6.4) ruled RES-12 PARTIALLY CLOSED (forest scope, by P) /
OPEN (ambient identification), and assigned the ambient half to C3 W2: *"the
theorem identifying the induced forest on `ResidualAmbient v g` with a
`List RTree` decomposition and transporting `Unimodal (RForest.indepNNSeq cs)`
to `SeqUnimodalOn t U`"*. This file delivers the honest maximum of that item
reachable in this corpus, and states precisely what it does NOT deliver:

* **DELIVERED — the TRANSPORT sub-half, compiled.** If ANY `NNSeq` matches the
  residual's independent-set counts rank-for-rank, then unimodality of that
  sequence transports to `SeqUnimodalOn` of the residual
  (`seqUnimodalOn_of_unimodal_count`, `seqUnimodalOn_residual_of_identification`).
* **DELIVERED — the G1 closure as a premise-carrying implication END-TO-END,
  compiled** (`G1_closure_of_identification`): PREMISE K + K-SCOPE + the
  IDENTIFICATION premise (named, on the face, undischarged) ⟹ the G1-side
  conclusion `D ≤ 0` on `x(U) ≤ p−2`, through the consumed FC-R14-4 R-6
  statement. This is FC-R14-5's three-premise set, exactly, as Lean hypotheses.
* **NOT DELIVERED — the IDENTIFICATION sub-half.** No `List RTree` is
  constructed from `(t, v, g)`, and no theorem here discharges
  `IdentifiesResidualCounts`. The exact obstruction is recorded below and in
  the route deliverable, with a compiled probe: the sealed T-lineage
  (`R12C6T.CorridorIngredients`) and the sealed P-lineage (r10
  `ExtensionProfile`) each declare a ROOT-LEVEL `inductive RTree`, so no Lean
  file can import both worlds (`Scratch/ClashProbe.lean` exhibits the failure
  verbatim); and neither world contains an induced-subforest constructor.
  Building one fresh would re-derive governed content (forbidden) and would
  overlap the `RTree` model-adequacy citation (r10 claim C6), which STAYS A
  CITATION per the C3 allocation W2(iii) — no silent upgrade.

## PREMISE ACCOUNTING (all on the face, none dischargeable in the kernel)

1. **PREMISE K** (`KL-25`, Radcliffe-via-K–L, external computational premise;
   cited, never reproduced, never upgraded): here the hypothesis `hKL`, in the
   adjacent-log-concavity form Kadrawi–Levit state, against an abstract order
   map `ord`.
2. **K-SCOPE** (the third premise of the handle line, C2-AMD-3): *every
   component of the residual has order ≤ 25* — here the hypothesis `hKSCOPE`
   against the same `ord`. DISCLOSURE: under a TOTAL K-SCOPE hypothesis the
   pair (`hKL`, `hKSCOPE`) jointly amounts to adjacent log-concavity of every
   component; the two are kept separate so each premise of record is legible,
   not because the conjunction is weaker.
3. **THE IDENTIFICATION** (`IdentifiesResidualCounts` + `hadm`): the unbuilt
   RES-12 ambient half, packaged as a named hypothesis. `hadm` (each component
   sequence nonzero with positive-interval support) is exactly what the r10
   governed `RTree.indepNNSeq_ne_zero` / `indepNNSeq_positiveIntervalSupport`
   would supply were the identification constructed; it is part of the
   identification premise, not an extra assumption smuggled in.

`AdjacentLogConcave`, `PositiveIntervalSupport`, `TRS2`, `Unimodal` here are
statements about ABSTRACT `NNSeq` terms; nothing asserts them of any tree or
forest (F1/F2 not approached — see the fence check).

## Fence check (per-object)

No computation, `#eval`, `decide`, `native_decide`, search, or sampling occurs.
F1/F2: log-concavity/unimodality appear ONLY as hypotheses; no statement
concludes either of any concrete object. F11 (the r11 transport lemma, 3
disjuncts, adjudicated negative): the "transport" here is NOT that object — it
is a sign-reading of a coefficient-matching hypothesis, introduces no disjunct
structure, and reopens nothing; no semantic distinction is requested because no
fence row is approached. F3–F10, F12, the r12/r13 transitive additions, killed
candidates, and the r13 one-move charge: none invoked. The refuted universal
`Δ_{p−2}(U) ≤ 0` appears nowhere; the conclusion of `G1_closure_of_identification`
is scoped to `x(U) ≤ p−2` by hypothesis `hx`, which is FC-R14-5's demonstrated
reach — this file makes NO claim on G2.

## Reserved zone (verified in proof terms)

No proof below mentions, unfolds, or invokes `Ipoly`/`Apoly`/`Bpoly`/`Fpoly`,
the availability recursion, any blocked-root state, or any subtraction carrying
an inequality across the I/A/B split. Of the T-lineage this file uses exactly:
`RTree.SeqUnimodalOn`, `RTree.ResidualAmbient`, `RTree.indepCountOn`,
`RTree.DeltaOn`, `RTree.crossingIndexOn`, and the consumed R-6 statement
`RTree.residual_nonpos_of_unimodal_of_crossing_le` (FC-R14-4 row R-6:
conditional implication only — consumed at exactly that standing, never quoted
as more). The only subtraction any inequality crosses is the DEFINITION of
`DeltaOn` (`i_{r+1} − i_r`), expressly legal under the zone's carve-out.

## INVARIANCE (one line per new object)

`IdentifiesResidualCounts t v g s f` is a function of `(t, v, g, s, f)` alone,
through `Finset.prod`, `AddMonoidAlgebra` coefficients, and
`indepCountOn ∘ ResidualAmbient`; invariant under relabelling of `ι`
preserving `f`. `seqUnimodalOn_of_unimodal_count` exhibits the witness
`m.toNat` from an existentially bound `m`; the PROPERTY concluded does not
depend on the witness. Every theorem is a proposition about its stated
arguments only; no vertex ordering and no address convention enters.

## Consumed, never re-derived

* `R14C2T.StratumG` (C2 route artifact, sealed; consumed READ-ONLY by srcDir
  at its sealed path) — ONLY the FC-R14-4 rows it carries at their ruled
  standings, principally R-6.
* `R14C1P.ForestCorollaries` (r14 C1, RG at abstract scope) — `core`,
  `mem_core`, `core_reduction`, `Unimodal.one`.
* `Erdos993C8U1Base` / `Convolution` / `R12C2P.P1` (r10/r12 lineage) —
  `NNSeq`, `TRS2`, `AdjacentLogConcave`, `PositiveIntervalSupport`,
  `trs2_iff_adjacentLogConcave`, `Unimodal`.
* Transitively (via `R14C2T.StratumG`): `R14C1F.AmbientStrata` and the sealed
  r12 `R12C6T.*` chain, READ-ONLY at their sealed paths.
-/

open scoped Classical
open Erdos993C8U1
noncomputable section

namespace R14C3P

open R14C1P

/-- **THE IDENTIFICATION PREMISE (RES-12, ambient half) — a NAMED hypothesis,
NEVER discharged in this file.** An abstract component family `(s, f)`
identifies the residual's counts when the product sequence's coefficient at
every rank `r` IS the number of independent sets of size `r` inside
`ResidualAmbient v g`. This is exactly what the unbuilt induced-forest
identification would provide through `RForest.indepNNSeq_eq_prod`; here it is
the premise's NAME, so that every consumer carries it on the face. -/
def IdentifiesResidualCounts (t : RTree) (v g : List ℕ)
    {ι : Type*} (s : Finset ι) (f : ι → NNSeq) : Prop :=
  ∀ r : ℕ, (∏ j ∈ s, f j).coeff (r : ℤ)
    = (t.indepCountOn (t.ResidualAmbient v g) r : NNRat)

/-- **THE TRANSPORT SUB-HALF OF RES-12'S AMBIENT HALF, COMPILED.
PREMISE-FREE** (its hypotheses are the transported facts themselves). If any
`NNSeq` matches an ambient set's independent-set counts rank-for-rank, its
unimodality transports to `SeqUnimodalOn`. The witness passes through
`Int.toNat`: ranks below a nonpositive mode do not exist in ℕ, so the mode
truncates to `0` and only the falling side is used there. -/
theorem seqUnimodalOn_of_unimodal_count (t : RTree) (V : Finset (List ℕ))
    (c : NNSeq) (hid : ∀ r : ℕ, c.coeff (r : ℤ) = (t.indepCountOn V r : NNRat))
    (hu : Unimodal c) : t.SeqUnimodalOn V := by
  obtain ⟨m, hup, hdown⟩ := hu
  refine ⟨m.toNat, ?_, ?_⟩
  · intro r hr
    have hlt : (r : ℤ) < m := by omega
    have h := hup (r : ℤ) hlt
    have hcast : ((r : ℤ) + 1) = ((r + 1 : ℕ) : ℤ) := by push_cast; ring
    rw [hid r, hcast, hid (r + 1)] at h
    have hnat : t.indepCountOn V r ≤ t.indepCountOn V (r + 1) := by exact_mod_cast h
    unfold RTree.DeltaOn
    omega
  · intro r hr
    have hge : m ≤ (r : ℤ) := by omega
    have h := hdown (r : ℤ) hge
    have hcast : ((r : ℤ) + 1) = ((r + 1 : ℕ) : ℤ) := by push_cast; ring
    rw [hid r, hcast, hid (r + 1)] at h
    have hnat : t.indepCountOn V (r + 1) ≤ t.indepCountOn V r := by exact_mod_cast h
    unfold RTree.DeltaOn
    omega

/-- **The transport, addressed at the residual (the W2(ii) phrasing).** Under
the IDENTIFICATION premise — on the face, undischarged — unimodality of the
identifying product transports into `SeqUnimodalOn t (ResidualAmbient v g)`.
The `Unimodal` hypothesis is a hypothesis: nothing here asserts it of any
object (F1/F2 not approached). -/
theorem seqUnimodalOn_residual_of_identification (t : RTree) (v g : List ℕ)
    {ι : Type*} (s : Finset ι) (f : ι → NNSeq)
    (hID : IdentifiesResidualCounts t v g s f)
    (hu : Unimodal (∏ j ∈ s, f j)) :
    t.SeqUnimodalOn (t.ResidualAmbient v g) :=
  seqUnimodalOn_of_unimodal_count t _ _ hID hu

/-- **PREMISE K + K-SCOPE ⟹ the identifying product is unimodal (abstract
scope). CARRIES PREMISE K (`hKL`) and K-SCOPE (`hKSCOPE`) on the face.** Under
a TOTAL K-SCOPE, every component of admissible shape is `TRS2`, so the core is
EMPTY and `core_reduction` closes with `Unimodal.one`. The numeral 25 is the
premise's property, not this program's. DISCLOSURE: with `hKSCOPE` total,
(`hKL`, `hKSCOPE`) jointly amount to `AdjacentLogConcave (f j)` for every
`j ∈ s`; they are kept as two hypotheses so each premise of record stays
legible on the face. -/
theorem unimodal_prod_of_KL_and_KSCOPE {ι : Type*} (s : Finset ι)
    (f : ι → NNSeq) (ord : ι → ℕ)
    (hadm : ∀ j ∈ s, f j ≠ 0 ∧ PositiveIntervalSupport (f j))
    (hKL : ∀ j ∈ s, ord j ≤ 25 → AdjacentLogConcave (f j))
    (hKSCOPE : ∀ j ∈ s, ord j ≤ 25) :
    Unimodal (∏ j ∈ s, f j) := by
  have htrs : ∀ j ∈ s, TRS2 (f j) := fun j hj =>
    (trs2_iff_adjacentLogConcave (f j) (hadm j hj).1 (hadm j hj).2).mpr
      (hKL j hj (hKSCOPE j hj))
  have hcore : core s f = ∅ := by
    rw [Finset.eq_empty_iff_forall_notMem]
    intro j hj
    exact (mem_core.mp hj).2 (htrs j (mem_core.mp hj).1)
  exact core_reduction s f (by rw [hcore, Finset.prod_empty]; exact Unimodal.one)

/-- **THE END-TO-END G1 CLOSURE, PREMISE-CARRYING, COMPILED — the W2(ii)
deliverable at its honest maximum.** FC-R14-5's full three-premise set, as
Lean hypotheses on the face, none dischargeable in the kernel:

1. PREMISE K (`hKL`) — Radcliffe-via-K–L, cited, never upgraded;
2. K-SCOPE (`hKSCOPE`) — every component of order ≤ 25;
3. the RES-12 IDENTIFICATION (`hID` + `hadm`) — UNBUILT, here a named premise.

Conclusion: on the handle's demonstrated reach `x(U) ≤ p−2` (hypothesis `hx`;
FC-R14-5), the instance's G1-side requirement `D ≤ 0` holds — through the
consumed FC-R14-4 row R-6 (`residual_nonpos_of_unimodal_of_crossing_le`),
consumed at its ruled standing: CONDITIONAL IMPLICATION ONLY. **This theorem
makes T's G1 closure a consumable premise-carrying implication end-to-end; it
does NOT close G1, does NOT touch G2, and asserts no target.** -/
theorem G1_closure_of_identification (t : RTree) (v g : List ℕ) {p : ℕ}
    (hp : 2 ≤ p) {ι : Type*} (s : Finset ι) (f : ι → NNSeq) (ord : ι → ℕ)
    (hID : IdentifiesResidualCounts t v g s f)
    (hadm : ∀ j ∈ s, f j ≠ 0 ∧ PositiveIntervalSupport (f j))
    (hKL : ∀ j ∈ s, ord j ≤ 25 → AdjacentLogConcave (f j))
    (hKSCOPE : ∀ j ∈ s, ord j ≤ 25)
    (hx : t.crossingIndexOn (t.ResidualAmbient v g) ≤ p - 2) :
    t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) ≤ 0 :=
  t.residual_nonpos_of_unimodal_of_crossing_le v g hp
    (seqUnimodalOn_residual_of_identification t v g s f hID
      (unimodal_prod_of_KL_and_KSCOPE s f ord hadm hKL hKSCOPE))
    hx

end R14C3P
