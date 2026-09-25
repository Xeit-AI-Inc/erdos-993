# Theorem Contract: E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA (LC): threshold leaf/slot dominance at every t implies the degree inequality D_k ≤ 2k·i_k (instance-wise, on a finite tree)

- Contract ID: `e993-r28-c1-la2-dominance-implies-degree-lemma-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `095fc227d29def02ec248714e87fa2493a27547f56f3918b7d14c620165b0526`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Let X be a finite type with decidable equality, G a simple graph on X with decidable adjacency that is a tree (G.IsTree), and k a natural number. Write I_k for the independent k-sets, i_k = |I_k|, c_v(k) for the number of J ∈ I_k containing v, D_k = Σ_{J∈I_k} Σ_{v∈J} deg v, slots_{≥t} = Σ over v with deg v ≥ 3 and c_v(k) ≥ t of (deg v − 2), and leaves_{≥t} = #{ℓ : deg ℓ = 1, c_ℓ(k) ≥ t}. If slots_{≥t} ≤ leaves_{≥t} for every t ∈ ℕ, then D_k ≤ 2k·i_k (in ℤ). Erratum R28-E-a: the ∀ t quantifier is kept; on trees the t = 0 row follows from the t ≥ 1 rows, the proof consumes only t ≥ 1, and hT is unused. Scope declaration (separate companion lemmas, critic-attributed, not the key's statement): the same implication holds on every finite simple graph with the hypothesis only at t ≥ 1. Fences: an instance-wise implication, not a proof of (DL) and not a second proof of (DL); its hypothesis fails at (T22, 11) and (T22, 12), (HS) being REFUTED; no composition with tree_leaf_slot_dominance; the r27 reformulation companions are a scope note on E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2, never a new key; no status transfer (SOLUTION-CONTRACT §3.1). Attribution: U1 (seat) for (LC); C-U1-T and C-U1-F (critics) for the graph-general form and the reformulation's Lean proofs; r27 C-T2-U (mechanism), the r27 T adjudicator (2 ≤ n), SR-JOIN, Fang–Lu–Nevo–Yao–Zheng 2026 §8 (the degree lemma), r28 SR-PP (PP-3/PP-4).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem Erdos993G1.dominance_implies_degree_lemma`
- Statement SHA-256: `82e14d0c768d70724486ffb9cccdd1d4ac07d07caede3a2357f94c60f6d60895`

```lean
theorem dominance_implies_degree_lemma {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hT : G.IsTree) (k : ℕ)
    (h : ∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k
```

## Quantifiers

- `forall X` over `dom-carrier`
- `forall G` over `dom-graph`
- `forall k` over `dom-rank`

## Hypotheses

- `hyp-tree`: hT : G.IsTree (Mathlib: connected and acyclic). Kept in the signature exactly as SOLUTION-CONTRACT §2 writes it; the proof does not use it (erratum R28-E-a; Lean's unused-variable linter warns). It is never strengthened or dropped.
- `hyp-threshold`: h : ∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t — the threshold form of (HS) at this (G, k), for every t including t = 0. The proof consumes only the rows 1 ≤ t ≤ |I_k|. On trees the t = 0 row follows from the t ≥ 1 rows (Erdos993G1.CriticU1F.tree_forall_t_of_ge_one). This hypothesis FAILS at (T22, 11) and (T22, 12) (SR-HS-REF); (HS) is REFUTED and is never supplied here.

## Conclusion

- `conclusion`: (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k, i.e. D_k(G) ≤ 2k·i_k(G) in ℤ, for this (G, k). An instance-wise implication: not a proof of (DL) and not a second proof of (DL).

## Dependencies

- `def-occ` -> `def-slotsatleast`
- `def-occ` -> `def-leavesatleast`
- `dom-carrier` -> `dom-graph`
- `dom-graph` -> `hyp-tree`
- `def-leavesatleast` -> `hyp-threshold`
- `def-slotsatleast` -> `hyp-threshold`
- `dom-graph` -> `hyp-threshold`
- `dom-rank` -> `hyp-threshold`
- `dom-threshold` -> `hyp-threshold`
- `def-indepcount` -> `conclusion`
- `def-indepdegreesum` -> `conclusion`
- `hyp-threshold` -> `conclusion`
- `hyp-tree` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `frag-01`: `LeanProject/LeanProof/Snippets/0001-definition-Erdos993G1-indepCount.lean.fragment` (match)
- `frag-02`: `LeanProject/LeanProof/Snippets/0002-definition-Erdos993G1-indepDegreeSum.lean.fragment` (match)
- `frag-03`: `LeanProject/LeanProof/Snippets/0003-definition-Erdos993G1-occ.lean.fragment` (match)
- `frag-04`: `LeanProject/LeanProof/Snippets/0004-definition-Erdos993G1-slotsAtLeast.lean.fragment` (match)
- `frag-05`: `LeanProject/LeanProof/Snippets/0005-definition-Erdos993G1-leavesAtLeast.lean.fragment` (match)
- `frag-06`: `LeanProject/LeanProof/Snippets/0006-lemma-Erdos993G1-indepCount_eq_card_indepSetFinset.lean.fragment` (match)
- `frag-07`: `LeanProject/LeanProof/Snippets/0007-lemma-Erdos993G1-occ_le_card_indepSetFinset.lean.fragment` (match)
- `frag-08`: `LeanProject/LeanProof/Snippets/0008-lemma-Erdos993G1-layerCake_subset.lean.fragment` (match)
- `frag-09`: `LeanProject/LeanProof/Snippets/0009-lemma-Erdos993G1-sum_branch_slots_eq_sum_slotsAtLeast.lean.fragment` (match)
- `frag-10`: `LeanProject/LeanProof/Snippets/0010-lemma-Erdos993G1-sum_leaves_eq_sum_leavesAtLeast.lean.fragment` (match)
- `frag-11`: `LeanProject/LeanProof/Snippets/0011-lemma-Erdos993G1-indepDegreeSum_eq_sum_degree_mul_occ.lean.fragment` (match)
- `frag-12`: `LeanProject/LeanProof/Snippets/0012-lemma-Erdos993G1-sum_occ_eq_card_mul_indepSetFinset.lean.fragment` (match)
- `frag-13`: `LeanProject/LeanProof/Snippets/0013-lemma-Erdos993G1-CriticU1F-weight_identity.lean.fragment` (match)
- `frag-14`: `LeanProject/LeanProof/Snippets/0014-lemma-Erdos993G1-CriticU1F-pointwise_split.lean.fragment` (match)
- `frag-15`: `LeanProject/LeanProof/Snippets/0015-lemma-Erdos993G1-CriticU1F-leaf_branch_identity_general.lean.fragment` (match)
- `frag-16`: `LeanProject/LeanProof/Snippets/0016-lemma-Erdos993G1-CriticU1F-leaf_branch_identity_of_no_isolated.lean.fragment` (match)
- `frag-17`: `LeanProject/LeanProof/Snippets/0017-lemma-Erdos993G1-CriticU1F-tree_degree_pos.lean.fragment` (match)
- `frag-18`: `LeanProject/LeanProof/Snippets/0018-lemma-Erdos993G1-CriticU1F-tree_leaf_branch_identity.lean.fragment` (match)
- `frag-19`: `LeanProject/LeanProof/Snippets/0019-lemma-Erdos993G1-CriticU1F-dominance_implies_degree_lemma_general.lean.fragment` (match)
- `frag-20`: `LeanProject/LeanProof/Snippets/0020-lemma-Erdos993G1-CriticU1F-slotsAtLeast_zero.lean.fragment` (match)
- `frag-21`: `LeanProject/LeanProof/Snippets/0021-lemma-Erdos993G1-CriticU1F-leavesAtLeast_zero.lean.fragment` (match)
- `frag-22`: `LeanProject/LeanProof/Snippets/0022-lemma-Erdos993G1-CriticU1F-tree_slots_le_leaves_zero.lean.fragment` (match)
- `frag-23`: `LeanProject/LeanProof/Snippets/0023-lemma-Erdos993G1-CriticU1F-tree_forall_t_of_ge_one.lean.fragment` (match)
- `frag-24`: `LeanProject/LeanProof/Snippets/0024-lemma-Erdos993G1-CriticU1F-tree_slot_count.lean.fragment` (match)
- `frag-25`: `LeanProject/LeanProof/Snippets/0025-lemma-Erdos993G1-CriticU1F-tree_degree_lemma_iff.lean.fragment` (match)
- `frag-26`: `LeanProject/LeanProof/Snippets/0026-lemma-CriticU1T-base_identity.lean.fragment` (match)
- `frag-27`: `LeanProject/LeanProof/Snippets/0027-lemma-CriticU1T-reformulation_of_no_isolated.lean.fragment` (match)
- `frag-28`: `LeanProject/LeanProof/Snippets/0028-lemma-CriticU1T-tree_no_isolated.lean.fragment` (match)
- `frag-29`: `LeanProject/LeanProof/Snippets/0029-lemma-CriticU1T-tree_leaf_branch_reformulation.lean.fragment` (match)
- `frag-30`: `LeanProject/LeanProof/Snippets/0030-lemma-CriticU1T-tree_slot_count.lean.fragment` (match)
- `frag-31`: `LeanProject/LeanProof/Snippets/0031-lemma-CriticU1T-dominance_implies_degree_lemma_graph_general.lean.fragment` (match)
- `frag-32`: `LeanProject/LeanProof/Snippets/0032-lemma-CriticU1T-tree_DL_iff_aggregate.lean.fragment` (match)
- `frag-33`: `LeanProject/LeanProof/Snippets/0033-theorem-Erdos993G1-dominance_implies_degree_lemma.lean.fragment` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-carry-c-u1-f-audit`: `SOURCES/c1-stage7-sources/C-U1-F-Audit.lean` (match)
- `src-carry-c-u1-f-critic`: `SOURCES/c1-stage7-sources/C-U1-F-Critic.lean` (match)
- `src-carry-c-u1-t-criticcheck`: `SOURCES/c1-stage7-sources/C-U1-T-CriticCheck.lean` (match)
- `src-carry-source-digests`: `SOURCES/c1-stage7-sources/SOURCE-DIGESTS.json` (match)
- `src-carry-table`: `DRAFTS/carry-table.json` (match)
- `src-carry-u1-main`: `SOURCES/c1-stage7-sources/U1-Main.lean` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-r25-award-main`: `SOURCES/r25-c4/Main.lean` (match)
- `src-r27-c1-la1-main`: `SOURCES/r27-c1-la1/Main.lean` (match)
- `src-semantic-contract`: `SOURCES/contracts/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract`: `SOURCES/contracts/SOLUTION-CONTRACT.md` (match)
- `src-synthesis`: `SOURCES/contracts/SYNTHESIS.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
