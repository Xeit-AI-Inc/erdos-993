# r27-c1-la3-degree-lemma-implication-chain

Declaration `Erdos993G1.degree_lemma_implies_chain`, exported byte-for-byte from the sealed internal run
`erdos-993-forest-degree-extension-dre-2026-09-24` (`runs/lean-2026-09-25-c1-la3-degree-lemma-implication-chain`; r27 — see
[`experiments/r27-forest-degree-extension.md`](../../../experiments/r27-forest-degree-extension.md)).
Award `C1-LA3`; registry effect `E993-R27-DEGREE-LEMMA-IMPLIES-EXTENSION-CHAIN`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem degree_lemma_implies_chain :
    DlHyp.{u} → ExHyp.{u} ∧ LbHyp.{u} ∧ R5Hyp.{u} ∧ XrHyp.{u}
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and
attribution are part of it):

> Assume (DL): for every finite forest G on a finite vertex type X (quantified over the Fintype/DecidableEq/DecidableRel instances) and every natural k, the incident degree sum D_k(G) is at most 2k i_k(G). Then (EX) n i_k <= (k+1) i_{k+1} + 3k i_k for every finite forest and every k; (LB) Delta_k(G) < 0 implies n <= 4k for every finite forest and every k; (R5) 21 <= n implies 0 <= Delta_5(G) for every finite forest; and (XR) x(G) < r implies n <= 4r - 4 for every finite forest and every r. Each of the five statements is the corresponding frozen SOLUTION-CONTRACT.md section 2 declaration, taken definitionally. The award is the IMPLICATION: none of (DL), (EX), (LB), (R5), (XR) is asserted.

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
