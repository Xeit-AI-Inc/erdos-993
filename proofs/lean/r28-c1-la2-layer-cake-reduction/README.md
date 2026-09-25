# r28-c1-la2-layer-cake-reduction

Declaration `Erdos993G1.dominance_implies_degree_lemma`, exported byte-for-byte from the sealed internal run
`erdos-993-degree-lemma-hall-sdr-dre-2026-09-24` (`runs/lean-2026-09-25-c1-la2-layer-cake-reduction`; r28 — see
[`experiments/r28-degree-lemma-hall-sdr.md`](../../../experiments/r28-degree-lemma-hall-sdr.md)).
Award `C1-LA2`; registry effect `E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA (with the r27 reformulation formal upgrade)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem dominance_implies_degree_lemma {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hT : G.IsTree) (k : ℕ)
    (h : ∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and
attribution are part of it):

> Let X be a finite type with decidable equality, G a simple graph on X with decidable adjacency that is a tree (G.IsTree), and k a natural number. Write I_k for the independent k-sets, i_k = |I_k|, c_v(k) for the number of J ∈ I_k containing v, D_k = Σ_{J∈I_k} Σ_{v∈J} deg v, slots_{≥t} = Σ over v with deg v ≥ 3 and c_v(k) ≥ t of (deg v − 2), and leaves_{≥t} = #{ℓ : deg ℓ = 1, c_ℓ(k) ≥ t}. If slots_{≥t} ≤ leaves_{≥t} for every t ∈ ℕ, then D_k ≤ 2k·i_k (in ℤ). Erratum R28-E-a: the ∀ t quantifier is kept; on trees the t = 0 row follows from the t ≥ 1 rows, the proof consumes only t ≥ 1, and hT is unused. Scope declaration (separate companion lemmas, critic-attributed, not the key's statement): the same implication holds on every finite simple graph with the hypothesis only at t ≥ 1. Fences: an instance-wise implication, not a proof of (DL) and not a second proof of (DL); its hypothesis fails at (T22, 11) and (T22, 12), (HS) being REFUTED; no composition with tree_leaf_slot_dominance; the r27 reformulation companions are a scope note on E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2, never a new key; no status transfer (SOLUTION-CONTRACT §3.1). Attribution: U1 (seat) for (LC); C-U1-T and C-U1-F (critics) for the graph-general form and the reformulation's Lean proofs; r27 C-T2-U (mechanism), the r27 T adjudicator (2 ≤ n), SR-JOIN, Fang–Lu–Nevo–Yao–Zheng 2026 §8 (the degree lemma), r28 SR-PP (PP-3/PP-4).

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
