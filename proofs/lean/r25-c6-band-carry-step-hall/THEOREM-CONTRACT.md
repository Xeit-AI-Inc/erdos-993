# Theorem Contract: Band carry step, Hall-admissible form (award group C6-LA2, E993-R25-BAND-CARRY-STEP-HALL, critic-attributed)

- Contract ID: `c6-la2-c6-band-carry-step-hall-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `3aa3f94e87b6fa82360475cfdab921d7931fceb3bef61bcbe3a96d4af25fb951`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite simple graph F of order 2r+5 with a vertex cover C, |C| = 6, and a matching M with M.verts.ncard = 12 (i.e. nu(F) = tau(F) = 6, packaged as the matching itself since the proof consumes the saturating injection C -> B, not merely its cardinality): Delta_k(F) - Delta_{k-1}(F) <= Bd(r,k) for every integer k, with Bd the RANGED object (range b <= 2r-1-a; the range is load-bearing). This award uses the seat's own definitions (namespace ErdosR25BandCarryStep: choose [renamed from the seat's C, mandatory repair (3)], E, D, Mclamped, Bd, indepCount, coeff, delta, nonCover, bFinset) which re-declare the G1 semantics for this project, checked against SEMANTIC-CONTRACT.md (integer zero extension; the RANGED Bd). The frozen G1 project is not imported. MANDATORY FENCES (fail-closed, never silently weakened): FIXED-BAND d = 5, named as such -- d enters only through the order 2r+5; x(F) < r enters nowhere; acyclicity enters nowhere (graph-general given nu = tau, positively evidenced by a genuinely cyclic instance in EVIDENCE/verify_band_carry_step_hall.py); Bd is the RANGED object and the range is load-bearing; r >= 4 is derived inside the proof (from M.verts.ncard = 12 <= Fintype.card V = 2r+5), not assumed. An award here gives E993-R25-FOURTH-BAND-CLOSE-ALL-R a SECOND formally verified INPUT -- not a closure; that composition stays proved_informal at its weakest link; the arithmetic tail (E993-R25-BD-TAIL-NEGATIVE), the general half of c(5) = 5, Corollary F at d = 5 and the finite part are untouched; it is progress toward NO tier and resolves no headline. Node (i) (coverFiberPartitionIdentity) is, in substance, the first Lean proof of the registered E993-GRAPH-VERTEX-COVER-DELTA-PARTITION (differenced form, equivalent to the undifferenced node (i) under integer zero extension); this is recorded on the award's face and is not itself a new registration by this formalizer. ATTRIBUTION (travels on the award's face, mandatory repair (5)): critic-attributed to C-F3-T and C-F3-U for ALL THREE theorem-level declarations (node (i) coverFiberPartitionIdentity, node (ii) konigSaturation, the composition bandCarryStepHall), on seat F3's unmodified clamp_lemma and Arithmetic.lean; precedent: E993-R25-MATCHING-DUAL-SCALAR-CORE's critic-attributed induction step. Hypotheses, exactly as bound: V a fintype vertex type with decidable equality; F a simple graph on V with decidable adjacency; r a natural number with Fintype.card V = 2*r+5; C a finset vertex cover of F with C.card = 6; M a matching subgraph of F with M.verts.ncard = 12; k ranges over all integers.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem ErdosR25BandCarryStep.bandCarryStepHall`
- Statement SHA-256: `ad366e9b9b28361a0807442124798e87842115ac2c0e5b4d587a86095ef587ac`

```lean
theorem bandCarryStepHall {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} [DecidableRel F.Adj] (r : ℕ)
    (hcard : Fintype.card V = 2 * r + 5)
    (C : Finset V) (hC : F.IsVertexCover (↑C : Set V)) (hCcard : C.card = 6)
    (M : F.Subgraph) (hM : M.IsMatching) (hMcard : M.verts.ncard = 12)
    (k : ℤ) :
    delta F k - delta F (k - 1) ≤ Bd r k
```

## Quantifiers

- `forall V` over `domain-graph`
- `forall F` over `domain-graph`
- `forall r` over `domain-int`
- `forall C` over `domain-graph`
- `forall M` over `domain-graph`
- `forall k` over `domain-int`

## Hypotheses

- None.

## Conclusion

- `conclusion`: theorem bandCarryStepHall {V : Type u} [Fintype V] [DecidableEq V] {F : SimpleGraph V} [DecidableRel F.Adj] (r : ℕ) (hcard : Fintype.card V = 2 * r + 5) (C : Finset V) (hC : F.IsVertexCover (↑C : Set V)) (hCcard : C.card = 6) (M : F.Subgraph) (hM : M.IsMatching) (hMcard : M.verts.ncard = 12) (k : ℤ) : delta F k - delta F (k - 1) ≤ Bd r k

## Dependencies

- `domain-int` -> `def-choose`
- `def-choose` -> `def-e`
- `def-choose` -> `def-d`
- `def-d` -> `def-cap-term`
- `def-cap-term` -> `def-m-clamped`
- `def-d` -> `def-bd`
- `def-m-clamped` -> `def-bd`
- `domain-graph` -> `def-indep-count`
- `def-indep-count` -> `def-coeff`
- `def-coeff` -> `def-delta`
- `domain-graph` -> `def-non-cover`
- `def-non-cover` -> `def-b-finset`
- `domain-graph` -> `def-partner`
- `domain-int` -> `def-clamp-lemma`
- `def-d` -> `def-d-eq-diff-e`
- `def-e` -> `def-d-eq-diff-e`
- `def-choose` -> `def-cover-fiber-partition-identity`
- `def-coeff` -> `def-cover-fiber-partition-identity`
- `def-b-finset` -> `def-cover-fiber-partition-identity`
- `domain-graph` -> `def-cover-fiber-partition-identity`
- `def-b-finset` -> `def-konig-saturation`
- `def-non-cover` -> `def-konig-saturation`
- `def-partner` -> `def-konig-saturation`
- `domain-graph` -> `def-konig-saturation`
- `domain-graph` -> `conclusion`
- `domain-int` -> `conclusion`
- `def-cover-fiber-partition-identity` -> `conclusion`
- `def-konig-saturation` -> `conclusion`
- `def-clamp-lemma` -> `conclusion`
- `def-bd` -> `conclusion`
- `def-delta` -> `conclusion`
- `def-d-eq-diff-e` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-evidence-generator`: `EVIDENCE/verify_band_carry_step_hall.py` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)
- `source-originating-critic-t-node1`: `SOURCE/originating-critic-T-Node1.lean` (match)
- `source-originating-critic-t-node2`: `SOURCE/originating-critic-T-Node2.lean` (match)
- `source-originating-critic-t-node3`: `SOURCE/originating-critic-T-Node3.lean` (match)
- `source-originating-critic-t-seatliteral`: `SOURCE/originating-critic-T-SeatLiteral.lean` (match)
- `source-originating-critic-u-criticcompose`: `SOURCE/originating-critic-U-CriticCompose.lean` (match)
- `source-originating-critic-u-critickonig`: `SOURCE/originating-critic-U-CriticKonig.lean` (match)
- `source-originating-critic-u-criticnode`: `SOURCE/originating-critic-U-CriticNode.lean` (match)
- `source-originating-seat-arithmetic`: `SOURCE/originating-seat-F3-Arithmetic.lean` (match)
- `source-originating-seat-graphnodes`: `SOURCE/originating-seat-F3-GraphNodes.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
