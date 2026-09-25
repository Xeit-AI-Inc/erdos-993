# r28-c1-la3-forest-composition-and-hall

Declaration `Erdos993G1.forest_degree_lemma_of_tree_degree_lemma`, exported byte-for-byte from the sealed internal run
`erdos-993-degree-lemma-hall-sdr-dre-2026-09-24` (`runs/lean-2026-09-25-c1-la3-forest-composition-and-hall`; r28 — see
[`experiments/r28-degree-lemma-hall-sdr.md`](../../../experiments/r28-degree-lemma-hall-sdr.md)).
Award `C1-LA3`; registry effect `E993-R28-FOREST-DEGREE-LEMMA-FROM-TREES (with E993-R28-SDR-THRESHOLD-EQUIVALENCE)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem forest_degree_lemma_of_tree_degree_lemma {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ)
    (htree : ∀ {Y : Type u} [Fintype Y] [DecidableEq Y] (T : SimpleGraph Y) [DecidableRel T.Adj], T.IsTree →
      ∀ a ≤ k, (Erdos993G1.indepDegreeSum T a : ℤ) ≤ 2 * a * Erdos993G1.indepCount T a) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and
attribution are part of it):

> (FC), corrected (erratum R28-E-c), key E993-R28-FOREST-DEGREE-LEMMA-FROM-TREES: for every finite simple graph G on a finite type X in universe u with G acyclic (a finite forest) and every k : ℕ, IF for every finite tree T on any carrier Y : Type u and every a ≤ k the degree lemma D_a(T) ≤ 2a·i_a(T) holds, THEN D_k(G) ≤ 2k·i_k(G), with i = Erdos993G1.indepCount (r25 entry 1) and D = Erdos993G1.indepDegreeSum (r27 entry 7). Acyclicity enters only through 'components of a forest are trees'; the composition itself (separated-union convolution, bridge, peel over components) holds for every finite graph (scope declarations R28CritU2T.degree_lemma_of_components, R28CritU2T.forest_degree_lemma_of_components_allk, R28U2.indepCountOn_union, R28U2.indepDegreeSumOn_union — hsep and hdisj both necessary — R28CritU2T.bridge, R28CritU2T.induce_supp_isTree). Companion lemma in the same source, key E993-R28-SDR-THRESHOLD-EQUIVALENCE (registers independently; not a dependency of the terminal theorem): lemma sdr_iff_threshold_pos_of_tree {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hT : G.IsTree) (k : ℕ) :
    (∃ f : R28U2.Slot G → X, Function.Injective f ∧
        ∀ s, G.degree (f s) = 1 ∧ R28U2.occ G s.1.1 k ≤ R28U2.occ G (f s) k) ↔
      (∀ t, 1 ≤ t → R28U2.slotsAtLeast G k t ≤ R28U2.leavesAtLeast G k t) ; scope declaration R28U2.sdr_iff_threshold (graph-general, ∀ t : ℕ) via R28U2.nested_hall_iff_threshold and R28U2.sdr_iff_threshold_abstract, and R28CritU2F.tree_slots_zero_le. Fences: (FC) is never composed with r27's forest_degree_lemma to present a second proof of (DL) (not carried into this project); it is the formal consequence clause of E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION, a scope note there. The SDR equivalence is per (G, k), never evidence for either side. U2's slot_leaf_sdr_exists and tree_leaf_slot_dominance (FALSE, T22) are not carried and nothing depends on them. No status transfer (SOLUTION-CONTRACT §3.1). Attribution: (FC) — r27 convolution key (SR-JOIN JN-2), U2 (seat, convolution in Lean), C-U2-T (end to end, bridge), C-U2-F (core); SDR — T2 (Lemma SAP, informal), C-F1-T (rank lemma), Hall (Mathlib), U2 (graph-general Lean), C-U2-F (tree form), SR-PP (PP-3).

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` (pinned in
`source/lakefile.toml` and `source/lake-manifest.json`; the package cache is not shipped — bind a local
Mathlib checkout at that revision, never `lake update`). Axioms exactly `[propext, Classical.choice,
Quot.sound]`; no `sorry`/`admit`/`native_decide`. Governed workflow: frozen theorem contract
(`THEOREM-CONTRACT.yaml`, rendered `THEOREM-CONTRACT.md`), independent informal proof-integrity audit
(`INFORMAL-AUDIT.md`; the formalizer's `INFORMAL-PROOF.md`), kernel/axiom receipt and independent
statement-fidelity attestation (`FIDELITY-REVIEW.md`, verdict `passed`), canonical close
(`VERIFICATION-REPORT.md`, `formally_verified`). Digests and verdicts are in `receipts/RECEIPT-SUMMARY.json`;
full receipts stay in the sealed internal run. Internal grade `formally_verified`; published as `verified`.
Claim boundary: Lean kernel validity plus independent statement fidelity for exactly the stated declaration —
an order bound / counting statement on finite forests with sign `Δ_k ≥ 0` on its contrapositive; nothing about no-recovery, `E993-R25-UNR-FOREST-WIDE`, NR1, FOREST, TREE, TRANSFER, or Erdős #993.
