# r25-c6-forest-delta2-pos-order-9

Declaration `Erdos993G1.ForestDelta2.forest_delta_two_pos_ge_nine`, exported byte-for-byte from the sealed internal run
`erdos-993-uniform-residual-no-recovery-dre-2026-09-20` (`runs/lean-2026-09-22-c6-forest-delta2-order-9`; see
[`experiments/r25-uniform-residual-no-recovery.md`](../../../experiments/r25-uniform-residual-no-recovery.md)).
Cycle 6 award `C6-LA1`; registry identity `E993-R25-FOREST-DELTA2-POS-ORDER-9`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem forest_delta_two_pos_ge_nine {X : Type u} [Finite X] (F : SimpleGraph X)
    (hF : F.IsAcyclic) (hn : 9 ≤ Nat.card X) : 0 < Erdos993G1.delta F 2
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope
fences and attribution are part of it):

> For every finite forest F (SimpleGraph X, [Finite X], F.IsAcyclic) with Nat.card X >= 9, 0 < Erdos993G1.delta F 2 (i.e. i_3(F) > i_2(F), Delta_2 in the SEMANTIC-CONTRACT.md sense), with the quantitative companion (Nat.card X)^3 - 12*(Nat.card X)^2 + 35*(Nat.card X) - 30 <= 6 * Erdos993G1.delta F 2 for Nat.card X >= 5. A grade change for the registered VERIFIED E993-R25-FOREST-DELTA2-POS-ORDER-9 (proved_informal -> formally_verified), not a new claim. SCOPE (mandatory fences): uniform in the order, no horizon, no enumeration at any order; nu (matching number), tau (vertex-cover number), the excess d, and x(F) < r (first strict descent) enter nowhere; Delta_2 > 0 is a POSITIVITY statement, the opposite sign from a no-recovery statement; this is a forest THRESHOLD theorem, never 'the run's first unconditional forest theorem'; it does not sharpen E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP (an order bound is a different object); it is not E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12; it bears on no tier, on FOREST/TREE/TRANSFER, or on Erdos #993. Alias: E993-R25-FOREST-DELTA2-POS-ORDER-9; strictly generalises frozen ENTRY 176 (Erdos993G1.ThirdWide.forest_delta_two_ten_pos, Nat.card X = 10); also aliases E993-PAIR-RANK3-FOREST-MIN. Attribution: critic-attributed jointly to C-U4-T (contract form, quantitative cubic) and C-U4-F (component-corrected bound, entry176_is_an_instance disclosure), on the frozen G1 project's own compiled lemmas; seat U4's route framed the question and settled the decide-reach question the critics' closed form routes around.

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
