# r25-c5-matching-dual-scalar-core

Declaration `ErdosR25.E1ArithmeticCore.matchingDual_scalarCore_award`, exported byte-for-byte from the sealed internal run
`erdos-993-uniform-residual-no-recovery-dre-2026-09-20` (`runs/lean-2026-09-22-c5-matching-dual-scalar-core`; see
[`experiments/r25-uniform-residual-no-recovery.md`](../../../experiments/r25-uniform-residual-no-recovery.md)).
Cycle 5 award `C5-LA1`; registry identity `E993-R25-MATCHING-DUAL-SCALAR-CORE`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem matchingDual_scalarCore_award : (∀ m d : ℤ, 9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 = 3 * (3 * d - 2 * (m + 1)) * (d + 2 * (m + 1))) ∧ (∀ m d : ℤ, 0 ≤ m → 0 ≤ d → (9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 ≤ 0 ↔ 3 * d ≤ 2 * m + 2)) ∧ (∀ m d n : ℤ, 0 ≤ m → 0 ≤ d → 3 * d ≤ 2 * m + 2 → (n + 1) * ((2 * m - d) + 1 - n) ≥ 4 * (m + n - (2 * m - d)) * (m - n)) ∧ (∀ m K : ℕ, (K : ℤ) ≤ 2 * (m : ℤ) → 3 * (2 * (m : ℤ) - (K : ℤ)) ≤ 2 * (m : ℤ) + 2 → ∀ n : ℕ, K + 1 < 2 * n → n ≤ m → PStatement m K n)
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope
fences and attribution are part of it):

> Pure arithmetic of the stratified matching-incidence certificate's greedy dual, uniform in (m, d) on the region and in the index, no horizon. The conjunction of: (1) the discriminant factorisation 9d^2+12(m+1)d-12(m+1)^2 = 3*(3d-2(m+1))*(d+2(m+1)) for all integers m,d; (2) the two-sided region characterisation: for m,d >= 0, the discriminant is <= 0 iff 3d <= 2m+2; (3) step (S): for m,d >= 0 with 3d <= 2m+2 and every integer n, (n+1)*((2m-d)+1-n) >= 4*(m+n-(2m-d))*(m-n); (4) PStatement m K n := Nat.descFactorial n (2n-K-1) >= 2^(2n-K-1) * Nat.descFactorial (m+n-K-1) (2n-K-1) holds at every hard index n (K+1 < 2n, n <= m) for all naturals m,K with K <= 2m and 3*(2m-K) <= 2m+2, i.e. both parities of K. SCOPE (mandatory fences): this is the SCALAR core; it does not raise E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY (whose object is the coefficientwise-in-t nonnegativity of N_j); it is not the large-rank theorem and not the Tier 3a schema; no statement about any graph, forest, G1 tuple, tier, FOREST, TREE, TRANSFER or Erdos #993; no SimpleGraph, Delta_k, indepCount occurs; no sharpness claim; no claim that a certificate exists for any particular graph; m and d are numerals (arbitrary naturals/integers as quantified, not fixed constants). Attribution (travels on the award's face): the definitions, the discriminant lemmas, step (S) and both base cases are seat U1's; the induction step (CRITIC-ATTRIBUTED, C-U1-F's toolkit-free proof, PRIMARY) and the induction principle (CRITIC-ATTRIBUTED, C-U1-T's Nat.le_induction scaffold, re-derived here to call C-U1-F's step) are critic-attributed, independently.

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
