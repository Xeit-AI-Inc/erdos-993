import R14C4T.ShadowBand

/-!
# R18C3-T3 — GATE-1 re-dispatch: structure-carrying faithful transcription
of the governed `HG2` antecedent (r18 Cycle 3, T-orientation)

**Route `R18C3-T3`, r18 Cycle 3, stage-3, isolated. AMD-9 role/effort line:
model `Sonnet 5`, effort `xhigh`; exact resolved model identifier
`claude-sonnet-5` (Anthropic's naming for this session; disclosed on the
face, not silently accepted). Orientation: T (toward `HG2`) — protected;
this route builds toward the object at exact scope and adopts no sibling
conclusion.**

Charge: `CYCLE3-ALLOCATION.md` seat T-3, bound to `RUL-T3-c`
(`C2-GATE-RECORD.md` §1, sha256 `75558616f4bc0590…`, verified before this
route began — see the deliverable `.md`'s §1). GATE-1 was DENIED at C2:
`SurvivingRegionD2Faithful` kept `card`, `crossIdx`, `combined`, `D` as
FREE `ℕ`/`ℤ` parameters, unconnected to any real tree, and was therefore
kernel-refutable at `(p,card,crossIdx,combined,D) = (2,2,1,−1,5)` — the
SAME witness that struck its C1 predecessor `HG2SurvivingRegion`
(`R18C1T3/Boundary.lean:118-123`, `cycles/cycle-1/lean/R18C1-T3/`, sealed).
`RUL-T3-c` requires the replacement to bind these four quantities to their
GOVERNED DEFINITIONS, structure-carrying: **"(i) Import `RTree` and
transcribe the governed antecedent literally, with its binder — the gold
standard, and the only one that closes the question"** (the C2 adjudicator's
own ranking, `cycles/cycle-2/stage6/C2-SYNTHESIS.md:706-708`, sealed),
falling back to a carrier/field-package form only if (i) is unavailable.

**This route takes option (i).** The full governed `RTree` development is
imported LITERALLY — not re-derived, not re-typed, not paraphrased — via
the exact chain that C1's critic `R18C1-T3-CRIT-F` already assembled and
built clean at this run's own pinned toolchain
(`scratchpad/R18C1-T3-CRIT-F/ChainProbe/`, this run's own prior-cycle
scratch, legal read per `RUL-C2-3`): `R12C6T.CorridorIngredients` (the base
`inductive RTree`, `vertices`, `addrAdjacent`, `IndepSet`, `degree`,
`leaves`, `support`, `indepCountOn`, `DeltaOn`, `indepCountOnZ`, `DeltaOnZ`,
`closedNbhd`, `Bgen`, `crossingIndexOn`, `crossingIndex`) →
`R12C6T.CorridorReduction` → `R12C6T.Targets` (`K_A`) →
`R12C6T.Deg2Reduction` (`AmbientTargetDeg2`, `OtherNbr`) →
`R14C1F.AmbientStrata` (`ResidualAmbient`) → `R14C2T.StratumG` →
`R14C3T.G2Slack` → `R14C4T.ShadowBand` (the pinned file itself,
`ambientTargetDeg2_of_G1wide_G2wide`, digest
`86ed073fce05ac699efc62923ac4b868dd794a8500fd9f1fdac0f2f42d04911c`,
verified in the deliverable). Every `.lean` file in this project's
`R12C6T/`, `R14C1F/`, `R14C2T/`, `R14C3T/`, `R14C4T/` directories is a
byte-identical copy of that already-verified chain (digests compared in
the deliverable, all MATCH); nothing in the governed chain is edited.

**CEILING HONESTY (restated verbatim per contract discipline).** TREE /
FOREST / TRANSFER / COUNTEREXAMPLE are open before this file and remain
open after it. `HG2`, `AmbientTargetDeg2`, `(α)`, `(β)`, `(A)`, `(B)` are
PROOF TARGETS, never asserted true anywhere below. Premise K and K-SCOPE
are external and ride on the governed face wherever quoted; nothing below
discharges or uses them (K-SCOPE is not placed on any face here — leg 4,
`K_A t p = 1`, is the governed antecedent's own hypothesis, not a K-SCOPE
placement, exactly as `R18C2-T3.md` §1 disclosed for the same leg).
Computation is evidence, never proof; no bounded zero is evidence of
anything. Route ceiling `RG`; nothing here is `formally_verified`.
**Mechanism counterexamples are never target counterexamples.** **The
faithful def below proves nothing about `HG2`** — every new declaration in
this file is either a `def` (asserts nothing) or a `theorem` whose content
is a fidelity/instantiation fact about the TRANSCRIPTION, never a step
toward `HG2`, `AmbientTargetDeg2`, or any of `(α)/(β)/(A)/(B)`.

**CLAIM DISCIPLINE.** `HG2Faithful` transcribes the existing key
`E993-AMBIENT-TARGET-DEG2` / obligation `OB-R18-HG2` (replacing the struck
`SurvivingRegionD2Faithful`, itself replacing the struck
`HG2SurvivingRegion`) — not a new claim. The fidelity theorem
(`ambientTargetDeg2_of_G1wide_and_HG2Faithful`) is offered as **NEW-CLAIM**
for controller registration: no prior seat in this lineage produced a
kernel-checked interchangeability proof between a GATE-1 transcription and
the governed consuming theorem (`RTree.ambientTargetDeg2_of_G1wide_G2wide`)
itself — prior seats argued symbol-for-symbol matching by inspection only.

**FENCE CHECK.** No computation, `#eval`, `decide`, `native_decide`,
numerical search, or sampling occurs in `HG2Faithful` or the fidelity
theorem below (the self-test file, `SelfTestAttempt.lean`, is discussed
separately in the deliverable and is NOT part of this module's build
target). No reserved-zone object beyond what the governed chain itself
already uses is invoked; no new leg, weakening, or premise is added to the
governed antecedent anywhere below. `deg(s) ≥ 3` is not touched — leg 2
(`t.degree (t.support v) = 2`) is the governed antecedent's own hypothesis,
carried unchanged, never generalized.
-/

open RTree

namespace R18C3T3

/-! ## §1 — `HG2Faithful`: the structure-carrying transcription

Quoted symbol-for-symbol from the governed `HG2` parameter of
`RTree.ambientTargetDeg2_of_G1wide_G2wide` (`ShadowBand.lean:422-431`,
pinned digest verified in the deliverable) — the SAME seven legs the C1 and
C2 attempts also targeted, but restated here as a standalone closed `Prop`
(no free numeric parameters at all) rather than abstracted to opaque
`ℕ`/`ℤ` placeholders. `card`, `crossIdx`, `combined`, `D` — the four
quantities the struck objects left as free fields — do not occur as bound
variables ANYWHERE in this signature: they are literal sub-expressions of
a genuine `t : RTree`, `v g : List ℕ`, `p : ℕ`:

  * `card`     ↦ `(t.ResidualAmbient v g).card`
  * `crossIdx` ↦ `t.crossingIndexOn (t.ResidualAmbient v g)`
  * `combined` ↦ `t.Bgen v (p:ℤ) + t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p:ℤ)-1)`
  * `D`        ↦ `t.DeltaOnZ (t.ResidualAmbient v g) ((p:ℤ)-2)`

**Name check:** `HG2Faithful` does not match `\bHG2\b`. -/
def HG2Faithful : Prop :=
  ∀ (t : RTree) (v g : List ℕ) (p : ℕ),
    v ∈ t.leaves → t.degree (t.support v) = 2 → t.OtherNbr (t.support v) v g →
    K_A t p = 1 →
    t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 →
    2 * p - 3 < (t.ResidualAmbient v g).card →
    p - 2 < t.crossingIndexOn (t.ResidualAmbient v g) →
      t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2)
        ≤ -(t.Bgen v (p : ℤ) +
            t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1)) - 1

/-! ## §2 — kernel-checked fidelity: `HG2Faithful` is interchangeable with
the governed `HG2` hypothesis, not merely symbol-for-symbol by inspection

This is the strongest fidelity certificate available: if `HG2Faithful`'s
unfolded type were not DEFINITIONALLY EQUAL to the exact type of the `HG2`
parameter `RTree.ambientTargetDeg2_of_G1wide_G2wide` expects, the
application below would fail to elaborate. It does not — the Lean kernel
itself accepts `hHG2 : HG2Faithful` in the slot the governed theorem
declares for its `HG2` hypothesis, with no `unfold`, no `show`, no
coercion, no `sorry`. -/
theorem ambientTargetDeg2_of_G1wide_and_HG2Faithful
    (HG1 : ∀ (t : RTree) (v g : List ℕ) (p : ℕ),
      v ∈ t.leaves → t.degree (t.support v) = 2 → t.OtherNbr (t.support v) v g →
      K_A t p = 1 →
      t.Bgen v (p : ℤ) +
        t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 →
      2 * p - 3 < (t.ResidualAmbient v g).card →
      t.crossingIndexOn (t.ResidualAmbient v g) < p - 2 →
        t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) ≤ 0)
    (hHG2 : HG2Faithful) :
    AmbientTargetDeg2 :=
  RTree.ambientTargetDeg2_of_G1wide_G2wide HG1 hHG2

/-! ## §3 — the vacuous-antecedent mirror of ADJ-T's `bound_holds_when_
legs_cannot_fire` (`scratchpad/R18C2-ADJ-T/refutation/AdjProbe.lean:86-90`,
sealed Cycle-2 record, consumed by literal citation, not re-derived as new
content): any attempted refutation of `HG2Faithful` at a fixed `(t,v,g,p)`
must exhibit an ACTUAL tree on which every leg fires — it cannot proceed,
as the free-field probes did, by declaring the legs true and the
conclusion false independently of any tree. This is the real-`RTree`
instance of exactly the contrast ADJ-T drew between the struck schema and
the `Fields`/`Bound` carrier form; asserts nothing about `HG2` itself
(vacuous truth under a false antecedent is not evidence toward the
target). -/
theorem HG2Faithful_leg5_vacuous
    (t : RTree) (v g : List ℕ) (p : ℕ)
    (hnc : ¬ (t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0)) :
    v ∈ t.leaves → t.degree (t.support v) = 2 → t.OtherNbr (t.support v) v g →
    K_A t p = 1 →
    t.Bgen v (p : ℤ) +
      t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 →
    2 * p - 3 < (t.ResidualAmbient v g).card →
    p - 2 < t.crossingIndexOn (t.ResidualAmbient v g) →
      t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2)
        ≤ -(t.Bgen v (p : ℤ) +
            t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1)) - 1 := by
  intro _ _ _ _ hc _ _
  exact absurd hc hnc

end R18C3T3
