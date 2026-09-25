# Theorem Contract: (ELIG) E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN — interior eligibility forces α ≥ 7 on finite trees (r29 Cycle 1 award C1-LA3)

- Contract ID: `erdos-993-math-dre-20260925-r29-high-tail-certification-c1-la3-interior-eligibility-guard-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `open`
- Contract SHA-256: `99379e6d984bfb73fc2626b2d1c27cde794c68666689ea0638ce9e80f9fe7542`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite ordinary tree T with integer p = α(T) − 2: if x(T) + 2 ≤ p, where x(T) is the least k with Δ_k(T) = i_{k+1}(T) − i_k(T) < 0, then α(T) ≥ 7. Lean: for every finite type V with decidable equality and every G : SimpleGraph V with decidable adjacency, G.IsTree and C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2 (ℕ) imply 7 ≤ G.indepNum. The hypothesis hInterior is an inequality in ℕ with truncated subtraction: crossingIndex G + 2 ≤ G.indepNum - 2. It is equivalent to the integer hypothesis (crossingIndex G : ℤ) + 2 ≤ (G.indepNum : ℤ) - 2 for EVERY value of indepNum: when indepNum < 2 the ℕ right side is 0 and the ℤ right side is negative, while the left side is ≥ 2, so both are false; when indepNum ≥ 2 the ℕ subtraction equals the ℤ one and the two are identical. So the Lean hypothesis is exactly the registry hypothesis x(T) + 2 ≤ p with integer p = α(T) − 2. Terminal declaration E993HighTail.interiorEligibilityAlphaGeSeven, body E993Interior.eligibleAlphaGeSeven G hT hInterior: a NEW terminal name applying the carried entry 43, not a byte-identical re-export. Fences (SOLUTION-CONTRACT §3): §3.1 not a no-recovery statement; no status transfer to E993-R25-UNR-FOREST-WIDE, E993-G1WIDE-NO-SIZE-CAP, NR1, FOREST, TREE, TRANSFER, E993-BETA-AGG or Erdős #993. §3.2 E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE (VERIFIED, first-interior award) unchanged and never re-registered; the relation is a scope note. §3.5 no census value, r27 root correction or r28 Hall/SDR route. §3.7 attribution on every face. §3.8 separate certificate; entry 43's presence inside the first-interior package is context, never a certificate. Excluded conclusions: no aggregate sign; no statement at any other depth; no no-recovery or unimodality claim; no re-certification of E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE. Attribution: Codex (GPT-6): entry 43's proof (the three low-α exclusions) and the proposed statement; r25: the G1 definitions (entries 15–17) and the Erdos993G1 counting layer as carried in the first-interior source; r24 C4-LA1 / r26: the C4LA1 / C5LA1 definition layer; r29 T1's extraction as corrected by C-T1-F, C-T1-U and the T adjudicator (acyclicity in all three branches); the U adjudicator's recomputation and scratch candidate (terminal declaration text). Key: E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN (OPEN → VERIFIED by this award only, after every gate). Canonical DRE run id: erdos-993-math-dre-20260925-r29-high-tail-certification.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993HighTail.interiorEligibilityAlphaGeSeven`
- Statement SHA-256: `16f7270f20ee1f5980d1381a2297a3ea3460caf934ad0b7cc6d48299b15eac07`

```lean
theorem interiorEligibilityAlphaGeSeven {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
    (hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2) :
    7 ≤ G.indepNum
```

## Quantifiers

- `forall V` over `domain-vertex-type`
- `forall G` over `domain-graph`

## Hypotheses

- `hyp-tree`: hT : G.IsTree — G is a finite ordinary tree (connected and acyclic). Consumption: connectivity (with acyclicity, as the edge count |E| + 1 = card V) through IsTree.card_edgeFinset in order_ge_alpha_succ, delta_one_nonneg, the three Δ_2 branches and the cover-degree bounds; acyclicity through hT.isAcyclic into Erdos993G1.indepCount_three_add_edge_incidence (carried entry 34) in all three Δ_2 branches (n ≥ 9, n = 7, n = 8).
- `hyp-interior`: hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2 (in ℕ). The hypothesis hInterior is an inequality in ℕ with truncated subtraction: crossingIndex G + 2 ≤ G.indepNum - 2. It is equivalent to the integer hypothesis (crossingIndex G : ℤ) + 2 ≤ (G.indepNum : ℤ) - 2 for EVERY value of indepNum: when indepNum < 2 the ℕ right side is 0 and the ℤ right side is negative, while the left side is ≥ 2, so both are false; when indepNum ≥ 2 the ℕ subtraction equals the ℤ one and the two are identical. So the Lean hypothesis is exactly the registry hypothesis x(T) + 2 ≤ p with integer p = α(T) − 2. Consumption: forces indepNum ≥ 4 and bounds crossingIndex G by 0, 1, 2 in the cases indepNum = 4, 5, 6.

## Conclusion

- `conclusion`: 7 ≤ G.indepNum (in ℕ): every finite tree whose first strict descent x satisfies x + 2 ≤ α − 2 has independence number at least 7.

## Dependencies

- `def-isindepset` -> `def-indepnum`
- `def-finset-univ` -> `def-indepsetsavoiding`
- `def-isindepset` -> `def-indepsetsavoiding`
- `def-indepsetsavoiding` -> `def-indepsetcount`
- `def-indepsetcount` -> `def-forwarddifferencedel`
- `def-forwarddifferencedel` -> `def-crossingindex`
- `def-indepnum` -> `def-crossingindex`
- `def-c4la1-vertexdeletionindepsetcount` -> `def-c4la1-vertexdeletionforwarddifference`
- `def-c4la1-vertexdeletionforwarddifference` -> `def-c4la1-isfavorableat`
- `def-c4la1-isgraphleaf` -> `def-c5la1-leafset`
- `def-c5la1-leafset` -> `def-c5la1-leafdegree`
- `def-c5la1-support` -> `def-c5la1-leafdegree`
- `def-c5la1-support` -> `def-c5la1-h`
- `def-c5la1-support` -> `def-c5la1-r`
- `def-c5la1-leafset` -> `def-c5la1-aggregate`
- `def-c4la1-isfavorableat` -> `def-c5la1-aggregate`
- `def-forwarddifferencedel` -> `def-c5la1-aggregate`
- `def-c5la1-h` -> `def-c5la1-aggregate`
- `def-c5la1-r` -> `def-c5la1-aggregate`
- `def-erdos993g1-indepcount` -> `def-erdos993g1-coeff`
- `def-erdos993g1-coeff` -> `def-erdos993g1-delta`
- `domain-vertex-type` -> `domain-graph`
- `def-istree` -> `hyp-tree`
- `domain-graph` -> `hyp-tree`
- `def-crossingindex` -> `hyp-interior`
- `def-indepnum` -> `hyp-interior`
- `domain-graph` -> `hyp-interior`
- `hyp-tree` -> `conclusion`
- `hyp-interior` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-base-candidate`: `SOURCE/ADJ-U-awards-LA3-Main.lean` (match)
- `src-brief`: `SOURCE/C1-STAGE7-FORMALIZER-BRIEF-LA3.md` (match)
- `src-capsule-manifest`: `SOURCE/C1-LA3-PACKET-MANIFEST.json` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-first-interior-main`: `SOURCE/first-interior-c2-primary-v2-Main.lean` (match)
- `src-first-interior-state`: `SOURCE/first-interior-c2-primary-v2-FORMALIZATION-STATE.json` (match)
- `src-fragment-01`: `LeanProject/LeanProof/Snippets/0001-definition-C4LA1-vertexDeletionIndepSetCount.lean.fragment` (match)
- `src-fragment-02`: `LeanProject/LeanProof/Snippets/0002-definition-C4LA1-vertexDeletionForwardDifference.lean.fragment` (match)
- `src-fragment-03`: `LeanProject/LeanProof/Snippets/0003-definition-C4LA1-IsFavorableAt.lean.fragment` (match)
- `src-fragment-04`: `LeanProject/LeanProof/Snippets/0004-definition-C4LA1-IsGraphLeaf.lean.fragment` (match)
- `src-fragment-05`: `LeanProject/LeanProof/Snippets/0005-definition-C5LA1-support.lean.fragment` (match)
- `src-fragment-06`: `LeanProject/LeanProof/Snippets/0006-definition-C5LA1-leafSet.lean.fragment` (match)
- `src-fragment-07`: `LeanProject/LeanProof/Snippets/0007-definition-C5LA1-leafDegree.lean.fragment` (match)
- `src-fragment-08`: `LeanProject/LeanProof/Snippets/0008-definition-C5LA1-H.lean.fragment` (match)
- `src-fragment-09`: `LeanProject/LeanProof/Snippets/0009-definition-C5LA1-R.lean.fragment` (match)
- `src-fragment-10`: `LeanProject/LeanProof/Snippets/0010-definition-C5LA1-indepSetsAvoiding.lean.fragment` (match)
- `src-fragment-11`: `LeanProject/LeanProof/Snippets/0011-definition-C5LA1-indepSetCount.lean.fragment` (match)
- `src-fragment-12`: `LeanProject/LeanProof/Snippets/0012-definition-C5LA1-forwardDifferenceDel.lean.fragment` (match)
- `src-fragment-13`: `LeanProject/LeanProof/Snippets/0013-definition-C5LA1-aggregate.lean.fragment` (match)
- `src-fragment-14`: `LeanProject/LeanProof/Snippets/0014-definition-C5LA1-crossingIndex.lean.fragment` (match)
- `src-fragment-15`: `LeanProject/LeanProof/Snippets/0015-definition-Erdos993G1-indepCount.lean.fragment` (match)
- `src-fragment-16`: `LeanProject/LeanProof/Snippets/0016-definition-Erdos993G1-coeff.lean.fragment` (match)
- `src-fragment-17`: `LeanProject/LeanProof/Snippets/0017-definition-Erdos993G1-delta.lean.fragment` (match)
- `src-fragment-18`: `LeanProject/LeanProof/Snippets/0018-lemma-Erdos993G1-indepCount_eq_card_indepSetFinset.lean.fragment` (match)
- `src-fragment-19`: `LeanProject/LeanProof/Snippets/0019-lemma-Erdos993G1-coeff_nat.lean.fragment` (match)
- `src-fragment-20`: `LeanProject/LeanProof/Snippets/0020-lemma-Erdos993G1-delta_nat.lean.fragment` (match)
- `src-fragment-21`: `LeanProject/LeanProof/Snippets/0021-lemma-Erdos993G1-isNIndepSet_pair_iff.lean.fragment` (match)
- `src-fragment-22`: `LeanProject/LeanProof/Snippets/0022-lemma-Erdos993G1-sym2_toFinset_injective.lean.fragment` (match)
- `src-fragment-23`: `LeanProject/LeanProof/Snippets/0023-lemma-Erdos993G1-indepSetFinset_two_eq.lean.fragment` (match)
- `src-fragment-24`: `LeanProject/LeanProof/Snippets/0024-lemma-Erdos993G1-indepCount_two_add_edges.lean.fragment` (match)
- `src-fragment-25`: `LeanProject/LeanProof/Snippets/0025-lemma-Erdos993G1-indepSetFinset_eq_filter_powersetCard.lean.fragment` (match)
- `src-fragment-26`: `LeanProject/LeanProof/Snippets/0026-lemma-Erdos993G1-card_nonindep_pairs.lean.fragment` (match)
- `src-fragment-27`: `LeanProject/LeanProof/Snippets/0027-lemma-Erdos993G1-sum_card_filter_swap.lean.fragment` (match)
- `src-fragment-28`: `LeanProject/LeanProof/Snippets/0028-lemma-Erdos993G1-sum_nonindep_pair_incidence.lean.fragment` (match)
- `src-fragment-29`: `LeanProject/LeanProof/Snippets/0029-lemma-Erdos993G1-sum_indep_indicator.lean.fragment` (match)
- `src-fragment-30`: `LeanProject/LeanProof/Snippets/0030-lemma-Erdos993G1-triple_local_identity.lean.fragment` (match)
- `src-fragment-31`: `LeanProject/LeanProof/Snippets/0031-lemma-Erdos993G1-indepSetFinset_three_incidence.lean.fragment` (match)
- `src-fragment-32`: `LeanProject/LeanProof/Snippets/0032-lemma-Erdos993G1-sum_triple_centered_neighbor_pairs.lean.fragment` (match)
- `src-fragment-33`: `LeanProject/LeanProof/Snippets/0033-lemma-Erdos993G1-indepCount_three_add_edge_incidence.lean.fragment` (match)
- `src-fragment-34`: `LeanProject/LeanProof/Snippets/0034-lemma-Erdos993G1-forest_card_edges_add_components.lean.fragment` (match)
- `src-fragment-35`: `LeanProject/LeanProof/Snippets/0035-lemma-Erdos993G1-components_card_pos_of_card_pos.lean.fragment` (match)
- `src-fragment-36`: `LeanProject/LeanProof/Snippets/0036-lemma-Erdos993G1-degreeDefect_nonneg.lean.fragment` (match)
- `src-fragment-37`: `LeanProject/LeanProof/Snippets/0037-lemma-Erdos993G1-degreeChoose_sum_lower.lean.fragment` (match)
- `src-fragment-38`: `LeanProject/LeanProof/Snippets/0038-lemma-Erdos993G1-scaledChooseTwo.lean.fragment` (match)
- `src-fragment-39`: `LeanProject/LeanProof/Snippets/0039-lemma-Erdos993G1-scaledChooseThree.lean.fragment` (match)
- `src-fragment-40`: `LeanProject/LeanProof/Snippets/0040-lemma-E993Interior-eligibleAlphaGeSeven.lean.fragment` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-semantic-contract`: `SOURCE/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract`: `SOURCE/SOLUTION-CONTRACT.md` (match)
- `src-synthesis`: `SOURCE/SYNTHESIS.md` (match)

## Validation Notes

- Errors: none
- Warnings: `formulation_truth_unverified`
