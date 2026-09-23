# r25-c4-matching-bottom-rank-uniform-sign

Declaration `Erdos993G1.UniformMatching.bottomRank_delta_nonpos`, exported byte-for-byte from the sealed internal run
`erdos-993-uniform-residual-no-recovery-dre-2026-09-20` (`runs/lean-2026-09-21-c4-bottom-rank-uniform-matching-sign`; see
[`experiments/r25-uniform-residual-no-recovery.md`](../../../experiments/r25-uniform-residual-no-recovery.md)).
Cycle 4 award `C4-LA1`; registry identity `E993-R25-MATCHING-BOTTOM-RANK-UNIFORM-SIGN`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem bottomRank_delta_nonpos {X : Type u} [Finite X] (d : ℕ) (hd : 3 ≤ d) (G : SimpleGraph X) (hn : Nat.card X = 3 * d) (f : Fin ((3 * d + 1) / 2 - 1) × Bool → X) (hf : Function.Injective f) (he : ∀ i, G.Adj (f (i, false)) (f (i, true))) : Erdos993G1.delta G (d : ℤ) ≤ 0
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope
fences and attribution are part of it):

> For every d >= 3, every finite type X, every finite simple graph G on X with Nat.card X = 3*d, and every matching of size m(d) = (3*d+1)/2 - 1 in G (realised by an injective f : Fin m(d) x Bool -> X with G.Adj (f (i,false)) (f (i,true)) for every i), Erdos993G1.delta G (d : Z) <= 0, where delta/coeff/indepCount are the G1 definitions counting actual independent-set sizes with integer zero extension. No crossing hypothesis, no acyclicity, no cover; uniform in d with no horizon; rank r = d and order 3*d only.

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
