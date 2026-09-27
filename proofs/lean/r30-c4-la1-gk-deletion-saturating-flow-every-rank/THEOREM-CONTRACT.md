# Theorem Contract: C4-LA1: G_k deletion-arc saturating flow at every rank p >= k + 3 for every leaf tag set

- Contract ID: `erdos-993-math-dre-20260926-r30-weighted-transport-c4-la1-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `4b71b7ca9271ea04ad461331d558f0f1b3b52c092d5b8d521d54fa29b65e3c79`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Canonical run id erdos-993-math-dre-20260926-r30-weighted-transport; award group C4-LA1 (Cycle 4 Stage 7, bounded attempt); key on closure E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET, formally_verified at the terminal theorem's EXACT scope. Statement: let G_k be the graph on Fin (3k+5) with root 0, leaf 1 on 0, support 2 on 0 with leaves 3 and 4, and for i < k the arm 0 - (5+3i) - (6+3i) - (7+3i). For all natural k and p with k + 3 <= p and every set F of leaves of G_k (F a subset of C5LA1.leafSet (gkGraph k)), the transport network at rank p with tag set F (sources the independent (p+1)-sets, targets the independent p-sets, supplies and capacities the active-tag weight activeWeight) has a saturating integral (natural-number) flow f (IsSaturatingFlow: positive only on (p+1)-set/p-set pairs related by transportRel; every source row sums EXACTLY to its active weight; every target column sums to AT MOST its active weight) whose support consists of single deletions only: f B A > 0 implies A = B.erase q for some q in B. No IsTree, no eligibility, no crossing index, no quotient hypothesis. Proof of record: Theorem CT-1 (critic C-F2-T) with the rank extension R2' (F adjudicator), steps (0)-(4), INFORMAL-PROOF.md. Companions on the face (Lean lemmas gk_weightedHall_of_rank_ge and gk_aggregate_nonpos_of_rank_ge, and every helper of the DAG) are kernel-checked declarations of this source that carry no certificate of their own (R29-N-12); this contract asserts no grade for any companion. Grades are the contract's own list only: the terminal theorem, formally_verified only when the governed award closes (kernel receipt + independent informal audit + independent fidelity review). Fences: one explicit tree family; not (HALL) at any other scope (the (HALL) scope clause EST-3 stays an informal composition with the registered eligibility key at proved_informal); no IsTree, eligibility, crossingIndex or indepNum is asserted; 'every eligible rank of G_k' is NOT claimed (needs x(G_k) >= k+1, open); nothing on the primary aggregate beyond G_k; no RTree statement; nothing about switch arcs elsewhere; not E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY (a matching is not linear injectivity), not E993-R23-LITERAL-DELETE-ONLY-HALL, not C6-F4, not R19; GK-SIGN is not formally verified by this award. Repairs on the face: C-F2-T's x = k+1 (valid for k >= 2 only) is NOT used; the F draft's instance comment is an authored instance (gkGraph_decAdj, registered as @[reducible, instance] def). Attribution: the network, the active-tag weight and (HALL): Codex GPT-6 (the lower-region run and its corrections); the definition entries 1-13: the first-interior run (Codex) with the r26/r24/r25 definition layers; the transport definitions and (WID): r30 C1-LA1; FLOW=>SIGN: r30 C1-LA2; the G_k family and its eligibility key: r30 Cycles 2-3; CT-1: critic C-F2-T (r30 Cycle 4; Claude Opus 5.5); R2' (the rank extension): the r30 Cycle 4 F adjudicator (Claude Opus 5.5); the bounded G_k Hall record: F2 (Claude Sonnet 5), C-F2-U, the controller replay CF6-1, and the synthesis instrument; r29's high-tail certificates are not used. Lean text of every new declaration: the C4-LA1 formalizer (producer c4-la1-formalizer-opus-20260927, chartered Claude Opus 5.5).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993Transport.gk_deletionSaturatingFlow_of_rank_ge`
- Statement SHA-256: `9f6fc96e436ebabd03ea51a20746b06783bd0c7223a231aa03503b138ecb404e`

```lean
theorem gk_deletionSaturatingFlow_of_rank_ge (k p : ℕ) (hp : k + 3 ≤ p)
    (F : Finset (Fin (3*k+5))) (hF : F ⊆ C5LA1.leafSet (gkGraph k)) :
    ∃ f : Finset (Fin (3*k+5)) → Finset (Fin (3*k+5)) → ℕ,
      IsSaturatingFlow (gkGraph k) F p f ∧ ∀ B A, 0 < f B A → ∃ q ∈ B, A = B.erase q
```

## Quantifiers

- `forall k` over `dom-k`
- `forall p` over `dom-p`
- `forall F` over `dom-f`
- `exists f` over `dom-flow`

## Hypotheses

- `hyp-rank`: hp : k + 3 ≤ p (natural numbers; no subtraction)
- `hyp-leaves`: hF : F ⊆ C5LA1.leafSet (gkGraph k) (every tag is an original leaf of G_k; any such F, not only favorableLeaves)

## Conclusion

- `conclusion`: ∃ f : Finset (Fin (3*k+5)) → Finset (Fin (3*k+5)) → ℕ, IsSaturatingFlow (gkGraph k) F p f ∧ ∀ B A, 0 < f B A → ∃ q ∈ B, A = B.erase q  (the instance on (gkGraph k).Adj is gkGraph_decAdj; support conjunct is exactly single deletion)

## Dependencies

- `def-gk-edge` -> `def-gk-graph`
- `def-gk-graph` -> `def-gk-graph-dec-adj`
- `def-is-graph-leaf` -> `def-support`
- `def-is-graph-leaf` -> `def-leaf-set`
- `def-support` -> `def-tag-witnesses`
- `def-tag-witnesses` -> `def-active-weight`
- `def-indep-family` -> `def-is-saturating-flow`
- `def-active-weight` -> `def-is-saturating-flow`
- `def-transport-rel` -> `def-is-saturating-flow`
- `dom-k` -> `dom-f`
- `dom-k` -> `dom-flow`
- `dom-k` -> `hyp-rank`
- `dom-p` -> `hyp-rank`
- `dom-f` -> `hyp-leaves`
- `def-leaf-set` -> `hyp-leaves`
- `def-gk-graph` -> `hyp-leaves`
- `hyp-rank` -> `conclusion`
- `hyp-leaves` -> `conclusion`
- `dom-flow` -> `conclusion`
- `def-is-saturating-flow` -> `conclusion`
- `def-gk-graph-dec-adj` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-brief`: `SOURCE/C4-STAGE7-FORMALIZER-BRIEF-LA1.md` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-carried-001`: `LeanProject/LeanProof/Snippets/0001-definition-C4LA1-vertexDeletionIndepSetCount.lean.fragment` (match)
- `src-carried-002`: `LeanProject/LeanProof/Snippets/0002-definition-C4LA1-vertexDeletionForwardDifference.lean.fragment` (match)
- `src-carried-003`: `LeanProject/LeanProof/Snippets/0003-definition-C4LA1-IsFavorableAt.lean.fragment` (match)
- `src-carried-004`: `LeanProject/LeanProof/Snippets/0004-definition-C4LA1-IsGraphLeaf.lean.fragment` (match)
- `src-carried-005`: `LeanProject/LeanProof/Snippets/0005-definition-C5LA1-support.lean.fragment` (match)
- `src-carried-006`: `LeanProject/LeanProof/Snippets/0006-definition-C5LA1-leafSet.lean.fragment` (match)
- `src-carried-007`: `LeanProject/LeanProof/Snippets/0007-definition-C5LA1-H.lean.fragment` (match)
- `src-carried-008`: `LeanProject/LeanProof/Snippets/0008-definition-C5LA1-R.lean.fragment` (match)
- `src-carried-009`: `LeanProject/LeanProof/Snippets/0009-definition-C5LA1-indepSetsAvoiding.lean.fragment` (match)
- `src-carried-010`: `LeanProject/LeanProof/Snippets/0010-definition-C5LA1-indepSetCount.lean.fragment` (match)
- `src-carried-011`: `LeanProject/LeanProof/Snippets/0011-definition-C5LA1-forwardDifferenceDel.lean.fragment` (match)
- `src-carried-012`: `LeanProject/LeanProof/Snippets/0012-definition-C5LA1-aggregate.lean.fragment` (match)
- `src-carried-013`: `LeanProject/LeanProof/Snippets/0013-definition-E993Interior-taggedFamily.lean.fragment` (match)
- `src-carried-014`: `LeanProject/LeanProof/Snippets/0014-definition-E993Transport-indepFamily.lean.fragment` (match)
- `src-carried-015`: `LeanProject/LeanProof/Snippets/0015-definition-E993Transport-tagWitnesses.lean.fragment` (match)
- `src-carried-016`: `LeanProject/LeanProof/Snippets/0016-definition-E993Transport-activeWeight.lean.fragment` (match)
- `src-carried-017`: `LeanProject/LeanProof/Snippets/0017-definition-E993Transport-layerWeight.lean.fragment` (match)
- `src-carried-018`: `LeanProject/LeanProof/Snippets/0018-definition-E993Transport-favorableLeaves.lean.fragment` (match)
- `src-carried-019`: `LeanProject/LeanProof/Snippets/0019-definition-E993Transport-transportRel.lean.fragment` (match)
- `src-carried-020`: `LeanProject/LeanProof/Snippets/0020-definition-E993Transport-IsSaturatingFlow.lean.fragment` (match)
- `src-carried-021`: `LeanProject/LeanProof/Snippets/0021-definition-E993Transport-WeightedHall.lean.fragment` (match)
- `src-carried-045`: `LeanProject/LeanProof/Snippets/0045-lemma-E993Interior-highTailAggregateFromShadow.lean.fragment` (match)
- `src-carried-046`: `LeanProject/LeanProof/Snippets/0046-lemma-E993Transport-indepFamily_eq_indepSetsAvoiding.lean.fragment` (match)
- `src-carried-047`: `LeanProject/LeanProof/Snippets/0047-lemma-E993Transport-isGraphLeaf_of_mem_favorableLeaves.lean.fragment` (match)
- `src-carried-048`: `LeanProject/LeanProof/Snippets/0048-lemma-E993Transport-tagWitnesses_subset_R.lean.fragment` (match)
- `src-carried-049`: `LeanProject/LeanProof/Snippets/0049-lemma-E993Transport-card_active_eq_tagged.lean.fragment` (match)
- `src-carried-050`: `LeanProject/LeanProof/Snippets/0050-lemma-E993Transport-layerWeight_eq_sum_card.lean.fragment` (match)
- `src-carried-051`: `LeanProject/LeanProof/Snippets/0051-lemma-E993Transport-layerWeight_sub_eq_sum.lean.fragment` (match)
- `src-carried-052`: `LeanProject/LeanProof/Snippets/0052-lemma-E993Transport-activeWeightAggregateIdentity.lean.fragment` (match)
- `src-carried-053`: `LeanProject/LeanProof/Snippets/0053-lemma-E993Transport-aggregate_nonpos_of_saturatingFlow.lean.fragment` (match)
- `src-carried-054`: `LeanProject/LeanProof/Snippets/0054-lemma-E993Transport-weightedHall_of_saturatingFlow.lean.fragment` (match)
- `src-ct1-critique`: `SOURCE/C-F2-T-CRITIQUE.md` (match)
- `src-f-adjudication`: `SOURCE/F-ADJUDICATION.md` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-semantic-contract`: `SOURCE/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract`: `SOURCE/SOLUTION-CONTRACT.md` (match)
- `src-synthesis`: `SOURCE/C4-SYNTHESIS.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
