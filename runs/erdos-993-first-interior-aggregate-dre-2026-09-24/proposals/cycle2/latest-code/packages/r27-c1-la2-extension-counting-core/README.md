# r27-c1-la2-extension-counting-core

Declaration `Erdos993G1.e_ge_sub`, exported byte-for-byte from the sealed internal run
`erdos-993-forest-degree-extension-dre-2026-09-24` (`runs/lean-2026-09-25-c1-la2-extension-counting-core`; r27 — see
[`experiments/r27-forest-degree-extension.md`](../../../experiments/r27-forest-degree-extension.md)).
Award `C1-LA2`; registry effect `E993-R27-EXTENSION-LOWER-BOUND (with E993-R27-INDEP-EXTENSION-DOUBLE-COUNT)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem e_ge_sub {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ) {J : Finset X} (hJ : G.IsNIndepSet k J) :
    (Erdos993G1.e G J : ℤ) ≥ (Fintype.card X : ℤ) - (k : ℤ) - (∑ v ∈ J, G.degree v : ℤ)
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and
attribution are part of it):

> Two graph-general statements about an arbitrary finite simple graph G on a finite vertex type X, with n = Fintype.card X, i_k(G) = Erdos993G1.indepCount G k, I_k(G) = G.indepSetFinset k, and e(J) = Erdos993G1.e G J = |V \ N[J]| the number of vertices extending J to an independent set. (1) THE DOUBLE COUNT (registered as the lemma Erdos993G1.double_count, the award's first face): ((k : ℤ) + 1) * Erdos993G1.indepCount G (k + 1) = ∑ J ∈ G.indepSetFinset k, (Erdos993G1.e G J : ℤ), for every k : ℕ. (2) THE EXTENSION LOWER BOUND (registered as the terminal theorem Erdos993G1.e_ge_sub, the award's second face and the declaration this contract binds): (Erdos993G1.e G J : ℤ) ≥ (Fintype.card X : ℤ) - (k : ℤ) - (∑ v ∈ J, G.degree v : ℤ) for every k : ℕ and every J with hJ : G.IsNIndepSet k J. Hypotheses are exactly [Fintype X], [DecidableEq X], [DecidableRel G.Adj] and, for (2), hJ. THERE IS NO ACYCLICITY HYPOTHESIS on either statement, no (★) hypothesis and no hyp-alpha; a stray G.IsAcyclic binder on either is struck at fidelity review. Mathematics: Fang-Lu-Nevo-Yao-Zheng 2026, arXiv:2609.20961v1, §8 (Lemma 8.1 / (8.1) and the displayed step of Proposition 8.2); the double count is classical (the extension method). Derivation in run r27: seat U3 (compiled), critic C-U1-T (independent re-derivation), U adjudicator (replay). These are graph-general facts: they are not forest statements, they transfer no status, and they are not evidence for (DL) or (EX).

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
