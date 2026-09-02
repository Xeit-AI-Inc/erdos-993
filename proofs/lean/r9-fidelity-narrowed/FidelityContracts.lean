/-
R9C3-B — FidelityContracts.lean  (NEW at C3)

The four contracted propositions of `OB-C10-T1-FIDELITY`'s first half, STATED
against S2's bytes.  These are the statements offered to the C3 synthesizer for
freezing as `FIDELITY-CONTRACT-C4.yaml`.

FILE DISCIPLINE, inherited verbatim from the frozen decoder contract: this file
STATES and never ASSERTS.  Every declaration is `def … : Prop := …`.  No
theorem, lemma, axiom, example, instance, sorry, admit, native_decide.

Which of these the route PROVES is recorded in FidelityProofs.lean and in the
route's return.  A proposition stated here and not proved there is stated and
not proved; it is never weakened to fit a proof.

Pin: Lean 4.32.2, Mathlib 905b95818eb32af7874a58b427f50c1711a5e96c.
-/
import Fidelity
import Contracts

namespace Erdos993
namespace QDecoder
namespace Fidelity

/-- **Encoder attachment commutation** — S2 §3 + §4 + §5 and S3's "raw
attachment is equivariant and descends".  Encoding the tree obtained by
fresh-root attachment of a finite branch family agrees, up to `≡_Q`, with
attaching the encodings of the branches. -/
--@@BEGIN EL-N07
def EncoderAttachCommutes : Prop :=
  ∀ (I : Type) [Fintype I] [DecidableEq I] (B : I → FinRootedTree),
    RawEquiv (encodeQ (attachTree I B)) (attachR (fun i => encodeQ (B i).tree))
--@@END EL-N07

/-- **Decoder recovery of marked deletion profiles** — S2 §7: "For
`q = encode_Q(R,r)`, realization and (1) give `Dec_M(q)(λ) = F_{R−η(λ)}`";
S3: "the decoder sends the leaf `λ(a)` to `P_a`, so it recovers
`M_R(λ(a)) = F_{R−λ(a)}`".

Both branches of S2 eq. (4) are covered: at the root marker the stored `U_λ`,
elsewhere the stored profile's `F`. -/
--@@BEGIN EL-N09
def DecoderRecoversMarkedProfiles : Prop :=
  ∀ (R : FinRootedTree) (a : RootedTree.leafIndex R.tree),
    (R.tree.encodeGen).decodeM a = (R.tree.delLeaf a.1 a.2).FTot
--@@END EL-N09

/-- **Endpoint recovery** — S2 §7's
`a_k(v) = [x^{k+1}]Dec_M(q)(v)(x,1) − [x^k]Dec_M(q)(v)(x,1)`, with the decoder
codomain read at `y = 1` and BOTH sides explicitly ℤ-valued and zero-extended
to negative rank. -/
--@@BEGIN EL-N11
def EndpointRecovery : Prop :=
  ∀ (R : FinRootedTree) (a : RootedTree.leafIndex R.tree) (k : ℤ),
    (R.tree.delLeaf a.1 a.2).endpointA k
      = coeffZ (specY1 ((R.tree.encodeGen).decodeM a)) (k + 1)
        - coeffZ (specY1 ((R.tree.encodeGen).decodeM a)) k
--@@END EL-N11

/-- **The C2A-G3 dividend, stated**: S2's `Carrier(Q)` — realized raw states
modulo `equiv_Q` — sits inside the built `Carrier` as exactly the realizable
classes.  The C2 built `Carrier` was WIDER than S2's by the whole
non-realizable subdomain; this proposition is what says the widening is
accounted for and nothing else was lost. -/
--@@BEGIN EL-N12
def Carrier_eq_realizedCarrier : Prop :=
  Function.Injective realizedToCarrier
    ∧ ∀ q : RawState, Realizable q →
        ∃ c : RealizedCarrier, realizedToCarrier c = Quotient.mk stateSetoid q
--@@END EL-N12

/-- **The marker half of encoder attachment commutation** — S2 §4's "This is
exactly the leaf classification after attachment: a child root of degree one
ceases to be a leaf, a degree-zero child is a singleton whose root becomes a
leaf, and the fresh root is a leaf exactly for one branch"; S3's three marker
summands and "They exhaust `L(T)`".

ROUTE-ADDED, and declared as such: this proposition is NOT on the controller's
element list.  It is offered to the C3 synthesizer as an additional contract row
because it is the half of `EncoderAttachCommutes` this route could discharge,
and because naming it separately is what keeps the unproved half visible. -/
--@@BEGIN EL-R01
def AttachedLeafClassification : Prop :=
  ∀ (I : Type) [Fintype I] [DecidableEq I] (B : I → FinRootedTree),
    ((attachTree I B).degree none = 1 ↔ Fintype.card I = 1)
      ∧ ∀ (i : I) (w : (B i).V),
          ((attachTree I B).degree (some ⟨i, w⟩) = 1
            ↔ ((w ≠ (B i).tree.root ∧ (B i).tree.degree w = 1)
                ∨ (w = (B i).tree.root ∧ (B i).tree.degree w = 0)))
--@@END EL-R01

/-- **The `encodeQ` bridge** (EL-N13) — the row that carries `EL-N09` and
`EL-N11`, which are stated on `encodeGen`, to the CONTRACTED `encodeQ`.  S2:
"After transport along `η`, this is exactly `M_R`." -/
--@@BEGIN EL-N13
def EncodeQDecodeTransport : Prop :=
  ∀ R : FinRootedTree,
    ∃ σ : Fin (encodeQ R.tree).n ≃ RootedTree.leafIndex R.tree,
      ∀ b, (encodeQ R.tree).decodeM b = (R.tree.delLeaf (σ b).1 (σ b).2).FTot
--@@END EL-N13

/-- **`RawEquiv`-invariance of `Realizable`** (EL-N14, R9C3-E6).  Without it,
"exactly the realizable classes" is not well posed on the quotient. -/
--@@BEGIN EL-N14
def RealizableRawEquivInvariant : Prop :=
  ∀ q q' : RawState, RawEquiv q q' → Realizable q → Realizable q'
--@@END EL-N14

/-- **Obstruction item (2)** — the independent-set decomposition
(`COVERAGE-COMPLEMENT.md` db4e8bf8…d5a1 item 2), REGISTERED AT EL-N18.  The
CHARACTERISATION, not a bijection object: the contract's own face says so. -/
--@@BEGIN EL-N18
def AttachIndepDecomposition : Prop :=
  ∀ (I : Type) [Fintype I] [DecidableEq I] (B : I → FinRootedTree)
    (S : Finset (Option (Σ i : I, (B i).V))),
    S ∈ (attachTree I B).indepSets
      ↔ (∀ i : I, Finset.univ.filter (fun v : (B i).V => some ⟨i, v⟩ ∈ S)
          ∈ (B i).tree.indepSets)
        ∧ (none ∈ S → ∀ i : I, some ⟨i, (B i).tree.root⟩ ∉ S)
--@@END EL-N18

/-- **Obstruction item (3)** — the extension-count bookkeeping across that
decomposition (`COVERAGE-COMPLEMENT.md` item 3), REGISTERED AT EL-N19. -/
--@@BEGIN EL-N19
def AttachExtensionBookkeeping : Prop :=
  ∀ (I : Type) [Fintype I] [DecidableEq I] (B : I → FinRootedTree)
    (S : Finset (Option (Σ i : I, (B i).V))),
    S ∈ (attachTree I B).indepSets
      → (none ∈ S → ∀ i : I,
          some ⟨i, (B i).tree.root⟩ ∉ (attachTree I B).extSet S)
        ∧ (none ∉ S → ∀ i : I,
            some ⟨i, (B i).tree.root⟩ ∈ (attachTree I B).extSet S
              ↔ (B i).tree.root ∈ (B i).tree.extSet
                  (Finset.univ.filter (fun v : (B i).V => some ⟨i, v⟩ ∈ S)))
        ∧ (none ∈ (attachTree I B).extSet S
            ↔ ∀ i : I, some ⟨i, (B i).tree.root⟩ ∉ S)
--@@END EL-N19

/-- **Obstruction item (4)** — the product-of-sums expansion turning the
decomposed sum into S2 eq. (2)'s three products (`COVERAGE-COMPLEMENT.md`
item 4), REGISTERED AT EL-N20.  `attachSec` is S2 eq. (2), GATED at DC-28 and
consumed here AS GATED (BT-15). -/
--@@BEGIN EL-N20
def AttachSectorsProductExpansion : Prop :=
  ∀ (I : Type) [Fintype I] [DecidableEq I] (B : I → FinRootedTree),
    (attachTree I B).sectors = attachSec (fun i : I => (B i).tree.sectors)
--@@END EL-N20

end Fidelity
end QDecoder
end Erdos993
