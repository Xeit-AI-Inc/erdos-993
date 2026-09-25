# r27-c1-la4-descent-order-bounds

Declaration `Erdos993G1.forest_descent_restriction`, exported byte-for-byte from the sealed internal run
`erdos-993-forest-degree-extension-dre-2026-09-24` (`runs/lean-2026-09-25-c1-la4-descent-order-bounds`; r27 — see
[`experiments/r27-forest-degree-extension.md`](../../../experiments/r27-forest-degree-extension.md)).
Award `C1-LA4`; registry effect `E993-R27-DESCENT-RESTRICTION-4R-MINUS-4 (with E993-R27-FOREST-DESCENT-LINEAR-BOUND, E993-R27-RANK5-CEILING-20)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem forest_descent_restriction {X : Type u} [Finite X] (G : SimpleGraph X) (hG : G.IsAcyclic)
    (r : ℕ) (hx : firstDescent G < r) : Nat.card X ≤ 4 * r - 4
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and
attribution are part of it):

> Let G be a finite forest and x(G) the least k with Delta_k(G) < 0. (LB) For every natural k, Delta_k(G) < 0 implies n <= 4k. (R5) If n >= 21 then Delta_5(G) >= 0. (XR) For every natural r, x(G) < r implies n <= 4r - 4. Here n = Nat.card X and Delta_k is the G1 definition of record. The terminal declaration of this award is (XR); (LB) and (R5) are the other two award faces, registered as lemmas in the same project. All three are unconditional: the degree lemma (DL) is supplied by the carried, kernel-verified Erdos993G1.forest_degree_lemma of award C1-LA1, so no DlHyp hypothesis appears on any face.

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
