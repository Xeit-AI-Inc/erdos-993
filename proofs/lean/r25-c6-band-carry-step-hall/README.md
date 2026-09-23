# r25-c6-band-carry-step-hall

Declaration `ErdosR25BandCarryStep.bandCarryStepHall`, exported byte-for-byte from the sealed internal run
`erdos-993-uniform-residual-no-recovery-dre-2026-09-20` (`runs/lean-2026-09-22-c6-band-carry-step-hall-repair-1`; see
[`experiments/r25-uniform-residual-no-recovery.md`](../../../experiments/r25-uniform-residual-no-recovery.md)).
Cycle 6 award `C6-LA2`; registry identity `E993-R25-BAND-CARRY-STEP-HALL`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem bandCarryStepHall {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} [DecidableRel F.Adj] (r : ℕ)
    (hcard : Fintype.card V = 2 * r + 5)
    (C : Finset V) (hC : F.IsVertexCover (↑C : Set V)) (hCcard : C.card = 6)
    (M : F.Subgraph) (hM : M.IsMatching) (hMcard : M.verts.ncard = 12)
    (k : ℤ) :
    delta F k - delta F (k - 1) ≤ Bd r k
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope
fences and attribution are part of it):

> For every finite simple graph F of order 2r+5 with a vertex cover C, |C| = 6, and a matching M with M.verts.ncard = 12 (i.e. nu(F) = tau(F) = 6, packaged as the matching itself since the proof consumes the saturating injection C -> B, not merely its cardinality): Delta_k(F) - Delta_{k-1}(F) <= Bd(r,k) for every integer k, with Bd the RANGED object (range b <= 2r-1-a; the range is load-bearing). This award uses the seat's own definitions (namespace ErdosR25BandCarryStep: choose [renamed from the seat's C, mandatory repair (3)], E, D, Mclamped, Bd, indepCount, coeff, delta, nonCover, bFinset) which re-declare the G1 semantics for this project, checked against SEMANTIC-CONTRACT.md (integer zero extension; the RANGED Bd). The frozen G1 project is not imported. MANDATORY FENCES (fail-closed, never silently weakened): FIXED-BAND d = 5, named as such -- d enters only through the order 2r+5; x(F) < r enters nowhere; acyclicity enters nowhere (graph-general given nu = tau, positively evidenced by a genuinely cyclic instance in EVIDENCE/verify_band_carry_step_hall.py); Bd is the RANGED object and the range is load-bearing; r >= 4 is derived inside the proof (from M.verts.ncard = 12 <= Fintype.card V = 2r+5), not assumed. An award here gives E993-R25-FOURTH-BAND-CLOSE-ALL-R a SECOND formally verified INPUT -- not a closure; that composition stays proved_informal at its weakest link; the arithmetic tail (E993-R25-BD-TAIL-NEGATIVE), the general half of c(5) = 5, Corollary F at d = 5 and the finite part are untouched; it is progress toward NO tier and resolves no headline. Node (i) (coverFiberPartitionIdentity) is, in substance, the first Lean proof of the registered E993-GRAPH-VERTEX-COVER-DELTA-PARTITION (differenced form, equivalent to the undifferenced node (i) under integer zero extension); this is recorded on the award's face and is not itself a new registration by this formalizer. ATTRIBUTION (travels on the award's face, mandatory repair (5)): critic-attributed to C-F3-T and C-F3-U for ALL THREE theorem-level declarations (node (i) coverFiberPartitionIdentity, node (ii) konigSaturation, the composition bandCarryStepHall), on seat F3's unmodified clamp_lemma and Arithmetic.lean; precedent: E993-R25-MATCHING-DUAL-SCALAR-CORE's critic-attributed induction step. Hypotheses, exactly as bound: V a fintype vertex type with decidable equality; F a simple graph on V with decidable adjacency; r a natural number with Fintype.card V = 2*r+5; C a finset vertex cover of F with C.card = 6; M a matching subgraph of F with M.verts.ncard = 12; k ranges over all integers.

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`
(pinned in `source/lakefile.toml` and `source/lake-manifest.json`; the package cache is not
shipped — bind a local Mathlib checkout at that revision, never `lake update`). Axioms
exactly `[propext, Classical.choice, Quot.sound]`; no `sorry`/`admit`/`native_decide`.
Governed workflow: frozen theorem contract (`THEOREM-CONTRACT.yaml`, rendered
`THEOREM-CONTRACT.md`), independent informal proof-integrity audit (`INFORMAL-AUDIT.md`; the
formalizer's `INFORMAL-PROOF.md`), kernel/axiom receipt and independent statement-fidelity
attestation (`FIDELITY-REVIEW.md`, verdict `passed`), canonical close
(`VERIFICATION-REPORT.md`, `formally_verified`). Digests and verdicts are in
`receipts/RECEIPT-SUMMARY.json`; full receipts stay in the sealed internal run. Internal
grade `formally_verified`; published as `verified`. Claim boundary: Lean kernel validity plus
independent statement fidelity — nothing about Tier 1, Tier 2, any Tier 3 schema, FOREST,
TREE, TRANSFER, or Erdős #993.
