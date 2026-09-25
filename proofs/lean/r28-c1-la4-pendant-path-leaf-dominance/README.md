# r28-c1-la4-pendant-path-leaf-dominance

Declaration `Erdos993G1.pendant_path_leaf_dominance`, exported byte-for-byte from the sealed internal run
`erdos-993-degree-lemma-hall-sdr-dre-2026-09-24` (`runs/lean-2026-09-25-c1-la4-pendant-path-leaf-dominance`; r28 — see
[`experiments/r28-degree-lemma-hall-sdr.md`](../../../experiments/r28-degree-lemma-hall-sdr.md)).
Award `C1-LA4`; registry effect `E993-R28-PENDANT-PATH-LEAF-DOMINANCE`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem pendant_path_leaf_dominance {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (m : ℕ) (u : Fin (m + 2) → X) (hinj : Function.Injective u)
    (hadj : ∀ i : Fin (m + 1), G.Adj (u i.castSucc) (u i.succ))
    (hdeg2 : ∀ i : Fin (m + 2), 0 < i.val → i.val < m + 1 → G.degree (u i) = 2)
    (hleaf : G.degree (u (Fin.last (m + 1))) = 1) (k : ℕ) (i : Fin (m + 2)) :
    occ G (u i) k ≤ occ G (u (Fin.last (m + 1))) k
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and
attribution are part of it):

> Let G be any finite simple graph (no tree hypothesis) and u_0 - u_1 - ... - u_{m+1} a path of distinct vertices (u : Fin (m+2) -> X injective, consecutive vertices adjacent) whose interior vertices u_1, ..., u_m have degree 2 and whose end l = u_{m+1} is a leaf (degree 1); the degree of u_0 is arbitrary. Then for every k in N and every position i in {0, ..., m+1}, c_{u_i}(k) <= c_l(k), where c_v(k) = occ G v k is the number of independent k-sets of G containing v. Index note: SR-PP writes the path u_0..u_M = l with M >= 1; M = m + 1 (SR-PP's M = 1 is Lean m = 0, the leaf/support case, registered E993-PAIR-R-LE-G-POINTWISE clause (i), cited as corroboration only). Binder choices recorded on the face: relative to the T adjudicator's forall-form, the typeclass binders follow Lean order ({X} [Fintype X] [DecidableEq X] (G) [DecidableRel G.Adj]), the hypotheses are named (hinj, hadj, hdeg2, hleaf), and the final universally quantified binders are ordered (k : N) (i : Fin (m+2)) as in the brief's declaration (the T form reads forall (i) (k)); these are logically equivalent. Fences: not (PW) (no comparison of a branch vertex with an arbitrary leaf); stepwise monotonicity along the path is REFUTED (S(3,1,1), k = 3) and is not claimed; not (HS) (FALSE, T22); no status transfer; (DL) is an input, neither re-proved nor edited. Attribution: C-T1-U (two-step shift), C-T1-F and C-T2-U (induced-subgraph isomorphism; polynomial identity at u_0), C-T2-F, C-F2-T, C-F2-U (exact difference formulas) — six independent derivations, one proof (SR-PP); T1 and F2 for the leaf/support case; Lean text re-derived in-run by c1-la4-formalizer-opus-20260925.

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
