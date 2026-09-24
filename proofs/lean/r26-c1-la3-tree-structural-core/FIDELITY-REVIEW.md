# Formalization Fidelity Review

- Run: `lean-2026-09-24-c1-la3-tree-structural-core`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `0252cbb401368af917d12892f6f6e3916c316e1e69cf2b32226de26368354fb4`
- Contract projection SHA-256: `5b8a117885b9aa49bfeeb319ba3b705e4e7a469e1f327756649b1ea9cca2b275`
- Lean binding projection SHA-256: `e107cbd15214665b0206c6cc689065a59cbccf29202abe40c2a99f55d6f60a7d`
- Contract source SHA-256: `3205cad3795799a18b8d8903f333965021560cf8f53977dad85fafa73fe7947c`
- Lean source SHA-256: `28c765ec8846d0fc561e3098bc1b992f856dad7817daa58abab7700ebfb2b054`
- Kernel receipt SHA-256: `0b16767c3402ef622dc7d40dc3b08cfb25b2f28dd7fe47b64b9c508ed3661e52`

## Check Counts

- Passed checks: 49
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `award-content` `independent_review` (independent_reviewer, `c3b7394dbb71b3d8`): Every declaration the award statement of record enumerates is registered: item 9(a) tree_two_le_indepNum_two_le_leafSet; (b) tree_two_le_indepNum_no_adjacent_leaves; (c) leafDegree_eq_zero_of_not_mem_supportSet; (d) sum_leafDegree_eq_card_leafSet and card_C1_le_card_leafSet; (e) leafDegree_two_indepNum_eq_two (terminal) with leafDegree_two_indepNum_eq_two_core; (f) eligible_three_le_indepNum; plus the critic extensions disjoint_leafSet_supportSet (L intersect C = empty), leaf_leafDegree_eq_zero (lambda identically 0 on L), mul_card_leafDegree_fiber_le_card_leafSet (j*|C_j| <= ell) with two_mul_card_C2_le_card_leafSet (k_2 <= floor(ell/2)), and card_C2_eq_zero_of_eligible. Exactly one declaration is a theorem; all 29 others are lemma/definition. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `binding-repairs` `independent_review` (independent_reviewer, `250ca65d46b0f207`): All three binding repairs named in the reviewer brief are honoured. (1) Lemma (c) ships in the sharp form R26LA3.leafDegree_eq_zero_of_not_mem_supportSet with the single hypothesis hd : d not-in supportSet G: no inert (not IsGraphLeaf G d), no IsTree, no hyp-alpha. (2) No SimpleGraph.induce occurs anywhere in the source; connected_induce_compl_pair and its IsTree corollary are absent, replaced by the adjacency-closure lemma R26LA3.closed_reachable. (3) R26LA3.card_C2_eq_zero_of_eligible is present and registered. The two further recorded repairs also hold: R26LA3.sum_leafDegree_eq_card_leafSet and R26LA3.card_C1_le_card_leafSet carry no hypotheses, and the P_3 lemma (both the _core lemma and the terminal theorem) carries no hyp-alpha. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `contract-cosmetic` `independent_review` (independent_reviewer, `003ec12c0765c4f4`): Cosmetic, not a fidelity defect and not resolved by this reviewer: the contract's domain node for the quantified vertex is recorded with variable 's' but lean_type 'v : V', while the declaration's binder is {s : V}. The domain (the vertex type V) and the quantifier kind (forall) are correct on both sides and the projected text is identical in the contract and binding projections, so the deterministic comparison is unaffected. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definition-authority` `independent_review` (independent_reviewer, `36babfefd599cbd6`): All eleven carried C5-LA1 entries (C4LA1.IsGraphLeaf; C5LA1.support, leafSet, leafDegree, indepSetsAvoiding, indepSetCount, forwardDifferenceDel, crossingIndex; C5LA1.support_spec, adj_iff_support_eq, leafDegree_eq_filter_support) were extracted from LeanProject/LeanProof/Main.lean and compared byte-for-byte with the frozen award source sources/r24/c5-la1/LeanProject/LeanProof/Main.lean (SHA-256 0933211d8f02acd867e91547d4a2b09d13fcc3ea178e192e385acc33b696b63b, the synthesis carry-list digest): every body is byte-identical and every registered entry digest reproduces. The one definition the award adds, R26LA3.supportSet = (C5LA1.leafSet G).image (C5LA1.support G), is exactly C(G) of SEMANTIC-CONTRACT.md Section 1. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fences` `independent_review` (independent_reviewer, `e7829a07d663b948`): No fenced object occurs. The source mentions neither C5LA1.aggregate, the aggregate S, W_III, the families, the weights, N_2, U(J'), the deletion injection, topRankResidualIdentity, nor any residual hypothesis; C5LA1.H and C5LA1.R are not carried. No registered declaration consumes hyp-residual (star). The contract's scope text (theorem.informal_statement and conclusion-p3-indepnum-eq-two) states these exclusions explicitly, and the attribution required by the brief (route U3; critics C-U3-T and C-U3-F; T3 for the informal proofs and Mathlib anchors, verified by C-T3-F/C-T3-U) is carried on the face of INFORMAL-PROOF.md. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel-evidence` `independent_review` (independent_reviewer, `37d6ffb781fba5b0`): RECEIPTS/kernel-verification.json (SHA-256 0b16767c3402ef622dc7d40dc3b08cfb25b2f28dd7fe47b64b9c508ed3661e52) reports verdict verified for R26LA3.leafDegree_two_indepNum_eq_two, binds source_sha256_before = source_sha256_after = 28c765ec8846d0fc561e3098bc1b992f856dad7817daa58abab7700ebfb2b054 (the live file's hash), and passes the incomplete-proof and unsafe-execution scans. EVIDENCE/axioms.txt and EVIDENCE/axioms-all-declarations.txt report all 30 registered declarations within {propext, Classical.choice, Quot.sound}; no sorry, admit, native_decide, axiom or decide-over-an-enumeration occurs in the source. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non-vacuity` `independent_review` (independent_reviewer, `2e1667e598c605c0`): Non-vacuous: the three-vertex path P_3 (V = Fin 3, edges 0-1 and 1-2) is a tree whose leaf set is {0,2} of cardinality 2 and whose vertex 1 has C5LA1.leafDegree = 2, so every hypothesis is simultaneously satisfiable, and the conclusion G.indepNum = 2 holds there ({0,2} is independent and no 3-element independent set exists). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `projection-integrity` `independent_review` (independent_reviewer, `11fb958220de666e`): The review input's projections were checked against the sources rather than accepted: theorem_contract.contract_sha256 and lean_binding.declaration_source_sha256 recompute against THEOREM-CONTRACT.yaml (3205cad3...947c) and LeanProject/LeanProof/Main.lean (28c765ec...054); the projected lean_statement, domains, quantifiers, the three hypothesis ids with their canonical texts, the conclusion clause and all 31 definition nodes reproduce the contract's rendered view without paraphrase or omission, and the contract and binding projections agree field for field. Recomputed fingerprints match the values the controller recorded. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `statement-of-record` `independent_review` (independent_reviewer, `348015815dfe64fd`): Terminal declaration R26LA3.leafDegree_two_indepNum_eq_two matches the Cycle 1 synthesis award statement for C1-LA3 exactly: binders (G : SimpleGraph V) [DecidableRel G.Adj] over the section context {V : Type*} [Fintype V] [DecidableEq V], hypotheses hTree : G.IsTree, hLeafCard : (C5LA1.leafSet G).card = 2 and hDeg2 : C5LA1.leafDegree G s = 2 with {s : V} implicit, conclusion G.indepNum = 2. No hyp-alpha, no hyp-eligible and no hyp-residual (star); no extra hypothesis, no dropped conjunct, no weakening. The contract expected_statement is whitespace-normalized identical to the shipped declaration text and its recorded digest 272221c3cf3809e320778b53f0c156e68293e47bde5948dee3677de7a526add5 recomputes. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c1-la3-fable-fidelity-20260924` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c1-la3-fable-fidelity-attestation-20260924-266df9da-2551-4084-9192-bd1822931f64`
- Completed: `2026-09-24T05:22:01Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
