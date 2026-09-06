import R16C3T
import R14C4T.ShadowBand

/-!
# R16C4T — THE INTEGRATION (r16 Cycle 4, route R16C4-T, LOAD-BEARING):
# the G1wide side of the ADOPTED r14 surface with the identification
# premise DISCHARGED BY CONSTRUCTION — premise set exactly {Premise K, K-SCOPE}

PROTOTYPE (grade `RG` AT BEST after critics and a gate act; nothing here is
`governed`; nothing is ever `formally_verified`).

## Ceiling honesty (undetachable)

TREE / FOREST / TRANSFER / COUNTEREXAMPLE open before and after.
`AmbientTargetDeg2`, (α), (β), (A), (B) are targets never asserted; nothing
below proves, or claims to prove, any of them. The two theorems below are
CONDITIONAL IMPLICATIONS whose faces are undetachable:

* `G1wide_closure_of_constructed_identification` keeps PREMISE K (`hKL`)
  and K-SCOPE (`hKSCOPE`) live on the face — they are NEVER discharged,
  fed by nothing, and PREMISE K is never kernel-imported. What the
  constructor eliminated is ONLY the identification premise (`hID`/`hadm`
  of the sealed r14 `G1_closure_of_identification`), discharged by the
  sealed `packGeneral_lawful` through the sealed `G1_closure_general`.
* `ambientTargetDeg2_of_KL_KSCOPE_HG2wide` additionally keeps the OPEN
  `HG2w` antecedent — `HG2` on `G2 ∧ |U| ≥ 2p−2` — live on the face; it
  is UNTOUCHED and remains the run's stated open obligation.

No bounded zero is cited; no measurement is run. This module makes NO
claim on G2 beyond carrying its open antecedent as a binder, does NOT
close `HG2`, and moves NO headline. The r12 Q1–Q6 reserved zone is not
approached: no proof below mentions `Ipoly`/`Apoly`/`Bpoly`/`Fpoly`, the
availability recursion, or any blocked-root state. Route ceiling **RG**.

## NO SHIMS (FC-R16-2, tested at the wiring stage)

The five-head criterion binds this wiring exactly as it bound the
constructor. This module imports ONLY the T-world lineage (`R16C3T` — the
sealed T-half of the constructor of record — and `R14C4T.ShadowBand` —
the sealed adopted surface). It NEVER imports the P-world. The constructor
is consumed ONLY as the composed object of FC-R16-5 §(b): L1–L7 + LAW IV′
on the closed data triple `(nbComponents U, nbSeqOn, ordCard)`; the IV′
half (`R16C3.lawIVPrime_components`, sealed `R16C3P`) cannot be seen from
here (the clash of record) and is re-audited in this build by `CheckP4`;
the composition remains the reader-side metatheoretic composition RULED
part of the C3 award (FC-R16-5 §(d) register 2). Nothing below stipulates,
assumes, or axiomatizes any cross-world correspondence; both theorems are
single-world (T-side) kernel objects.

## What this module contributes (STUDY-INTERLUDE-1 §2, seat R16C4-T)

The r14 record's G1-side standing was: the `G1wide` antecedent (`HG1w`) of
the ADOPTED surface `ambientTargetDeg2_of_G1wide_G2wide` (r14 C4 Q2)
closes only under PREMISE K + K-SCOPE + the IDENTIFICATION premise
(representational-slot reading, r14 C3-AMD-3). This module compiles the
gated upgrade: the SAME `HG1w` face — restated binder-for-binder from the
sealed `R14C4T.ShadowBand` — now follows from premise set EXACTLY
{Premise K, K-SCOPE}. The identification premise is gone from the face
because it is discharged by construction (`packGeneral_lawful`, sealed at
GATE-R16-CONSTRUCTOR). The auxiliary binders of the sealed wrapper are
NOT premises here: `hp : 2 ≤ p` is derived from the face's own
`K_A t p = 1` (via the sealed `two_le_of_K_A_eq_one`), and
`hx : x(U) ≤ p−2` from the face's own G1-region bound `x(U) < p−2`.

## Premise forms (frozen wording, F-b of record)

* PREMISE K (`hKL`): for every `(t, v, g)`, every connected component `C`
  of the residual `U = t.ResidualAmbient v g` with `ordCard C ≤ 25` has
  `AdjacentLogConcave (nbSeqOn C)` — the Radcliffe-via-K–L citation,
  cited, never upgraded, never kernel-imported.
* K-SCOPE (`hKSCOPE`): for every `(t, v, g)`, every connected component
  of the residual has order ≤ 25 — live, external, NOT bounded by the
  constructor (the constructor bounds NO block order; FC-R16-5 §(d)
  register 7).

## Item-6 declaration

Sealed sources consumed READ-ONLY by srcDir; nothing copied, nothing
re-derived, nothing edited; build artifacts land only under this route's
own `.lake/`. All transcripts raw and unfiltered. On any drift between
consumed sources and their sealed digests: quarantine-and-propose, never
reconcile.

## Invariance / A16

This module introduces NO new data, NO new definitions, and NO witnesses:
its two declarations are theorems whose statements are functions of their
stated binders only, in the frozen vocabulary of the sealed modules. No
representative indexing, no vertex ordering, no address convention is
introduced at the wiring stage.
-/

open scoped Classical
open Erdos993C8U1 R16C2 R16C3 RTree

namespace R16C4

/-- **THE INTEGRATION (load-bearing): the `G1wide` side of the ADOPTED r14
surface, premise set exactly {PREMISE K, K-SCOPE}.** The conclusion is the
`HG1w` antecedent of the sealed adopted surface
`RTree.ambientTargetDeg2_of_G1wide_G2wide` (`R14C4T.ShadowBand`),
binder-for-binder. The r14 record closed this face only under PREMISE K +
K-SCOPE + the IDENTIFICATION premise (`hID`/`hadm`, representational slot);
here the identification premise is DISCHARGED BY CONSTRUCTION — the sealed
`packGeneral_lawful` (T-half of the constructor of record, FC-R16-5,
consumed only as the composed L1–L7 + IV′ object) fed through the sealed
`G1_closure_general`. **`hKL` and `hKSCOPE` stay live on the face — never
discharged, fed by nothing; PREMISE K is never kernel-imported. This
theorem does NOT close G1 unconditionally, does NOT touch the open `HG2`,
and asserts no target.** -/
theorem G1wide_closure_of_constructed_identification
    (hKL : ∀ (t : RTree) (v g : List ℕ),
      ∀ C ∈ nbComponents (t.ResidualAmbient v g),
        ordCard C ≤ 25 → AdjacentLogConcave (nbSeqOn C))
    (hKSCOPE : ∀ (t : RTree) (v g : List ℕ),
      ∀ C ∈ nbComponents (t.ResidualAmbient v g), ordCard C ≤ 25) :
    ∀ (t : RTree) (v g : List ℕ) (p : ℕ),
      v ∈ t.leaves → t.degree (t.support v) = 2 → t.OtherNbr (t.support v) v g →
      K_A t p = 1 →
      t.Bgen v (p : ℤ) +
        t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 →
      2 * p - 3 < (t.ResidualAmbient v g).card →
      t.crossingIndexOn (t.ResidualAmbient v g) < p - 2 →
        t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) ≤ 0 :=
  fun t v g p _hv _hd2 _hOther hk _hhyp _hband hx =>
    G1_closure_general t v g (t.two_le_of_K_A_eq_one hk)
      (hKL t v g) (hKSCOPE t v g) (Nat.le_of_lt hx)

/-- **The ADOPTED surface, wired: `AmbientTargetDeg2` from premise set
{PREMISE K, K-SCOPE, the OPEN `HG2w`}.** One composition of the theorem
above with the sealed adopted surface
`RTree.ambientTargetDeg2_of_G1wide_G2wide` (r14 C4 Q2 adoption of record).
**`AmbientTargetDeg2` is NOT asserted**: this is an implication whose
`hKL`/`hKSCOPE` premises are external and never discharged, and whose
`HG2w` antecedent — `HG2` on `G2 ∧ |U| ≥ 2p−2` — is the run's OPEN
obligation, untouched here. The G1-side of the adopted surface is now
exactly as strong as its external premises and no weaker; nothing more is
claimed. -/
theorem ambientTargetDeg2_of_KL_KSCOPE_HG2wide
    (hKL : ∀ (t : RTree) (v g : List ℕ),
      ∀ C ∈ nbComponents (t.ResidualAmbient v g),
        ordCard C ≤ 25 → AdjacentLogConcave (nbSeqOn C))
    (hKSCOPE : ∀ (t : RTree) (v g : List ℕ),
      ∀ C ∈ nbComponents (t.ResidualAmbient v g), ordCard C ≤ 25)
    (HG2w : ∀ (t : RTree) (v g : List ℕ) (p : ℕ),
      v ∈ t.leaves → t.degree (t.support v) = 2 → t.OtherNbr (t.support v) v g →
      K_A t p = 1 →
      t.Bgen v (p : ℤ) +
        t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1) < 0 →
      2 * p - 3 < (t.ResidualAmbient v g).card →
      p - 2 < t.crossingIndexOn (t.ResidualAmbient v g) →
        t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2)
          ≤ -(t.Bgen v (p : ℤ) +
              t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) ((p : ℤ) - 1)) - 1) :
    AmbientTargetDeg2 :=
  ambientTargetDeg2_of_G1wide_G2wide
    (G1wide_closure_of_constructed_identification hKL hKSCOPE) HG2w

end R16C4
