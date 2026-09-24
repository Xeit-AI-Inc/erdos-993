# r27-c1-la1-forest-degree-extension

Declaration `Erdos993G1.forest_extension_inequality`, exported byte-for-byte from the sealed internal run
`erdos-993-forest-degree-extension-dre-2026-09-24` (`runs/lean-2026-09-25-c1-la1-forest-degree-extension`; r27 — see
[`experiments/r27-forest-degree-extension.md`](../../../experiments/r27-forest-degree-extension.md)).
Award `C1-LA1`; registry effect `E993-R27-FOREST-EXTENSION-INEQUALITY (with E993-R27-FOREST-DEGREE-LEMMA)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem forest_extension_inequality {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) :
    (Fintype.card X : ℤ) * Erdos993G1.indepCount G k
      ≤ (k + 1) * Erdos993G1.indepCount G (k + 1) + 3 * k * Erdos993G1.indepCount G k
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and
attribution are part of it):

> (DL) For every finite forest G and every natural k, the total incident degree over the independent k-sets satisfies (indepDegreeSum G k : Int) <= 2 * k * indepCount G k. (EX) Consequently, for every finite forest G and every natural k, (Fintype.card X : Int) * indepCount G k <= (k + 1) * indepCount G (k + 1) + 3 * k * indepCount G k. Hypotheses: acyclicity and finiteness only. (DL) is an average over the independent k-sets and bounds no individual set. Mathematics: Fang-Lu-Nevo-Yao-Zheng 2026, section 8 (Lemma 8.1 with consequence (8.3); the displayed step of Proposition 8.2). Injection derivation of the root-corrected lemma: critic C-F1-T, sustained by the F adjudication. Compiled (EX) step: U3, re-derived by C-U1-T.

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
