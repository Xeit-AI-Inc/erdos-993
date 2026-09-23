# r25-c1-perfect-matching-even-excess-sign

Declaration `Erdos993G1.C1LA2.perfectMatching_delta_nonpos`, exported byte-for-byte from the sealed internal run
`erdos-993-uniform-residual-no-recovery-dre-2026-09-20` (`runs/lean-2026-09-20-c1-perfect-matching-uniform-sign`; see
[`experiments/r25-uniform-residual-no-recovery.md`](../../../experiments/r25-uniform-residual-no-recovery.md)).
Cycle 1 award `C1-LA2`; registry identity `E993-R25-PERFECT-MATCHING-EVEN-EXCESS-SIGN`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem perfectMatching_delta_nonpos {X : Type u} [Finite X]
    (G : SimpleGraph X) (m r : ℕ) (hn : Nat.card X = 2 * m) (hr : 2 * m ≤ 3 * r + 1)
    (f : Fin m × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin m, G.Adj (f (i, false)) (f (i, true))) :
    Erdos993G1.delta G (r : ℤ) ≤ 0
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope
fences and attribution are part of it):

> For every finite simple graph G on a vertex type X of cardinality 2m carrying a perfect matching (an injective f : Fin m x Bool -> X with G.Adj (f (i,false)) (f (i,true)) for every i : Fin m), and every natural r with 2m <= 3r+1: Delta_r(G) <= 0. Equivalently, with d = 2m-2r (always even, forced by the perfect-matching hypothesis): a perfect-matching graph of order 2r+d with 3d <= 2m+2 has Delta_r <= 0. Uniform over even d only; not Tier 3a (says nothing about graphs without a perfect matching); no sharpness claim; no transfer to firstDescent/x(G), forests, residuals, G1 tuples, Tier 1, Tier 2, the diagnostic band, FOREST, TREE, TRANSFER, E993-BETA-AGG, or Erdos #993.

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
