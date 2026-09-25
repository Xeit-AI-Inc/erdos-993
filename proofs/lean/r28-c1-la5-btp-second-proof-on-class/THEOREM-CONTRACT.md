# Theorem Contract: C1-LA5 (r28): (DL) on trees whose branch tree has maximum degree <= 2, via Theorem BTP (E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2) and (LC) — scope note on E993-R27-FOREST-DEGREE-LEMMA

- Contract ID: `erdos-993-degree-lemma-hall-sdr-dre-2026-09-24-c1-la5-btp-second-proof-on-class-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `5d556ebb8a8bfad8f9c8b84e5a68db257f574f4b738c14f34a4170307ac550f2`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Let G be a finite simple graph on a vertex type X that is a tree (G.IsTree), and suppose G is in the class BranchTreeMaxDegreeLeTwo: every vertex v with deg v >= 3 has at most two neighbours w from which some vertex z with deg z >= 3 is reachable in G - v (Lean: a walk w ~> z of G whose support avoids v; proved equivalent in-run to reachability in G.induce {v}ᶜ with z ≠ v, lemma branchTreeMaxDegreeLeTwo_iff_induce). Then for every k in N: D_k(G) <= 2k * i_k(G), i.e. (indepDegreeSum G k : Z) <= 2 * k * indepCount G k, where indepDegreeSum G k = sum over independent k-sets J of sum over v in J of deg v and indepCount G k = number of independent k-sets. Route (terminal proof): Theorem BTP — for every k an injection from the branch slots Σ v : {v // 3 ≤ deg v}, Fin (deg v − 2) into the leaves sending each slot of v to an own pendant leaf l of v with c_v(k) <= c_l(k) exists (lemma btp_sdr_exists; face lemma leaf_slot_dominance_on_pathlike_branch_trees), hence slotsAtLeast G k t <= leavesAtLeast G k t for every t : N including t = 0 (threshold_of_sdr) — composed with the carried C1-LA2 reduction dominance_implies_degree_lemma. No hypothesis n >= 2, k >= 1 or t >= 1. SCOPE: a byte-different second formal proof of (DL) ON THIS CLASS ONLY; registers as a scope note on E993-R27-FOREST-DEGREE-LEMMA (an alias distinction), never as a (DL) key; the formal (DL) of record is r27 C1-LA1 forest_degree_lemma, an input that is not edited. FENCES: NOT (HS) on all trees — (HS) tree_leaf_slot_dominance is FALSE (T22, SR-HS-REF); T22 (branch tree K_{1,3}) is outside the class, which is sharp for every branch-degree bound D >= 3; slot_leaf_sdr_exists and R28U2.tree_leaf_slot_dominance are never carried or used. NOT (DL) on all forests. Not (PW). No status transfer (SOLUTION-CONTRACT §3.1). ATTRIBUTION: C-T2-U (Theorem BTP); C-T2-F, C-F2-T, C-F2-U, C-T1-F (independent proofs); SR-BTP (repairs; canonical proof); U adjudicator (route U-BTP-CLASS-FORMAL); pendant-path lemma C-T1-U, C-T1-F, C-T2-U, C-T2-F, C-F2-T, C-F2-U (SR-PP), Lean text by the C1-LA4 formalizer (carried); (LC) U1 (seat), Lean text as assembled by the C1-LA2 formalizer (carried); common attribution (r27 C-T2-U Finding 6; r27 T adjudicator's 2 <= n correction; SR-JOIN; Fang–Lu–Nevo–Yao–Zheng 2026 §8). New Lean text (entries 6, 21–31) written in-run by c1-la5-formalizer-opus-20260925.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem Erdos993G1.forest_degree_lemma_on_pathlike_branch_trees`
- Statement SHA-256: `1a75cd0380d2d84989938a2604b37051c8e586e373fe2cabb207fd2a41c75a72`

```lean
theorem forest_degree_lemma_on_pathlike_branch_trees {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (hT : G.IsTree) (hB : BranchTreeMaxDegreeLeTwo G)
    (k : ℕ) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k
```

## Quantifiers

- `forall X` over `dom-x`
- `forall G` over `dom-g`
- `forall k` over `dom-k`

## Hypotheses

- `hyp-tree`: (hT : G.IsTree) — G is a finite tree. No n >= 2 hypothesis.
- `hyp-branch-class`: (hB : BranchTreeMaxDegreeLeTwo G) — every branch vertex has at most two neighbours from which another branch vertex is reachable in G − v (branch tree of maximum degree <= 2).

## Conclusion

- `conclusion`: (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k — D_k(G) <= 2k·i_k(G) for every k, on the BTP class only. Scope note on E993-R27-FOREST-DEGREE-LEMMA, never a (DL) key; not (DL) on all forests; not (HS) on all trees; no status transfer.

## Dependencies

- `def-indep-set-finset` -> `def-indep-degree-sum`
- `def-degree` -> `def-indep-degree-sum`
- `def-indep-set-finset` -> `def-occ`
- `def-occ` -> `def-slots-at-least`
- `def-degree` -> `def-slots-at-least`
- `def-occ` -> `def-leaves-at-least`
- `def-degree` -> `def-leaves-at-least`
- `def-degree` -> `def-branch-tree-max-degree-le-two`
- `def-walk` -> `def-branch-tree-max-degree-le-two`
- `dom-x` -> `dom-g`
- `def-is-tree` -> `hyp-tree`
- `dom-g` -> `hyp-tree`
- `def-branch-tree-max-degree-le-two` -> `hyp-branch-class`
- `dom-g` -> `hyp-branch-class`
- `def-indep-degree-sum` -> `conclusion`
- `def-indep-count` -> `conclusion`
- `dom-k` -> `conclusion`
- `hyp-tree` -> `conclusion`
- `hyp-branch-class` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-brief`: `SOURCES/C1-STAGE7-FORMALIZER-BRIEF-LA5.md` (match)
- `src-c1-la2-kernel-receipt`: `SOURCES/c1-la2-kernel-verification.json` (match)
- `src-c1-la2-main`: `SOURCES/c1-la2-Main.lean` (match)
- `src-c1-la2-verification-report`: `SOURCES/c1-la2-VERIFICATION-REPORT.md` (match)
- `src-c1-la4-kernel-receipt`: `SOURCES/c1-la4-kernel-verification.json` (match)
- `src-c1-la4-main`: `SOURCES/c1-la4-Main.lean` (match)
- `src-c1-la4-verification-report`: `SOURCES/c1-la4-VERIFICATION-REPORT.md` (match)
- `src-capsule-manifest`: `SOURCES/C1-LA5-PACKET-MANIFEST.json` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-carry-digests`: `SOURCES/c1-stage7-SOURCE-DIGESTS.json` (match)
- `src-carry-table`: `DRAFTS/carry-table.json` (match)
- `src-entry-01`: `LeanProject/LeanProof/Snippets/0001-definition-Erdos993G1-indepCount.lean.fragment` (match)
- `src-entry-02`: `LeanProject/LeanProof/Snippets/0002-definition-Erdos993G1-indepDegreeSum.lean.fragment` (match)
- `src-entry-03`: `LeanProject/LeanProof/Snippets/0003-definition-Erdos993G1-occ.lean.fragment` (match)
- `src-entry-04`: `LeanProject/LeanProof/Snippets/0004-definition-Erdos993G1-slotsAtLeast.lean.fragment` (match)
- `src-entry-05`: `LeanProject/LeanProof/Snippets/0005-definition-Erdos993G1-leavesAtLeast.lean.fragment` (match)
- `src-entry-06`: `LeanProject/LeanProof/Snippets/0006-definition-Erdos993G1-BranchTreeMaxDegreeLeTwo.lean.fragment` (match)
- `src-entry-07`: `LeanProject/LeanProof/Snippets/0007-lemma-Erdos993G1-indepCount_eq_card_indepSetFinset.lean.fragment` (match)
- `src-entry-08`: `LeanProject/LeanProof/Snippets/0008-lemma-Erdos993G1-pendant_path_adj_of_pos.lean.fragment` (match)
- `src-entry-09`: `LeanProject/LeanProof/Snippets/0009-lemma-Erdos993G1-pendant_path_adj_consec.lean.fragment` (match)
- `src-entry-10`: `LeanProject/LeanProof/Snippets/0010-lemma-Erdos993G1-pendant_path_adj_mem_range.lean.fragment` (match)
- `src-entry-11`: `LeanProject/LeanProof/Snippets/0011-lemma-Erdos993G1-exists_pendant_shift_perm.lean.fragment` (match)
- `src-entry-12`: `LeanProject/LeanProof/Snippets/0012-lemma-Erdos993G1-pendant_path_occ_le_of_lt.lean.fragment` (match)
- `src-entry-13`: `LeanProject/LeanProof/Snippets/0013-lemma-Erdos993G1-pendant_path_leaf_dominance.lean.fragment` (match)
- `src-entry-14`: `LeanProject/LeanProof/Snippets/0014-lemma-Erdos993G1-occ_le_card_indepSetFinset.lean.fragment` (match)
- `src-entry-15`: `LeanProject/LeanProof/Snippets/0015-lemma-Erdos993G1-layerCake_subset.lean.fragment` (match)
- `src-entry-16`: `LeanProject/LeanProof/Snippets/0016-lemma-Erdos993G1-sum_branch_slots_eq_sum_slotsAtLeast.lean.fragment` (match)
- `src-entry-17`: `LeanProject/LeanProof/Snippets/0017-lemma-Erdos993G1-sum_leaves_eq_sum_leavesAtLeast.lean.fragment` (match)
- `src-entry-18`: `LeanProject/LeanProof/Snippets/0018-lemma-Erdos993G1-indepDegreeSum_eq_sum_degree_mul_occ.lean.fragment` (match)
- `src-entry-19`: `LeanProject/LeanProof/Snippets/0019-lemma-Erdos993G1-sum_occ_eq_card_mul_indepSetFinset.lean.fragment` (match)
- `src-entry-20`: `LeanProject/LeanProof/Snippets/0020-lemma-Erdos993G1-dominance_implies_degree_lemma.lean.fragment` (match)
- `src-entry-21`: `LeanProject/LeanProof/Snippets/0021-lemma-Erdos993G1-walk_avoiding_iff_induce_reachable.lean.fragment` (match)
- `src-entry-22`: `LeanProject/LeanProof/Snippets/0022-lemma-Erdos993G1-branchTreeMaxDegreeLeTwo_iff_induce.lean.fragment` (match)
- `src-entry-23`: `LeanProject/LeanProof/Snippets/0023-lemma-Erdos993G1-pendant_chain_back_eq.lean.fragment` (match)
- `src-entry-24`: `LeanProject/LeanProof/Snippets/0024-lemma-Erdos993G1-pendant_chain_eq.lean.fragment` (match)
- `src-entry-25`: `LeanProject/LeanProof/Snippets/0025-lemma-Erdos993G1-exists_pendant_chain.lean.fragment` (match)
- `src-entry-26`: `LeanProject/LeanProof/Snippets/0026-lemma-Erdos993G1-pendant_chain_occ_le.lean.fragment` (match)
- `src-entry-27`: `LeanProject/LeanProof/Snippets/0027-lemma-Erdos993G1-exists_own_leaves.lean.fragment` (match)
- `src-entry-28`: `LeanProject/LeanProof/Snippets/0028-lemma-Erdos993G1-btp_sdr_exists.lean.fragment` (match)
- `src-entry-29`: `LeanProject/LeanProof/Snippets/0029-lemma-Erdos993G1-threshold_of_sdr.lean.fragment` (match)
- `src-entry-30`: `LeanProject/LeanProof/Snippets/0030-lemma-Erdos993G1-leaf_slot_dominance_on_pathlike_branch_trees.lean.fragment` (match)
- `src-entry-31`: `LeanProject/LeanProof/Snippets/0031-theorem-Erdos993G1-forest_degree_lemma_on_pathlike_branch_trees.lean.fragment` (match)
- `src-f-adjudication`: `SOURCES/F-ADJUDICATION.md` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-r25-award-main`: `SOURCES/r25-c4-Main.lean` (match)
- `src-r27-award-main`: `SOURCES/r27-c1-la1-Main.lean` (match)
- `src-semantic-contract`: `SOURCES/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract`: `SOURCES/SOLUTION-CONTRACT.md` (match)
- `src-sr-btp`: `SOURCES/SR-BTP-SECOND-READ.md` (match)
- `src-sr-hs-ref`: `SOURCES/SR-HS-REF-SECOND-READ.md` (match)
- `src-sr-pp`: `SOURCES/SR-PP-SECOND-READ.md` (match)
- `src-synthesis`: `SOURCES/SYNTHESIS.md` (match)
- `src-t-adjudication`: `SOURCES/T-ADJUDICATION.md` (match)
- `src-transport-script`: `DRAFTS/transport.py` (match)
- `src-u-adjudication`: `SOURCES/U-ADJUDICATION.md` (match)
- `src-u1-main`: `SOURCES/U1-Main.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
