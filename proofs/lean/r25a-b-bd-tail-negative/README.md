# r25a-b-bd-tail-negative

Declaration `ErdosR25AddBdTail.bdTailNegative_award`, exported byte-for-byte from the sealed internal run
`erdos-993-uniform-residual-no-recovery-addendum-dre-2026-09-22` (`runs/lean-2026-09-22-b-bd-tail-negative`; the r25 ADDENDUM — see
[`experiments/r25-uniform-residual-no-recovery.md`](../../../experiments/r25-uniform-residual-no-recovery.md), addendum section).
lane B award `B-LA1`; registry effect `E993-R25-BD-TAIL-NEGATIVE (r >= 6 half)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem bdTailNegative_award : ∀ r : ℕ, 6 ≤ r → BdRR r < 0
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope
fences and attribution are part of it):

> With D(b,m) = C(b,m+1) - 2C(b,m) + C(b,m-1) (zero-extended integer binomial coefficients) and the RANGED Bd(r,r) = D(2r-1,r) + sum_{a=1}^{6} C(6,a) * max(0, max_{0<=b<=2r-1-a} D(b,r-a)) (C-U2-F's integer-rank MaR/BdRR of record, CriticF2.lean verbatim): Bd(r,r) < 0 for every integer r >= 6. This is the r >= 6 half of the registry claim E993-R25-BD-TAIL-NEGATIVE; the parenthetical sharpness half (Bd(r,r) >= 0 exactly at r in {2,3,4,5}) is out of scope. No graph object occurs; this is pure binomial-integer arithmetic.

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
