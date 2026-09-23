# r25a-a1-forest-delta3-pos-order-12

Declaration `Erdos993G1.ForestDelta3.forest_delta_three_pos_ge_twelve`, exported byte-for-byte from the sealed internal run
`erdos-993-uniform-residual-no-recovery-addendum-dre-2026-09-22` (`runs/lean-2026-09-23-a1-forest-delta3-order-12`; the r25 ADDENDUM — see
[`experiments/r25-uniform-residual-no-recovery.md`](../../../experiments/r25-uniform-residual-no-recovery.md), addendum section).
Cycle A1 award `A1-LA1`; registry effect `E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12 (n >= 12 half)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem forest_delta_three_pos_ge_twelve {X : Type u} [Finite X] (F : SimpleGraph X)
    (hF : F.IsAcyclic) (hn : 12 ≤ Nat.card X) : 0 < Erdos993G1.delta F 3
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope
fences and attribution are part of it):

> For every finite simple graph F on a finite vertex type X, if F is acyclic (a forest, connected or not) and Nat.card X is at least 12, then Delta_3(F) = i_4(F) - i_3(F) > 0, where i_k(F) is the exact count of independent k-subsets of F (Erdos993G1.indepCount), coeff is the integer zero-extension of indepCount to negative indices, and delta is the first difference coeff(k+1) - coeff(k). This proves the first conjunct only of the registered claim E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12, whose second conjunct (sharpness at order 11, P_11 the unique minimiser, Delta_3 = -14) is explicitly excluded from this contract and stays proved_informal.

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
independent statement fidelity for the stated HALF of the registry statement — nothing about
Tier 1, Tier 2, any Tier 3 schema, FOREST, TREE, TRANSFER, or Erdős #993.
