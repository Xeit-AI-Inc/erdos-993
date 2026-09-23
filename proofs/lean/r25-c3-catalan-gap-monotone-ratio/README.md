# r25-c3-catalan-gap-monotone-ratio

Declaration `Erdos993G1.U3.catalanGap_monotone_ratio_award`, exported byte-for-byte from the sealed internal run
`erdos-993-uniform-residual-no-recovery-dre-2026-09-20` (`runs/lean-2026-09-21-c3-catalan-gap-monotone-ratio`; see
[`experiments/r25-uniform-residual-no-recovery.md`](../../../experiments/r25-uniform-residual-no-recovery.md)).
Cycle 3 award `C3-LA1`; registry identity `E993-R25-CATALAN-GAP-MONOTONE-RATIO`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
    (∀ τ k : ℕ, 1 ≤ τ → τ ≤ k →
        Gamma τ k * (catalan (k + 2) : ℤ) < Gamma τ (k + 1) * (catalan (k + 1) : ℤ)) ∧
    (∀ τ K : ℕ, 1 ≤ τ → τ ≤ K → 0 < Gamma τ K → ∀ k : ℕ, K ≤ k → 0 < Gamma τ k) ∧
    ((∀ k, 0 ≤ k → 0 < Gamma 1 k) ∧ (∀ k, 2 ≤ k → 0 < Gamma 2 k) ∧
     (∀ k, 3 ≤ k → 0 < Gamma 3 k) ∧ (∀ k, 4 ≤ k → 0 < Gamma 4 k) ∧
     (∀ k, 6 ≤ k → 0 < Gamma 5 k) ∧ (∀ k, 12 ≤ k → 0 < Gamma 6 k) ∧
     (∀ k, 70 ≤ k → 0 < Gamma 7 k)) ∧
    (∀ τ k : ℕ, 8 ≤ τ → τ ≤ k → Gamma τ k < 0)
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope
fences and attribution are part of it):

> For the Catalan-dominance gap Gamma(tau,k) = catalan(k+1) - sum_{j=1}^{tau} C(tau,j)*(catalan(k-j) if j<=k else 0) (catalan Mathlib's Catalan-number function, the guard an integer zero-extension convention of record): (1) for every tau>=1 and k>=tau, Gamma(tau,k)*catalan(k+2) < Gamma(tau,k+1)*catalan(k+1) (the ratio Gamma(tau,k)/catalan(k+1) strictly increases in k, stated denominator-free); (2) hence from any base 0<Gamma(tau,K) with tau<=K, 0<Gamma(tau,k) for every k>=K; (3) with the seven explicit bases K(1..7) = 0,2,3,4,6,12,70, i.e. Gamma(tau,k)>0 for every k>=K(tau) at tau=1..7; and (4) Gamma(tau,k)<0 for every tau>=8 and k>=tau. A theorem about Catalan integers, uniform in tau with explicit thresholds. Not a graph theorem; not fixed-band; not uniform in d (d does not occur).

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
