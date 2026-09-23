# r25-c1-fourth-band-seven-edge-matching-sign

Declaration `Erdos993G1.FourthWideMatching.sevenMatching_delta_nonpos`, exported byte-for-byte from the sealed internal run
`erdos-993-uniform-residual-no-recovery-dre-2026-09-20` (`runs/lean-2026-09-20-c1-d5-seven-matching-sign`; see
[`experiments/r25-uniform-residual-no-recovery.md`](../../../experiments/r25-uniform-residual-no-recovery.md)).
Cycle 1 award `C1-LA1`; registry identity `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem sevenMatching_delta_nonpos {X : Type*} [Finite X] (G : SimpleGraph X) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card X = 2*r+5) (f : Fin 7 × Bool → X) (hf : Function.Injective f) (he : ∀ i : Fin 7, G.Adj (f (i, false)) (f (i, true))) : Erdos993G1.delta G (r : ℤ) ≤ 0
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope
fences and attribution are part of it):

> For every finite simple graph G on a vertex type of cardinality 2r+5 carrying seven pairwise disjoint edges, Delta_r(G) <= 0, for every r >= 1. Bare: no crossing hypothesis, no acyclicity, no forest hypothesis. Delta, coeff, indepCount are the SEMANTIC-CONTRACT.md Erdos993G1 definitions reused verbatim. hr : 1 <= r is retained for fidelity with the C3 analogue (fiveMatching_delta_nonpos, entry 164) though derivable from cardinality (M.card = 14 <= Nat.card X = 2r+5 forces 5 <= r by omega; r <= 4 is vacuous).

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
